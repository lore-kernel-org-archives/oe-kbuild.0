Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0128480
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687131351; x=1718667351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmiX1/dBefrkpzBR3FzGXTsv+iuoTEkdfwIvVP7u66g=;
  b=Tn1admeqp+UWineZaI4jo4UmD+DultqZAcpuVK6MT8VTce20C7FhFZ51
   X4+DPzPmmhjs1Zhvlp6jXrOcnN4m7j+CzSJPvV7gt1ho3cyZmNzMmfXkM
   EZHvj0rL3IUzI+SvrPQcQWv93CZsWiSgcXTSKlq7dwwhlwZJ9IKw750N+
   YsPrL4p/dz7xC3/ZJBHB/poIcfhsg56v5f1OAZn8SqEJcU6zMLuShtyAU
   oytlBy/3wa5up2hupo8jE5QuS1EaCjLVA/ZQOT+imfFtXUGel8ex1YXlp
   oraeVAOroYExxljWBV3u1dwNKl9uvMEaJjbdLejKJ6iq1cNxAO5Jgp1y+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="445896143"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="445896143"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 16:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="887734990"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="887734990"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jun 2023 16:35:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB1vw-00048R-0t;
	Sun, 18 Jun 2023 23:35:48 +0000
Date: Mon, 19 Jun 2023 07:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/um/drivers/virt-pci.c:537:21: warning: no previous prototype
 for function 'pcibios_get_phb_of_node'
Message-ID: <202306190737.Z3uYTGpX-lkp@intel.com>
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
TO: Vincent Whitchurch <vincent.whitchurch@axis.com>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   45a3e24f65e90a047bef86f927ebdc4c710edaa1
commit: 314a1408b79a844dafdcde867d90de5d509409b7 um: virt-pci: implement pcibios_get_phb_of_node()
date:   4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 months ago
config: um-randconfig-r002-20230619 (https://download.01.org/0day-ci/archive/20230619/202306190737.Z3uYTGpX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190737.Z3uYTGpX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306190737.Z3uYTGpX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/drivers/virt-pci.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from arch/um/drivers/virt-pci.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
   In file included from arch/um/drivers/virt-pci.c:7:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
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
>> arch/um/drivers/virt-pci.c:537:21: warning: no previous prototype for function 'pcibios_get_phb_of_node' [-Wmissing-prototypes]
   struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
                       ^
   arch/um/drivers/virt-pci.c:537:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
   ^
   static 
   13 warnings generated.


vim +/pcibios_get_phb_of_node +537 arch/um/drivers/virt-pci.c

68f5d3f3b65432 Johannes Berg      2021-03-05  535  
314a1408b79a84 Vincent Whitchurch 2023-01-20  536  /* Copied from arch/x86/kernel/devicetree.c */
314a1408b79a84 Vincent Whitchurch 2023-01-20 @537  struct device_node *pcibios_get_phb_of_node(struct pci_bus *bus)
314a1408b79a84 Vincent Whitchurch 2023-01-20  538  {
314a1408b79a84 Vincent Whitchurch 2023-01-20  539  	struct device_node *np;
314a1408b79a84 Vincent Whitchurch 2023-01-20  540  
314a1408b79a84 Vincent Whitchurch 2023-01-20  541  	for_each_node_by_type(np, "pci") {
314a1408b79a84 Vincent Whitchurch 2023-01-20  542  		const void *prop;
314a1408b79a84 Vincent Whitchurch 2023-01-20  543  		unsigned int bus_min;
314a1408b79a84 Vincent Whitchurch 2023-01-20  544  
314a1408b79a84 Vincent Whitchurch 2023-01-20  545  		prop = of_get_property(np, "bus-range", NULL);
314a1408b79a84 Vincent Whitchurch 2023-01-20  546  		if (!prop)
314a1408b79a84 Vincent Whitchurch 2023-01-20  547  			continue;
314a1408b79a84 Vincent Whitchurch 2023-01-20  548  		bus_min = be32_to_cpup(prop);
314a1408b79a84 Vincent Whitchurch 2023-01-20  549  		if (bus->number == bus_min)
314a1408b79a84 Vincent Whitchurch 2023-01-20  550  			return np;
314a1408b79a84 Vincent Whitchurch 2023-01-20  551  	}
314a1408b79a84 Vincent Whitchurch 2023-01-20  552  	return NULL;
314a1408b79a84 Vincent Whitchurch 2023-01-20  553  }
314a1408b79a84 Vincent Whitchurch 2023-01-20  554  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
