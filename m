Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85048C8CD
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687172306; x=1718708306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wRgm7YaDnLTwjj3VMZO/kOgxP/Ou7KO5oIG8aNNLZWY=;
  b=MC9LxK89jKqia3gkzBJkeQA/LLfAxOogiAO7T+cIfM+cVSfxfNv14CDh
   odv4Nj7j1c8ZrFKDQcNjH1fDtXR9MF61ahkTd3/p2+GnEdpJtnRSg1iw9
   9vNpa/tggocyhbE2Yc9Dc6cWUt9j1NawCUW0GNjvTYVXyCOEq3KOMeT+e
   2tzCZavprYfYPupwcL+pLyQuNSXh04npewI0dOwQJa5b4XhiTlJ47klk+
   X6+fBr17MJ15d12s1OBhELqjiQxk3fMG9VnNgVHSWQW0GVBxbpje12EPU
   OtT0RXpzy1uMXzbuoK9Wlqf70FBbSjcf2J8e2SyEBaLNESGsWGw8k8RwE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="339941364"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="339941364"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 03:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="803578863"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="803578863"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Jun 2023 03:58:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBCaV-0004eQ-2T;
	Mon, 19 Jun 2023 10:58:23 +0000
Date: Mon, 19 Jun 2023 18:57:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/um/drivers/pcap_kern.c:18:6: warning: no previous prototype for
 function 'pcap_init_kern'
Message-ID: <202306191858.eFmFIBr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "um arch report"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Foley <pefoley2@pefoley.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45a3e24f65e90a047bef86f927ebdc4c710edaa1
commit: 2c4d3841a82b88ae8a7b518dc6206f84f68e705a um: Avoid pcap multiple definition errors
date:   4 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r003-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191858.eFmFIBr3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191858.eFmFIBr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306191858.eFmFIBr3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/um/drivers/pcap_kern.c:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/um/drivers/pcap_kern.c:18:6: warning: no previous prototype for function 'pcap_init_kern' [-Wmissing-prototypes]
   void pcap_init_kern(struct net_device *dev, void *data)
        ^
   arch/um/drivers/pcap_kern.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pcap_init_kern(struct net_device *dev, void *data)
   ^
   static 
   arch/um/drivers/pcap_kern.c:53:5: warning: no previous prototype for function 'pcap_setup' [-Wmissing-prototypes]
   int pcap_setup(char *str, char **mac_out, void *data)
       ^
   arch/um/drivers/pcap_kern.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pcap_setup(char *str, char **mac_out, void *data)
   ^
   static 
   14 warnings generated.


vim +/pcap_init_kern +18 arch/um/drivers/pcap_kern.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  17  
2c4d3841a82b88 Peter Foley    2023-01-12 @18  void pcap_init_kern(struct net_device *dev, void *data)
^1da177e4c3f41 Linus Torvalds 2005-04-16  19  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  20  	struct uml_net_private *pri;
^1da177e4c3f41 Linus Torvalds 2005-04-16  21  	struct pcap_data *ppri;
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  	struct pcap_init *init = data;
^1da177e4c3f41 Linus Torvalds 2005-04-16  23  
17c324fa80914e Wang Chen      2008-12-04  24  	pri = netdev_priv(dev);
^1da177e4c3f41 Linus Torvalds 2005-04-16  25  	ppri = (struct pcap_data *) pri->user;
^1da177e4c3f41 Linus Torvalds 2005-04-16  26  	ppri->host_if = init->host_if;
^1da177e4c3f41 Linus Torvalds 2005-04-16  27  	ppri->promisc = init->promisc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  28  	ppri->optimize = init->optimize;
^1da177e4c3f41 Linus Torvalds 2005-04-16  29  	ppri->filter = init->filter;
7d98230a73c21b Jeff Dike      2007-05-08  30  
7d98230a73c21b Jeff Dike      2007-05-08  31  	printk("pcap backend, host interface %s\n", ppri->host_if);
^1da177e4c3f41 Linus Torvalds 2005-04-16  32  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
