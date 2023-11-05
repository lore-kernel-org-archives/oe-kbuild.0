Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F68196
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 02:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0Oj5AdT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699151618; x=1730687618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wx5ZZVK+4Aizdcsc3CrH8EQUBVk3wfLh3NU/9Jbq5Hc=;
  b=e0Oj5AdTNGVwaDR7WmXbIDsR57PGUUu4mJ/FBvHZEBng930+uO/da2U+
   uBhnC9xlPHDGPUtHkQHAnjAU4QKoxYviCPnSMNf4Kd2orFd3emGiwI4GC
   cY1794Aj+Ajl2eg7nhJprdvNGbj+wOo+nVSf60r5CQXp0/i8YjiJfuodD
   rvCf6oX07v3jGdiDTS7trAjc10gUseiPR2oFg7lVCF22ikyCTTEbpp4Ye
   WSH7qkamT4z4KBy0+0XrKJJX4sB1zXGYi+DN68E06jAwe4kycJ3WS67Jg
   +yCBMTK0IJCDqJFEvQaPa9HbwZ2RW16e1UTNexXTngPzQd2ydFsBJWmC9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388008228"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="388008228"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 19:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="796979698"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="796979698"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Nov 2023 19:33:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzSxC-0004w4-1y;
	Sun, 05 Nov 2023 02:33:34 +0000
Date: Sun, 5 Nov 2023 10:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/events/intel/uncore_snbep.c:4345 skx_upi_topology_cb()
 error: uninitialized symbol 'ret'.
Message-ID: <202311051043.WKyHY5ZA-lkp@intel.com>
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
TO: Alexander Antonov <alexander.antonov@linux.intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Kan Liang <kan.liang@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aea6bf908d730b01bd264a8821159db9463c111c
commit: 4cfce57fa42d277497cd2c425021312eae2f223c perf/x86/intel/uncore: Enable UPI topology discovery for Skylake Server
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231105/202311051043.WKyHY5ZA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311051043.WKyHY5ZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311051043.WKyHY5ZA-lkp@intel.com/

smatch warnings:
arch/x86/events/intel/uncore_snbep.c:4345 skx_upi_topology_cb() error: uninitialized symbol 'ret'.

vim +/ret +4345 arch/x86/events/intel/uncore_snbep.c

4cfce57fa42d27 Alexander Antonov 2022-11-17  4322  
4cfce57fa42d27 Alexander Antonov 2022-11-17  4323  static int skx_upi_topology_cb(struct intel_uncore_type *type, int segment,
4cfce57fa42d27 Alexander Antonov 2022-11-17  4324  				int die, u64 cpu_bus_msr)
4cfce57fa42d27 Alexander Antonov 2022-11-17  4325  {
4cfce57fa42d27 Alexander Antonov 2022-11-17  4326  	int idx, ret;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4327  	struct intel_uncore_topology *upi;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4328  	unsigned int devfn;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4329  	struct pci_dev *dev = NULL;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4330  	u8 bus = cpu_bus_msr >> (3 * BUS_NUM_STRIDE);
4cfce57fa42d27 Alexander Antonov 2022-11-17  4331  
4cfce57fa42d27 Alexander Antonov 2022-11-17  4332  	for (idx = 0; idx < type->num_boxes; idx++) {
4cfce57fa42d27 Alexander Antonov 2022-11-17  4333  		upi = &type->topology[die][idx];
4cfce57fa42d27 Alexander Antonov 2022-11-17  4334  		devfn = PCI_DEVFN(SKX_UPI_REGS_ADDR_DEVICE_LINK0 + idx,
4cfce57fa42d27 Alexander Antonov 2022-11-17  4335  				  SKX_UPI_REGS_ADDR_FUNCTION);
4cfce57fa42d27 Alexander Antonov 2022-11-17  4336  		dev = pci_get_domain_bus_and_slot(segment, bus, devfn);
4cfce57fa42d27 Alexander Antonov 2022-11-17  4337  		if (dev) {
4cfce57fa42d27 Alexander Antonov 2022-11-17  4338  			ret = upi_fill_topology(dev, upi, idx);
4cfce57fa42d27 Alexander Antonov 2022-11-17  4339  			if (ret)
4cfce57fa42d27 Alexander Antonov 2022-11-17  4340  				break;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4341  		}
4cfce57fa42d27 Alexander Antonov 2022-11-17  4342  	}
4cfce57fa42d27 Alexander Antonov 2022-11-17  4343  
4cfce57fa42d27 Alexander Antonov 2022-11-17  4344  	pci_dev_put(dev);
4cfce57fa42d27 Alexander Antonov 2022-11-17 @4345  	return ret;
4cfce57fa42d27 Alexander Antonov 2022-11-17  4346  }
4cfce57fa42d27 Alexander Antonov 2022-11-17  4347  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
