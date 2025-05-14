//
//  BarraInferior.swift
//  beGrateful
//
//  Created by Victoria Slyunko on 14.03.2025.
//

//No esta en use do momento!!!!!

import SwiftUI

struct BarraInferior: View {
    var body: some View {
            HStack {
                Button {
                } label: {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                Spacer()

                Button {
                } label: {
                    VStack {
                        Image(systemName: "quote.opening")
                        Text("Today")
                    }
                }
                Spacer()

                Button{
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.title)
                }
                Spacer()

                Button {
                } label: {
                    VStack {
                        Image(systemName: "archivebox.fill")
                        Text("Memories")
                    }
                }
                Spacer()

                Button {
                } label: {
                    VStack {
                        Image(systemName: "arrow.down.document.fill")
                        Text("PDF")
                    }
                }

            }
            .padding()
            .foregroundStyle(Color(red: 0.247, green: 0.208, blue: 0.173))
    }
}

#Preview {
    BarraInferior()
}
