name="notion-app-enhanced-deb"
pkgname="notion-app-enhanced"
repology=("project: ${pkgname}")
version="2.0.18-1"
url="https://github.com/notion-enhancer/notion-repackaged/releases/download/v${version}/${pkgname}_${version}_amd64.deb"
breaks=("${pkgname}-app" "notion-app-deb" "notion-app-app")
replace=("${pkgname}")
gives="${pkgname}"
description="The all-in-one workspace for your notes and tasks, but enhanced"
hash="b4c2b63eff8c93201ce6ddfef9b0cbd53a3fb7cec9fcd01e3a877d4a9c943bfc"
arch=('amd64')
maintainer="IOplus <issa20omais@outlook.com>"
