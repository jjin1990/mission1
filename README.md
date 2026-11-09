# 내 컴퓨터에 개발자용 작업실 꾸미기

## 1. 개요

경남 코디세이 AI 올인원 1기 입학연수 미션1 「내 컴퓨터에 개발자용 작업실 꾸미기」의 수행 기록입니다.

이 미션은 로컬(내 컴퓨터)에 터미널, Docker, Git으로 개발 환경(작업실)을 만들고, 그 과정을 명령어와 결과로 기록해 **누구나 같은 방법으로 실행하고 확인할 수 있게** 하는 것입니다.

- Git 사용자 정보를 설정하고, GitHub 저장소와 VSCode를 연결한다.
- 터미널로 작업 폴더와 파일을 만들고, 복사, 이동, 이름 변경, 삭제한다.
- 파일과 폴더의 권한을 확인하고, 바꾸기 전과 후를 비교한다.
- Docker 설치를 점검하고, 이미지와 컨테이너를 실행·중지·확인한다.
- Dockerfile로 나만의 웹 서버 이미지를 만들고, 포트 매핑으로 브라우저에서 접속한다.
- 바인드 마운트로 파일 수정이 바로 반영되는지(변경 반영), 볼륨으로 컨테이너를 지워도 데이터가 남는지(데이터 영속성) 확인한다.

## 2. 실행 환경

- OS: Windows 11 Home 25H2 (빌드 26200)
- CPU / 메모리: Intel i7 (x86_64) / 16GB
- 리눅스 환경: WSL 2 + Ubuntu
- 터미널: Windows PowerShell 5.1, Ubuntu bash (VSCode 통합 터미널)
- Git: 2.53.0
- Docker: Docker Desktop (WSL 2 기반), Docker 29.9.2
- 편집기: VSCode 1.145.2 (WSL 확장으로 Ubuntu 연결)

## 3. 수행 체크리스트

- [x] Git 사용자 정보·기본 브랜치 설정, GitHub 저장소 연결
- [x] VSCode에서 WSL(Ubuntu)로 작업 폴더 열기, GitHub 로그인
- [x] 터미널: 위치 확인, 폴더·파일 만들기, 복사, 이동, 이름 변경, 삭제
- [x] 권한: 파일·폴더 권한 변경 전/후 비교
- [ ] Docker 설치·엔진 점검
- [ ] 이미지·컨테이너 실행, 목록, 로그, 리소스 확인, 중지
- [ ] hello-world 실행, ubuntu 컨테이너 attach/exec 비교
- [ ] Dockerfile로 커스텀 이미지 빌드
- [ ] 포트 매핑 접속 확인 (2회)
- [ ] 바인드 마운트: 파일 수정 전/후 확인
- [ ] 볼륨: 컨테이너 삭제 후 데이터 유지 확인
- [ ] 트러블슈팅 2건 이상 기록

## 4. 수행 기록

### 구역 1 - 준비 (Git, GitHub, VSCode)

1. Git 설치 확인

```
$ git --version
git version 2.53.0
```

2. Git 사용자 정보, 기본 브랜치 설정 확인

```
$ git config --list
user.email=302385656+jjin1990@users.noreply.github.com
user.name=jjin1990
init.defaultbranch=main
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
remote.origin.url=https://github.com/jjin1990/mission1.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
```

3. GitHub 저장소 연결 확인

```
$ git remote -v
origin  https://github.com/jjin1990/mission1.git (fetch)
origin  https://github.com/jjin1990/mission1.git (push)
```

4. 커밋, 푸시 기록 확인

```
$ git log --oneline
46e6eb8 (HEAD -> main, origin/main) README 목차, 개요, 실행 환경, 수행 체크리스트 추가
56a1d94 구역 2 터미널 조작 본문 기록
0839dd4 README 제목 추가
```

### 구역 2 - 터미널 조작

1. 현재 위치 확인

```
$ pwd
/home/shbm1/codyssey/mission1
```

2. 연습용 폴더 만들기

```
$ mkdir practice
$ ls -al
total 20
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 .
drwxr-xr-x 3 shbm1 shbm1 4096 Nov  8 19:23 ..
drwxr-xr-x 7 shbm1 shbm1 4096 Nov  8 20:13 .git
-rw-r--r-- 1 shbm1 shbm1   51 Nov  8 20:05 README.md
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:22 practice
```

3. 빈 파일 만들기

```
$ touch practice/memo.txt
$ ls -al
total 20
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 .
drwxr-xr-x 3 shbm1 shbm1 4096 Nov  8 19:23 ..
drwxr-xr-x 7 shbm1 shbm1 4096 Nov  8 20:13 .git
-rw-r--r-- 1 shbm1 shbm1   51 Nov  8 20:05 README.md
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:25 practice
$ la -al practice
total 8
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:25 .
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 ..
-rw-r--r-- 1 shbm1 shbm1    0 Nov  8 20:25 memo.txt
```

4. practice 폴더로 이동

```
$ cd practice
$ pwd
/home/shbm1/codyssey/mission1/practice
```

5. 파일에 한 줄 쓰기 + 내용 확인

```
$ echo 안녕 > memo.txt
$ cat memo.txt
안녕
```

6. 파일 복사

```
$ cp memo.txt memo_copy.txt
$ ls -al
total 16
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:38 .
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 ..
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:34 memo.txt
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:38 memo_copy.txt
$ cat memo_copy.txt
안녕
```

7. 파일 이름 변경

```
$ mv memo_copy.txt memo_renamed.txt
$ ls -al
total 16
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:41 .
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 ..
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:34 memo.txt
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:38 memo_renamed.txt
```

8. 다른 폴더로 이동

```
$ mkdir backup
$ mv memo_renamed.txt backup/
$ ls -al
total 16
drwxr-xr-x 3 shbm1 shbm1 4096 Nov  8 20:45 .
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 ..
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:45 backup
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:34 memo.txt
$ ls -al backup
total 12
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:45 .
drwxr-xr-x 3 shbm1 shbm1 4096 Nov  8 20:45 ..
-rw-r--r-- 1 shbm1 shbm1    7 Nov  8 20:38 memo_renamed.txt
```

9. 파일, 폴더 삭제

```
$ rm memo.txt
$ rm -r backup
$ ls -al
total 8
drwxr-xr-x 2 shbm1 shbm1 4096 Nov  8 20:49 .
drwxr-xr-x 4 shbm1 shbm1 4096 Nov  8 20:22 ..
```

## 5. 트러블슈팅

### 문제 1. Docker를 설치하려는데 WSL과 Ubuntu가 없음

- 상황: docker 명령이 실행되지 않았다. Docker Desktop을 설치하려고 보니 Docker가 쓰는 WSL 2와 리눅스 배포판(Ubuntu)도 설치돼 있지 않았다.
- 원인: Windows의 Docker Desktop은 WSL 2 위에서 리눅스 환경을 빌려 돌아가는데, 그 바탕이 준비되지 않은 상태였다.
- 해결: 관리자 PowerShell에서 `wsl --install`로 WSL을 설치하고, `wsl --install -d Ubuntu`로 Ubuntu를 설치한 뒤, Docker Desktop(WSL 2 기반)을 설치하고 실행했다.
- 배운 점: 프로그램이 안 될 때는 그 프로그램이 기대고 있는 바탕(WSL → Ubuntu → Docker)을 아래부터 차례로 확인해야 한다.

### 문제 2. code . 실행 시 'wsl.localhost' 허용 경고

- 상황: Ubuntu 터미널에서 `code .`로 작업 폴더를 VSCode에서 열려고 하자, "허용된 호스트 목록에서 'wsl.localhost'..." 경고 창이 떴다.
- 원인: VSCode에 WSL 확장이 없어서, 우분투 폴더를 WSL 연결이 아닌 Windows 네트워크 경로(`\\wsl.localhost`)로 열려고 했다.
- 해결: 경고는 취소하고 VSCode에 WSL 확장(게시자 Microsoft 확인)을 설치했다. 다시 `code .`을 실행하자 VS Code Server가 설치·업데이트된 뒤, 왼쪽 아래에 `WSL: Ubuntu`가 표시된 상태로 열렸다.
- 배운 점: 낯선 허용 창은 바로 누르지 말고 취소한 뒤 원인을 찾는다. 확장을 설치할 때는 게시자를 확인한다.

### 문제 3. git config --list 화면에서 Ctrl+Z를 눌러 Stopped

- 상황: `git config --list` 결과가 보기 화면(pager)으로 열렸는데, 실수로 `Ctrl+Z`를 눌러 `[1]+ Stopped git config --list`가 나오고 프롬프트로 돌아왔다.
- 원인: 리눅스 터미널에서 `Ctrl+Z`는 "되돌리기"가 아니라 실행 중인 프로그램을 일시 정지하고 뒤로 보내는 키다. 보기 화면은 `q`로 끝내야 한다.
- 해결: `jobs`로 멈춘 작업을 확인하고, `fg`로 다시 불러온 뒤 `q`로 종료했다. 다시 `jobs`를 쳐서 아무것도 나오지 않는 것을 확인했다.
- 배운 점: Windows 단축키가 터미널에서는 다르게 동작할 수 있다. 보기 화면(`(END)`, `~` 표시)은 `q`로 나간다.

```
$ git config --list
...
[1]+  Stopped                 git config --list
$ jobs
[1]+  Stopped                 git config --list
$ fg
(보기 화면에서 q)
$ jobs
$
```

### 문제 4. 띄어쓰기 실수로 명령이 다르게 읽힘

- 상황 ①: `git config -- global init.defaultBranch main`을 입력하자 `fatal: not in a git directory`가 나왔다.
- 상황 ②: `ls/mnt/...`처럼 명령과 경로를 붙여 쓰자 실행되지 않았다.
- 원인: 터미널은 띄어쓰기로 명령, 옵션, 대상을 나눈다. ①은 `--global`이 `--`와 `global`로 쪼개져 전역 설정이 아닌 현재 폴더의 Git 저장소 설정으로 읽혔고, ②는 `ls/mnt/...` 전체가 하나의 명령 이름으로 읽혔다.
- 해결: ①은 `--global`로 붙여서, ②는 `ls /mnt/...`로 띄어서 다시 입력했다.
- 배운 점: 옵션은 붙여 쓰고(`--global`), 명령과 대상 사이는 띄어 쓴다. 오류가 나면 먼저 띄어쓰기부터 확인한다.

```
$ git config -- global init.defaultBranch main
fatal: not in a git directory
$ git config --global init.defaultBranch main
$ git config --global init.defaultBranch
main
```

### 그 밖의 문제

| 문제 | 원인 | 해결 |
|---|---|---|
| GitHub 저장소 이름이 `-`로 만들어짐 | 키보드 입력 언어가 영어가 아니었음 | Settings → Rename으로 mission1로 변경 |
| 경로만 입력하자 `Is a directory` | 터미널은 맨 앞 단어를 명령으로 읽음 | 경로는 명령 뒤에 붙이는 대상으로 사용 |
| `ls` 대신 `la`로 쳤는데 실행됨 | Ubuntu 기본 별명 `la='ls -A'` | `alias la`로 정체 확인 |
| README 편집 중 Enter가 안 됨 | 한글 입력 조합이 꼬인 것으로 추정 | `Ctrl+Shift+P` → Developer: Reload Window |
| PowerShell에서 Ubuntu 명령 실행 | 창(프롬프트)을 착각함 | 프롬프트 `PS` 확인 후 `wsl`로 Ubuntu 진입 |
| user.email에 로그인 이메일을 먼저 넣음 | 보안을 위해 숨김 이메일을 쓰기로 함 | 커밋 전에 noreply 이메일로 다시 설정 후 확인 |

## 6. 검증 방법

| 확인한 것 | 확인 방법 | 결과 |
|---|---|---|
| Git 설정 | `git config --list` | 이름, noreply 이메일, 기본 브랜치 main 확인 |
| GitHub 연결·업로드 | `git remote -v`, `git log --oneline`, GitHub 웹 새로고침 | `origin/main`과 같은 커밋, 웹에서 README 확인 |
| 결과 없는 명령의 성공 | 바로 뒤에 `ls -al`, `pwd`, `cat`으로 확인 | 폴더·파일 생성, 이동, 내용, 삭제 확인 |
| 옵션 없는 폴더 삭제 (실험) | 일부러 `rm backup` 실행 | `Is a directory` 오류 → 폴더는 `rm -r` 필요함을 확인 |
| 빈 폴더와 Git (실험) | 빈 `practice`가 있는 상태에서 `git status` | `working tree clean` → Git은 빈 폴더를 기록하지 않음 |