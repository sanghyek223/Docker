<h1> #Docker Centos / Nginx / PHP-FPM 7.4 / Systemctl 명령 사용 </h1>

# Docker build
docker build --rm --no-cache -t {이미지네임} .


# Docker run (--privileged 옵션사용)
docker run --privileged --name {컨테이너명} -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /log:/var/log -v {프로젝트경로}:{컨테이너경로} -p 80:80 -d  {빌드시 지정한 이미지}


# DB 연결시 Network 연결
docker network connect {네트워크명} {연결할컨테이너명}