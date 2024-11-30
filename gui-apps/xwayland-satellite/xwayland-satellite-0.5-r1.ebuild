# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	anstream@0.6.17
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.9
	bindgen@0.69.5
	bitflags@1.3.2
	bitflags@2.6.0
	cc@1.1.31
	cexpr@0.6.0
	cfg-if@1.0.0
	clang-sys@1.8.1
	colorchoice@1.0.3
	cursor-icon@1.1.0
	dlib@0.5.2
	downcast-rs@1.2.1
	either@1.13.0
	env_filter@0.1.2
	env_logger@0.10.2
	env_logger@0.11.5
	errno@0.3.9
	glob@0.3.1
	hermit-abi@0.4.0
	home@0.5.9
	humantime@2.1.0
	io-lifetimes@2.0.3
	is-terminal@0.4.13
	is_terminal_polyfill@1.70.1
	itertools@0.12.1
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.161
	libloading@0.8.5
	linux-raw-sys@0.4.14
	log@0.4.22
	memchr@2.7.4
	memmap2@0.9.5
	minimal-lexical@0.2.1
	nom@7.1.3
	once_cell@1.20.2
	paste@1.0.15
	pkg-config@0.3.31
	pretty_env_logger@0.5.0
	prettyplease@0.2.25
	proc-macro2@1.0.89
	quick-xml@0.30.0
	quick-xml@0.36.2
	quote@1.0.37
	regex-automata@0.4.8
	regex-syntax@0.8.5
	regex@1.11.1
	rustc-hash@1.1.0
	rustix@0.38.38
	scoped-tls@1.0.1
	sd-notify@0.4.3
	shlex@1.3.0
	slotmap@1.0.7
	smallvec@1.13.2
	smithay-client-toolkit@0.19.2
	syn@2.0.85
	termcolor@1.4.1
	thiserror-impl@1.0.65
	thiserror@1.0.65
	unicode-ident@1.0.13
	utf8parse@0.2.2
	version_check@0.9.5
	wayland-backend@0.3.7
	wayland-client@0.31.7
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.7
	wayland-protocols-wlr@0.3.5
	wayland-protocols@0.31.2
	wayland-protocols@0.32.5
	wayland-scanner@0.31.5
	wayland-server@0.31.6
	wayland-sys@0.31.5
	which@4.4.2
	winapi-util@0.1.9
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	xcb-util-cursor-sys@0.1.4
	xcb-util-cursor@0.3.3
	xcb@1.4.0
	xcursor@0.3.8
	xkeysym@0.2.1
"

LLVM_COMPAT=( {17..19} )
RUST_NEEDS_LLVM=1

inherit llvm-r1 cargo

DESCRIPTION="Xwayland outside your Wayland"
HOMEPAGE="https://github.com/Supreeeme/xwayland-satellite"
SRC_URI="
	https://github.com/Supreeeme/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MPL-2.0"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD ISC MIT Unicode-DFS-2016 ZLIB"
SLOT="0"
KEYWORDS="~amd64"

# disable tests which need a running display server
RESTRICT="test"

DEPEND="
	>=x11-base/xwayland-23.1
	x11-libs/libxcb
	x11-libs/xcb-util-cursor
"
RDEPEND="${DEPEND}"
BDEPEND="
	$(llvm_gen_dep 'sys-devel/clang:${LLVM_SLOT}=')
"

QA_FLAGS_IGNORED="usr/bin/${PN}"

DOCS=( README.md )

pkg_setup() {
	llvm-r1_pkg_setup
	rust_pkg_setup
}

src_install() {
	cargo_src_install
	einstalldocs
}
