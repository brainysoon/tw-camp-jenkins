cp build/libs/*.jar docker

cd docker

docker build -t tw-camp-jenkins .

docker run -p 4000:4000  tw-camp-jenkins