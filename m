Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E57D1DFE1
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174654; cv=none; b=EJ4Ltz50HgOyH79dQdsG7teQSvCTDSOmr1ozjQ8LlY2y3o9+pB+mqY7VmUyXXgspyV7CZD6Ghv5qYrRBf8UMgif9/p5AplzQB8FrpelbRKXQ7uMBfaCZwi1L9wbp9inLIcMgbSX+I7FN6PRGh9h6jveZjzSW+3NCa/7uVUzDFQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174654; c=relaxed/simple;
	bh=ezC4EpeDBQbwcgjHLkloLbwZlm2PBxHZPJGNCBQGA/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SuueTj9detVCUQM14ezQMpj2nm3qajSGc7Hwo3dPMdcXuY7wcKw3jlucM9gUZrd9S1ycmnoZ9kyzaOxkJma6cA5+d4msGP8ej3iXzHQd/Sn8+SgZcA9hFhpX9ZkJK2OhWC090tzj78jN1MZ7qiYVO4XvU+ldwXYxfiBGs4wvT9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQDVkKMr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQDVkKMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749174653; x=1780710653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ezC4EpeDBQbwcgjHLkloLbwZlm2PBxHZPJGNCBQGA/M=;
  b=DQDVkKMrTroCaZO8MSPmWdN7fga64qWHus5MT30MeQNF6JlUlkUadOeE
   7mp3SpGieoz8Tyt0jiF+dsZfclsKH/MOSrPIVpJ1eqhVYnYBlKDBxZ1En
   kkPNVI7pAM4Kla+ZUXTWwTKEUcrzz4viVtgk+31kRZmPcS5QCUGiReyCQ
   SbN/WDJl6t3vYU7vBG5ECCpLVNOe7wzEOBZBtwXdIVrfelda7gTYmvkGO
   eKHEhe+zwTks5rdrYgCgWr1/kpnvRdDE4D0tkrhkhy942n5I1E44e4c0y
   n6Gxhj1xH2yDOOAEawTe51hTIGqesbdeQrwhj4OSommrn16ikQv7nI6Ri
   g==;
X-CSE-ConnectionGUID: xNoiYdkQTGyBD6a243bUug==
X-CSE-MsgGUID: 2XiWc4o6T7m7H3g8bzDy8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51020239"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="51020239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:50:52 -0700
X-CSE-ConnectionGUID: YLNXEQ8bRfSAkfqwds/gMw==
X-CSE-MsgGUID: 5+BL3pFmRc+LWfyCGVGg0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150514860"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2025 18:50:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNMEL-0004dZ-0U;
	Fri, 06 Jun 2025 01:50:49 +0000
Date: Fri, 6 Jun 2025 09:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vireshk:virtio/msg-upstream-xen 6/21]
 drivers/firmware/arm_ffa/bus.c:200:1-25: WARNING: Function
 "for_each_compatible_node" should have of_node_put() before break around
 line 215.
Message-ID: <202506060916.UJpGW1kH-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-upstream-xen
head:   d0c02cd9c39464390387dd5376dcc62d2b909eba
commit: 10d68b7dd010fe9f4525745876be87ededea4960 [6/21] firmware: arm_ffa: Setup of_node for ffa devices
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r054-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060916.UJpGW1kH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506060916.UJpGW1kH-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/bus.c:200:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before break around line 215.

vim +/for_each_compatible_node +200 drivers/firmware/arm_ffa/bus.c

e781858488b918 Sudeep Holla 2021-05-21  192  
10d68b7dd010fe Viresh Kumar 2025-01-17  193  static void ffa_device_of_setup(struct ffa_device *ffa_dev)
10d68b7dd010fe Viresh Kumar 2025-01-17  194  {
10d68b7dd010fe Viresh Kumar 2025-01-17  195  	struct device_node *np;
10d68b7dd010fe Viresh Kumar 2025-01-17  196  	uuid_t uuid;
10d68b7dd010fe Viresh Kumar 2025-01-17  197  	u32 val;
10d68b7dd010fe Viresh Kumar 2025-01-17  198  
10d68b7dd010fe Viresh Kumar 2025-01-17  199  	/* vm-id and UUID must match */
10d68b7dd010fe Viresh Kumar 2025-01-17 @200  	for_each_compatible_node(np, NULL, "arm,ffa") {
10d68b7dd010fe Viresh Kumar 2025-01-17  201  		if (of_property_read_u32(np, "vm-id", &val))
10d68b7dd010fe Viresh Kumar 2025-01-17  202  			continue;
10d68b7dd010fe Viresh Kumar 2025-01-17  203  
10d68b7dd010fe Viresh Kumar 2025-01-17  204  		if (ffa_dev->vm_id != val)
10d68b7dd010fe Viresh Kumar 2025-01-17  205  			continue;
10d68b7dd010fe Viresh Kumar 2025-01-17  206  
10d68b7dd010fe Viresh Kumar 2025-01-17  207  		if (of_property_read_u32_array(np, "uuid", (u32 *)&uuid,
10d68b7dd010fe Viresh Kumar 2025-01-17  208  					       sizeof(uuid) / sizeof(u32)))
10d68b7dd010fe Viresh Kumar 2025-01-17  209  			continue;
10d68b7dd010fe Viresh Kumar 2025-01-17  210  
10d68b7dd010fe Viresh Kumar 2025-01-17  211  		if (!uuid_equal(&ffa_dev->uuid, &uuid))
10d68b7dd010fe Viresh Kumar 2025-01-17  212  			continue;
10d68b7dd010fe Viresh Kumar 2025-01-17  213  
10d68b7dd010fe Viresh Kumar 2025-01-17  214  		device_set_node(&ffa_dev->dev, of_fwnode_handle(np));
10d68b7dd010fe Viresh Kumar 2025-01-17 @215  		break;
10d68b7dd010fe Viresh Kumar 2025-01-17  216  	}
10d68b7dd010fe Viresh Kumar 2025-01-17  217  }
10d68b7dd010fe Viresh Kumar 2025-01-17  218  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
