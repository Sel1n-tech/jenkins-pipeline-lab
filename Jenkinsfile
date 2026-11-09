pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo '🛠️ Сборка на хост-машине...'
                sh 'uname -a' // Покажем, что мы на Linux-сервере
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Тестирование на хост-машине...'
            }
        }

        stage('Python Check in Docker') {
            agent {
                docker 'python:3.9-slim'
            }
            steps {
                echo '🐍 Этот этап выполняется ВНУТРИ контейнера Python 3.9!'
                sh 'python --version'
                sh 'pwd'
                sh 'ls -la'
            }
        }
    }
}