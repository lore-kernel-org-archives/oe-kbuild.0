Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3A8219E0
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 17:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735924549; cv=none; b=XKE20Y0omEBu/Uy1MphERL13w98wpPMknkMjj3ZCXGB0X6vCJiSnQjOemqHnQ1mE8vB3ej423Pdhl5fsXfKw1iVhOoMUf889tbkPeuStWsBntnnVEtxowDz7JV2xy9SV5twY0mm4tjh1WNVOSp3O3264uw+xZde09vJPPstArmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735924549; c=relaxed/simple;
	bh=Z/7/+OsAYbXd5dd6EJpaVc8Ir7wSoFvZ+YVwDU2a7eY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sq+a2mMA9rOuLlXp9Vuckh013ng6WVYO6VbdpoU7ppmWaUG0KbZk8yFbfFt+YpL2sXz3+vk/5f1lS4W7LJ6SLj9bDNYJeMUe9RPAArSTsgTlMRoxH3KY5SYzSkdGKB0tvZIH6vnQ9CPLvHA84AYI/nrI4jzj/Sg4xIc8KhPHP84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LM2umlK7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LM2umlK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735924547; x=1767460547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/7/+OsAYbXd5dd6EJpaVc8Ir7wSoFvZ+YVwDU2a7eY=;
  b=LM2umlK72uxe+HSEg5MocOfs3T0IxOkWNPUwfx8kKiHWuLAd/u/RYpta
   6vT3mCzAX3WB1HGP0ERn4F01CVVdKadxzND1rc9q8fOZ1der8/uwQI6aq
   CvP6mzGuqfN0ASdlRh+zzXUPcWJ01n7S7+PCbtblbUJTfNKLpzJZ3xAB/
   NzkWHL5CAokfNU0oSA/B9YSyNdVMTvAobmf5FwQZpTDbeWswuNfjmsPwn
   ECwd9sHFRzkFBXqbAnAvkdqkje0xvwakM1znHjBNDD6XoJZdMUrtcysTx
   W1umhkboNl5qY9Vjz+0ONv6E1yYISjCJVN2W8ghJ2SiHCSWudbvZdY+EK
   g==;
X-CSE-ConnectionGUID: 9MrYc8rZSJm4cnqo004BAw==
X-CSE-MsgGUID: KInTjem0RtGQbzWVoRF/0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39939280"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="39939280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 09:15:45 -0800
X-CSE-ConnectionGUID: +ECONeAqTKymFaxrnYCB5A==
X-CSE-MsgGUID: 81sD6AXhQIOTvjOLp/LkNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="139169408"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Jan 2025 09:15:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTlGv-000A51-2A;
	Fri, 03 Jan 2025 17:15:41 +0000
Date: Sat, 4 Jan 2025 01:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] vfio/pci: Expose setup ROM at ROM bar when needed
Message-ID: <202501040038.DNXYu89J-lkp@intel.com>
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
In-Reply-To: <20250102185013.15082-3-Yunxiang.Li@amd.com>
References: <20250102185013.15082-3-Yunxiang.Li@amd.com>
TO: Yunxiang Li <Yunxiang.Li@amd.com>
TO: kvm@vger.kernel.org
TO: alex.williamson@redhat.com
CC: kevin.tian@intel.com
CC: yishaih@nvidia.com
CC: ankita@nvidia.com
CC: jgg@ziepe.ca
CC: Yunxiang Li <Yunxiang.Li@amd.com>

Hi Yunxiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on awilliam-vfio/for-linus linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunxiang-Li/vfio-pci-Remove-shadow-ROM-specific-code-paths/20250103-025418
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250102185013.15082-3-Yunxiang.Li%40amd.com
patch subject: [PATCH v2 2/2] vfio/pci: Expose setup ROM at ROM bar when needed
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: alpha-randconfig-r073-20250103 (https://download.01.org/0day-ci/archive/20250104/202501040038.DNXYu89J-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501040038.DNXYu89J-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_rdwr.c:301 vfio_pci_bar_rw() warn: 'io' from ioremap() not released on lines: 301.

Old smatch warnings:
drivers/vfio/pci/vfio_pci_rdwr.c:293 vfio_pci_bar_rw() error: testing array offset 'bar' after use.

vim +/io +301 drivers/vfio/pci/vfio_pci_rdwr.c

0d77ed3589ac05 Alex Williamson 2018-03-21  232  
536475109c8284 Max Gurtovoy    2021-08-26  233  ssize_t vfio_pci_bar_rw(struct vfio_pci_core_device *vdev, char __user *buf,
89e1f7d4c66d85 Alex Williamson 2012-07-31  234  			size_t count, loff_t *ppos, bool iswrite)
89e1f7d4c66d85 Alex Williamson 2012-07-31  235  {
89e1f7d4c66d85 Alex Williamson 2012-07-31  236  	struct pci_dev *pdev = vdev->pdev;
89e1f7d4c66d85 Alex Williamson 2012-07-31  237  	loff_t pos = *ppos & VFIO_PCI_OFFSET_MASK;
89e1f7d4c66d85 Alex Williamson 2012-07-31  238  	int bar = VFIO_PCI_OFFSET_TO_INDEX(*ppos);
906ee99dd2a5c8 Alex Williamson 2013-02-14  239  	size_t x_start = 0, x_end = 0;
89e1f7d4c66d85 Alex Williamson 2012-07-31  240  	resource_size_t end;
906ee99dd2a5c8 Alex Williamson 2013-02-14  241  	void __iomem *io;
abafbc551fdded Alex Williamson 2020-04-22  242  	struct resource *res = &vdev->pdev->resource[bar];
906ee99dd2a5c8 Alex Williamson 2013-02-14  243  	ssize_t done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  244  
a13b64591747e8 Alex Williamson 2016-02-22  245  	if (pci_resource_start(pdev, bar))
89e1f7d4c66d85 Alex Williamson 2012-07-31  246  		end = pci_resource_len(pdev, bar);
3f7f36450a2152 Yunxiang Li     2025-01-02  247  	else if (bar == PCI_ROM_RESOURCE && pdev->rom && pdev->romlen)
3f7f36450a2152 Yunxiang Li     2025-01-02  248  		end = roundup_pow_of_two(pdev->romlen);
a13b64591747e8 Alex Williamson 2016-02-22  249  	else
a13b64591747e8 Alex Williamson 2016-02-22  250  		return -EINVAL;
89e1f7d4c66d85 Alex Williamson 2012-07-31  251  
906ee99dd2a5c8 Alex Williamson 2013-02-14  252  	if (pos >= end)
89e1f7d4c66d85 Alex Williamson 2012-07-31  253  		return -EINVAL;
89e1f7d4c66d85 Alex Williamson 2012-07-31  254  
906ee99dd2a5c8 Alex Williamson 2013-02-14  255  	count = min(count, (size_t)(end - pos));
89e1f7d4c66d85 Alex Williamson 2012-07-31  256  
89e1f7d4c66d85 Alex Williamson 2012-07-31  257  	if (bar == PCI_ROM_RESOURCE) {
906ee99dd2a5c8 Alex Williamson 2013-02-14  258  		/*
906ee99dd2a5c8 Alex Williamson 2013-02-14  259  		 * The ROM can fill less space than the BAR, so we start the
906ee99dd2a5c8 Alex Williamson 2013-02-14  260  		 * excluded range at the end of the actual ROM.  This makes
906ee99dd2a5c8 Alex Williamson 2013-02-14  261  		 * filling large ROM BARs much faster.
906ee99dd2a5c8 Alex Williamson 2013-02-14  262  		 */
3f7f36450a2152 Yunxiang Li     2025-01-02  263  		if (pci_resource_start(pdev, bar)) {
89e1f7d4c66d85 Alex Williamson 2012-07-31  264  			io = pci_map_rom(pdev, &x_start);
3f7f36450a2152 Yunxiang Li     2025-01-02  265  		} else {
3f7f36450a2152 Yunxiang Li     2025-01-02  266  			io = ioremap(pdev->rom, pdev->romlen);
3f7f36450a2152 Yunxiang Li     2025-01-02  267  			x_start = pdev->romlen;
abafbc551fdded Alex Williamson 2020-04-22  268  		}
3f7f36450a2152 Yunxiang Li     2025-01-02  269  		if (!io)
3f7f36450a2152 Yunxiang Li     2025-01-02  270  			return -ENOMEM;
89e1f7d4c66d85 Alex Williamson 2012-07-31  271  		x_end = end;
0d77ed3589ac05 Alex Williamson 2018-03-21  272  	} else {
8bccc5b80678c6 Yishai Hadas    2023-12-19  273  		int ret = vfio_pci_core_setup_barmap(vdev, bar);
abafbc551fdded Alex Williamson 2020-04-22  274  		if (ret) {
abafbc551fdded Alex Williamson 2020-04-22  275  			done = ret;
abafbc551fdded Alex Williamson 2020-04-22  276  			goto out;
abafbc551fdded Alex Williamson 2020-04-22  277  		}
89e1f7d4c66d85 Alex Williamson 2012-07-31  278  
89e1f7d4c66d85 Alex Williamson 2012-07-31  279  		io = vdev->barmap[bar];
0d77ed3589ac05 Alex Williamson 2018-03-21  280  	}
89e1f7d4c66d85 Alex Williamson 2012-07-31  281  
89e1f7d4c66d85 Alex Williamson 2012-07-31  282  	if (bar == vdev->msix_bar) {
89e1f7d4c66d85 Alex Williamson 2012-07-31  283  		x_start = vdev->msix_offset;
89e1f7d4c66d85 Alex Williamson 2012-07-31  284  		x_end = vdev->msix_offset + vdev->msix_size;
89e1f7d4c66d85 Alex Williamson 2012-07-31  285  	}
89e1f7d4c66d85 Alex Williamson 2012-07-31  286  
4de676d494cd8f Ankit Agrawal   2024-02-20  287  	done = vfio_pci_core_do_io_rw(vdev, res->flags & IORESOURCE_MEM, io, buf, pos,
bc93b9ae0151ae Alex Williamson 2020-08-17  288  				      count, x_start, x_end, iswrite);
89e1f7d4c66d85 Alex Williamson 2012-07-31  289  
906ee99dd2a5c8 Alex Williamson 2013-02-14  290  	if (done >= 0)
89e1f7d4c66d85 Alex Williamson 2012-07-31  291  		*ppos += done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  292  
3f7f36450a2152 Yunxiang Li     2025-01-02  293  	if (bar == PCI_ROM_RESOURCE) {
3f7f36450a2152 Yunxiang Li     2025-01-02  294  		if (pci_resource_start(pdev, bar))
89e1f7d4c66d85 Alex Williamson 2012-07-31  295  			pci_unmap_rom(pdev, io);
3f7f36450a2152 Yunxiang Li     2025-01-02  296  		else
3f7f36450a2152 Yunxiang Li     2025-01-02  297  			iounmap(io);
3f7f36450a2152 Yunxiang Li     2025-01-02  298  	}
3f7f36450a2152 Yunxiang Li     2025-01-02  299  
abafbc551fdded Alex Williamson 2020-04-22  300  out:
906ee99dd2a5c8 Alex Williamson 2013-02-14 @301  	return done;
89e1f7d4c66d85 Alex Williamson 2012-07-31  302  }
84237a826b261d Alex Williamson 2013-02-18  303  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
