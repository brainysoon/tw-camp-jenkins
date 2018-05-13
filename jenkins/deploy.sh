ssh -o stricthostkeychecking=no -i ./stage_icusin_ubuntu root@stage.icusin.com

cd /home/icusin/depoma

rm -r -f tw-camp-jenkins

git clone git@github.com:brainysoon/tw-camp-jenkins.git

cd tw-camp-jenkins/docker

docker build -t tw-camp-jenkins .

docker rm -f tw-camp-jenkins

docker run -p 4000:4000  tw-camp-jenkins