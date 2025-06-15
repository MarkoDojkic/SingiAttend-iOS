//
//  Untitled.swift
//  SingiAttend
//
//  Created by Марко Дојкић on 7. 6. 2025..
//  Copyright © 2025 Марко Дојкић. All rights reserved.
//

import Foundation

struct CsrfSession {
    var csrfHeaderName: String
    var csrfTokenSecret: String
    var xsrfToken: String
    var jsessionId: String
}

class CsrfTokenManager {
    static let shared = CsrfTokenManager()

    private(set) var sessionData = CsrfSession(csrfHeaderName: "", csrfTokenSecret: "", xsrfToken: "", jsessionId: "")
    var proxyIdentifier = ""
    private let serverUrl = Bundle.main.infoDictionary!["ServerURL"] as! String
    private let username = Bundle.main.infoDictionary!["ServerUsername"] as! String
    private let password = Bundle.main.infoDictionary!["ServerPassword"] as! String

    private var credentialsBase64: String {
        let loginString = "\(username):\(password)"
        return Data(loginString.utf8).base64EncodedString()
    }

    func fetchCsrfSession(completion: @escaping (Bool) -> Void) {
        var request = URLRequest(url: URL(string: "\(serverUrl)/api/csrfLogin")!)
        request.httpMethod = "GET"
        request.setValue("Basic \(credentialsBase64)", forHTTPHeaderField: "Authorization")
        request.setValue(proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")

        let session = URLSession(configuration: .default)

        session.dataTask(with: request) { data, response, error in
            guard
                let url = request.url,
                let cookies = HTTPCookieStorage.shared.cookies(for: url),
                let csrfHeaderEntry = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: String]
            else {
                completion(false)
                return
            }

            let xsrf = cookies.first(where: { $0.name == "XSRF-TOKEN" })?.value
            let jsession = cookies.first(where: { $0.name == "JSESSIONID" })?.value
            
            guard
                let xsrfToken = xsrf,
                let jsessionId = jsession,
                let csrfHeaderName = csrfHeaderEntry["headerName"],
                let csrfTokenSecret = csrfHeaderEntry["token"]
            else {
                completion(false)
                return
            }

            self.sessionData = CsrfSession(
                csrfHeaderName: csrfHeaderName,
                csrfTokenSecret: csrfTokenSecret,
                xsrfToken: xsrfToken,
                jsessionId: jsessionId
            )

            completion(true)
        }.resume()
    }

    func logoutFromCsrfSession() {
        var request = URLRequest(url: URL(string: "\(serverUrl)/api/csrfLogout")!)
        request.httpMethod = "GET"
        request.setValue("Basic \(credentialsBase64)", forHTTPHeaderField: "Authorization")
        request.setValue(proxyIdentifier, forHTTPHeaderField: "X-Tenant-ID")
        request.setValue(sessionData.csrfTokenSecret, forHTTPHeaderField: sessionData.csrfHeaderName)
        request.setValue("JSESSIONID=\(sessionData.jsessionId); XSRF-TOKEN=\(sessionData.xsrfToken)", forHTTPHeaderField: "Cookie")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            if httpResponse.statusCode == 200 {
                self.proxyIdentifier = ""
                self.sessionData = CsrfSession(csrfHeaderName: "", csrfTokenSecret: "", xsrfToken: "", jsessionId: "")
            }
        }.resume()
    }
}
