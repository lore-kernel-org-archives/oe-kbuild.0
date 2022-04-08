Content-Type: multipart/mixed; boundary="===============6337902431805440831=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/memcontrol.c:670 __mem_cgroup_flush_stats() error: uninitialized symbol 'flag'.
Date: Fri, 08 Apr 2022 22:52:05 +0800
Message-ID: <202204082239.ZQKZagO9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6337902431805440831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shakeel Butt <shakeelb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1831fed559732b132aef0ea8261ac77e73f7eadf
commit: fd25a9e0e23b995fd0ba5e2f00a1099452cbc3cf memcg: unify memcg stat fl=
ushing
date:   5 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-m031-20220408 (https://download.01.org/0day-ci/arch=
ive/20220408/202204082239.ZQKZagO9-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/memcontrol.c:670 __mem_cgroup_flush_stats() error: uninitialized symbol =
'flag'.

vim +/flag +670 mm/memcontrol.c

11192d9c124d58d Shakeel Butt 2021-11-05  660  =

11192d9c124d58d Shakeel Butt 2021-11-05  661  static void __mem_cgroup_flus=
h_stats(void)
11192d9c124d58d Shakeel Butt 2021-11-05  662  {
fd25a9e0e23b995 Shakeel Butt 2021-11-05  663  	unsigned long flag;
fd25a9e0e23b995 Shakeel Butt 2021-11-05  664  =

fd25a9e0e23b995 Shakeel Butt 2021-11-05  665  	if (!spin_trylock_irqsave(&s=
tats_flush_lock, flag))
11192d9c124d58d Shakeel Butt 2021-11-05  666  		return;
11192d9c124d58d Shakeel Butt 2021-11-05  667  =

11192d9c124d58d Shakeel Butt 2021-11-05  668  	cgroup_rstat_flush_irqsafe(r=
oot_mem_cgroup->css.cgroup);
11192d9c124d58d Shakeel Butt 2021-11-05  669  	atomic_set(&stats_flush_thre=
shold, 0);
fd25a9e0e23b995 Shakeel Butt 2021-11-05 @670  	spin_unlock_irqrestore(&stat=
s_flush_lock, flag);
11192d9c124d58d Shakeel Butt 2021-11-05  671  }
11192d9c124d58d Shakeel Butt 2021-11-05  672  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6337902431805440831==--

