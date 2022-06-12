Content-Type: multipart/mixed; boundary="===============2214807768835022008=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/altera/altera_tse_main.c:1379:7: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Sun, 12 Jun 2022 21:50:20 +0800
Message-ID: <202206122133.sY63ZYzA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2214807768835022008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/altera/altera_tse_main.c:1379:7: warning: Redundant initializat=
ion for 'ret'. The initialized value is overwritten before it is read. [red=
undantInitialization]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Carpenter <error27@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: badd7857f5c933a3dc34942a2c11d67fdbdc24de net: altera: set a couple =
error code in probe()
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout badd7857f5c933a3dc34942a2c11d67fdbdc24de
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/altera/altera_tse_main.c:1379:7: warning: Redundant=
 initialization for 'ret'. The initialized value is overwritten before it i=
s read. [redundantInitialization]
     ret =3D request_and_map(pdev, "s1", &dma_res, &descmap);
         ^
   drivers/net/ethernet/altera/altera_tse_main.c:1350:10: note: ret is init=
ialized
    int ret =3D -ENODEV;
            ^
   drivers/net/ethernet/altera/altera_tse_main.c:1379:7: note: ret is overw=
ritten
     ret =3D request_and_map(pdev, "s1", &dma_res, &descmap);
         ^
>> kernel/kthread.c:90:8: warning: Local variable 'kthread' shadows outer f=
unction [shadowFunction]
    void *kthread =3D (__force void *)p->set_child_tid;
          ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:90:8: note: Shadow variable
    void *kthread =3D (__force void *)p->set_child_tid;
          ^
   kernel/kthread.c:98:18: warning: Local variable 'kthread' shadows outer =
function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:98:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:114:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:114:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:196:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D __to_kthread(task);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:196:18: note: Shadow variable
    struct kthread *kthread =3D __to_kthread(task);
                    ^
   kernel/kthread.c:228:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D __to_kthread(task);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:228:18: note: Shadow variable
    struct kthread *kthread =3D __to_kthread(task);
                    ^
   kernel/kthread.c:529:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:529:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:546:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D __to_kthread(p);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:546:18: note: Shadow variable
    struct kthread *kthread =3D __to_kthread(p);
                    ^
   kernel/kthread.c:563:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:563:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:594:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:594:18: note: Shadow variable
    struct kthread *kthread =3D to_kthread(k);
                    ^
   kernel/kthread.c:638:18: warning: Local variable 'kthread' shadows outer=
 function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:638:18: note: Shadow variable
    struct kthread *kthread;
                    ^
   kernel/kthread.c:1434:18: warning: Local variable 'kthread' shadows oute=
r function [shadowFunction]
    struct kthread *kthread;
                    ^
   kernel/kthread.c:271:12: note: Shadowed declaration
   static int kthread(void *_create)
              ^
   kernel/kthread.c:1434:18: note: Shadow variable
    struct kthread *kthread;
--
>> fs/quota/dquot.c:175:56: warning: Parameter 'fmt' can be declared with c=
onst [constParameter]
   void unregister_quota_format(struct quota_format_type *fmt)
                                                          ^
>> fs/quota/dquot.c:288:75: warning: Parameter 'sb' can be declared with co=
nst [constParameter]
   static struct dquot *find_dquot(unsigned int hashent, struct super_block=
 *sb,
                                                                           =
  ^
   fs/quota/dquot.c:535:51: warning: Parameter 'sb' can be declared with co=
nst [constParameter]
   static void invalidate_dquots(struct super_block *sb, int type)
                                                     ^
   fs/quota/dquot.c:2463:40: warning: Parameter 'sb' can be declared with c=
onst [constParameter]
   int dquot_quota_on(struct super_block *sb, int type, int format_id,
                                          ^
--
>> drivers/usb/serial/io_ti.c:655:57: warning: Parameter 'buffer' can be de=
clared with const [constParameter]
   static int valid_csum(struct ti_i2c_desc *rom_desc, u8 *buffer)
                                                           ^
>> drivers/usb/serial/io_ti.c:2211:53: warning: Parameter 'old_termios' can=
 be declared with const [constParameter]
     struct edgeport_port *edge_port, struct ktermios *old_termios)
                                                       ^
--
>> mm/swap.c:612:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:610:25: note: Address of variable taken here.
    struct pagevec *pvec =3D &per_cpu(lru_pvecs.lru_add, cpu);
                           ^
   mm/swap.c:610:33: note: Temporary created here.
    struct pagevec *pvec =3D &per_cpu(lru_pvecs.lru_add, cpu);
                                   ^
   mm/swap.c:612:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:617:30: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (data_race(pagevec_count(pvec))) {
                                ^
   mm/swap.c:615:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_rotate.pvec, cpu);
           ^
   mm/swap.c:615:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_rotate.pvec, cpu);
                   ^
   mm/swap.c:617:30: note: Using pointer that is a temporary.
    if (data_race(pagevec_count(pvec))) {
                                ^
   mm/swap.c:627:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:626:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate_file, cpu);
           ^
   mm/swap.c:626:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate_file, cpu);
                   ^
   mm/swap.c:627:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:631:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:630:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate, cpu);
           ^
   mm/swap.c:630:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_deactivate, cpu);
                   ^
   mm/swap.c:631:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:635:20: warning: Using pointer that is a temporary. [danglingT=
emporaryLifetime]
    if (pagevec_count(pvec))
                      ^
   mm/swap.c:634:9: note: Address of variable taken here.
    pvec =3D &per_cpu(lru_pvecs.lru_lazyfree, cpu);
           ^
   mm/swap.c:634:17: note: Temporary created here.
    pvec =3D &per_cpu(lru_pvecs.lru_lazyfree, cpu);
                   ^
   mm/swap.c:635:20: note: Using pointer that is a temporary.
    if (pagevec_count(pvec))
                      ^
>> fs/inode.c:830:53: warning: Parameter 'sb' can be declared with const [c=
onstParameter]
   static struct inode *find_inode(struct super_block *sb,
                                                       ^
   fs/inode.c:863:58: warning: Parameter 'sb' can be declared with const [c=
onstParameter]
   static struct inode *find_inode_fast(struct super_block *sb,
                                                            ^
>> fs/inode.c:1761:65: warning: Parameter 'time' can be declared with const=
 [constParameter]
   int generic_update_time(struct inode *inode, struct timespec64 *time, in=
t flags)
                                                                   ^
--
>> net/unix/af_unix.c:183:46: warning: Parameter 'sk' can be declared with =
const [constParameter]
   static inline int unix_our_peer(struct sock *sk, struct sock *osk)
                                                ^
>> net/unix/af_unix.c:2442:23: warning: Parameter 'last' can be declared wi=
th const [constParameter]
         struct sk_buff *last, unsigned int last_len,
                         ^
>> net/unix/af_unix.c:3138:68: warning: Parameter 'pos' can be declared wit=
h const [constParameter]
   static struct sock *unix_from_bucket(struct seq_file *seq, loff_t *pos)
                                                                      ^

vim +/ret +1379 drivers/net/ethernet/altera/altera_tse_main.c

bbd2190ce96d8f Vince Bridgers  2014-03-17  1344  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1345  /* Probe Altera TSE MAC de=
vice
bbd2190ce96d8f Vince Bridgers  2014-03-17  1346   */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1347  static int altera_tse_prob=
e(struct platform_device *pdev)
bbd2190ce96d8f Vince Bridgers  2014-03-17  1348  {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1349  	struct net_device *ndev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1350  	int ret =3D -ENODEV;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1351  	struct resource *control_=
port;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1352  	struct resource *dma_res;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1353  	struct altera_tse_private=
 *priv;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1354  	void __iomem *descmap;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1355  	const struct of_device_id=
 *of_id =3D NULL;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1356  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1357  	ndev =3D alloc_etherdev(s=
izeof(struct altera_tse_private));
bbd2190ce96d8f Vince Bridgers  2014-03-17  1358  	if (!ndev) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1359  		dev_err(&pdev->dev, "Cou=
ld not allocate network device\n");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1360  		return -ENODEV;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1361  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1362  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1363  	SET_NETDEV_DEV(ndev, &pde=
v->dev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1364  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1365  	priv =3D netdev_priv(ndev=
);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1366  	priv->device =3D &pdev->d=
ev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1367  	priv->dev =3D ndev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1368  	priv->msg_enable =3D neti=
f_msg_init(debug, default_msg_level);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1369  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1370  	of_id =3D of_match_device=
(altera_tse_ids, &pdev->dev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1371  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1372  	if (of_id)
bbd2190ce96d8f Vince Bridgers  2014-03-17  1373  		priv->dmaops =3D (struct=
 altera_dmaops *)of_id->data;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1374  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1375  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1376  	if (priv->dmaops &&
bbd2190ce96d8f Vince Bridgers  2014-03-17  1377  	    priv->dmaops->altera_=
dtype =3D=3D ALTERA_DTYPE_SGDMA) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1378  		/* Get the mapped addres=
s to the SGDMA descriptor memory */
bbd2190ce96d8f Vince Bridgers  2014-03-17 @1379  		ret =3D request_and_map(=
pdev, "s1", &dma_res, &descmap);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1380  		if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1381  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1382  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1383  		/* Start of that memory =
is for transmit descriptors */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1384  		priv->tx_dma_desc =3D de=
scmap;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1385  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1386  		/* First half is for tx =
descriptors, other half for tx */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1387  		priv->txdescmem =3D reso=
urce_size(dma_res)/2;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1388  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1389  		priv->txdescmem_busaddr =
=3D (dma_addr_t)dma_res->start;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1390  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1391  		priv->rx_dma_desc =3D (v=
oid __iomem *)((uintptr_t)(descmap +
bbd2190ce96d8f Vince Bridgers  2014-03-17  1392  						     priv->txdescmem=
));
bbd2190ce96d8f Vince Bridgers  2014-03-17  1393  		priv->rxdescmem =3D reso=
urce_size(dma_res)/2;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1394  		priv->rxdescmem_busaddr =
=3D dma_res->start;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1395  		priv->rxdescmem_busaddr =
+=3D priv->txdescmem;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1396  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1397  		if (upper_32_bits(priv->=
rxdescmem_busaddr)) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1398  			dev_dbg(priv->device,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1399  				"SGDMA bus addresses g=
reater than 32-bits\n");
a24a9d7aca2dae Wei Yongjun     2016-10-22  1400  			ret =3D -EINVAL;
a76420092d3d9f Vince Bridgers  2014-04-24  1401  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1402  		}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1403  		if (upper_32_bits(priv->=
txdescmem_busaddr)) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1404  			dev_dbg(priv->device,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1405  				"SGDMA bus addresses g=
reater than 32-bits\n");
a24a9d7aca2dae Wei Yongjun     2016-10-22  1406  			ret =3D -EINVAL;
a76420092d3d9f Vince Bridgers  2014-04-24  1407  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1408  		}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1409  	} else if (priv->dmaops &&
bbd2190ce96d8f Vince Bridgers  2014-03-17  1410  		   priv->dmaops->altera_=
dtype =3D=3D ALTERA_DTYPE_MSGDMA) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1411  		ret =3D request_and_map(=
pdev, "rx_resp", &dma_res,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1412  				      &priv->rx_dma_re=
sp);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1413  		if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1414  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1415  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1416  		ret =3D request_and_map(=
pdev, "tx_desc", &dma_res,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1417  				      &priv->tx_dma_de=
sc);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1418  		if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1419  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1420  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1421  		priv->txdescmem =3D reso=
urce_size(dma_res);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1422  		priv->txdescmem_busaddr =
=3D dma_res->start;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1423  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1424  		ret =3D request_and_map(=
pdev, "rx_desc", &dma_res,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1425  				      &priv->rx_dma_de=
sc);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1426  		if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1427  			goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1428  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1429  		priv->rxdescmem =3D reso=
urce_size(dma_res);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1430  		priv->rxdescmem_busaddr =
=3D dma_res->start;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1431  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1432  	} else {
badd7857f5c933 Dan Carpenter   2021-12-03  1433  		ret =3D -ENODEV;
a76420092d3d9f Vince Bridgers  2014-04-24  1434  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1435  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1436  =

badd7857f5c933 Dan Carpenter   2021-12-03  1437  	if (!dma_set_mask(priv->d=
evice, DMA_BIT_MASK(priv->dmaops->dmamask))) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1438  		dma_set_coherent_mask(pr=
iv->device,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1439  				      DMA_BIT_MASK(pri=
v->dmaops->dmamask));
badd7857f5c933 Dan Carpenter   2021-12-03  1440  	} else if (!dma_set_mask(=
priv->device, DMA_BIT_MASK(32))) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1441  		dma_set_coherent_mask(pr=
iv->device, DMA_BIT_MASK(32));
badd7857f5c933 Dan Carpenter   2021-12-03  1442  	} else {
badd7857f5c933 Dan Carpenter   2021-12-03  1443  		ret =3D -EIO;
a76420092d3d9f Vince Bridgers  2014-04-24  1444  		goto err_free_netdev;
badd7857f5c933 Dan Carpenter   2021-12-03  1445  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1446  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1447  	/* MAC address space */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1448  	ret =3D request_and_map(p=
dev, "control_port", &control_port,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1449  			      (void __iomem **)=
&priv->mac_dev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1450  	if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1451  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1452  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1453  	/* xSGDMA Rx Dispatcher a=
ddress space */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1454  	ret =3D request_and_map(p=
dev, "rx_csr", &dma_res,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1455  			      &priv->rx_dma_csr=
);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1456  	if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1457  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1458  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1459  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1460  	/* xSGDMA Tx Dispatcher a=
ddress space */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1461  	ret =3D request_and_map(p=
dev, "tx_csr", &dma_res,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1462  			      &priv->tx_dma_csr=
);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1463  	if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1464  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1465  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1466  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1467  	/* Rx IRQ */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1468  	priv->rx_irq =3D platform=
_get_irq_byname(pdev, "rx_irq");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1469  	if (priv->rx_irq =3D=3D -=
ENXIO) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1470  		dev_err(&pdev->dev, "can=
not obtain Rx IRQ\n");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1471  		ret =3D -ENXIO;
a76420092d3d9f Vince Bridgers  2014-04-24  1472  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1473  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1474  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1475  	/* Tx IRQ */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1476  	priv->tx_irq =3D platform=
_get_irq_byname(pdev, "tx_irq");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1477  	if (priv->tx_irq =3D=3D -=
ENXIO) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1478  		dev_err(&pdev->dev, "can=
not obtain Tx IRQ\n");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1479  		ret =3D -ENXIO;
a76420092d3d9f Vince Bridgers  2014-04-24  1480  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1481  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1482  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1483  	/* get FIFO depths from d=
evice tree */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1484  	if (of_property_read_u32(=
pdev->dev.of_node, "rx-fifo-depth",
bbd2190ce96d8f Vince Bridgers  2014-03-17  1485  				 &priv->rx_fifo_depth)=
) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1486  		dev_err(&pdev->dev, "can=
not obtain rx-fifo-depth\n");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1487  		ret =3D -ENXIO;
a76420092d3d9f Vince Bridgers  2014-04-24  1488  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1489  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1490  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1491  	if (of_property_read_u32(=
pdev->dev.of_node, "tx-fifo-depth",
fe6e4081a626d2 Vlastimil Setka 2015-02-23  1492  				 &priv->tx_fifo_depth)=
) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1493  		dev_err(&pdev->dev, "can=
not obtain tx-fifo-depth\n");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1494  		ret =3D -ENXIO;
a76420092d3d9f Vince Bridgers  2014-04-24  1495  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1496  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1497  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1498  	/* get hash filter settin=
gs for this instance */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1499  	priv->hash_filter =3D
bbd2190ce96d8f Vince Bridgers  2014-03-17  1500  		of_property_read_bool(pd=
ev->dev.of_node,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1501  				      "altr,has-hash-m=
ulticast-filter");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1502  =

d91e5c02555ae8 Vince Bridgers  2014-05-14  1503  	/* Set hash filter to not=
 set for now until the
d91e5c02555ae8 Vince Bridgers  2014-05-14  1504  	 * multicast filter recei=
ve issue is debugged
d91e5c02555ae8 Vince Bridgers  2014-05-14  1505  	 */
d91e5c02555ae8 Vince Bridgers  2014-05-14  1506  	priv->hash_filter =3D 0;
d91e5c02555ae8 Vince Bridgers  2014-05-14  1507  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1508  	/* get supplemental addre=
ss settings for this instance */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1509  	priv->added_unicast =3D
bbd2190ce96d8f Vince Bridgers  2014-03-17  1510  		of_property_read_bool(pd=
ev->dev.of_node,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1511  				      "altr,has-supple=
mentary-unicast");
bbd2190ce96d8f Vince Bridgers  2014-03-17  1512  =

44770e1180decf Jarod Wilson    2016-10-17  1513  	priv->dev->min_mtu =3D ET=
H_ZLEN + ETH_FCS_LEN;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1514  	/* Max MTU is 1500, ETH_D=
ATA_LEN */
44770e1180decf Jarod Wilson    2016-10-17  1515  	priv->dev->max_mtu =3D ET=
H_DATA_LEN;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1516  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1517  	/* Get the max mtu from t=
he device tree. Note that the
bbd2190ce96d8f Vince Bridgers  2014-03-17  1518  	 * "max-frame-size" param=
eter is actually max mtu. Definition
bbd2190ce96d8f Vince Bridgers  2014-03-17  1519  	 * in the ePAPR v1.1 spec=
 and usage differ, so go with usage.
bbd2190ce96d8f Vince Bridgers  2014-03-17  1520  	 */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1521  	of_property_read_u32(pdev=
->dev.of_node, "max-frame-size",
44770e1180decf Jarod Wilson    2016-10-17  1522  			     &priv->dev->max_mt=
u);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1523  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1524  	/* The DMA buffer size al=
ready accounts for an alignment bias
bbd2190ce96d8f Vince Bridgers  2014-03-17  1525  	 * to avoid unaligned acc=
ess exceptions for the NIOS processor,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1526  	 */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1527  	priv->rx_dma_buf_sz =3D A=
LTERA_RXDMABUFFER_SIZE;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1528  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1529  	/* get default MAC addres=
s from device tree */
9ca01b25dffffe Jakub Kicinski  2021-10-06  1530  	ret =3D of_get_ethdev_add=
ress(pdev->dev.of_node, ndev);
83216e3988cd19 Michael Walle   2021-04-12  1531  	if (ret)
bbd2190ce96d8f Vince Bridgers  2014-03-17  1532  		eth_hw_addr_random(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1533  =

004fa11861f89c Walter Lozano   2014-10-03  1534  	/* get phy addr and creat=
e mdio */
004fa11861f89c Walter Lozano   2014-10-03  1535  	ret =3D altera_tse_phy_ge=
t_addr_mdio_create(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1536  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1537  	if (ret)
a76420092d3d9f Vince Bridgers  2014-04-24  1538  		goto err_free_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1539  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1540  	/* initialize netdev */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1541  	ndev->mem_start =3D contr=
ol_port->start;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1542  	ndev->mem_end =3D control=
_port->end;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1543  	ndev->netdev_ops =3D &alt=
era_tse_netdev_ops;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1544  	altera_tse_set_ethtool_op=
s(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1545  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1546  	altera_tse_netdev_ops.ndo=
_set_rx_mode =3D tse_set_rx_mode;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1547  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1548  	if (priv->hash_filter)
bbd2190ce96d8f Vince Bridgers  2014-03-17  1549  		altera_tse_netdev_ops.nd=
o_set_rx_mode =3D
bbd2190ce96d8f Vince Bridgers  2014-03-17  1550  			tse_set_rx_mode_hashfil=
ter;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1551  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1552  	/* Scatter/gather IO is n=
ot supported,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1553  	 * so it is turned off
bbd2190ce96d8f Vince Bridgers  2014-03-17  1554  	 */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1555  	ndev->hw_features &=3D ~N=
ETIF_F_SG;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1556  	ndev->features |=3D ndev-=
>hw_features | NETIF_F_HIGHDMA;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1557  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1558  	/* VLAN offloading of tag=
ging, stripping and filtering is not
bbd2190ce96d8f Vince Bridgers  2014-03-17  1559  	 * supported by hardware,=
 but driver will accommodate the
bbd2190ce96d8f Vince Bridgers  2014-03-17  1560  	 * extra 4-byte VLAN tag =
for processing by upper layers
bbd2190ce96d8f Vince Bridgers  2014-03-17  1561  	 */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1562  	ndev->features |=3D NETIF=
_F_HW_VLAN_CTAG_RX;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1563  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1564  	/* setup NAPI interface */
bbd2190ce96d8f Vince Bridgers  2014-03-17  1565  	netif_napi_add(ndev, &pri=
v->napi, tse_poll, NAPI_POLL_WEIGHT);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1566  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1567  	spin_lock_init(&priv->mac=
_cfg_lock);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1568  	spin_lock_init(&priv->tx_=
lock);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1569  	spin_lock_init(&priv->rxd=
ma_irq_lock);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1570  =

d43cefcd68bbc9 Atsushi Nemoto  2015-09-08  1571  	netif_carrier_off(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1572  	ret =3D register_netdev(n=
dev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1573  	if (ret) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1574  		dev_err(&pdev->dev, "fai=
led to register TSE net device\n");
a76420092d3d9f Vince Bridgers  2014-04-24  1575  		goto err_register_netdev;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1576  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1577  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1578  	platform_set_drvdata(pdev=
, ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1579  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1580  	priv->revision =3D ioread=
32(&priv->mac_dev->megacore_revision);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1581  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1582  	if (netif_msg_probe(priv))
bbd2190ce96d8f Vince Bridgers  2014-03-17  1583  		dev_info(&pdev->dev, "Al=
tera TSE MAC version %d.%d at 0x%08lx irq %d/%d\n",
bbd2190ce96d8f Vince Bridgers  2014-03-17  1584  			 (priv->revision >> 8) =
& 0xff,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1585  			 priv->revision & 0xff,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1586  			 (unsigned long) contro=
l_port->start, priv->rx_irq,
bbd2190ce96d8f Vince Bridgers  2014-03-17  1587  			 priv->tx_irq);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1588  =

bbd2190ce96d8f Vince Bridgers  2014-03-17  1589  	ret =3D init_phy(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1590  	if (ret !=3D 0) {
bbd2190ce96d8f Vince Bridgers  2014-03-17  1591  		netdev_err(ndev, "Cannot=
 attach to PHY (error: %d)\n", ret);
a76420092d3d9f Vince Bridgers  2014-04-24  1592  		goto err_init_phy;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1593  	}
bbd2190ce96d8f Vince Bridgers  2014-03-17  1594  	return 0;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1595  =

a76420092d3d9f Vince Bridgers  2014-04-24  1596  err_init_phy:
a76420092d3d9f Vince Bridgers  2014-04-24  1597  	unregister_netdev(ndev);
a76420092d3d9f Vince Bridgers  2014-04-24  1598  err_register_netdev:
a76420092d3d9f Vince Bridgers  2014-04-24  1599  	netif_napi_del(&priv->nap=
i);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1600  	altera_tse_mdio_destroy(n=
dev);
a76420092d3d9f Vince Bridgers  2014-04-24  1601  err_free_netdev:
bbd2190ce96d8f Vince Bridgers  2014-03-17  1602  	free_netdev(ndev);
bbd2190ce96d8f Vince Bridgers  2014-03-17  1603  	return ret;
bbd2190ce96d8f Vince Bridgers  2014-03-17  1604  }
bbd2190ce96d8f Vince Bridgers  2014-03-17  1605  =


:::::: The code at line 1379 was first introduced by commit
:::::: bbd2190ce96d8fce031f0526c1f970b68adc9d1a Altera TSE: Add main and he=
ader file for Altera Ethernet Driver

:::::: TO: Vince Bridgers <vbridgers2013@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2214807768835022008==--

