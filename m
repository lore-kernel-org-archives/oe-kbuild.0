Content-Type: multipart/mixed; boundary="===============3974081478219186545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/brocade/bna/bnad.c:286:30: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Sun, 28 Nov 2021 16:03:53 +0800
Message-ID: <202111281607.DK4Syj5Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3974081478219186545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jakub Jelinek <jakub@redhat.com>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 2f78788b55baa3410b1ec91a576286abe1ad4d6a ilog2: improve ilog2 for c=
onstant arguments
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211128/202111281607.DK4Syj5Y-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2f78788b55baa3410b1ec91a576286abe1ad4d6a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2f78788b55baa3410b1ec91a576286abe1ad4d6a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1243:3: note: Taking false branch
                   if (!ccb)
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1248:3: note: Loop condition is =
true.  Entering loop body
                   for (j =3D 0; j < BNAD_MAX_RXQ_PER_RXP; j++) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1250:8: note: Assuming 'rcb' is =
non-null
                           if (!rcb)
                               ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1250:4: note: Taking false branch
                           if (!rcb)
                           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1253:4: note: Calling 'bnad_rxq_=
alloc_init'
                           bnad_rxq_alloc_init(bnad, rcb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:10: note: Calling 'get_order'
           order =3D get_order(rcb->rxq->buffer_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/getorder.h:31:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/asm-generic/getorder.h:44:9: note: Calling 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/bitops/fls.h:15:2: note: 'r' initialized to 32
           int r =3D 32;
           ^~~~~
   include/asm-generic/bitops/fls.h:17:6: note: Assuming 'x' is not equal t=
o 0, which participates in a condition later
           if (!x)
               ^~
   include/asm-generic/bitops/fls.h:17:2: note: Taking false branch
           if (!x)
           ^
   include/asm-generic/bitops/fls.h:19:6: note: Assuming the condition is f=
alse
           if (!(x & 0xffff0000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   include/asm-generic/getorder.h:44:9: note: Returning from 'fls'
           return fls(size);
                  ^~~~~~~~~
   include/asm-generic/getorder.h:44:2: note: Returning the value 32
           return fls(size);
           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:10: note: Returning from 'ge=
t_order'
           order =3D get_order(rcb->rxq->buffer_size);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:266:2: note: The value 32 is ass=
igned to 'order'
           order =3D get_order(rcb->rxq->buffer_size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:6: note: Assuming the condit=
ion is true
           if (bna_is_small_rxq(rcb->id)) {
               ^
   drivers/net/ethernet/brocade/bna/bna.h:23:32: note: expanded from macro =
'bna_is_small_rxq'
   #define bna_is_small_rxq(_id) ((_id) & 0x1)
                                  ^~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:2: note: Taking true branch
           if (bna_is_small_rxq(rcb->id)) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:286:20: note: The result of the =
left shift is undefined due to shifting by '32', which is greater or equal =
to the width of type 'unsigned long'
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                             ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
>> drivers/net/ethernet/brocade/bna/bnad.c:286:30: warning: Division by zer=
o [clang-analyzer-core.DivideZero]
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                                       ^
   drivers/net/ethernet/brocade/bna/bnad.c:1240:2: note: Loop condition is =
true.  Entering loop body
           for (i =3D 0; i < BNAD_MAX_RXP_PER_RX; i++) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1243:7: note: Assuming 'ccb' is =
non-null
                   if (!ccb)
                       ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1243:3: note: Taking false branch
                   if (!ccb)
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1248:3: note: Loop condition is =
true.  Entering loop body
                   for (j =3D 0; j < BNAD_MAX_RXQ_PER_RXP; j++) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1250:8: note: Assuming 'rcb' is =
non-null
                           if (!rcb)
                               ^~~~
   drivers/net/ethernet/brocade/bna/bnad.c:1250:4: note: Taking false branch
                           if (!rcb)
                           ^
   drivers/net/ethernet/brocade/bna/bnad.c:1253:4: note: Calling 'bnad_rxq_=
alloc_init'
                           bnad_rxq_alloc_init(bnad, rcb);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:6: note: Assuming the condit=
ion is false
           if (bna_is_small_rxq(rcb->id)) {
               ^
   drivers/net/ethernet/brocade/bna/bna.h:23:32: note: expanded from macro =
'bna_is_small_rxq'
   #define bna_is_small_rxq(_id) ((_id) & 0x1)
                                  ^~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:270:2: note: Taking false branch
           if (bna_is_small_rxq(rcb->id)) {
           ^
   drivers/net/ethernet/brocade/bna/bnad.c:274:7: note: Assuming field 'mul=
ti_buffer' is 0
                   if (rcb->rxq->multi_buffer) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:274:3: note: Taking false branch
                   if (rcb->rxq->multi_buffer) {
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:281:6: note: Assuming field 'buf=
fer_size' is > 2048
                                   (rcb->rxq->buffer_size > 2048) ?
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:281:5: note: '?' condition is tr=
ue
                                   (rcb->rxq->buffer_size > 2048) ?
                                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:280:4: note: The value 0 is assi=
gned to field 'map_size'
                           unmap_q->map_size =3D
                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bnad.c:286:30: note: Division by zero
           BUG_ON((PAGE_SIZE << order) % unmap_q->map_size);
                                       ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   drivers/net/ethernet/brocade/bna/bnad.c:396:3: warning: Assigned value i=
s garbage or undefined [clang-analyzer-core.uninitialized.Assign]
                   BNA_SET_DMA_ADDR(dma_addr, &rxent->host_addr);
                   ^
   drivers/net/ethernet/brocade/bna/bna.h:34:23: note: expanded from macro =
'BNA_SET_DMA_ADDR'
           (_bna_dma_addr)->lsb =3D ((struct bna_dma_addr *)&tmp_addr)->lsb=
; \
                                ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Left side of '&&' =
is false
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Taking false branch
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:295:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/net/ethernet/brocade/bna/bnad.c:1860:3: note: Loop condition is =
false.  Exiting loop
                   container_of(napi, struct bnad_rx_ctrl, napi);
                   ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)

vim +286 drivers/net/ethernet/brocade/bna/bnad.c

5216562a2ccd03 Rasesh Mody 2012-12-11  256  =

30f9fc947938d4 Rasesh Mody 2012-12-11  257  /* Default is page-based alloca=
tion. Multi-buffer support - TBD */
30f9fc947938d4 Rasesh Mody 2012-12-11  258  static int
30f9fc947938d4 Rasesh Mody 2012-12-11  259  bnad_rxq_alloc_init(struct bnad=
 *bnad, struct bna_rcb *rcb)
30f9fc947938d4 Rasesh Mody 2012-12-11  260  {
30f9fc947938d4 Rasesh Mody 2012-12-11  261  	struct bnad_rx_unmap_q *unmap_=
q =3D rcb->unmap_q;
e29aa33912dd71 Rasesh Mody 2013-12-17  262  	int order;
5216562a2ccd03 Rasesh Mody 2012-12-11  263  =

30f9fc947938d4 Rasesh Mody 2012-12-11  264  	bnad_rxq_alloc_uninit(bnad, rc=
b);
30f9fc947938d4 Rasesh Mody 2012-12-11  265  =

e29aa33912dd71 Rasesh Mody 2013-12-17  266  	order =3D get_order(rcb->rxq->=
buffer_size);
e29aa33912dd71 Rasesh Mody 2013-12-17  267  =

e29aa33912dd71 Rasesh Mody 2013-12-17  268  	unmap_q->type =3D BNAD_RXBUF_P=
AGE;
30f9fc947938d4 Rasesh Mody 2012-12-11  269  =

30f9fc947938d4 Rasesh Mody 2012-12-11  270  	if (bna_is_small_rxq(rcb->id))=
 {
30f9fc947938d4 Rasesh Mody 2012-12-11  271  		unmap_q->alloc_order =3D 0;
30f9fc947938d4 Rasesh Mody 2012-12-11  272  		unmap_q->map_size =3D rcb->rx=
q->buffer_size;
e29aa33912dd71 Rasesh Mody 2013-12-17  273  	} else {
e29aa33912dd71 Rasesh Mody 2013-12-17  274  		if (rcb->rxq->multi_buffer) {
e29aa33912dd71 Rasesh Mody 2013-12-17  275  			unmap_q->alloc_order =3D 0;
e29aa33912dd71 Rasesh Mody 2013-12-17  276  			unmap_q->map_size =3D rcb->r=
xq->buffer_size;
e29aa33912dd71 Rasesh Mody 2013-12-17  277  			unmap_q->type =3D BNAD_RXBUF=
_MULTI_BUFF;
30f9fc947938d4 Rasesh Mody 2012-12-11  278  		} else {
30f9fc947938d4 Rasesh Mody 2012-12-11  279  			unmap_q->alloc_order =3D ord=
er;
30f9fc947938d4 Rasesh Mody 2012-12-11  280  			unmap_q->map_size =3D
30f9fc947938d4 Rasesh Mody 2012-12-11  281  				(rcb->rxq->buffer_size > 20=
48) ?
30f9fc947938d4 Rasesh Mody 2012-12-11  282  				PAGE_SIZE << order : 2048;
30f9fc947938d4 Rasesh Mody 2012-12-11  283  		}
e29aa33912dd71 Rasesh Mody 2013-12-17  284  	}
30f9fc947938d4 Rasesh Mody 2012-12-11  285  =

ebb56d37abab04 Ivan Vecera 2015-06-17 @286  	BUG_ON((PAGE_SIZE << order) % =
unmap_q->map_size);
30f9fc947938d4 Rasesh Mody 2012-12-11  287  =

30f9fc947938d4 Rasesh Mody 2012-12-11  288  	return 0;
30f9fc947938d4 Rasesh Mody 2012-12-11  289  }
30f9fc947938d4 Rasesh Mody 2012-12-11  290  =


:::::: The code at line 286 was first introduced by commit
:::::: ebb56d37abab0465a95710d32263c9b3e0b1f6c5 bna: remove superfluous par=
entheses

:::::: TO: Ivan Vecera <ivecera@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3974081478219186545==--

