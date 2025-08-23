Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE481C6FE9
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 21:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755985426; cv=none; b=bCoHfpsJw5R9mRLYrc0toGRFU9Esdnw6ABjrgp7h4Vj6Ohx9JhWsNtVyATKPa6lu6To+smkOlkee9OuG0ehJ9R6kR2qE4++VzcVcbWvNV20tPm6bp25L+kOVey+pMHYBfwMasQ0IvPllqCakEMM/fgmQFx1vHOHampYAJxy4VdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755985426; c=relaxed/simple;
	bh=Xq59hanMxo2Rp1ymb/FJitCN/vXaNFfJeUHCK0kgMzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+dvSntCX3CoBnuk+b+H5VQdEKoSiFhJk19tPXL8Y5t65R5I2BwPKbGAx1bv3qM4hsoGk3rGJnH/KJUpogQfZd0xNKSsIdzvsE5PyD7O6SJy95ZubGfDYErxwYE/u3SPwjZAOsCuO/kbiRN9o0ybkF4tXQtIYotZ/OlakhzsTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCo+PGfb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCo+PGfb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755985425; x=1787521425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xq59hanMxo2Rp1ymb/FJitCN/vXaNFfJeUHCK0kgMzU=;
  b=XCo+PGfb4kZMVV3+q31jyXpQYrakWW3tm/Y5rzez/F42Ti7BOE+3VTa8
   0jtjT+I1LxdlbXIu2APg3ZgkaRAfEqvNyRl7o8Tr5iYc/HwIiUDtjHc73
   hmI/bPQOD2J9Toxpq9hDRK6xm3RpPxkaYIAt7U5uzX+UCfaQCswKBiCmv
   OJUh4C1owpJGczXwei3Nr4gI8gSSF/Su7IE+xIGaA5J2GLXFgndAWTI0h
   CDLG551i+fufQ18bcf19XSy6jT47lQoKTI/2yAZ4SY4MNGZs7J9tfZwxg
   CeZGD+7cDCfPZbKL0uubZyx/uGeL5EUuSF9olh01On4Fw1ZXnHyTNtV6q
   A==;
X-CSE-ConnectionGUID: kVNt7QBIT2Wja1cMbLVBZw==
X-CSE-MsgGUID: sJUt/a1yTB6VcMQ2z2pvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57450777"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57450777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 14:43:44 -0700
X-CSE-ConnectionGUID: TqFhiCdFSs+jtKb00KP7hA==
X-CSE-MsgGUID: vQvfemcAQR+WtiarKzBgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169343463"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2025 14:43:43 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upw1V-000McR-08;
	Sat, 23 Aug 2025 21:43:41 +0000
Date: Sun, 24 Aug 2025 05:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] drm/buddy: Separate clear and dirty free block
 trees
Message-ID: <202508240549.GAzSUrH0-lkp@intel.com>
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
In-Reply-To: <20250821150641.2720-2-Arunpravin.PaneerSelvam@amd.com>
References: <20250821150641.2720-2-Arunpravin.PaneerSelvam@amd.com>
TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
TO: christian.koenig@amd.com
TO: matthew.auld@intel.com
TO: dri-devel@lists.freedesktop.org
TO: amd-gfx@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: alexander.deucher@amd.com
CC: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Hi Arunpravin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arunpravin-Paneer-Selvam/drm-buddy-Separate-clear-and-dirty-free-block-trees/20250821-231446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250821150641.2720-2-Arunpravin.PaneerSelvam%40amd.com
patch subject: [PATCH v3 2/2] drm/buddy: Separate clear and dirty free block trees
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240549.GAzSUrH0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508240549.GAzSUrH0-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_buddy.c:571 drm_buddy_reset_clear() error: uninitialized symbol 'order'.

vim +/order +571 drivers/gpu/drm/drm_buddy.c

92937f170d3f49 Arunpravin               2022-02-22  540  
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  541  /**
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  542   * drm_buddy_reset_clear - reset blocks clear state
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  543   *
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  544   * @mm: DRM buddy manager
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  545   * @is_clear: blocks clear state
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  546   *
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  547   * Reset the clear state based on @is_clear value for each block
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  548   * in the freelist.
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  549   */
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  550  void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  551  {
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  552  	enum free_tree src_tree, dst_tree;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  553  	u64 root_size, size, start;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  554  	unsigned int order;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  555  	int i;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  556  
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  557  	size = mm->size;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  558  	for (i = 0; i < mm->n_roots; ++i) {
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  559  		order = ilog2(size) - ilog2(mm->chunk_size);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  560  		start = drm_buddy_block_offset(mm->roots[i]);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  561  		__force_merge(mm, start, start + size, order);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  562  
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  563  		root_size = mm->chunk_size << order;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  564  		size -= root_size;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  565  	}
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  566  
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  567  	src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  568  	dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  569  
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  570  	for (i = 0; i <= mm->max_order; ++i) {
7888c930728781 Arunpravin Paneer Selvam 2025-08-21 @571  		struct rb_root *root = get_root(mm, order, src_tree);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  572  		struct drm_buddy_block *block;
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  573  
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  574  		for_each_rb_free_block_reverse(block, root, rb) {
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  575  			rbtree_remove(mm, block);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  576  			if (is_clear) {
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  577  				mark_cleared(block);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  578  				mm->clear_avail += drm_buddy_block_size(mm, block);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  579  			} else {
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  580  				clear_reset(block);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  581  				mm->clear_avail -= drm_buddy_block_size(mm, block);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  582  			}
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  583  
7888c930728781 Arunpravin Paneer Selvam 2025-08-21  584  			rbtree_insert(mm, block, dst_tree);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  585  		}
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  586  	}
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  587  }
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  588  EXPORT_SYMBOL(drm_buddy_reset_clear);
95a16160ca1d75 Arunpravin Paneer Selvam 2025-07-16  589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
