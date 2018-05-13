./gradlew build

cp build/libs/2018-04-02-01-27-37-1522632457.jar docker/app.jar

tar -czvf tw-camp-jenkins.tar.gz docker/

scp -i ./stage_icusin_ubuntu ./tw-camp-jenkins.tar.gz root@stage.icusin.com:/home/

chmod  400 ./stage_icusin_ubuntu

ssh -i ./stage_icusin_ubuntu -o StrictHostKeyChecking=no root@stage.icusin.com << stage-icusin-remote

cd /home

rm -r -f docker

tar -zxvf tw-camp-jenkins.tar.gz

cd docker

docker build -t tw-camp-jenkins .

docker rm -f tw-camp

docker run -d -p 4000:4000 --name='tw-camp' tw-camp-jenkins

stage-icusin-remote

echo finish deploy