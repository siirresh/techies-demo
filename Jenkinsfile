pipeline {
    agent any
      tools {
    maven 'Maven3'
    }
    environment {
        registry = "044933909280.dkr.ecr.us-east-1.amazonaws.com/sample-repo"
    }
 
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/siirresh/sample-demo.git']])
            }
        }
            stage ("Build JAR") {
            steps {
                sh "mvn clean install"
            }
        }
            stage ("Build Image") {
            steps {
                script {
            customimage = docker.build("044933909280.dkr.ecr.us-east-1.amazonaws.com/sample-repo:${BUILD_NUMBER}")
                    //dockerimage = docker.build registry
                    //dockerimage.tag("$BUILD_NUMBER")
                }
            }
        }
        stage ("Push to ECR") {
            steps {
                script {
                    sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 044933909280.dkr.ecr.us-east-1.amazonaws.com"
                    sh "docker push 044933909280.dkr.ecr.us-east-1.amazonaws.com/sample-repo:$BUILD_NUMBER"

                }
            }
        }
  }
}
