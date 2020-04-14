Content-Type: multipart/mixed; boundary="===============2458606738164160188=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [drm-drm-misc:drm-misc-next 2/2] drivers/gpu/drm/bridge/nwl-dsi.c:51:14: warning: struct member 'nwl_dsi_plat_clk_config::id' is never used. [unusedStructMember]
Date: Tue, 14 Apr 2020 08:45:20 +0800
Message-ID: <202004140818.uUoD4SKI%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2458606738164160188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Guido G=C3=BCnther" <agx@sigxcpu.org>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Robert Chiras <robert.chiras@nxp.com>
CC: Fabio Estevam <festevam@gmail.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   44cfc6233447cb2cf47aeb99457de35826a363f6
commit: 44cfc6233447cb2cf47aeb99457de35826a363f6 [2/2] drm/bridge: Add NWL =
MIPI DSI host controller support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


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

git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm-misc
git remote update drm-drm-misc
git checkout 44cfc6233447cb2cf47aeb99457de35826a363f6
vim +51 drivers/gpu/drm/bridge/nwl-dsi.c

44cfc6233447cb Guido G=C3=BCnther 2020-04-09  49  =

44cfc6233447cb Guido G=C3=BCnther 2020-04-09  50  struct nwl_dsi_plat_clk_c=
onfig {
44cfc6233447cb Guido G=C3=BCnther 2020-04-09 @51  	const char *id;
44cfc6233447cb Guido G=C3=BCnther 2020-04-09 @52  	struct clk *clk;
44cfc6233447cb Guido G=C3=BCnther 2020-04-09 @53  	bool present;
44cfc6233447cb Guido G=C3=BCnther 2020-04-09  54  };
44cfc6233447cb Guido G=C3=BCnther 2020-04-09  55  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2458606738164160188==--

