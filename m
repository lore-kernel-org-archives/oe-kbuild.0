Content-Type: multipart/mixed; boundary="===============1608965981615279773=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 09/24] dept: Apply Dept to seqlock
Date: Wed, 09 Mar 2022 02:13:22 +0800
Message-ID: <202203090250.tz4le5AI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1608965981615279773==
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-m031-20220307 (https://download.01.org/0day-ci/arch=
ive/20220309/202203090250.tz4le5AI-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
include/linux/cpuset.h:176 set_mems_allowed() warn: statement has no effect=
 31
kernel/cgroup/cpuset.c:1743 cpuset_change_task_nodemask() warn: statement h=
as no effect 31
net/xfrm/xfrm_state.c:179 xfrm_hash_resize() warn: statement has no effect =
31
net/xfrm/xfrm_policy.c:600 xfrm_bydst_resize() warn: statement has no effec=
t 31
net/xfrm/xfrm_policy.c:1091 __xfrm_policy_inexact_prune_bin() warn: stateme=
nt has no effect 31
net/xfrm/xfrm_policy.c:1148 xfrm_policy_inexact_alloc_chain() warn: stateme=
nt has no effect 31
net/xfrm/xfrm_policy.c:1358 xfrm_hash_rebuild() warn: statement has no effe=
ct 31

Old smatch warnings:
net/xfrm/xfrm_policy.c:1162 xfrm_policy_inexact_alloc_chain() warn: stateme=
nt has no effect 31
net/xfrm/xfrm_policy.c:1178 xfrm_policy_inexact_alloc_chain() warn: stateme=
nt has no effect 31

vim +176 include/linux/cpuset.h

c0ff7453bb5c7c Miao Xie    2010-05-24  167  =

58568d2a8215cb Miao Xie    2009-06-16  168  static inline void set_mems_all=
owed(nodemask_t nodemask)
58568d2a8215cb Miao Xie    2009-06-16  169  {
db751fe3ea6880 John Stultz 2013-10-07  170  	unsigned long flags;
db751fe3ea6880 John Stultz 2013-10-07  171  =

c0ff7453bb5c7c Miao Xie    2010-05-24  172  	task_lock(current);
db751fe3ea6880 John Stultz 2013-10-07  173  	local_irq_save(flags);
cc9a6c8776615f Mel Gorman  2012-03-21  174  	write_seqcount_begin(&current-=
>mems_allowed_seq);
58568d2a8215cb Miao Xie    2009-06-16  175  	current->mems_allowed =3D node=
mask;
cc9a6c8776615f Mel Gorman  2012-03-21 @176  	write_seqcount_end(&current->m=
ems_allowed_seq);
db751fe3ea6880 John Stultz 2013-10-07  177  	local_irq_restore(flags);
c0ff7453bb5c7c Miao Xie    2010-05-24  178  	task_unlock(current);
58568d2a8215cb Miao Xie    2009-06-16  179  }
58568d2a8215cb Miao Xie    2009-06-16  180  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1608965981615279773==--

