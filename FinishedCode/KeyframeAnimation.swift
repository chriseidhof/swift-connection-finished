import SwiftUI

struct KeyframeAnimation: View {
    @State private var isOn = false

    struct Value {
        var opacity: Double
        var trim: Double
    }
    
    
    let off = Value(opacity: 0.1, trim: 0)
    let on = Value(opacity: 1, trim: 1)

    var body: some View {
        KeyframeAnimator(initialValue: isOn ? on : off, trigger: isOn) { value in
            ZStack {
                Heart()
                    .fill(Color.red.opacity(value.opacity))
                Heart()
                    .trim(from: 0, to: value.trim)
                    .stroke(Color.red, lineWidth: 3)
            }      
        } keyframes: { _ in
            KeyframeTrack(\.opacity) {
                if isOn {
                    MoveKeyframe(0.1)
                    CubicKeyframe(0.1, duration: 1.5)
                    CubicKeyframe(1, duration: 1)
                } else {
                    MoveKeyframe(1)
                    CubicKeyframe(0.1, duration: 2)
                }
            }
            KeyframeTrack(\.trim) {
                if isOn {
                    MoveKeyframe(0)
                    CubicKeyframe(1, duration: 2)
                } else {
                    MoveKeyframe(1)
                    CubicKeyframe(0, duration: 2)
                }
            }
        }
        .onTapGesture {
            isOn.toggle()
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    KeyframeAnimation()
        .padding(100)
}
