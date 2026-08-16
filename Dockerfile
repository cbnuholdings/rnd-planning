# R&D 기획 지원시스템 — 정적 프론트 서빙 (Railway)
#
# 이 저장소(cbnuholdings/rnd-planning)는 Vite 빌드 산출물 저장소다.
# Railway 는 Dockerfile 이 있으면 그것으로 빌드한다 — 별도 빌드 단계 없이 파일만 서빙하면 된다.
#
# 🔴 이 파일과 Caddyfile 은 `app\public\` 에 원본이 있다.
#    Vite 가 public\ 을 dist\ 로 복사하므로, 원본을 지우면 다음 재빌드 때 저장소에서 사라지고
#    Railway 빌드가 깨진다(CNAME 과 같은 함정).
FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY . /srv

# Railway 가 PORT 를 주입한다. Caddyfile 의 :{$PORT:8080} 이 받는다.
EXPOSE 8080

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
