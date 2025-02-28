# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ab_glyph@0.2.23
	ab_glyph_rasterizer@0.1.8
	addr2line@0.21.0
	adler@1.0.2
	aes-ctr@0.6.0
	aes-soft@0.6.4
	aes@0.6.0
	aesni@0.10.0
	ahash@0.8.6
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	alsa-sys@0.3.1
	alsa@0.6.0
	android-activity@0.5.0
	android-properties@0.2.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi_colours@1.2.2
	anstream@0.6.5
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.4
	anyhow@1.0.75
	array-init@2.1.0
	arrayref@0.3.7
	arrayvec@0.7.4
	as-raw-xcb-connection@1.0.0
	async-stream-impl@0.3.5
	async-stream@0.3.5
	async-trait@0.1.74
	atomic-waker@1.1.2
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.13.1
	base64@0.21.5
	bindgen@0.69.1
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.4.1
	block-buffer@0.10.4
	block-buffer@0.9.0
	block-sys@0.2.0
	block2@0.3.0
	block@0.1.6
	bumpalo@3.14.0
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	calloop-wayland-source@0.2.0
	calloop@0.12.3
	cassowary@0.3.0
	cc@1.0.83
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-expr@0.15.5
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	chrono@0.4.31
	cipher@0.2.5
	clang-sys@1.6.1
	clap@4.4.11
	clap_builder@4.4.11
	clap_complete@4.4.4
	clap_derive@4.4.7
	clap_lex@0.6.0
	clipboard-win@3.1.1
	cocoa-foundation@0.1.2
	cocoa@0.24.1
	color_quant@1.1.0
	colorchoice@1.0.0
	combine@4.6.6
	concurrent-queue@2.4.0
	config_parser2@0.1.5
	config_parser_derive@0.1.3
	console@0.15.7
	copypasta@0.10.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.22.3
	core-graphics@0.23.1
	coreaudio-rs@0.10.0
	coreaudio-sys@0.2.14
	cpal@0.13.5
	cpufeatures@0.2.11
	crc32fast@1.3.2
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	crypto-mac@0.11.1
	ctr@0.6.0
	cursor-icon@1.1.0
	daemonize@0.5.0
	darling@0.13.4
	darling_core@0.13.4
	darling_macro@0.13.4
	dbus-crossroads@0.5.2
	dbus@0.9.7
	deranged@0.3.10
	digest@0.10.7
	digest@0.9.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dispatch@0.2.0
	dlib@0.5.2
	downcast-rs@1.2.0
	either@1.9.0
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	enum_dispatch@0.3.12
	env_logger@0.10.1
	equivalent@1.0.1
	errno@0.3.8
	exr@1.71.0
	fastrand@2.0.1
	fdeflate@0.3.1
	fixedbitset@0.4.2
	flate2@1.0.28
	flume@0.11.0
	fnv@1.0.7
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	form_urlencoded@1.2.1
	futf@0.1.5
	futures-channel@0.3.29
	futures-core@0.3.29
	futures-executor@0.3.29
	futures-io@0.3.29
	futures-macro@0.3.29
	futures-sink@0.3.29
	futures-task@0.3.29
	futures-util@0.3.29
	futures@0.3.29
	generic-array@0.14.7
	gethostname@0.3.0
	getrandom@0.2.11
	gif@0.12.0
	gimli@0.28.1
	glib-macros@0.15.13
	glib-sys@0.15.10
	glib@0.15.12
	glob@0.3.1
	gobject-sys@0.15.10
	gstreamer-app-sys@0.18.0
	gstreamer-app@0.18.7
	gstreamer-audio-sys@0.18.3
	gstreamer-audio@0.18.7
	gstreamer-base-sys@0.18.0
	gstreamer-base@0.18.0
	gstreamer-sys@0.18.0
	gstreamer@0.18.8
	h2@0.3.22
	half@2.2.1
	hashbrown@0.12.3
	hashbrown@0.14.3
	headers-core@0.2.0
	headers@0.3.9
	heck@0.4.1
	hermit-abi@0.3.3
	hmac@0.11.0
	hostname@0.3.1
	html5ever@0.26.0
	http-body@0.4.6
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper-proxy@0.9.1
	hyper-tls@0.5.0
	hyper@0.14.27
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.58
	icrate@0.0.4
	ident_case@1.0.1
	idna@0.5.0
	if-addrs@0.7.0
	image@0.24.7
	indexmap@1.9.3
	indexmap@2.1.0
	indoc@2.0.4
	instant@0.1.12
	ipnet@2.9.0
	is-terminal@0.4.9
	itertools@0.11.0
	itoa@1.0.10
	jack-sys@0.2.2
	jack-sys@0.4.0
	jack@0.10.0
	jack@0.8.3
	jni-sys@0.3.0
	jni@0.19.0
	jni@0.21.1
	jobserver@0.1.27
	jpeg-decoder@0.3.0
	js-sys@0.3.66
	lazy-bytes-cast@5.0.1
	lazy_static@1.4.0
	lazycell@1.3.0
	lebe@0.5.2
	lewton@0.10.2
	libc@0.2.151
	libdbus-sys@0.2.5
	libloading@0.6.7
	libloading@0.7.4
	libloading@0.8.1
	libm@0.2.8
	libmdns@0.7.5
	libpulse-binding@2.28.1
	libpulse-simple-binding@2.28.1
	libpulse-simple-sys@1.21.1
	libpulse-sys@1.21.0
	libredox@0.0.1
	libredox@0.0.2
	librespot-audio@0.4.2
	librespot-connect@0.4.2
	librespot-core@0.4.2
	librespot-discovery@0.4.2
	librespot-metadata@0.4.2
	librespot-playback@0.4.2
	librespot-protocol@0.4.2
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.12
	lock_api@0.4.11
	log@0.4.20
	lru@0.12.1
	mac-notification-sys@0.6.1
	mac@0.1.1
	mach@0.3.2
	make-cmd@0.1.0
	malloc_buf@0.0.6
	markup5ever@0.11.0
	markup5ever_rcdom@0.2.0
	match_cfg@0.1.0
	matchers@0.1.0
	maybe-async@0.2.7
	memchr@2.6.4
	memmap2@0.9.0
	memoffset@0.6.5
	memoffset@0.7.1
	memoffset@0.9.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.10
	muldiv@1.0.1
	multimap@0.8.3
	nanorand@0.7.0
	native-tls@0.2.11
	ndk-context@0.1.1
	ndk-glue@0.6.2
	ndk-macro@0.3.0
	ndk-sys@0.3.0
	ndk-sys@0.5.0+25.2.9519653
	ndk@0.6.0
	ndk@0.8.0
	new_debug_unreachable@1.0.4
	nix@0.23.2
	nix@0.26.4
	nom@7.1.3
	notify-rust@4.10.0
	nu-ansi-term@0.46.0
	num-bigint@0.4.4
	num-derive@0.3.3
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.17
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum@0.7.1
	num_enum_derive@0.5.11
	num_enum_derive@0.7.1
	objc-foundation@0.1.1
	objc-sys@0.3.2
	objc2-encode@3.0.0
	objc2@0.4.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.32.1
	oboe-sys@0.4.5
	oboe@0.4.6
	ogg@0.8.0
	once_cell@1.19.0
	opaque-debug@0.3.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.97
	openssl@0.10.61
	option-operations@0.4.1
	orbclient@0.3.47
	overload@0.1.1
	owned_ttf_parser@0.20.0
	parking_lot@0.11.2
	parking_lot@0.12.1
	parking_lot_core@0.8.6
	parking_lot_core@0.9.9
	paste@1.0.14
	pbkdf2@0.8.0
	peeking_take_while@0.1.2
	percent-encoding@2.3.1
	petgraph@0.6.4
	phf@0.10.1
	phf_codegen@0.10.0
	phf_generator@0.10.0
	phf_shared@0.10.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.27
	png@0.17.10
	polling@3.3.1
	portaudio-rs@0.3.2
	portaudio-sys@0.1.1
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	pretty-hex@0.3.0
	priority-queue@1.3.2
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.0
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.70
	protobuf-codegen-pure@2.28.0
	protobuf-codegen@2.28.0
	protobuf@2.28.0
	qoi@0.4.1
	quick-xml@0.30.0
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	ratatui@0.24.0
	raw-window-handle@0.6.0
	rayon-core@1.12.0
	rayon@1.8.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex-automata@0.1.10
	regex-automata@0.4.3
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	regex@1.10.2
	reqwest@0.11.22
	rgb@0.8.37
	rodio@0.15.0
	rpassword@7.3.1
	rspotify-http@0.12.0
	rspotify-macros@0.12.0
	rspotify-model@0.12.0
	rspotify@0.12.0
	rtoolbox@0.0.2
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.38.28
	rustversion@1.0.14
	ryu@1.0.16
	same-file@1.0.6
	schannel@0.1.22
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sctk-adwaita@0.7.0
	sdl2-sys@0.35.2
	sdl2@0.35.2
	security-framework-sys@2.9.1
	security-framework@2.9.2
	semver@1.0.20
	serde@1.0.193
	serde_derive@1.0.193
	serde_json@1.0.108
	serde_spanned@0.6.4
	serde_urlencoded@0.7.1
	sha-1@0.9.8
	sha1@0.10.6
	sha2@0.10.8
	shannon@0.2.0
	sharded-slab@0.1.7
	shell-words@1.1.0
	shlex@1.2.0
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	simd-adler32@0.3.7
	siphasher@0.3.11
	sixel-rs@0.3.3
	sixel-sys@0.3.1
	slab@0.4.9
	smallvec@1.11.2
	smithay-client-toolkit@0.18.0
	smithay-clipboard@0.7.0
	smol_str@0.2.0
	socket2@0.4.10
	socket2@0.5.5
	souvlaki@0.6.1
	spin@0.9.8
	stdweb@0.1.3
	strict-num@0.1.1
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.3
	subtle@2.4.1
	syn@1.0.109
	syn@2.0.39
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	system-deps@6.2.0
	target-lexicon@0.12.12
	tauri-winrt-notification@0.1.3
	tempfile@3.8.1
	tendril@0.4.3
	termcolor@1.4.0
	thiserror-impl@1.0.50
	thiserror@1.0.50
	thread-id@4.2.1
	thread_local@1.1.7
	tiff@0.9.0
	time-core@0.1.2
	time@0.3.30
	tiny-skia-path@0.11.3
	tiny-skia@0.11.3
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-socks@0.5.1
	tokio-stream@0.1.14
	tokio-util@0.7.10
	tokio@1.35.0
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.20.7
	toml_edit@0.21.0
	tower-service@0.3.2
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	tracing@0.1.40
	try-lock@0.2.5
	ttf-parser@0.20.0
	ttl_cache@0.5.1
	typenum@1.17.0
	unicode-bidi@0.3.14
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	url@2.5.0
	utf-8@0.7.6
	utf8parse@0.2.1
	uuid@1.6.1
	valuable@0.1.0
	vcpkg@0.2.15
	vergen@3.2.0
	version-compare@0.1.1
	version_check@0.9.4
	viuer@0.7.1
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-futures@0.4.39
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-shared@0.2.89
	wasm-bindgen@0.2.89
	wayland-backend@0.3.2
	wayland-client@0.31.1
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.0
	wayland-protocols-plasma@0.2.0
	wayland-protocols-wlr@0.2.0
	wayland-protocols@0.31.0
	wayland-scanner@0.31.0
	wayland-sys@0.31.1
	web-sys@0.3.66
	web-time@0.2.3
	weezl@0.1.7
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-wsapoll@0.1.1
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.51.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows@0.44.0
	windows@0.51.1
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winit@0.29.4
	winnow@0.5.26
	winreg@0.50.0
	x11-clipboard@0.8.1
	x11-dl@2.21.0
	x11rb-protocol@0.12.0
	x11rb@0.12.0
	xcursor@0.3.5
	xkbcommon-dl@0.4.1
	xkeysym@0.2.0
	xml5ever@0.17.0
	zerocopy-derive@0.6.5
	zerocopy-derive@0.7.30
	zerocopy@0.6.5
	zerocopy@0.7.30
	zune-inflate@0.2.54
"

inherit cargo

DESCRIPTION="spotify_player is a fast, easy to use, and configurable terminal music player."
HOMEPAGE="https://github.com/aome510/spotify-player"
SRC_URI="
	https://github.com/aome510/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"
KEYWORDS="~amd64"
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 ISC LGPL-3 LGPL-3+ MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"

IUSE="daemon image +libnotify lyrics +media-control pulseaudio sixel +streaming"
REQUIRED_USE="
	sixel? ( image )
	daemon? ( streaming )
"
DEPEND="
	dev-libs/openssl
	sys-apps/dbus
	libnotify? ( x11-libs/libnotify )
	pulseaudio? ( media-libs/libpulse )
	sixel? ( media-libs/libsixel )
	streaming? ( media-libs/alsa-lib )
"
RDEPEND="${DEPEND}"

src_configure() {
	initfeatures=(
		"$(usex daemon daemon '')"
		"$(usex image image '')"
		"$(usex libnotify notify '')"
		"$(usex lyrics lyric-finder '')"
		"$(usex media-control media-control '')"
		"$(usex pulseaudio pulseaudio-backend alsa-backend)"
		"$(usex sixel sixel '')"
		"$(usex streaming streaming '')"
	)
	newfeatures=$(IFS=, ; echo "${initfeatures[*]}") || die
	cargo_src_configure --features ${newfeatures} --no-default-features
}

src_install() {
	cargo_src_install --path ./spotify_player
}
QA_FLAGS_IGNORED="usr/bin/spotify_player"
