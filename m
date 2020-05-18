Content-Type: multipart/mixed; boundary="===============0497022198366382867=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 1000/9662] drivers/gpu/drm/bridge/nwl-dsi.c:51:14: warning: struct member 'nwl_dsi_plat_clk_config::id' is never used. [unusedStructMember]
Date: Mon, 18 May 2020 19:18:42 +0800
Message-ID: <202005181929.Ig60vjsW%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0497022198366382867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Guido G=C3=BCnther" <agx@sigxcpu.org>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Robert Chiras <robert.chiras@nxp.com>
CC: Fabio Estevam <festevam@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
commit: 44cfc6233447cb2cf47aeb99457de35826a363f6 [1000/9662] drm/bridge: Ad=
d NWL MIPI DSI host controller support
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago

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
--
>> drivers/gpu/drm/drm_auth.c:289:6: warning: Redundant initialization for =
'ret'. The initialized value is overwritten before it is read. [redundantIn=
itialization]
    ret =3D drm_master_check_perm(dev, file_priv);
        ^
   drivers/gpu/drm/drm_auth.c:285:10: note: ret is initialized
    int ret =3D -EINVAL;
            ^
   drivers/gpu/drm/drm_auth.c:289:6: note: ret is overwritten
    ret =3D drm_master_check_perm(dev, file_priv);
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D44cfc6233447cb2cf47aeb99457de35826a363f6
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
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
--===============0497022198366382867==--

