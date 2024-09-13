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
            PersonalInfomation()
        }
    }
}

struct PersonalInfomation: View {
    var body: some View {
        List {
            HStack {
                Text("이름")
                Spacer()
                Text("이경수")
            }
            
            HStack {
                Text("연락처")
                Spacer()
                Text("+82 10-9196-7601")
            }
            
            HStack {
                Text("이메일")
                Spacer()
                Text("jmtkd9196@gmail.com")
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    ProfileView()
}
