Content-Type: multipart/mixed; boundary="===============3986205109785931162=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.15-bpi-r2-pro 90/90] drivers/gpu/drm/drm_connector.c:101:0: warning: There is an unknown macro here somewhere. Configuration is required. If DRM_ENUM_NAME_FN is a macro then please configure it. [unknownMacro]
Date: Fri, 22 Oct 2021 16:02:10 +0800
Message-ID: <202110221602.05Bj83Hz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3986205109785931162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.15-bpi-r2-pro
head:   14a93e4b341569bdb9f0456c3934e62402a82174
commit: 14a93e4b341569bdb9f0456c3934e62402a82174 [90/90] more porting
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_connector.c:101:0: warning: There is an unknown macr=
o here somewhere. Configuration is required. If DRM_ENUM_NAME_FN is a macro=
 then please configure it. [unknownMacro]
   =

   ^

vim +101 drivers/gpu/drm/drm_connector.c

52217195176115 Daniel Vetter    2016-08-12  100  =

14a93e4b341569 Frank Wunderlich 2021-10-14 @101  DRM_ENUM_NAME_FN(drm_get_c=
onnector_name, drm_connector_enum_list)
14a93e4b341569 Frank Wunderlich 2021-10-14  102  EXPORT_SYMBOL(drm_get_conn=
ector_name);
14a93e4b341569 Frank Wunderlich 2021-10-14  103  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3986205109785931162==--

