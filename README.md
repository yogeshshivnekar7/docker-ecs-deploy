# docker-ecs-deploy
docker-ecs-deploy

################################################################

Docker-ecr Job Name


Execute Shell
docker build -t 302238252373.dkr.ecr.ap-south-1.amazonaws.com/myapp:${GIT_COMMIT} .
aws ecr get-login-password --profile yogesh5 | docker login --username AWS --password-stdin 302238252373.dkr.ecr.ap-south-1.amazonaws.com
docker push 302238252373.dkr.ecr.ap-south-1.amazonaws.com/myapp:${GIT_COMMIT}

Post-build actions

build triggers
project to deploy --- > docker-ecs-deploy,
trigger when build --> stable
Parameters --- >  MYAPP_VERSION=${GIT_COMMIT}




docker-ecs-deploy  Job name

String Parameters 
Name ---> MYAPP_VERSION


Execute Shell
terraform apply -auto-approve -var MYAPP_SERVICE_ENABLE=1 -var MYAPP_VERSION=${MYAPP_VERSION}
