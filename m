Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071532E728
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328845; cv=none; b=iaqPSCLukNhVrkbyQ3C+V0kUS0Z3cYTvQiGEH9CFk9gdO+IcFMVZvfxo+CfYgkp39bBhybFbe3cQiLqb2TVmiSXxZBpdt1tZyBj+gNdK5EBqyRn1LLmcskLy1vLfwXN2n+Fo38bzml9jCXj7paxs0nAtOP9pFUBcEQJR6oY+VQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328845; c=relaxed/simple;
	bh=qda8PkljwWn43ZpcGNNEPpPti46/GK1hq0oKjJCrrHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h1LZa1cWRlAa9Sc8XqboNyev+y5ppRtDd5LcptAakMBHGzakK0rtcHR5crQexYv4Eqv0zGq2A6a0dbz4YltpIObg0eV+40kYrQ0/zH50iiNDw2wbuBukWroqetw0uOl/htkHhKCRGpsR6aSgToS9JuJ9gWSuqXwV9oxodhlZTWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P5CpXCuL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P5CpXCuL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773328843; x=1804864843;
  h=date:from:to:cc:subject:message-id;
  bh=qda8PkljwWn43ZpcGNNEPpPti46/GK1hq0oKjJCrrHc=;
  b=P5CpXCuL3bsqJt467azl2sqSuPxKg7uXa9pLN/9Rbo8Tx0oCUFUyqO7c
   3RHR5V7NIeCdh9FeQlZBWNE9Ijl4zPVWqYFuKZYQgWJVcAsadGJWcg+0B
   wCG79mFOFKci0GGSSQ5IEs0AyVP9WyQu9qLWJRqVxWy6hNLEmNfFE0Glq
   OixBiFV8389AEnEZ5MtvHIrMijOdDRAj8MkqT3/fXzoGyCZmhn49Y07iL
   w4QizQLoHefmTrGpIYaF5DxSHEnetQr8L9gZXoZ5pfNz3KRpTHB/cyZLL
   ByflmWEvGVthKyIJgEHApTggeEeoNBfsVkqwYLNGR9j4JReCr4UivcIey
   Q==;
X-CSE-ConnectionGUID: KmOq96CgTmCF3Bqlip8mtw==
X-CSE-MsgGUID: 8mzRj4qlR2mfbg0MWUbltw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85509717"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="85509717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:20:42 -0700
X-CSE-ConnectionGUID: 93SLZTjJRlWk1QQm+c0b2A==
X-CSE-MsgGUID: rEAJ9wcPQA2DHCnL8cKvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="251344070"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2026 08:20:41 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0hq2-000000002ap-07vS;
	Thu, 12 Mar 2026 15:20:38 +0000
Date: Thu, 12 Mar 2026 23:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:drm-next 204/224]
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534
 amdgpu_discovery_table_check() warn: statement has no effect 'struct'
Message-ID: <202603122337.G1JXIdlU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   7a9419ab42699fd3d4c857ef81ae097d8d8d5899
commit: 47ab777c16c71ba033325593cd833bded65f5943 [204/224] drm/amdgpu/discovery: use common function to check discovery table
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20260312 (https://download.01.org/0day-ci/archive/20260312/202603122337.G1JXIdlU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603122337.G1JXIdlU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:534 amdgpu_discovery_table_check() warn: statement has no effect 'struct'

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:542 amdgpu_discovery_table_check() warn: statement has no effect 'struct'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:550 amdgpu_discovery_table_check() warn: statement has no effect 'struct'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:558 amdgpu_discovery_table_check() warn: statement has no effect 'struct'
drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:566 amdgpu_discovery_table_check() warn: statement has no effect 'struct'

vim +/struct +534 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c

d0c647a6aae2ce5 Likun Gao    2025-11-07  515  
47ab777c16c71ba Likun Gao    2026-03-05  516  static int amdgpu_discovery_table_check(struct amdgpu_device *adev,
47ab777c16c71ba Likun Gao    2026-03-05  517  					uint8_t *discovery_bin,
47ab777c16c71ba Likun Gao    2026-03-05  518  					uint16_t table_id)
f39f5bb1c9d68d5 Xiaojie Yuan 2019-06-20  519  {
47ab777c16c71ba Likun Gao    2026-03-05  520  	int r, act_val, exp_val, table_size;
47ab777c16c71ba Likun Gao    2026-03-05  521  	uint16_t offset, checksum;
f39f5bb1c9d68d5 Xiaojie Yuan 2019-06-20  522  	struct table_info *info;
47ab777c16c71ba Likun Gao    2026-03-05  523  	bool check_table = true;
47ab777c16c71ba Likun Gao    2026-03-05  524  	char *table_name;
47ab777c16c71ba Likun Gao    2026-03-05  525  
47ab777c16c71ba Likun Gao    2026-03-05  526  	r = amdgpu_discovery_get_table_info(adev, &info, table_id);
47ab777c16c71ba Likun Gao    2026-03-05  527  	if (r)
47ab777c16c71ba Likun Gao    2026-03-05  528  		return r;
47ab777c16c71ba Likun Gao    2026-03-05  529  	offset = le16_to_cpu(info->offset);
47ab777c16c71ba Likun Gao    2026-03-05  530  	checksum = le16_to_cpu(info->checksum);
47ab777c16c71ba Likun Gao    2026-03-05  531  
47ab777c16c71ba Likun Gao    2026-03-05  532  	switch (table_id) {
47ab777c16c71ba Likun Gao    2026-03-05  533  	case IP_DISCOVERY:
47ab777c16c71ba Likun Gao    2026-03-05 @534  		struct ip_discovery_header *ihdr =
47ab777c16c71ba Likun Gao    2026-03-05  535  			(struct ip_discovery_header *)(discovery_bin + offset);
47ab777c16c71ba Likun Gao    2026-03-05  536  		act_val = le32_to_cpu(ihdr->signature);
47ab777c16c71ba Likun Gao    2026-03-05  537  		exp_val = DISCOVERY_TABLE_SIGNATURE;
47ab777c16c71ba Likun Gao    2026-03-05  538  		table_size = le16_to_cpu(ihdr->size);
47ab777c16c71ba Likun Gao    2026-03-05  539  		table_name = "data table";
47ab777c16c71ba Likun Gao    2026-03-05  540  		break;
47ab777c16c71ba Likun Gao    2026-03-05  541  	case GC:
47ab777c16c71ba Likun Gao    2026-03-05  542  		struct gpu_info_header *ghdr =
47ab777c16c71ba Likun Gao    2026-03-05  543  			(struct gpu_info_header *)(discovery_bin + offset);
47ab777c16c71ba Likun Gao    2026-03-05  544  		act_val = le32_to_cpu(ghdr->table_id);
47ab777c16c71ba Likun Gao    2026-03-05  545  		exp_val = GC_TABLE_ID;
47ab777c16c71ba Likun Gao    2026-03-05  546  		table_size = le16_to_cpu(ghdr->size);
47ab777c16c71ba Likun Gao    2026-03-05  547  		table_name = "gc table";
47ab777c16c71ba Likun Gao    2026-03-05  548  		break;
47ab777c16c71ba Likun Gao    2026-03-05  549  	case HARVEST_INFO:
47ab777c16c71ba Likun Gao    2026-03-05  550  		struct harvest_info_header *hhdr =
47ab777c16c71ba Likun Gao    2026-03-05  551  			(struct harvest_info_header *)(discovery_bin + offset);
47ab777c16c71ba Likun Gao    2026-03-05  552  		act_val = le32_to_cpu(hhdr->signature);
47ab777c16c71ba Likun Gao    2026-03-05  553  		exp_val = HARVEST_TABLE_SIGNATURE;
47ab777c16c71ba Likun Gao    2026-03-05  554  		table_size = sizeof(struct harvest_table);
47ab777c16c71ba Likun Gao    2026-03-05  555  		table_name = "harvest table";
47ab777c16c71ba Likun Gao    2026-03-05  556  		break;
47ab777c16c71ba Likun Gao    2026-03-05  557  	case VCN_INFO:
47ab777c16c71ba Likun Gao    2026-03-05  558  		struct vcn_info_header *vhdr =
47ab777c16c71ba Likun Gao    2026-03-05  559  			(struct vcn_info_header *)(discovery_bin + offset);
47ab777c16c71ba Likun Gao    2026-03-05  560  		act_val = le32_to_cpu(vhdr->table_id);
47ab777c16c71ba Likun Gao    2026-03-05  561  		exp_val = VCN_INFO_TABLE_ID;
47ab777c16c71ba Likun Gao    2026-03-05  562  		table_size = le32_to_cpu(vhdr->size_bytes);
47ab777c16c71ba Likun Gao    2026-03-05  563  		table_name = "vcn table";
47ab777c16c71ba Likun Gao    2026-03-05  564  		break;
47ab777c16c71ba Likun Gao    2026-03-05  565  	case MALL_INFO:
47ab777c16c71ba Likun Gao    2026-03-05  566  		struct mall_info_header *mhdr =
47ab777c16c71ba Likun Gao    2026-03-05  567  			(struct mall_info_header *)(discovery_bin + offset);
47ab777c16c71ba Likun Gao    2026-03-05  568  		act_val = le32_to_cpu(mhdr->table_id);
47ab777c16c71ba Likun Gao    2026-03-05  569  		exp_val = MALL_INFO_TABLE_ID;
47ab777c16c71ba Likun Gao    2026-03-05  570  		table_size = le32_to_cpu(mhdr->size_bytes);
47ab777c16c71ba Likun Gao    2026-03-05  571  		table_name = "mall table";
47ab777c16c71ba Likun Gao    2026-03-05  572  		check_table = false;
47ab777c16c71ba Likun Gao    2026-03-05  573  		break;
47ab777c16c71ba Likun Gao    2026-03-05  574  	default:
47ab777c16c71ba Likun Gao    2026-03-05  575  		dev_err(adev->dev, "invalid ip discovery table id %d specified\n", table_id);
47ab777c16c71ba Likun Gao    2026-03-05  576  		check_table = false;
47ab777c16c71ba Likun Gao    2026-03-05  577  		break;
47ab777c16c71ba Likun Gao    2026-03-05  578  	}
47ab777c16c71ba Likun Gao    2026-03-05  579  
47ab777c16c71ba Likun Gao    2026-03-05  580  	if (check_table && offset) {
47ab777c16c71ba Likun Gao    2026-03-05  581  		if (act_val != exp_val) {
47ab777c16c71ba Likun Gao    2026-03-05  582  			dev_err(adev->dev, "invalid ip discovery %s signature\n", table_name);
47ab777c16c71ba Likun Gao    2026-03-05  583  			return -EINVAL;
47ab777c16c71ba Likun Gao    2026-03-05  584  		}
47ab777c16c71ba Likun Gao    2026-03-05  585  
47ab777c16c71ba Likun Gao    2026-03-05  586  		if (!amdgpu_discovery_verify_checksum(adev, discovery_bin + offset,
47ab777c16c71ba Likun Gao    2026-03-05  587  						      table_size, checksum)) {
47ab777c16c71ba Likun Gao    2026-03-05  588  			dev_err(adev->dev, "invalid ip discovery %s checksum\n", table_name);
47ab777c16c71ba Likun Gao    2026-03-05  589  			return -EINVAL;
47ab777c16c71ba Likun Gao    2026-03-05  590  		}
47ab777c16c71ba Likun Gao    2026-03-05  591  	}
47ab777c16c71ba Likun Gao    2026-03-05  592  
47ab777c16c71ba Likun Gao    2026-03-05  593  	return 0;
47ab777c16c71ba Likun Gao    2026-03-05  594  }
47ab777c16c71ba Likun Gao    2026-03-05  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
