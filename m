Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39DF15A6
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Sep 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696071944; x=1727607944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJbGeW+L1zvyhXWdy18iF+9sduZuX7ihDatY30NvZ7o=;
  b=ItshlJxUPzQSKO82JfcBu0wBNHpwEZSLPbLjZ6KtFjLgS0NxkYGYtjIe
   RdscSNUejAShWQXUoBL0jFl2gFpsEEzRkyFJZ70bPVcOGZasyTJWMihd+
   jjb3uLd9/gurlnrgsAMB7R+ID/Ws5srMcCCzvW7EBY9+sIgbp+HAWD4oe
   H0I0t+Czx6/jdOFqcItgb3zMdFzDgLv792EuIBEHXFyqakNHmd32LkptT
   WZM1o/2lZ+2s6G/CGhfGGU97fDKxN2AmqGVDGnIea24qxIP3jScTNyWnw
   udp9WDQx8KJgEh6X6md0wzpS4TLpsF90klHDFzwNlKk/5gBR/MmAURxh1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="446597890"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="446597890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 04:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815833277"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="815833277"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2023 04:05:42 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmXn2-000440-0z;
	Sat, 30 Sep 2023 11:05:40 +0000
Date: Sat, 30 Sep 2023 19:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/gvt/vgpu.c:119 intel_gvt_init_vgpu_types()
 warn: replace divide condition 'low_avail / conf->low_mm' with 'low_avail >=
 conf->low_mm'
Message-ID: <202309301821.Y19XmTEQ-lkp@intel.com>
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
head:   9f3ebbef746f89f860a90ced99a359202ea86fde
commit: 1aa3834f510c9d9206ce4d40aff4903b0c016761 drm/i915/gvt: simplify vgpu configuration management
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301821.Y19XmTEQ-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301821.Y19XmTEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309301821.Y19XmTEQ-lkp@intel.com/

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
