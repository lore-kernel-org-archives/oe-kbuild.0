Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6136AE7
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Mar 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710080235; cv=none; b=abkKdJOoLm8yklaJNLtPhLsk2yTv1mjB9iVtZu7HFhb/aniA/ZHvtdnvquensr1ZmWYH+RtP7XA4ZN6xQkNVPnTnYEjZy7nKUW5Hr6RaO9bAwxhgK7anpLsKElkqLS1tG8GCDqf9DgqCu77Su8xjo97aSeij3vVFXAmOv97Pdeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710080235; c=relaxed/simple;
	bh=UjTqCqfP+6hhAAhUEOuNQtvYMhbEPeXR0nUu9ZUmCOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMc+t50G05VNSkKGt92BRc7LdrbA8PaHcGqATma0alw/g3DDbbytX4RBPZtVfpEQp9CqnPhO9KiKPH+DDgihR7EVZ5djxnqesdk93knZcoSYXh+Yw47Aea7/YCmz9qSiHMic8yto8Oza2YEIDskHjteSqCJ6Zhcv+l+qn7fR8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObJNufoM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObJNufoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710080233; x=1741616233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UjTqCqfP+6hhAAhUEOuNQtvYMhbEPeXR0nUu9ZUmCOE=;
  b=ObJNufoMT3N2Vvr5yhGOzzHXQjMNduVu8e01GRWUdfWUo/k2bZqOf8Dh
   fJc6rC2/DLrV/1png34Rdrz6B8VTJdFc2fB8XGFeNQ7sg7qBONzfJq3Hf
   2aHzFeNXx7iscMdyl8xRPevNqOMzFrctLzJAvH5XNZZoUV4c/FGGrexAf
   rIhHo3ap9s+JkU2eU6/dvxBk8tUd8MWilSNJD6EjL+N5ahHfelKw2/9Oq
   3OxVAouNg3+vjdW2jQSCOPyG1FQSozDW7/C6nKi/+IqIihiXTyLKi+QNT
   Dn81NVB0le/5E+juMTAs6Ym04xrP0b26d6f61ktATCEDnF+h0+9B4YLSP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="22204551"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="22204551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 07:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="41907490"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Mar 2024 07:17:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjJz9-0008Ip-19;
	Sun, 10 Mar 2024 14:17:07 +0000
Date: Sun, 10 Mar 2024 22:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11516/12944] drivers/net/ethernet/amd/lance.c:559
 lance_probe1() warn: Please consider using kcalloc instead of kmalloc_array
Message-ID: <202403102251.yzUvcvjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 772dd0342727cc3c3b676b5d97c99708e75730a2 [11516/12944] mm: enumerate all gfp flags
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20240308 (https://download.01.org/0day-ci/archive/20240310/202403102251.yzUvcvjn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403102251.yzUvcvjn-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/amd/lance.c:559 lance_probe1() warn: Please consider using kcalloc instead of kmalloc_array

Old smatch warnings:
drivers/net/ethernet/amd/lance.c:564 lance_probe1() warn: Please consider using kcalloc instead of kmalloc_array

vim +559 drivers/net/ethernet/amd/lance.c

462540bdb2f08d drivers/net/lance.c              Stephen Hemminger  2009-03-26  470  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  471  static int __init lance_probe1(struct net_device *dev, int ioaddr, int irq, int options)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  472  {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  473  	struct lance_private *lp;
00137dad17707f drivers/net/lance.c              Hannes Eder        2009-02-14  474  	unsigned long dma_channels;	/* Mark spuriously-busy DMA channels */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  475  	int i, reset_val, lance_version;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  476  	const char *chipname;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  477  	/* Flags for specific chips or boards. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  478  	unsigned char hpJ2405A = 0;	/* HP ISA adaptor */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  479  	int hp_builtin = 0;		/* HP on-board ethernet. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  480  	static int did_version;		/* Already printed version info. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  481  	unsigned long flags;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  482  	int err = -ENOMEM;
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  483  	void __iomem *bios;
0222ee53c483df drivers/net/ethernet/amd/lance.c Jakub Kicinski     2021-11-18  484  	u8 addr[ETH_ALEN];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  485  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  486  	/* First we look for special cases.
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  487  	   Check for HP's on-board ethernet by looking for 'HP' in the BIOS.
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  488  	   There are two HP versions, check the BIOS for the configuration port.
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  489  	   This method provided by L. Julliard, Laurent_Julliard@grenoble.hp.com.
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  490  	   */
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  491  	bios = ioremap(0xf00f0, 0x14);
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  492  	if (!bios)
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  493  		return -ENOMEM;
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  494  	if (readw(bios + 0x12) == 0x5048)  {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  495  		static const short ioaddr_table[] = { 0x300, 0x320, 0x340, 0x360};
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  496  		int hp_port = (readl(bios + 1) & 1)  ? 0x499 : 0x99;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  497  		/* We can have boards other than the built-in!  Verify this is on-board. */
8e95a2026f3b43 drivers/net/lance.c              Joe Perches        2009-12-03  498  		if ((inb(hp_port) & 0xc0) == 0x80 &&
8e95a2026f3b43 drivers/net/lance.c              Joe Perches        2009-12-03  499  		    ioaddr_table[inb(hp_port) & 3] == ioaddr)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  500  			hp_builtin = hp_port;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  501  	}
c44fec118b62ba drivers/net/lance.c              Al Viro            2006-03-24  502  	iounmap(bios);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  503  	/* We also recognize the HP Vectra on-board here, but check below. */
8e95a2026f3b43 drivers/net/lance.c              Joe Perches        2009-12-03  504  	hpJ2405A = (inb(ioaddr) == 0x08 && inb(ioaddr+1) == 0x00 &&
8e95a2026f3b43 drivers/net/lance.c              Joe Perches        2009-12-03  505  		    inb(ioaddr+2) == 0x09);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  506  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  507  	/* Reset the LANCE.	 */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  508  	reset_val = inw(ioaddr+LANCE_RESET); /* Reset the LANCE */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  509  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  510  	/* The Un-Reset needed is only needed for the real NE2100, and will
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  511  	   confuse the HP board. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  512  	if (!hpJ2405A)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  513  		outw(reset_val, ioaddr+LANCE_RESET);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  514  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  515  	outw(0x0000, ioaddr+LANCE_ADDR); /* Switch to window 0 */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  516  	if (inw(ioaddr+LANCE_DATA) != 0x0004)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  517  		return -ENODEV;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  518  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  519  	/* Get the version of the chip. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  520  	outw(88, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  521  	if (inw(ioaddr+LANCE_ADDR) != 88) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  522  		lance_version = 0;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  523  	} else {			/* Good, it's a newer chip. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  524  		int chip_version = inw(ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  525  		outw(89, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  526  		chip_version |= inw(ioaddr+LANCE_DATA) << 16;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  527  		if (lance_debug > 2)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  528  			printk("  LANCE chip version is %#x.\n", chip_version);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  529  		if ((chip_version & 0xfff) != 0x003)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  530  			return -ENODEV;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  531  		chip_version = (chip_version >> 12) & 0xffff;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  532  		for (lance_version = 1; chip_table[lance_version].id_number; lance_version++) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  533  			if (chip_table[lance_version].id_number == chip_version)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  534  				break;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  535  		}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  536  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  537  
b74ca3a896b9ab drivers/net/lance.c              Wang Chen          2008-12-08  538  	/* We can't allocate private data from alloc_etherdev() because it must
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  539  	   a ISA DMA-able region. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  540  	chipname = chip_table[lance_version].name;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  541  	printk("%s: %s at %#3x, ", dev->name, chipname, ioaddr);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  542  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  543  	/* There is a 16 byte station address PROM at the base address.
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  544  	   The first six bytes are the station address. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  545  	for (i = 0; i < 6; i++)
0222ee53c483df drivers/net/ethernet/amd/lance.c Jakub Kicinski     2021-11-18  546  		addr[i] = inb(ioaddr + i);
0222ee53c483df drivers/net/ethernet/amd/lance.c Jakub Kicinski     2021-11-18  547  	eth_hw_addr_set(dev, addr);
e174961ca1a0b2 drivers/net/lance.c              Johannes Berg      2008-10-27  548  	printk("%pM", dev->dev_addr);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  549  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  550  	dev->base_addr = ioaddr;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  551  	/* Make certain the data structures used by the LANCE are aligned and DMAble. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  552  
dd00cc486ab1c1 drivers/net/lance.c              Yoann Padioleau    2007-07-19  553  	lp = kzalloc(sizeof(*lp), GFP_DMA | GFP_KERNEL);
a09f4af177d2a5 drivers/net/ethernet/amd/lance.c Amitoj Kaur Chawla 2016-02-17  554  	if (!lp)
a09f4af177d2a5 drivers/net/ethernet/amd/lance.c Amitoj Kaur Chawla 2016-02-17  555  		return -ENOMEM;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  556  	if (lance_debug > 6) printk(" (#0x%05lx)", (unsigned long)lp);
c0103606b7e3db drivers/net/lance.c              Wang Chen          2008-11-20  557  	dev->ml_priv = lp;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  558  	lp->name = chipname;
6da2ec56059c3c drivers/net/ethernet/amd/lance.c Kees Cook          2018-06-12 @559  	lp->rx_buffs = (unsigned long)kmalloc_array(RX_RING_SIZE, PKT_BUF_SZ,
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  560  						    GFP_DMA | GFP_KERNEL);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  561  	if (!lp->rx_buffs)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  562  		goto out_lp;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  563  	if (lance_need_isa_bounce_buffers) {
6da2ec56059c3c drivers/net/ethernet/amd/lance.c Kees Cook          2018-06-12  564  		lp->tx_bounce_buffs = kmalloc_array(TX_RING_SIZE, PKT_BUF_SZ,
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  565  						    GFP_DMA | GFP_KERNEL);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  566  		if (!lp->tx_bounce_buffs)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  567  			goto out_rx;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  568  	} else
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  569  		lp->tx_bounce_buffs = NULL;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  570  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  571  	lp->chip_version = lance_version;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  572  	spin_lock_init(&lp->devlock);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  573  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  574  	lp->init_block.mode = 0x0003;		/* Disable Rx and Tx. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  575  	for (i = 0; i < 6; i++)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  576  		lp->init_block.phys_addr[i] = dev->dev_addr[i];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  577  	lp->init_block.filter[0] = 0x00000000;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  578  	lp->init_block.filter[1] = 0x00000000;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  579  	lp->init_block.rx_ring = ((u32)isa_virt_to_bus(lp->rx_ring) & 0xffffff) | RX_RING_LEN_BITS;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  580  	lp->init_block.tx_ring = ((u32)isa_virt_to_bus(lp->tx_ring) & 0xffffff) | TX_RING_LEN_BITS;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  581  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  582  	outw(0x0001, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  583  	inw(ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  584  	outw((short) (u32) isa_virt_to_bus(&lp->init_block), ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  585  	outw(0x0002, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  586  	inw(ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  587  	outw(((u32)isa_virt_to_bus(&lp->init_block)) >> 16, ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  588  	outw(0x0000, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  589  	inw(ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  590  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  591  	if (irq) {					/* Set iff PCI card. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  592  		dev->dma = 4;			/* Native bus-master, no DMA channel needed. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  593  		dev->irq = irq;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  594  	} else if (hp_builtin) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  595  		static const char dma_tbl[4] = {3, 5, 6, 0};
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  596  		static const char irq_tbl[4] = {3, 4, 5, 9};
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  597  		unsigned char port_val = inb(hp_builtin);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  598  		dev->dma = dma_tbl[(port_val >> 4) & 3];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  599  		dev->irq = irq_tbl[(port_val >> 2) & 3];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  600  		printk(" HP Vectra IRQ %d DMA %d.\n", dev->irq, dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  601  	} else if (hpJ2405A) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  602  		static const char dma_tbl[4] = {3, 5, 6, 7};
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  603  		static const char irq_tbl[8] = {3, 4, 5, 9, 10, 11, 12, 15};
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  604  		short reset_val = inw(ioaddr+LANCE_RESET);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  605  		dev->dma = dma_tbl[(reset_val >> 2) & 3];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  606  		dev->irq = irq_tbl[(reset_val >> 4) & 7];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  607  		printk(" HP J2405A IRQ %d DMA %d.\n", dev->irq, dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  608  	} else if (lance_version == PCNET_ISAP) {		/* The plug-n-play version. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  609  		short bus_info;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  610  		outw(8, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  611  		bus_info = inw(ioaddr+LANCE_BUS_IF);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  612  		dev->dma = bus_info & 0x07;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  613  		dev->irq = (bus_info >> 4) & 0x0F;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  614  	} else {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  615  		/* The DMA channel may be passed in PARAM1. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  616  		if (dev->mem_start & 0x07)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  617  			dev->dma = dev->mem_start & 0x07;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  618  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  619  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  620  	if (dev->dma == 0) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  621  		/* Read the DMA channel status register, so that we can avoid
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  622  		   stuck DMA channels in the DMA detection below. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  623  		dma_channels = ((inb(DMA1_STAT_REG) >> 4) & 0x0f) |
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  624  			(inb(DMA2_STAT_REG) & 0xf0);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  625  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  626  	err = -ENODEV;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  627  	if (dev->irq >= 2)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  628  		printk(" assigned IRQ %d", dev->irq);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  629  	else if (lance_version != 0)  {	/* 7990 boards need DMA detection first. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  630  		unsigned long irq_mask;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  631  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  632  		/* To auto-IRQ we enable the initialization-done and DMA error
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  633  		   interrupts. For ISA boards we get a DMA error, but VLB and PCI
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  634  		   boards will work. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  635  		irq_mask = probe_irq_on();
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  636  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  637  		/* Trigger an initialization just for the interrupt. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  638  		outw(0x0041, ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  639  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  640  		mdelay(20);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  641  		dev->irq = probe_irq_off(irq_mask);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  642  		if (dev->irq)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  643  			printk(", probed IRQ %d", dev->irq);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  644  		else {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  645  			printk(", failed to detect IRQ line.\n");
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  646  			goto out_tx;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  647  		}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  648  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  649  		/* Check for the initialization done bit, 0x0100, which means
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  650  		   that we don't need a DMA channel. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  651  		if (inw(ioaddr+LANCE_DATA) & 0x0100)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  652  			dev->dma = 4;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  653  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  654  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  655  	if (dev->dma == 4) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  656  		printk(", no DMA needed.\n");
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  657  	} else if (dev->dma) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  658  		if (request_dma(dev->dma, chipname)) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  659  			printk("DMA %d allocation failed.\n", dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  660  			goto out_tx;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  661  		} else
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  662  			printk(", assigned DMA %d.\n", dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  663  	} else {			/* OK, we have to auto-DMA. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  664  		for (i = 0; i < 4; i++) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  665  			static const char dmas[] = { 5, 6, 7, 3 };
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  666  			int dma = dmas[i];
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  667  			int boguscnt;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  668  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  669  			/* Don't enable a permanently busy DMA channel, or the machine
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  670  			   will hang. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  671  			if (test_bit(dma, &dma_channels))
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  672  				continue;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  673  			outw(0x7f04, ioaddr+LANCE_DATA); /* Clear the memory error bits. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  674  			if (request_dma(dma, chipname))
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  675  				continue;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  676  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  677  			flags=claim_dma_lock();
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  678  			set_dma_mode(dma, DMA_MODE_CASCADE);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  679  			enable_dma(dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  680  			release_dma_lock(flags);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  681  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  682  			/* Trigger an initialization. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  683  			outw(0x0001, ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  684  			for (boguscnt = 100; boguscnt > 0; --boguscnt)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  685  				if (inw(ioaddr+LANCE_DATA) & 0x0900)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  686  					break;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  687  			if (inw(ioaddr+LANCE_DATA) & 0x0100) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  688  				dev->dma = dma;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  689  				printk(", DMA %d.\n", dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  690  				break;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  691  			} else {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  692  				flags=claim_dma_lock();
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  693  				disable_dma(dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  694  				release_dma_lock(flags);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  695  				free_dma(dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  696  			}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  697  		}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  698  		if (i == 4) {			/* Failure: bail. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  699  			printk("DMA detection failed.\n");
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  700  			goto out_tx;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  701  		}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  702  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  703  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  704  	if (lance_version == 0 && dev->irq == 0) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  705  		/* We may auto-IRQ now that we have a DMA channel. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  706  		/* Trigger an initialization just for the interrupt. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  707  		unsigned long irq_mask;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  708  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  709  		irq_mask = probe_irq_on();
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  710  		outw(0x0041, ioaddr+LANCE_DATA);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  711  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  712  		mdelay(40);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  713  		dev->irq = probe_irq_off(irq_mask);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  714  		if (dev->irq == 0) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  715  			printk("  Failed to detect the 7990 IRQ line.\n");
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  716  			goto out_dma;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  717  		}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  718  		printk("  Auto-IRQ detected IRQ%d.\n", dev->irq);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  719  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  720  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  721  	if (chip_table[lp->chip_version].flags & LANCE_ENABLE_AUTOSELECT) {
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  722  		/* Turn on auto-select of media (10baseT or BNC) so that the user
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  723  		   can watch the LEDs even if the board isn't opened. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  724  		outw(0x0002, ioaddr+LANCE_ADDR);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  725  		/* Don't touch 10base2 power bit. */
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  726  		outw(inw(ioaddr+LANCE_BUS_IF) | 0x0002, ioaddr+LANCE_BUS_IF);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  727  	}
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  728  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  729  	if (lance_debug > 0  &&  did_version++ == 0)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  730  		printk(version);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  731  
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  732  	/* The LANCE-specific entries in the device structure. */
462540bdb2f08d drivers/net/lance.c              Stephen Hemminger  2009-03-26  733  	dev->netdev_ops = &lance_netdev_ops;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  734  	dev->watchdog_timeo = TX_TIMEOUT;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  735  
b1fc5505e0dbcc drivers/net/lance.c              Herbert Xu         2005-05-12  736  	err = register_netdev(dev);
b1fc5505e0dbcc drivers/net/lance.c              Herbert Xu         2005-05-12  737  	if (err)
b1fc5505e0dbcc drivers/net/lance.c              Herbert Xu         2005-05-12  738  		goto out_dma;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  739  	return 0;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  740  out_dma:
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  741  	if (dev->dma != 4)
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  742  		free_dma(dev->dma);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  743  out_tx:
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  744  	kfree(lp->tx_bounce_buffs);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  745  out_rx:
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  746  	kfree((void*)lp->rx_buffs);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  747  out_lp:
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  748  	kfree(lp);
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  749  	return err;
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  750  }
^1da177e4c3f41 drivers/net/lance.c              Linus Torvalds     2005-04-16  751  

:::::: The code at line 559 was first introduced by commit
:::::: 6da2ec56059c3c7a7e5f729e6349e74ace1e5c57 treewide: kmalloc() -> kmalloc_array()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
