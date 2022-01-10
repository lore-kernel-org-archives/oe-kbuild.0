Content-Type: multipart/mixed; boundary="===============6623931794926551622=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC bpf-next v1 5/8] bpf: Introduce a new program type bpf_view.
Date: Mon, 10 Jan 2022 15:06:47 +0800
Message-ID: <202201101429.2XquVD3A-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6623931794926551622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220106215059.2308931-6-haoluo@google.com>
References: <20220106215059.2308931-6-haoluo@google.com>
TO: Hao Luo <haoluo@google.com>

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Pinning-bpf-object=
s-outside-bpffs/20220107-055252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220107 (https://download.01.org/0day-ci/archi=
ve/20220110/202201101429.2XquVD3A-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167b=
fe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/f3a5b66e45ed0d7bdc610cce2=
e0b6a3c606dbb95
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Pinning-bpf-objects-outsid=
e-bpffs/20220107-055252
        git checkout f3a5b66e45ed0d7bdc610cce2e0b6a3c606dbb95
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/mballoc.c:5817:3: note: Value stored to 'err' is never read
                   err =3D PTR_ERR(bitmap_bh);
                   ^     ~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   fs/xfs/libxfs/xfs_attr.c:1243:2: warning: Value stored to 'error' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr.c:1243:2: note: Value stored to 'error' is never =
read
           error =3D xfs_attr_node_removename(args, state);
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: warning: Value stored to 'drop_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2243:29: note: Value stored to 'drop_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *drop_leaf =3D drop_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: warning: Value stored to 'save_le=
af' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_attr_leaf.c:2244:29: note: Value stored to 'save_leaf'=
 during its initialization is never read
           struct xfs_attr_leafblock *save_leaf =3D save_blk->bp->b_addr;
                                      ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   fs/xfs/xfs_reflink.c:1151:3: warning: Value stored to 'qdelta' is never =
read [clang-analyzer-deadcode.DeadStores]
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_reflink.c:1151:3: note: Value stored to 'qdelta' is never read
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_reflink.c:1326:2: warning: Value stored to 'ret' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           ret =3D -EINVAL;
           ^     ~~~~~~~
   fs/xfs/xfs_reflink.c:1326:2: note: Value stored to 'ret' is never read
           ret =3D -EINVAL;
           ^     ~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/clk/clk-max9485.c:199:9: warning: Access to field 'out' results =
in a dereference of a null pointer (loaded from variable 'prev') [clang-ana=
lyzer-core.NullDereference]
           return prev->out;
                  ^~~~
   drivers/clk/clk-max9485.c:165:36: note: 'prev' initialized to a null poi=
nter value
           const struct max9485_rate *curr, *prev =3D NULL;
                                             ^~~~
   drivers/clk/clk-max9485.c:167:29: note: Assuming field 'out' is equal to=
 0
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
                                      ^~~~~~~~~~~~~~
   drivers/clk/clk-max9485.c:167:2: note: Loop condition is false. Executio=
n continues on line 199
           for (curr =3D max9485_rates; curr->out !=3D 0; curr++) {
           ^
   drivers/clk/clk-max9485.c:199:9: note: Access to field 'out' results in =
a dereference of a null pointer (loaded from variable 'prev')
           return prev->out;
                  ^~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
>> kernel/bpf/bpf_view.c:151:36: warning: Array subscript is undefined [cla=
ng-analyzer-core.uninitialized.ArraySubscript]
                   target->ctx_arg_info[i].btf_id =3D bpf_view_btf_ids[idx[=
i]];
                                                    ^
   kernel/bpf/bpf_view.c:174:2: note: Calling 'register_bpf_view_target'
           register_bpf_view_target(&cgroup_view_tinfo, cgroup_view_idx);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_view.c:150:14: note: Assuming 'i' is < field 'ctx_arg_inf=
o_size'
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_view.c:150:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
           ^
   kernel/bpf/bpf_view.c:150:14: note: Assuming 'i' is < field 'ctx_arg_inf=
o_size'
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_view.c:150:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
           ^
   kernel/bpf/bpf_view.c:150:45: note: The value 2 is assigned to 'i'
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
                                                      ^~~
   kernel/bpf/bpf_view.c:150:14: note: Assuming 'i' is < field 'ctx_arg_inf=
o_size'
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_view.c:150:2: note: Loop condition is true.  Entering loo=
p body
           for (i =3D 0; i < target->ctx_arg_info_size; ++i)
           ^
   kernel/bpf/bpf_view.c:151:36: note: Array subscript is undefined
                   target->ctx_arg_info[i].btf_id =3D bpf_view_btf_ids[idx[=
i]];
                                                    ^                ~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   mm/slab.c:1645:2: warning: Assigned value is garbage or undefined [clang=
-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(page, n, list, slab_list) {
           ^
   include/linux/list.h:718:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:557:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:513:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   mm/slab.c:4135:6: note: Assuming 'count' is <=3D MAX_SLABINFO_WRITE
           if (count > MAX_SLABINFO_WRITE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:4135:2: note: Taking false branch
           if (count > MAX_SLABINFO_WRITE)
           ^
   mm/slab.c:4137:2: note: Taking false branch
           if (copy_from_user(&kbuf, buffer, count))
           ^
   mm/slab.c:4142:6: note: Assuming 'tmp' is non-null
           if (!tmp)
               ^~~~
   mm/slab.c:4142:2: note: Taking false branch
           if (!tmp)
           ^
   mm/slab.c:4146:6: note: Assuming the condition is false
           if (sscanf(tmp, " %d %d %d", &limit, &batchcount, &shared) !=3D =
3)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:4146:2: note: Taking false branch
           if (sscanf(tmp, " %d %d %d", &limit, &batchcount, &shared) !=3D =
3)
           ^
   mm/slab.c:4152:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(cachep, &slab_caches, list) {
           ^
   include/linux/list.h:630:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   mm/slab.c:4153:7: note: Assuming the condition is true
                   if (!strcmp(cachep->name, kbuf)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slab.c:4153:3: note: Taking true branch
                   if (!strcmp(cachep->name, kbuf)) {
                   ^
   mm/slab.c:4154:8: note: Assuming 'limit' is >=3D 1
                           if (limit < 1 || batchcount < 1 ||
                               ^~~~~~~~~
   mm/slab.c:4154:8: note: Left side of '||' is false
   mm/slab.c:4154:21: note: Assuming 'batchcount' is >=3D 1
                           if (limit < 1 || batchcount < 1 ||
                                            ^~~~~~~~~~~~~~
   mm/slab.c:4154:8: note: Left side of '||' is false
                           if (limit < 1 || batchcount < 1 ||
                               ^
   mm/slab.c:4155:6: note: Assuming 'batchcount' is <=3D 'limit'
                                           batchcount > limit || shared < 0=
) {
                                           ^~~~~~~~~~~~~~~~~~
   mm/slab.c:4154:8: note: Left side of '||' is false

vim +151 kernel/bpf/bpf_view.c

f3a5b66e45ed0d Hao Luo 2022-01-06  144  =

f3a5b66e45ed0d Hao Luo 2022-01-06  145  static void register_bpf_view_targe=
t(struct bpf_view_target_info *target,
f3a5b66e45ed0d Hao Luo 2022-01-06  146  				     int idx[BPF_VIEW_CTX_ARG_M=
AX])
f3a5b66e45ed0d Hao Luo 2022-01-06  147  {
f3a5b66e45ed0d Hao Luo 2022-01-06  148  	int i;
f3a5b66e45ed0d Hao Luo 2022-01-06  149  =

f3a5b66e45ed0d Hao Luo 2022-01-06  150  	for (i =3D 0; i < target->ctx_arg_=
info_size; ++i)
f3a5b66e45ed0d Hao Luo 2022-01-06 @151  		target->ctx_arg_info[i].btf_id =
=3D bpf_view_btf_ids[idx[i]];
f3a5b66e45ed0d Hao Luo 2022-01-06  152  =

f3a5b66e45ed0d Hao Luo 2022-01-06  153  	INIT_LIST_HEAD(&target->list);
f3a5b66e45ed0d Hao Luo 2022-01-06  154  	list_add(&target->list, &targets);
f3a5b66e45ed0d Hao Luo 2022-01-06  155  }
f3a5b66e45ed0d Hao Luo 2022-01-06  156  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6623931794926551622==--

