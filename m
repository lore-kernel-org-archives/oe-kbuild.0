Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD33525C
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 23:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690588108; x=1722124108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBkPAywgsPpIFxJYn2QMDNVmVQOTtP7Pov6K9SxQvZ8=;
  b=lWKH9AZW74J3w50bXCmg7eWVahc1VDe4chFXQDOmyPFelgbfky/bxCtC
   i+DEsErxhmkEdBG2fO8ZHooj0HYQe1Y3Wa+9ZKV6MILGsL9QwXqyBY94h
   XBOPsGmqp6vjxzMYGlSTLTvJhdqCNMCPWN4KTfBmUHr4+m1TuixzAvDlb
   CKmscXZ3gO0YnC/6C8zgA6kZcXEHPV9bK+6TwmDMdRO/czNl0ioy6xWH9
   btKl/fo1BIWMY2U/Ydeg/uaz2REU8FAuXj6ltxvWWMB+dxRBRamNlSK1l
   wNJxiSSU0bSSOkYZbzhfQ4PAn6RYjstk6je2EDEgMDOHULKkFtjwns3+D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="349000985"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="349000985"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 16:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="851392101"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="851392101"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Jul 2023 16:48:23 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPXBr-0003fn-04;
	Fri, 28 Jul 2023 23:48:14 +0000
Date: Sat, 29 Jul 2023 07:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307290758.YrrAnTBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hwmon/bt1-pvt.c:354:24: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master crng-random/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-r082-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290758.YrrAnTBI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290758.YrrAnTBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307290758.YrrAnTBI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/bt1-pvt.c:354:24: sparse: sparse: bad integer constant expression
>> drivers/hwmon/bt1-pvt.c:354:24: sparse: sparse: static assertion failed: "clamp() low limit (typeof(data))(0) greater than high limit (typeof(data))(limit)"
   drivers/hwmon/bt1-pvt.c:359:24: sparse: sparse: bad integer constant expression
>> drivers/hwmon/bt1-pvt.c:359:24: sparse: sparse: static assertion failed: "clamp() low limit (typeof(data))(limit) greater than high limit (typeof(data))(((((0)) + (((~(((0UL)))) - ((((1UL))) << (0)) + 1) & (~(((0UL))) >> (64 - 1 - (9))))) >> 0))"
--
>> drivers/powercap/arm_scmi_powercap.c:107:17: sparse: sparse: bad integer constant expression
>> drivers/powercap/arm_scmi_powercap.c:107:17: sparse: sparse: static assertion failed: "clamp() low limit (u32)(spz->info->min_power_cap) greater than high limit (u32)(spz->info->max_power_cap)"
   drivers/powercap/arm_scmi_powercap.c:158:17: sparse: sparse: bad integer constant expression
>> drivers/powercap/arm_scmi_powercap.c:158:17: sparse: sparse: static assertion failed: "clamp() low limit (u32)(spz->info->min_pai) greater than high limit (u32)(spz->info->max_pai)"

vim +354 drivers/hwmon/bt1-pvt.c

87976ce2825d9f Serge Semin   2020-05-28  330  
87976ce2825d9f Serge Semin   2020-05-28  331  static int pvt_write_limit(struct pvt_hwmon *pvt, enum pvt_sensor_type type,
87976ce2825d9f Serge Semin   2020-05-28  332  			   bool is_low, long val)
87976ce2825d9f Serge Semin   2020-05-28  333  {
87976ce2825d9f Serge Semin   2020-05-28  334  	u32 data, limit, mask;
87976ce2825d9f Serge Semin   2020-05-28  335  	int ret;
87976ce2825d9f Serge Semin   2020-05-28  336  
87976ce2825d9f Serge Semin   2020-05-28  337  	if (type == PVT_TEMP) {
87976ce2825d9f Serge Semin   2020-05-28  338  		val = clamp(val, PVT_TEMP_MIN, PVT_TEMP_MAX);
e0daf1a60ed478 Michael Walle 2022-04-01  339  		data = polynomial_calc(&poly_temp_to_N, val);
87976ce2825d9f Serge Semin   2020-05-28  340  	} else {
87976ce2825d9f Serge Semin   2020-05-28  341  		val = clamp(val, PVT_VOLT_MIN, PVT_VOLT_MAX);
e0daf1a60ed478 Michael Walle 2022-04-01  342  		data = polynomial_calc(&poly_volt_to_N, val);
87976ce2825d9f Serge Semin   2020-05-28  343  	}
87976ce2825d9f Serge Semin   2020-05-28  344  
87976ce2825d9f Serge Semin   2020-05-28  345  	/* Serialize limit update, since a part of the register is changed. */
87976ce2825d9f Serge Semin   2020-05-28  346  	ret = mutex_lock_interruptible(&pvt->iface_mtx);
87976ce2825d9f Serge Semin   2020-05-28  347  	if (ret)
87976ce2825d9f Serge Semin   2020-05-28  348  		return ret;
87976ce2825d9f Serge Semin   2020-05-28  349  
87976ce2825d9f Serge Semin   2020-05-28  350  	/* Make sure the upper and lower ranges don't intersect. */
87976ce2825d9f Serge Semin   2020-05-28  351  	limit = readl(pvt->regs + pvt_info[type].thres_base);
87976ce2825d9f Serge Semin   2020-05-28  352  	if (is_low) {
87976ce2825d9f Serge Semin   2020-05-28  353  		limit = FIELD_GET(PVT_THRES_HI_MASK, limit);
87976ce2825d9f Serge Semin   2020-05-28 @354  		data = clamp_val(data, PVT_DATA_MIN, limit);
87976ce2825d9f Serge Semin   2020-05-28  355  		data = FIELD_PREP(PVT_THRES_LO_MASK, data);
87976ce2825d9f Serge Semin   2020-05-28  356  		mask = PVT_THRES_LO_MASK;
87976ce2825d9f Serge Semin   2020-05-28  357  	} else {
87976ce2825d9f Serge Semin   2020-05-28  358  		limit = FIELD_GET(PVT_THRES_LO_MASK, limit);
87976ce2825d9f Serge Semin   2020-05-28 @359  		data = clamp_val(data, limit, PVT_DATA_MAX);
87976ce2825d9f Serge Semin   2020-05-28  360  		data = FIELD_PREP(PVT_THRES_HI_MASK, data);
87976ce2825d9f Serge Semin   2020-05-28  361  		mask = PVT_THRES_HI_MASK;
87976ce2825d9f Serge Semin   2020-05-28  362  	}
87976ce2825d9f Serge Semin   2020-05-28  363  
87976ce2825d9f Serge Semin   2020-05-28  364  	pvt_update(pvt->regs + pvt_info[type].thres_base, mask, data);
87976ce2825d9f Serge Semin   2020-05-28  365  
87976ce2825d9f Serge Semin   2020-05-28  366  	mutex_unlock(&pvt->iface_mtx);
87976ce2825d9f Serge Semin   2020-05-28  367  
87976ce2825d9f Serge Semin   2020-05-28  368  	return 0;
87976ce2825d9f Serge Semin   2020-05-28  369  }
87976ce2825d9f Serge Semin   2020-05-28  370  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
