name="onnxruntime-gpu-bin"
gives="onnxruntime-gpu"
pkgname="onnxruntime-gpu"
_pkgname="onnxruntime"
repology=("project: onnxruntime-gpu")
version="1.14.1"
url="https://github.com/microsoft/onnxruntime/releases/download/v${version}/onnxruntime-linux-x64-gpu-${version}.tgz"
description="Cross-platform inference and training machine-learning accelerator with gpu support"
hash="3dbebaef94948be164b59f0274804443fa56cd902671b08b2144e73c43639a66"
maintainer="Zahrun <Zahrun@github.com>"
replace=("onnxruntime")
breaks=("onnxruntime-bin" "onnxruntime-1-7-0-bin")

install() {
  sudo install -Dm755 "lib/lib${_pkgname}.so.${version}" -t "${pkgdir}/usr/local/lib"
  sudo install -Dm755 "lib/lib${_pkgname}_"* -t "${pkgdir}/usr/local/lib"
  sudo install -Dm644 include/* -t "${pkgdir}/usr/local/include"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

postinst() {
  sudo rm -f "/usr/local/lib/lib${_pkgname}.so"
  sudo ln -sf "/usr/local/lib/lib${_pkgname}.so.${version}" "/usr/local/lib/lib${_pkgname}.so"
}

removescript() {
  sudo rm -f "/usr/local/lib/lib${_pkgname}.so"
}
