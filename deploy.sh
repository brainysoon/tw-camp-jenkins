cp build/libs/2018-04-02-01-27-37-1522632457.jar docker/app.jar

docker rmi -f tw-camp-jenkins

cd docker

docker build -t tw-camp-jenkins .

docker run -p 4000:4000  tw-camp-jenkins