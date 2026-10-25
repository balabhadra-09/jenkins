
pipeline {
    agent any

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
                sh 'docker build -t jenkins-app:${BUILD_NUMBER} .'
            }
        }
    }
}
