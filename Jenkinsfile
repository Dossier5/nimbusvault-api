pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the NimbusVault API...'
                sh 'docker build -t nimbusvault-api .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'npm install'
                sh 'npm test'
            }
        }
        stage('Code Quality') {
            steps {
                echo 'Running code quality checks...'
                // Placeholder for sonar-scanner or eslint
            }
        }
        stage('Security Scan') {
            steps {
                echo 'Running security scan...'
                sh 'npm audit || true'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to test environment...'
                sh 'docker-compose up -d'
            }
        }
        stage('Release') {
            steps {
                echo 'Tagging release...'
                sh 'git tag -a v1.0 -m "Release v1.0" || true'
                sh 'git push origin --tags || true'
            }
        }
        stage('Monitoring') {
            steps {
                echo 'Monitoring placeholder - implement uptime check or Prometheus.'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
    }
}
