Content-Type: multipart/mixed; boundary="===============2008624844801132285=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 8460/9999] drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.
Date: Tue, 23 Aug 2022 12:10:29 +0800
Message-ID: <202208231214.H10zSTSK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2008624844801132285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Sunita Nadampalli <sunitan@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   ca705d5c043561a85beeb79a737f75d56e3ca6f3
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: =
Add Device specific memory configuration
:::::: branch date: 6 days ago
:::::: commit date: 10 months ago
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is incl=
uded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2008624844801132285==--

