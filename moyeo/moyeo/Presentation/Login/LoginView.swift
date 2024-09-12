//
//  LoginView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @Binding private(set) var tempIsLoginComplete: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                MainLogo()
                    .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 80))
                Spacer()
                AppleSignUpButton(tempIsLoginComplete: $tempIsLoginComplete)
                    .padding(.bottom, 40)
            }    
        }
    }
}

// MARK: - 메인 로고
private struct MainLogo: View {
    var body: some View {
        Image(.imgMoyeo)
            .resizable()
            .scaledToFit()
        Spacer()
            .frame(height: 10)
        Image(.imgSloganEng)
            .resizable()
            .scaledToFit()
    }
}

// MARK: - 애플 로그인
private struct AppleSignUpButton: View {
    @Binding private(set) var tempIsLoginComplete: Bool
    
    var body: some View {
        SignInWithAppleButton(
            .signUp,
            onRequest: { _ in
            },
            onCompletion: { result in
                // TODO: 임시 코드 추후 수정 예정 -> UseCase의 함수로 대체
                var loginResult: Result<Bool, Error> = .success(tempIsLoginComplete)
                
                switch loginResult {
                case .success:
                    print("로그인 성공")
                    tempIsLoginComplete.toggle()
                    
                case .failure(let error):
                    print("로그인 실패 \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.black)
        .frame(height: 54)
        .cornerRadius(8)
        .padding(.horizontal, 18)
    }
}

#Preview {
    LoginView(tempIsLoginComplete: .constant(false))
}
