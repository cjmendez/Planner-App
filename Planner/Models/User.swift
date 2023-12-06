//
//  User.swift
//  Planner
//
//  Created by csuftitan on 11/6/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
