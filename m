Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A36C14276
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TuCiVhJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699042448; x=1730578448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k+1BEektc7xKN7P9kkiMqh8hPzZyHmytILfvd8VJ+fA=;
  b=TuCiVhJtpm8nQOfia0Y76MUc665dciC6sOn4qOT8WYKnp6swfWwKudLa
   7VFIOyXkbKcSUL0Wvr0pXcJVQQzP0fnHUXXj00M9rjCY7r+7kq/lhc8uD
   YWKQwj5u4yEkscA47L57syF2DLN6A0NA3594YQG5Sg6QKJCGMJSkn9Czn
   8c39zs4VpdwPj5WrzZEVnxPfJ1wuOftBUjdCB5qfOSy0mHlbft4nsKZeA
   cyEn4XiiHkAYkXKpB44fTBdOa8X3IfQQ+Q04v78pMyLhCgVSZF22dmGFf
   AtxCoSi737gqZqkPfAY7fdCQsAPBRpuQu3BzbKN5em42tJApDEt0EyEIg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="455503614"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="455503614"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 13:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="905449140"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="905449140"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Nov 2023 13:14:06 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz0YO-0002uZ-0G;
	Fri, 03 Nov 2023 20:14:04 +0000
Date: Sat, 4 Nov 2023 04:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/events/intel/uncore_snbep.c:4345 skx_upi_topology_cb()
 error: uninitialized symbol 'ret'.
Message-ID: <202311040401.nWHCMKOn-lkp@intel.com>
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
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 4cfce57fa42d277497cd2c425021312eae2f223c perf/x86/intel/uncore: Enable UPI topology discovery for Skylake Server
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311040401.nWHCMKOn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040401.nWHCMKOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311040401.nWHCMKOn-lkp@intel.com/

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
