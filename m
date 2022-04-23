Content-Type: multipart/mixed; boundary="===============8168861833289100531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/yocto 15/47] drivers/media/i2c/ar0234.c: linux/version.h is included more than once.
Date: Sat, 23 Apr 2022 12:36:34 +0800
Message-ID: <202204231239.LFt5xNK4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8168861833289100531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: zouxiaoh <xiaohong.zou@intel.com>
CC: nanli2x <nanx.li@intel.com>
CC: Chen Meng J <meng.j.chen@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   6410aba3b60feba47b9713f297d9b3bdb79981f5
commit: 87bfbc96643ee47576c3d428b51d76b1d17a6e2f [15/47] media: ar0234: add=
 flip control
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ar0234.c: linux/version.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8168861833289100531==--

