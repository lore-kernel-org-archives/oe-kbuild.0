Content-Type: multipart/mixed; boundary="===============6794604336543381964=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3910/4996] include/linux/bits.h:9:41: warning: shift by negative count ('-1')
Date: Thu, 23 Jun 2022 11:20:55 +0800
Message-ID: <202206231105.gPu9hhCF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6794604336543381964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/bits.h:9:41: warning: shift by negative count ('-1') [-Wanal=
yzer-shift-count-negative]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Fomichev <a.fomichev@yadro.com>
CC: Jon Mason <jdmason@kudzu.us>
CC: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ac0ba5454ca85162c08dc429fef1999e077ca976
commit: d3b4b9c2142ca288f81a373841989f592f138934 [3910/4996] ntb_perf: exte=
nd with doorbell latency measurement
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c001 (https://download.01.org/0day-ci/archive/202=
20623/202206231105.gPu9hhCF-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd3b4b9c2142ca288f81a373841989f592f138934
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d3b4b9c2142ca288f81a373841989f592f138934
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/bitops.h:6,
                    from include/linux/kernel.h:22,
                    from drivers/ntb/test/ntb_perf.c:89:
   drivers/ntb/test/ntb_perf.c: In function 'perf_clear_dbl':
>> include/linux/bits.h:9:41: warning: shift by negative count ('-1') [-Wan=
alyzer-shift-count-negative]
       9 | #define BIT_ULL(nr)             (ULL(1) << (nr))
         |                                         ^~
   drivers/ntb/test/ntb_perf.c:1445:36: note: in expansion of macro 'BIT_UL=
L'
    1445 |         ntb_db_set_mask(perf->ntb, BIT_ULL(data->db));
         |                                    ^~~~~~~
     'perf_clear_dbl': event 1
       |
       |include/linux/bits.h:9:41:
       |    9 | #define BIT_ULL(nr)             (ULL(1) << (nr))
       |      |                                         ^~
       |      |                                         |
       |      |                                         (1) shift by negati=
ve amount here ('-1')
   drivers/ntb/test/ntb_perf.c:1445:36: note: in expansion of macro 'BIT_UL=
L'
       | 1445 |         ntb_db_set_mask(perf->ntb, BIT_ULL(data->db));
       |      |                                    ^~~~~~~
       |

vim +9 include/linux/bits.h

8bd9cb51daac89 Will Deacon     2018-06-19   8  =

95b980d62d52c4 Masahiro Yamada 2019-07-16  @9  #define BIT_ULL(nr)		(ULL(1)=
 << (nr))
95b980d62d52c4 Masahiro Yamada 2019-07-16  10  #define BIT_MASK(nr)		(UL(1)=
 << ((nr) % BITS_PER_LONG))
8bd9cb51daac89 Will Deacon     2018-06-19  11  #define BIT_WORD(nr)		((nr) =
/ BITS_PER_LONG)
95b980d62d52c4 Masahiro Yamada 2019-07-16  12  #define BIT_ULL_MASK(nr)	(UL=
L(1) << ((nr) % BITS_PER_LONG_LONG))
8bd9cb51daac89 Will Deacon     2018-06-19  13  #define BIT_ULL_WORD(nr)	((n=
r) / BITS_PER_LONG_LONG)
8bd9cb51daac89 Will Deacon     2018-06-19  14  #define BITS_PER_BYTE		8
8bd9cb51daac89 Will Deacon     2018-06-19  15  =


:::::: The code@line 9 was first introduced by commit
:::::: 95b980d62d52c4c1768ee719e8db3efe27ef52b2 linux/bits.h: make BIT(), G=
ENMASK(), and friends available in assembly

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6794604336543381964==--

