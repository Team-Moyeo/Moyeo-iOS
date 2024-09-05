//
//  MainView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Header()
        }
    }
}

// MARK: - 헤더
private struct Header: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Image(.imgMoyeoWhite)
                    .resizable()
                    .scaledToFit()
                Spacer()
                    .frame(width: 28)
                InviteCodeButton()
                    .frame(width: 100)
                Spacer()
                    .frame(width: 8)
                SelectButton()
                    .frame(width: 44)
                Spacer()
                    .frame(width: 8)
                ProfileButton()
            }
            .frame(height: 28)
        }
    }
}

// MARK: - 초대코드 입력 버튼
private struct InviteCodeButton: View {
    var body: some View {
        Button {
            // TODO: 초대코드 입력 Alert 띄우기 구현
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.moyeoLightPink)
                .overlay {
                    HStack {
                        Text("초대코드 입력")
                    }
                }
        }
    }
}

// MARK: - 선택 버튼
private struct SelectButton: View {
    var body: some View {
        Button {
            // TODO: 리스트 선택할 수 있도록 ON/OFF 구현
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.gray1)
                .overlay {
                    HStack {
                        Text("선택")
                    }
                }
        }
    }
}

// MARK: - 선택 버튼
private struct ProfileButton: View {
    var body: some View {
        Button {
            // TODO: 프로필 뷰로 이동할 수 있도록 구현
            
        } label: {
            Image(.imgProfile)
                .resizable()
                .frame(width: 28, height: 28)
        }
    }
}

#Preview {
    MainView()
}
