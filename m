Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A8171C9
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 01:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733104187; cv=none; b=uWLRVMVA+6hks666Kj+cJYEoA9Mr+C3QPL28o/c2LCPPajkQlN6KGc5fyeLmd78+ALs60ZpoxXgIBTnwvAAzr4HwbI1YrUD25aurVzE1ib/hoxVW2elJaFexqSxqpsPJmi/2L9dpnyIJkhP1uba/bVTGdEt0l9wxpymXPP4ugLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733104187; c=relaxed/simple;
	bh=f5SQ06owtFJgxgWeY6uN+yvwVipqneCJ66lzDrPOHuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XG5vd5Cm3xrxAktHn/NJ480TMuLd7m14FKIMVhqU1kIjuodDt8Umbt41uS4DkEyA1qOIAob+34t3zAofC/rZj5tsc8d9aY6cwRFWeaFSxS2RiwoOKhFhHaNBuS/LK+37NC4JuO8abLszE+IDodO3PstaEpGeF6HiVTYPzjd6afA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHb8zN8+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHb8zN8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733104185; x=1764640185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f5SQ06owtFJgxgWeY6uN+yvwVipqneCJ66lzDrPOHuo=;
  b=eHb8zN8+D2cliA8Bsp4sRJMOse6/T0GTtpbztwnKyKDU9MqvjyBLlFEQ
   uKxgFkJD/doJ8FOOw2ERiJAnZOX+ZnibeMMdrrI1ZyuOY8/4jKYczA71H
   wUDLB5yhoEpTriHFMTU54YfC44BSo8NVt3u+2NrJiqjTKS0aVk3kyhtui
   zhAepIqtjgiTf9NKXZh41/llmfgilzgevMconiYgQHHhIm08BXl6Dyy6n
   frUJJnUPGtHM66bjwtUa9qJ8Z1SBvIFaRns9OyeBBInWzvogk2qcJm970
   3nm7fEY71KvOfG1JjFogL3Q9v4bGcQ3OuTQL3HsU3dzOuoz30nkskxVM1
   w==;
X-CSE-ConnectionGUID: g7UawEAzSIeoM+RgQnVpMw==
X-CSE-MsgGUID: Q8/7D8veR8yclleSFwaOVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33177666"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33177666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 17:49:44 -0800
X-CSE-ConnectionGUID: PfWkycntQ5yWbEj29A85xw==
X-CSE-MsgGUID: AUoZCGGeSYOIF3avlyGWHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93804453"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Dec 2024 17:49:42 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvZE-0001zt-1B;
	Mon, 02 Dec 2024 01:49:40 +0000
Date: Mon, 2 Dec 2024 09:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/bus/fsl-mc/fsl-mc-bus.c:196:8-16: WARNING: please use
 sysfs_emit or sysfs_emit_at
Message-ID: <202412020953.GEUWd4DF-lkp@intel.com>
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
TO: Bharat Bhushan <Bharat.Bhushan@nxp.com>
CC: Laurentiu Tudor <laurentiu.tudor@nxp.com>
CC: Diana Craciun <diana.craciun@oss.nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40384c840ea1944d7c5a392e8975ed088ecf0b37
commit: 1f86a00c1159fd77e66b1bd6ff1a183f4d46f34d bus/fsl-mc: add support for 'driver_override' in the mc-bus
date:   4 years, 2 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 years, 2 months ago
config: arm64-randconfig-r052-20241114 (https://download.01.org/0day-ci/archive/20241202/202412020953.GEUWd4DF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412020953.GEUWd4DF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bus/fsl-mc/fsl-mc-bus.c:196:8-16: WARNING: please use sysfs_emit or sysfs_emit_at

vim +196 drivers/bus/fsl-mc/fsl-mc-bus.c

1f86a00c1159fd Bharat Bhushan 2020-09-29  190  
1f86a00c1159fd Bharat Bhushan 2020-09-29  191  static ssize_t driver_override_show(struct device *dev,
1f86a00c1159fd Bharat Bhushan 2020-09-29  192  				    struct device_attribute *attr, char *buf)
1f86a00c1159fd Bharat Bhushan 2020-09-29  193  {
1f86a00c1159fd Bharat Bhushan 2020-09-29  194  	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
1f86a00c1159fd Bharat Bhushan 2020-09-29  195  
1f86a00c1159fd Bharat Bhushan 2020-09-29 @196  	return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
1f86a00c1159fd Bharat Bhushan 2020-09-29  197  }
1f86a00c1159fd Bharat Bhushan 2020-09-29  198  static DEVICE_ATTR_RW(driver_override);
1f86a00c1159fd Bharat Bhushan 2020-09-29  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
