Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCA612D
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 03:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQzPQ++7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709136; x=1732245136;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gDtHWLc/4BuYl1ocqK6mIR0tZAuzJc/cINPJNHw4O8=;
  b=WQzPQ++7g3BKuKn7AEVvxjonx2l443OHSECP4D1Tf0gw7Sx+yxDdDe0c
   0pTF2pJTkkajlTZuCybFSV+lRl5B4+IQDBB3oIPDLe8Evnug2tv6fkFaO
   xbyf75bF5kPrfgMdyQVe9bp6BLuN+u4fhcjsoe+OvWEj70pRmkfKXRaY9
   lM/A+3Y+lxWjPwhLCRlWQOC9unM95VlTnitaqdcHcea6VpT4CSb4WdNr1
   /gsU2RQ2McuqaFMXKVKQjefkafNgRKKA2CG3gh8aFeXMAsL6RiP5mtbyg
   D8ZxL2KzLgDHjbziQHs1TCcICEtZtxKdbYUTyM1tPdc5mJ7+E/qcgB7XX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13744886"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13744886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8712761"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608Q-0001AI-1Y;
	Thu, 23 Nov 2023 03:12:10 +0000
Date: Thu, 23 Nov 2023 11:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/ethernet/3com/3c589_cs.c:581:2: warning: performing
 pointer arithmetic on a null pointer has undefined behavior
Message-ID: <202311230749.rddGc0Js-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/3com/3c589_cs.c:581:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Maciej W. Rozycki" <macro@orcam.me.uk>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Maciej,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b6de136b5f0158c60844f85286a593cb70fb364
commit: 9cc205e3c17d5716da7ebb7fa0c985555e95d009 RISC-V: Make port I/O string accessors actually work
date:   1 year, 1 month ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year, 1 month ago
config: riscv-randconfig-r133-20231123 (https://download.01.org/0day-ci/archive/20231123/202311230749.rddGc0Js-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230749.rddGc0Js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311230749.rddGc0Js-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     743 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c589_cs.c:33:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/3com/3c589_cs.c:581:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     581 |         outsl(ioaddr + TX_FIFO, skb->data, (skb->len + 3) >> 2);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   drivers/net/ethernet/3com/3c589_cs.c:861:5: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     861 |                                 insl(ioaddr+RX_FIFO, skb_put(skb, pkt_len),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     862 |                         (pkt_len+3)>>2);
         |                         ~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   15 warnings generated.
--
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     743 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/net/ethernet/3com/3c574_cs.c:79:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1134 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/net/ethernet/3com/3c574_cs.c:748:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     748 |         outsl(ioaddr + TX_FIFO, skb->data, (skb->len+3)>>2);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   drivers/net/ethernet/3com/3c574_cs.c:1015:5: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1015 |                                 insl(ioaddr+RX_FIFO, skb_put(skb, pkt_len),
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1016 |                                                 ((pkt_len+3)>>2));
         |                                                 ~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   15 warnings generated.


vim +581 drivers/net/ethernet/3com/3c589_cs.c

^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  562  
dbf02fae406daf4 drivers/net/pcmcia/3c589_cs.c Stephen Hemminger 2009-08-31  563  static netdev_tx_t el3_start_xmit(struct sk_buff *skb,
dbf02fae406daf4 drivers/net/pcmcia/3c589_cs.c Stephen Hemminger 2009-08-31  564  					struct net_device *dev)
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  565  {
906da809c5be30b drivers/net/pcmcia/3c589_cs.c Olof Johansson    2008-02-04  566  	unsigned int ioaddr = dev->base_addr;
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  567  	struct el3_private *priv = netdev_priv(dev);
d08d283974f96cb drivers/net/pcmcia/3c589_cs.c Komuro            2006-12-02  568  	unsigned long flags;
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  569  
f64e96973a1fa88 drivers/net/pcmcia/3c589_cs.c Alexander Kurz    2010-03-31  570  	netdev_dbg(dev, "el3_start_xmit(length = %ld) called, status %4.4x.\n",
f64e96973a1fa88 drivers/net/pcmcia/3c589_cs.c Alexander Kurz    2010-03-31  571  	       (long)skb->len, inw(ioaddr + EL3_STATUS));
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  572  
d08d283974f96cb drivers/net/pcmcia/3c589_cs.c Komuro            2006-12-02  573  	spin_lock_irqsave(&priv->lock, flags);
d08d283974f96cb drivers/net/pcmcia/3c589_cs.c Komuro            2006-12-02  574  
cd65284f6ec4826 drivers/net/pcmcia/3c589_cs.c Paulius Zaleckas  2008-04-30  575  	dev->stats.tx_bytes += skb->len;
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  576  
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  577  	/* Put out the doubleword header... */
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  578  	outw(skb->len, ioaddr + TX_FIFO);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  579  	outw(0x00, ioaddr + TX_FIFO);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  580  	/* ... and the packet rounded to a doubleword. */
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16 @581  	outsl(ioaddr + TX_FIFO, skb->data, (skb->len + 3) >> 2);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  582  
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  583  	if (inw(ioaddr + TX_FREE) <= 1536) {
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  584  		netif_stop_queue(dev);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  585  		/* Interrupt us when the FIFO has room for max-sized packet. */
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  586  		outw(SetTxThreshold + 1536, ioaddr + EL3_CMD);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  587  	}
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  588  
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  589  	pop_tx_status(dev);
d08d283974f96cb drivers/net/pcmcia/3c589_cs.c Komuro            2006-12-02  590  	spin_unlock_irqrestore(&priv->lock, flags);
63ac9b915924d12 drivers/net/pcmcia/3c589_cs.c Patrick McHardy   2007-07-02  591  	dev_kfree_skb(skb);
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  592  
6ed106549d17474 drivers/net/pcmcia/3c589_cs.c Patrick McHardy   2009-06-23  593  	return NETDEV_TX_OK;
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  594  }
^1da177e4c3f415 drivers/net/pcmcia/3c589_cs.c Linus Torvalds    2005-04-16  595  

:::::: The code at line 581 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
