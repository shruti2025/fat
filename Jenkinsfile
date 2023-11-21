pipeline {
    agent any
    
    tools {
        maven 'MAVEN_HOME'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Stage 1: Checkout code from Git
                    checkout scm
                }
            }
        }
        
            stage('Clone Code') {
            steps {
                  // Stage 2: Clone code from GitHub
                git 'https://github.com/shruti2025/fat.git'
                echo 'Data Cloned Successfully'
            }
        }
        stage('Build Project') {
            steps {
                script{
                // Stage 3: Build Maven project
                bat 'mvn clean install'
            }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Stage 4: Build Docker image
                    // Define the Dockerfile location and tag for the image
                    def dockerImage = 'fataddaimg'
                    def dockerfile = 'fatadda/Dockerfile'
                    
                    // Build the Docker image
                    sh "docker build -t fataddaimg -f fatadda/Dockerfile ."
                    
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Stage 5: Push Docker image to repository
                    sh 'docker push shruti2025/fataddaimg:fataddaimg'
                }
            }
        }

        stage('Handle Errors') {
            steps {
                script {
                    // Stage 6: Handle errors
                    catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                        error 'Build failed! Check the logs for details.'
                    }
                }
            }
        }
    }
  
    
    
}
