Content-Type: multipart/mixed; boundary="===============0233055731869360333=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen-kernel-zen-kernel:5.13/lru 11/14] mm/vmscan.c:3095:12: warning: Possible null pointer dereference: args [nullPointer]
Date: Tue, 29 Jun 2021 14:16:20 +0800
Message-ID: <202106291400.gtSq9fIz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0233055731869360333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.13/lru
head:   6c0599d8df2c91043cffba0fbdd8c0fdc3297551
commit: 9f5c5f27bd4324d20cb260c4666ed2589729ef02 [11/14] mm: multigeneratio=
nal lru: eviction
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/vmscan.c:6312:22: warning: Local variable kswapd shadows outer functi=
on [shadowFunction]
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
   mm/vmscan.c:6112:12: note: Shadowed declaration
   static int kswapd(void *p)
              ^
   mm/vmscan.c:6312:22: note: Shadow variable
    struct task_struct *kswapd =3D NODE_DATA(nid)->kswapd;
                        ^
>> mm/vmscan.c:3095:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3188:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3095:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:3096:34: warning: Possible null pointer dereference: args [n=
ullPointer]
    int hist =3D hist_from_seq_or_gen(args->max_seq);
                                    ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3188:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3096:34: note: Null pointer dereference
    int hist =3D hist_from_seq_or_gen(args->max_seq);
                                    ^
   mm/vmscan.c:3109:30: warning: Possible null pointer dereference: args [n=
ullPointer]
    hist =3D hist_from_seq_or_gen(args->max_seq + 1);
                                ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3188:32: note: Calling function 'reset_mm_stats', 3rd argume=
nt 'args' value is 0
    reset_mm_stats(mm_list, last, args);
                                  ^
   mm/vmscan.c:3109:30: note: Null pointer dereference
    hist =3D hist_from_seq_or_gen(args->max_seq + 1);
                                ^
   mm/vmscan.c:3143:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3143:12: note: Null pointer dereference
    int nid =3D args->node_id;
              ^
   mm/vmscan.c:3144:48: warning: Possible null pointer dereference: args [n=
ullPointer]
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3144:48: note: Null pointer dereference
    struct lru_gen_mm_list *mm_list =3D get_mm_list(args->memcg);
                                                  ^
   mm/vmscan.c:3153:12: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3153:12: note: Null pointer dereference
    VM_BUG_ON(args->max_seq > mm_list->nodes[nid].cur_seq + 1);
              ^
   mm/vmscan.c:3154:21: warning: Possible null pointer dereference: args [n=
ullPointer]
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);
                        ^
   mm/vmscan.c:3154:21: note: Null pointer dereference
    VM_BUG_ON(*iter && args->max_seq < mm_list->nodes[nid].cur_seq);
                       ^
   mm/vmscan.c:3157:6: warning: Possible null pointer dereference: args [nu=
llPointer]
    if (args->max_seq <=3D mm_list->nodes[nid].cur_seq) {
        ^
   mm/vmscan.c:4368:55: note: Calling function 'walk_mm_list', 5th argument=
 'NULL' value is 0
    return walk_mm_list(lruvec, max_seq, sc, swappiness, NULL) ? nr_to_scan=
 : 0;
                                                         ^
   mm/vmscan.c:3861:22: note: Calling function 'get_next_mm', 1st argument =
'args' value is 0
     last =3D get_next_mm(args, &mm);

vim +3095 mm/vmscan.c

0c09e5f119fe20 Yu Zhao 2021-05-20  3090  =

0c09e5f119fe20 Yu Zhao 2021-05-20  3091  static void reset_mm_stats(struct =
lru_gen_mm_list *mm_list, bool last,
0c09e5f119fe20 Yu Zhao 2021-05-20  3092  			   struct mm_walk_args *args)
0c09e5f119fe20 Yu Zhao 2021-05-20  3093  {
0c09e5f119fe20 Yu Zhao 2021-05-20  3094  	int i;
0c09e5f119fe20 Yu Zhao 2021-05-20 @3095  	int nid =3D args->node_id;
0c09e5f119fe20 Yu Zhao 2021-05-20  3096  	int hist =3D hist_from_seq_or_gen=
(args->max_seq);
0c09e5f119fe20 Yu Zhao 2021-05-20  3097  =

0c09e5f119fe20 Yu Zhao 2021-05-20  3098  	lockdep_assert_held(&mm_list->loc=
k);
0c09e5f119fe20 Yu Zhao 2021-05-20  3099  =

0c09e5f119fe20 Yu Zhao 2021-05-20  3100  	for (i =3D 0; i < NR_MM_STATS; i+=
+) {
0c09e5f119fe20 Yu Zhao 2021-05-20  3101  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[hist][i],
0c09e5f119fe20 Yu Zhao 2021-05-20  3102  			   mm_list->nodes[nid].stats[hi=
st][i] + args->mm_stats[i]);
0c09e5f119fe20 Yu Zhao 2021-05-20  3103  		args->mm_stats[i] =3D 0;
0c09e5f119fe20 Yu Zhao 2021-05-20  3104  	}
0c09e5f119fe20 Yu Zhao 2021-05-20  3105  =

0c09e5f119fe20 Yu Zhao 2021-05-20  3106  	if (!last || NR_STAT_GENS =3D=3D =
1)
0c09e5f119fe20 Yu Zhao 2021-05-20  3107  		return;
0c09e5f119fe20 Yu Zhao 2021-05-20  3108  =

0c09e5f119fe20 Yu Zhao 2021-05-20  3109  	hist =3D hist_from_seq_or_gen(arg=
s->max_seq + 1);
0c09e5f119fe20 Yu Zhao 2021-05-20  3110  	for (i =3D 0; i < NR_MM_STATS; i+=
+)
0c09e5f119fe20 Yu Zhao 2021-05-20  3111  		WRITE_ONCE(mm_list->nodes[nid].s=
tats[hist][i], 0);
0c09e5f119fe20 Yu Zhao 2021-05-20  3112  }
0c09e5f119fe20 Yu Zhao 2021-05-20  3113  =


:::::: The code at line 3095 was first introduced by commit
:::::: 0c09e5f119fe208b6abf362197df921a81c18eea mm: multigenerational lru: =
mm_struct list

:::::: TO: Yu Zhao <yuzhao@google.com>
:::::: CC: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0233055731869360333==--

