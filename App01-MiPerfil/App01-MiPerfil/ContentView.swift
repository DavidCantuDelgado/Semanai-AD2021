//
//  ContentView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 26/10/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showEditView: Bool = false
    @State var matricula: String = "A00189239"
    @State var birthday: Date = Date()
    @State var weight: Int = 88
    @State var height: Double = 1.80
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack {
                    ZStack {
                        Color("ColorArriba")
                        VStack {
                            Text("David Cantú")
//                                .font(.custom("RobotoSlab-Medium", size: 44))
//                                .modifier(TextModifier())
                                .font(.Roboto(size: 42, weight: "Black"))
                                .foregroundColor(Color("Texto"))
                        }
                    }
                }
                VStack {
                    ZStack {
                        Color("ColorAbajo")
                        VStack {
                            HStack {
                                Text("Matricula:")
                                Text(matricula)
                            }
                            HStack {
                                Text("Fecha nacimiento:")
                                Text("\(dateFormat.string(from: birthday))")
                            }
                            Text(String(format: "Peso: %d - Altura: %.2f", weight, height))
                            
                            Button(action: {
                                showEditView = true
                            }, label: {
                                HStack {
                                    Image(systemName: "pencil.circle.fill")
                                        .font(.largeTitle)
                                    Text("Editar")
                                }
                                .padding()
                                .background(Color("ColorArriba"))
                                .cornerRadius(20)
                            })
                                .padding(.top, 20)
                        }
                        .font(.Roboto(size: 28, weight: "Regular"))
                        .foregroundColor(Color("Texto"))

                    }
                }
            }
            VStack {
                Image("imagen")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color("Texto"), style: StrokeStyle(lineWidth: 10))
                    )
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showEditView) {
            EditView(matricula: $matricula, birthday: $birthday, weight: $weight, height: $height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
