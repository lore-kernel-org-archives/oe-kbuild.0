Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E3022075
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jun 2024 05:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717392824; cv=none; b=iswuefEof5fPjVs0wpha1BdDAmrUW66nzgPbihwW+Ssg0Kz2u10VB8e1RxVdsyFBC0OYayhdqa3Nf4CsPAt98Fbbjz3WYCWLPHBCpSu06rV6E3CsVC1kM60EX8kWf0HVCyRPHKDkNoMUmYaJvQOKr2Mb/kcE1C2tWtJTVWUtSk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717392824; c=relaxed/simple;
	bh=HLU6J/beVQYlYG88O8Qyn/vwhtcJl1hSTux31rH9SZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DckQR+qC6RWoWJbUqalibQUNhpIs2HFivgyGGIaVAJTiFqD00Nll8okc4mSwhF3E/KTYczuLEmntK3So3SOm04mOxk+uCJJC+Nrl4LoraVSHSwvXvnhIgy64y8/tB6FIZiIzMMJijdOcmVIZOeOOTlDaoBHOgBpDwQrLcL8/MP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+3NWQPj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+3NWQPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717392823; x=1748928823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLU6J/beVQYlYG88O8Qyn/vwhtcJl1hSTux31rH9SZc=;
  b=e+3NWQPjdYVYU2CC8xog5+AGR8SAl3a2IDqVFhRJ/Sk8APraHOzfpdy0
   rqCK+lwMkax7PH9Tk2ecstcmEKVWhVT03u8EtgBrHzLinn60JrkIAKcR9
   aSM8cLx3qLSdQeD+KPzfvV5QrhFLqbvRRPsgc6DeQa/fHdxCF4uTu8ZNA
   NlCL9RgMgBzh+CJ+9Ct3WQbsTo5yrRUp3dxjfcfIak488qdvvyw0AZpJt
   90Zj5Y09T5jVh7CGN/ZNP84tejG7v66lpi5aV0fPAupwoeAJ3OFGXxTq1
   GrWDMijGq3knigfvCaBo1rHOY7dIkymz97ecZ/0zdUI15zw1dFybgyv/d
   A==;
X-CSE-ConnectionGUID: FX3YWs5OQe67KGm20casOw==
X-CSE-MsgGUID: EoSnQrTuQfub7jeigO+ejA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17663336"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="17663336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 22:33:42 -0700
X-CSE-ConnectionGUID: cXjgIZDgSZiXRTSGAzPALQ==
X-CSE-MsgGUID: kWoIkDEFR7Who2n2vUDNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="41854180"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Jun 2024 22:33:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sE0K7-000L49-0J;
	Mon, 03 Jun 2024 05:33:36 +0000
Date: Mon, 3 Jun 2024 13:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2715/3461] drivers/gpu/drm/xe/xe_vram.c:335
 xe_vram_probe() error: '%pa' expects argument of type 'phys_addr_t*',
 argument 3 has type 'ullong*'
Message-ID: <202406031311.XygeoYUi-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   861a3cb5a2a8480d361fa6708da24747d6fa72fe
commit: 638d1c79cbf15c14f1bcf98fd8135ea83a04dc50 [2715/3461] drm/xe: Promote VRAM initialization function to own file
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240603 (https://download.01.org/0day-ci/archive/20240603/202406031311.XygeoYUi-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406031311.XygeoYUi-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vram.c:335 xe_vram_probe() error: '%pa' expects argument of type 'phys_addr_t*', argument 3 has type 'ullong*'

Old smatch warnings:
drivers/gpu/drm/xe/xe_vram.c:346 xe_vram_probe() error: '%pa' expects argument of type 'phys_addr_t*', argument 4 has type 'ullong*'

vim +335 drivers/gpu/drm/xe/xe_vram.c

638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  264  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  265  /**
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  266   * xe_vram_probe() - Probe VRAM configuration
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  267   * @xe: the &xe_device
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  268   *
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  269   * Collect VRAM size and offset information for all tiles.
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  270   *
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  271   * Return: 0 on success, error code on failure
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  272   */
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  273  int xe_vram_probe(struct xe_device *xe)
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  274  {
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  275  	struct xe_tile *tile;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  276  	resource_size_t io_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  277  	u64 available_size = 0;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  278  	u64 total_size = 0;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  279  	u64 tile_offset;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  280  	u64 tile_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  281  	u64 vram_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  282  	int err;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  283  	u8 id;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  284  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  285  	if (!IS_DGFX(xe))
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  286  		return 0;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  287  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  288  	/* Get the size of the root tile's vram for later accessibility comparison */
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  289  	tile = xe_device_get_root_tile(xe);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  290  	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  291  	if (err)
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  292  		return err;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  293  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  294  	err = determine_lmem_bar_size(xe);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  295  	if (err)
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  296  		return err;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  297  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  298  	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  299  		 &xe->mem.vram.io_size);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  300  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  301  	io_size = xe->mem.vram.io_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  302  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  303  	/* tile specific ranges */
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  304  	for_each_tile(tile, xe, id) {
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  305  		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  306  		if (err)
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  307  			return err;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  308  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  309  		tile->mem.vram.actual_physical_size = tile_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  310  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  311  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  312  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  313  		if (!tile->mem.vram.io_size) {
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  314  			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  315  			return -ENODEV;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  316  		}
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  317  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  318  		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  319  		tile->mem.vram.usable_size = vram_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  320  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  321  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  322  		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  323  			drm_info(&xe->drm, "Small BAR device\n");
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  324  		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  325  			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  326  		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  327  			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  328  			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  329  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  330  		/* calculate total size using tile size to get the correct HW sizing */
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  331  		total_size += tile_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  332  		available_size += vram_size;
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  333  
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30  334  		if (total_size > xe->mem.vram.io_size) {
638d1c79cbf15c1 Michal Wajdeczko 2024-05-30 @335  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
