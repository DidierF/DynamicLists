//
//  ContentView.swift
//  DynamicList
//
//  Created by Didier Fuentes on 7/1/20.
//  Copyright © 2020 DidierFuentes. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    let username, message, imageName: String
}

struct ContentView: View {

    let users: [User] = [
        .init(id: 0, username: "Tim", message: "This is the test message!", imageName: "s1"),
        .init(id: 1, username: "Craig", message: "This is the test message!", imageName: "s2"),
        .init(id: 2, username: "Jon", message: "This is the test message! This message has to be a lot longer so that the cell takes a couple of lines and we can actually see that it will show correctly! :D", imageName: "s3")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let user: User

    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 70, height: 70, alignment: .center)
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            VStack (alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
