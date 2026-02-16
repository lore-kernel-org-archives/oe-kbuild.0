Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44252227EA8
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230331; cv=none; b=HkXjoyBcyNI1jU+dUhD+55yjYsvgCt8CVk6rRscWtYf4t/AhjLaWSsby+fql4U5ubMLdkPsXJ2qn8EXsehGewz5z4IPcOyHBSej+Sat2pfgKdpHFJibz1cDF1uigxY1bHIVczG6qbJUF/tcwGTcqki3VMrzcftVMySZFunbXWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230331; c=relaxed/simple;
	bh=w3BEAU9RahzzJgNZRWt+aW7gzzimB18DnhezUfOOPo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8+fCOdtfLoNJn9KKqBjLCM++3f+ukEiIZ9vgpSLtgyL92K6+S6/o8S7nHAwx87pJ4t36IiE8bRI7YmxMpRTFEyL7CKq+yN+xUj431T8po2ILtsohPH2mzfRczsp67Df8bfzGZpFrtipwAr5pgVBnpW7DZtxvL3oCEqaB7gn17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhTrUZdp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhTrUZdp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771230330; x=1802766330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w3BEAU9RahzzJgNZRWt+aW7gzzimB18DnhezUfOOPo0=;
  b=AhTrUZdp79mgh0TKLkzf5mSczTzZZSnKwqSb0BOdUnfBEhDchFJw4GH/
   +xLHS/UgCgP6A+z7iOJWj0tDxSx07wS5IglRl3zZ6eF0g9nvU58LbCTIV
   A7R1o2qwCPstizNKz3FVcrCWQtDtfeEh8qACEHj377/PCoPygisL36l8B
   DVxuo8MlC6Hji7jFCsm6vNYkRE/1I014s/rgIImJGnFFaSn6TXEa3dwaC
   R/Xwmxx4GAvv3PhDfM8CWNAIvQfXn95hmRyupiMH8SONl0LnNt5F3ZsnM
   /LO0sYbgg/OyGEXmpIO3lZEaQJdUNMNgIBYSRzoW3LazOrbND1xVUmHbW
   A==;
X-CSE-ConnectionGUID: hRndzOBwTAKqPeq2+k3BXQ==
X-CSE-MsgGUID: 9aZp1cffQyWjq74/s1/iog==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="82941659"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="82941659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 00:25:30 -0800
X-CSE-ConnectionGUID: aZqZ+kU2RGWfGQqVzZkuQw==
X-CSE-MsgGUID: Auk931foTFG7/6a4Ub6fzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="251203935"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2026 00:25:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrtv3-00000000zUG-3ftM;
	Mon, 16 Feb 2026 08:25:25 +0000
Date: Mon, 16 Feb 2026 16:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 3/6] PCI: Consolidate delimiter handling into
 pci_dev_str_match()
Message-ID: <202602161621.2nyGIEhM-lkp@intel.com>
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
In-Reply-To: <SI2PR01MB439352E0D54243099CAAA118DC6CA@SI2PR01MB4393.apcprd01.prod.exchangelabs.com>
References: <SI2PR01MB439352E0D54243099CAAA118DC6CA@SI2PR01MB4393.apcprd01.prod.exchangelabs.com>
TO: Wei Wang <wei.w.wang@hotmail.com>
TO: bhelgaas@google.com
TO: jgg@nvidia.com
TO: jonathan.cameron@huawei.com
TO: akpm@linux-foundation.org
TO: bp@alien8.de
TO: rdunlap@infradead.org
TO: alex@shazbot.org
TO: kevin.tian@intel.com
CC: linux-kernel@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: wei.w.wang@hotmail.com

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 635c467cc14ebdffab3f77610217c1dacaf88e8c]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Wang/PCI-Validate-ACS-enable-flags-against-device-specific-ACS-capabilities/20260216-103055
base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
patch link:    https://lore.kernel.org/r/SI2PR01MB439352E0D54243099CAAA118DC6CA%40SI2PR01MB4393.apcprd01.prod.exchangelabs.com
patch subject: [PATCH v5 3/6] PCI: Consolidate delimiter handling into pci_dev_str_match()
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-r072-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161621.2nyGIEhM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602161621.2nyGIEhM-lkp@intel.com/

smatch warnings:
drivers/pci/pci.c:430 pci_dev_str_match() warn: sscanf doesn't return error codes

vim +430 drivers/pci/pci.c

45db33709ccc73 Logan Gunthorpe  2018-07-30  342  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  343  /**
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  344   * pci_dev_str_match - test if a string matches a device
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  345   * @dev: the PCI device to test
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  346   * @p: string to match the device against
40549484c434de Wei Wang         2026-02-16  347   * @endptr: pointer to the string after the match, with the delimiter skipped
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  348   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  349   * Test if a string (typically from a kernel parameter) matches a specified
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  350   * PCI device. The string may be of one of the following formats:
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  351   *
45db33709ccc73 Logan Gunthorpe  2018-07-30  352   *   [<domain>:]<bus>:<device>.<func>[/<device>.<func>]*
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  353   *   pci:<vendor>:<device>[:<subvendor>:<subdevice>]
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  354   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  355   * The first format specifies a PCI bus/device/function address which
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  356   * may change if new hardware is inserted, if motherboard firmware changes,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  357   * or due to changes caused in kernel parameters. If the domain is
45db33709ccc73 Logan Gunthorpe  2018-07-30  358   * left unspecified, it is taken to be 0.  In order to be robust against
45db33709ccc73 Logan Gunthorpe  2018-07-30  359   * bus renumbering issues, a path of PCI device/function numbers may be used
45db33709ccc73 Logan Gunthorpe  2018-07-30  360   * to address the specific device.  The path for a device can be determined
45db33709ccc73 Logan Gunthorpe  2018-07-30  361   * through the use of 'lspci -t'.
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  362   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  363   * The second format matches devices using IDs in the configuration
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  364   * space which may match multiple devices in the system. A value of 0
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  365   * for any field will match all devices. (Note: this differs from
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  366   * in-kernel code that uses PCI_ANY_ID which is ~0; this is for
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  367   * legacy reasons and convenience so users don't have to specify
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  368   * FFFFFFFFs on the command line.)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  369   *
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  370   * Returns 1 if the string matches the device, 0 if it does not and
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  371   * a negative error code if the string cannot be parsed.
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  372   */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  373  static int pci_dev_str_match(struct pci_dev *dev, const char *p,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  374  			     const char **endptr)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  375  {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  376  	int ret;
45db33709ccc73 Logan Gunthorpe  2018-07-30  377  	int count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  378  	unsigned short vendor, device, subsystem_vendor, subsystem_device;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  379  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  380  	if (strncmp(p, "pci:", 4) == 0) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  381  		/* PCI vendor/device (subvendor/subdevice) IDs are specified */
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  382  		p += 4;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  383  		ret = sscanf(p, "%hx:%hx:%hx:%hx%n", &vendor, &device,
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  384  			     &subsystem_vendor, &subsystem_device, &count);
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  385  		if (ret != 4) {
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  386  			ret = sscanf(p, "%hx:%hx%n", &vendor, &device, &count);
40549484c434de Wei Wang         2026-02-16  387  			if (ret != 2) {
40549484c434de Wei Wang         2026-02-16  388  				ret = -EINVAL;
40549484c434de Wei Wang         2026-02-16  389  				goto not_found;
40549484c434de Wei Wang         2026-02-16  390  			}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  391  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  392  			subsystem_vendor = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  393  			subsystem_device = 0;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  394  		}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  395  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  396  		p += count;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  397  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  398  		if ((!vendor || vendor == dev->vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  399  		    (!device || device == dev->device) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  400  		    (!subsystem_vendor ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  401  			    subsystem_vendor == dev->subsystem_vendor) &&
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  402  		    (!subsystem_device ||
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  403  			    subsystem_device == dev->subsystem_device))
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  404  			goto found;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  405  	} else {
45db33709ccc73 Logan Gunthorpe  2018-07-30  406  		/*
45db33709ccc73 Logan Gunthorpe  2018-07-30  407  		 * PCI Bus, Device, Function IDs are specified
45db33709ccc73 Logan Gunthorpe  2018-07-30  408  		 * (optionally, may include a path of devfns following it)
45db33709ccc73 Logan Gunthorpe  2018-07-30  409  		 */
45db33709ccc73 Logan Gunthorpe  2018-07-30  410  		ret = pci_dev_str_match_path(dev, p, &p);
45db33709ccc73 Logan Gunthorpe  2018-07-30  411  		if (ret < 0)
40549484c434de Wei Wang         2026-02-16  412  			goto not_found;
45db33709ccc73 Logan Gunthorpe  2018-07-30  413  		else if (ret)
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  414  			goto found;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  415  	}
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  416  
40549484c434de Wei Wang         2026-02-16  417  not_found:
40549484c434de Wei Wang         2026-02-16  418  	if (ret < 0)
40549484c434de Wei Wang         2026-02-16  419  		pr_err("PCI: Can't parse parameter: %s\n", p);
40549484c434de Wei Wang         2026-02-16  420  
40549484c434de Wei Wang         2026-02-16  421  	if (*p != ';' && *p != ',') {
40549484c434de Wei Wang         2026-02-16  422  		/*
40549484c434de Wei Wang         2026-02-16  423  		 * End of param or invalid format. Return -ENODEV so the caller
40549484c434de Wei Wang         2026-02-16  424  		 * stops parsing.
40549484c434de Wei Wang         2026-02-16  425  		 */
40549484c434de Wei Wang         2026-02-16  426  		return -ENODEV;
40549484c434de Wei Wang         2026-02-16  427  	}
40549484c434de Wei Wang         2026-02-16  428  
40549484c434de Wei Wang         2026-02-16  429  	*endptr = p + 1;
40549484c434de Wei Wang         2026-02-16 @430  	return ret;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  431  
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  432  found:
40549484c434de Wei Wang         2026-02-16  433  	*endptr = *p == '\0' ? p : p + 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  434  	return 1;
07d8d7e57c28ca Logan Gunthorpe  2018-07-30  435  }
687d5fe3dc3379 Michael Ellerman 2006-11-22  436  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
