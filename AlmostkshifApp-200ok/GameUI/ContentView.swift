//
//  ContentView.swift
//  spacegameTech
//
//  Created by Roa Moha on 11/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State var isPresent = false
    @State var isPresentD = false

    
    var body: some View {
        NavigationView {
            //.navigationTitle("main page")
        ZStack{
                Color.purple
                    .edgesIgnoringSafeArea([.top , .bottom])
                
                Image("1624").resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .edgesIgnoringSafeArea([.top , .bottom])
                LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4) ],  startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea([.top , .bottom])
                Image("astornt").resizable().frame(width: 200, height: 300)
                VStack(spacing: 400){
                    VStack(alignment: .center)
                    {
                        ReuseableText(text: "المستكشف الصغير" , size: 30).padding(.top)
                        
                        
                        //                    ReuseableText(text: "was here" , size: 10)
                        //                        .lineLimit(3)
                        //                        .frame(width: UIScreen.main.bounds.size.width - 20 , height: 60 , alignment: .center)
                        //                        .multilineTextAlignment(.center)
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    //
                    
                    VStack {
                        
                        
                        
                        
                        
                        NavigationLink(destination:             QuizGame(gameManagerVM: GameManagerVM())
){
                            Button{
                                isPresent = true
                                
                                print("")
                                
                            } label: {
                                Text("العب الان")
                                    .font(.system(size: 20, weight: .bold, design: .rounded)).shadow(color: Color.white.opacity(0.5), radius: 2, x: 0 , y: 3  )
                                    .foregroundColor(.purple).frame(width: 200, height:50).background(Color.yellow.cornerRadius(10))
                            }.fullScreenCover(isPresented: $isPresent, content: gameQ.init)
                        
                       
                        
                        
                    }
                        
                        Button{
                            print("")
                            isPresentD = true

                        } label: {
                            Text("استكشف").font(.system(size: 20, weight: .bold, design: .rounded)).shadow(color: Color.white.opacity(0.5), radius: 2, x: 0 , y: 3  )
                                .foregroundColor(.purple).frame(width: 200, height:50).background(Color.yellow.cornerRadius(10))
                        }.fullScreenCover(isPresented: $isPresentD, content: DicoverView.init)
                        
                        
                    }
                
                
            }
            
        }
    }}

    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ReuseableText: View {
    var text : String
    var size: Int
    var body: some View {
        
        Text(text).font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 0 , y: 3)
    }
}

    struct gameQ: View {

        var body: some View {

            QuizGame(gameManagerVM: GameManagerVM())
        }
     }
    }
