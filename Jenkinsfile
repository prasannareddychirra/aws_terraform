pipeline {
    agent any
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/prasannareddychirra/aws_terraform'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "docker Build"'
            }
        }

        stage('Test') {
            steps {
                script {
                    sh '''
                        docker ps || true
                        pwd
                        ls -lrt
                        whoami
                    '''
                }
            }
        }

        stage('Package') {
            steps {
                sh 'docker build -t jenkins-docker .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker push https://hub.docker.com/prasi0111/jenkins'
            }
        }
    }

    post {
        success {
            echo 'Pipeline succeeded! You may want to perform additional steps here.'
        }
        failure {
            echo 'Pipeline failed! You may want to handle failures gracefully.'
        }
    }
}
