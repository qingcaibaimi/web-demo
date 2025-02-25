pipeline{
    agent any
    environment {
        WS = "${WORKSPACE}"
        REGISTRY= "registry.cn-hangzhou.aliyuncs.com"
        IMAGE_NAME = "registry.cn-hangzhou.aliyuncs.com/xgq-dockerimages/tomcat-test:${env.BUILD_ID}"
        K8S_NAMESPACE = "dev"
        TOMCAT_VERSION = "tomcattest-deploy-v${env.BUILD_ID}"
    }

    //定义流水线的加工流程
    stages {
        //流水线的所有阶段
        stage('step1:env check'){
            steps {
               sh 'pwd && ls -alh'
               sh 'printenv'
               sh 'docker version'
               sh 'java -version'
               sh 'git --version'
            }
        }

        stage('step2:build image'){
            steps {
               sh 'cp /opt/dockerfile/apache-tomcat-9.0.96.tar.gz .'
               sh 'cp /opt/dockerfile/jdk-8u411-linux-x64.tar.gz .'
               sh 'pwd && ls -alh'
               sh 'docker build -t ${IMAGE_NAME} .'
            }
        }
    }
}
