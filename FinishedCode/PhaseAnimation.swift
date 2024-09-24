import SwiftUI

struct PhaseAnimation: View {
    @State var isOn = false
    var body: some View {
        PhaseAnimator([false, true], trigger: isOn) { active in
            Heart()
                .fill(isOn ? .red : .gray)
                .rotationEffect(.degrees(active ? 13 : 0))
                .scaleEffect(active ? 1.85 : 1)
                .offset(x: active ? 50 : 0, y: active ? -50 : 0)
        }
        .frame(width: 100, height: 100)
        .animation(.default, value: isOn)
        .onTapGesture {
            isOn.toggle()
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    PhaseAnimation()
        .padding(100)
}
