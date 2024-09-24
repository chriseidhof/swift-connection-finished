import SwiftUI

struct ParticleModifier: ViewModifier {
    @State var startTime = Date.now
    @State var particles: [Particle] = []

    struct Particle: Codable {
        var amplitude: CGFloat = .random(in: -50...50)
        var delay: TimeInterval = .random(in: 0...2)
    }

    func body(content: Content) -> some View {
        content
            .background {
                TimelineView(.animation) { timelineCtx in
                    let elapsed = timelineCtx.date.timeIntervalSince(startTime)
                    Canvas { ctx, size in
                        let heart = ctx.resolveSymbol(id: "particle")!
                        ctx.translateBy(x: size.width/2, y: size.height/2)
                        for p in particles {
                            let time = elapsed-p.delay
                            guard time > 0 else { continue }
                            let x = sin(time * .pi) * p.amplitude
                            let y = time * -30
                            ctx.opacity = 1-time/4
                            ctx.draw(heart, at: .init(x: x, y: y))
                        }
                    } symbols: {
                        content.tag("particle")
                    }
                }
                .frame(width: 300, height: 400)
            }
            .onTapGesture {
                startTime = .now
                particles = (0..<5).map { _ in Particle() }
            }
    }
}

struct ParticleView: View {
    var body: some View {
        Image(systemName: "heart")
            .symbolVariant(.fill)
            .foregroundStyle(.red)
            .font(.system(size: 80))
            .modifier(ParticleModifier())
    }
}

#Preview {
    ParticleView()
        .frame(width: 320, height: 480)
}
