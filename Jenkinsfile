pipeline {
    agent any
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/kavyamkkm/devops-automation']]])
                // To run Maven on a Windows agent, use
                bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
            stage('Build docker image')
            {
                steps
                {
                    script
                    {
                        bat "docker build -t kavyamk0905/devops-integration ."
                    }
                }
            }
  stage('Push image to Hub') {
    steps {
        script {
            withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                bat """
                    echo %dockerhubpwd% | docker login -u kavyamk0905 --password-stdin
                    docker push kavyamk0905/devops-integration
                """
            }
        }
    }
}


                        
     }
}
