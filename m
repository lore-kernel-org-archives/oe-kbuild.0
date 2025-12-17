Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD14633D4E5
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965512; cv=none; b=EjaV0i1snremuRfBl5aex8zwDDVCUxC6Xhi4a6KO2SszA7elWSlA4cY9mesE63qJtQURTXydIf2M6IXFQt761Tc7qt/mnG7AmgUxX0BUuD4aGneWLi+lwNFuXYYU3mbec3BOwQFnrOz4lMGj9FsDrjojFxIU84CqzgvfUod/MdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965512; c=relaxed/simple;
	bh=nhUyXqDNuqO2YWut8A2ipD/r5ehBLq6iF0YMJPWCvw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksMbdoWpnMrH4pFrRgBXCz11kk+zZtBYc4hR+UaKrEOzn+3B8L3gg9cVGrL4dnFLBl1C44XVyLr1Yz2CyscI3u/+ANsR89t72H1c7U/DmVTtTRej7n3FaPdOP87ixFV0mQILaYgE2PYP8sXoc421yPvfjynGTsxax+JgiODr5FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hH/WyHFc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hH/WyHFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765965510; x=1797501510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhUyXqDNuqO2YWut8A2ipD/r5ehBLq6iF0YMJPWCvw4=;
  b=hH/WyHFcazDIXWYLY/316HFqvqfiDk0wLGFYUw8AZxtk74+JaCpA9vy5
   vCRFF6d/A1gZkSoGp+lZPKkOloBjXSQg8a2xN17zVUjs4x/z4HlCe7B3E
   RnYRLACniM5r7CE25soMMDhIL/YQzTmiumAItxpU03+YD3dXb2cqpNTWX
   +VZPYjd9pLFdyiEIa2LM2A3adjcnUmT2huOQZvIY4abh+X8c/kHSHv6QQ
   9CNxSWGMDehDmMhqs/i4wLQzfr1b6ZDtlou+8ME1bE46n3WRToKwQjbY2
   sHyVLwASoPq91X55Rzok1fvlgNsJuWNAPadN0T1PDkrH61qNmr2wbYSDM
   A==;
X-CSE-ConnectionGUID: 59jzZwtKRleIyrd8ELvbQg==
X-CSE-MsgGUID: QW6tmx7lSPqze7Qbl7E0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67839164"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67839164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 01:58:29 -0800
X-CSE-ConnectionGUID: Io069yC3Q9O5qdN2qvJn4Q==
X-CSE-MsgGUID: U97jeNZ7RBuFrSt4j5t3VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198757302"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 01:58:27 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVoIb-000000000Mr-1Teb;
	Wed, 17 Dec 2025 09:58:25 +0000
Date: Wed, 17 Dec 2025 17:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <202512171744.CoKV8Dri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/vsi-iommu.c:806:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215085349.10155-4-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-4-benjamin.gaignard@collabora.com>
TO: Benjamin Gaignard <benjamin.gaignard@collabora.com>
TO: joro@8bytes.org
TO: will@kernel.org
TO: robin.murphy@arm.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: heiko@sntech.de
TO: nicolas.dufresne@collabora.com
TO: p.zabel@pengutronix.de
TO: mchehab@kernel.org
CC: iommu@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-media@vger.kernel.org
CC: kernel@collabora.com
CC: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251217]
[cannot apply to robh/for-next rockchip/for-next arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gaignard/dt-bindings-vendor-prefixes-Add-Verisilicon/20251215-165740
base:   linus/master
patch link:    https://lore.kernel.org/r/20251215085349.10155-4-benjamin.gaignard%40collabora.com
patch subject: [PATCH v10 3/7] iommu: Add verisilicon IOMMU driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r123-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171744.CoKV8Dri-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171744.CoKV8Dri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171744.CoKV8Dri-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/vsi-iommu.c:806:1: sparse: sparse: bad integer constant expression
   drivers/iommu/vsi-iommu.c:806:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/iommu/vsi-iommu.c:806:1: sparse: sparse: bad integer constant expression
   drivers/iommu/vsi-iommu.c:806:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iommu/vsi-iommu.c:807:1: sparse: sparse: bad integer constant expression
   drivers/iommu/vsi-iommu.c:807:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iommu/vsi-iommu.c:808:1: sparse: sparse: bad integer constant expression
   drivers/iommu/vsi-iommu.c:808:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +806 drivers/iommu/vsi-iommu.c

b9e3cd4bea55cd Benjamin Gaignard 2025-12-15  805  
b9e3cd4bea55cd Benjamin Gaignard 2025-12-15 @806  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
