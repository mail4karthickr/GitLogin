//
//  GitHubConstants.swift
//  GithubLogin
//
//  Created by Karthick Ramasamy on 26/02/22.
//

import Foundation

public struct Constants {
    public static let CLIENT_ID = "71e367625b34650a6bf1"
    public static let CLIENT_SECRET = "d0941336c560b0191ea32c4a1075cf5789da1a4c"
    public static let REDIRECT_URI = "it.iacopo.github://authentication"
    public static let SCOPE = "read:user,user:email"
    public static let TOKENURL = "https://github.com/login/oauth/access_token"
}
