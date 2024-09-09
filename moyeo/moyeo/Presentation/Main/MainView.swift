//
//  MainView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import SwiftUI

struct MainView: View {
    @State private var inviteCode: String = ""
    var body: some View {
        VStack(spacing: 0) {
            Header(inviteCode: $inviteCode)
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
    @Binding private(set) var inviteCode: String
    var body: some View {
        HStack(spacing: 0) {
            Image(.imgMoyeoWhite)
                .resizable()
                .scaledToFit()
            Spacer()
                .frame(width: 28)
            InviteCodeButton(inviteCode: $inviteCode)
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
    @State private var isAlertPresented: Bool = false
    @Binding private(set) var inviteCode: String
    
    var body: some View {
        Button {
            // TODO: 초대코드 입력 Alert 띄우기 구현
            isAlertPresented.toggle()
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color.moyeoMain)
                .overlay {
                    HStack {
                        Text("초대코드 입력")
                            .foregroundStyle(Color.white)
                    }
                }
        }
        .alert("초대코드 입력", isPresented: $isAlertPresented) {
            TextField("영문/숫자 30자리", text: $inviteCode)
            // TODO: iOS 17.0에 맞춰 deprecated 된 부분 수정하기
                .onChange(of: inviteCode) { inviteCodeString in
                    // 30자를 초과할 경우 자름
                    if inviteCodeString.count > 30 {
                        inviteCode = String(inviteCodeString.prefix(30))
                    }
                }
            Button {
                // TODO: 확인 버튼을 눌렀을 때의 동작
                print("입력한 초대코드: \(inviteCode)")
            } label: {
                Text("확인")
            }
            Button(role: .cancel) {
                // TODO: 취소 버튼을 눌렀을 때의 동작
                
            } label: {
                Text("취소")
                    .foregroundStyle(Color.red)
            }
        } message: {
            Text("공유받은 초대코드를 입력해주세요.")
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
                .foregroundStyle(.moyeoLightPink)
                .overlay {
                    HStack {
                        Text("선택")
                            .foregroundStyle(.moyeoMain)
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
                .foregroundStyle(Color.moyeoMain)
        }
    }
}

// MARK: - 모임 리스트 미확정 셀
private struct MeetingListPendingCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("오택동 첫 회식")
                    .font(.Head.head5)
                Text("24.05.12 마감예정")
                    .font(.Body.body5)
                    .foregroundStyle(Color.gray5)
            }
            Spacer()
        }
    }
}

// MARK: - 모임 리스트 확정 셀
private struct MeetingListConfirmCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("와인 동아리")
                    .font(.Head.head5)
                Text("D-5")
                    .font(.Body.body5)
                    .foregroundStyle(Color.gray5)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("24. 05. 12 19:00")
                    .font(.Body.body5)
                    .foregroundStyle(Color.moyeoMain)
                Text("대동집 포항효자점")
                    .font(.Body.body5)
                    .foregroundStyle(Color.moyeoMain)
            }
        }
    }
}

#Preview {
    MainView()
}

#Preview {
    MeetingListPendingCell()
}

#Preview {
    MeetingListConfirmCell()
}
