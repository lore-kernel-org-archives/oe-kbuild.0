Content-Type: multipart/mixed; boundary="===============5478380073653572112=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.14/lru-v3 11/18] mm/vmscan.c:3122:12: warning: Possible null pointer dereference: args [nullPointer]
Date: Sun, 05 Sep 2021 14:41:31 +0800
Message-ID: <202109051426.TpnoFWzP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5478380073653572112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.14/lru-v3
head:   58423b0ba935bb76ff3f6754703e8fb8533ecae3
commit: 77bb39e6964a78f1680783b1228bd089f6267f5e [11/18] mm: multigeneratio=
nal lru: eviction
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/vmscan.c:6374:22: warning: Local variable kswapd shadows outer functi=
on [shadowFunction]
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
   mm/vmscan.c:6174:12: note: Shadowed declaration
   static int kswapd(void *p)
              ^
   mm/vmscan.c:6374:22: note: Shadow variable
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
>> mm/vmscan.c:3122:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3215:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3122:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:3123:34: warning: Possible null pointer dereference: args [n=
ullPointer]
    int hist =3D hist_from_seq_or_gen(args->max_seq);
                                    ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3215:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3123:34: note: Null pointer dereference
    int hist =3D hist_from_seq_or_gen(args->max_seq);
                                    ^
   mm/vmscan.c:3136:30: warning: Possible null pointer dereference: args [n=
ullPointer]
    hist =3D hist_from_seq_or_gen(args->max_seq + 1);
                                ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3215:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3136:30: note: Null pointer dereference
    hist =3D hist_from_seq_or_gen(args->max_seq + 1);
                                ^
   mm/vmscan.c:3170:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3170:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:3171:48: warning: Possible null pointer dereference: args [n=
ullPointer]
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3171:48: note: Null pointer dereference
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:3180:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3180:12: note: Null pointer dereference
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:3181:21: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3181:21: note: Null pointer dereference
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:3184:6: warning: Possible null pointer dereference: args [nu=
llPointer]
    if (args->max_seq <=3D mm_list->nodes[nid].cur_seq) {
        ^
   mm/vmscan.c:4395:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3888:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);

vim +3122 mm/vmscan.c

3b838ec127aaaa Yu Zhao 2021-05-20  3117  =

3b838ec127aaaa Yu Zhao 2021-05-20  3118  static void reset_mm_stats(struct =
lru_gen_mm_list *mm_list, bool last,
3b838ec127aaaa Yu Zhao 2021-05-20  3119  			   struct mm_walk_args *args)
3b838ec127aaaa Yu Zhao 2021-05-20  3120  {
3b838ec127aaaa Yu Zhao 2021-05-20  3121  	int i;
3b838ec127aaaa Yu Zhao 2021-05-20 @3122  	int nid =3D args->node_id;
3b838ec127aaaa Yu Zhao 2021-05-20  3123  	int hist =3D hist_from_seq_or_gen=
(args->max_seq);
3b838ec127aaaa Yu Zhao 2021-05-20  3124  =

3b838ec127aaaa Yu Zhao 2021-05-20  3125  	lockdep_assert_held(&mm_list->loc=
k);
3b838ec127aaaa Yu Zhao 2021-05-20  3126  =

3b838ec127aaaa Yu Zhao 2021-05-20  3127  	for (i =3D 0; i < NR_MM_STATS; i+=
+) {
3b838ec127aaaa Yu Zhao 2021-05-20  3128  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[hist][i],
3b838ec127aaaa Yu Zhao 2021-05-20  3129  			   mm_list->nodes[nid].stats[hi=
st][i] + args->mm_stats[i]);
3b838ec127aaaa Yu Zhao 2021-05-20  3130  		args->mm_stats[i] =3D 0;
3b838ec127aaaa Yu Zhao 2021-05-20  3131  	}
3b838ec127aaaa Yu Zhao 2021-05-20  3132  =

3b838ec127aaaa Yu Zhao 2021-05-20  3133  	if (!last || NR_STAT_GENS =3D=3D =
1)
3b838ec127aaaa Yu Zhao 2021-05-20  3134  		return;
3b838ec127aaaa Yu Zhao 2021-05-20  3135  =

3b838ec127aaaa Yu Zhao 2021-05-20  3136  	hist =3D hist_from_seq_or_gen(arg=
s->max_seq + 1);
3b838ec127aaaa Yu Zhao 2021-05-20  3137  	for (i =3D 0; i < NR_MM_STATS; i+=
+)
3b838ec127aaaa Yu Zhao 2021-05-20  3138  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[hist][i], 0);
3b838ec127aaaa Yu Zhao 2021-05-20  3139  }
3b838ec127aaaa Yu Zhao 2021-05-20  3140  =


:::::: The code at line 3122 was first introduced by commit
:::::: 3b838ec127aaaa0b5121fbffb2eaee9f2d014a7e mm: multigenerational lru: =
mm_struct list

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5478380073653572112==--

