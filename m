Content-Type: multipart/mixed; boundary="===============8821211125902566916=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [wireless-drivers-next:master 8/21] drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c:596 qtnf_pcie_skb_send() warn: variable dereferenced before check 'skb' (see line 560)
Date: Thu, 21 Nov 2019 11:04:51 +0300
Message-ID: <20191121080451.GA617@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8821211125902566916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-driv=
ers-next.git master
head:   924ea58dadea23cc28b60d02b9c0896b7b168a6f
commit: 904628d3130b5aef0c9b06efa80e5a96f203e000 [8/21] qtnfmac: add interf=
ace ID to each packet

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c:596 qtnf_pcie_skb_=
send() warn: variable dereferenced before check 'skb' (see line 560)

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-ne=
xt.git/commit/?id=3D904628d3130b5aef0c9b06efa80e5a96f203e000
git remote add wireless-drivers-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/kvalo/wireless-drivers-next.git
git remote update wireless-drivers-next
git checkout 904628d3130b5aef0c9b06efa80e5a96f203e000
vim +/skb +596 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c

904628d3130b5a drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2019-11-18  535  static int qtnf_pcie_skb_send(struct qtnf_=
bus *bus, struct sk_buff *skb)
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  536  {
addc7540708f52 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  537  	struct qtnf_pcie_pearl_state *ps =3D get_=
bus_priv(bus);
c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  538  	struct qtnf_pcie_bus_priv *priv =3D &ps->=
base;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  539  	dma_addr_t txbd_paddr, skb_paddr;
d0b95bfa11786e drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  540  	struct qtnf_pearl_tx_bd *txbd;
20da2ec06bfad2 drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-09-18  541  	unsigned long flags;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  542  	int len, i;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  543  	u32 info;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  544  	int ret =3D 0;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  545  =

21077d09b4a67e drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  546  	spin_lock_irqsave(&priv->tx_lock, flags);
20da2ec06bfad2 drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-09-18  547  =

c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  548  	if (!qtnf_tx_queue_ready(ps)) {
c35c0d54a77d0f drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-10-30  549  		if (skb->dev) {
                                                                           =
                                                 ^^^^^^^^
c35c0d54a77d0f drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-10-30  550  			netif_tx_stop_all_queues(skb->dev);
c35c0d54a77d0f drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-10-30  551  			priv->tx_stopped =3D 1;
c35c0d54a77d0f drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-10-30  552  		}
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  553  =

21077d09b4a67e drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  554  		spin_unlock_irqrestore(&priv->tx_lock, f=
lags);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  555  		return NETDEV_TX_BUSY;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  556  	}
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  557  =

3cbc3a0f19ac73 drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-15  558  	i =3D priv->tx_bd_w_index;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  559  	priv->tx_skb[i] =3D skb;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11 @560  	len =3D skb->len;
                                                                           =
                                           ^^^^^^^^

Dereferenced without checking.

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  561  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  562  	skb_paddr =3D pci_map_single(priv->pdev, =
skb->data,
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  563  				   skb->len, PCI_DMA_TODEVICE);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  564  	if (pci_dma_mapping_error(priv->pdev, skb=
_paddr)) {
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  565  		pr_err("skb DMA mapping error: %pad\n", =
&skb_paddr);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  566  		ret =3D -ENOMEM;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  567  		goto tx_done;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  568  	}
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  569  =

c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  570  	txbd =3D &ps->tx_bd_vbase[i];
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  571  	txbd->addr =3D cpu_to_le32(QTN_HOST_LO32(=
skb_paddr));
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  572  	txbd->addr_h =3D cpu_to_le32(QTN_HOST_HI3=
2(skb_paddr));
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  573  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  574  	info =3D (len & QTN_PCIE_TX_DESC_LEN_MASK=
) << QTN_PCIE_TX_DESC_LEN_SHIFT;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  575  	txbd->info =3D cpu_to_le32(info);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  576  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  577  	/* sync up all descriptor updates before =
passing them to EP */
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  578  	dma_wmb();
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  579  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  580  	/* write new TX descriptor to PCIE_RX_FIF=
O on EP */
c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  581  	txbd_paddr =3D ps->tx_bd_pbase + i * size=
of(struct qtnf_pearl_tx_bd);
f31039d4aea97d drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-29  582  =

f31039d4aea97d drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-29  583  #ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  584  	writel(QTN_HOST_HI32(txbd_paddr),
c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  585  	       PCIE_HDP_HOST_WR_DESC0_H(ps->pcie_=
reg_base));
f31039d4aea97d drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-29  586  #endif
f31039d4aea97d drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-29  587  	writel(QTN_HOST_LO32(txbd_paddr),
c9ff6c9157c2e6 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  588  	       PCIE_HDP_HOST_WR_DESC0(ps->pcie_re=
g_base));
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  589  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  590  	if (++i >=3D priv->tx_bd_num)
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  591  		i =3D 0;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  592  =

3cbc3a0f19ac73 drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-15  593  	priv->tx_bd_w_index =3D i;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  594  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  595  tx_done:
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11 @596  	if (ret && skb) {
                                                                           =
                                                ^^^
Checked too late.

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  597  		pr_err_ratelimited("drop skb\n");
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  598  		if (skb->dev)
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  599  			skb->dev->stats.tx_dropped++;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  600  		dev_kfree_skb_any(skb);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  601  	}
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  602  =

0593da274d4d7f drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-08-15  603  	priv->tx_done_count++;
21077d09b4a67e drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  604  	spin_unlock_irqrestore(&priv->tx_lock, fl=
ags);
20da2ec06bfad2 drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Ser=
gey Matyukevich 2017-09-18  605  =

789763b683eb77 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c Igo=
r Mitsyanko     2018-09-24  606  	qtnf_pearl_data_tx_reclaim(ps);
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  607  =

98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  608  	return NETDEV_TX_OK;
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  609  }
98f44cb0655cbe drivers/net/wireless/quantenna/qtnfmac/pearl/pcie.c      Igo=
r Mitsyanko     2017-05-11  610  =


:::::: The code at line 596 was first introduced by commit
:::::: 98f44cb0655cbef0850ba7ff4c8213fb1bf9b6a2 qtnfmac: introduce new Full=
MAC driver for Quantenna chipsets

:::::: TO: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>
:::::: CC: Kalle Valo <kvalo@codeaurora.org>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============8821211125902566916==--

