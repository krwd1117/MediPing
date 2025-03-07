# MediPing

MediPing은 iOS 플랫폼을 위한 의료 알림 애플리케이션입니다.

## 프로젝트 구조

이 프로젝트는 클린 아키텍처를 기반으로 구성되어 있으며, 다음과 같은 레이어로 구분됩니다:

- **Presentation Layer**: UI 관련 컴포넌트
- **Domain Layer**: 비즈니스 로직
- **Data Layer**: 데이터 처리
- **Core Layer**: 공통 유틸리티

## 개발 환경

- iOS 15.0+
- Swift 5.9
- Tuist

## 시작하기

1. 저장소 클론
```bash
git clone https://github.com/[username]/MediPing.git
cd MediPing
```

2. Tuist 설치 (없는 경우)
```bash
curl -Ls https://install.tuist.io | bash
```

3. 프로젝트 생성
```bash
tuist generate
```

4. Xcode로 프로젝트 열기
```bash
open *.xcworkspace
```

## 라이선스

이 프로젝트는 MIT 라이선스 하에 있습니다. 