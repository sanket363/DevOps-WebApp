pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'your-docker-registry' // Replace with your Docker registry URL
        DOCKER_IMAGE = 'mywebsite:latest' // Replace with your Docker image name and tag
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'your-repo-url' // Replace with your Git repository URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://${DOCKER_REGISTRY}', 'dockerhub-credentials') {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f Deployment.yaml"
                    sh "kubectl apply -f Service.yaml"
                }
            }
        }
    }
}

