pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh './gradlew build'
                archiveArtifacts artifacts: '**/build/libs/*.jar', fingerprint: true
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh './gradlew test || true'
            }
        }
        stage('Deploy') {
            agent 'docker'
            when {
                expression {
                    currentBuild.result == null || currentBuild.result == 'SUCCESS'
                }
            }
            steps {
                echo 'Deploying..'
                sh './deploy.sh'
            }
        }
    }
}