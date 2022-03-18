Content-Type: multipart/mixed; boundary="===============5864705470358786291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC v5 08/21] dept: Apply Dept to seqlock
Date: Fri, 18 Mar 2022 09:03:59 +0800
Message-ID: <202203180801.CEoECntN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5864705470358786291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <1647397593-16747-9-git-send-email-byungchul.park@lge.com>
References: <1647397593-16747-9-git-send-email-byungchul.park@lge.com>
TO: Byungchul Park <byungchul.park@lge.com>

Hi Byungchul,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.17-rc8]
[cannot apply to tip/locking/core tip/sched/core hnaz-mm/master next-202203=
17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Byungchul-Park/DEPT-Depend=
ency-Tracker/20220316-102853
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
2c271fe77d52a0555161926c232cd5bc07178b39
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/ar=
chive/20220318/202203180801.CEoECntN-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
kernel/time/tick-legacy.c:31 legacy_timer_tick() warn: statement has no eff=
ect 31
include/linux/u64_stats_sync.h:148 u64_stats_update_end() warn: statement h=
as no effect 31
include/linux/fs.h:907 i_size_write() warn: statement has no effect 31
include/linux/fs.h:907 i_size_write() warn: statement has no effect 31
include/linux/fs.h:907 i_size_write() warn: statement has no effect 31
include/linux/fs.h:907 i_size_write() warn: statement has no effect 31
include/linux/u64_stats_sync.h:174 u64_stats_update_end_irqrestore() warn: =
statement has no effect 31
include/linux/u64_stats_sync.h:148 u64_stats_update_end() warn: statement h=
as no effect 31
include/linux/u64_stats_sync.h:174 u64_stats_update_end_irqrestore() warn: =
statement has no effect 31
include/linux/u64_stats_sync.h:148 u64_stats_update_end() warn: statement h=
as no effect 31
include/linux/u64_stats_sync.h:148 u64_stats_update_end() warn: statement h=
as no effect 31
include/linux/u64_stats_sync.h:148 u64_stats_update_end() warn: statement h=
as no effect 31

Old smatch warnings:
fs/gfs2/dir.c:1422 gfs2_dir_read_leaf() error: dereferencing freed memory '=
bh'
fs/gfs2/dir.c:1765 dir_new_leaf() warn: passing freed memory 'bh'
fs/gfs2/quota.c:708 gfs2_write_buf_to_page() warn: should 'index << (12 - s=
dp->sd_sb.sb_bsize_shift)' be a 64 bit type?
fs/gfs2/bmap.c:1248 gfs2_get_extent() warn: should '*extlen << blkbits' be =
a 64 bit type?
fs/gfs2/bmap.c:1269 gfs2_alloc_extent() warn: should '*extlen << blkbits' b=
e a 64 bit type?
fs/gfs2/bmap.c:1878 punch_hole() error: uninitialized symbol 'end_aligned'.
fs/gfs2/bmap.c:1926 punch_hole() error: uninitialized symbol 'end_aligned'.
net/sched/sch_gred.c:470 gred_change_table_def() warn: potential spectre is=
sue 'table->tab' [w] (local cap)
net/sched/sch_prio.c:216 prio_tune() warn: potential spectre issue 'q->queu=
es' [w] (local cap)
net/sched/sch_cake.c:776 cake_hash() error: buffer overflow 'q->flows' 1024=
 <=3D 1030
net/sched/sch_cake.c:788 cake_hash() error: buffer overflow 'q->flows' 1024=
 <=3D 1030
net/sched/sch_cake.c:811 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:814 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:834 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:837 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:1357 cake_overhead() warn: should 'off << 16' be a 64 =
bit type?

vim +31 kernel/time/tick-legacy.c

b3550164a19d62 Arnd Bergmann 2020-09-24  12  =

56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  13  /**
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  14   * legacy_timer_tick() - advan=
ces the timekeeping infrastructure
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  15   * @ticks:	number of ticks, th=
at have elapsed since the last call.
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  16   *
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  17   * This is used by platforms t=
hat have not been converted to
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  18   * generic clockevents.
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  19   *
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  20   * If 'ticks' is zero, the CPU=
 is not handling timekeeping, so
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  21   * only perform process accoun=
ting and profiling.
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  22   *
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  23   * Must be called with interru=
pts disabled.
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  24   */
b3550164a19d62 Arnd Bergmann 2020-09-24  25  void legacy_timer_tick(unsigne=
d long ticks)
b3550164a19d62 Arnd Bergmann 2020-09-24  26  {
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  27  	if (ticks) {
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  28  		raw_spin_lock(&jiffies_lock);
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  29  		write_seqcount_begin(&jiffie=
s_seq);
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24  30  		do_timer(ticks);
56cc7b8acfb7c7 Arnd Bergmann 2020-09-24 @31  		write_seqcount_end(&jiffies_=
seq);

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============5864705470358786291==--

