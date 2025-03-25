# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.3

EAPI=8

CARGO_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{11..13} )  # needs pyo3 crate bump for pypy3_11

CRATES="
	aes@0.8.4
	autocfg@1.4.0
	block-buffer@0.10.4
	cfg-if@1.0.0
	cipher@0.4.4
	core2@0.4.0
	cpufeatures@0.2.14
	crypto-common@0.1.6
	digest@0.10.7
	generic-array@0.14.7
	getrandom@0.2.15
	glass_pumpkin@1.7.0
	grammers-crypto@0.7.0
	heck@0.5.0
	hmac@0.12.1
	indoc@2.0.5
	inout@0.1.3
	libc@0.2.159
	memchr@2.7.4
	memoffset@0.9.1
	num-bigint@0.4.6
	num-integer@0.1.46
	num-traits@0.2.19
	once_cell@1.20.2
	pbkdf2@0.12.2
	portable-atomic@1.9.0
	proc-macro2@1.0.87
	pyo3-build-config@0.22.4
	pyo3-ffi@0.22.4
	pyo3-macros-backend@0.22.4
	pyo3-macros@0.22.4
	pyo3@0.22.4
	quote@1.0.37
	rand@0.8.5
	rand_core@0.6.4
	sha1@0.10.6
	sha2@0.10.8
	subtle@2.6.1
	syn@2.0.79
	target-lexicon@0.12.16
	typenum@1.17.0
	unicode-ident@1.0.13
	unindent@0.2.3
	version_check@0.9.5
	wasi@0.11.0+wasi-snapshot-preview1
"

inherit cargo distutils-r1 pypi

DESCRIPTION="Cryptographic utilities for Telegram"
HOMEPAGE="
	https://pypi.org/project/cryptg/
	https://github.com/cher-nov/cryptg/
"
SRC_URI+=" ${CARGO_CRATE_URIS}"

LICENSE="CC0-1.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="dev-python/setuptools-rust[${PYTHON_USEDEP}]"

# rust does not use *FLAGS from make.conf, silence portage warning
QA_FLAGS_IGNORED=".*"

distutils_enable_tests import-check

src_unpack() {
	cargo_src_unpack
}
