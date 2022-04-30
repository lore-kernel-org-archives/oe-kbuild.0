Content-Type: multipart/mixed; boundary="===============6422834147434887814=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/at_xdmac.c:1575:4: warning: Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 30 Apr 2022 18:36:23 +0800
Message-ID: <202204301828.uq1KLbC8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6422834147434887814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Xiaomeng Tong <xiam0nd.tong@gmail.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8013d1d3d2e33236dee13a133fba49ad55045e79
commit: 206680c4e46b62fd8909385e0874a36952595b85 dma: at_xdmac: fix a missi=
ng check on list iterator
date:   3 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220429 (https://download.01.org/0day-ci/archi=
ve/20220430/202204301828.uq1KLbC8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D206680c4e46b62fd8909385e0874a36952595b85
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 206680c4e46b62fd8909385e0874a36952595b85
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/dma/at_xdmac.c:1303:2: note: Taking false branch
           dev_dbg(chan2dev(chan), "%s: sg_len=3D%d, value=3D0x%x, flags=3D=
0x%lx\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:1307:31: note: Assuming 'i' is < 'sg_len'
           for_each_sg(sgl, sg, sg_len, i) {
                                        ^
   include/linux/scatterlist.h:169:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/dma/at_xdmac.c:1307:2: note: Loop condition is true.  Entering l=
oop body
           for_each_sg(sgl, sg, sg_len, i) {
           ^
   include/linux/scatterlist.h:169:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/dma/at_xdmac.c:1308:3: note: Taking false branch
                   dev_dbg(chan2dev(chan), "%s: dest=3D%pad, len=3D%d, patt=
ern=3D0x%x, flags=3D0x%lx\n",
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:1315:8: note: 'desc' is null
                   if (!desc && first)
                        ^~~~
   drivers/dma/at_xdmac.c:1315:7: note: Left side of '&&' is true
                   if (!desc && first)
                       ^
   drivers/dma/at_xdmac.c:1315:16: note: 'first' is null
                   if (!desc && first)
                                ^~~~~
   drivers/dma/at_xdmac.c:1315:3: note: Taking false branch
                   if (!desc && first)
                   ^
   drivers/dma/at_xdmac.c:1319:8: note: 'first' is null
                   if (!first)
                        ^~~~~
   drivers/dma/at_xdmac.c:1319:3: note: Taking true branch
                   if (!first)
                   ^
   drivers/dma/at_xdmac.c:1324:7: note: 'psg' is null
                   if (psg)
                       ^~~
   drivers/dma/at_xdmac.c:1324:3: note: Taking false branch
                   if (psg)
                   ^
   drivers/dma/at_xdmac.c:1347:7: note: 'ppdesc' is null
                   if (ppdesc && pdesc) {
                       ^~~~~~
   drivers/dma/at_xdmac.c:1347:14: note: Left side of '&&' is false
                   if (ppdesc && pdesc) {
                              ^
   drivers/dma/at_xdmac.c:1411:8: note: Assuming the condition is true
                   if ((i =3D=3D (sg_len - 1)) &&
                        ^~~~~~~~~~~~~~~~~
   drivers/dma/at_xdmac.c:1411:7: note: Left side of '&&' is true
                   if ((i =3D=3D (sg_len - 1)) &&
                       ^
   drivers/dma/at_xdmac.c:1412:7: note: Access to field 'length' results in=
 a dereference of a null pointer (loaded from variable 'psg')
                       sg_dma_len(psg) =3D=3D sg_dma_len(sg)) {
                       ^
   include/linux/scatterlist.h:33:25: note: expanded from macro 'sg_dma_len'
   #define sg_dma_len(sg)          ((sg)->length)
                                   ^ ~~
   drivers/dma/at_xdmac.c:1443:28: warning: Dereference of null pointer [cl=
ang-analyzer-core.NullDereference]
           first->tx_dma_desc.cookie =3D -EBUSY;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   drivers/dma/at_xdmac.c:1295:22: note: 'first' initialized to a null poin=
ter value
                                   *ppdesc =3D NULL, *first =3D NULL;
                                                    ^~~~~
   drivers/dma/at_xdmac.c:1300:6: note: Assuming 'sgl' is non-null
           if (!sgl)
               ^~~~
   drivers/dma/at_xdmac.c:1300:2: note: Taking false branch
           if (!sgl)
           ^
   drivers/dma/at_xdmac.c:1303:2: note: Taking false branch
           dev_dbg(chan2dev(chan), "%s: sg_len=3D%d, value=3D0x%x, flags=3D=
0x%lx\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:1307:31: note: Assuming 'i' is >=3D 'sg_len'
           for_each_sg(sgl, sg, sg_len, i) {
                                        ^
   include/linux/scatterlist.h:169:31: note: expanded from macro 'for_each_=
sg'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
                                        ^~~~~~~~~~
   drivers/dma/at_xdmac.c:1307:2: note: Loop condition is false. Execution =
continues on line 1443
           for_each_sg(sgl, sg, sg_len, i) {
           ^
   include/linux/scatterlist.h:169:2: note: expanded from macro 'for_each_s=
g'
           for (__i =3D 0, sg =3D (sglist); __i < (nr); __i++, sg =3D sg_ne=
xt(sg))
           ^
   drivers/dma/at_xdmac.c:1443:28: note: Dereference of null pointer
           first->tx_dma_desc.cookie =3D -EBUSY;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
>> drivers/dma/at_xdmac.c:1575:4: warning: Value stored to 'desc' is never =
read [clang-analyzer-deadcode.DeadStores]
                           desc =3D iter;
                           ^      ~~~~
   drivers/dma/at_xdmac.c:1575:4: note: Value stored to 'desc' is never read
                           desc =3D iter;
                           ^      ~~~~
   drivers/dma/at_xdmac.c:1654:2: warning: Value stored to 'bad_desc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           bad_desc =3D list_first_entry(&atchan->xfers_list,
           ^
   drivers/dma/at_xdmac.c:1654:2: note: Value stored to 'bad_desc' is never=
 read
   include/linux/list.h:292:9: warning: Dereference of null pointer [clang-=
analyzer-core.NullDereference]
           return READ_ONCE(head->next) =3D=3D head;
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   drivers/dma/at_xdmac.c:1000:38: note: 'first' initialized to a null poin=
ter value
           struct at_xdmac_desc    *prev =3D NULL, *first =3D NULL;
                                                  ^~~~~
   drivers/dma/at_xdmac.c:1006:6: note: Assuming 'xt' is non-null
           if (!xt || !xt->numf || (xt->dir !=3D DMA_MEM_TO_MEM))
               ^~~
   drivers/dma/at_xdmac.c:1006:6: note: Left side of '||' is false
   drivers/dma/at_xdmac.c:1006:13: note: Assuming field 'numf' is not equal=
 to 0
           if (!xt || !xt->numf || (xt->dir !=3D DMA_MEM_TO_MEM))
                      ^~~~~~~~~
   drivers/dma/at_xdmac.c:1006:6: note: Left side of '||' is false
           if (!xt || !xt->numf || (xt->dir !=3D DMA_MEM_TO_MEM))
               ^
   drivers/dma/at_xdmac.c:1006:27: note: Assuming field 'dir' is equal to D=
MA_MEM_TO_MEM
           if (!xt || !xt->numf || (xt->dir !=3D DMA_MEM_TO_MEM))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/at_xdmac.c:1006:2: note: Taking false branch
           if (!xt || !xt->numf || (xt->dir !=3D DMA_MEM_TO_MEM))
           ^
   drivers/dma/at_xdmac.c:1013:7: note: Assuming field 'numf' is <=3D 1
           if ((xt->numf > 1) && (xt->frame_size > 1))
                ^~~~~~~~~~~~
   drivers/dma/at_xdmac.c:1013:21: note: Left side of '&&' is false
           if ((xt->numf > 1) && (xt->frame_size > 1))
                              ^
   drivers/dma/at_xdmac.c:1016:2: note: Taking false branch
           dev_dbg(chan2dev(chan), "%s: src=3D%pad, dest=3D%pad, numf=3D%zu=
, frame_size=3D%zu, flags=3D0x%lx\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:1023:10: note: Field 'numf' is <=3D 1
           if (xt->numf > 1) {
                   ^
   drivers/dma/at_xdmac.c:1023:2: note: Taking false branch
           if (xt->numf > 1) {
           ^
   drivers/dma/at_xdmac.c:1037:15: note: Assuming 'i' is < field 'frame_siz=
e'
                   for (i =3D 0; i < xt->frame_size; i++) {
                               ^~~~~~~~~~~~~~~~~~
   drivers/dma/at_xdmac.c:1037:3: note: Loop condition is true.  Entering l=
oop body
                   for (i =3D 0; i < xt->frame_size; i++) {
                   ^
   drivers/dma/at_xdmac.c:1049:4: note: Taking false branch
                           dev_dbg(chan2dev(chan),
                           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:1053:11: note: Calling 'at_xdmac_interleaved_queu=
e_desc'
                           desc =3D at_xdmac_interleaved_queue_desc(chan, a=
tchan,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/dma/at_xdmac.c:933:6: note: Assuming the condition is true
           if (chunk->size >=3D (AT_XDMAC_MBR_UBC_UBLEN_MAX << dwidth)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma/at_xdmac.c:933:2: note: Taking true branch
           if (chunk->size >=3D (AT_XDMAC_MBR_UBC_UBLEN_MAX << dwidth)) {
           ^
   drivers/dma/at_xdmac.c:934:3: note: Taking false branch
                   dev_dbg(chan2dev(chan),
                   ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/dma/at_xdmac.c:938:3: note: Returning null pointer, which partic=
ipates in a condition later
                   return NULL;
                   ^~~~~~~~~~~
   drivers/dma/at_xdmac.c:1053:11: note: Returning from 'at_xdmac_interleav=
ed_queue_desc'
                           desc =3D at_xdmac_interleaved_queue_desc(chan, a=
tchan,
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/dma/at_xdmac.c:1057:9: note: 'desc' is null
                           if (!desc) {
                                ^~~~
   drivers/dma/at_xdmac.c:1057:4: note: Taking true branch
                           if (!desc) {
                           ^
   drivers/dma/at_xdmac.c:1058:27: note: Passing null pointer value via 1st=
 parameter 'list'
                                   list_splice_tail_init(&first->descs_list,
                                                         ^~~~~~~~~~~~~~~~~~
   drivers/dma/at_xdmac.c:1058:5: note: Calling 'list_splice_tail_init'
                                   list_splice_tail_init(&first->descs_list,
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/desc +1575 drivers/dma/at_xdmac.c

67a6eedc4d2cc6 Maxime Ripard     2015-07-06  1449  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1450  static enum dma_status
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1451  at_xdmac_tx_status(struc=
t dma_chan *chan, dma_cookie_t cookie,
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1452  		struct dma_tx_state *t=
xstate)
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1453  {
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1454  	struct at_xdmac_chan	*a=
tchan =3D to_at_xdmac_chan(chan);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1455  	struct at_xdmac		*atxdm=
ac =3D to_at_xdmac(atchan->chan.device);
206680c4e46b62 Xiaomeng Tong     2022-03-27  1456  	struct at_xdmac_desc	*d=
esc, *_desc, *iter;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1457  	struct list_head	*descs=
_list;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1458  	enum dma_status		ret;
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1459  	int			residue, retry;
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1460  	u32			cur_nda, check_nd=
a, cur_ubc, mask, value;
be835074829b13 Ludovic Desroches 2015-01-27  1461  	u8			dwidth =3D 0;
4c374fc7ce9440 Ludovic Desroches 2015-06-08  1462  	unsigned long		flags;
53398f488821c2 Ludovic Desroches 2016-05-12  1463  	bool			initd;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1464  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1465  	ret =3D dma_cookie_stat=
us(chan, cookie, txstate);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1466  	if (ret =3D=3D DMA_COMP=
LETE)
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1467  		return ret;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1468  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1469  	if (!txstate)
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1470  		return ret;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1471  =

4c374fc7ce9440 Ludovic Desroches 2015-06-08  1472  	spin_lock_irqsave(&atch=
an->lock, flags);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1473  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1474  	desc =3D list_first_ent=
ry(&atchan->xfers_list, struct at_xdmac_desc, xfer_node);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1475  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1476  	/*
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1477  	 * If the transfer has =
not been started yet, don't need to compute the
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1478  	 * residue, it's the tr=
ansfer length.
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1479  	 */
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1480  	if (!desc->active_xfer)=
 {
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1481  		dma_set_residue(txstat=
e, desc->xfer_size);
4c374fc7ce9440 Ludovic Desroches 2015-06-08  1482  		goto spin_unlock;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1483  	}
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1484  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1485  	residue =3D desc->xfer_=
size;
4e0978208d6773 Cyrille Pitchen   2014-11-13  1486  	/*
4e0978208d6773 Cyrille Pitchen   2014-11-13  1487  	 * Flush FIFO: only rel=
evant when the transfer is source peripheral
9295c41d77ca93 Ludovic Desroches 2016-05-12  1488  	 * synchronized. Flush =
is needed before reading CUBC because data in
9295c41d77ca93 Ludovic Desroches 2016-05-12  1489  	 * the FIFO are not rep=
orted by CUBC. Reporting a residue of the
9295c41d77ca93 Ludovic Desroches 2016-05-12  1490  	 * transfer length whil=
e we have data in FIFO can cause issue.
9295c41d77ca93 Ludovic Desroches 2016-05-12  1491  	 * Usecase: atmel USART=
 has a timeout which means I have received
9295c41d77ca93 Ludovic Desroches 2016-05-12  1492  	 * characters but there=
 is no more character received for a while. On
9295c41d77ca93 Ludovic Desroches 2016-05-12  1493  	 * timeout, it requests=
 the residue. If the data are in the DMA FIFO,
9295c41d77ca93 Ludovic Desroches 2016-05-12  1494  	 * we will return a res=
idue of the transfer length. It means no data
9295c41d77ca93 Ludovic Desroches 2016-05-12  1495  	 * received. If an appl=
ication is waiting for these data, it will hang
9295c41d77ca93 Ludovic Desroches 2016-05-12  1496  	 * since we won't have =
another USART timeout without receiving new
9295c41d77ca93 Ludovic Desroches 2016-05-12  1497  	 * data.
4e0978208d6773 Cyrille Pitchen   2014-11-13  1498  	 */
4e0978208d6773 Cyrille Pitchen   2014-11-13  1499  	mask =3D AT_XDMAC_CC_TY=
PE | AT_XDMAC_CC_DSYNC;
4e0978208d6773 Cyrille Pitchen   2014-11-13  1500  	value =3D AT_XDMAC_CC_T=
YPE_PER_TRAN | AT_XDMAC_CC_DSYNC_PER2MEM;
be835074829b13 Ludovic Desroches 2015-01-27  1501  	if ((desc->lld.mbr_cfg =
& mask) =3D=3D value) {
2bec35a529b7d3 Eugen Hristev     2020-10-16  1502  		at_xdmac_write(atxdmac=
, atxdmac->layout->gswf, atchan->mask);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1503  		while (!(at_xdmac_chan=
_read(atchan, AT_XDMAC_CIS) & AT_XDMAC_CIS_FIS))
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1504  			cpu_relax();
4e0978208d6773 Cyrille Pitchen   2014-11-13  1505  	}
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1506  =

25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1507  	/*
53398f488821c2 Ludovic Desroches 2016-05-12  1508  	 * The easiest way to c=
ompute the residue should be to pause the DMA
53398f488821c2 Ludovic Desroches 2016-05-12  1509  	 * but doing this can l=
ead to miss some data as some devices don't
53398f488821c2 Ludovic Desroches 2016-05-12  1510  	 * have FIFO.
53398f488821c2 Ludovic Desroches 2016-05-12  1511  	 * We need to read seve=
ral registers because:
53398f488821c2 Ludovic Desroches 2016-05-12  1512  	 * - DMA is running the=
refore a descriptor change is possible while
53398f488821c2 Ludovic Desroches 2016-05-12  1513  	 * reading these regist=
ers
53398f488821c2 Ludovic Desroches 2016-05-12  1514  	 * - When the block tra=
nsfer is done, the value of the CUBC register
53398f488821c2 Ludovic Desroches 2016-05-12  1515  	 * is set to its initia=
l value until the fetch of the next descriptor.
53398f488821c2 Ludovic Desroches 2016-05-12  1516  	 * This value will corr=
upt the residue calculation so we have to skip
53398f488821c2 Ludovic Desroches 2016-05-12  1517  	 * it.
53398f488821c2 Ludovic Desroches 2016-05-12  1518  	 *
53398f488821c2 Ludovic Desroches 2016-05-12  1519  	 * INITD --------      =
              ------------
53398f488821c2 Ludovic Desroches 2016-05-12  1520  	 *              |______=
______________|
53398f488821c2 Ludovic Desroches 2016-05-12  1521  	 *       ______________=
_________  _______________
53398f488821c2 Ludovic Desroches 2016-05-12  1522  	 * NDA       @desc2    =
         \/   @desc3
53398f488821c2 Ludovic Desroches 2016-05-12  1523  	 *       ______________=
_________/\_______________
53398f488821c2 Ludovic Desroches 2016-05-12  1524  	 *       __________  __=
_________  _______________
53398f488821c2 Ludovic Desroches 2016-05-12  1525  	 * CUBC       0    \/ M=
AX desc1 \/  MAX desc2
53398f488821c2 Ludovic Desroches 2016-05-12  1526  	 *       __________/\__=
_________/\_______________
53398f488821c2 Ludovic Desroches 2016-05-12  1527  	 *
53398f488821c2 Ludovic Desroches 2016-05-12  1528  	 * Since descriptors ar=
e aligned on 64 bits, we can assume that
53398f488821c2 Ludovic Desroches 2016-05-12  1529  	 * the update of NDA an=
d CUBC is atomic.
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1530  	 * Memory barriers are =
used to ensure the read order of the registers.
53398f488821c2 Ludovic Desroches 2016-05-12  1531  	 * A max number of retr=
ies is set because unlikely it could never ends.
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1532  	 */
53398f488821c2 Ludovic Desroches 2016-05-12  1533  	for (retry =3D 0; retry=
 < AT_XDMAC_RESIDUE_MAX_RETRIES; retry++) {
53398f488821c2 Ludovic Desroches 2016-05-12  1534  		check_nda =3D at_xdmac=
_chan_read(atchan, AT_XDMAC_CNDA) & 0xfffffffc;
53398f488821c2 Ludovic Desroches 2016-05-12  1535  		rmb();
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1536  		cur_ubc =3D at_xdmac_c=
han_read(atchan, AT_XDMAC_CUBC);
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1537  		rmb();
c5637476bbf9bb Maxime Jayat      2018-02-22  1538  		initd =3D !!(at_xdmac_=
chan_read(atchan, AT_XDMAC_CC) & AT_XDMAC_CC_INITD);
c5637476bbf9bb Maxime Jayat      2018-02-22  1539  		rmb();
53398f488821c2 Ludovic Desroches 2016-05-12  1540  		cur_nda =3D at_xdmac_c=
han_read(atchan, AT_XDMAC_CNDA) & 0xfffffffc;
53398f488821c2 Ludovic Desroches 2016-05-12  1541  		rmb();
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1542  =

53398f488821c2 Ludovic Desroches 2016-05-12  1543  		if ((check_nda =3D=3D =
cur_nda) && initd)
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1544  			break;
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1545  	}
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1546  =

25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1547  	if (unlikely(retry >=3D=
 AT_XDMAC_RESIDUE_MAX_RETRIES)) {
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1548  		ret =3D DMA_ERROR;
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1549  		goto spin_unlock;
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1550  	}
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1551  =

9295c41d77ca93 Ludovic Desroches 2016-05-12  1552  	/*
9295c41d77ca93 Ludovic Desroches 2016-05-12  1553  	 * Flush FIFO: only rel=
evant when the transfer is source peripheral
9295c41d77ca93 Ludovic Desroches 2016-05-12  1554  	 * synchronized. Anothe=
r flush is needed here because CUBC is updated
9295c41d77ca93 Ludovic Desroches 2016-05-12  1555  	 * when the controller =
sends the data write command. It can lead to
9295c41d77ca93 Ludovic Desroches 2016-05-12  1556  	 * report data that are=
 not written in the memory or the device. The
9295c41d77ca93 Ludovic Desroches 2016-05-12  1557  	 * FIFO flush ensures t=
hat data are really written.
9295c41d77ca93 Ludovic Desroches 2016-05-12  1558  	 */
9295c41d77ca93 Ludovic Desroches 2016-05-12  1559  	if ((desc->lld.mbr_cfg =
& mask) =3D=3D value) {
2bec35a529b7d3 Eugen Hristev     2020-10-16  1560  		at_xdmac_write(atxdmac=
, atxdmac->layout->gswf, atchan->mask);
9295c41d77ca93 Ludovic Desroches 2016-05-12  1561  		while (!(at_xdmac_chan=
_read(atchan, AT_XDMAC_CIS) & AT_XDMAC_CIS_FIS))
9295c41d77ca93 Ludovic Desroches 2016-05-12  1562  			cpu_relax();
9295c41d77ca93 Ludovic Desroches 2016-05-12  1563  	}
9295c41d77ca93 Ludovic Desroches 2016-05-12  1564  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1565  	/*
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1566  	 * Remove size of all m=
icroblocks already transferred and the current
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1567  	 * one. Then add the re=
maining size to transfer of the current
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1568  	 * microblock.
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1569  	 */
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1570  	descs_list =3D &desc->d=
escs_list;
206680c4e46b62 Xiaomeng Tong     2022-03-27  1571  	list_for_each_entry_saf=
e(iter, _desc, descs_list, desc_node) {
206680c4e46b62 Xiaomeng Tong     2022-03-27  1572  		dwidth =3D at_xdmac_ge=
t_dwidth(iter->lld.mbr_cfg);
206680c4e46b62 Xiaomeng Tong     2022-03-27  1573  		residue -=3D (iter->ll=
d.mbr_ubc & 0xffffff) << dwidth;
206680c4e46b62 Xiaomeng Tong     2022-03-27  1574  		if ((iter->lld.mbr_nda=
 & 0xfffffffc) =3D=3D cur_nda) {
206680c4e46b62 Xiaomeng Tong     2022-03-27 @1575  			desc =3D iter;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1576  			break;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1577  		}
206680c4e46b62 Xiaomeng Tong     2022-03-27  1578  	}
25c5e9626ca4d4 Ludovic Desroches 2016-03-10  1579  	residue +=3D cur_ubc <<=
 dwidth;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1580  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1581  	dma_set_residue(txstate=
, residue);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1582  =

e1f7c9eee70730 Ludovic Desroches 2014-10-22  1583  	dev_dbg(chan2dev(chan),
82e2424635f4c0 Vinod Koul        2014-11-06  1584  		 "%s: desc=3D0x%p, tx_=
dma_desc.phys=3D%pad, tx_status=3D%d, cookie=3D%d, residue=3D%d\n",
82e2424635f4c0 Vinod Koul        2014-11-06  1585  		 __func__, desc, &desc=
->tx_dma_desc.phys, ret, cookie, residue);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1586  =

4c374fc7ce9440 Ludovic Desroches 2015-06-08  1587  spin_unlock:
4c374fc7ce9440 Ludovic Desroches 2015-06-08  1588  	spin_unlock_irqrestore(=
&atchan->lock, flags);
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1589  	return ret;
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1590  }
e1f7c9eee70730 Ludovic Desroches 2014-10-22  1591  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6422834147434887814==--

