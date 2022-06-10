Content-Type: multipart/mixed; boundary="===============8811596855402186456=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 8460/9999] drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.
Date: Fri, 10 Jun 2022 12:26:35 +0800
Message-ID: <202206101224.HyyMTvLR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8811596855402186456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Sunita Nadampalli <sunitan@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   e9234397a7d1d61dfde8c7c238fd1fd6105b56f2
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: =
Add Device specific memory configuration
:::::: branch date: 4 days ago
:::::: commit date: 7 months ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is incl=
uded more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8811596855402186456==--

