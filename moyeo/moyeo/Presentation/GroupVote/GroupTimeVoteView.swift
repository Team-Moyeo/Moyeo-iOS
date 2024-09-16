//
//  GroupTimeVoteView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/15/24.
//

import SwiftUI

struct GroupTimeVoteView: View {
    @State private var isSelectButtonClicked: Bool = false
    var meeting: Meeting
    var body: some View {
        VStack {
            TimeHeader(isSelectButtonClicked: $isSelectButtonClicked)
            TimeGrid(meeting: meeting)
        }
        .padding()
    }
}

private struct TimeHeader: View {
    @Binding var isSelectButtonClicked: Bool
    var body: some View {
        HStack {
            Text("시간")
                .font(.Head.head4)
            Spacer()
            SelectButton(isSelectButtonClicked: $isSelectButtonClicked)
                .frame(width: 44)
            // TODO: 캘린더 ON/OFF 추가 구현
            // TODO: 그룹원 스케줄 ON/OFF 추가 구현
        }
        .frame(height: 28)
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

// MARK: - 시간 선택 그리드
private struct TimeGrid: View {
    var meeting: Meeting
    @State private var selectedCells: Set<CandidateTime> = [] // 선택된 셀을 저장할 집합
    

    
    var body: some View {
        // TODO: 외부로 값 빼야함. (최대 7일까지만 가능하게 프론트에서 처리해야될 듯. / 백엔드에서도 7일 이상 차이나면 오류나게끔 처리. 애초에 프론트에서 7일 이상 차이나게 들어오지 못하게 설계해야됨.)
        let tempColumnCount: Int = daysBetween(startDate: meeting.startDate, endDate: meeting.endDate) + 1
        
        let tempRowCount: Int = calculateCellCount(startTime: meeting.startTime, endTime: meeting.endTime)
        
        // TODO: 이렇게 동작하는게 맞는지 검증 필요.. UseCase에서 빼는 방법도 있어보임
        let gridCells = createGridData(startDate: meeting.startDate.totalYearMonthDaySnakeFormat, endDate: meeting.endDate.totalYearMonthDaySnakeFormat, startTime: meeting.startTime.hourMinuteFormat, endTime: meeting.endTime.hourMinuteFormat)
        
        // TODO: 이렇게 동작하는게 맞는지 검증 필요.. UseCase에서 빼는 방법도 있어보임
        // 외부에서 값을 받아와서 동적으로 GridItem 배열을 생성
        let rows: [GridItem] = Array(repeating: .init(.fixed(45), spacing: nil), count: tempRowCount)
        VStack(spacing: 0) {
            // 상단 날짜 표시
            HStack(spacing: 3) {
                
                ForEach(0..<tempColumnCount, id: \.self) { index in
                    let currentDate = Calendar.current.date(byAdding: .day, value: index, to: "2024-08-12".toDate ?? Date())
                    Text(currentDate?.dayFormat ?? "")
                        .font(.Caption.caption1)
                        .frame(width: 50, height: 10)
                        .multilineTextAlignment(.leading)
                }
            }
            Spacer()
                .frame(height: 8)
            LazyHGrid(rows: rows, spacing: 3) {
                
                // TODO: tempCount 관련된 로직이 밖으로 빠지면 ForEach와 관련된 Range도 해당 값으로 변경되야함.
                ForEach(gridCells, id: \.self) { cell in
                    ZStack {
                        if cell.dateTime.dayFormat == "12일(월)" {
                            Text(cell.dateTime.hourMinuteFormat)
                                .font(.Caption.caption2)
                                .frame(width: 50, height: 50)
                                .multilineTextAlignment(.center)
                                .offset(x: -8.0, y: -18.0)
                                .foregroundStyle(.gray7)
                        }
//                        Text(cell.dateTime.dateTimeFormat)
                        Color(selectedCells.contains(cell) ? Color.moyeoMain : .clear)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(selectedCells.contains(cell) ? .red : .gray4, lineWidth: 2)
                            }
                            .cornerRadius(5)
                            .frame(width: 50, height: 50)
                            .opacity(selectedCells.contains(cell) ? 0.5 : 1)
                            .contentShape(Rectangle()) // 클릭할 수 있는 영역 명시
                    }
                    // TODO: TapGesture가 아닌 DragGesture로 해결할 수 있는 방법 고민.
                    .onTapGesture {
                        toggleCellSelection(cell: cell)
                        print(selectedCells)
                    }
                }
            }
        }
        
    }
    
    // TODO: UseCase로 빼야 함.
    // 선택된 셀을 토글하는 함수
    private func toggleCellSelection(cell: CandidateTime) {
        if selectedCells.contains(cell) {
            selectedCells.remove(cell) // 이미 선택된 셀은 해제
        } else {
            selectedCells.insert(cell) // 선택되지 않은 셀은 선택
        }
    }
}

// TODO: DataFormat 관련 로직 분리 필요
func createGridData(startDate: String, endDate: String, startTime: String, endTime: String) -> [CandidateTime] {
    var gridData: [CandidateTime] = []
    let calendar = Calendar.current
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    dateFormatter.locale = Locale(identifier: "ko_KR")
    dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
    
    let dateOnlyFormatter = DateFormatter()
    dateOnlyFormatter.dateFormat = "yyyy-MM-dd"
    
    guard let startDateObj = dateOnlyFormatter.date(from: startDate),
          let endDateObj = dateOnlyFormatter.date(from: endDate),
          let startTimeObj = dateFormatter.date(from: "\(startDate) \(startTime)"),
          let endTimeObj = dateFormatter.date(from: "\(startDate) \(endTime)") else {
        print("날짜 변환 실패")
        return gridData
    }
    
    var currentDate = startDateObj
    
    while currentDate <= endDateObj {
        // startTime과 endTime을 해당 날짜로 변경
        guard let currentStartTime = combine(date: currentDate, time: startTimeObj),
              let currentEndTime = combine(date: currentDate, time: endTimeObj) else {
            break
        }
        
        var currentTime = currentStartTime
        while currentTime < currentEndTime {
            let cellData = CandidateTime(dateTime: currentTime, voteCount: 0)
//            print(cellData.dateTime)
            gridData.append(cellData)
            currentTime = calendar.date(byAdding: .minute, value: 30, to: currentTime)!
        }
        
        currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    return gridData
}

// 날짜와 시간을 결합하는 함수
func combine(date: Date, time: Date) -> Date? {
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
    let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)
    var combinedComponents = DateComponents()
    combinedComponents.year = dateComponents.year
    combinedComponents.month = dateComponents.month
    combinedComponents.day = dateComponents.day
    combinedComponents.hour = timeComponents.hour
    combinedComponents.minute = timeComponents.minute
    combinedComponents.second = timeComponents.second
    return calendar.date(from: combinedComponents)
}

func daysBetween(startDate: Date, endDate: Date) -> Int {
    let calendar = Calendar.current
    // startDate와 endDate 사이의 일 수 계산
    let components = calendar.dateComponents([.day], from: startDate, to: endDate)
    
    // 날짜 차이가 있을 경우, 그 차이를 반환하고 없으면 0을 반환
    return components.day ?? 0
}

func calculateCellCount(startTime: Date, endTime: Date) -> Int {
    let calendar = Calendar.current
    
    // startTime과 endTime 사이의 시간 차이를 계산
    let difference = calendar.dateComponents([.minute], from: startTime, to: endTime)
    
    // 30분 간격으로 나눈 셀 개수
    if let minuteDifference = difference.minute {
        return minuteDifference / 30
    } else {
        return 0
    }
}

#Preview {
    GroupTimeVoteView(meeting: MockDataBuilder.meeting)
}

#Preview {
    TimeHeader(isSelectButtonClicked: .constant(false))
}

#Preview {
    TimeGrid(meeting: MockDataBuilder.meeting)
}
