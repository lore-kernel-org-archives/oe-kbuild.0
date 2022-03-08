Content-Type: multipart/mixed; boundary="===============2808045976127571838=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 09/24] dept: Apply Dept to seqlock
Date: Wed, 09 Mar 2022 04:15:46 +0800
Message-ID: <202203090409.joHNlb9j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2808045976127571838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1646377603-19730-10-git-send-email-byungchul.park@lge.com>
References: <1646377603-19730-10-git-send-email-byungchul.park@lge.com>
TO: Byungchul Park <byungchul.park@lge.com>
TO: torvalds(a)linux-foundation.org
CC: hamohammed.sa(a)gmail.com
CC: jack(a)suse.cz
CC: peterz(a)infradead.org
CC: daniel.vetter(a)ffwll.ch
CC: amir73il(a)gmail.com
CC: david(a)fromorbit.com
CC: dri-devel(a)lists.freedesktop.org
CC: chris(a)chris-wilson.co.uk
CC: bfields(a)fieldses.org
CC: linux-ide(a)vger.kernel.org
CC: adilger.kernel(a)dilger.ca
CC: joel(a)joelfernandes.org
CC: cl(a)linux.com
CC: will(a)kernel.org
CC: duyuyang(a)gmail.com
CC: sashal(a)kernel.org
CC: paolo.valente(a)linaro.org
CC: damien.lemoal(a)opensource.wdc.com
CC: willy(a)infradead.org
CC: hch(a)infradead.org
CC: airlied(a)linux.ie
CC: mingo(a)redhat.com
CC: djwong(a)kernel.org
CC: vdavydov.dev(a)gmail.com
CC: rientjes(a)google.com
CC: dennis(a)kernel.org
CC: linux-ext4(a)vger.kernel.org
CC: linux-mm(a)kvack.org
CC: ngupta(a)vflare.org

Hi Byungchul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linux/master linus/master v5.17-rc7]
[cannot apply to tip/locking/core hnaz-mm/master next-20220308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Byungchul-Park/DEPT-Depend=
ency-Tracker/20220304-150943
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 25795ef=
6299f07ce3838f3253a9cb34f64efcfae
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-m021-20220307 (https://download.01.org/0day-ci/arch=
ive/20220309/202203090409.joHNlb9j-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/time/timekeeping.c:1745 timekeeping_inject_sleeptime64() warn: state=
ment has no effect 31
kernel/time/timekeeping.c:2462 hardpps() warn: statement has no effect 31

vim +1745 kernel/time/timekeeping.c

0fa88cb4b82b5cf Xunlei Pang     2015-04-01  1717  =

304529b1b6f8612 John Stultz     2011-04-01  1718  /**
04d9089086a8231 pang.xunlei     2014-11-18  1719   * timekeeping_inject_sle=
eptime64 - Adds suspend interval to timeekeeping values
04d9089086a8231 pang.xunlei     2014-11-18  1720   * @delta: pointer to a t=
imespec64 delta value
304529b1b6f8612 John Stultz     2011-04-01  1721   *
2ee966320028ac8 Xunlei Pang     2015-04-01  1722   * This hook is for archi=
tectures that cannot support read_persistent_clock64
304529b1b6f8612 John Stultz     2011-04-01  1723   * because their RTC/pers=
istent clock is only accessible when irqs are enabled.
0fa88cb4b82b5cf Xunlei Pang     2015-04-01  1724   * and also don't have an=
 effective nonstop clocksource.
304529b1b6f8612 John Stultz     2011-04-01  1725   *
304529b1b6f8612 John Stultz     2011-04-01  1726   * This function should o=
nly be called by rtc_resume(), and allows
304529b1b6f8612 John Stultz     2011-04-01  1727   * a suspend offset to be=
 injected into the timekeeping values.
304529b1b6f8612 John Stultz     2011-04-01  1728   */
985e695074d3576 Ondrej Mosnacek 2018-07-13  1729  void timekeeping_inject_s=
leeptime64(const struct timespec64 *delta)
304529b1b6f8612 John Stultz     2011-04-01  1730  {
3fdb14fd1df7032 Thomas Gleixner 2014-07-16  1731  	struct timekeeper *tk =
=3D &tk_core.timekeeper;
92c1d3ed4dc0b8c John Stultz     2011-11-14  1732  	unsigned long flags;
304529b1b6f8612 John Stultz     2011-04-01  1733  =

9a7a71b1d0968fc Thomas Gleixner 2013-02-21  1734  	raw_spin_lock_irqsave(&t=
imekeeper_lock, flags);
3fdb14fd1df7032 Thomas Gleixner 2014-07-16  1735  	write_seqcount_begin(&tk=
_core.seq);
70471f2f061d593 John Stultz     2011-11-14  1736  =

f473e5f467f6049 Mukesh Ojha     2018-07-17  1737  	suspend_timing_needed =
=3D false;
f473e5f467f6049 Mukesh Ojha     2018-07-17  1738  =

4e250fdde9be505 John Stultz     2012-07-27  1739  	timekeeping_forward_now(=
tk);
304529b1b6f8612 John Stultz     2011-04-01  1740  =

04d9089086a8231 pang.xunlei     2014-11-18  1741  	__timekeeping_inject_sle=
eptime(tk, delta);
304529b1b6f8612 John Stultz     2011-04-01  1742  =

780427f0e113b4c David Vrabel    2013-06-27  1743  	timekeeping_update(tk, T=
K_CLEAR_NTP | TK_MIRROR | TK_CLOCK_WAS_SET);
304529b1b6f8612 John Stultz     2011-04-01  1744  =

3fdb14fd1df7032 Thomas Gleixner 2014-07-16 @1745  	write_seqcount_end(&tk_c=
ore.seq);
9a7a71b1d0968fc Thomas Gleixner 2013-02-21  1746  	raw_spin_unlock_irqresto=
re(&timekeeper_lock, flags);
304529b1b6f8612 John Stultz     2011-04-01  1747  =

17a1b8826b451c8 Thomas Gleixner 2021-07-13  1748  	/* Signal hrtimers about=
 time change */
17a1b8826b451c8 Thomas Gleixner 2021-07-13  1749  	clock_was_set(CLOCK_SET_=
WALL | CLOCK_SET_BOOT);
304529b1b6f8612 John Stultz     2011-04-01  1750  }
7f2981393af31a8 Xunlei Pang     2015-04-01  1751  #endif
304529b1b6f8612 John Stultz     2011-04-01  1752  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2808045976127571838==--

