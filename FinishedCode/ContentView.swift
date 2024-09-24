//

import SwiftUI

enum Step: String, Hashable, CaseIterable, Identifiable {
    case basic
    case phase
    case keyframe
    case particle

    var id: Self { self }
}

struct ContentView: View {
    @State private var step: Step? = nil
    var body: some View {
        NavigationSplitView(sidebar: {
            sidebar
        }, detail: {
            sample
        })
    }

    @ViewBuilder var sidebar: some View {
        List(selection: $step) {
            ForEach(Step.allCases) { step in
                Text(step.rawValue)
            }
        }
    }

    @ViewBuilder var sample: some View {
        if let s = step {
            switch s {
            case .basic: BasicAnimation()
            case .keyframe: KeyframeAnimation()
            case .particle: ParticleView()
            case .phase: PhaseAnimation()
            }
        } else {
            BasicAnimation()
                .redacted(reason: .placeholder)
        }
    }
}

#Preview {
    ContentView()
}
