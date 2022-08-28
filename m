Content-Type: multipart/mixed; boundary="===============9130974555867430636=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:akpm/mm/mm-nonmm-unstable 26/57] lib/fault-inject.c:182:0-23: WARNING: fops_xl should be defined with DEFINE_DEBUGFS_ATTRIBUTE
Date: Sun, 28 Aug 2022 15:44:54 +0800
Message-ID: <202208281523.f9odnkjA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9130974555867430636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Wei Yongjun <weiyongjun1@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-nonmm-unstable
head:   4cad2ef05ac62420b9bb940bb5ab35151cc93f10
commit: 766110c2bc3bc0176b5dc7bdeee7740b5518565a [26/57] fault-injection: m=
ake some stack filter attrs more readable
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: s390-randconfig-c033-20220828 (https://download.01.org/0day-ci/arch=
ive/20220828/202208281523.f9odnkjA-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
   lib/fault-inject.c:198:0-23: WARNING: fops_stacktrace_depth should be de=
fined with DEFINE_DEBUGFS_ATTRIBUTE
   lib/fault-inject.c:172:0-23: WARNING: fops_ul should be defined with DEF=
INE_DEBUGFS_ATTRIBUTE
>> lib/fault-inject.c:182:0-23: WARNING: fops_xl should be defined with DEF=
INE_DEBUGFS_ATTRIBUTE

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9130974555867430636==--

