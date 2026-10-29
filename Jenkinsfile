pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Source Code Integration') {
            steps {
                echo 'Source code retrieved from GitHub'
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo 'Checking Python application syntax'
                sh 'python3 -m compileall -q app.py test_app.py'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated unit tests'
                sh 'python3 -m unittest -v'
            }
        }

        stage('Terraform Init and Validate') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform validate'
            }
        }

        stage('Infrastructure Provisioning') {
            steps {
                sh 'terraform plan -input=false -out=tfplan'
                sh 'terraform apply -input=false -auto-approve tfplan'
            }
        }

        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully'
        }
        failure {
            echo 'Pipeline failed. Check Console Output.'
        }
    }
}
