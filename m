Content-Type: multipart/mixed; boundary="===============2562796439723870176=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_xsk.c:221:3: warning: Value stored to 'xdp' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 11 Jan 2022 03:30:12 +0800
Message-ID: <202201110331.onpYvsQi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2562796439723870176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Magnus Karlsson <magnus.karlsson@intel.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df0cc57e057f18e44dac8e6c18aba47ab53202f9
commit: 6aab0bb0c5cdc02d6f182ada2d86afae0c22fc76 i40e: Use the xsk batched =
rx allocation interface
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-c007-20220101 (https://download.01.org/0day-ci/ar=
chive/20220111/202201110331.onpYvsQi-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c05440=
2170cd8466683a20385befc0523aba3359)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6aab0bb0c5cdc02d6f182ada2d86afae0c22fc76
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6aab0bb0c5cdc02d6f182ada2d86afae0c22fc76
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/zlib.c:98:32: note: Loop condition is false.  Exiting loop
           struct workspace *workspace =3D list_entry(ws, struct workspace,=
 list);
                                         ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/zlib.c:99:2: note: 'ret' declared without an initial value
           int ret;
           ^~~~~~~
   fs/btrfs/zlib.c:115:6: note: Assuming the condition is false
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
               ^
   include/linux/zlib.h:148:25: note: expanded from macro 'Z_OK'
   #define Z_OK            0
                           ^
   fs/btrfs/zlib.c:115:2: note: Taking false branch
           if (Z_OK !=3D zlib_deflateInit(&workspace->strm, workspace->leve=
l)) {
           ^
   fs/btrfs/zlib.c:125:6: note: Assuming 'out_page' is not equal to NULL
           if (out_page =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:125:2: note: Taking false branch
           if (out_page =3D=3D NULL) {
           ^
   fs/btrfs/zlib.c:138:9: note: Assuming 'len' is <=3D field 'total_in'
           while (workspace->strm.total_in < len) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/zlib.c:138:2: note: Loop condition is false. Execution continue=
s on line 217
           while (workspace->strm.total_in < len) {
           ^
   fs/btrfs/zlib.c:222:13: note: The left operand of '!=3D' is a garbage va=
lue
           while (ret !=3D Z_STREAM_END) {
                  ~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/iio/adc/ltc2497.c:18:8: warning: Excessive padding in 'struct lt=
c2497_driverdata' (84 padding bytes, where 20 is optimal). =

   Optimal fields order: =

   buf, =

   client, =

   common_ddata, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ltc2497_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ltc2497.c:18:8: note: Excessive padding in 'struct ltc24=
97_driverdata' (84 padding bytes, where 20 is optimal). Optimal fields orde=
r: buf, client, common_ddata, consider reordering the fields or adding expl=
icit padding members
   struct ltc2497_driverdata {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3843:3: warning: Valu=
e stored to 'aq_ret' is never read [clang-analyzer-deadcode.DeadStores]
                   aq_ret =3D I40E_ERR_PARAM;
                   ^        ~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3843:3: note: Value s=
tored to 'aq_ret' is never read
                   aq_ret =3D I40E_ERR_PARAM;
                   ^        ~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
>> drivers/net/ethernet/intel/i40e/i40e_xsk.c:221:3: warning: Value stored =
to 'xdp' is never read [clang-analyzer-deadcode.DeadStores]
                   xdp =3D i40e_rx_bi(rx_ring, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_xsk.c:221:3: note: Value stored to =
'xdp' is never read
                   xdp =3D i40e_rx_bi(rx_ring, 0);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_xsk.c:327:6: warning: Value stored =
to 'cleaned_count' during its initialization is never read [clang-analyzer-=
deadcode.DeadStores]
           u16 cleaned_count =3D I40E_DESC_UNUSED(rx_ring);
               ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_xsk.c:327:6: note: Value stored to =
'cleaned_count' during its initialization is never read
           u16 cleaned_count =3D I40E_DESC_UNUSED(rx_ring);
               ^~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/message/fusion/mptscsih.c:1769:2: warning: Value stored to 'retv=
al' is never read [clang-analyzer-deadcode.DeadStores]
           retval =3D mptscsih_IssueTaskMgmt(hd,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptscsih.c:1769:2: note: Value stored to 'retval'=
 is never read
           retval =3D mptscsih_IssueTaskMgmt(hd,
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/message/fusion/mptspi.c:133:4: warning: Value stored to 'factor'=
 is never read [clang-analyzer-deadcode.DeadStores]
                           factor =3D pspi_data->minSyncFactor;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptspi.c:133:4: note: Value stored to 'factor' is=
 never read
                           factor =3D pspi_data->minSyncFactor;
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptspi.c:602:7: warning: Assigned value is garbag=
e or undefined [clang-analyzer-core.uninitialized.Assign]
           nego =3D le32_to_cpu(spi_dev_pg0.NegotiatedParameters);
                ^
   drivers/message/fusion/mptspi.c:1259:3: note: Left side of '&&' is false
                   container_of(work, struct work_queue_wrapper, work);
                   ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/message/fusion/mptspi.c:1259:3: note: Taking false branch
                   container_of(work, struct work_queue_wrapper, work);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/message/fusion/mptspi.c:1259:3: note: Loop condition is false.  =
Exiting loop
                   container_of(work, struct work_queue_wrapper, work);
                   ^
   include/linux/kernel.h:495:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:322:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:310:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/message/fusion/mptspi.c:1269:6: note: Assuming field 'spi_pendin=
g' is 0
           if (hd->spi_pending) {
               ^~~~~~~~~~~~~~~
   drivers/message/fusion/mptspi.c:1269:2: note: Taking false branch
           if (hd->spi_pending) {
           ^
   drivers/message/fusion/mptspi.c:1281:3: note: Loop condition is true.  E=
ntering loop body
                   shost_for_each_device(sdev, ioc->sh)

vim +/xdp +221 drivers/net/ethernet/intel/i40e/i40e_xsk.c

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  191  =

3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel     2020-05-20  192  bool i40e_alloc_r=
x_buffers_zc(struct i40e_ring *rx_ring, u16 count)
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  193  {
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  194  	u16 ntu =3D rx_r=
ing->next_to_use;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  195  	union i40e_rx_de=
sc *rx_desc;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  196  	struct xdp_buff **xdp;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  197  	u32 nb_buffs, i;
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel     2020-05-20  198  	dma_addr_t dma;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  199  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  200  	rx_desc =3D I40E=
_RX_DESC(rx_ring, ntu);
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  201  	xdp =3D i40e_rx_bi(rx_ring=
, ntu);
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  202  =

6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  203  	nb_buffs =3D min_t(u16, co=
unt, rx_ring->count - ntu);
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  204  	nb_buffs =3D xsk_buff_allo=
c_batch(rx_ring->xsk_pool, xdp, nb_buffs);
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  205  	if (!nb_buffs)
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  206  		return false;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  207  =

6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  208  	i =3D nb_buffs;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  209  	while (i--) {
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  210  		dma =3D xsk_buff_xdp_get_=
dma(*xdp);
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel     2020-05-20  211  		rx_desc->read.p=
kt_addr =3D cpu_to_le64(dma);
3b4f0b66c2b3dc Bj=C3=B6rn T=C3=B6pel     2020-05-20  212  		rx_desc->read.h=
dr_addr =3D 0;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  213  =

0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  214  		rx_desc++;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  215  		xdp++;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  216  	}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  217  =

6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  218  	ntu +=3D nb_buffs;
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  219  	if (ntu =3D=3D rx_ring->co=
unt) {
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  220  		rx_desc =3D I40=
E_RX_DESC(rx_ring, 0);
6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22 @221  		xdp =3D i40e_rx_bi(rx_rin=
g, 0);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  222  		ntu =3D 0;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  223  	}
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  224  =

64050b5b8706d3 Bj=C3=B6rn T=C3=B6pel     2020-12-11  225  	/* clear the sta=
tus bits for the next_to_use descriptor */
64050b5b8706d3 Bj=C3=B6rn T=C3=B6pel     2020-12-11  226  	rx_desc->wb.qwor=
d1.status_error_len =3D 0;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  227  	i40e_release_rx_=
desc(rx_ring, ntu);
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  228  =

6aab0bb0c5cdc0 Magnus Karlsson 2021-09-22  229  	return count =3D=3D nb_buf=
fs ? true : false;
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  230  }
0a714186d3c0f7 Bj=C3=B6rn T=C3=B6pel     2018-08-28  231  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2562796439723870176==--

