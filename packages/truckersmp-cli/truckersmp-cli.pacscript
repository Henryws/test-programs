name="truckersmp-cli"
pkgname="truckersmp-cli"
version=0.10.0
repology=("project: truckersmp-cli")
breaks=("${pkgname}-git")
gives="truckersmp-cli"
description="A simple launcher to play ATS and ETS2 with Multiplayer through TruckersMP."
url="https://github.com/truckersmp-cli/truckersmp-cli/archive/refs/tags/${version}.tar.gz"
hash="04a656ab5e94b0b75b2752a5d071fc410b20e0f948a4ff83bb0b636de7cc7cd5"
maintainer="badlydrawnface <bdface@proton.me>"
build_depends=("python3-setuptools" "gcc-mingw-w64" "libsdl2-dev")
depends=("python3" "libsdl2-2.0-0")
optdepends=(
  "python3-vdf: automatic steam account detection"
  "python3-setuptools: get version information"
  "steam: possibility to use proton"
  "wine: possibility to use wine"
)

build() {
  make
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  sudo install -Dm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  sudo install -Dm644 "_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
