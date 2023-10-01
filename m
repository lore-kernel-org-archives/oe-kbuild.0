Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AABE168CD
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Oct 2023 14:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696169614; x=1727705614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=skBl96KSXkYfxb1fajvc+c0P99AXO/0RAxmDMLh4fW8=;
  b=KwJe4cpY89H9iIottjuPxLkpW3Q+CYohrM6BXIKlBUiS5KuTBGCmauvf
   E/C5vGfoo9c7QOU9dfAhtrbpkIxQ0SH1Kh/FU2oEXNYmjmY074UC3aDSk
   4Bl+5vo3Yf/jrT7YPCBTCI09KI+mxOIUiUR8lJ1hrEdz/rKJ11UcGvB2z
   3L1l8+Mh7vjH7iak8cI3x6Ku4hKl7BedmAge99qCQJ7KhhIujjstAru3Y
   ydxfb76yCxgDpJl3yafuTH90csmdiiJg1ZjEBEKpXkU49Qu1W+wE5ilcE
   t1A2mKYbJeS5XZ6nwuw+9bJdfQwYa9xoQCp6+KZ51Qjup9vYP/c37DqnW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449016913"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="449016913"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 07:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="750370381"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="750370381"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 01 Oct 2023 07:13:32 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmxCM-00056j-0i;
	Sun, 01 Oct 2023 14:13:30 +0000
Date: Sun, 1 Oct 2023 22:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/gvt/vgpu.c:119 intel_gvt_init_vgpu_types()
 warn: replace divide condition 'low_avail / conf->low_mm' with 'low_avail >=
 conf->low_mm'
Message-ID: <202310012257.GfTXQ7dA-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Zhenyu Wang <zhenyuw@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e402b08634b398e9feb94902c7adcf05bb8ba47d
commit: 1aa3834f510c9d9206ce4d40aff4903b0c016761 drm/i915/gvt: simplify vgpu configuration management
date:   12 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230930 (https://download.01.org/0day-ci/archive/20231001/202310012257.GfTXQ7dA-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231001/202310012257.GfTXQ7dA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310012257.GfTXQ7dA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/gvt/vgpu.c:119 intel_gvt_init_vgpu_types() warn: replace divide condition 'low_avail / conf->low_mm' with 'low_avail >= conf->low_mm'

vim +119 drivers/gpu/drm/i915/gvt/vgpu.c

191020b670f84f Zhenyu Wang       2017-02-23   96  
1f31c8294880d1 Zhenyu Wang       2016-11-03   97  /**
1f31c8294880d1 Zhenyu Wang       2016-11-03   98   * intel_gvt_init_vgpu_types - initialize vGPU type list
1f31c8294880d1 Zhenyu Wang       2016-11-03   99   * @gvt : GVT device
1f31c8294880d1 Zhenyu Wang       2016-11-03  100   *
1f31c8294880d1 Zhenyu Wang       2016-11-03  101   * Initialize vGPU type list based on available resource.
1f31c8294880d1 Zhenyu Wang       2016-11-03  102   *
1f31c8294880d1 Zhenyu Wang       2016-11-03  103   */
1f31c8294880d1 Zhenyu Wang       2016-11-03  104  int intel_gvt_init_vgpu_types(struct intel_gvt *gvt)
1f31c8294880d1 Zhenyu Wang       2016-11-03  105  {
1aa3834f510c9d Christoph Hellwig 2022-09-23  106  	unsigned int low_avail = gvt_aperture_sz(gvt) - HOST_LOW_GM_SIZE;
1aa3834f510c9d Christoph Hellwig 2022-09-23  107  	unsigned int high_avail = gvt_hidden_sz(gvt) - HOST_HIGH_GM_SIZE;
1aa3834f510c9d Christoph Hellwig 2022-09-23  108  	unsigned int num_types = ARRAY_SIZE(intel_vgpu_configs);
1aa3834f510c9d Christoph Hellwig 2022-09-23  109  	unsigned int i;
1f31c8294880d1 Zhenyu Wang       2016-11-03  110  
6396bb221514d2 Kees Cook         2018-06-12  111  	gvt->types = kcalloc(num_types, sizeof(struct intel_vgpu_type),
1f31c8294880d1 Zhenyu Wang       2016-11-03  112  			     GFP_KERNEL);
1f31c8294880d1 Zhenyu Wang       2016-11-03  113  	if (!gvt->types)
1f31c8294880d1 Zhenyu Wang       2016-11-03  114  		return -ENOMEM;
1f31c8294880d1 Zhenyu Wang       2016-11-03  115  
1f31c8294880d1 Zhenyu Wang       2016-11-03  116  	for (i = 0; i < num_types; ++i) {
1aa3834f510c9d Christoph Hellwig 2022-09-23  117  		const struct intel_vgpu_config *conf = &intel_vgpu_configs[i];
191020b670f84f Zhenyu Wang       2017-02-23  118  
1aa3834f510c9d Christoph Hellwig 2022-09-23 @119  		if (low_avail / conf->low_mm == 0)
1aa3834f510c9d Christoph Hellwig 2022-09-23  120  			break;
1aa3834f510c9d Christoph Hellwig 2022-09-23  121  		if (conf->weight < 1 || conf->weight > VGPU_MAX_WEIGHT)
98828955971363 Christoph Hellwig 2022-09-23  122  			goto out_free_types;
bc90d097ae144f Ping Gao          2017-03-30  123  
1aa3834f510c9d Christoph Hellwig 2022-09-23  124  		sprintf(gvt->types[i].name, "GVTg_V%u_%s",
1aa3834f510c9d Christoph Hellwig 2022-09-23  125  			GRAPHICS_VER(gvt->gt->i915) == 8 ? 4 : 5, conf->name);
1aa3834f510c9d Christoph Hellwig 2022-09-23  126  		gvt->types[i].conf = conf;
1aa3834f510c9d Christoph Hellwig 2022-09-23  127  		gvt->types[i].avail_instance = min(low_avail / conf->low_mm,
1aa3834f510c9d Christoph Hellwig 2022-09-23  128  						   high_avail / conf->high_mm);
1f31c8294880d1 Zhenyu Wang       2016-11-03  129  
bc90d097ae144f Ping Gao          2017-03-30  130  		gvt_dbg_core("type[%d]: %s avail %u low %u high %u fence %u weight %u res %s\n",
1aa3834f510c9d Christoph Hellwig 2022-09-23  131  			     i, gvt->types[i].name, gvt->types[i].avail_instance,
1aa3834f510c9d Christoph Hellwig 2022-09-23  132  			     conf->low_mm, conf->high_mm, conf->fence,
1aa3834f510c9d Christoph Hellwig 2022-09-23  133  			     conf->weight, vgpu_edid_str(conf->edid));
1f31c8294880d1 Zhenyu Wang       2016-11-03  134  	}
1f31c8294880d1 Zhenyu Wang       2016-11-03  135  
1f31c8294880d1 Zhenyu Wang       2016-11-03  136  	gvt->num_types = i;
1f31c8294880d1 Zhenyu Wang       2016-11-03  137  	return 0;
98828955971363 Christoph Hellwig 2022-09-23  138  
98828955971363 Christoph Hellwig 2022-09-23  139  out_free_types:
98828955971363 Christoph Hellwig 2022-09-23  140  	kfree(gvt->types);
98828955971363 Christoph Hellwig 2022-09-23  141  	return -EINVAL;
1f31c8294880d1 Zhenyu Wang       2016-11-03  142  }
1f31c8294880d1 Zhenyu Wang       2016-11-03  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
