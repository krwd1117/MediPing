import SwiftUI
import MediPingDomain
import MediPingCore

public struct SplashView: View {
    @StateObject private var viewModel: SplashViewModel
    @Binding var isInitialized: Bool
    
    public init(viewModel: SplashViewModel, isInitialized: Binding<Bool>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._isInitialized = isInitialized
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
        .alert("초기화 오류", isPresented: .constant(viewModel.error != nil)) {
            Button("다시 시도") {
                viewModel.checkPermissions()
            }
        } message: {
            Text(viewModel.error?.localizedDescription ?? "알 수 없는 오류가 발생했습니다.")
        }
        .onAppear {
            viewModel.checkPermissions()
        }
    }
} 
