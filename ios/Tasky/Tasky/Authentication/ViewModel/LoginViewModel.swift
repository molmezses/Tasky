//
//  LoginViewModel.swift
//  Tasky
//
//  Created by Mustafa Ölmezses on 14.11.2025.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAnimation: Bool = false
    @Published var scale: CGFloat = 0.1
    
    func yazdir(){
        print(email)
        print(password)
        print("Conflict?")
    }
}
