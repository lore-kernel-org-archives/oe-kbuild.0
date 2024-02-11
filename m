Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F445F50D
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Feb 2024 03:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707621470; cv=none; b=jLU7a8G5Okf91K0uZdL9dNiEPO/QRI0f/xa3DrLULdsGH5SfHqmwPYbmPQiNkA5jrVkPkW6WCZITJZZcAfY17awh4+ticiENXxG6QYTvuq8c1WGgQljOI16ojK2lVYwzE/UAaqCkVdVUsPjcpV9vsyiW1Ueg7kj5T7UahWq9AO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707621470; c=relaxed/simple;
	bh=9NzIGDDvLXDlKmhSa8+ggrIG7KkhfBc42DxKOcSFqBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fbfg9JwIB5wMw1zAKdn8AyI8mEi2fLpPNyHN2hT5zVQZS/WzsDex/fn7vAytLKOq2m4xIlh0trrN4ASyUsM+lh+xtG7OHHobfP9JkdUJc63kvsVz02PFDNi+9j4Pg72r9az3ZQsJWG7fHQlk+ODkgVoDOAgvo7g+qr0BCSo9PhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kce8+dOX; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kce8+dOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707621468; x=1739157468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9NzIGDDvLXDlKmhSa8+ggrIG7KkhfBc42DxKOcSFqBo=;
  b=Kce8+dOX1nDWLc4kZEE/SK+0srfgLd9wyt+yDmeBBVSOq7Usvog+QRN7
   V/lDAXOktxa4dZU3S89vXG88xQnMTIuhxXRZcQFm5lXzSCNURqxYXwoCO
   OGKVO8A6HqqYnrxiN/qAlVOG0ZIoXVCmlmhiGsiBvbVLd8N9D7GLsa4NI
   5BBswOqvvAl/viCmrSCA7C8UEO66ujsTcalBURhzIytmtt1fBxCLHweLD
   zYmSoVMb3mVCfuhAZzZpbKSq9vcXhEMAP5B9SrPDEKsrfPP9Taphr7ydd
   y/RySpWjiwMGd24rhlGzML53YHWKQtjeiZmXt4RzZ1PcWn6WmFcpqxBBX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="436745416"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="436745416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 19:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2579705"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 19:17:46 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ0Lf-0006I2-0l;
	Sun, 11 Feb 2024 03:17:43 +0000
Date: Sun, 11 Feb 2024 11:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 99/100] drivers/gpu/drm/drm_mm.c:942
 drm_mm_scan_color_evict() error: uninitialized symbol 'hole_start'.
Message-ID: <202402111103.6RjL8nG7-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   3ecfe35aea92fbe3fb5dbb680daa91365c87a7b2
commit: 7ecb9791d32eff651d63f21a0e3f460b5ab4ad5e [99/100] list: leverage list_is_head() for list_entry_is_head()
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20240211 (https://download.01.org/0day-ci/archive/20240211/202402111103.6RjL8nG7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402111103.6RjL8nG7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_mm.c:942 drm_mm_scan_color_evict() error: uninitialized symbol 'hole_start'.
drivers/gpu/drm/drm_mm.c:943 drm_mm_scan_color_evict() error: uninitialized symbol 'hole_end'.

vim +/hole_start +942 drivers/gpu/drm/drm_mm.c

709ea97145c125 Daniel Vetter 2010-07-02  900  
3fa489dabea9a1 Chris Wilson  2016-12-22  901  /**
3fa489dabea9a1 Chris Wilson  2016-12-22  902   * drm_mm_scan_color_evict - evict overlapping nodes on either side of hole
3fa489dabea9a1 Chris Wilson  2016-12-22  903   * @scan: drm_mm scan with target hole
3fa489dabea9a1 Chris Wilson  2016-12-22  904   *
3fa489dabea9a1 Chris Wilson  2016-12-22  905   * After completing an eviction scan and removing the selected nodes, we may
3fa489dabea9a1 Chris Wilson  2016-12-22  906   * need to remove a few more nodes from either side of the target hole if
3fa489dabea9a1 Chris Wilson  2016-12-22  907   * mm.color_adjust is being used.
3fa489dabea9a1 Chris Wilson  2016-12-22  908   *
3fa489dabea9a1 Chris Wilson  2016-12-22  909   * Returns:
3fa489dabea9a1 Chris Wilson  2016-12-22  910   * A node to evict, or NULL if there are no overlapping nodes.
3fa489dabea9a1 Chris Wilson  2016-12-22  911   */
3fa489dabea9a1 Chris Wilson  2016-12-22  912  struct drm_mm_node *drm_mm_scan_color_evict(struct drm_mm_scan *scan)
3fa489dabea9a1 Chris Wilson  2016-12-22  913  {
3fa489dabea9a1 Chris Wilson  2016-12-22  914  	struct drm_mm *mm = scan->mm;
3fa489dabea9a1 Chris Wilson  2016-12-22  915  	struct drm_mm_node *hole;
3fa489dabea9a1 Chris Wilson  2016-12-22  916  	u64 hole_start, hole_end;
3fa489dabea9a1 Chris Wilson  2016-12-22  917  
3fa489dabea9a1 Chris Wilson  2016-12-22  918  	DRM_MM_BUG_ON(list_empty(&mm->hole_stack));
3fa489dabea9a1 Chris Wilson  2016-12-22  919  
3fa489dabea9a1 Chris Wilson  2016-12-22  920  	if (!mm->color_adjust)
3fa489dabea9a1 Chris Wilson  2016-12-22  921  		return NULL;
3fa489dabea9a1 Chris Wilson  2016-12-22  922  
b8ff1802815913 Chris Wilson  2018-02-19  923  	/*
b8ff1802815913 Chris Wilson  2018-02-19  924  	 * The hole found during scanning should ideally be the first element
b8ff1802815913 Chris Wilson  2018-02-19  925  	 * in the hole_stack list, but due to side-effects in the driver it
b8ff1802815913 Chris Wilson  2018-02-19  926  	 * may not be.
b8ff1802815913 Chris Wilson  2018-02-19  927  	 */
b8ff1802815913 Chris Wilson  2018-02-19  928  	list_for_each_entry(hole, &mm->hole_stack, hole_stack) {
3fa489dabea9a1 Chris Wilson  2016-12-22  929  		hole_start = __drm_mm_hole_node_start(hole);
4e64e5539d152e Chris Wilson  2017-02-02  930  		hole_end = hole_start + hole->hole_size;
3fa489dabea9a1 Chris Wilson  2016-12-22  931  
b8ff1802815913 Chris Wilson  2018-02-19  932  		if (hole_start <= scan->hit_start &&
b8ff1802815913 Chris Wilson  2018-02-19  933  		    hole_end >= scan->hit_end)
b8ff1802815913 Chris Wilson  2018-02-19  934  			break;
b8ff1802815913 Chris Wilson  2018-02-19  935  	}
b8ff1802815913 Chris Wilson  2018-02-19  936  
b8ff1802815913 Chris Wilson  2018-02-19  937  	/* We should only be called after we found the hole previously */
b8ff1802815913 Chris Wilson  2018-02-19  938  	DRM_MM_BUG_ON(&hole->hole_stack == &mm->hole_stack);
b8ff1802815913 Chris Wilson  2018-02-19  939  	if (unlikely(&hole->hole_stack == &mm->hole_stack))
b8ff1802815913 Chris Wilson  2018-02-19  940  		return NULL;
b8ff1802815913 Chris Wilson  2018-02-19  941  
3fa489dabea9a1 Chris Wilson  2016-12-22 @942  	DRM_MM_BUG_ON(hole_start > scan->hit_start);
3fa489dabea9a1 Chris Wilson  2016-12-22 @943  	DRM_MM_BUG_ON(hole_end < scan->hit_end);
3fa489dabea9a1 Chris Wilson  2016-12-22  944  
3fa489dabea9a1 Chris Wilson  2016-12-22  945  	mm->color_adjust(hole, scan->color, &hole_start, &hole_end);
3fa489dabea9a1 Chris Wilson  2016-12-22  946  	if (hole_start > scan->hit_start)
3fa489dabea9a1 Chris Wilson  2016-12-22  947  		return hole;
3fa489dabea9a1 Chris Wilson  2016-12-22  948  	if (hole_end < scan->hit_end)
3fa489dabea9a1 Chris Wilson  2016-12-22  949  		return list_next_entry(hole, node_list);
3fa489dabea9a1 Chris Wilson  2016-12-22  950  
3fa489dabea9a1 Chris Wilson  2016-12-22  951  	return NULL;
3fa489dabea9a1 Chris Wilson  2016-12-22  952  }
3fa489dabea9a1 Chris Wilson  2016-12-22  953  EXPORT_SYMBOL(drm_mm_scan_color_evict);
3fa489dabea9a1 Chris Wilson  2016-12-22  954  

:::::: The code at line 942 was first introduced by commit
:::::: 3fa489dabea9a1cb0656e2da90354f7c4e53f890 drm: Apply tight eviction scanning to color_adjust

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
