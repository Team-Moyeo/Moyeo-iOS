//
//  MainView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/5/24.
//

import SwiftUI

struct MainView: View {
    
    @Environment(PathModel.self) private var pathModel
    
    // TODO: 목업 데이터 실제 데이터로 변경
    @State var selectedTab: ConfirmState = .pending
    @State var isSelectButtonClicked: Bool = false
    let pendingMeetings: [Meeting] = MockDataBuilder.pendingMeetings
    let confirmMeetings: [Meeting] = MockDataBuilder.confirmMeetings
    
    @State private var inviteCode: String = ""
    var body: some View {
        @Bindable var pathModel = pathModel
        NavigationStack(path: $pathModel.profileSettingPath) {
            VStack(spacing: 0) {
                Header(inviteCode: $inviteCode, isSelectButtonClicked: $isSelectButtonClicked)
                Spacer()
                    .frame(height: 20)
                ConfirmPicker(selectedTab: $selectedTab)
                Spacer()
                MeetingList(selectedTab: $selectedTab, isSelectButtonClicked: $isSelectButtonClicked)
                Spacer()
                CreateMeetingButton()
                    .frame(width: 360, height: 52)
            }
            .padding(10)
            .navigationDestination(for: ProfileSettingPath.self) { path in
                switch path {
                case .profileView:
                    ProfileView()
                        .toolbarRole(.editor)
                }
            }
        }
        // TODO: .tint() 여기다 붙이는게 맞는지 확인 필요
        .tint(.moyeoMain)
        .environment(pathModel)
    }
}


enum ConfirmState: String, CaseIterable {
    case pending = "진행중"
    case confirm = "확정"
}

// MARK: - 헤더
private struct Header: View {
    @Binding var inviteCode: String
    @Binding var isSelectButtonClicked: Bool
    var body: some View {
        HStack(spacing: 0) {
            Image(.imgMoyeoWhite)
                .resizable()
                .scaledToFit()
            if !isSelectButtonClicked {
                Spacer()
                    .frame(width: 28)
                InviteCodeButton(inviteCode: $inviteCode)
                    .frame(width: 100)
                Spacer()
                    .frame(width: 8)
            } else {
                Spacer()
            }
            SelectButton(isSelectButtonClicked: $isSelectButtonClicked)
                .frame(width: 44)
            if !isSelectButtonClicked {
                Spacer()
                    .frame(width: 8)
                ProfileButton()
                    .frame(width: 28)
            }
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
    @Binding private(set) var isSelectButtonClicked: Bool
    var body: some View {
        Button {
            // TODO: 리스트 선택할 수 있도록 ON/OFF 구현
            withAnimation {
                isSelectButtonClicked.toggle()
            }
        } label: {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.moyeoLightPink)
                .overlay {
                    HStack {
                        if isSelectButtonClicked {
                            Text("완료")
                                .foregroundStyle(.moyeoMain)
                        } else {
                            Text("선택")
                                .foregroundStyle(.moyeoMain)
                        }
                    }
                }
        }
    }
}

// MARK: - 프로필 버튼
private struct ProfileButton: View {
    @Environment(PathModel.self) private var pathModel
    var body: some View {
        Button {
            // TODO: 프로필 뷰로 이동할 수 있도록 구현
            pathModel.profileSettingPath.append(.profileView)
        } label: {
            Image(.imgProfile)
                .resizable()
                .frame(width: 28, height: 28)
        }
        .environment(pathModel)
    }
}

// MARK: - 진행중/확정 Picker
private struct ConfirmPicker: View {
    // TODO: 임시 변수 추후 수정 예정
    @Binding private(set) var selectedTab: ConfirmState
    
    var body: some View {
        Picker("상태 선택", selection: $selectedTab) {
            ForEach(ConfirmState.allCases, id: \.self) { state in
                Text(state.rawValue)
                    .tag(state)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
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

// MARK: - 모임 리스트
private struct MeetingList: View {
    @State private var pendingMeetings: [Meeting] = MockDataBuilder.pendingMeetings
    @State private var confirmMeetings: [Meeting] = MockDataBuilder.confirmMeetings
    @Binding var selectedTab: ConfirmState
    @Binding var isSelectButtonClicked: Bool
    var body: some View {
        if selectedTab == ConfirmState.pending {
            if pendingMeetings.isEmpty {
                EmptyListView()
            } else {
                MeetingPendingList(pendingMeetings: $pendingMeetings, isSelectButtonClicked: $isSelectButtonClicked)
            }
        } else if selectedTab == ConfirmState.confirm {
            if confirmMeetings.isEmpty {
                EmptyListView()
            } else {
                MeetingConfirmList(confirmMeetings: $confirmMeetings, isSelectButtonClicked: $isSelectButtonClicked)
            }
        }
    }
}

// MARK: - 모임 리스트 미확정 리스트
private struct MeetingPendingList: View {
    
    @Binding private(set) var pendingMeetings: [Meeting]
    @Binding var isSelectButtonClicked: Bool
    
    var body: some View {
        List {
            // TODO: 목업 데이터 실제 데이터로 변경
            ForEach(pendingMeetings) { cellInfo in
                MeetingPendingListCell(isSelectButtonClicked: $isSelectButtonClicked, title: cellInfo.title, deadline: cellInfo.deadline)
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(PlainListStyle())
    }
    
    // TODO: 추후 UseCase로 이동
    func deleteItems(at offsets: IndexSet) {
        pendingMeetings.remove(atOffsets: offsets)
    }
}

// MARK: - 모임 리스트 확정 리스트
private struct MeetingConfirmList: View {
    
    @Binding private(set) var confirmMeetings: [Meeting]
    @Binding var isSelectButtonClicked: Bool
    
    var body: some View {
        List {
            // TODO: 목업 데이터 실제 데이터로 변경
            ForEach(confirmMeetings) { cellInfo in
                MeetingConfirmListCell(isSelectButtonClicked: $isSelectButtonClicked, title: cellInfo.title, deadline: cellInfo.deadline, fixedTimes: [])
            }
            .onDelete(perform: deleteItems)
        }
        .listStyle(PlainListStyle())
    }
    
    // TODO: 추후 UseCase로 이동
    func deleteItems(at offsets: IndexSet) {
        confirmMeetings.remove(atOffsets: offsets)
    }
}

// MARK: - 모임 리스트 미확정 셀
private struct MeetingPendingListCell: View {
    @Binding var isSelectButtonClicked: Bool
    @State private(set) var isSelected: Bool = false
    var title: String
    var deadline: Date
    
    var body: some View {
        HStack(spacing: 0) {
            if isSelectButtonClicked {
                Button {
                    isSelected.toggle()
                } label: {
                    if isSelected {
                        Image(.imgCheckCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    } else {
                        Image(.imgEmptyCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                }
                Spacer()
                    .frame(width: 10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.Head.head5)
                Text("\(deadline.totalYearMonthDayFormat) 마감예정")
                    .font(.Body.body5)
                    .foregroundStyle(Color.gray5)
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

// MARK: - 모임 리스트 확정 셀
private struct MeetingConfirmListCell: View {
    @Binding var isSelectButtonClicked: Bool
    @State private(set) var isSelected: Bool = false
    var title: String
    var deadline: Date
    // TODO: 여러 날짜가 선택된 것에 대해서 어떻게 처리할지 고민 후 수정
    var fixedTimes: [Date]
    
    var body: some View {
        HStack {
            if isSelectButtonClicked {
                Button {
                    isSelected.toggle()
                } label: {
                    if isSelected {
                        Image(.imgCheckCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    } else {
                        Image(.imgEmptyCircle)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                }
                Spacer()
                    .frame(width: 10)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.Head.head5)
                Text(deadline.totalYearMonthDayFormat)
                    .font(.Body.body5)
                    .foregroundStyle(Color.gray5)
            }
            Spacer()
            VStack(alignment: .trailing) {
                // TODO: 여러 날짜가 선택된 것에 대해서 어떻게 처리할지 고민 후 수정
                Text("24. 05. 12 19:00")
                    .font(.Body.body5)
                    .foregroundStyle(Color.moyeoMain)
                // TODO: Place Entity가 구현되면 추가 구현
                Text("대동집 포항효자점")
                    .font(.Body.body5)
                    .foregroundStyle(Color.moyeoMain)
            }
        }
        .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#Preview {
    MainView()
        .environment(PathModel())
}

#Preview {
    MeetingPendingList(pendingMeetings: .constant(MockDataBuilder.pendingMeetings), isSelectButtonClicked: .constant(false))
}

#Preview {
    MeetingPendingListCell(isSelectButtonClicked: .constant(false), title: "오택동 첫 회식", deadline: "24.05.12".toDate ?? Date())
}

#Preview {
    MeetingConfirmListCell(isSelectButtonClicked: .constant(false), title: "오택동 첫 회식", deadline: "24.05.12".toDate ?? Date(), fixedTimes: [])
}
