Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1CC23E325
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 14:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765551244; cv=none; b=E8gIKes67Dt4GFaZozzYC+k1WmZZ6WaEfacHOUf9ndfkLhIdP4rHH6r634amnRTtjTT6HbEShfiQ6B4niHLzhe/cHR2IWZnFxB8cAxwWbilY+hQTzm5XMHaiW3sDphsZgbZeNPjuscLk87k/ELXc6b5s4yd0l3a69ssUzLjbrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765551244; c=relaxed/simple;
	bh=yhqvj7RbZRlcDjjmckisESOAlRrlU3hmOFip064fb5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzVsaQbSlDjdAux1Icq9E0ttReOzyOzTVx6aM44Rvcx9gsLFEB1WpLGfwwa2/IMqc3lCiHe4fCkXCM+HTbqD6F5Gd4/I8jomdouHPr/ZQ/Q/jKipVESrZrm+smjMP8bRuN9Z2eP/3zXqZri7g6K91foVgKqvfpJX3IR4JSxgd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bl+p+bth; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bl+p+bth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765551243; x=1797087243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhqvj7RbZRlcDjjmckisESOAlRrlU3hmOFip064fb5E=;
  b=bl+p+bthigCohKLCjbQmDZIqIIg5d0H+fKWrScWQfTJV/Otp2HNJ/Hza
   xS32VXknxIkIEpJHLkhC02WON2eOPpJiPMoteGMdh5n8u4yqY3kQrOTrf
   fCODtUnyMLoO4oPjvCu96CF5nFwUCTHm4UC/91IhtZonrkEYMAZgRLDiu
   +4tXcorHV10Fu9GjcqzXTUe9KLhxhoEMx4yX3v3hRijxnQ8yppjZ6Qw7p
   Y0/85Dt1Rg44Kif7CkwVa4Bp7XvnyWaoldMACY0nW+CfuKTBZib2E0BdG
   cdYiMZ5ms5z4hqpc+IVQy2USRFOGhXOKnLfjIvZN23guytbhv3ehyBXGk
   Q==;
X-CSE-ConnectionGUID: No5Oqn1RTzWIlitTP8QxaA==
X-CSE-MsgGUID: wgKf6i8GTtGjZOxOjMJv2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71398792"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71398792"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 06:54:02 -0800
X-CSE-ConnectionGUID: Pnwuu+ODQKOo/CBb8iXFxA==
X-CSE-MsgGUID: XSh4bcSLTrqT+QB6hiDp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197929130"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 06:54:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU4Wt-000000006Bh-0Wzc;
	Fri, 12 Dec 2025 14:53:59 +0000
Date: Fri, 12 Dec 2025 22:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/of/device.c:40 of_dma_set_restricted_buffer() warn: iterator
 'i' not incremented
Message-ID: <202512122236.I3MuvqSs-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: df56b2443e14e8288baf76aa5ee39a26289874e8 of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122236.I3MuvqSs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122236.I3MuvqSs-lkp@intel.com/

New smatch warnings:
drivers/of/device.c:40 of_dma_set_restricted_buffer() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/of/device.c:300 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'
drivers/of/device.c:304 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'
drivers/of/device.c:310 of_device_make_bus_id() warn: excess argument passed to 'dev_set_name'

vim +/i +40 drivers/of/device.c

f85ff3056cefdf4 Stephen Rothwell  2007-05-01  34  
f3cfd136aef0184 Will Deacon       2021-08-16  35  static void
ce5cb67c664fbc9 Will Deacon       2021-08-16  36  of_dma_set_restricted_buffer(struct device *dev, struct device_node *np)
ce5cb67c664fbc9 Will Deacon       2021-08-16  37  {
df56b2443e14e82 Rob Herring (Arm  2025-04-23  38) 	struct device_node *of_node = dev->of_node;
df56b2443e14e82 Rob Herring (Arm  2025-04-23  39) 	struct of_phandle_iterator it;
df56b2443e14e82 Rob Herring (Arm  2025-04-23 @40) 	int rc, i = 0;
ce5cb67c664fbc9 Will Deacon       2021-08-16  41  
f3cfd136aef0184 Will Deacon       2021-08-16  42  	if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
f3cfd136aef0184 Will Deacon       2021-08-16  43  		return;
f3cfd136aef0184 Will Deacon       2021-08-16  44  
ce5cb67c664fbc9 Will Deacon       2021-08-16  45  	/*
ce5cb67c664fbc9 Will Deacon       2021-08-16  46  	 * If dev->of_node doesn't exist or doesn't contain memory-region, try
ce5cb67c664fbc9 Will Deacon       2021-08-16  47  	 * the OF node having DMA configuration.
ce5cb67c664fbc9 Will Deacon       2021-08-16  48  	 */
df56b2443e14e82 Rob Herring (Arm  2025-04-23  49) 	if (!of_property_present(of_node, "memory-region"))
ce5cb67c664fbc9 Will Deacon       2021-08-16  50  		of_node = np;
ce5cb67c664fbc9 Will Deacon       2021-08-16  51  
df56b2443e14e82 Rob Herring (Arm  2025-04-23  52) 	of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0) {
ce5cb67c664fbc9 Will Deacon       2021-08-16  53  		/*
ce5cb67c664fbc9 Will Deacon       2021-08-16  54  		 * There might be multiple memory regions, but only one
ce5cb67c664fbc9 Will Deacon       2021-08-16  55  		 * restricted-dma-pool region is allowed.
ce5cb67c664fbc9 Will Deacon       2021-08-16  56  		 */
df56b2443e14e82 Rob Herring (Arm  2025-04-23  57) 		if (of_device_is_compatible(it.node, "restricted-dma-pool") &&
df56b2443e14e82 Rob Herring (Arm  2025-04-23  58) 		    of_device_is_available(it.node)) {
df56b2443e14e82 Rob Herring (Arm  2025-04-23  59) 			if (of_reserved_mem_device_init_by_idx(dev, of_node, i))
df56b2443e14e82 Rob Herring (Arm  2025-04-23  60) 				dev_warn(dev, "failed to initialise \"restricted-dma-pool\" memory node\n");
df56b2443e14e82 Rob Herring (Arm  2025-04-23  61) 			of_node_put(it.node);
f3cfd136aef0184 Will Deacon       2021-08-16  62  			break;
ce5cb67c664fbc9 Will Deacon       2021-08-16  63  		}
df56b2443e14e82 Rob Herring (Arm  2025-04-23  64) 		i++;
d17e37c41b7ed38 Liang He          2022-07-02  65  	}
ce5cb67c664fbc9 Will Deacon       2021-08-16  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
