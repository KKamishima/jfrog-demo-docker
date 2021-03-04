node {
    stage('checkout') {
        git branch: 'main', url: 'https://github.com/KKamishima/jfrog-demo-docker.git'
    }
    
    stage('build') {
        def atag = '3.10.0'
        // def atag = 'latest'

        def server = Artifactory.server 'mnckk2'
        def rtDocker = Artifactory.docker server: server
        def buildInfo = Artifactory.newBuildInfo()

        def tag = 'mnckk2.jfrog.io/docker-virtual/say-fortune:latest'

        // method 1: pull FROM image using docker with credential
        docker.withRegistry('https://mnckk2.jfrog.io', 'mnckk2') {
            docker.build tag
        }

/*
        // method 2: pull FROM image using Artfactory Docker Plug-in
        rtDocker.pull "mnckk2.jfrog.io/docker-virtual/alpine:${atag}", 'docker-virtual', buildInfo
        // docker.image(src).tag(target) does not work here
        // cf. https://issues.jenkins.io/browse/JENKINS-53866
        sh "docker tag mnckk2.jfrog.io/docker-virtual/alpine:${atag} alpine:${atag}"
        docker.build tag
*/

        rtDocker.push tag, 'docker-virtual', buildInfo
        server.publishBuildInfo buildInfo
    }
}
