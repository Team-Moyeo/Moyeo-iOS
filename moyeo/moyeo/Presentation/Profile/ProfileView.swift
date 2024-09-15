//
//  ProfileView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/13/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfileImage()
            List {
                PersonalInfomation()
                AccountSetting()
            }
            .font(.Body.body3)
            .listStyle(.grouped)
            .scrollContentBackground(.hidden)
        }
    }
}

// MARK: - 프로필 사진
private struct ProfileImage: View {
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Image(.icnMoyeo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 3)
                
                Image(systemName: SystemImage.editMyProfile)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .padding(4)
                    .foregroundStyle(.white)
                    .background(Color.black)
                    .clipShape(Circle())
                    .offset(x: 24, y: 24)
            }
            .padding(10)
        }
    }
}

// MARK: - 개인정보 뷰
private struct PersonalInfomation: View {
    
    var body: some View {
        Section {
            HStack {
                Text("이름")
                Spacer()
                Text("이경수")
                    .foregroundStyle(.gray7)
            }
            
            HStack {
                Text("연락처")
                Spacer()
                Text("+82 10-9196-7601")
                    .foregroundStyle(.gray7)
            }
            
            HStack {
                Text("이메일")
                Spacer()
                // TODO: ".com"이 붙으면 HTML 형식으로 처리되어 발생하는 에러 처리
                Text(verbatim: "jmtkd9196@gmail.com")
                    .foregroundStyle(.gray7)
            }
        }
    }
}

// MARK: - 계정 설정
private struct AccountSetting: View {
    @State private var isSignOutAlertPresented: Bool = false
    @State private var isResignAlertPresented: Bool = false
    
    var body: some View {
        Section {
            HStack {
                Text("로그아웃")
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isSignOutAlertPresented.toggle()
            }
            .alert("로그아웃", isPresented: $isSignOutAlertPresented) {
                Button(role: .cancel) {
                    // TODO: 확인 버튼을 눌렀을 때의 동작\
                } label: {
                    Text("취소")
                }
                Button(role: .destructive) {
                    // TODO: 취소 버튼을 눌렀을 때의 동작
                    
                } label: {
                    Text("로그아웃")
                }
            } message: {
                Text("로그아웃 하시겠습니까?")
            }
            
            HStack {
                Text("회원탈퇴")
                    .foregroundStyle(.moyeoMain)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                isResignAlertPresented.toggle()
            }
            .alert("회원탈퇴", isPresented: $isResignAlertPresented) {
                Button(role: .cancel) {
                    // TODO: 확인 버튼을 눌렀을 때의 동작\
                } label: {
                    Text("취소")
                }
                Button(role: .destructive) {
                    // TODO: 취소 버튼을 눌렀을 때의 동작
                    
                } label: {
                    Text("탈퇴")
                }
            } message: {
                Text("탈퇴하시겠습니까?")
            }
        }
    }
}

#Preview {
    ProfileView()
}
