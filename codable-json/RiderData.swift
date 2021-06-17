//
//  RiderData.swift
//  codable-json
//
//  Created by Kyle Hilla on 5/13/21.
//

import Foundation

let json = """
  {
      "riders":
      [
          {
          "type": "Adult",
          "fares": [
              { "description": "2.5 Hour Ticket", "price": 2.5 },
              { "description": "1 Day Pass", "price": 5.0 },
              { "description": "30 Day Pass", "price": 100.0 }
          ],
          "subtext": null
          },
          {
          "type": "Child",
          "fares": [
              { "description": "2.5 Hour Ticket", "price": 1.5 },
              { "description": "1 Day Pass", "price": 2.0 },
              { "description": "30 Day Pass", "price": 40.0 }
          ],
          "subtext": "Ages 8-17"
          },
          {
          "type": "Senior",
          "fares": [
              { "description": "2.5 Hour Ticket", "price": 1.0 },
              { "description": "1 Day Pass", "price": 2.0 },
              { "description": "30 Day Pass", "price": 40.0 }
          ],
          "subtext": "Ages 60+"
          }
      ]
  }
  """

struct RiderList: Codable {
    let riders: [Rider]
}

struct Rider: Codable {
    let type: String
    let fares: [Fare]
    let subtext: String?
}

struct Fare: Codable {
    let description: String
    let price: Double
}
