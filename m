Content-Type: multipart/mixed; boundary="===============6486802734222567710=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/sis/sis_main.c:216:26-27: WARNING opportunity for swap()
Date: Sun, 12 Dec 2021 08:38:21 +0800
Message-ID: <202112120847.iArCKmsp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6486802734222567710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Denis Efremov <efremov@linux.com>
CC: Julia Lawall <Julia.Lawall@inria.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbdff6d583be718935b613ab2a966cddaadf661f
commit: 7845daa8bd72efa8bbc1de122edfce6e058bbe41 coccinelle: misc: add swap=
 script
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c024-20211210 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120847.iArCKmsp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/sis/sis_main.c:216:26-27: WARNING opportunity for sw=
ap()

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6486802734222567710==--

