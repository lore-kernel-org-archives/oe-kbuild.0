Content-Type: multipart/mixed; boundary="===============5183219563410807121=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 14/205] drivers/clocksource/mmio.c:187:5-24: atomic_dec_and_test variation before object free at line 189.
Date: Mon, 23 May 2022 03:27:10 +0800
Message-ID: <202205230346.TDJh4I8y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5183219563410807121==
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
:::::: branch date: 5 days ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
523/202205230346.TDJh4I8y-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c:187:5-24: atomic_dec_and_test variation befor=
e object free at line 189.
--
>> drivers/clocksource/mmio.c:211:15-21: WARNING: Consider using vma_pages =
helper on vma

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5183219563410807121==--

