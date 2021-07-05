r<h1> #Docker Centos7 / Nginx / PHP-FPM 7.4 / Systemctl 명령 사용 </h1>

# Docker build
docker build --rm --no-cache -t {이미지네임} . 

# Docker run (--privileged 옵션사용)
docker run --privileged --name {컨테이너명} -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v {nginx/log 파일경로}:/var/log/nginx -p 80:80 -d  {빌드시 지정한 이미지}

# DB 연결시 Network 연결
docker network connect {네트워크명} {연결할컨테이너명}

# Docker Terminal color
docker exec -ti {컨테이너명} tty

# 컨테이너 리모트 Git Config & Git Clone
git config --global user.name "{name}"
git config --global user.email "{email}"
git clone {clone url}

# Nginx default.conf root 경로수정

# Laravel clone 시 .env 파일 생성 후
php artisan key:generate

# Laravel 실행시 Permission Error
chown -R nginx:nginx storage bootstrap/cache