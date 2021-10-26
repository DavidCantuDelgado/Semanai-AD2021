//
//  EditView.swift
//  App01-MiPerfil
//
//  Created by David Cantú Delgado on 26/10/21.
//

import SwiftUI

struct EditView: View {
    
    @Binding var matricula: String
    @Binding var birthday: Date
    @Binding var weight: Int
    @Binding var height: Double
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MMM/dd"
        return formatter
    }
    
    var body: some View {
        ZStack {
            Color("ColorAbajo")
            VStack {
                Text("Matrícula:")
                
                TextField("Matrícula", text: $matricula)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal,20)
                DatePicker(selection: $birthday, in: ...Date(), displayedComponents: .date) {
                    Text("\(dateFormat.string(from: birthday))")
                        
                }
                    .padding(.horizontal,20)
                Stepper(value: $weight, in: 40...120) {
                    Text("Peso: \(weight)")
                }
                    .padding(.horizontal,20)
                Text(String(format: "Altura: %.2f", height))
                Slider(value: $height, in: 1.30...2.30)
                    .padding(.horizontal,20)
                Spacer()
            }
            .padding(.top, 100)
            .font(.Roboto(size: 28, weight: "Regular"))
            .foregroundColor(Color("Texto"))
        }
        .edgesIgnoringSafeArea(.all
        )
    }
}

struct EditView_Previews: PreviewProvider {
    
    @State static var matricula: String = "A00189239"
    @State static var birthday: Date = Date()
    @State static var weight: Int = 88
    @State static var height: Double = 1.80
    static var previews: some View {
        EditView(matricula: $matricula, birthday: $birthday, weight: $weight, height: $height)
    }
}
