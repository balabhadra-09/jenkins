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
            powershell '''
                $docker = "C:\\Users\\beher\\AppData\\Local\\Programs\\DockerDesktop\\resources\\bin\\docker.exe"

                $env:DOCKER_PASS | & $docker login -u $env:DOCKER_USER --password-stdin
                if ($LASTEXITCODE -ne 0) { exit 1 }

                & $docker tag "jenkins-demo:$env:BUILD_NUMBER" "$env:DOCKER_USER/jenkins-demo:$env:BUILD_NUMBER"
                if ($LASTEXITCODE -ne 0) { exit 1 }

                & $docker push "$env:DOCKER_USER/jenkins-demo:$env:BUILD_NUMBER"
                if ($LASTEXITCODE -ne 0) { exit 1 }
            '''
        }
    }
}



    }

}