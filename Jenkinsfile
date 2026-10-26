pipeline {
    agent any

    environment {
        PATH = "C:\\Users\\beher\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin;${env.PATH}"
    }

    stages {
        stage('Build Number') {
            steps {
                echo "Build Number: ${BUILD_NUMBER}"
            }
        }

        stage('test') {
            steps {
                echo "running testing...."
            }
        }

        stage('Deploying') {
            steps {
                echo "deploying.."
            }
        }

        stage('Docker-Build') {
            steps {
                echo "Building Docker Image...."
                bat "docker build -t jenkins-app:%BUILD_NUMBER% ."
            }
        }

        stage('Docker-Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_TOKEN'
                )]) {
                    bat '''
                        echo %DOCKER_TOKEN%| docker login -u %DOCKER_USER% --password-stdin
                        docker tag jenkins-app:%BUILD_NUMBER% balabhadra12/jenkins-app:%BUILD_NUMBER%
                        docker push balabhadra12/jenkins-app:%BUILD_NUMBER%
                        docker logout
                    '''
                }
            }
        }
    }
}