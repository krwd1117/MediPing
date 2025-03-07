import SwiftUI
import MediPingDomain
import MediPingCore

struct SplashView: View {
    @StateObject private var viewModel: SplashViewModel
    
    init(viewModel: SplashViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Image("AppIcon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
                Text("MediPing")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 16)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.checkPermissions()
        }
    }
} 