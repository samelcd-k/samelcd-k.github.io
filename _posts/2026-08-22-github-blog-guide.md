---
title: "GitHub 블로그 시작하기 (Jekyll + Chirpy 테마)"
date: 2026-08-22 22:00:00 +0900
categories: [블로그, 시작하기]
tags: [github, jekyll, chirpy, ruby, 블로그]
description: Windows 환경에서 Jekyll과 Chirpy 테마로 GitHub 블로그를 만드는 방법을 단계별로 정리했습니다.
---

GitHub Pages와 Jekyll을 이용하면 무료로 나만의 개발 블로그를 만들 수 있습니다.
이 포스트에서는 Windows 환경 기준으로 **Jekyll + Chirpy 테마**를 사용해 블로그를 세팅하는 과정을 처음부터 끝까지 정리합니다.

## 전체 흐름

```
Step 1: Ruby 설치
Step 2: Jekyll & Bundler 설치
Step 3: GitHub 저장소 생성 (Chirpy Starter)
Step 4: 로컬에 클론 & 의존성 설치
Step 5: _config.yml 설정
Step 6: 로컬에서 블로그 실행
Step 7: 첫 번째 포스트 작성
Step 8: GitHub에 push → 자동 배포
```

---

## STEP 1: Ruby 설치

Jekyll은 Ruby 기반이므로 Ruby를 먼저 설치해야 합니다.

> ⚠️ Ruby **3.x** 버전을 설치해야 합니다. Ruby 4.x는 Chirpy 테마와 호환되지 않습니다.

1. [https://rubyinstaller.org/downloads/](https://rubyinstaller.org/downloads/) 접속
2. **Ruby+Devkit 3.2.x (x64)** 다운로드
3. 설치 시 **"Add Ruby executables to your PATH"** 체크
4. 설치 완료 후 MSYS2 설치 창에서 **Enter** 입력

설치 확인:

```powershell
ruby --version
# ruby 3.2.x (...)
```

> 💡 **PATH가 인식되지 않는 경우**: PowerShell을 새로 열거나, 아래 명령으로 현재 세션에 임시 적용할 수 있습니다.
> ```powershell
> $env:PATH = "C:\Ruby32-x64\bin;" + $env:PATH
> ```

---

## STEP 2: Git 설치

[https://git-scm.com/download/win](https://git-scm.com/download/win) 에서 Git을 설치합니다.
설치 옵션은 기본값으로 진행하면 됩니다.

---

## STEP 3: GitHub 저장소 생성 (Chirpy Starter)

가장 빠른 방법은 **Chirpy Starter 템플릿**을 이용하는 것입니다.

1. [https://github.com/cotes2020/chirpy-starter](https://github.com/cotes2020/chirpy-starter) 접속
2. 우측 상단 **"Use this template"** → **"Create a new repository"** 클릭
3. 저장소 이름을 `[내GitHub아이디].github.io` 로 설정
4. **Public** 선택 후 **Create repository**

---

## STEP 4: 로컬에 클론 & 의존성 설치

```powershell
git clone https://github.com/[내아이디]/[내아이디].github.io.git .
bundle install
```

> `bundle install`은 `Gemfile`에 정의된 패키지를 모두 설치합니다. 시간이 다소 걸릴 수 있습니다.

---

## STEP 5: `_config.yml` 설정

클론이 완료되면 루트 경로의 `_config.yml` 을 열어 기본 정보를 수정합니다.

```yaml
title: OnewPaPa                    # 블로그 제목
tagline: samelcd-k의 개발 블로그   # 부제목
description: >-
  samelcd-k의 개발 블로그입니다.

url: "https://[내아이디].github.io"  # 배포될 블로그 주소

lang: ko          # 언어 설정 (한국어)
timezone: Asia/Seoul  # 시간대 설정

github:
  username: [내 GitHub 아이디]

social:
  name: [이름]
  email: [이메일] # 생략 가능
  links:
    - https://github.com/[내아이디]
```

---

## STEP 6: 로컬에서 블로그 실행

```powershell
bundle exec jekyll serve
```

실행 후 브라우저에서 [http://127.0.0.1:4000](http://127.0.0.1:4000) 접속하면 블로그를 미리 볼 수 있습니다.

---

## STEP 7: 첫 번째 포스트 작성

포스트는 `_posts/` 폴더 안에 `YYYY-MM-DD-제목.md` 형식의 파일로 작성합니다.

**예시: `_posts/2026-08-22-hello-world.md`**

```markdown
---
title: "첫 번째 포스트"
date: 2026-08-22 21:00:00 +0900
categories: [블로그, 시작]
tags: [github, jekyll]
---

안녕하세요! GitHub 블로그를 시작했습니다 🎉
```

Chirpy 포스트의 front matter 주요 항목:

| 항목 | 설명 |
|------|------|
| `title` | 포스트 제목 |
| `date` | 작성 날짜 및 시간 (+0900 = 한국시간) |
| `categories` | 카테고리 (최대 2단계) |
| `tags` | 태그 (여러 개 가능) |
| `description` | 요약 설명 (SEO용) |
| `image` | 썸네일 이미지 경로 |

---

## STEP 8: GitHub에 push → 자동 배포

```powershell
git add .
git commit -m "첫 번째 포스트 추가"
git push origin main
```

push 후 약 **2~3분** 뒤 GitHub Actions가 자동으로 빌드 & 배포합니다.

👉 `https://[내아이디].github.io` 에서 배포된 블로그를 확인할 수 있습니다.

---

## 폴더 구조

```
.
├── _config.yml     # 블로그 전체 설정
├── _posts/         # 📝 포스트 작성 공간
├── _tabs/          # 메뉴 탭 (About, Archives 등)
├── assets/
│   └── img/        # 이미지 저장
└── index.html
```

---

## 트러블슈팅

### Ruby PATH가 인식되지 않을 때
PowerShell을 새로 열거나, 환경 변수를 수동으로 등록합니다.

```powershell
[System.Environment]::SetEnvironmentVariable(
  "Path", "C:\Ruby32-x64\bin;" + $env:Path, "User"
)
```

### `bundle install` 중 Ruby 버전 오류
```
Because jekyll-theme-chirpy >= 7.1.0 depends on Ruby ~> 3.1
```
→ Ruby 4.x를 제거하고 **Ruby 3.2.x** 를 설치하세요.

### MSYS2 `/tmp` 폴더 오류
```
Cannot create temporary file in C:\Ruby40-x64\msys64\tmp\
```
→ 해당 폴더를 직접 생성하면 해결됩니다.
```powershell
New-Item -ItemType Directory -Path "C:\Ruby40-x64\msys64\tmp" -Force
```

---

## 마치며

처음 세팅하는 과정이 다소 복잡하지만, 한 번 구축해두면 이후에는 Markdown 파일만 작성해서 push하면 블로그 포스트가 자동으로 배포됩니다.

앞으로 공부한 내용들을 이 블로그에 꾸준히 기록해 나갈 예정입니다 🙌
