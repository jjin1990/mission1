# 내 컴퓨터에 개발자용 작업실 꾸미기

## 구역 2 - 터미널 조작

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