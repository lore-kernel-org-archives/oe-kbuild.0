Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE89448
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Oct 2023 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696237368; x=1727773368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dUtEmfkl6lX0HWPmo/DrV22DpNMN3KVOHxFD8/66sw=;
  b=jbtWoX/JThB7eEb2LhDAZbHqeq+tCN93Jj+VF5hfbHxiU1zUXuWHLzqv
   7afHCiVbtt92WDh+bnkeW+LSU96xNJkuSyKo6CP5xEMvICbz2Pec4u29k
   +L1nH71y9ZPIRkm+3ncRJjqVFHSFg15aAb9nFwHfxkXOsGBHDHzKUp6JB
   oggBmxWIGT1BWOFkewCxRYtbVY99TadnXc+OAWsJTbMgWpqQkob/xqygo
   iGgAedLDZdg10dc4LgtPJxOobDnSIHgUYf1iKBrAyz+v3HWL/FgWMrgjf
   mTH+OAwpB3CZUmdclIUtGlyo/M3W9mewc4oq7Cwicq48PEgzQWcIY4ZVX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="367665152"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="367665152"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 02:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="924210079"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; 
   d="scan'208";a="924210079"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Oct 2023 02:02:45 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnEp9-0005u1-16;
	Mon, 02 Oct 2023 09:02:43 +0000
Date: Mon, 2 Oct 2023 17:01:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/11] platform/x86/intel/pmc: Retrieve LPM information
 using Intel PMT
Message-ID: <202310021646.7rGtnqrS-lkp@intel.com>
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
In-Reply-To: <20230922213032.1770590-10-david.e.box@linux.intel.com>
References: <20230922213032.1770590-10-david.e.box@linux.intel.com>
TO: "David E. Box" <david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acce85a7dd28eac3858d44230f4c65985d0f271c]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Add-intel_vsec_register/20230923-053226
base:   acce85a7dd28eac3858d44230f4c65985d0f271c
patch link:    https://lore.kernel.org/r/20230922213032.1770590-10-david.e.box%40linux.intel.com
patch subject: [PATCH 09/11] platform/x86/intel/pmc: Retrieve LPM information using Intel PMT
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-161-20231002 (https://download.01.org/0day-ci/archive/20231002/202310021646.7rGtnqrS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231002/202310021646.7rGtnqrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310021646.7rGtnqrS-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/pmc/core_ssram.c:138 pmc_core_get_lpm_req() error: uninitialized symbol 'ret'.

vim +/ret +138 drivers/platform/x86/intel/pmc/core_ssram.c

4210a66b03fca8 Xi Pardee 2023-09-22   39  
4210a66b03fca8 Xi Pardee 2023-09-22   40  static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
4210a66b03fca8 Xi Pardee 2023-09-22   41  {
4210a66b03fca8 Xi Pardee 2023-09-22   42  	struct telem_endpoint *ep;
4210a66b03fca8 Xi Pardee 2023-09-22   43  	const u8 *lpm_indices;
4210a66b03fca8 Xi Pardee 2023-09-22   44  	int num_maps, mode_offset = 0;
4210a66b03fca8 Xi Pardee 2023-09-22   45  	int ret, mode, i;
4210a66b03fca8 Xi Pardee 2023-09-22   46  	int lpm_size;
4210a66b03fca8 Xi Pardee 2023-09-22   47  	u32 guid;
4210a66b03fca8 Xi Pardee 2023-09-22   48  
4210a66b03fca8 Xi Pardee 2023-09-22   49  	lpm_indices = pmc->map->lpm_reg_index;
4210a66b03fca8 Xi Pardee 2023-09-22   50  	num_maps = pmc->map->lpm_num_maps;
4210a66b03fca8 Xi Pardee 2023-09-22   51  	lpm_size = LPM_MAX_NUM_MODES * num_maps;
4210a66b03fca8 Xi Pardee 2023-09-22   52  
4210a66b03fca8 Xi Pardee 2023-09-22   53  	guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
4210a66b03fca8 Xi Pardee 2023-09-22   54  	if (!guid)
4210a66b03fca8 Xi Pardee 2023-09-22   55  		return -ENXIO;
4210a66b03fca8 Xi Pardee 2023-09-22   56  
4210a66b03fca8 Xi Pardee 2023-09-22   57  	ep = pmt_telem_find_and_register_endpoint(pmcdev->ssram_pcidev, guid, 0);
4210a66b03fca8 Xi Pardee 2023-09-22   58  	if (IS_ERR(ep)) {
4210a66b03fca8 Xi Pardee 2023-09-22   59  		dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %ld",
4210a66b03fca8 Xi Pardee 2023-09-22   60  			PTR_ERR(ep));
4210a66b03fca8 Xi Pardee 2023-09-22   61  		return -EPROBE_DEFER;
4210a66b03fca8 Xi Pardee 2023-09-22   62  	}
4210a66b03fca8 Xi Pardee 2023-09-22   63  
4210a66b03fca8 Xi Pardee 2023-09-22   64  	pmc->lpm_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
4210a66b03fca8 Xi Pardee 2023-09-22   65  					 lpm_size * sizeof(u32),
4210a66b03fca8 Xi Pardee 2023-09-22   66  					 GFP_KERNEL);
4210a66b03fca8 Xi Pardee 2023-09-22   67  	if (!pmc->lpm_req_regs) {
4210a66b03fca8 Xi Pardee 2023-09-22   68  		ret = -ENOMEM;
4210a66b03fca8 Xi Pardee 2023-09-22   69  		goto unregister_ep;
4210a66b03fca8 Xi Pardee 2023-09-22   70  	}
4210a66b03fca8 Xi Pardee 2023-09-22   71  
4210a66b03fca8 Xi Pardee 2023-09-22   72  	/*
4210a66b03fca8 Xi Pardee 2023-09-22   73  	 * PMC Low Power Mode (LPM) requirements table
4210a66b03fca8 Xi Pardee 2023-09-22   74  	 *
4210a66b03fca8 Xi Pardee 2023-09-22   75  	 * In telemetry space, the LPM table contains a 4 byte header followed
4210a66b03fca8 Xi Pardee 2023-09-22   76  	 * by 8 consecutive mode blocks (one for each LPM mode). Each block
4210a66b03fca8 Xi Pardee 2023-09-22   77  	 * has a 4 byte header followed by a set of registers that describe the
4210a66b03fca8 Xi Pardee 2023-09-22   78  	 * IP state requirements for the given mode. The IP mapping is platform
4210a66b03fca8 Xi Pardee 2023-09-22   79  	 * specific but the same for each block, making for easy analysis.
4210a66b03fca8 Xi Pardee 2023-09-22   80  	 * Platforms only use a subset of the space to track the requirements
4210a66b03fca8 Xi Pardee 2023-09-22   81  	 * for their IPs. Callers provide the requirement registers they use as
4210a66b03fca8 Xi Pardee 2023-09-22   82  	 * a list of indices. Each requirement register is associated with an
4210a66b03fca8 Xi Pardee 2023-09-22   83  	 * IP map that's maintained by the caller.
4210a66b03fca8 Xi Pardee 2023-09-22   84  	 *
4210a66b03fca8 Xi Pardee 2023-09-22   85  	 * Header
4210a66b03fca8 Xi Pardee 2023-09-22   86  	 * +----+----------------------------+----------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22   87  	 * |  0 |      REVISION              |      ENABLED MODES         |
4210a66b03fca8 Xi Pardee 2023-09-22   88  	 * +----+--------------+-------------+-------------+--------------+
4210a66b03fca8 Xi Pardee 2023-09-22   89  	 *
4210a66b03fca8 Xi Pardee 2023-09-22   90  	 * Low Power Mode 0 Block
4210a66b03fca8 Xi Pardee 2023-09-22   91  	 * +----+--------------+-------------+-------------+--------------+
4210a66b03fca8 Xi Pardee 2023-09-22   92  	 * |  1 |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
4210a66b03fca8 Xi Pardee 2023-09-22   93  	 * +----+--------------+-------------+-------------+--------------+
4210a66b03fca8 Xi Pardee 2023-09-22   94  	 * |  2 |           LPM0 Requirements 0                           |
4210a66b03fca8 Xi Pardee 2023-09-22   95  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22   96  	 * |    |                  ...                                    |
4210a66b03fca8 Xi Pardee 2023-09-22   97  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22   98  	 * | 29 |           LPM0 Requirements 27                          |
4210a66b03fca8 Xi Pardee 2023-09-22   99  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22  100  	 *
4210a66b03fca8 Xi Pardee 2023-09-22  101  	 * ...
4210a66b03fca8 Xi Pardee 2023-09-22  102  	 *
4210a66b03fca8 Xi Pardee 2023-09-22  103  	 * Low Power Mode 7 Block
4210a66b03fca8 Xi Pardee 2023-09-22  104  	 * +----+--------------+-------------+-------------+--------------+
4210a66b03fca8 Xi Pardee 2023-09-22  105  	 * |    |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
4210a66b03fca8 Xi Pardee 2023-09-22  106  	 * +----+--------------+-------------+-------------+--------------+
4210a66b03fca8 Xi Pardee 2023-09-22  107  	 * | 60 |           LPM7 Requirements 0                           |
4210a66b03fca8 Xi Pardee 2023-09-22  108  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22  109  	 * |    |                  ...                                    |
4210a66b03fca8 Xi Pardee 2023-09-22  110  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22  111  	 * | 87 |           LPM7 Requirements 27                          |
4210a66b03fca8 Xi Pardee 2023-09-22  112  	 * +----+---------------------------------------------------------+
4210a66b03fca8 Xi Pardee 2023-09-22  113  	 *
4210a66b03fca8 Xi Pardee 2023-09-22  114  	 */
4210a66b03fca8 Xi Pardee 2023-09-22  115  	mode_offset = LPM_HEADER_OFFSET + LPM_MODE_OFFSET;
4210a66b03fca8 Xi Pardee 2023-09-22  116  	pmc_for_each_mode(i, mode, pmcdev) {
4210a66b03fca8 Xi Pardee 2023-09-22  117  		u32 *req_offset = pmc->lpm_req_regs + (mode * num_maps);
4210a66b03fca8 Xi Pardee 2023-09-22  118  		int m;
4210a66b03fca8 Xi Pardee 2023-09-22  119  
4210a66b03fca8 Xi Pardee 2023-09-22  120  		for (m = 0; m < num_maps; m++) {
4210a66b03fca8 Xi Pardee 2023-09-22  121  			u8 sample_id = lpm_indices[m] + mode_offset;
4210a66b03fca8 Xi Pardee 2023-09-22  122  
4210a66b03fca8 Xi Pardee 2023-09-22  123  			ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
4210a66b03fca8 Xi Pardee 2023-09-22  124  			if (ret) {
4210a66b03fca8 Xi Pardee 2023-09-22  125  				dev_err(&pmcdev->pdev->dev,
4210a66b03fca8 Xi Pardee 2023-09-22  126  					"couldn't read Low Power Mode requirements: %d\n", ret);
4210a66b03fca8 Xi Pardee 2023-09-22  127  				devm_kfree(&pmcdev->pdev->dev, pmc->lpm_req_regs);
4210a66b03fca8 Xi Pardee 2023-09-22  128  				goto unregister_ep;
4210a66b03fca8 Xi Pardee 2023-09-22  129  			}
4210a66b03fca8 Xi Pardee 2023-09-22  130  			++req_offset;
4210a66b03fca8 Xi Pardee 2023-09-22  131  		}
4210a66b03fca8 Xi Pardee 2023-09-22  132  		mode_offset += (LPM_REG_COUNT + LPM_MODE_OFFSET);
4210a66b03fca8 Xi Pardee 2023-09-22  133  	}
4210a66b03fca8 Xi Pardee 2023-09-22  134  
4210a66b03fca8 Xi Pardee 2023-09-22  135  unregister_ep:
4210a66b03fca8 Xi Pardee 2023-09-22  136  	pmt_telem_unregister_endpoint(ep);
4210a66b03fca8 Xi Pardee 2023-09-22  137  
4210a66b03fca8 Xi Pardee 2023-09-22 @138  	return ret;
4210a66b03fca8 Xi Pardee 2023-09-22  139  }
4210a66b03fca8 Xi Pardee 2023-09-22  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
