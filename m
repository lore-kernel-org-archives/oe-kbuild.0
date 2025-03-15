Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3551862
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742042822; cv=none; b=klSuBJukRrqozb+iyl/qDNZokZv0UUeBYCCuEOtaBUnpocOcR7pGfHhrUn3mz6XkrOuk11qy8tmdA9mQyNZiFeDOQu1VvHTEZ+Hhqh/FMGT8HrmXaFisxT/yW60hLKoIHVkLBPz0Y6T/boTAGDjrFn/t8vg+BHx0oEJq3dytVHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742042822; c=relaxed/simple;
	bh=2z26kHj4LSDfdiM1YBnXnL9e4XsOU3zmwcOhsgsh0Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNx9LC44cOIoK3t//a6F755+OYhLWlQrEh4WQo5n8Dv8oabW47f+zwNBMY99gQ5DE3eOriKtFTpkzIc2mPH2DPqV5af0vH/WhIfi4uvry4lo66cs3iL16gTbIaxSPv9YOd/1nsy9DZ0YPrteS8mSWGYKvS8ydNv7xpuLKeAsimE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkLT5OQ+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkLT5OQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742042820; x=1773578820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2z26kHj4LSDfdiM1YBnXnL9e4XsOU3zmwcOhsgsh0Sg=;
  b=CkLT5OQ+rO1GvSsQezk+QVd8AuvyQPufyP0p79+wrsDGa7L+Hw/3PL7b
   f92R1Oepaji/3SnIkqrxF5xSL4dif6nobKQHWV4PAGdHsqtI9V5KLZ8Iv
   hTBat0D16J5eAZc0i2GbivqexoBhEGaRvJJ+sa+yVP6dvkYlAeh6lxnW1
   9hf5dxwfnSv5wLZ8aW9GixKDlhTONWVdY+TsAWzm6yLKLDmofxgc5IGIM
   yYLApmBYxDKxZWIwSup4AQwFuCDqCLmmwTXZ4A+kQga8S1Meylivep0cc
   kksGn3JjQOBhcefaJdCPbMQ+vMzQvzb5pgNQeX0xFv/4THCiDz6oH87KD
   w==;
X-CSE-ConnectionGUID: WyktRmt5SK2hG9okQToL1w==
X-CSE-MsgGUID: Bu4CUz4kRj+jVogv524u8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="42364388"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="42364388"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 05:47:00 -0700
X-CSE-ConnectionGUID: QusNeaq7R0e3lb7K3ndEIQ==
X-CSE-MsgGUID: nGc51hWHQwivKqXDQSgYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126717930"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2025 05:46:59 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttQul-000BL8-2t;
	Sat, 15 Mar 2025 12:46:55 +0000
Date: Sat, 15 Mar 2025 20:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/uacce/uacce.c:116 uacce_bind_queue() warn: passing
 positive error code '(-19)' to 'PTR_ERR'
Message-ID: <202503152044.rlqrVxbF-lkp@intel.com>
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
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: "Jean-Philippe Brucker" <jean-philippe@linaro.org>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Vasant Hegde <vasant.hegde@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3571e8b091f4270d869dda7a6cc43616c6ad6897
commit: 89e8a2366e3bce584b6c01549d5019c5cda1205e iommu: Return right value in iommu_sva_bind_device()
date:   9 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503152044.rlqrVxbF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503152044.rlqrVxbF-lkp@intel.com/

smatch warnings:
drivers/misc/uacce/uacce.c:116 uacce_bind_queue() warn: passing positive error code '(-19)' to 'PTR_ERR'

vim +116 drivers/misc/uacce/uacce.c

015d239ac0142ad Kenneth Lee           2020-02-11  105  
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  106  static int uacce_bind_queue(struct uacce_device *uacce, struct uacce_queue *q)
015d239ac0142ad Kenneth Lee           2020-02-11  107  {
c7b6bac9c72c5fc Fenghua Yu            2020-09-15  108  	u32 pasid;
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  109  	struct iommu_sva *handle;
015d239ac0142ad Kenneth Lee           2020-02-11  110  
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  111  	if (!(uacce->flags & UACCE_DEV_SVA))
015d239ac0142ad Kenneth Lee           2020-02-11  112  		return 0;
015d239ac0142ad Kenneth Lee           2020-02-11  113  
942fd5435dccb27 Lu Baolu              2022-10-31  114  	handle = iommu_sva_bind_device(uacce->parent, current->mm);
015d239ac0142ad Kenneth Lee           2020-02-11  115  	if (IS_ERR(handle))
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23 @116  		return PTR_ERR(handle);
015d239ac0142ad Kenneth Lee           2020-02-11  117  
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  118  	pasid = iommu_sva_get_pasid(handle);
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  119  	if (pasid == IOMMU_PASID_INVALID) {
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  120  		iommu_sva_unbind_device(handle);
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  121  		return -ENODEV;
015d239ac0142ad Kenneth Lee           2020-02-11  122  	}
015d239ac0142ad Kenneth Lee           2020-02-11  123  
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  124  	q->handle = handle;
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  125  	q->pasid = pasid;
fb01562e5a8a731 Jean-Philippe Brucker 2020-04-23  126  	return 0;
015d239ac0142ad Kenneth Lee           2020-02-11  127  }
015d239ac0142ad Kenneth Lee           2020-02-11  128  

:::::: The code at line 116 was first introduced by commit
:::::: fb01562e5a8a731bb1807eba0a9fadb355ca2277 uacce: Remove mm_exit() op

:::::: TO: Jean-Philippe Brucker <jean-philippe@linaro.org>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
