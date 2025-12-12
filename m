Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AF82F49F9
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765550586; cv=none; b=DkLO4enPi6smXSZajTYcIHjTYicCzLEWlQ+SHyw8zvWYjeRCeClWaVyvwrlAXmzx7XDFuk34tnGv8Xx3fX6AhhglnBkIkJvaWwsrRynJ+CrynSFO3jO8A+0HdgFo8+gnthnpCbi8CCk+phOkryXEiD2uiQrDKwkhHxfIGP6QAGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765550586; c=relaxed/simple;
	bh=7U4gQi8WFoqSCpD6NNMlY0ZmWbj3qGBfbmCSs/i2mow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hF5k1bVbaALYNtWM3vhVb82hOs9o7m3eQSU72aebYdkf32/auNFucIkj/Jm35tFxbV9dq8pib++wnfrvTV7ej1oARBBcWzQNnvUmGXti0SxJBazo51ALYpZMrHuNZQdOeiti8uXbhijSeAqsTqWdpagyicLLoQGxQfsaMl5z1SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdhj/fAB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdhj/fAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765550585; x=1797086585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7U4gQi8WFoqSCpD6NNMlY0ZmWbj3qGBfbmCSs/i2mow=;
  b=gdhj/fABs+CR6k0NRG3NzruyaGKFl/gfbbgqUpTDhwRNvxEOTOe7Iscq
   T/Psy6uF5ufM2cRFXmNYiDR+8hmsky2nBiCRl4plDWOopnkccCxsvhaRI
   kSfzSsBKww6rA/uGuh/SAnMqkdxqU/m0+4wW5mwHYs2rcjN8ZPhd6LiF2
   lhg+LYLfT8F3afOwsYvylaokEjO7UDz9Eu0E5SLC/w6RdBmddyoAKUHNU
   qAoY0+o6FXxp8WWyigfdwVhnmVveKMUwBey7cQhvE3wFHUrPrCezNgIIf
   xeZ6ZEQcMYyzV6EZsgsMr8+FOuqXyMC9q8P4DLU1dE3b4ypPqbKJy+nL6
   g==;
X-CSE-ConnectionGUID: 2kEcHRh9RNmBsrQ1XwGjow==
X-CSE-MsgGUID: jX7jECI6RjKugeIn4u77tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78667595"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78667595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:43:03 -0800
X-CSE-ConnectionGUID: GKE/glxNQm+aWKMcHFHVmQ==
X-CSE-MsgGUID: TXa+NovJTCiwfqacY/2dLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197169733"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 06:43:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4ME-000000006Ar-2ijD;
	Fri, 12 Dec 2025 14:42:58 +0000
Date: Fri, 12 Dec 2025 22:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vfio/pci/vfio_pci_rdwr.c:294 vfio_pci_bar_rw() warn: 'io'
 from ioremap() not released on lines: 294.
Message-ID: <202512122200.tWxeNSjd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Yunxiang Li <Yunxiang.Li@amd.com>
CC: Alex Williamson <alex.williamson@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: e021e6cbfb5a695968afb6619828929a97e4a83a vfio/pci: Expose setup ROM at ROM bar when needed
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122200.tWxeNSjd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122200.tWxeNSjd-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_rdwr.c:294 vfio_pci_bar_rw() warn: 'io' from ioremap() not released on lines: 294.

Old smatch warnings:
drivers/vfio/pci/vfio_pci_rdwr.c:286 vfio_pci_bar_rw() error: testing array offset 'bar' after use.

vim +/io +294 drivers/vfio/pci/vfio_pci_rdwr.c

0d77ed3589ac05 Alex Williamson 2018-03-21  225  
536475109c8284 Max Gurtovoy    2021-08-26  226  ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
89e1f7d4c66d85 Alex Williamson 2012-07-31  227  			size_t count, loff_t *ppos, bool iswrite)
89e1f7d4c66d85 Alex Williamson 2012-07-31  228  {
89e1f7d4c66d85 Alex Williamson 2012-07-31  229  	struct pci_dev *pdev = vdev->pdev;
89e1f7d4c66d85 Alex Williamson 2012-07-31  230  	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
89e1f7d4c66d85 Alex Williamson 2012-07-31  231  	int bar = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
906ee99dd2a5c8 Alex Williamson 2013-02-14  232  	size_t x_start = 0, x_end = 0;
89e1f7d4c66d85 Alex Williamson 2012-07-31  233  	resource_size_t end;
906ee99dd2a5c8 Alex Williamson 2013-02-14  234  	void __iomem *io;
abafbc551fdded Alex Williamson 2020-04-22  235  	struct resource *res = &vdev->pdev->resource[bar];
906ee99dd2a5c8 Alex Williamson 2013-02-14  236  	ssize_t done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  237  
a13b64591747e8 Alex Williamson 2016-02-22  238  	if (pci_resource_start(pdev, bar))
89e1f7d4c66d85 Alex Williamson 2012-07-31  239  		end = pci_resource_len(pdev, bar);
e021e6cbfb5a69 Yunxiang Li     2025-01-02  240  	else if (bar == PCI_ROM_RESOURCE && pdev->rom && pdev->romlen)
e021e6cbfb5a69 Yunxiang Li     2025-01-02  241  		end = roundup_pow_of_two(pdev->romlen);
a13b64591747e8 Alex Williamson 2016-02-22  242  	else
a13b64591747e8 Alex Williamson 2016-02-22  243  		return -EINVAL;
89e1f7d4c66d85 Alex Williamson 2012-07-31  244  
906ee99dd2a5c8 Alex Williamson 2013-02-14  245  	if (pos >= end)
89e1f7d4c66d85 Alex Williamson 2012-07-31  246  		return -EINVAL;
89e1f7d4c66d85 Alex Williamson 2012-07-31  247  
906ee99dd2a5c8 Alex Williamson 2013-02-14  248  	count = min(count, (size_t)(end - pos));
89e1f7d4c66d85 Alex Williamson 2012-07-31  249  
89e1f7d4c66d85 Alex Williamson 2012-07-31  250  	if (bar == PCI_ROM_RESOURCE) {
906ee99dd2a5c8 Alex Williamson 2013-02-14  251  		/*
906ee99dd2a5c8 Alex Williamson 2013-02-14  252  		 * The ROM can fill less space than the BAR, so we start the
906ee99dd2a5c8 Alex Williamson 2013-02-14  253  		 * excluded range at the end of the actual ROM.  This makes
906ee99dd2a5c8 Alex Williamson 2013-02-14  254  		 * filling large ROM BARs much faster.
906ee99dd2a5c8 Alex Williamson 2013-02-14  255  		 */
e021e6cbfb5a69 Yunxiang Li     2025-01-02  256  		if (pci_resource_start(pdev, bar)) {
89e1f7d4c66d85 Alex Williamson 2012-07-31  257  			io = pci_map_rom(pdev, &x_start);
e021e6cbfb5a69 Yunxiang Li     2025-01-02  258  		} else {
e021e6cbfb5a69 Yunxiang Li     2025-01-02  259  			io = ioremap(pdev->rom, pdev->romlen);
e021e6cbfb5a69 Yunxiang Li     2025-01-02  260  			x_start = pdev->romlen;
abafbc551fdded Alex Williamson 2020-04-22  261  		}
e021e6cbfb5a69 Yunxiang Li     2025-01-02  262  		if (!io)
e021e6cbfb5a69 Yunxiang Li     2025-01-02  263  			return -ENOMEM;
89e1f7d4c66d85 Alex Williamson 2012-07-31  264  		x_end = end;
0d77ed3589ac05 Alex Williamson 2018-03-21  265  	} else {
8bccc5b80678c6 Yishai Hadas    2023-12-19  266  		int ret = vfio_pci_core_setup_barmap(vdev, bar);
abafbc551fdded Alex Williamson 2020-04-22  267  		if (ret) {
abafbc551fdded Alex Williamson 2020-04-22  268  			done = ret;
abafbc551fdded Alex Williamson 2020-04-22  269  			goto out;
abafbc551fdded Alex Williamson 2020-04-22  270  		}
89e1f7d4c66d85 Alex Williamson 2012-07-31  271  
89e1f7d4c66d85 Alex Williamson 2012-07-31  272  		io = vdev->barmap[bar];
0d77ed3589ac05 Alex Williamson 2018-03-21  273  	}
89e1f7d4c66d85 Alex Williamson 2012-07-31  274  
89e1f7d4c66d85 Alex Williamson 2012-07-31  275  	if (bar == vdev->msix_bar) {
89e1f7d4c66d85 Alex Williamson 2012-07-31  276  		x_start = vdev->msix_offset;
89e1f7d4c66d85 Alex Williamson 2012-07-31  277  		x_end = vdev->msix_offset + vdev->msix_size;
89e1f7d4c66d85 Alex Williamson 2012-07-31  278  	}
89e1f7d4c66d85 Alex Williamson 2012-07-31  279  
4de676d494cd8f Ankit Agrawal   2024-02-20  280  	done = vfio_pci_core_do_io_rw(vdev, res->flags & IORESOURCE_MEM, io, buf, pos,
bc93b9ae0151ae Alex Williamson 2020-08-17  281  				      count, x_start, x_end, iswrite);
89e1f7d4c66d85 Alex Williamson 2012-07-31  282  
906ee99dd2a5c8 Alex Williamson 2013-02-14  283  	if (done >= 0)
89e1f7d4c66d85 Alex Williamson 2012-07-31  284  		*ppos += done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  285  
e021e6cbfb5a69 Yunxiang Li     2025-01-02  286  	if (bar == PCI_ROM_RESOURCE) {
e021e6cbfb5a69 Yunxiang Li     2025-01-02  287  		if (pci_resource_start(pdev, bar))
89e1f7d4c66d85 Alex Williamson 2012-07-31  288  			pci_unmap_rom(pdev, io);
e021e6cbfb5a69 Yunxiang Li     2025-01-02  289  		else
e021e6cbfb5a69 Yunxiang Li     2025-01-02  290  			iounmap(io);
e021e6cbfb5a69 Yunxiang Li     2025-01-02  291  	}
e021e6cbfb5a69 Yunxiang Li     2025-01-02  292  
abafbc551fdded Alex Williamson 2020-04-22  293  out:
906ee99dd2a5c8 Alex Williamson 2013-02-14 @294  	return done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  295  }
84237a826b261d Alex Williamson 2013-02-18  296  

:::::: The code at line 294 was first introduced by commit
:::::: 906ee99dd2a5c819c1171ce5eaf6c080c027e58c vfio-pci: Cleanup BAR access

:::::: TO: Alex Williamson <alex.williamson@redhat.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
