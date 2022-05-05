//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by chen draggy on 2022/4/27.
//

import SwiftUI

struct ContentView: View {
    @State private var Symbols = ["apple","star","cherry"]
    @State private var numbers = [0,0,0,0,0,0,0,0,0]
    @State private var win = [true,true,true,true,true,true,true,true]
    @State private var winIndex=0
    @State private var SwitchLine=0
    @State private var credits=1000
    @State private var betAmount=5
    var body: some View {
        ZStack{
            //Background
            Rectangle()  //長方形
                .foregroundColor(Color(red:200/255,green:143/255,      blue:32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red:228/255,green:195/255,blue:76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("Swift UI Slots")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }.scaleEffect(2) //容器內大小調整
                
                Spacer()
                //Title
                Text("Credit: "+String(credits))
                    .foregroundColor(.black)
                    .background(Color.white.opacity(0.5))
                    .padding(.all,10)
                    .cornerRadius(20)
                
                Spacer()
                //Cards
                VStack{
                    HStack{
                        Spacer()
                        Image(Symbols[numbers[0]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[1]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[2]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Image(Symbols[numbers[3]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[4]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[5]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Image(Symbols[numbers[6]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[7]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Image(Symbols[numbers[8]])
                            .resizable()
                            .aspectRatio(1,contentMode: .fit)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                        Spacer()
                    }
                }
                
                
                Spacer()
                //Button
                Button(action: {
                    //為每個card給予亂數
                    for i in 0...numbers.count-1
                    {
                        self.numbers[i] = Int.random(in: 0...Symbols.count-1)
                        if(i==0){
                            continue //只有一個數沒得比互相比對是否正確
                        }else if(SwitchLine == 2){
                            //橫列判斷
                            if(numbers[i] != numbers[i-1] || numbers[i-1] != numbers[i-2])
                            {
                                win[winIndex]=false
                            }else{
                                win[winIndex]=true
                            }
                            winIndex+=1;
                            SwitchLine=0;
                        }
                        SwitchLine+=1;
                    }
                    //直列判斷
                    for i in 0...2
                    {
                        if(numbers[i] != numbers[i+3] || numbers[i+3] != numbers[i+6]){
                            win[winIndex]=false
                        }else{
                            win[winIndex]=true
                        }
                        winIndex+=1
                    }
                    //斜的判斷
                    if(numbers[0] != numbers[4] || numbers[4] != numbers[8])
                    {
                        win[winIndex]=false
                    }else{
                        win[winIndex]=true
                    }
                    winIndex+=1
                    if(numbers[2] != numbers[4] || numbers[4] != numbers[6])
                    {
                        win[winIndex]=false
                    }else{
                        win[winIndex]=true
                    }
                    winIndex+=1
                    
                    //檢查是否有三個連在一起，有則加分
                    var key=false
                    for i in win{
                        if(i==true)
                        {
                            self.credits += betAmount * 5
                            key=true
                        }
                    }
                    if(key==false)
                    {
                        self.credits -= betAmount * 20
                    }
                    SwitchLine=0
                    winIndex=0
                   /* if(win==true)
                    {
                        self.credits += betAmount * 10
                    }else{
                        self.credits -= betAmount
                    }*/
                    
                }, label: {
                    
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading,.trailing],30)
                        .background(Color.pink)
                        .cornerRadius(20)
                    
                })
                
                Spacer()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
