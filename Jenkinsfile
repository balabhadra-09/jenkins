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
                echo "running testing.."
            }
        }

        stage('Deploying') {
            steps {
                echo "deploying.."
            }
        }

       
stage('Docker Build') {
    steps {
        bat '"C:\\Users\\beher\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" build -t jenkins-demo:%BUILD_NUMBER% .'
    }
}

stage('Docker Test') {
    steps {
        bat '"C:\\Users\\beher\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" run --rm jenkins-demo:%BUILD_NUMBER%'
    }
}



stage('Docker Hub Push') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            bat '''
                "C:\\Users\\beher\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe" login -u "%DOCKER_USER%" --password-stdin < nul
            '''
        }
    }
}



    }

}