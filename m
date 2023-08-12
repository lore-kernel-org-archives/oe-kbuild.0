Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CDF1CCD8
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691834112; x=1723370112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/rRD+fghLsuVK7bv7v+L84gpyCi9Wdu3XgXUAFub1Q4=;
  b=VF4n8u9g9+V7C1Hez9uJ8rmQ0eA5S7uTaC98EG7jNrs4ugwddAYTL8+K
   wqtxZ/5p0tsDlTJuCOv3796jO9gxBnmi05e/qOV5xA1LpLEEzmZxK86Ro
   lVLK2kS4WPIOsoIXl/ly83xwJkxgAANbheR/AVZMLmnkuIboHlbLvyonn
   KlZUs1o3Ip/OnmZt6mstM7eENdomLGCbufBoOUvIiU4jDvKy7hc0puW9b
   TaP4naF+dKchv04xUN53vod2mr4K72E2zB9WjCBBwdckq42kU5quw2Wds
   FTMG6WrET4vAvWscKohOK+KGQuFi44uoSf04ChvojPm56SN12n0dX0aTa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="402799054"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="402799054"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 02:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906687303"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="906687303"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Aug 2023 02:55:10 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUlKv-0008TA-2I;
	Sat, 12 Aug 2023 09:55:09 +0000
Date: Sat, 12 Aug 2023 17:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drivers: misc: adi-axi-tdd: Add new TDD engine driver
Message-ID: <202308121705.lCNuhNwj-lkp@intel.com>
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
In-Reply-To: <20230726071103.12172-2-eliza.balas@analog.com>
References: <20230726071103.12172-2-eliza.balas@analog.com>
TO: Eliza Balas <eliza.balas@analog.com>
CC: Eliza Balas <eliza.balas@analog.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Derek Kiernan <derek.kiernan@amd.com>
CC: Dragan Cvetic <dragan.cvetic@amd.com>
CC: Arnd Bergmann <arnd@arndb.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Eliza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eliza-Balas/drivers-misc-adi-axi-tdd-Add-new-TDD-engine-driver/20230726-151745
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230726071103.12172-2-eliza.balas%40analog.com
patch subject: [PATCH 2/2] drivers: misc: adi-axi-tdd: Add new TDD engine driver
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: nios2-randconfig-m031-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121705.lCNuhNwj-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121705.lCNuhNwj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308121705.lCNuhNwj-lkp@intel.com/

smatch warnings:
drivers/misc/adi-axi-tdd.c:607 adi_axi_tdd_init_sysfs() error: not allocating enough for = 'attr_group' 20 vs 4

vim +/attr_group +607 drivers/misc/adi-axi-tdd.c

2e18ca4ce802a7 Eliza Balas 2023-07-26  565  
2e18ca4ce802a7 Eliza Balas 2023-07-26  566  static int adi_axi_tdd_init_sysfs(struct platform_device *pdev, struct adi_axi_tdd_state *st)
2e18ca4ce802a7 Eliza Balas 2023-07-26  567  {
2e18ca4ce802a7 Eliza Balas 2023-07-26  568  	size_t base_attr_count = ARRAY_SIZE(adi_axi_tdd_base_attributes);
2e18ca4ce802a7 Eliza Balas 2023-07-26  569  	size_t attribute_count = base_attr_count + 6 * st->channel_count + 1;
2e18ca4ce802a7 Eliza Balas 2023-07-26  570  	struct adi_axi_tdd_attribute *channel_attributes;
2e18ca4ce802a7 Eliza Balas 2023-07-26  571  	struct adi_axi_tdd_attribute *channel_iter;
2e18ca4ce802a7 Eliza Balas 2023-07-26  572  	struct attribute_group *attr_group;
2e18ca4ce802a7 Eliza Balas 2023-07-26  573  	struct attribute **tdd_attrs;
2e18ca4ce802a7 Eliza Balas 2023-07-26  574  	u32 i, j;
2e18ca4ce802a7 Eliza Balas 2023-07-26  575  
2e18ca4ce802a7 Eliza Balas 2023-07-26  576  	channel_attributes = devm_kcalloc(&pdev->dev, 6 * st->channel_count,
2e18ca4ce802a7 Eliza Balas 2023-07-26  577  					  sizeof(*channel_attributes), GFP_KERNEL);
2e18ca4ce802a7 Eliza Balas 2023-07-26  578  	if (!channel_attributes)
2e18ca4ce802a7 Eliza Balas 2023-07-26  579  		return -ENOMEM;
2e18ca4ce802a7 Eliza Balas 2023-07-26  580  
2e18ca4ce802a7 Eliza Balas 2023-07-26  581  	tdd_attrs = devm_kcalloc(&pdev->dev, attribute_count,
2e18ca4ce802a7 Eliza Balas 2023-07-26  582  				 sizeof(*tdd_attrs), GFP_KERNEL);
2e18ca4ce802a7 Eliza Balas 2023-07-26  583  	if (!tdd_attrs)
2e18ca4ce802a7 Eliza Balas 2023-07-26  584  		return -ENOMEM;
2e18ca4ce802a7 Eliza Balas 2023-07-26  585  
2e18ca4ce802a7 Eliza Balas 2023-07-26  586  	memcpy(tdd_attrs, adi_axi_tdd_base_attributes, sizeof(adi_axi_tdd_base_attributes));
2e18ca4ce802a7 Eliza Balas 2023-07-26  587  
2e18ca4ce802a7 Eliza Balas 2023-07-26  588  	channel_iter = channel_attributes;
2e18ca4ce802a7 Eliza Balas 2023-07-26  589  
2e18ca4ce802a7 Eliza Balas 2023-07-26  590  	for (i = 0; i < st->channel_count; i++) {
2e18ca4ce802a7 Eliza Balas 2023-07-26  591  		for (j = 0; j < ARRAY_SIZE(channel_names); j++) {
2e18ca4ce802a7 Eliza Balas 2023-07-26  592  			snprintf(channel_iter->name,
2e18ca4ce802a7 Eliza Balas 2023-07-26  593  				 sizeof(channel_iter->name), channel_names[j],
2e18ca4ce802a7 Eliza Balas 2023-07-26  594  				 i);
2e18ca4ce802a7 Eliza Balas 2023-07-26  595  			channel_iter->id = channel_ids[j];
2e18ca4ce802a7 Eliza Balas 2023-07-26  596  			channel_iter->channel = i;
2e18ca4ce802a7 Eliza Balas 2023-07-26  597  			channel_iter->attr.attr.name = channel_iter->name;
2e18ca4ce802a7 Eliza Balas 2023-07-26  598  			channel_iter->attr.attr.mode = 0644;
2e18ca4ce802a7 Eliza Balas 2023-07-26  599  			channel_iter->attr.show = adi_axi_tdd_show;
2e18ca4ce802a7 Eliza Balas 2023-07-26  600  			channel_iter->attr.store = adi_axi_tdd_store;
2e18ca4ce802a7 Eliza Balas 2023-07-26  601  
2e18ca4ce802a7 Eliza Balas 2023-07-26  602  			tdd_attrs[base_attr_count + 6 * i + j] = &channel_iter->attr.attr;
2e18ca4ce802a7 Eliza Balas 2023-07-26  603  			channel_iter++;
2e18ca4ce802a7 Eliza Balas 2023-07-26  604  		}
2e18ca4ce802a7 Eliza Balas 2023-07-26  605  	}
2e18ca4ce802a7 Eliza Balas 2023-07-26  606  
2e18ca4ce802a7 Eliza Balas 2023-07-26 @607  	attr_group = devm_kzalloc(&pdev->dev, sizeof(attr_group), GFP_KERNEL);
2e18ca4ce802a7 Eliza Balas 2023-07-26  608  	if (!attr_group)
2e18ca4ce802a7 Eliza Balas 2023-07-26  609  		return -ENOMEM;
2e18ca4ce802a7 Eliza Balas 2023-07-26  610  
2e18ca4ce802a7 Eliza Balas 2023-07-26  611  	attr_group->attrs = tdd_attrs;
2e18ca4ce802a7 Eliza Balas 2023-07-26  612  
2e18ca4ce802a7 Eliza Balas 2023-07-26  613  	return devm_device_add_group(&pdev->dev, attr_group);
2e18ca4ce802a7 Eliza Balas 2023-07-26  614  }
2e18ca4ce802a7 Eliza Balas 2023-07-26  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
