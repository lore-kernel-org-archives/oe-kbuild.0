Content-Type: multipart/mixed; boundary="===============0948459411841093560=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/mlock.c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLifetime]
Date: Sat, 18 Jun 2022 12:32:35 +0800
Message-ID: <202206181259.P1SsSRFn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0948459411841093560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: mm/mlock.=
c:230:20: warning: Using pointer that is a temporary. [danglingTemporaryLif=
etime]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: adb11e78c5dc5e26774acb05f983da36447f7911 mm/munlock: protect the pe=
r-CPU pagevec by a local_lock_t
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: mips-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout adb11e78c5dc5e26774acb05f983da36447f7911
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/mlock.c:230:20: warning: Using pointer that is a temporary. [dangling=
TemporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/mlock.c:229:9: note: Address of variable taken here.
    pvec =3D &per_cpu(mlock_pvec.vec, cpu);
           ^
   mm/mlock.c:229:17: note: Temporary created here.
    pvec =3D &per_cpu(mlock_pvec.vec, cpu);
                   ^
   mm/mlock.c:230:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^

vim +230 mm/mlock.c

adb11e78c5dc5e2 Sebastian Andrzej Siewior 2022-04-01  223  =

adb11e78c5dc5e2 Sebastian Andrzej Siewior 2022-04-01  224  void mlock_page_=
drain_remote(int cpu)
56afe477df3cbbc Vlastimil Babka           2013-09-11  225  {
2fbb0c10d1e8222 Hugh Dickins              2022-02-14  226  	struct pagevec =
*pvec;
2fbb0c10d1e8222 Hugh Dickins              2022-02-14  227  =

adb11e78c5dc5e2 Sebastian Andrzej Siewior 2022-04-01  228  	WARN_ON_ONCE(cp=
u_online(cpu));
adb11e78c5dc5e2 Sebastian Andrzej Siewior 2022-04-01  229  	pvec =3D &per_c=
pu(mlock_pvec.vec, cpu);
2fbb0c10d1e8222 Hugh Dickins              2022-02-14 @230  	if (pagevec_cou=
nt(pvec))
2fbb0c10d1e8222 Hugh Dickins              2022-02-14  231  		mlock_pagevec(=
pvec);
56afe477df3cbbc Vlastimil Babka           2013-09-11  232  }
56afe477df3cbbc Vlastimil Babka           2013-09-11  233  =


:::::: The code at line 230 was first introduced by commit
:::::: 2fbb0c10d1e8222604132b3a3f81bfd8345a44b6 mm/munlock: mlock_page() mu=
nlock_page() batch by pagevec

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0948459411841093560==--

