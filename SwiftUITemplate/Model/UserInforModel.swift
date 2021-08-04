//
//  LoginInfor.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//

import Foundation

struct UserInforModel: Codable {
    var token: String?
    var profile: ProfileUserModel?
}

struct ProfileUserModel: Encodable, Decodable {
    var id : Int?
    var username: String?
    var nickname : String?
    var avatar : String?
    var avatarThumb : String?
    var age : Int?
    var gender : Int?
    var totalComment : Int?
    var province : ProvinceModel?
    var introduction : String?
    var likeNumber : Int?
    var certificate : [CertificateUserModel]?
    var isGoldMember : Bool?
    var status : Int?
    var createdAt : String?
}

struct ProvinceModel: Codable {
    var id : Int
    var name : String
    var region: String?

}

struct CertificateUserModel: Codable {
    var id: Int
    var name: String
}
