# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-to-tui@3.1.0
	anstream@0.6.13
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	anyhow@1.0.82
	arc-swap@1.7.1
	async-priority-channel@0.2.0
	autocfg@1.2.0
	backtrace@0.3.71
	base64@0.21.7
	base64@0.22.0
	better-panic@0.3.0
	bincode@1.3.3
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.5.0
	block-buffer@0.10.4
	bstr@1.9.1
	bumpalo@3.16.0
	bytemuck@1.15.0
	byteorder@1.5.0
	bytes@1.6.0
	cassowary@0.3.0
	castaway@0.2.2
	cc@1.0.95
	cfg-if@1.0.0
	chrono@0.4.38
	clap@4.5.4
	clap_builder@4.5.2
	clap_complete@4.5.2
	clap_complete_fig@4.5.0
	clap_complete_nushell@4.5.1
	clap_derive@4.5.4
	clap_lex@0.7.0
	clipboard-win@5.3.1
	color_quant@1.1.0
	colorchoice@1.0.0
	compact_str@0.7.1
	concurrent-queue@2.4.0
	console@0.15.8
	core-foundation-sys@0.8.6
	crc32fast@1.4.0
	crossbeam-channel@0.5.12
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	darling@0.20.8
	darling_core@0.20.8
	darling_macro@0.20.8
	deranged@0.3.11
	digest@0.10.7
	dirs-sys@0.4.1
	dirs@5.0.1
	either@1.11.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	erased-serde@0.4.4
	errno@0.3.8
	error-code@3.2.0
	event-listener@4.0.3
	exr@1.72.0
	fdeflate@0.3.4
	fdlimit@0.3.0
	filetime@0.2.23
	flate2@1.0.28
	flume@0.11.0
	fnv@1.0.7
	form_urlencoded@1.2.1
	fsevent-sys@4.1.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	getrandom@0.2.14
	gif@0.13.1
	gimli@0.28.1
	globset@0.4.14
	half@2.4.1
	hashbrown@0.14.3
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	ident_case@1.0.1
	idna@0.5.0
	image@0.24.9
	imagesize@0.12.0
	indexmap@2.2.6
	indoc@2.0.5
	inotify-sys@0.1.5
	inotify@0.9.6
	itertools@0.12.1
	itoa@1.0.11
	jpeg-decoder@0.3.1
	js-sys@0.3.69
	kamadak-exif@0.5.5
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.4.0
	lebe@0.5.2
	libc@0.2.153
	libredox@0.1.3
	line-wrap@0.2.0
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.21
	lru@0.12.3
	lua-src@546.0.2
	luajit-src@210.5.7+d06beb0
	malloc_buf@0.0.6
	md-5@0.10.6
	memchr@2.7.2
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	mio@0.8.11
	mlua-sys@0.5.2
	mlua@0.9.7
	mlua_derive@0.9.2
	mutate_once@0.1.1
	nom@7.1.3
	notify@6.1.1
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.18
	num_cpus@1.16.0
	num_threads@0.1.7
	objc@0.2.7
	object@0.32.2
	once_cell@1.19.0
	onig@6.4.0
	onig_sys@69.8.1
	option-ext@0.2.0
	ordered-float@2.10.1
	overload@0.1.1
	parking@2.2.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	percent-encoding@2.3.1
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	plist@1.6.1
	png@0.17.13
	powerfmt@0.2.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.81
	qoi@0.4.1
	quick-xml@0.31.0
	quote@1.0.36
	ratatui@0.26.1
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.4.1
	redox_users@0.4.5
	regex-automata@0.4.6
	regex-syntax@0.8.3
	regex@1.10.4
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustix@0.38.34
	rustversion@1.0.15
	ryu@1.0.17
	same-file@1.0.6
	scopeguard@1.2.0
	serde-value@0.7.0
	serde@1.0.198
	serde_derive@1.0.198
	serde_json@1.0.116
	serde_spanned@0.6.5
	sharded-slab@0.1.7
	shell-escape@0.1.5
	shell-words@1.1.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.2
	signal-hook-tokio@0.3.1
	signal-hook@0.3.17
	simd-adler32@0.3.7
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.6
	spin@0.9.8
	stability@0.1.1
	static_assertions@1.1.0
	strsim@0.10.0
	strsim@0.11.1
	strum@0.26.2
	strum_macros@0.26.2
	syn@1.0.109
	syn@2.0.60
	syntect@5.2.0
	thiserror-impl@1.0.59
	thiserror@1.0.59
	thread_local@1.1.8
	tiff@0.9.1
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tikv-jemallocator@0.5.4
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-stream@0.1.15
	tokio-util@0.7.10
	tokio@1.37.0
	toml@0.8.12
	toml_datetime@0.6.5
	toml_edit@0.22.12
	tracing-appender@0.2.3
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	trash@4.1.0
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.11
	url@2.5.0
	utf8parse@0.2.1
	uzers@0.11.3
	validator@0.18.1
	validator_derive@0.18.1
	valuable@0.1.0
	vergen@8.3.1
	version_check@0.9.4
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	weezl@0.1.8
	which@6.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows@0.44.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.6.6
	winsafe@0.0.19
	yazi-prebuild@0.1.2
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
	zune-inflate@0.2.54
"

inherit cargo desktop shell-completion xdg

DESCRIPTION="Blazing fast terminal file manager written in Rust, based on async I/O."
HOMEPAGE="https://yazi-rs.github.io/"
SRC_URI="
	https://github.com/sxyazi/yazi/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+cli"

QA_FLAGS_IGNORED="
	usr/bin/ya.*
"

DOCS=(
	README.md
)

src_prepare() {
	export YAZI_GEN_COMPLETIONS=true
	sed -i -r 's/strip\s+= true/strip = false/' Cargo.toml || die "Sed failed!"
	eapply_user
}

src_compile() {
	cargo_src_compile
	use cli && cargo_src_compile -p "${PN}-cli"
}

src_install() {
	dobin "$(cargo_target_dir)/${PN}"
	use cli && dobin "$(cargo_target_dir)/ya"

	newbashcomp "${S}/yazi-boot/completions/${PN}.bash" "${PN}"
	dozshcomp "${S}/yazi-boot/completions/_${PN}"
	dofishcomp "${S}/yazi-boot/completions/${PN}.fish"

	if use cli
	then
		newbashcomp "${S}/yazi-cli/completions/ya.bash" "ya"
		dozshcomp "${S}/yazi-cli/completions/_ya"
		dofishcomp "${S}/yazi-cli/completions/ya.fish"
	fi

	domenu "assets/${PN}.desktop"
	einstalldocs
}
