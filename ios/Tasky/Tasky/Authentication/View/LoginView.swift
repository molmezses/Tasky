//
//  LoginView.swift
//  Tasky
//
//  Created by Mustafa Ölmezses on 14.11.2025.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @FocusState var focusedField: Bool
    @Environment(\.colorScheme) var colorScheme
    

    var body: some View {
        NavigationStack{
            VStack {
                ScrollView {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160)
                        .scaleEffect(viewModel.scale)
                        .onAppear{
                            withAnimation(.easeOut(duration: 0.6)) {
                                viewModel.scale = 1.0
                            }
                        }
                    
                    Spacer()
                    Text("Giriş Yap")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.rounded)
                    
                    
                    VStack {
                        Text("Email")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.leading)
                        
                        TextField("Email adresinizi giriniz..", text: $viewModel.email)
                            .padding()
                            .background(Color.gray.opacity(colorScheme == .light ? 0.1 : 0.2))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            .focused($focusedField)
                    }
                    .padding(.top)
                    .offset(y: viewModel.showAnimation ? 0 : 60)
                    .opacity(viewModel.showAnimation ? 1 : 0)
                    .animation(.spring(response: 0.5 , dampingFraction: 0.6), value: viewModel.showAnimation)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            viewModel.showAnimation = true
                        }
                    }
                    
                    
                    VStack {
                        Text("Şifre")
                            .frame(maxWidth: .infinity , alignment: .leading)
                            .padding(.leading)
                        
                        SecureFieldWithButton(title: "Şifrenizi giriniz..", text: $viewModel.password)
                            .padding()
                            .background(Color.gray.opacity(colorScheme == .light ? 0.1 : 0.2))
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .padding(.horizontal)
                            .autocapitalization(.none)
                            .textInputAutocapitalization(.never)
                            .focused($focusedField)
                        
                        
                    }
                    .padding(.vertical , 12)
                    .offset(y: viewModel.showAnimation ? 0 : 60)
                    .opacity(viewModel.showAnimation ? 1 : 0)
                    .animation(.spring(response: 0.8 , dampingFraction: 0.6), value: viewModel.showAnimation)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            viewModel.showAnimation = true
                        }
                    }
                    
                    Text("Şifremi unuttum?")
                        .frame(maxWidth: .infinity , alignment: .trailing)
                        .padding(.trailing)
                        .foregroundStyle(Color("logoBlue"))
                        .font(.footnote)
                        .padding(.vertical , 6)
                    
                    Button {
                        
                    } label: {
                        Text("Giriş Yap")
                            .frame(maxWidth: .infinity , alignment: .center)
                            .foregroundStyle(.white)
                        
                    }
                    .padding()
                    .background(Color("logoBlue"))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    HStack(spacing: 2){
                        Text("Hesabın yok mu? ")
                        NavigationLink {
                            RegisterView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Kayıt ol")
                                .foregroundStyle(Color("logoBlue"))
                                .underline()
                        }
                        
                        
                    }
                    .padding(.top)
                    
                    
                    
                    
                    Spacer()
                    
                }
                .offset(y: viewModel.showAnimation ? 0 : 60)
                .opacity(viewModel.showAnimation ? 1 : 0)
                .animation(.spring(response: 0.3 , dampingFraction: 0.6), value: viewModel.showAnimation)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                        viewModel.showAnimation = true
                    }
                }
                
            }
            .onTapGesture {
                focusedField = false
            }
        }
    }
}

#Preview {
    LoginView()
}
