Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7088467
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 01:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734398470; cv=none; b=jmIal/r40xG0S5EnIMSl/TE5VYdrm7bXxi61WUu0bJbeTFTmnIeMHIlAGJYwfxNpl1ZHiTh/jm29ttLQ64NRle+JTG7qX/Zaxk48slOxJykpU+eHrCVcm4Pnq3SbGJjqyD0Xjtvpj2EuZcMvjVGSGB4uM9jhVn2GZk7AS1p70Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734398470; c=relaxed/simple;
	bh=bper9RQIINW53lOFx1R4FMlIbhmLFZa1giQotk5kIkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llUijik2h1HYbiATRIAFk65gBOPIDSGBnSnwV8EqoDziBA2Rza7GR9ohYShB9ztPXLQB7dYX3H3eo1fgws95meEY35oFPsVJwItnjNzEHT6UfHq1HVa8heWwtNNWadiuWQqgbU0zHCZu7BsEJAIhuGpuGJk8YHzYSVR1FkJNopc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHCFTLBS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHCFTLBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734398468; x=1765934468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bper9RQIINW53lOFx1R4FMlIbhmLFZa1giQotk5kIkg=;
  b=aHCFTLBS1Lr7+V1IbNAIkc6JEuCEVyB7ETPVLOdqkvkPdMYUd/Tl5aAJ
   nXwMn/KjevW+sc4Udgy8pHl9SMD1p6ljPuOMSJTBiRIcOfiGIGw5lnyJz
   H9b+ItqfeEBiUQbYkGxnQhFqtSOqw+P2l6DDWaOVLn02O5YuHG3MyliJF
   43sB49fvf6Cv+K0TNhXzZS7qVQmB80HRkrXmrEmTjCkYfAfVqEFivlBGY
   g20PxUjgJltcqXHYQyMx4Kwrhb07UUrYk81aXHwSpUk8HVTDYZjRK/WB/
   FUeht019zLJWbdCpXp+bZRQ5f6hln1v1FSFsSUxm8zh1rKMPOF/MKOLAu
   g==;
X-CSE-ConnectionGUID: /DZcexlfSu+1koCUK2RJvA==
X-CSE-MsgGUID: nvW2iZJeTHGET/VYIShwBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="60194682"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="60194682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 17:21:07 -0800
X-CSE-ConnectionGUID: +xRFubuPTx6PqLZEjdXLdA==
X-CSE-MsgGUID: XzsXOx8cS8eIBlLTOlxHiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="98176224"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Dec 2024 17:21:06 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNMGl-000EdS-1I;
	Tue, 17 Dec 2024 01:21:03 +0000
Date: Tue, 17 Dec 2024 09:20:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2583/2583] drivers/platform/x86/intel_vsec.c:194
 intel_vsec_add_dev() warn: possible memory leak of 'intel_vsec_dev'
Message-ID: <202412170934.0YmShlea-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "Jia, Yingbao" <yingbao.jia@intel.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd14d8eb16732508135cd386c09cc747615571f7
commit: 045360f5c497cbbb84804a5026eeb1eb26bccab1 [2583/2583] platform/x86/intel/vsec: Add intel_vsec_register
:::::: branch date: 23 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170934.0YmShlea-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412170934.0YmShlea-lkp@intel.com/

smatch warnings:
drivers/platform/x86/intel_vsec.c:194 intel_vsec_add_dev() warn: possible memory leak of 'intel_vsec_dev'

vim +/intel_vsec_dev +194 drivers/platform/x86/intel_vsec.c

4e17cb1a523bb79 David E. Box        2021-12-07  140  
4e17cb1a523bb79 David E. Box        2021-12-07  141  static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
5f30bf18c574ead David E. Box        2022-06-29  142  			      struct intel_vsec_platform_info *info)
4e17cb1a523bb79 David E. Box        2021-12-07  143  {
4e17cb1a523bb79 David E. Box        2021-12-07  144  	struct intel_vsec_device *intel_vsec_dev;
4e17cb1a523bb79 David E. Box        2021-12-07  145  	struct resource *res, *tmp;
045360f5c497cbb Gayatri Kammela     2023-11-29  146  	struct device *parent;
5f30bf18c574ead David E. Box        2022-06-29  147  	unsigned long quirks = info->quirks;
4e17cb1a523bb79 David E. Box        2021-12-07  148  	int i;
4e17cb1a523bb79 David E. Box        2021-12-07  149  
045360f5c497cbb Gayatri Kammela     2023-11-29  150  	if (info->parent)
045360f5c497cbb Gayatri Kammela     2023-11-29  151  		parent = info->parent;
045360f5c497cbb Gayatri Kammela     2023-11-29  152  	else
045360f5c497cbb Gayatri Kammela     2023-11-29  153  		parent = &pdev->dev;
045360f5c497cbb Gayatri Kammela     2023-11-29  154  
ab1a3aedda0fd8b David E. Box        2023-03-16  155  	if (!intel_vsec_supported(header->id, info->caps))
4e17cb1a523bb79 David E. Box        2021-12-07  156  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  157  
4e17cb1a523bb79 David E. Box        2021-12-07  158  	if (!header->num_entries) {
4e17cb1a523bb79 David E. Box        2021-12-07  159  		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->id);
4e17cb1a523bb79 David E. Box        2021-12-07  160  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  161  	}
4e17cb1a523bb79 David E. Box        2021-12-07  162  
4e17cb1a523bb79 David E. Box        2021-12-07  163  	if (!header->entry_size) {
4e17cb1a523bb79 David E. Box        2021-12-07  164  		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->id);
4e17cb1a523bb79 David E. Box        2021-12-07  165  		return -EINVAL;
4e17cb1a523bb79 David E. Box        2021-12-07  166  	}
4e17cb1a523bb79 David E. Box        2021-12-07  167  
4e17cb1a523bb79 David E. Box        2021-12-07  168  	intel_vsec_dev = kzalloc(sizeof(*intel_vsec_dev), GFP_KERNEL);
4e17cb1a523bb79 David E. Box        2021-12-07  169  	if (!intel_vsec_dev)
4e17cb1a523bb79 David E. Box        2021-12-07  170  		return -ENOMEM;
4e17cb1a523bb79 David E. Box        2021-12-07  171  
4e17cb1a523bb79 David E. Box        2021-12-07  172  	res = kcalloc(header->num_entries, sizeof(*res), GFP_KERNEL);
4e17cb1a523bb79 David E. Box        2021-12-07  173  	if (!res) {
4e17cb1a523bb79 David E. Box        2021-12-07  174  		kfree(intel_vsec_dev);
4e17cb1a523bb79 David E. Box        2021-12-07  175  		return -ENOMEM;
4e17cb1a523bb79 David E. Box        2021-12-07  176  	}
4e17cb1a523bb79 David E. Box        2021-12-07  177  
4e17cb1a523bb79 David E. Box        2021-12-07  178  	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
4e17cb1a523bb79 David E. Box        2021-12-07  179  		header->offset >>= TABLE_OFFSET_SHIFT;
4e17cb1a523bb79 David E. Box        2021-12-07  180  
4e17cb1a523bb79 David E. Box        2021-12-07  181  	/*
4e17cb1a523bb79 David E. Box        2021-12-07  182  	 * The DVSEC/VSEC contains the starting offset and count for a block of
4e17cb1a523bb79 David E. Box        2021-12-07  183  	 * discovery tables. Create a resource array of these tables to the
4e17cb1a523bb79 David E. Box        2021-12-07  184  	 * auxiliary device driver.
4e17cb1a523bb79 David E. Box        2021-12-07  185  	 */
4e17cb1a523bb79 David E. Box        2021-12-07  186  	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
4e17cb1a523bb79 David E. Box        2021-12-07  187  		tmp->start = pdev->resource[header->tbir].start +
4e17cb1a523bb79 David E. Box        2021-12-07  188  			     header->offset + i * (header->entry_size * sizeof(u32));
4e17cb1a523bb79 David E. Box        2021-12-07  189  		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
4e17cb1a523bb79 David E. Box        2021-12-07  190  		tmp->flags = IORESOURCE_MEM;
045360f5c497cbb Gayatri Kammela     2023-11-29  191  
045360f5c497cbb Gayatri Kammela     2023-11-29  192  		/* Check resource is not in use */
045360f5c497cbb Gayatri Kammela     2023-11-29  193  		if (!request_mem_region(tmp->start, resource_size(tmp), ""))
045360f5c497cbb Gayatri Kammela     2023-11-29 @194  			return -EBUSY;
045360f5c497cbb Gayatri Kammela     2023-11-29  195  
045360f5c497cbb Gayatri Kammela     2023-11-29  196  		release_mem_region(tmp->start, resource_size(tmp));
4e17cb1a523bb79 David E. Box        2021-12-07  197  	}
4e17cb1a523bb79 David E. Box        2021-12-07  198  
4e17cb1a523bb79 David E. Box        2021-12-07  199  	intel_vsec_dev->pcidev = pdev;
4e17cb1a523bb79 David E. Box        2021-12-07  200  	intel_vsec_dev->resource = res;
4e17cb1a523bb79 David E. Box        2021-12-07  201  	intel_vsec_dev->num_resources = header->num_entries;
f46f38183f3a2db David E. Box        2023-11-29  202  	intel_vsec_dev->quirks = info->quirks;
4e17cb1a523bb79 David E. Box        2021-12-07  203  	intel_vsec_dev->ida = &intel_vsec_ida;
4e17cb1a523bb79 David E. Box        2021-12-07  204  
045360f5c497cbb Gayatri Kammela     2023-11-29  205  	return intel_vsec_add_aux(pdev, parent, intel_vsec_dev,
fbced3ac8b6a0cc Srinivas Pandruvada 2023-02-01  206  				  intel_vsec_name(header->id));
4e17cb1a523bb79 David E. Box        2021-12-07  207  }
4e17cb1a523bb79 David E. Box        2021-12-07  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
