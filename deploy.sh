chmod  400 ./stage_icusin_ubuntu

ssh -T -i ./stage_icusin_ubuntu -o StrictHostKeyChecking=no root@stage.icusin.com << stage-icusin-remote

echo start build

cd /home

if [ ! -d "tw-camp-jenkins" ];then
    git clone https://github.com/brainysoon/tw-camp-jenkins.git
fi

cd tw-camp-jenkins
git pull origin master

./gradlew build
stage-icusin-remote
echo end build

ssh -T -i ./stage_icusin_ubuntu -o StrictHostKeyChecking=no root@stage.icusin.com << stage-icusin-deploy

echo start deploy

cd /home/tw-camp-jenkins

cp build/libs/tw-camp-jenkins-1.0.0.jar docker/app.jar

cd docker

docker build -t tw-camp-jenkins .

docker rm -f tw-camp

docker run -d -p 4000:4000 --name='tw-camp' tw-camp-jenkins

stage-icusin-deploy

echo finish deploy