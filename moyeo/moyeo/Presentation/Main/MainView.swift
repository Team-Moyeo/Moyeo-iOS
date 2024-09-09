//
//  MainView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            Header()
            Spacer()
                .frame(height: 20)
            ConfirmPicker()
            Spacer()
            // TODO: 리스트가 비어있다면 해당 뷰가 뜨도록 구현
            if true {
                EmptyListView()
            }
            Spacer()
            CreateMeetingButton()
                .frame(width: 360, height: 52)
        }
        .padding(10)
    }
}

// MARK: - 헤더
private struct Header: View {
    var body: some View {
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
                .frame(width: 28)
        }
        .frame(height: 28)
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

// MARK: - 프로필 버튼
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

// MARK: - 미확정/확정 Picker
private struct ConfirmPicker: View {
    // TODO: 임시 변수 추후 수정 예정
    @State var selectedTab = "미확정"
    var isSelected = ["미확정", "확정"]
    
    var body: some View {
        Picker("", selection: $selectedTab) {
            ForEach(isSelected, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
    }
}

// MARK: - 리스트가 비어있을 때 뷰
private struct EmptyListView: View {
    var body: some View {
        VStack {
            Image(.imgPromise)
                .resizable()
                .scaledToFit()
            Image(.imgSloganKor)
                .resizable()
                .scaledToFit()
        }
        .frame(width: 240)
    }
}

// MARK: - 모임 생성하기 버튼
private struct CreateMeetingButton: View {
    var body: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .overlay {
                    HStack {
                        Text("모임 생성하기")
                            .font(.Head.head5)
                            .foregroundStyle(.white)
                    }
                }
        }
    }
}

#Preview {
    MainView()
}
