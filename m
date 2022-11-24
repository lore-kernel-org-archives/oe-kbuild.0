Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A1433F9
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Nov 2022 19:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669319676; x=1700855676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RKlEh0sb6cvBjyBzA35sOzEewFAkinm7gF37/W3axc=;
  b=B/8xugWwGMrOqpMxfdKv4/1aTjUFkcr43etbdBhDJZRIxaxweHMVUOoa
   7ycvW4MH6L3irKv4CBJnA48GAHnrUCBnBUMCFd1oammWYeUgNBQOWprr2
   zxogxSrbnijy1bthVG3+Zs4+lz55rTlz5iaUw0jh7ZVV4uHydTDEzwqx6
   ZwkT/nYPgNw6yAJjgB44XDa19iM/2Ldvh4MmMEEqkK0i0rg4jjr/fL45+
   hp/0vFZpaZ8wC2DUE3Wq9R1GAZDRIvllB3wBuExD93aKsiZUPBaKGYjZO
   GUXzDS5i9ttOCtkwVbeg1p7Mo8bx9jwk/mFl/M6bMwrsDoRENjt+/bnhD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="297717839"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="297717839"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2022 11:54:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="642482188"
X-IronPort-AV: E=Sophos;i="5.96,191,1665471600"; 
   d="scan'208";a="642482188"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Nov 2022 11:54:35 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oyIIs-0004CX-1y;
	Thu, 24 Nov 2022 19:54:34 +0000
Date: Fri, 25 Nov 2022 03:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/dlink/sundance.c:894:39: warning: Operator '|'
 with one operand equal to zero is redundant. [badBitmaskCheck]
Message-ID: <202211250344.IxN16qPq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/dlink/sundance.c:894:39: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stafford Horne <shorne@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c3eb11fbb826879be773c137f281569efce67aa8
commit: ded2ee36313c941f1a12b6f85cde295b575264ae openrisc: Add pci bus support
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ded2ee36313c941f1a12b6f85cde295b575264ae
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/dlink/sundance.c:894:39: warning: Operator '|' with one operand equal to zero is redundant. [badBitmaskCheck]
    iowrite8(ioread8(ioaddr + WakeEvent) | 0x00, ioaddr + WakeEvent);
                                         ^
>> drivers/net/ethernet/dlink/sundance.c:803:31: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
     int dataval = (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
   drivers/net/ethernet/dlink/sundance.c:802:11: note: Assignment 'i=31', assigned value is 31
    for (i = 31; i >= 0; i--) {
             ^
   drivers/net/ethernet/dlink/sundance.c:803:31: note: Shift
     int dataval = (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
>> drivers/net/ethernet/dlink/sundance.c:803:31: warning: Signed integer overflow for expression '1<<i'. [integerOverflow]
     int dataval = (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
   drivers/net/ethernet/dlink/sundance.c:802:11: note: Assignment 'i=31', assigned value is 31
    for (i = 31; i >= 0; i--) {
             ^
   drivers/net/ethernet/dlink/sundance.c:803:31: note: Integer overflow
     int dataval = (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^
>> drivers/net/ethernet/dlink/sundance.c:497:13: warning: Variable 'card_idx' is not assigned a value. [unassignedVariable]
    static int card_idx;
               ^
--
>> drivers/net/ethernet/emulex/benet/be_ethtool.c:389:23: warning: Local variable 'stats' shadows outer argument [shadowArgument]
     struct be_rx_stats *stats = rx_stats(rxo);
                         ^
   drivers/net/ethernet/emulex/benet/be_ethtool.c:374:28: note: Shadowed declaration
        struct ethtool_stats *stats, uint64_t *data)
                              ^
   drivers/net/ethernet/emulex/benet/be_ethtool.c:389:23: note: Shadow variable
     struct be_rx_stats *stats = rx_stats(rxo);
                         ^
   drivers/net/ethernet/emulex/benet/be_ethtool.c:405:23: warning: Local variable 'stats' shadows outer argument [shadowArgument]
     struct be_tx_stats *stats = tx_stats(txo);
                         ^
   drivers/net/ethernet/emulex/benet/be_ethtool.c:374:28: note: Shadowed declaration
        struct ethtool_stats *stats, uint64_t *data)
                              ^
   drivers/net/ethernet/emulex/benet/be_ethtool.c:405:23: note: Shadow variable
     struct be_tx_stats *stats = tx_stats(txo);
                         ^
>> drivers/net/ethernet/fungible/funeth/funeth_main.c:300:12: warning: Uninitialized variable: irq->txq [uninitvar]
     if (irq->txq || irq->rxq)  /* skip those in use */
              ^
>> drivers/net/ethernet/fungible/funeth/funeth_main.c:676:10: warning: Uninitialized variable: p->txq [uninitvar]
     if (p->txq) {
            ^

vim +894 drivers/net/ethernet/dlink/sundance.c

^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  790  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  791  static void mdio_write(struct net_device *dev, int phy_id, int location, int value)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  792  {
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  793  	struct netdev_private *np = netdev_priv(dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  794  	void __iomem *mdio_addr = np->base + MIICtrl;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  795  	int mii_cmd = (0x5002 << 16) | (phy_id << 23) | (location<<18) | value;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  796  	int i;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  797  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  798  	if (np->mii_preamble_required)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  799  		mdio_sync(mdio_addr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  800  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  801  	/* Shift the command bits out. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  802  	for (i = 31; i >= 0; i--) {
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16 @803  		int dataval = (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  804  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  805  		iowrite8(dataval, mdio_addr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  806  		mdio_delay();
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  807  		iowrite8(dataval | MDIO_ShiftClk, mdio_addr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  808  		mdio_delay();
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  809  	}
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  810  	/* Clear out extra bits. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  811  	for (i = 2; i > 0; i--) {
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  812  		iowrite8(MDIO_EnbIn, mdio_addr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  813  		mdio_delay();
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  814  		iowrite8(MDIO_EnbIn | MDIO_ShiftClk, mdio_addr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  815  		mdio_delay();
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  816  	}
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  817  }
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  818  
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  819  static int mdio_wait_link(struct net_device *dev, int wait)
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  820  {
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  821  	int bmsr;
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  822  	int phy_id;
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  823  	struct netdev_private *np;
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  824  
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  825  	np = netdev_priv(dev);
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  826  	phy_id = np->phys[0];
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  827  
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  828  	do {
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  829  		bmsr = mdio_read(dev, phy_id, MII_BMSR);
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  830  		if (bmsr & 0x0004)
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  831  			return 0;
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  832  		mdelay(1);
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  833  	} while (--wait > 0);
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  834  	return -1;
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  835  }
5050015597efb5e drivers/net/sundance.c                Dan Nicholson            2008-08-20  836  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  837  static int netdev_open(struct net_device *dev)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  838  {
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  839  	struct netdev_private *np = netdev_priv(dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  840  	void __iomem *ioaddr = np->base;
c514f285c37fc70 drivers/net/ethernet/dlink/sundance.c Francois Romieu          2012-03-09  841  	const int irq = np->pci_dev->irq;
acd70c2bfddb52a drivers/net/sundance.c                Jesse Huang              2006-10-20  842  	unsigned long flags;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  843  	int i;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  844  
f210e87b6d3aab1 drivers/net/ethernet/dlink/sundance.c Denis Kirjanov           2012-12-01  845  	sundance_reset(dev, 0x00ff << 16);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  846  
c514f285c37fc70 drivers/net/ethernet/dlink/sundance.c Francois Romieu          2012-03-09  847  	i = request_irq(irq, intr_handler, IRQF_SHARED, dev->name, dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  848  	if (i)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  849  		return i;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  850  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  851  	if (netif_msg_ifup(np))
c514f285c37fc70 drivers/net/ethernet/dlink/sundance.c Francois Romieu          2012-03-09  852  		printk(KERN_DEBUG "%s: netdev_open() irq %d\n", dev->name, irq);
c514f285c37fc70 drivers/net/ethernet/dlink/sundance.c Francois Romieu          2012-03-09  853  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  854  	init_ring(dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  855  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  856  	iowrite32(np->rx_ring_dma, ioaddr + RxListPtr);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  857  	/* The Tx list pointer is written as packets are queued. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  858  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  859  	/* Initialize other registers. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  860  	__set_mac_addr(dev);
067577868b4fdea drivers/net/ethernet/dlink/sundance.c Javier Martinez Canillas 2016-09-12  861  #if IS_ENABLED(CONFIG_VLAN_8021Q)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  862  	iowrite16(dev->mtu + 18, ioaddr + MaxFrameSize);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  863  #else
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  864  	iowrite16(dev->mtu + 14, ioaddr + MaxFrameSize);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  865  #endif
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  866  	if (dev->mtu > 2047)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  867  		iowrite32(ioread32(ioaddr + ASICCtrl) | 0x0C, ioaddr + ASICCtrl);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  868  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  869  	/* Configure the PCI bus bursts and FIFO thresholds. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  870  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  871  	if (dev->if_port == 0)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  872  		dev->if_port = np->default_port;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  873  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  874  	spin_lock_init(&np->mcastlock);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  875  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  876  	set_rx_mode(dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  877  	iowrite16(0, ioaddr + IntrEnable);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  878  	iowrite16(0, ioaddr + DownCounter);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  879  	/* Set the chip to poll every N*320nsec. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  880  	iowrite8(100, ioaddr + RxDMAPollPeriod);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  881  	iowrite8(127, ioaddr + TxDMAPollPeriod);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  882  	/* Fix DFE-580TX packet drop issue */
44c10138fd4bbc4 drivers/net/sundance.c                Auke Kok                 2007-06-08  883  	if (np->pci_dev->revision >= 0x14)
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  884  		iowrite8(0x01, ioaddr + DebugCtrl1);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  885  	netif_start_queue(dev);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  886  
acd70c2bfddb52a drivers/net/sundance.c                Jesse Huang              2006-10-20  887  	spin_lock_irqsave(&np->lock, flags);
acd70c2bfddb52a drivers/net/sundance.c                Jesse Huang              2006-10-20  888  	reset_tx(dev);
acd70c2bfddb52a drivers/net/sundance.c                Jesse Huang              2006-10-20  889  	spin_unlock_irqrestore(&np->lock, flags);
acd70c2bfddb52a drivers/net/sundance.c                Jesse Huang              2006-10-20  890  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  891  	iowrite16 (StatsEnable | RxEnable | TxEnable, ioaddr + MACCtrl1);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  892  
f210e87b6d3aab1 drivers/net/ethernet/dlink/sundance.c Denis Kirjanov           2012-12-01  893  	/* Disable Wol */
f210e87b6d3aab1 drivers/net/ethernet/dlink/sundance.c Denis Kirjanov           2012-12-01 @894  	iowrite8(ioread8(ioaddr + WakeEvent) | 0x00, ioaddr + WakeEvent);
f210e87b6d3aab1 drivers/net/ethernet/dlink/sundance.c Denis Kirjanov           2012-12-01  895  	np->wol_enabled = 0;
f210e87b6d3aab1 drivers/net/ethernet/dlink/sundance.c Denis Kirjanov           2012-12-01  896  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  897  	if (netif_msg_ifup(np))
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  898  		printk(KERN_DEBUG "%s: Done netdev_open(), status: Rx %x Tx %x "
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  899  			   "MAC Control %x, %4.4x %4.4x.\n",
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  900  			   dev->name, ioread32(ioaddr + RxStatus), ioread8(ioaddr + TxStatus),
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  901  			   ioread32(ioaddr + MACCtrl0),
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  902  			   ioread16(ioaddr + MACCtrl1), ioread16(ioaddr + MACCtrl0));
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  903  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  904  	/* Set the timer to check for link beat. */
9cb618c29501696 drivers/net/ethernet/dlink/sundance.c Kees Cook                2017-10-26  905  	timer_setup(&np->timer, netdev_timer, 0);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  906  	np->timer.expires = jiffies + 3*HZ;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  907  	add_timer(&np->timer);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  908  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  909  	/* Enable interrupts by setting the interrupt mask. */
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  910  	iowrite16(DEFAULT_INTR, ioaddr + IntrEnable);
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  911  
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  912  	return 0;
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  913  }
^1da177e4c3f415 drivers/net/sundance.c                Linus Torvalds           2005-04-16  914  

:::::: The code at line 894 was first introduced by commit
:::::: f210e87b6d3aab1fb3eb51a006f4502c1a7a2494 sundance: Enable WoL support

:::::: TO: Denis Kirjanov <kda@linux-powerpc.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
