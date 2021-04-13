Content-Type: multipart/mixed; boundary="===============7106413807418074294=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 13/16] mm: multigenerational lru: page reclaim
Date: Wed, 14 Apr 2021 02:15:29 +0800
Message-ID: <202104140207.PkhWYloX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7106413807418074294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210413065633.2782273-14-yuzhao@google.com>
References: <20210413065633.2782273-14-yuzhao@google.com>
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
[cannot apply to hnaz-linux-mm/master next-20210413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yu-Zhao/Multigenerational-=
LRU-Framework/20210413-145844
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 99cb64d=
e36d5c9397a664808b92943e35bdce25e
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/vmscan.c:4108:22: warning: Local variable kswapd shadows outer functi=
on [shadowFunction]
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
   mm/vmscan.c:3910:12: note: Shadowed declaration
   static int kswapd(void *p)
              ^
   mm/vmscan.c:4108:22: note: Shadow variable
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
   mm/vmscan.c:5458:7: warning: Identical inner 'if' condition is always tr=
ue. [identicalInnerCondition]
     if (!args)
         ^
   mm/vmscan.c:5433:15: note: 'alloc' is assigned value '!args' here.
    bool alloc =3D !args;
                 ^
   mm/vmscan.c:5456:6: note: outer condition: alloc
    if (alloc) {
        ^
   mm/vmscan.c:5458:7: note: identical inner condition: !args
     if (!args)
         ^
>> mm/vmscan.c:4710:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4801:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:4710:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4711:32: warning: Possible null pointer dereference: args [n=
ullPointer]
    int sid =3D sid_from_seq_or_gen(args->max_seq);
                                  ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4801:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:4711:32: note: Null pointer dereference
    int sid =3D sid_from_seq_or_gen(args->max_seq);
                                  ^
   mm/vmscan.c:4724:28: warning: Possible null pointer dereference: args [n=
ullPointer]
    sid =3D sid_from_seq_or_gen(args->max_seq + 1);
                              ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4801:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:4724:28: note: Null pointer dereference
    sid =3D sid_from_seq_or_gen(args->max_seq + 1);
                              ^
   mm/vmscan.c:4756:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4756:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4757:48: warning: Possible null pointer dereference: args [n=
ullPointer]
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4757:48: note: Null pointer dereference
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:4766:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4766:12: note: Null pointer dereference
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:4767:21: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);
                        ^
   mm/vmscan.c:4767:21: note: Null pointer dereference
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:4770:6: warning: Possible null pointer dereference: args [nu=
llPointer]
    if (args->max_seq <=3D mm_list->nodes[nid].cur_seq) {
        ^
   mm/vmscan.c:5945:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:5469:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, swappiness, &mm);

vim +4710 mm/vmscan.c

46b27b9e9608eb Yu Zhao 2021-04-13  4705  =

46b27b9e9608eb Yu Zhao 2021-04-13  4706  static void reset_mm_stats(struct =
lru_gen_mm_list *mm_list, bool last,
46b27b9e9608eb Yu Zhao 2021-04-13  4707  			   struct mm_walk_args *args)
46b27b9e9608eb Yu Zhao 2021-04-13  4708  {
46b27b9e9608eb Yu Zhao 2021-04-13  4709  	int i;
46b27b9e9608eb Yu Zhao 2021-04-13 @4710  	int nid =3D args->node_id;
46b27b9e9608eb Yu Zhao 2021-04-13  4711  	int sid =3D sid_from_seq_or_gen(a=
rgs->max_seq);
46b27b9e9608eb Yu Zhao 2021-04-13  4712  =

46b27b9e9608eb Yu Zhao 2021-04-13  4713  	lockdep_assert_held(&mm_list->loc=
k);
46b27b9e9608eb Yu Zhao 2021-04-13  4714  =

46b27b9e9608eb Yu Zhao 2021-04-13  4715  	for (i =3D 0; i < NR_MM_STATS; i+=
+) {
46b27b9e9608eb Yu Zhao 2021-04-13  4716  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[sid][i],
46b27b9e9608eb Yu Zhao 2021-04-13  4717  			   mm_list->nodes[nid].stats[si=
d][i] + args->mm_stats[i]);
46b27b9e9608eb Yu Zhao 2021-04-13  4718  		args->mm_stats[i] =3D 0;
46b27b9e9608eb Yu Zhao 2021-04-13  4719  	}
46b27b9e9608eb Yu Zhao 2021-04-13  4720  =

46b27b9e9608eb Yu Zhao 2021-04-13  4721  	if (!last || NR_STAT_GENS =3D=3D =
1)
46b27b9e9608eb Yu Zhao 2021-04-13  4722  		return;
46b27b9e9608eb Yu Zhao 2021-04-13  4723  =

46b27b9e9608eb Yu Zhao 2021-04-13  4724  	sid =3D sid_from_seq_or_gen(args-=
>max_seq + 1);
46b27b9e9608eb Yu Zhao 2021-04-13  4725  	for (i =3D 0; i < NR_MM_STATS; i+=
+)
46b27b9e9608eb Yu Zhao 2021-04-13  4726  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[sid][i], 0);
46b27b9e9608eb Yu Zhao 2021-04-13  4727  }
46b27b9e9608eb Yu Zhao 2021-04-13  4728  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7106413807418074294==--

