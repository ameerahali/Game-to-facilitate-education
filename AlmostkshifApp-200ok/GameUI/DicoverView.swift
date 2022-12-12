//
//  ContentView.swift
//  GameUI
//
//  Created by Kavsoft on 28/05/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI

struct DicoverView: View {
    var body: some View {
        
        NavigationView{
          Home()
                    .navigationBarTitle("",displayMode: .inline)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            ContentView()
//                .navigationTitle("Starting page")
//            NavigationLink(destination: Text("Destination"), label: {
//                Text("Next screen")
//            } )
        }
          
            
               
        }
    }


struct DicoverView_Previews: PreviewProvider {
    static var previews: some View {
        DicoverView()
    }
}

struct Home : View {
    @State var isVis = false
    var body: some View{
      
        VStack{
            
            HStack{
                
               
                
               
                
                Button(action: {
isVis = true
                }) {

                    Image(systemName: "arrowshape.turn.up.backward")
                        .font(.title)
                        .foregroundColor(.white)
                }.fullScreenCover(isPresented: $isVis, content: ContentView.init)
                Spacer()
//                Text("مرحبا اميرة")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10){
                    
                    ForEach(data){i in
                        
                        Card(data: i)
                    }
                }
                .padding(.bottom)
            }
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.bottom)
    }
}


class Host : UIHostingController<DicoverView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

struct Card : View {
    
    var data : Player
    
    var body: some View{
        
        HStack{
            
            Image(self.data.image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 5 )
            
            Spacer()
            
            VStack(spacing: 20){
                
                Spacer(minLength: 0)
                
                Image(systemName: "drop.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                
                        ZStack{
                            
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[0])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "moon.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                
                        ZStack{
                            
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[1])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "sun.max")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                
                        ZStack{
                            
                            self.data.color
                            
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            
                            Circle()
                                .trim(from: 0, to: self.data.powers[2])
                                .stroke(Color.white, lineWidth: 5)
                         }
                        .rotationEffect(.init(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                
                //ggggg
                
                
                
                NavigationLink(destination: Detail(data: self.data)) {
                    
                    Text("اكتشف المزيد")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                        
                }
                .offset(y: -35)
            }
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
        
            Color.white.opacity(0.2)
            .cornerRadius(25)
            // going to rate view in 3d angle...
            .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
            // going to trim view..
            .padding(.vertical, 35)
            .padding(.trailing, 25)
            
        )
        .padding(.horizontal)
    }
}

// Detail View...

struct Detail : View {
    
    var data : Player
    
    // used to pop the top most view on stack...
    
    @Environment(\.presentationMode) var present
    
    var body: some View{
        
        VStack{
            
            ZStack{
                
                HStack{
                    
                    Button(action: {
                        
                        //pop the view when back button pressed
                        
                        self.present.wrappedValue.dismiss()
                        
                    }) {
                        
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
//
//                    Button(action: {
//
//                    }) {
//
//                        Image(systemName: "circle.grid.2x2.fill")
//                            .font(.title)
//                            .foregroundColor(.white)
//                    }
                }
                
                Text("تعرف على")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            Image(self.data.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height / 3)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(self.data.name)
                .fontWeight(.bold)
                .font(.system(size: 55))
                .foregroundColor(.white)
                .padding(.top)
            
            Text("الارض او كوكب الحياة هو ثالث كوكب في المجموعة الشمسية و الوحيد الذي يمكن للكائنات الحية العيش فيه ")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top)
            
           // HStack(spacing: 20){
                
//                Button(action: {
//
//                }) {
//
//                    Text("Add Favourite")
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
//                        .background(Capsule().stroke(Color.white, lineWidth: 2))
//                }
//
//                Button(action: {
//
//                }) {
//
//                    Text("Play Now")
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: (UIScreen.main.bounds.width / 2) - 30)
//                        .background(Color("Color4"))
//                        .clipShape(Capsule())
//                }
//            }
//            .padding(.top,30)
            
            Spacer()
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color2"),Color("Color4")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("",displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

// sample data...

struct Player : Identifiable {
    
    var id : Int
    var powers : [CGFloat]
    var image : String
    var name : String
    var color : Color
}

var data = [

    Player(id: 0, powers: [0.2,0.5,0.9], image: "P1", name: "كوكب الارض", color: Color("Color")),
    Player(id: 2, powers: [0.3,0.5,0.6], image: "P2", name: "الزهرة", color: Color("Color1")),
    Player(id: 1, powers: [0.5,0.4,0.8], image: "P3", name: "المريخ",color: Color("Color1")),
    Player(id: 3, powers: [0.5,0.4,0.8], image: "P4", name: "المشتري",color: Color("Color1")),
    Player(id: 4, powers: [0.5,0.4,0.8], image: "P5", name: "زُحل",color: Color("Color1")),
    Player(id: 5, powers: [0.5,0.4,0.8], image: "P6", name: "عطارد",color: Color("Color1")),
    Player(id: 6, powers: [0.5,0.4,0.8], image: "P7", name: "بلوتو",color: Color("Color1")),
    Player(id: 7, powers: [0.5,0.4,0.8], image: "P8", name: "اروانوس",color: Color("Color1")),
]
