Content-Type: multipart/mixed; boundary="===============2043621979324686204=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out()+0x130: stack state mismatch: cfa1=6+16 cfa2=7+8
Date: Tue, 26 Apr 2022 23:52:37 +0800
Message-ID: <202204262356.qLBNAysj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2043621979324686204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: e68dcd8eac63cf14745df0dc872ea479df8ed4b9 kcsan: Re-add GCC as a sup=
ported compiler
date:   1 year, 10 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year, 10 months ago
config: x86_64-randconfig-s022-20220425 (https://download.01.org/0day-ci/ar=
chive/20220426/202204262356.qLBNAysj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De68dcd8eac63cf14745df0dc872ea479df8ed4b9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e68dcd8eac63cf14745df0dc872ea479df8ed4b9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/dma/idxd/ drivers/gpu/drm=
/vmwgfx/ drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_out()=
+0x130: stack state mismatch: cfa1=3D6+16 cfa2=3D7+8
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: warning: objtool: vmw_port_hb_in()+=
0x11a: stack state mismatch: cfa1=3D6+16 cfa2=3D7+8

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2043621979324686204==--

