pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building the NimbusVault API...'
                bat 'docker build -t nimbusvault-api .'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                bat 'npm install'
                bat 'npm test'
            }
        }
        stage('Code Quality') {
            steps {
                echo 'Running code quality checks...'
                // Placeholder – integrate SonarQube or eslint here
            }
        }
        stage('Security Scan') {
            steps {
                echo 'Running security scan...'
                bat 'npm audit || exit 0'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying to test environment...'
                bat 'docker-compose up -d'
            }
        }
        stage('Release') {
            steps {
                echo 'Tagging release...'
                bat 'git config user.name "Dossier5"'
                bat 'git config user.email "lim_jono@hotmail.com"'
                bat 'git tag -a v1.0 -m "Release v1.0" || exit 0'
                bat 'git push origin --tags || exit 0'
            }
        }
        stage('Monitoring') {
            steps {
                echo 'Monitoring placeholder'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
        }
    }
}
