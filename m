Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66864211471
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734002096; cv=none; b=f3wRDzTcNTBNO2k9+gGe7U0xpogllNx0ixg2q0tUCxaNNREuYCCXKaaiJu3KIeVygEVlZii0AHGFsDVfDCqueJTbSmz8qxU32wvTXEqubtEWeD/M5zP/eayctV6iXm+MTkBs8w1pm8WmL/qYnHOjw/kAZ8jclJZsHuq4EUrtNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734002096; c=relaxed/simple;
	bh=KFa4M3e3mL5+iWpxecYO/uEOeU0e533vL8XpSVF8v/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E9yUV0E/wU+scscpNpO+X9l4V/NJxraRGs0boca0bhrdQAW7sueQTHricOA1omjn+CRgI1VAXWU/i0Zoe4mr2MLK35qvEnyxvNuvICeRMmLD6SiBdJdH6Zilg1wekAqskRMGKosu+En9jGVpgncSJy3rE1doUixbJ/P2IwkAK7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9BQLEiM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9BQLEiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734002095; x=1765538095;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KFa4M3e3mL5+iWpxecYO/uEOeU0e533vL8XpSVF8v/E=;
  b=G9BQLEiMjt3yr8sURqldXbQzIDHma9pHLSnvabxPVBiJxWg4YAliHAa0
   aR+UZzZQjPYI3YlAcuAPv03oCE2bi8ehJMJAHFRM7/YMyAq7kR94i/yHV
   uyVqzRwOyhUxOzDi0QWgcDqSThfpSV4fvhBvGpBmjeKg9ZYU+JAwZRpBj
   qqBvup6wGabkt5udOq79MPQBKQfyvrlYZVa56FYhX6SuVm5AapzNeafWg
   Mn8Aub4027ZprJ3wfnzHBcR9KPurPLa8swlp95rDGYPUWR8mIsr9apRGm
   c4NzPeu1kPZmHBdbtdM8MTLWIZpizL5tju53TjDgT+6445DfkZEvbGKko
   A==;
X-CSE-ConnectionGUID: QP9UUpPIT8GneKvtO82aAg==
X-CSE-MsgGUID: LvbA1tBoQV2btIweVs0Jow==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34542753"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34542753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 03:14:54 -0800
X-CSE-ConnectionGUID: JIIzyVyqRdq6forV1pVAGQ==
X-CSE-MsgGUID: b6A3f0xBRgSaeBifesfMRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96993791"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 03:14:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLh9e-0007lb-0F;
	Thu, 12 Dec 2024 11:14:50 +0000
Date: Thu, 12 Dec 2024 19:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/intel/pmc/core_ssram.c:141
 pmc_core_get_lpm_req() error: uninitialized symbol 'ret'.
Message-ID: <202412121902.TbNaC8UJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Xi Pardee <xi.pardee@intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: "David E. Box" <david.e.box@linux.intel.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 4d621c3f02ba71cb8ed48b7c32ecb0910000cc28 platform/x86/intel/pmc: Retrieve LPM information using Intel PMT
date:   1 year ago
:::::: branch date: 13 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-r073-20241208 (https://download.01.org/0day-ci/archive/20241212/202412121902.TbNaC8UJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412121902.TbNaC8UJ-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel/pmc/core_ssram.c:141 pmc_core_get_lpm_req() error: uninitialized symbol 'ret'.

vim +/ret +141 drivers/platform/x86/intel/pmc/core_ssram.c

4d621c3f02ba71c Xi Pardee 2023-11-29   42  
4d621c3f02ba71c Xi Pardee 2023-11-29   43  static int pmc_core_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc)
4d621c3f02ba71c Xi Pardee 2023-11-29   44  {
4d621c3f02ba71c Xi Pardee 2023-11-29   45  	struct telem_endpoint *ep;
4d621c3f02ba71c Xi Pardee 2023-11-29   46  	const u8 *lpm_indices;
4d621c3f02ba71c Xi Pardee 2023-11-29   47  	int num_maps, mode_offset = 0;
4d621c3f02ba71c Xi Pardee 2023-11-29   48  	int ret, mode, i;
4d621c3f02ba71c Xi Pardee 2023-11-29   49  	int lpm_size;
4d621c3f02ba71c Xi Pardee 2023-11-29   50  	u32 guid;
4d621c3f02ba71c Xi Pardee 2023-11-29   51  
4d621c3f02ba71c Xi Pardee 2023-11-29   52  	lpm_indices = pmc->map->lpm_reg_index;
4d621c3f02ba71c Xi Pardee 2023-11-29   53  	num_maps = pmc->map->lpm_num_maps;
4d621c3f02ba71c Xi Pardee 2023-11-29   54  	lpm_size = LPM_MAX_NUM_MODES * num_maps;
4d621c3f02ba71c Xi Pardee 2023-11-29   55  
4d621c3f02ba71c Xi Pardee 2023-11-29   56  	guid = pmc_core_find_guid(pmcdev->regmap_list, pmc->map);
4d621c3f02ba71c Xi Pardee 2023-11-29   57  	if (!guid)
4d621c3f02ba71c Xi Pardee 2023-11-29   58  		return -ENXIO;
4d621c3f02ba71c Xi Pardee 2023-11-29   59  
4d621c3f02ba71c Xi Pardee 2023-11-29   60  	ep = pmt_telem_find_and_register_endpoint(pmcdev->ssram_pcidev, guid, 0);
4d621c3f02ba71c Xi Pardee 2023-11-29   61  	if (IS_ERR(ep)) {
4d621c3f02ba71c Xi Pardee 2023-11-29   62  		dev_dbg(&pmcdev->pdev->dev, "couldn't get telem endpoint %ld",
4d621c3f02ba71c Xi Pardee 2023-11-29   63  			PTR_ERR(ep));
4d621c3f02ba71c Xi Pardee 2023-11-29   64  		return -EPROBE_DEFER;
4d621c3f02ba71c Xi Pardee 2023-11-29   65  	}
4d621c3f02ba71c Xi Pardee 2023-11-29   66  
4d621c3f02ba71c Xi Pardee 2023-11-29   67  	pmc->lpm_req_regs = devm_kzalloc(&pmcdev->pdev->dev,
4d621c3f02ba71c Xi Pardee 2023-11-29   68  					 lpm_size * sizeof(u32),
4d621c3f02ba71c Xi Pardee 2023-11-29   69  					 GFP_KERNEL);
4d621c3f02ba71c Xi Pardee 2023-11-29   70  	if (!pmc->lpm_req_regs) {
4d621c3f02ba71c Xi Pardee 2023-11-29   71  		ret = -ENOMEM;
4d621c3f02ba71c Xi Pardee 2023-11-29   72  		goto unregister_ep;
4d621c3f02ba71c Xi Pardee 2023-11-29   73  	}
4d621c3f02ba71c Xi Pardee 2023-11-29   74  
4d621c3f02ba71c Xi Pardee 2023-11-29   75  	/*
4d621c3f02ba71c Xi Pardee 2023-11-29   76  	 * PMC Low Power Mode (LPM) table
4d621c3f02ba71c Xi Pardee 2023-11-29   77  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29   78  	 * In telemetry space, the LPM table contains a 4 byte header followed
4d621c3f02ba71c Xi Pardee 2023-11-29   79  	 * by 8 consecutive mode blocks (one for each LPM mode). Each block
4d621c3f02ba71c Xi Pardee 2023-11-29   80  	 * has a 4 byte header followed by a set of registers that describe the
4d621c3f02ba71c Xi Pardee 2023-11-29   81  	 * IP state requirements for the given mode. The IP mapping is platform
4d621c3f02ba71c Xi Pardee 2023-11-29   82  	 * specific but the same for each block, making for easy analysis.
4d621c3f02ba71c Xi Pardee 2023-11-29   83  	 * Platforms only use a subset of the space to track the requirements
4d621c3f02ba71c Xi Pardee 2023-11-29   84  	 * for their IPs. Callers provide the requirement registers they use as
4d621c3f02ba71c Xi Pardee 2023-11-29   85  	 * a list of indices. Each requirement register is associated with an
4d621c3f02ba71c Xi Pardee 2023-11-29   86  	 * IP map that's maintained by the caller.
4d621c3f02ba71c Xi Pardee 2023-11-29   87  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29   88  	 * Header
4d621c3f02ba71c Xi Pardee 2023-11-29   89  	 * +----+----------------------------+----------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29   90  	 * |  0 |      REVISION              |      ENABLED MODES         |
4d621c3f02ba71c Xi Pardee 2023-11-29   91  	 * +----+--------------+-------------+-------------+--------------+
4d621c3f02ba71c Xi Pardee 2023-11-29   92  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29   93  	 * Low Power Mode 0 Block
4d621c3f02ba71c Xi Pardee 2023-11-29   94  	 * +----+--------------+-------------+-------------+--------------+
4d621c3f02ba71c Xi Pardee 2023-11-29   95  	 * |  1 |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
4d621c3f02ba71c Xi Pardee 2023-11-29   96  	 * +----+--------------+-------------+-------------+--------------+
4d621c3f02ba71c Xi Pardee 2023-11-29   97  	 * |  2 |           LPM0 Requirements 0                           |
4d621c3f02ba71c Xi Pardee 2023-11-29   98  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29   99  	 * |    |                  ...                                    |
4d621c3f02ba71c Xi Pardee 2023-11-29  100  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  101  	 * | 29 |           LPM0 Requirements 27                          |
4d621c3f02ba71c Xi Pardee 2023-11-29  102  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  103  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29  104  	 * ...
4d621c3f02ba71c Xi Pardee 2023-11-29  105  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29  106  	 * Low Power Mode 7 Block
4d621c3f02ba71c Xi Pardee 2023-11-29  107  	 * +----+--------------+-------------+-------------+--------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  108  	 * |    |     SUB ID   |     SIZE    |   MAJOR     |   MINOR      |
4d621c3f02ba71c Xi Pardee 2023-11-29  109  	 * +----+--------------+-------------+-------------+--------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  110  	 * | 60 |           LPM7 Requirements 0                           |
4d621c3f02ba71c Xi Pardee 2023-11-29  111  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  112  	 * |    |                  ...                                    |
4d621c3f02ba71c Xi Pardee 2023-11-29  113  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  114  	 * | 87 |           LPM7 Requirements 27                          |
4d621c3f02ba71c Xi Pardee 2023-11-29  115  	 * +----+---------------------------------------------------------+
4d621c3f02ba71c Xi Pardee 2023-11-29  116  	 *
4d621c3f02ba71c Xi Pardee 2023-11-29  117  	 */
4d621c3f02ba71c Xi Pardee 2023-11-29  118  	mode_offset = LPM_HEADER_OFFSET + LPM_MODE_OFFSET;
4d621c3f02ba71c Xi Pardee 2023-11-29  119  	pmc_for_each_mode(i, mode, pmcdev) {
4d621c3f02ba71c Xi Pardee 2023-11-29  120  		u32 *req_offset = pmc->lpm_req_regs + (mode * num_maps);
4d621c3f02ba71c Xi Pardee 2023-11-29  121  		int m;
4d621c3f02ba71c Xi Pardee 2023-11-29  122  
4d621c3f02ba71c Xi Pardee 2023-11-29  123  		for (m = 0; m < num_maps; m++) {
4d621c3f02ba71c Xi Pardee 2023-11-29  124  			u8 sample_id = lpm_indices[m] + mode_offset;
4d621c3f02ba71c Xi Pardee 2023-11-29  125  
4d621c3f02ba71c Xi Pardee 2023-11-29  126  			ret = pmt_telem_read32(ep, sample_id, req_offset, 1);
4d621c3f02ba71c Xi Pardee 2023-11-29  127  			if (ret) {
4d621c3f02ba71c Xi Pardee 2023-11-29  128  				dev_err(&pmcdev->pdev->dev,
4d621c3f02ba71c Xi Pardee 2023-11-29  129  					"couldn't read Low Power Mode requirements: %d\n", ret);
4d621c3f02ba71c Xi Pardee 2023-11-29  130  				devm_kfree(&pmcdev->pdev->dev, pmc->lpm_req_regs);
4d621c3f02ba71c Xi Pardee 2023-11-29  131  				goto unregister_ep;
4d621c3f02ba71c Xi Pardee 2023-11-29  132  			}
4d621c3f02ba71c Xi Pardee 2023-11-29  133  			++req_offset;
4d621c3f02ba71c Xi Pardee 2023-11-29  134  		}
4d621c3f02ba71c Xi Pardee 2023-11-29  135  		mode_offset += LPM_REG_COUNT + LPM_MODE_OFFSET;
4d621c3f02ba71c Xi Pardee 2023-11-29  136  	}
4d621c3f02ba71c Xi Pardee 2023-11-29  137  
4d621c3f02ba71c Xi Pardee 2023-11-29  138  unregister_ep:
4d621c3f02ba71c Xi Pardee 2023-11-29  139  	pmt_telem_unregister_endpoint(ep);
4d621c3f02ba71c Xi Pardee 2023-11-29  140  
4d621c3f02ba71c Xi Pardee 2023-11-29 @141  	return ret;
4d621c3f02ba71c Xi Pardee 2023-11-29  142  }
4d621c3f02ba71c Xi Pardee 2023-11-29  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
