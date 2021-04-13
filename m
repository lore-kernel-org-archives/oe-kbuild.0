Content-Type: multipart/mixed; boundary="===============7782231655295861364=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 12/16] mm: multigenerational lru: eviction
Date: Tue, 13 Apr 2021 21:29:05 +0800
Message-ID: <202104132141.XsujcmKK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7782231655295861364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210413065633.2782273-13-yuzhao@google.com>
References: <20210413065633.2782273-13-yuzhao@google.com>
TO: Yu Zhao <yuzhao@google.com>
TO: linux-mm(a)kvack.org
CC: Alex Shi <alexs@kernel.org>
CC: Andi Kleen <ak@linux.intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Benjamin Manes <ben.manes@gmail.com>
CC: Dave Chinner <david@fromorbit.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Hillf Danton <hdanton@sina.com>
CC: Jens Axboe <axboe@kernel.dk>

Hi Yu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on cgroup/for-next tip/x86/mm fuse/for-next tip/pe=
rf/core tip/sched/core linus/master v5.12-rc7]
[cannot apply to hnaz-linux-mm/master next-20210412]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yu-Zhao/Multigenerational-=
LRU-Framework/20210413-145844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 99cb64d=
e36d5c9397a664808b92943e35bdce25e
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/vmscan.c:4073:22: warning: Local variable kswapd shadows outer functi=
on [shadowFunction]
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
   mm/vmscan.c:3875:12: note: Shadowed declaration
   static int kswapd(void *p)
              ^
   mm/vmscan.c:4073:22: note: Shadow variable
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
>> mm/vmscan.c:5423:7: warning: Identical inner 'if' condition is always tr=
ue. [identicalInnerCondition]
     if (!args)
         ^
   mm/vmscan.c:5398:15: note: 'alloc' is assigned value '!args' here.
    bool alloc =3D !args;
                 ^
   mm/vmscan.c:5421:6: note: outer condition: alloc
    if (alloc) {
        ^
   mm/vmscan.c:5423:7: note: identical inner condition: !args
     if (!args)
         ^

vim +/if +5423 mm/vmscan.c

4aa138b42a5c9f Yu Zhao 2021-04-13  5392  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5393  /* Main function used by foregroun=
d, background and user-triggered aging. */
4aa138b42a5c9f Yu Zhao 2021-04-13  5394  static bool walk_mm_list(struct lr=
uvec *lruvec, unsigned long max_seq,
4aa138b42a5c9f Yu Zhao 2021-04-13  5395  			 struct scan_control *sc, int s=
wappiness, struct mm_walk_args *args)
4aa138b42a5c9f Yu Zhao 2021-04-13  5396  {
4aa138b42a5c9f Yu Zhao 2021-04-13  5397  	bool last;
4aa138b42a5c9f Yu Zhao 2021-04-13  5398  	bool alloc =3D !args;
4aa138b42a5c9f Yu Zhao 2021-04-13  5399  	struct mm_struct *mm =3D NULL;
4aa138b42a5c9f Yu Zhao 2021-04-13  5400  	struct lrugen *lrugen =3D &lruvec=
->evictable;
4aa138b42a5c9f Yu Zhao 2021-04-13  5401  	struct pglist_data *pgdat =3D lru=
vec_pgdat(lruvec);
4aa138b42a5c9f Yu Zhao 2021-04-13  5402  	int nid =3D pgdat->node_id;
4aa138b42a5c9f Yu Zhao 2021-04-13  5403  	struct mem_cgroup *memcg =3D lruv=
ec_memcg(lruvec);
4aa138b42a5c9f Yu Zhao 2021-04-13  5404  	struct lru_gen_mm_list *mm_list =
=3D get_mm_list(memcg);
4aa138b42a5c9f Yu Zhao 2021-04-13  5405  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5406  	VM_BUG_ON(max_seq > READ_ONCE(lru=
gen->max_seq));
4aa138b42a5c9f Yu Zhao 2021-04-13  5407  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5408  	/*
4aa138b42a5c9f Yu Zhao 2021-04-13  5409  	 * For each walk of the mm_struct=
 list of a memcg, we decrement the
4aa138b42a5c9f Yu Zhao 2021-04-13  5410  	 * priority of its lrugen. For ea=
ch walk of all memcgs in kswapd, we
4aa138b42a5c9f Yu Zhao 2021-04-13  5411  	 * increment the priority of ever=
y lrugen.
4aa138b42a5c9f Yu Zhao 2021-04-13  5412  	 *
4aa138b42a5c9f Yu Zhao 2021-04-13  5413  	 * So if this lrugen has a higher=
 priority (smaller value), it means
4aa138b42a5c9f Yu Zhao 2021-04-13  5414  	 * other concurrent reclaimers ha=
ve walked its mm list, and we skip it
4aa138b42a5c9f Yu Zhao 2021-04-13  5415  	 * for this priority in order to =
balance the pressure on all memcgs.
4aa138b42a5c9f Yu Zhao 2021-04-13  5416  	 */
4aa138b42a5c9f Yu Zhao 2021-04-13  5417  	if (!mem_cgroup_disabled() && !cg=
roup_reclaim(sc) &&
4aa138b42a5c9f Yu Zhao 2021-04-13  5418  	    sc->priority > atomic_read(&l=
rugen->priority))
4aa138b42a5c9f Yu Zhao 2021-04-13  5419  		return false;
4aa138b42a5c9f Yu Zhao 2021-04-13  5420  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5421  	if (alloc) {
4aa138b42a5c9f Yu Zhao 2021-04-13  5422  		args =3D kvzalloc_node(sizeof(*a=
rgs), GFP_KERNEL, nid);
4aa138b42a5c9f Yu Zhao 2021-04-13 @5423  		if (!args)
4aa138b42a5c9f Yu Zhao 2021-04-13  5424  			return false;
4aa138b42a5c9f Yu Zhao 2021-04-13  5425  	}
4aa138b42a5c9f Yu Zhao 2021-04-13  5426  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5427  	args->memcg =3D memcg;
4aa138b42a5c9f Yu Zhao 2021-04-13  5428  	args->max_seq =3D max_seq;
4aa138b42a5c9f Yu Zhao 2021-04-13  5429  	args->start_pfn =3D pgdat->node_s=
tart_pfn;
4aa138b42a5c9f Yu Zhao 2021-04-13  5430  	args->end_pfn =3D pgdat_end_pfn(p=
gdat);
4aa138b42a5c9f Yu Zhao 2021-04-13  5431  	args->node_id =3D nid;
4aa138b42a5c9f Yu Zhao 2021-04-13  5432  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5433  	do {
4aa138b42a5c9f Yu Zhao 2021-04-13  5434  		last =3D get_next_mm(args, swapp=
iness, &mm);
4aa138b42a5c9f Yu Zhao 2021-04-13  5435  		if (mm)
4aa138b42a5c9f Yu Zhao 2021-04-13  5436  			walk_mm(args, swappiness, mm);
4aa138b42a5c9f Yu Zhao 2021-04-13  5437  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5438  		cond_resched();
4aa138b42a5c9f Yu Zhao 2021-04-13  5439  	} while (mm);
4aa138b42a5c9f Yu Zhao 2021-04-13  5440  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5441  	if (alloc)
4aa138b42a5c9f Yu Zhao 2021-04-13  5442  		kvfree(args);
4aa138b42a5c9f Yu Zhao 2021-04-13  5443  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5444  	if (!last) {
4aa138b42a5c9f Yu Zhao 2021-04-13  5445  		/* foreground aging prefers not =
to wait unless "necessary" */
4aa138b42a5c9f Yu Zhao 2021-04-13  5446  		if (!current_is_kswapd() && sc->=
priority < DEF_PRIORITY - 2)
4aa138b42a5c9f Yu Zhao 2021-04-13  5447  			wait_event_killable(mm_list->no=
des[nid].wait,
4aa138b42a5c9f Yu Zhao 2021-04-13  5448  					    max_seq < READ_ONCE(lruge=
n->max_seq));
4aa138b42a5c9f Yu Zhao 2021-04-13  5449  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5450  		return max_seq < READ_ONCE(lruge=
n->max_seq);
4aa138b42a5c9f Yu Zhao 2021-04-13  5451  	}
4aa138b42a5c9f Yu Zhao 2021-04-13  5452  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5453  	VM_BUG_ON(max_seq !=3D READ_ONCE(=
lrugen->max_seq));
4aa138b42a5c9f Yu Zhao 2021-04-13  5454  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5455  	inc_max_seq(lruvec);
4aa138b42a5c9f Yu Zhao 2021-04-13  5456  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5457  	if (!mem_cgroup_disabled())
4aa138b42a5c9f Yu Zhao 2021-04-13  5458  		atomic_add_unless(&lrugen->prior=
ity, -1, 0);
4aa138b42a5c9f Yu Zhao 2021-04-13  5459  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5460  	/* order against inc_max_seq() */
4aa138b42a5c9f Yu Zhao 2021-04-13  5461  	smp_mb();
4aa138b42a5c9f Yu Zhao 2021-04-13  5462  	/* either we see any waiters or t=
hey will see the updated max_seq */
4aa138b42a5c9f Yu Zhao 2021-04-13  5463  	if (waitqueue_active(&mm_list->no=
des[nid].wait))
4aa138b42a5c9f Yu Zhao 2021-04-13  5464  		wake_up_all(&mm_list->nodes[nid]=
.wait);
4aa138b42a5c9f Yu Zhao 2021-04-13  5465  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5466  	wakeup_flusher_threads(WB_REASON_=
VMSCAN);
4aa138b42a5c9f Yu Zhao 2021-04-13  5467  =

4aa138b42a5c9f Yu Zhao 2021-04-13  5468  	return true;
4aa138b42a5c9f Yu Zhao 2021-04-13  5469  }
4aa138b42a5c9f Yu Zhao 2021-04-13  5470  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7782231655295861364==--

