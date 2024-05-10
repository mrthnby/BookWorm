//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mert Ali Hanbay on 9.05.2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var book: Book = Book(title: "", author: "", genre: "Fantasy", review: "", rating: 3)
    @State var isAlertShowing = false
    private let genres: [String] = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $book.title)
                    TextField("Author's name", text: $book.author)
                    Picker("Genre", selection: $book.genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $book.review)
                    RatingView(rating: $book.rating)
                }

                Section {
                    Button("Save") {
                        if book.title == "" || book.author == "" || book.review == "" {
                            isAlertShowing = true
                        } else {
                            modelContext.insert(book)
                            dismiss()
                        }

                    }
                }
            }
                .navigationTitle("Add Book")
                .alert("Error", isPresented: $isAlertShowing) {
                Button("Ok", role: .cancel) { }
            } message: {
                Text("All fields are required")
            }
        }
    }
    }

//#Preview {
//    AddBookView()
//}
