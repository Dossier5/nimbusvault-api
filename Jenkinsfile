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
                bat '''
                git fetch --tags
                if git rev-parse v1.0 >nul 2>&1; then
                    echo "Tag v1.0 already exists, skipping tag creation."
                else
                    git config user.name "Dossier5"
                    git config user.email "lim_jono@hotmail.com"
                    git tag -a v1.0 -m "Release v1.0"
                    git push origin --tags
                fi
                '''
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
