//
//  RegisterView.swift
//  Tasky
//
//  Created by Mustafa Ölmezses on 15.11.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
    @FocusState var focusedField : Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 0){
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .scaleEffect(viewModel.scale)
                        .onAppear {
                            withAnimation(.easeOut(duration: 0.6)) {
                                viewModel.scale = 1.0
                            }
                        }
                    
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.rounded)
                }
                
                VStack {
                    Text("Ad Soyad")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.leading)
                    
                    TextField("Adınız ve Soyadınız", text: $viewModel.name)
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
                        .offset(y: viewModel.showAnimation ? 0 : 60)
                        .opacity(viewModel.showAnimation ? 1 : 0)
                        .animation(.spring(response: 0.5 , dampingFraction: 0.6), value: viewModel.showAnimation)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                viewModel.showAnimation = true
                            }
                        }
                    
                }
                .padding(.top)
                
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
                        .offset(y: viewModel.showAnimation ? 0 : 60)
                        .opacity(viewModel.showAnimation ? 1 : 0)
                        .animation(.spring(response: 0.6 , dampingFraction: 0.6), value: viewModel.showAnimation)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                viewModel.showAnimation = true
                            }
                        }
                    
                }
                .padding(.top)
                
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
                        .offset(y: viewModel.showAnimation ? 0 : 60)
                        .opacity(viewModel.showAnimation ? 1 : 0)
                        .animation(.spring(response: 0.7 , dampingFraction: 0.6), value: viewModel.showAnimation)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                viewModel.showAnimation = true
                            }
                        }
                    
                    
                }
                .padding(.top)
                
                
                VStack {
                    Text("Şifrenizi tekrar giriniz")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.leading)
                    
                    SecureFieldWithButton(title: "Şifrenizi tekrar giriniz..", text: $viewModel.passwordConfirm)
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
                        .offset(y: viewModel.showAnimation ? 0 : 60)
                        .opacity(viewModel.showAnimation ? 1 : 0)
                        .animation(.spring(response: 0.8 , dampingFraction: 0.6), value: viewModel.showAnimation)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                viewModel.showAnimation = true
                            }
                        }

                }
                .padding(.top)
                
                Button {
                    
                } label: {
                    Text("Kayıt Ol")
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
                    Text("Zaten bir hesabın var mı?")
                    Button {
                        dismiss()
                    } label: {
                        Text("Giriş Yap")
                            .foregroundStyle(Color("logoBlue"))
                            .underline()
                    }
                    .offset(y: viewModel.showAnimation ? 0 : 60)
                    .opacity(viewModel.showAnimation ? 1 : 0)
                    .animation(.spring(response: 1.0 , dampingFraction: 0.6), value: viewModel.showAnimation)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            viewModel.showAnimation = true
                        }
                    }
                    
                }
                .padding(.top)
                
                
                
                Spacer()
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

#Preview {
    RegisterView()
}
