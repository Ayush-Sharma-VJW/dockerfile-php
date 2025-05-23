pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ayu199sh/fullstack-php-app'
        DOCKERHUB_CREDENTIALS = credentials('docker-cred')
    }

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'develop', url: 'https://github.com/Ayush-Sharma-VJW/dockerfile-php'
            }
        }

        stage('Verify Dockerfile') {
            steps {
                sh 'ls -l Dockerfile'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    withDockerRegistry([ credentialsId: 'docker-cred', url: '' ]) {
                        sh "docker push $IMAGE_NAME"
                    }
                }
            }
        }
    }
}
