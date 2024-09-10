Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93C136E18
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 02:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725934547; cv=none; b=aSY+sYsk4laO0XNNyuGRQllnlLx5fL9hCpwza2XPI5sffBpZ/Y9QGK3Kdf76BtCXP2pEU0+6/wLKNEgnMVL/Jo2EobJB0wX08+0OormGHNi2zQ9VDFVfZ0RIaLtchTlafFcy7mMdgbKFdGkF1170yGQ7wzGj42dsU1gMGZbJ2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725934547; c=relaxed/simple;
	bh=z+IOrJveRuBMDpzPvKX48ddRs+M5jIXFlI/77VdJ77w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqnnU0+NjfhWLNFSg+hq7/Q5yKs9ELZX8qj0mqI1xfKbQXnCdH23xqlxzlqEUPLgBWj94CophsAH3jNoarVDJQVt787VnCuSy9kVcbogZc1audFN6f/nTZ1Uj68llzC5xYkZQ3Dh6j5e2OQyJHMLfV8J2QWx83eqCBfmFWRRTqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeNG1kIP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeNG1kIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725934545; x=1757470545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z+IOrJveRuBMDpzPvKX48ddRs+M5jIXFlI/77VdJ77w=;
  b=CeNG1kIPGCPHJ12vwW9fZ2bpRFannqK3jT/a5EVg/NqaUnV4BzjsLdQ3
   EylN1xgsZgp/0drqAG0dK7Pzxe7hrGvKQLkOdB9amymFrJuYLUASeBaMp
   bosV57yfGSFz6HKcYv+oPiw1GNvSVhjRSP+c+yzVwTF6oK48xicHq5Cy6
   z1m4DQprxPFAgEXs0ygLxdjPbNHTL853B7fOZJTjLwV7bXUVQPpkrGZu9
   r+ODYeN6iZgiT1YLI4HkVM6l6ndvqNQed/vSpr6AFroq+B1CuOU0CQ5lG
   YH3wQ5D9gdXltI5ItlPZ+afPhuapi8xBYDMHEa80Hb8IfDg2W6d1kvraY
   g==;
X-CSE-ConnectionGUID: QnutjmIVR7+AOvQKu1QT+Q==
X-CSE-MsgGUID: nGttIxzdQfyT1cBEdseoMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="36041886"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="36041886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 19:15:43 -0700
X-CSE-ConnectionGUID: a6qrR4x4TsGughO9z4Rg5Q==
X-CSE-MsgGUID: hvJvPpRTQEKqSRNhNA2LVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="66921290"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2024 19:15:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snqPr-000FWs-23;
	Tue, 10 Sep 2024 02:15:39 +0000
Date: Tue, 10 Sep 2024 10:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_vram.c:335 xe_vram_probe() error: '%pa'
 expects argument of type 'phys_addr_t*', argument 3 has type 'ullong*'
Message-ID: <202409101046.6twTmrGk-lkp@intel.com>
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
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc83b4d1f08695e85e85d36f7b803da58010161d
commit: 638d1c79cbf15c14f1bcf98fd8135ea83a04dc50 drm/xe: Promote VRAM initialization function to own file
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409101046.6twTmrGk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409101046.6twTmrGk-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_vram.c:335 xe_vram_probe() error: '%pa' expects argument of type 'phys_addr_t*', argument 3 has type 'ullong*'

Old smatch warnings:
drivers/gpu/drm/xe/xe_vram.c:346 xe_vram_probe() error: '%pa' expects argument of type 'phys_addr_t*', argument 4 has type 'ullong*'

vim +335 drivers/gpu/drm/xe/xe_vram.c

638d1c79cbf15c Michal Wajdeczko 2024-05-30  264  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  265  /**
638d1c79cbf15c Michal Wajdeczko 2024-05-30  266   * xe_vram_probe() - Probe VRAM configuration
638d1c79cbf15c Michal Wajdeczko 2024-05-30  267   * @xe: the &xe_device
638d1c79cbf15c Michal Wajdeczko 2024-05-30  268   *
638d1c79cbf15c Michal Wajdeczko 2024-05-30  269   * Collect VRAM size and offset information for all tiles.
638d1c79cbf15c Michal Wajdeczko 2024-05-30  270   *
638d1c79cbf15c Michal Wajdeczko 2024-05-30  271   * Return: 0 on success, error code on failure
638d1c79cbf15c Michal Wajdeczko 2024-05-30  272   */
638d1c79cbf15c Michal Wajdeczko 2024-05-30  273  int xe_vram_probe(struct xe_device *xe)
638d1c79cbf15c Michal Wajdeczko 2024-05-30  274  {
638d1c79cbf15c Michal Wajdeczko 2024-05-30  275  	struct xe_tile *tile;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  276  	resource_size_t io_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  277  	u64 available_size = 0;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  278  	u64 total_size = 0;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  279  	u64 tile_offset;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  280  	u64 tile_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  281  	u64 vram_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  282  	int err;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  283  	u8 id;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  284  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  285  	if (!IS_DGFX(xe))
638d1c79cbf15c Michal Wajdeczko 2024-05-30  286  		return 0;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  287  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  288  	/* Get the size of the root tile's vram for later accessibility comparison */
638d1c79cbf15c Michal Wajdeczko 2024-05-30  289  	tile = xe_device_get_root_tile(xe);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  290  	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  291  	if (err)
638d1c79cbf15c Michal Wajdeczko 2024-05-30  292  		return err;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  293  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  294  	err = determine_lmem_bar_size(xe);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  295  	if (err)
638d1c79cbf15c Michal Wajdeczko 2024-05-30  296  		return err;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  297  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  298  	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
638d1c79cbf15c Michal Wajdeczko 2024-05-30  299  		 &xe->mem.vram.io_size);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  300  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  301  	io_size = xe->mem.vram.io_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  302  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  303  	/* tile specific ranges */
638d1c79cbf15c Michal Wajdeczko 2024-05-30  304  	for_each_tile(tile, xe, id) {
638d1c79cbf15c Michal Wajdeczko 2024-05-30  305  		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  306  		if (err)
638d1c79cbf15c Michal Wajdeczko 2024-05-30  307  			return err;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  308  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  309  		tile->mem.vram.actual_physical_size = tile_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  310  		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  311  		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  312  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  313  		if (!tile->mem.vram.io_size) {
638d1c79cbf15c Michal Wajdeczko 2024-05-30  314  			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
638d1c79cbf15c Michal Wajdeczko 2024-05-30  315  			return -ENODEV;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  316  		}
638d1c79cbf15c Michal Wajdeczko 2024-05-30  317  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  318  		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  319  		tile->mem.vram.usable_size = vram_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  320  		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  321  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  322  		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
638d1c79cbf15c Michal Wajdeczko 2024-05-30  323  			drm_info(&xe->drm, "Small BAR device\n");
638d1c79cbf15c Michal Wajdeczko 2024-05-30  324  		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
638d1c79cbf15c Michal Wajdeczko 2024-05-30  325  			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  326  		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
638d1c79cbf15c Michal Wajdeczko 2024-05-30  327  			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
638d1c79cbf15c Michal Wajdeczko 2024-05-30  328  			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
638d1c79cbf15c Michal Wajdeczko 2024-05-30  329  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  330  		/* calculate total size using tile size to get the correct HW sizing */
638d1c79cbf15c Michal Wajdeczko 2024-05-30  331  		total_size += tile_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  332  		available_size += vram_size;
638d1c79cbf15c Michal Wajdeczko 2024-05-30  333  
638d1c79cbf15c Michal Wajdeczko 2024-05-30  334  		if (total_size > xe->mem.vram.io_size) {
638d1c79cbf15c Michal Wajdeczko 2024-05-30 @335  			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
