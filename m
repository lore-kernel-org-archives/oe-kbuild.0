Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A713590A5
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 19:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761765275; cv=none; b=bOE4bzXm6IiYofgdyeBbBWlhHqfMCn5Gv130F6oOS1beYLPb6IVMcEV3/ECGQMPz/YItEgqdMh8RarFjsKzBy1/+6KqGpLzR1AiQsDWySN/DXcxHhKLFPZzfE84MJg/oVk18AzQCyJIJYUhOvcQv4LDQDUqMsJ1nPl/xr9NpKEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761765275; c=relaxed/simple;
	bh=PcY/330eh41KuufzLEVhlKO+JZI5BP5kCWA8H6ipQBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6cPeja9Uq+dKQAUETrO2uOXGKvJrMK1XoqpspdhyiQ8+xW378CS1xHqStbAmpY+2ickqiAlHIpUcOXL8nQRGzHRo2CKEzaGF8YN4UqSu9DU96bqrJzhMrdUfr7zjNf/icXm3iuU0tJHb823n+sdg0UbFyI3yHLsc/XLZndQ9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ywxby8Em; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ywxby8Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761765273; x=1793301273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcY/330eh41KuufzLEVhlKO+JZI5BP5kCWA8H6ipQBc=;
  b=Ywxby8Em6FiFuQ9mH2RoSHJgadSpMdqPOpcgtNHPddTJZxbYSk865uhk
   QAGBIY/IB+jUwgFMt5qBzFHczWU3rOtEDfxzls4xLBVR1+eSz35WPz6oD
   7xrxg7v6ig3PiiUphyCpWHQpMKCc3wPW1q+efvwYcOxr4ViFp8xRI1Khv
   DGxwgt6yb3snbfCMdHzN/+8pGp8nDBB2KX6sfXPpo/IkKPaWrbMZRuThV
   Pv/lW1DI3kZm7CQhJcBzZe27Nr/1m8HgIN7hTQRamZ1f48Gvm9xL6/M++
   iQHoCU3uzOp5zsbtAeB8ojt0SFAtHI2hVXRxRvXlGs92XKgiQvn+ob8SH
   A==;
X-CSE-ConnectionGUID: hhdlCRBzQniVXH7v3KnxgA==
X-CSE-MsgGUID: HIJb8xFuTpmJULNn2dz7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63104567"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63104567"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 12:14:32 -0700
X-CSE-ConnectionGUID: DH6j8c97SS+i5ppG6BwsdA==
X-CSE-MsgGUID: fXNl6BjbTL6jJpqRvuIRng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185678844"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2025 12:14:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEBcq-000L5W-2m;
	Wed, 29 Oct 2025 19:14:28 +0000
Date: Thu, 30 Oct 2025 03:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 3064/3064] mm/page_alloc.c:4552
 prepare_before_alloc() warn: bitwise AND condition is false here
Message-ID: <202510300352.TkdUanUX-lkp@intel.com>
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
TO: Wupeng Ma <mawupeng1@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6a2b7160d59b59ef2bd08614200d0a2219b54e
commit: 7829f27d03dbdb975be3a72915dc71ac414f2a16 [3064/3064] mm: mem_reliable: Alloc task memory from reliable region
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 10 months ago
config: arm64-randconfig-r073-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300352.TkdUanUX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510300352.TkdUanUX-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4552 prepare_before_alloc() warn: bitwise AND condition is false here

vim +4552 mm/page_alloc.c

387ba26fb1cb9b Mel Gorman 2021-04-29  4532  
7829f27d03dbdb Ma Wupeng  2024-01-10  4533  static inline void prepare_before_alloc(gfp_t *gfp_mask)
7829f27d03dbdb Ma Wupeng  2024-01-10  4534  {
7829f27d03dbdb Ma Wupeng  2024-01-10  4535  	bool zone_movable;
7829f27d03dbdb Ma Wupeng  2024-01-10  4536  
7829f27d03dbdb Ma Wupeng  2024-01-10  4537  	if (!mem_reliable_is_enabled())
7829f27d03dbdb Ma Wupeng  2024-01-10  4538  		return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4539  
7829f27d03dbdb Ma Wupeng  2024-01-10  4540  	/*
7829f27d03dbdb Ma Wupeng  2024-01-10  4541  	 * memory reliable only handle memory allocation from movable zone
7829f27d03dbdb Ma Wupeng  2024-01-10  4542  	 * (force alloc from non-movable zone or force alloc from movable
7829f27d03dbdb Ma Wupeng  2024-01-10  4543  	 * zone) to get total isolation.
7829f27d03dbdb Ma Wupeng  2024-01-10  4544  	 */
7829f27d03dbdb Ma Wupeng  2024-01-10  4545  	zone_movable = gfp_zone(*gfp_mask & ~GFP_RELIABLE) == ZONE_MOVABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4546  	if (!zone_movable)
7829f27d03dbdb Ma Wupeng  2024-01-10  4547  		goto clear_flag;
7829f27d03dbdb Ma Wupeng  2024-01-10  4548  
7829f27d03dbdb Ma Wupeng  2024-01-10  4549  	if (!in_task())
7829f27d03dbdb Ma Wupeng  2024-01-10  4550  		return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4551  
7829f27d03dbdb Ma Wupeng  2024-01-10 @4552  	if ((current->flags & PF_RELIABLE) || is_global_init(current))
7829f27d03dbdb Ma Wupeng  2024-01-10  4553  		*gfp_mask |= GFP_RELIABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4554  
7829f27d03dbdb Ma Wupeng  2024-01-10  4555  	return;
7829f27d03dbdb Ma Wupeng  2024-01-10  4556  clear_flag:
7829f27d03dbdb Ma Wupeng  2024-01-10  4557  	*gfp_mask &= ~GFP_RELIABLE;
7829f27d03dbdb Ma Wupeng  2024-01-10  4558  }
7829f27d03dbdb Ma Wupeng  2024-01-10  4559  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
