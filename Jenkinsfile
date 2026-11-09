@Library('os-build-lib') _

pipeline {
    agent any

    parameters {
        choice(
            name: 'RELEASE_VERSION', 
            choices: ['1.0.0-beta', '1.0.0-rc', '1.0.0-stable'], 
            description: 'Выберите версию релиза для всех сборок'
        )
    }

    stages {
        stage('Parallel OS Builds') {
            // Блок parallel запускает вложенные этапы ОДНОВРЕМЕННО
            parallel {
                stage('Build Ubuntu') {
                    steps {
                        echo "🐧 Запуск сборки Ubuntu в параллельном потоке..."
                        buildMiniOs([
                            osType: 'ubuntu-24.04',
                            releaseVersion: params.RELEASE_VERSION,
                            imageName: 'my-mini-os'
                        ])
                    }
                }
                stage('Build Alpine') {
                    steps {
                        echo "🏔️ Запуск сборки Alpine в параллельном потоке..."
                        buildMiniOs([
                            osType: 'alpine-3.18',
                            releaseVersion: params.RELEASE_VERSION,
                            imageName: 'my-mini-os'
                        ])
                    }
                }
            }
        }
    }
}