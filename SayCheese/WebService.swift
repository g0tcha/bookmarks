//
//  Webservice.swift
//  SayCheese
//
//  Created by vincent on 01/12/2016.
//  Copyright © 2016 kodappy. All rights reserved.
//

import Foundation

// -- 
// -- Webservice class that manage all webservice calls.
// --
class WebService: NSObject {
    
    struct httpMethods {
        static let get = "get"
        static let post = "post"
    }
    
    var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
    }
    
    // MARK: - User
    func createUser(fullName: String, userName: String, email: String, password: String, completionHandler: @escaping (_ success: Bool, _ error: WebServiceError?) -> Void) {
        guard let url = NSURL(string: WebServiceURL.User.create) else {
            completionHandler(false, WebServiceError.cannotCreateURL)
            return
        }
        
        // Hash password.
        let hashedPassword = password.sha1()
        
        let bodyDict = ["fullName": fullName, "userName": userName, "email": email, "password": hashedPassword]
        
        let bodyJson: Data?
        do {
            bodyJson = try JSONSerialization.data(withJSONObject: bodyDict, options: .prettyPrinted)
        } catch {
            print("Error: Unable to serialize JSON.")
            completionHandler(false, WebServiceError.jsonCreation)
            return
        }
        
        guard let json = bodyJson else {
            completionHandler(false, WebServiceError.jsonCreation)
            return
        }
        
        let request = NSMutableURLRequest(url: url as URL)
        request.httpBody = json
        request.httpMethod = httpMethods.post
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error while creating user. \(error.localizedDescription)")
                completionHandler(false, WebServiceError.networkError)
                return
            }
            
            if let data = data {
                do {
                    if let responseDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                        print(responseDict)
                        if let statusCode = responseDict["statusCode"] as? Int {
                            switch statusCode {
                            case 1000:
                                // Store user credentials.
                                if let userInfo = responseDict["user"] as? [String: Any] {
                                    if let objectID = User.extractAndSaveUser(fromJSON: userInfo, withPassword: hashedPassword) {
                                        User.saveLogged(objectID: objectID)
                                        completionHandler(true, nil)
                                        return
                                    }
                                }
                                
                                completionHandler(true, nil)
                            case 1001:
                                completionHandler(false, WebServiceError.userAlreadyExists)
                            case 1002:
                                completionHandler(false, WebServiceError.networkError)
                            default:
                                completionHandler(false, WebServiceError.loginBadCredentials)
                            }
                        }
                    }
                } catch {
                    print("Error: Unable to parse JSON response.")
                    completionHandler(false, WebServiceError.jsonResponseParsing)
                    return
                }
            } else {
                completionHandler(false, WebServiceError.networkError)
            }
        })
        
        dataTask?.resume()
    }
    
    func login(username: String, password: String, hashPassword: Bool, completionHandler:@escaping (_ success: Bool, _ error: WebServiceError?) -> Void) {
        guard let url = NSURL(string: WebServiceURL.User.login) else {
            completionHandler(false, WebServiceError.cannotCreateURL)
            return
        }
        
        // Hash password.
        var finalPassword: String!
        if hashPassword {
            finalPassword = password.sha1()
        } else {
            finalPassword = password
        }
        
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = httpMethods.get
        request.addValue(username, forHTTPHeaderField: "username")
        request.addValue(finalPassword, forHTTPHeaderField: "password")
        
        dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            if let _ = error {
                completionHandler(false, WebServiceError.networkError)
                return
            }
            
            if let data = data {
                do {
                    if let responseDict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                        if let statusCode = responseDict["statusCode"] as? Int {
                            switch statusCode {
                            case 1000:
                                // Store user credentials.
                                if let userInfo = responseDict["user"] as? [String: Any] {
                                    if let objectID = User.extractAndSaveUser(fromJSON: userInfo, withPassword: finalPassword) {
                                        User.saveLogged(objectID: objectID)
                                        completionHandler(true, nil)
                                        return
                                    }
                                }
                                
                                completionHandler(false, WebServiceError.jsonResponseParsing)
                            case 1001:
                                completionHandler(false, WebServiceError.networkError)
                            case 1002:
                                completionHandler(false, WebServiceError.networkError)
                            default:
                                completionHandler(false, WebServiceError.networkError)
                            }
                        }
                    }
                } catch {
                    completionHandler(false, WebServiceError.jsonResponseParsing)
                    return
                }
            } else {
                completionHandler(false, WebServiceError.networkError)
            }
        })
        
        dataTask?.resume()
    }
    
    func getUserPosts() {
        
    }
    
    // MARK: - Posts
    func createPost() {
        
    }
    
    func deletePost() {
        
    }
    
    func createComment() {
        
    }
    
    func deleteComment() {
        
    }
    
    // MARK: - Helpers
    func stopTask() {
        if let dataTask = dataTask {
                dataTask.cancel()
        }
    }
}
