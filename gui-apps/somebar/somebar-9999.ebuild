# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit savedconfig git-r3 meson

DESCRIPTION="dwm-like bar for dwl"
HOMEPAGE="https://git.sr.ht/~raphi/somebar"
EGIT_REPO_URI="https://git.sr.ht/~raphi/somebar"

LICENSE="MIT"
SLOT="0"

RDEPEND="
	dev-libs/glib:2
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/pango
"
DEPEND="
	${RDEPEND}
	dev-libs/wayland-protocols
"
BDEPEND="
	dev-util/wayland-scanner
"

src_prepare() {
	default
	use savedconfig && restore_config src/config.hpp
	[[ -f src/config.hpp ]] || cp src/config.def.hpp src/config.hpp
}

src_install() {
	meson_src_install
	save_config src/config.hpp
}
