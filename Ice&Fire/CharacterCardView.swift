//
//  CharacterCardView.swift
//  Ice&Fire
//
//  Created by Salman Mhaskar on 12/07/24.
//

import SwiftUI

struct CharacterCardView: View {
    
    var imageUrl: String
    var firstName: String
    var lastName: String
    
    var body: some View {
        ZStack(alignment:.bottom){
            AsyncImage(url: URL(string: imageUrl))
            { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 280)
                        .mask{
                            RoundedRectangle(cornerRadius: 20)
                        }
                    
                } else if phase.error != nil {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 280)
                        .mask{
                            RoundedRectangle(cornerRadius: 20)
                        }
                }
            }

            Rectangle()
                .frame(height: 60)
                .foregroundStyle(.black)
                .blur(radius: 30)
            
            VStack {
                Text(firstName)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                
                
                Text(lastName)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .bold()
                
            }.padding(10)
                          
            
        }
        .frame(width: 280, height: 280)
        .mask{
            RoundedRectangle(cornerRadius: 20)
        }
        
    }
}

#Preview {
    CharacterCardView(imageUrl: "https://thronesapi.com/assets/images/daenerys.jpg", firstName: "Daenerys", lastName: "Targaryen")
}
