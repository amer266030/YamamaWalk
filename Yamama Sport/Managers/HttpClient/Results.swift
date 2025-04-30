//
//  Results.swift
//  Yamama Sport
//
//  Created by Amer Alyusuf on 27/04/2025.
//

import Foundation

struct Results<dataT: Decodable>: Decodable {
    var status: String?
    var message: String?
    var errors: String?
    var data: dataT?
}
