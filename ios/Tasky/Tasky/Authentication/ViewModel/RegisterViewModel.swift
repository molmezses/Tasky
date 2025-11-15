//
//  RegisterViewModel.swift
//  Tasky
//
//  Created by Mustafa Ölmezses on 15.11.2025.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    @Published var showAnimation: Bool = false
    @Published var scale: CGFloat = 0.1
    
}
