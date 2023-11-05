pipeline {
    agent any
    parameters {
        choice(name: 'action', choices: ['apply', 'destroy'], description: 'select action')
    }
    stages {
        stage('Terraform Init'){
            steps{
                sh "terraform init"
            }
        }
        stage('Terraform Apply'){
            steps{
                script{
                    if (params.action == 'apply') {   
                        sh "terraform apply -auto-approve"
                    } else {
                        sh "terraform destroy -auto-approve"
                    }
                }
            }
        }

    }
}
