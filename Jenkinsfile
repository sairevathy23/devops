pipeline{
  agent any
  environment {
     PATH = "${PATH}:${getTerraformPath()}"
    }

  stages {
    stage('terraform init'){
      steps{
        dir("terraform/ec2_creation"){
        sh returnStatus: true, script: 'terraform workspace new dev'
        sh "terraform init"
        sh "terraform apply -auto-approve" 
      }
    }
   }
  
    stage('terraform destroy'){
      steps{
        dir("terraform/ec2_creation"){
        sh returnStatus: true, script: 'terraform workspace select dev'
        sh "terraform destroy -auto-approve"
      }
    }
   }
 }
}

def getTerraformPath(){
    def tfHome = tool name: 'tf-jen-ans', type: 'terraform'
    return tfHome
}
