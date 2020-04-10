//
//  ContentView.swift
//  0409_App
//
//  Created by 朴萬浩 on 2020/04/09.
//  Copyright © 2020 朴萬浩. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @State var selectedSegment: Segment?
    
    var body: some View {
        
        
        let body = GeometryReader { geometry in
            self.createBody(size: geometry.size)
                .edgesIgnoringSafeArea(.vertical)
        }
                
        let leadingBarItem = Button(action: { }) {
            Text("Cancel")
        }
        
        return NavigationView {
            body.navigationBarItems(leading: leadingBarItem)
        }.colorScheme(.light)
    }
    
    private func createBody(size: CGSize) -> some View {
        let circleRadius = size.height / 2.0
        let buttonWidth = (size.width - 3.0 * 16.0) / 2.0
        
        return ZStack {
            Color.background.edgesIgnoringSafeArea(.vertical)
            
            VStack(alignment: .center) {
                self.createTitle()
                self.createCircleControl(radius: circleRadius)
                self.createDescription()
                self.createButtons(width: buttonWidth)
                
            }.padding(.top, 32.0)
        }
    }
    
    private func createTitle() -> some View {
        
        return Group {
            
            Text("내가 만들었다.")
                .font(.system(.largeTitle))
                .fontWeight(.heavy)
            Text("강채현님의 0409 Daily App Proj.")
                .font(.system(.headline))
                .fontWeight(.regular)
        }
    }
    
    private func createDescription() -> some View {
        
        
        return Group {
            
            Text(selectedSegment?.title ?? "")
                .font(.system(.headline))
                .fontWeight(.semibold)
            
            Group {
                
                Text(selectedSegment?.description ?? "")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray.opacity(0.9))
                    +
                Text(" Learn More...")
                    .font(.system(.subheadline))
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
            }
            .multilineTextAlignment(.center)
            .lineLimit(3)
        }
    }
    
    private func createButtons(width: CGFloat) -> some View {
        return Group {
            HStack(spacing: 16.0) {
                Button(action: { }) {
                    Text("돈 이따 낼게염ㅋ")
                        .font(.system(.headline))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                }
                .frame(width: width, height: 50.0)
                .background(Color.white)
                .cornerRadius(12.0)
                
                Button(action: { }) {
                    Text("돈 지금 낼게염ㅋ")
                        .font(.system(.headline))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .frame(width: width, height: 50.0)
                .background(Color.black)
                .cornerRadius(12.0)
            }.padding(.top, 24.0)
            
            Button(action: { }) {
                Text("Show Keypad")
                    .font(.system(.headline))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
            }.padding(.top, 12.0)
        }
    }
    
    private func createCircleControl(radius: CGFloat) -> some View {
        let totalBalance: Double = 1682.55
        let segments: [Segment] = [
            Segment(
                color: Color.init(red: 255/255, green: 216/255, blue: 89/255),
                amount: 175.0,
                title: "Reduce Interest Charges",
                description: "Paying more than the minimum amount each\nmonth will help you reduce or even avoid\ninterest charges."),
            Segment(
                color: Color.init(red: 89/255, green: 155/255, blue: 255/255),
                amount: 672.37,
                title: "Start a 3-Month Payment Plan",
                description: "Pay the suggested amount every month and\nyour balance could be paid off in just three\nmonths."),
            Segment(
                color: Color.init(red: 255/255, green: 168/255, blue: 174/255),
                amount: 1180.78,
                title: "Pay February Balance",
                description: "Paying your monthly statement balance helps\nkeep you financially healthy and avoid interest\ncharges.")
        ]
        
        let circleControl = CircleControl(totalBalance: totalBalance, segments: segments, selectedSegment: $selectedSegment)
        
        return circleControl
            .frame(width: radius, height: radius)
            .padding(16.0)
    }
}
