Content-Type: multipart/mixed; boundary="===============0932421277040105814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/nwl-dsi.c:51:14: warning: struct member 'nwl_dsi_plat_clk_config::id' is never used.
Date: Wed, 05 Aug 2020 22:09:58 +0800
Message-ID: <202008052256.ovLryU8i%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0932421277040105814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Guido G=C3=BCnther" <agx@sigxcpu.org>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Robert Chiras <robert.chiras@nxp.com>
CC: Fabio Estevam <festevam@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2324d50d051ec0f14a548e78554fb02513d6dcef
commit: 44cfc6233447cb2cf47aeb99457de35826a363f6 drm/bridge: Add NWL MIPI D=
SI host controller support
date:   4 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 months ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/bridge/nwl-dsi.c:51:14: warning: struct member 'nwl_dsi_=
plat_clk_config::id' is never used. [unusedStructMember]
    const char *id;
                ^
>> drivers/gpu/drm/bridge/nwl-dsi.c:52:14: warning: struct member 'nwl_dsi_=
plat_clk_config::clk' is never used. [unusedStructMember]
    struct clk *clk;
                ^
>> drivers/gpu/drm/bridge/nwl-dsi.c:53:7: warning: struct member 'nwl_dsi_p=
lat_clk_config::present' is never used. [unusedStructMember]
    bool present;
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D44cfc6233447cb2cf47aeb99457de35826a363f6
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 44cfc6233447cb2cf47aeb99457de35826a363f6
vim +51 drivers/gpu/drm/bridge/nwl-dsi.c

44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09  49  =

44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09  50  struct nwl_dsi_plat_clk_=
config {
44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09 @51  	const char *id;
44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09 @52  	struct clk *clk;
44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09 @53  	bool present;
44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09  54  };
44cfc6233447cb2 Guido G=C3=BCnther 2020-04-09  55  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0932421277040105814==--

