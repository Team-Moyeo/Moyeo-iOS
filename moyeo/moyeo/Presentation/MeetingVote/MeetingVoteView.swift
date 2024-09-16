//
//  MeetingVoteView.swift
//  moyeo
//
//  Created by kyungsoolee on 9/15/24.
//

import SwiftUI

struct MeetingVoteView: View {
    // TODO: 추후 UseCase.state 구현되면 변경 예정
    var meeting: Meeting = MockDataBuilder.meeting
    var participants: [Participant] = MockDataBuilder.participants
    
    var body: some View {
        ScrollView {
            Header(title: meeting.title, participants: participants)
            Divider()
            Spacer()
                .frame(height: 20)
            Deadline(deadline: meeting.deadline)
            MeetingTimeVoteView(meeting: meeting)
            Divider()
        }
    }
}

// MARK: - 헤더뷰
private struct Header: View {
    var title: String
    var participants: [Participant]
    var body: some View {
        HStack {
            Text(title)
                .font(.Head.head1)
            Spacer()
            // TODO: 추후 실제 값으로 변경
            Participants(participants: participants)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

// MARK: - 참여자
private struct Participants: View {
    var participants: [Participant]
    var body: some View {
        HStack(spacing: -10) {
            // 최대 2명의 참가자 이미지를 표시
            ForEach(participants.prefix(2)) { participant in
                AsyncImage(url: URL(string: participant.avatar)) { phase in
                    switch phase {
                    case .empty:
                        // 이미지 로딩 중일 때
                        ProgressView()
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    case .success(let image):
                        // 이미지 로드 성공 시
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    case .failure:
                        // 이미지 로드 실패 시
                        Image(systemName: SystemImage.loadingParticipant)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            // 3명 이상일 경우 +N 표시
            if participants.count > 2 {
                Circle()
                    .fill(Color.gray3)
                    .frame(width: 40, height: 40)
                    .overlay(
                        Text("+\(participants.count - 2)")
                            .foregroundColor(.gray)
                            .font(.Head.head4)
                    )
            }
        }
    }
}

// MARK: - 투표 마감기한
private struct Deadline: View {
    var deadline: Date = Date()
    var body: some View {
        HStack {
            // 아이콘 부분
            Image(systemName: "clock")
                .foregroundColor(.gray)
            
            // 투표 마감기한 텍스트
            Text("투표 마감기한")
                .font(.Body.body3)
                .foregroundColor(.gray)
            
            Spacer()
            
            // 마감 기한 날짜 표시
            Text(deadline.deadlineFormat)
                .font(.Body.body3)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.gray1)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
    
}

#Preview {
    MeetingVoteView()
}

#Preview {
    Participants(participants: MockDataBuilder.participants)
}

#Preview {
    Deadline(deadline: Date())
}
