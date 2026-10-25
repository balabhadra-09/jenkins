
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

        
stage('Docker-Run') {
    steps {
        echo "Running Docker Container..."
        sh '''
            docker rm -f jenkins-app-container || true
            docker run -d --name jenkins-app-container -p 8081:80 jenkins-app:${BUILD_NUMBER}
        '''
    }
}


        
    }
}
