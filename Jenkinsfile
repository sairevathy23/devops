pipeline{
  agent any
  environment {
     PATH = "${PATH}:${getTerraformPath()}"
    }

  stages {
    stage('terraform init'){
      steps{
        sh "returnStatus: true, script: 'terraform workspace new dev'"
        sh "terraform init"
        sh "terraform apply -auto-approve"
    }
   }
  }
}

def getTerraformPath(){
    def tfHome = tool name: 'tf-jen-ans', type: 'terraform'
    return tfHome
}
