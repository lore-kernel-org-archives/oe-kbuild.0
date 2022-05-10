Content-Type: multipart/mixed; boundary="===============1249487351676836954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [masahiroy-kbuild:lto-cleanup-v4 58/63] drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_in()+0x289: stack state mismatch: cfa1=5+16 cfa2=4+8
Date: Tue, 10 May 2022 19:08:25 +0800
Message-ID: <202205101931.x2X8oMfK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1249487351676836954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kbuild(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git lto-cleanup-v4
head:   49bcf0f27028f44a13a4266100936af3d8b236b9
commit: 7e0fb7b04d8d104a222080ddc0ca609c728359fb [58/63] kbuild: do not cre=
ate *.prelink.o for Clang LTO or IBT
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-s032-20220509 (https://download.01.org/0day-ci/ar=
chive/20220510/202205101931.x2X8oMfK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git/commit/?id=3D7e0fb7b04d8d104a222080ddc0ca609c728359fb
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linu=
x/kernel/git/masahiroy/linux-kbuild.git
        git fetch --no-tags masahiroy-kbuild lto-cleanup-v4
        git checkout 7e0fb7b04d8d104a222080ddc0ca609c728359fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_in()+0x28=
9: stack state mismatch: cfa1=3D5+16 cfa2=3D4+8
>> drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_out()+0x2=
6c: stack state mismatch: cfa1=3D5+16 cfa2=3D4+8

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1249487351676836954==--

