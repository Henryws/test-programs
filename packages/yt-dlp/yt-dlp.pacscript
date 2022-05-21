name="yt-dlp"
repology=("project: ${name}")
version="2022.04.08"
url="https://github.com/${name}/${name}/archive/refs/tags/${version}.tar.gz"
build_depends="make pandoc zip python3-pytest python3-setuptools"
optdepends=("mpv: For downloading rstp streams")
depends="python3 ffmpeg python3-mutagen python3-pip python3-websockets python3-secretstorage python3-brotli python3-certifi python3-xattr atomicparsley rtmpdump"
breaks="${name}-git ${name}-bin ${name}"
description="A youtube-dl fork with additional features and fixes"
hash="0e427a4df804787e1543a0ca42436564f0122d7a38b8712089ebd31cce39c224"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo pip3 install --upgrade pycryptodomex
}

build() {
  make -j"$(nproc)" pypi-files
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}

removescript() {
  sudo pip3 uninstall pycryptodomex
}