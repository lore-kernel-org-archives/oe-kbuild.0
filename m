Content-Type: multipart/mixed; boundary="===============5925851077803300874=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 804/1029] drivers/dma/xilinx/xilinx_dpdma.c:746:21: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 28 Mar 2022 06:00:54 +0800
Message-ID: <202203280503.HnbHNFzA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5925851077803300874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Rohit Visavalia <rohit.visavalia@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 9e0f0975faa39b51dc71911efb8a4cafd5d70282 [804/1029] dmaengine: xili=
nx: dpdma: Add support for cyclic dma mode
:::::: branch date: 3 days ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-c002-20220327 (https://download.01.org/0day-ci/archi=
ve/20220328/202203280503.HnbHNFzA-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Xilinx/linux-xlnx/commit/9e0f0975faa39b51dc719=
11efb8a4cafd5d70282
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 9e0f0975faa39b51dc71911efb8a4cafd5d70282
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   net/can/j1939/transport.c:285:34: note: Loop condition is false.  Exitin=
g loop
           struct j1939_session *session =3D container_of(kref, struct j193=
9_session,
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
   net/can/j1939/transport.c:288:2: note: Calling 'j1939_session_destroy'
           j1939_session_destroy(session);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:263:6: note: Assuming field 'transmission' is =
false
           if (session->transmission) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:263:2: note: Taking false branch
           if (session->transmission) {
           ^
   net/can/j1939/transport.c:268:13: note: Assuming field 'err' is 0
           } else if (session->err) {
                      ^~~~~~~~~~~~
   net/can/j1939/transport.c:268:9: note: Taking false branch
           } else if (session->err) {
                  ^
   net/can/j1939/transport.c:272:2: note: Taking false branch
           netdev_dbg(session->priv->ndev, "%s: 0x%p\n", __func__, session);
           ^
   include/linux/netdevice.h:5333:2: note: expanded from macro 'netdev_dbg'
           if (0)                                                  \
           ^
   net/can/j1939/transport.c:274:2: note: Assuming '__ret_warn_on' is not e=
qual to 0
           WARN_ON_ONCE(!list_empty(&session->sk_session_queue_entry));
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/transport.c:275:2: note: Assuming '__ret_warn_on' is not e=
qual to 0
           WARN_ON_ONCE(!list_empty(&session->active_session_list_entry));
           ^
   include/asm-generic/bug.h:179:33: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                   ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   net/can/j1939/transport.c:280:2: note: Memory is released
           kfree(session);
           ^~~~~~~~~~~~~~
   net/can/j1939/transport.c:288:2: note: Returning; memory was released
           j1939_session_destroy(session);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   net/can/j1939/transport.c:293:2: note: Returning; memory was released
           kref_put(&session->kref, __j1939_session_release);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:2169:5: note: Returning; memory was released
                                   j1939_session_put(session);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/can/j1939/transport.c:2171:17: note: Use of memory after it is freed
                           session->err =3D ESHUTDOWN;
                           ~~~~~~~~~~~~ ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/dma/xilinx/xilinx_dpdma.c:746:21: warning: Dereference of null p=
ointer [clang-analyzer-core.NullDereference]
           last->hw.next_desc =3D lower_32_bits(sw_desc->dma_addr);
                              ^
   drivers/dma/xilinx/xilinx_dpdma.c:1287:35: note: Left side of '&&' is fa=
lse
           struct xilinx_dpdma_chan *chan =3D to_xilinx_chan(dchan);
                                            ^
   drivers/dma/xilinx/xilinx_dpdma.c:247:2: note: expanded from macro 'to_x=
ilinx_chan'
           container_of(_chan, struct xilinx_dpdma_chan, vchan.chan)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/dma/xilinx/xilinx_dpdma.c:1287:35: note: Taking false branch
           struct xilinx_dpdma_chan *chan =3D to_xilinx_chan(dchan);
                                            ^
   drivers/dma/xilinx/xilinx_dpdma.c:247:2: note: expanded from macro 'to_x=
ilinx_chan'
           container_of(_chan, struct xilinx_dpdma_chan, vchan.chan)
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
   drivers/dma/xilinx/xilinx_dpdma.c:1287:35: note: Loop condition is false=
.  Exiting loop
           struct xilinx_dpdma_chan *chan =3D to_xilinx_chan(dchan);
                                            ^
   drivers/dma/xilinx/xilinx_dpdma.c:247:2: note: expanded from macro 'to_x=
ilinx_chan'
           container_of(_chan, struct xilinx_dpdma_chan, vchan.chan)
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
   drivers/dma/xilinx/xilinx_dpdma.c:1289:6: note: Assuming 'direction' is =
equal to DMA_MEM_TO_DEV
           if (direction !=3D DMA_MEM_TO_DEV)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:1289:2: note: Taking false branch
           if (direction !=3D DMA_MEM_TO_DEV)
           ^
   drivers/dma/xilinx/xilinx_dpdma.c:1292:6: note: Assuming the condition i=
s false
           if (buf_len % period_len)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:1292:2: note: Taking false branch
           if (buf_len % period_len)
           ^
   drivers/dma/xilinx/xilinx_dpdma.c:1295:9: note: Calling 'xilinx_dpdma_ch=
an_prep_cyclic'
           return xilinx_dpdma_chan_prep_cyclic(chan, buf_addr, buf_len,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:703:41: note: 'last' initialized to a =
null pointer value
           struct xilinx_dpdma_sw_desc *sw_desc, *last =3D NULL;
                                                  ^~~~
   drivers/dma/xilinx/xilinx_dpdma.c:707:12: note: Calling 'xilinx_dpdma_ch=
an_alloc_tx_desc'
           tx_desc =3D xilinx_dpdma_chan_alloc_tx_desc(chan);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:649:12: note: Calling 'kzalloc'
           tx_desc =3D kzalloc(sizeof(*tx_desc), GFP_NOWAIT);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:579:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:596:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:721:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:649:12: note: Returning from 'kzalloc'
           tx_desc =3D kzalloc(sizeof(*tx_desc), GFP_NOWAIT);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:650:6: note: Assuming 'tx_desc' is non=
-null, which participates in a condition later
           if (!tx_desc)
               ^~~~~~~~
   drivers/dma/xilinx/xilinx_dpdma.c:650:2: note: Taking false branch
           if (!tx_desc)

vim +746 drivers/dma/xilinx/xilinx_dpdma.c

7cbb0c63de3fc2 Hyun Kwon       2020-07-17  683  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  684  /**
9e0f0975faa39b Rohit Visavalia 2021-04-07  685   * xilinx_dpdma_chan_prep_c=
yclic - Prepare a cyclic dma descriptor
9e0f0975faa39b Rohit Visavalia 2021-04-07  686   * @chan: DPDMA channel
9e0f0975faa39b Rohit Visavalia 2021-04-07  687   * @buf_addr: buffer address
9e0f0975faa39b Rohit Visavalia 2021-04-07  688   * @buf_len: buffer length
9e0f0975faa39b Rohit Visavalia 2021-04-07  689   * @period_len: number of p=
eriods
9e0f0975faa39b Rohit Visavalia 2021-04-07  690   * @flags: tx flags argumen=
t passed in to prepare function
9e0f0975faa39b Rohit Visavalia 2021-04-07  691   *
9e0f0975faa39b Rohit Visavalia 2021-04-07  692   * Prepare a tx descriptor =
incudling internal software/hardware descriptors
9e0f0975faa39b Rohit Visavalia 2021-04-07  693   * for the given cyclic tra=
nsaction.
9e0f0975faa39b Rohit Visavalia 2021-04-07  694   *
9e0f0975faa39b Rohit Visavalia 2021-04-07  695   * Return: A dma async tx d=
escriptor on success, or NULL.
9e0f0975faa39b Rohit Visavalia 2021-04-07  696   */
9e0f0975faa39b Rohit Visavalia 2021-04-07  697  static struct dma_async_tx_=
descriptor *
9e0f0975faa39b Rohit Visavalia 2021-04-07  698  xilinx_dpdma_chan_prep_cycl=
ic(struct xilinx_dpdma_chan *chan,
9e0f0975faa39b Rohit Visavalia 2021-04-07  699  			      dma_addr_t buf_add=
r, size_t buf_len,
9e0f0975faa39b Rohit Visavalia 2021-04-07  700  			      size_t period_len,=
 unsigned long flags)
9e0f0975faa39b Rohit Visavalia 2021-04-07  701  {
9e0f0975faa39b Rohit Visavalia 2021-04-07  702  	struct xilinx_dpdma_tx_des=
c *tx_desc;
9e0f0975faa39b Rohit Visavalia 2021-04-07  703  	struct xilinx_dpdma_sw_des=
c *sw_desc, *last =3D NULL;
9e0f0975faa39b Rohit Visavalia 2021-04-07  704  	unsigned int periods =3D b=
uf_len / period_len;
9e0f0975faa39b Rohit Visavalia 2021-04-07  705  	unsigned int i;
9e0f0975faa39b Rohit Visavalia 2021-04-07  706  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  707  	tx_desc =3D xilinx_dpdma_c=
han_alloc_tx_desc(chan);
9e0f0975faa39b Rohit Visavalia 2021-04-07  708  	if (!tx_desc)
9e0f0975faa39b Rohit Visavalia 2021-04-07  709  		return (void *)tx_desc;
9e0f0975faa39b Rohit Visavalia 2021-04-07  710  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  711  	for (i =3D 0; i < periods;=
 i++) {
9e0f0975faa39b Rohit Visavalia 2021-04-07  712  		struct xilinx_dpdma_hw_de=
sc *hw_desc;
9e0f0975faa39b Rohit Visavalia 2021-04-07  713  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  714  		if (!IS_ALIGNED(buf_addr,=
 XILINX_DPDMA_ALIGN_BYTES)) {
9e0f0975faa39b Rohit Visavalia 2021-04-07  715  			dev_err(chan->xdev->dev,
9e0f0975faa39b Rohit Visavalia 2021-04-07  716  				"buffer should be align=
ed at %d B\n",
9e0f0975faa39b Rohit Visavalia 2021-04-07  717  				XILINX_DPDMA_ALIGN_BYTE=
S);
9e0f0975faa39b Rohit Visavalia 2021-04-07  718  			goto error;
9e0f0975faa39b Rohit Visavalia 2021-04-07  719  		}
9e0f0975faa39b Rohit Visavalia 2021-04-07  720  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  721  		sw_desc =3D xilinx_dpdma_=
chan_alloc_sw_desc(chan);
9e0f0975faa39b Rohit Visavalia 2021-04-07  722  		if (!sw_desc)
9e0f0975faa39b Rohit Visavalia 2021-04-07  723  			goto error;
9e0f0975faa39b Rohit Visavalia 2021-04-07  724  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  725  		xilinx_dpdma_sw_desc_set_=
dma_addrs(chan->xdev, sw_desc, last,
9e0f0975faa39b Rohit Visavalia 2021-04-07  726  						   &buf_addr, 1);
9e0f0975faa39b Rohit Visavalia 2021-04-07  727  		hw_desc =3D &sw_desc->hw;
9e0f0975faa39b Rohit Visavalia 2021-04-07  728  		hw_desc->xfer_size =3D pe=
riod_len;
9e0f0975faa39b Rohit Visavalia 2021-04-07  729  		hw_desc->hsize_stride =3D
9e0f0975faa39b Rohit Visavalia 2021-04-07  730  			FIELD_PREP(XILINX_DPDMA_=
DESC_HSIZE_STRIDE_HSIZE_MASK,
9e0f0975faa39b Rohit Visavalia 2021-04-07  731  				   period_len) |
9e0f0975faa39b Rohit Visavalia 2021-04-07  732  			FIELD_PREP(XILINX_DPDMA_=
DESC_HSIZE_STRIDE_STRIDE_MASK,
9e0f0975faa39b Rohit Visavalia 2021-04-07  733  				   period_len);
9e0f0975faa39b Rohit Visavalia 2021-04-07  734  		hw_desc->control |=3D XIL=
INX_DPDMA_DESC_CONTROL_PREEMBLE;
9e0f0975faa39b Rohit Visavalia 2021-04-07  735  		hw_desc->control |=3D XIL=
INX_DPDMA_DESC_CONTROL_IGNORE_DONE;
9e0f0975faa39b Rohit Visavalia 2021-04-07  736  		hw_desc->control |=3D XIL=
INX_DPDMA_DESC_CONTROL_COMPLETE_INTR;
9e0f0975faa39b Rohit Visavalia 2021-04-07  737  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  738  		list_add_tail(&sw_desc->n=
ode, &tx_desc->descriptors);
9e0f0975faa39b Rohit Visavalia 2021-04-07  739  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  740  		buf_addr +=3D period_len;
9e0f0975faa39b Rohit Visavalia 2021-04-07  741  		last =3D sw_desc;
9e0f0975faa39b Rohit Visavalia 2021-04-07  742  	}
9e0f0975faa39b Rohit Visavalia 2021-04-07  743  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  744  	sw_desc =3D list_first_ent=
ry(&tx_desc->descriptors,
9e0f0975faa39b Rohit Visavalia 2021-04-07  745  				   struct xilinx_dpdma_=
sw_desc, node);
9e0f0975faa39b Rohit Visavalia 2021-04-07 @746  	last->hw.next_desc =3D low=
er_32_bits(sw_desc->dma_addr);
9e0f0975faa39b Rohit Visavalia 2021-04-07  747  	if (chan->xdev->ext_addr)
9e0f0975faa39b Rohit Visavalia 2021-04-07  748  		last->hw.addr_ext |=3D
9e0f0975faa39b Rohit Visavalia 2021-04-07  749  			FIELD_PREP(XILINX_DPDMA_=
DESC_ADDR_EXT_NEXT_ADDR_MASK,
9e0f0975faa39b Rohit Visavalia 2021-04-07  750  				   upper_32_bits(sw_des=
c->dma_addr));
9e0f0975faa39b Rohit Visavalia 2021-04-07  751  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  752  	last->hw.control |=3D XILI=
NX_DPDMA_DESC_CONTROL_LAST_OF_FRAME;
9e0f0975faa39b Rohit Visavalia 2021-04-07  753  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  754  	return vchan_tx_prep(&chan=
->vchan, &tx_desc->vdesc, flags);
9e0f0975faa39b Rohit Visavalia 2021-04-07  755  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  756  error:
9e0f0975faa39b Rohit Visavalia 2021-04-07  757  	xilinx_dpdma_chan_free_tx_=
desc(&tx_desc->vdesc);
9e0f0975faa39b Rohit Visavalia 2021-04-07  758  =

9e0f0975faa39b Rohit Visavalia 2021-04-07  759  	return NULL;
9e0f0975faa39b Rohit Visavalia 2021-04-07  760  }
9e0f0975faa39b Rohit Visavalia 2021-04-07  761  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5925851077803300874==--

