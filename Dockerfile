# 빌드 컨텍스트: docker build 명령 끝의 .(저장소 맨 위 폴더)가 재료 폴더다. COPY는 이 폴더 안의 파일만 가져올 수 있다.
# 캐시: 위에서부터 한 줄씩 층(레이어)을 만들고, 바뀌지 않은 줄은 이전 결과를 재사용(CACHED)한다. 그래서 자주 바뀌는 COPY는 아래, 잘 안 바뀌는 FROM은 위에 둔다.

# 베이스: 웹 서버가 이미 들어 있고 작고 가벼운 nginx:alpine
FROM nginx:alpine

# 이미지에 만든 사람과 설명을 기록
LABEL maintainer="jjin1990" description="Codyssey mission1 custom nginx"

# 직접 쓴 웹 페이지를 nginx가 보여 주는 폴더로 복사 (공식 문서 경로)
COPY app/ /usr/share/nginx/html/

# nginx가 컨테이너 안에서 기다리는 포트(공식 문서로 확인한 80)를 문서로 표시
EXPOSE 80