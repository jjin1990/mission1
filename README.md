# 내 컴퓨터에 개발자용 작업실 꾸미기

## 1. 개요

경남 코디세이 AI 올인원 1기 입학연수 미션1 「내 컴퓨터에 개발자용 작업실 꾸미기」의 수행 기록입니다.

이 미션은 로컬(내 컴퓨터)에 터미널, DOcker, Git으로 개발 환경(작업실)을 만들고, 그 과정을 명령어와 결과로 기록해 **누구나 같은 방법으로 실행하고 확인할 수 있게** 하는 것입니다.

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
- [ ] 권한: 파일·폴더 권한 변경 전/후 비교
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

## 6. 검증 방법