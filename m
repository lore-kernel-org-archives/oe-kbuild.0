Content-Type: multipart/mixed; boundary="===============8259697991741812427=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_xsk.c:274:6: warning: Value stored to 'cleaned_count' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 15:45:32 +0800
Message-ID: <202201021531.WqxLNEDn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8259697991741812427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Dumitrescu <cristian.dumitrescu@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: f12738b6ec063b1b63ff2232fd203d13a6ec2468 i40e: remove unnecessary c=
leaned_count updates
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220102/202201021531.WqxLNEDn-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df12738b6ec063b1b63ff2232fd203d13a6ec2468
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f12738b6ec063b1b63ff2232fd203d13a6ec2468
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/tree-log.c:4204:8: note: 'ret' is 0
                   if (!ret)
                        ^~~
   fs/btrfs/tree-log.c:4204:3: note: Taking true branch
                   if (!ret)
                   ^
   fs/btrfs/tree-log.c:4207:3: note: Memory is released
                   kfree(sums);
                   ^~~~~~~~~~~
   fs/btrfs/tree-log.c:4200:2: note: Loop condition is true.  Entering loop=
 body
           while (!list_empty(&ordered_sums)) {
           ^
   fs/btrfs/tree-log.c:4201:36: note: Left side of '&&' is false
                   struct btrfs_ordered_sum *sums =3D list_entry(ordered_su=
ms.next,
                                                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/tree-log.c:4201:36: note: Taking false branch
                   struct btrfs_ordered_sum *sums =3D list_entry(ordered_su=
ms.next,
                                                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/tree-log.c:4201:36: note: Loop condition is false.  Exiting loop
                   struct btrfs_ordered_sum *sums =3D list_entry(ordered_su=
ms.next,
                                                    ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/tree-log.c:4204:7: note: Assuming 'ret' is not equal to 0
                   if (!ret)
                       ^~~~
   fs/btrfs/tree-log.c:4204:3: note: Taking false branch
                   if (!ret)
                   ^
   fs/btrfs/tree-log.c:4206:3: note: Calling 'list_del'
                   list_del(&sums->list);
                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:147:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3781:3: warning: Valu=
e stored to 'aq_ret' is never read [clang-analyzer-deadcode.DeadStores]
                   aq_ret =3D I40E_ERR_PARAM;
                   ^        ~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3781:3: note: Value s=
tored to 'aq_ret' is never read
                   aq_ret =3D I40E_ERR_PARAM;
                   ^        ~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> drivers/net/ethernet/intel/i40e/i40e_xsk.c:274:6: warning: Value stored =
to 'cleaned_count' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           u16 cleaned_count =3D I40E_DESC_UNUSED(rx_ring);
               ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_xsk.c:274:6: note: Value stored to =
'cleaned_count' during its initialization is never read
           u16 cleaned_count =3D I40E_DESC_UNUSED(rx_ring);
               ^~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:10755:3: warning: Value st=
ored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:10755:3: note: Value store=
d to 'err' is never read
                   err =3D 0;
                   ^     ~
   include/linux/page-flags.h:184:23: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           unsigned long head =3D READ_ONCE(page->compound_head);
                                ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3146:5: note: Left side of=
 '&&' is false
                                   container_of(napi, struct ixgbe_q_vector=
, napi);
                                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3146:5: note: Taking false=
 branch
                                   container_of(napi, struct ixgbe_q_vector=
, napi);
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3146:5: note: Loop conditi=
on is false.  Exiting loop
                                   container_of(napi, struct ixgbe_q_vector=
, napi);
                                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3157:22: note: Assuming 'r=
ing' is equal to null
           ixgbe_for_each_ring(ring, q_vector->tx) {
                               ^
   drivers/net/ethernet/intel/ixgbe/ixgbe.h:437:26: note: expanded from mac=
ro 'ixgbe_for_each_ring'
           for (pos =3D (head).ring; pos !=3D NULL; pos =3D pos->next)
                                   ^~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3157:2: note: Loop conditi=
on is false. Execution continues on line 3167
           ixgbe_for_each_ring(ring, q_vector->tx) {
           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe.h:437:2: note: expanded from macr=
o 'ixgbe_for_each_ring'
           for (pos =3D (head).ring; pos !=3D NULL; pos =3D pos->next)
           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3167:6: note: Assuming 'bu=
dget' is > 0
           if (budget <=3D 0)
               ^~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3167:2: note: Taking false=
 branch
           if (budget <=3D 0)
           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3172:6: note: Assuming fie=
ld 'count' is <=3D 1
           if (q_vector->rx.count > 1)
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3172:2: note: Taking false=
 branch
           if (q_vector->rx.count > 1)
           ^
   drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3177:22: note: Assuming 'r=
ing' is not equal to null
           ixgbe_for_each_ring(ring, q_vector->rx) {

vim +/cleaned_count +274 drivers/net/ethernet/intel/i40e/i40e_xsk.c

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  263  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  264  /**
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  265   * i40e_clean=
_rx_irq_zc - Consumes Rx packets from the hardware ring
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  266   * @rx_ring: =
Rx ring
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  267   * @budget: N=
API budget
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  268   *
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  269   * Returns am=
ount of work completed
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  270   **/
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  271  int i40e_clea=
n_rx_irq_zc(struct i40e_ring *rx_ring, int budget)
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  272  {
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  273  	unsigned int=
 total_rx_bytes =3D 0, total_rx_packets =3D 0;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28 @274  	u16 cleaned_=
count =3D I40E_DESC_UNUSED(rx_ring);
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  275  	u16 next_to_clean =3D =
rx_ring->next_to_clean;
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  276  	u16 count_mask =3D rx_=
ring->count - 1;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  277  	unsigned int=
 xdp_res, xdp_xmit =3D 0;
1773482fd8cecd Dan Carpenter       2020-09-16  278  	bool failure =3D false;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  279  	struct sk_bu=
ff *skb;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  280  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  281  	while (likel=
y(total_rx_packets < (unsigned int)budget)) {
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  282  		union i40e_=
rx_desc *rx_desc;
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  283  		struct xdp_=
buff **bi;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  284  		unsigned in=
t size;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  285  		u64 qword;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  286  =

c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  287  		rx_desc =3D I40E_RX_D=
ESC(rx_ring, next_to_clean);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  288  		qword =3D l=
e64_to_cpu(rx_desc->wb.qword1.status_error_len);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  289  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  290  		/* This mem=
ory barrier is needed to keep us from reading
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  291  		 * any othe=
r fields out of the rx_desc until we have
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  292  		 * verified=
 the descriptor has been written back.
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  293  		 */
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  294  		dma_rmb();
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  295  =

be1222b585fdc4 Bj=C3=B6rn T=C3=B6pel         2020-05-20  296  		if (i40e_rx=
_is_programming_status(qword)) {
be1222b585fdc4 Bj=C3=B6rn T=C3=B6pel         2020-05-20  297  			i40e_clean=
_programming_status(rx_ring,
be1222b585fdc4 Bj=C3=B6rn T=C3=B6pel         2020-05-20  298  						      r=
x_desc->raw.qword[0],
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  299  						      q=
word);
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  300  			bi =3D i40e_rx_bi(rx=
_ring, next_to_clean);
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  301  			xsk_buff_f=
ree(*bi);
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  302  			*bi =3D NU=
LL;
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  303  			next_to_clean =3D (n=
ext_to_clean + 1) & count_mask;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  304  			continue;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  305  		}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  306  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  307  		size =3D (q=
word & I40E_RXD_QW1_LENGTH_PBUF_MASK) >>
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  308  		       I40E=
_RXD_QW1_LENGTH_PBUF_SHIFT;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  309  		if (!size)
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  310  			break;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  311  =

c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  312  		bi =3D i40e_rx_bi(rx_=
ring, next_to_clean);
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  313  		(*bi)->data=
_end =3D (*bi)->data + size;
9647c57b11e563 Magnus Karlsson     2020-08-28  314  		xsk_buff_dma_sync_for=
_cpu(*bi, rx_ring->xsk_pool);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  315  =

3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  316  		xdp_res =3D=
 i40e_run_xdp_zc(rx_ring, *bi);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  317  		if (xdp_res=
) {
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  318  			if (xdp_re=
s & (I40E_XDP_TX | I40E_XDP_REDIR))
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  319  				xdp_xmit =
|=3D xdp_res;
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  320  			else
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  321  				xsk_buff_=
free(*bi);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  322  =

3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  323  			*bi =3D NU=
LL;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  324  			total_rx_b=
ytes +=3D size;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  325  			total_rx_p=
ackets++;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  326  =

c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  327  			next_to_clean =3D (n=
ext_to_clean + 1) & count_mask;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  328  			continue;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  329  		}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  330  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  331  		/* XDP_PASS=
 path */
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  332  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  333  		/* NB! We a=
re not checking for errors using
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  334  		 * i40e_tes=
t_staterr with
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  335  		 * BIT(I40E=
_RXD_QW1_ERROR_SHIFT). This is due to that
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  336  		 * SBP is *=
not* set in PRT_SBPVSI (default not set).
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  337  		 */
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel         2020-05-20  338  		skb =3D i40=
e_construct_skb_zc(rx_ring, *bi);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  339  		if (!skb) {
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  340  			rx_ring->r=
x_stats.alloc_buff_failed++;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  341  			break;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  342  		}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  343  =

7128c834d30e6b Cristian Dumitrescu 2021-01-11  344  		*bi =3D NULL;
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  345  		next_to_clean =3D (ne=
xt_to_clean + 1) & count_mask;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  346  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  347  		if (eth_skb=
_pad(skb))
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  348  			continue;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  349  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  350  		total_rx_by=
tes +=3D skb->len;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  351  		total_rx_pa=
ckets++;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  352  =

800b8f637d07cc Micha=C5=82 Miros=C5=82aw     2018-12-04  353  		i40e_proces=
s_skb_fields(rx_ring, rx_desc, skb);
2a508c64ad278d Micha=C5=82 Miros=C5=82aw     2018-12-04  354  		napi_gro_re=
ceive(&rx_ring->q_vector->napi, skb);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  355  	}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  356  =

c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  357  	rx_ring->next_to_clean=
 =3D next_to_clean;
f12738b6ec063b Cristian Dumitrescu 2021-01-14  358  	cleaned_count =3D (nex=
t_to_clean - rx_ring->next_to_use - 1) & count_mask;
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  359  =

8cbf7414990338 Bj=C3=B6rn T=C3=B6pel         2020-08-25  360  	if (cleaned_=
count >=3D I40E_RX_BUFFER_WRITE)
8cbf7414990338 Bj=C3=B6rn T=C3=B6pel         2020-08-25  361  		failure =3D=
 !i40e_alloc_rx_buffers_zc(rx_ring, cleaned_count);
8cbf7414990338 Bj=C3=B6rn T=C3=B6pel         2020-08-25  362  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  363  	i40e_finaliz=
e_xdp_rx(rx_ring, xdp_xmit);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  364  	i40e_update_=
rx_stats(rx_ring, total_rx_bytes, total_rx_packets);
3d0c5f1cd268fd Magnus Karlsson     2019-08-14  365  =

c4655761d3cf62 Magnus Karlsson     2020-08-28  366  	if (xsk_uses_need_wake=
up(rx_ring->xsk_pool)) {
c8a8ca3408dcd2 Cristian Dumitrescu 2021-01-14  367  		if (failure || next_t=
o_clean =3D=3D rx_ring->next_to_use)
c4655761d3cf62 Magnus Karlsson     2020-08-28  368  			xsk_set_rx_need_wake=
up(rx_ring->xsk_pool);
3d0c5f1cd268fd Magnus Karlsson     2019-08-14  369  		else
c4655761d3cf62 Magnus Karlsson     2020-08-28  370  			xsk_clear_rx_need_wa=
keup(rx_ring->xsk_pool);
3d0c5f1cd268fd Magnus Karlsson     2019-08-14  371  =

3d0c5f1cd268fd Magnus Karlsson     2019-08-14  372  		return (int)total_rx_=
packets;
3d0c5f1cd268fd Magnus Karlsson     2019-08-14  373  	}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  374  	return failu=
re ? budget : (int)total_rx_packets;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  375  }
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel         2018-08-28  376  =


:::::: The code at line 274 was first introduced by commit
:::::: 0a714186d3c0f7c563a03537f98716457c1f5ae0 i40e: add AF_XDP zero-copy =
Rx support

:::::: TO: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8259697991741812427==--

