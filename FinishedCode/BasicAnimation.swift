import SwiftUI

struct BasicAnimation: View {
    @State var isOn = false
    var body: some View {
        ZStack {
            Heart()
                .stroke(.tertiary, lineWidth: 5)
            Heart()
                .trim(from: 0, to: isOn ? 1 : 0)
                .stroke(.red, lineWidth: 5)
        }
        .contentShape(Heart())
        .animation(.default.speed(0.2), value: isOn)
        .onTapGesture {
            isOn.toggle()
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    BasicAnimation()
        .padding(100)
}
