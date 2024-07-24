//
//  User.swift
//  GymWeight
//
//  Created by Ramon Xavier on 23/07/24.
//

import Foundation


struct User: Identifiable {
  var id = UUID()
  var fullName: String


  var profileImageName: String {
    fullName.lowercased().replacingOccurrences(of: " ", with: "-")
  }
}


extension User {
  static var samples: [User] = [
    .init(fullName: "Ramon Xavier"),
  ]


  static var sample = samples[0]
}
