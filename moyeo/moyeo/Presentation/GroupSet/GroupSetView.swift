//
//  GroupSetView.swift
//  moyeo
//
//  Created by 지영 on 9/11/24.
//

import SwiftUI

struct GroupSetView: View {
    var body: some View {
        VStack(spacing: 0) {
            sheetTitle()
            groupSetForm()
            startGroupButton()
        }
        .background(.gray1)
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }
}

// MARK: - 모임 생성하기 제목
private struct sheetTitle: View {
    var body: some View {
        Text("모임 생성하기")
            .font(.Head.head5)
            .foregroundStyle(.black)
            .padding(11)
    }
}

// MARK: - 모임 만들기 폼
private struct groupSetForm: View {
    var body: some View {
        Form {
            groupNameSection()
            groupTimeSection()
            groupPlaceSection()
            voteDeadlineSection()
        }
        .scrollContentBackground(.hidden)

    }
}

// MARK: - 모임명 섹션
private struct groupNameSection: View {
    @State private var groupName = ""
    
    var body: some View {
        Section {
            HStack{
                Text("모임명")
                TextField("", text: $groupName)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

// MARK: - 모임 시간 섹션
private struct groupTimeSection: View {
    @State private var timeVoting = false
    @State private var fixedGroupTime = Date()
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var startTimeRange = Date()
    @State private var endTimeRange = Date()
    
    var body: some View {
        Section {
            Toggle(isOn: $timeVoting, label: {
                Text("시간 투표")
            })
            
            if !timeVoting {
                //TODO: default 3시간 이후
                DatePicker("시간", selection: $fixedGroupTime)
                    .accentColor(.accent)
            } else {
                DatePicker("시작 날짜", selection: $startDate, displayedComponents: .date)
                DatePicker("끝 날짜", selection: $endDate, displayedComponents: .date)
                HStack(spacing: 0) {
                    DatePicker("시간 범위", selection: $startTimeRange, displayedComponents: .hourAndMinute)
                    Text(" ~ ")
                    DatePicker("", selection: $endTimeRange, displayedComponents: .hourAndMinute).labelsHidden()
                    
                }
            }
        }
    }
}

// MARK: - 모임장소 섹션
private struct groupPlaceSection: View {
    @State private var placeVoting = false
    @State private var fixedGroupPlace = ""
    
    @State private var isMapSheetPresented = false
    
    var body: some View {
        Section {
            Toggle(isOn: $placeVoting, label: {
                Text("장소 투표")
            })
            
            if !placeVoting {
                HStack {
                    Text("장소")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("장소를 선택해주세요.")
                            .foregroundStyle(.gray5)
                    }
                }
            } else {
                Button {
                    self.isMapSheetPresented.toggle()
                } label: {
                    Text("+ 새로운 장소")
                }
                .sheet(isPresented: $isMapSheetPresented, content: {
                    //TODO: 장소 서치 뷰 띄우기
                    Text("새로운 장소 추가")
                    //TODO: 새 장소 추가 시 list 추가
                })
            }
        }
    }
}

// MARK: - 투표 마감기한 섹션
private struct voteDeadlineSection: View {
    @State private var voteDeadline = Date()

    var body: some View {
        Section {
            DatePicker("투표 마감 기한", selection: $voteDeadline)
        }
    }
}

// MARK: - 모임 시작하기 버튼
private struct startGroupButton: View {
    var body: some View {
        Button {
            //TODO: dismiss
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 52)
                .overlay {
                    Text("모임 시작하기")
                        .font(.Head.head5)
                        .foregroundStyle(.white)
                }
        }
        .padding(16)
    }
}



#Preview {
    GroupSetView()
}
