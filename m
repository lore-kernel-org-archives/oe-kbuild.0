Content-Type: multipart/mixed; boundary="===============1621334943083838499=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 14/205] drivers/clocksource/mmio.c: linux/slab.h is included more than once.
Date: Wed, 25 May 2022 02:57:37 +0800
Message-ID: <202205250242.6m7yoyYe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1621334943083838499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Hao Li <hao3.li@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   7e50195eb7b91d6b58f1c65457442eb5edc21848
commit: 20fd627143e8652ac182ac06627776b10ce234bd [14/205] clocksource: mmio=
: add user-mappable mmio clocksources
:::::: branch date: 7 days ago
:::::: commit date: 7 weeks ago
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c: linux/slab.h is included more than once.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1621334943083838499==--

