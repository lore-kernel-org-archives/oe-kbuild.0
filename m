Content-Type: multipart/mixed; boundary="===============1268555507033028031=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/sfc/rx.c:110:3: warning: Value stored to 'n_frags' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 13 Dec 2021 19:11:33 +0800
Message-ID: <202112131911.fnc9GPd5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1268555507033028031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: c438a801e0bb2a4db1d3183a9482af891577a281 sfc: Use 'skb_add_rx_frag(=
)' instead of hand coding it
date:   8 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211213/202112131911.fnc9GPd5-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc438a801e0bb2a4db1d3183a9482af891577a281
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c438a801e0bb2a4db1d3183a9482af891577a281
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


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
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/md/dm-raid1.c:852:26: note: Loop condition is false.  Exiting lo=
op
           struct mirror_set *ms =3D container_of(work, struct mirror_set,
                                   ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
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
   drivers/md/dm-raid1.c:857:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&ms->lock, flags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/md/dm-raid1.c:857:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&ms->lock, flags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/md/dm-raid1.c:869:2: note: Calling 'do_writes'
           do_writes(ms, &writes);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-raid1.c:683:42: note: 'this_list' initialized to a null po=
inter value
           struct bio_list sync, nosync, recover, *this_list =3D NULL;
                                                   ^~~~~~~~~
   drivers/md/dm-raid1.c:688:6: note: Assuming field 'head' is non-null
           if (!writes->head)
               ^~~~~~~~~~~~~
   drivers/md/dm-raid1.c:688:2: note: Taking false branch
           if (!writes->head)
           ^
   drivers/md/dm-raid1.c:699:2: note: Loop condition is true.  Entering loo=
p body
           while ((bio =3D bio_list_pop(writes))) {
           ^
   drivers/md/dm-raid1.c:700:8: note: Assuming the condition is false
                   if ((bio->bi_opf & REQ_PREFLUSH) ||
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-raid1.c:700:7: note: Left side of '||' is false
                   if ((bio->bi_opf & REQ_PREFLUSH) ||
                       ^
   drivers/md/dm-raid1.c:701:8: note: Assuming the condition is false
                       (bio_op(bio) =3D=3D REQ_OP_DISCARD)) {
                        ^
   include/linux/blk_types.h:441:2: note: expanded from macro 'bio_op'
           ((bio)->bi_opf & REQ_OP_MASK)
           ^
   drivers/md/dm-raid1.c:700:3: note: Taking false branch
                   if ((bio->bi_opf & REQ_PREFLUSH) ||
                   ^
   drivers/md/dm-raid1.c:708:7: note: Assuming field 'is_remote_recovering'=
 is null
                   if (log->type->is_remote_recovering &&
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-raid1.c:708:39: note: Left side of '&&' is false
                   if (log->type->is_remote_recovering &&
                                                       ^
   drivers/md/dm-raid1.c:715:3: note: 'Default' branch taken. Execution con=
tinues on line 730
                   switch (state) {
                   ^
   drivers/md/dm-raid1.c:730:16: note: Passing null pointer value via 1st p=
arameter 'bl'
                   bio_list_add(this_list, bio);
                                ^~~~~~~~~
   drivers/md/dm-raid1.c:730:3: note: Calling 'bio_list_add'
                   bio_list_add(this_list, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bio.h:615:6: note: Access to field 'tail' results in a der=
eference of a null pointer (loaded from variable 'bl')
           if (bl->tail)
               ^~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/net/ethernet/sfc/rx.c:110:3: warning: Value stored to 'n_frags' =
is never read [clang-analyzer-deadcode.DeadStores]
                   n_frags =3D 0;
                   ^         ~
   drivers/net/ethernet/sfc/rx.c:110:3: note: Value stored to 'n_frags' is =
never read
                   n_frags =3D 0;
                   ^         ~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   include/linux/log2.h:57:13: warning: The result of the left shift is und=
efined due to shifting by '32', which is greater or equal to the width of t=
ype 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           return 1UL << fls_long(n - 1);
                      ^
   drivers/net/ethernet/sfc/rx_common.c:201:16: note: '?' condition is false
           entries =3D max(roundup_pow_of_two(efx->rxq_entries), EFX_MIN_DM=
AQ_SIZE);
                         ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/net/ethernet/sfc/rx_common.c:201:16: note: Calling '__roundup_po=
w_of_two'
           entries =3D max(roundup_pow_of_two(efx->rxq_entries), EFX_MIN_DM=
AQ_SIZE);
                         ^
   include/linux/log2.h:180:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __roundup_pow_of_two(n)                 \
           ^
   include/linux/minmax.h:58:33: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:44:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x =3D (x);               \
                                         ^
   include/linux/log2.h:57:16: note: Calling 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/bitops.h:187:2: note: Taking true branch
           if (sizeof(l) =3D=3D 4)
           ^
   include/linux/bitops.h:188:10: note: Calling 'fls'
                   return fls(l);
                          ^~~~~~
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
   include/linux/bitops.h:188:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:188:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/n_frags +110 drivers/net/ethernet/sfc/rx.c

8ceee660aacb29 drivers/net/sfc/rx.c          Ben Hutchings      2008-04-27 =
  65  =

85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  66  /* Allocate and construct an SKB around page fragments */
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  67  static struct sk_buff *efx_rx_mk_skb(struct efx_channel *channel,
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  68  				     struct efx_rx_buffer *rx_buf,
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  69  				     unsigned int n_frags,
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  70  				     u8 *eh, int hdr_len)
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  71  {
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  72  	struct efx_nic *efx =3D channel->efx;
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  73  	struct sk_buff *skb;
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  74  =

97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  75  	/* Allocate an SKB to store the headers */
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  76  	skb =3D netdev_alloc_skb(efx->net_dev,
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  77  			       efx->rx_ip_align + efx->rx_prefix_size +
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  78  			       hdr_len);
e4d112e4f95020 drivers/net/ethernet/sfc/rx.c Edward Cree        2014-07-15 =
  79  	if (unlikely(skb =3D=3D NULL)) {
e4d112e4f95020 drivers/net/ethernet/sfc/rx.c Edward Cree        2014-07-15 =
  80  		atomic_inc(&efx->n_rx_noskb_drops);
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  81  		return NULL;
e4d112e4f95020 drivers/net/ethernet/sfc/rx.c Edward Cree        2014-07-15 =
  82  	}
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  83  =

e01b16a7e217a2 drivers/net/ethernet/sfc/rx.c Edward Cree        2016-12-02 =
  84  	EFX_WARN_ON_ONCE_PARANOID(rx_buf->len < hdr_len);
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  85  =

2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  86  	memcpy(skb->data + efx->rx_ip_align, eh - efx->rx_prefix_size,
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  87  	       efx->rx_prefix_size + hdr_len);
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  88  	skb_reserve(skb, efx->rx_ip_align + efx->rx_prefix_size);
2ccd0b192534b1 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-11-28 =
  89  	__skb_put(skb, hdr_len);
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  90  =

85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  91  	/* Append the remaining page(s) onto the frag list */
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
  92  	if (rx_buf->len > hdr_len) {
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  93  		rx_buf->page_offset +=3D hdr_len;
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  94  		rx_buf->len -=3D hdr_len;
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  95  =

85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  96  		for (;;) {
c438a801e0bb2a drivers/net/ethernet/sfc/rx.c Christophe JAILLET 2021-04-04 =
  97  			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
  98  					rx_buf->page, rx_buf->page_offset,
c438a801e0bb2a drivers/net/ethernet/sfc/rx.c Christophe JAILLET 2021-04-04 =
  99  					rx_buf->len, efx->rx_buffer_truesize);
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 100  			rx_buf->page =3D NULL;
c438a801e0bb2a drivers/net/ethernet/sfc/rx.c Christophe JAILLET 2021-04-04 =
 101  =

85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 102  			if (skb_shinfo(skb)->nr_frags =3D=3D n_frags)
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 103  				break;
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 104  =

85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 105  			rx_buf =3D efx_rx_buf_next(&channel->rx_queue, rx_buf);
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 106  		}
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 107  	} else {
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 108  		__free_pages(rx_buf->page, efx->rx_buffer_order);
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
 109  		rx_buf->page =3D NULL;
85740cdf0b8422 drivers/net/ethernet/sfc/rx.c Ben Hutchings      2013-01-29 =
@110  		n_frags =3D 0;
18e1d2beb6c230 drivers/net/sfc/rx.c          Ben Hutchings      2009-10-29 =
 111  	}
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 112  =

97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 113  	/* Move past the ethernet header */
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 114  	skb->protocol =3D eth_type_trans(skb, efx->net_dev);
97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 115  =

36763266bbe8a2 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2014-07-22 =
 116  	skb_mark_napi_id(skb, &channel->napi_str);
36763266bbe8a2 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2014-07-22 =
 117  =

97d48a10c670f8 drivers/net/ethernet/sfc/rx.c Alexandre Rames    2013-01-11 =
 118  	return skb;
8ceee660aacb29 drivers/net/sfc/rx.c          Ben Hutchings      2008-04-27 =
 119  }
8ceee660aacb29 drivers/net/sfc/rx.c          Ben Hutchings      2008-04-27 =
 120  =


:::::: The code at line 110 was first introduced by commit
:::::: 85740cdf0b84224a9fce62dc9150008ef8d6ab4e sfc: Enable RX DMA scatteri=
ng where possible

:::::: TO: Ben Hutchings <bhutchings@solarflare.com>
:::::: CC: Ben Hutchings <bhutchings@solarflare.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1268555507033028031==--

