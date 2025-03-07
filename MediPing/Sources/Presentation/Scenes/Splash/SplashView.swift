import SwiftUI
import MediPingDomain
import MediPingCore

public struct SplashView: View {
    @StateObject private var viewModel: SplashViewModel = SplashViewModel()
    @Binding var isInitialized: Bool
    
    public init(isInitialized: Binding<Bool>) {
        _isInitialized = isInitialized
    }
    
    public var body: some View {
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
        .onChange(of: viewModel.isInitialized) { newValue in
            isInitialized = newValue
        }
        .onAppear {
            viewModel.checkPermissions()
        }
    }
} 
