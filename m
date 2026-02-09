Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A2C2F5A3D
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651454; cv=none; b=V7XUdDmK5u8CXw/VvteBM387NUkE3QDY3lBn7ZHRuON534hIjHaz7mIkoLFRFdAsifphdFOYwy8mrR5zVInWHjmlPPAgKjVxVEVdrL0YC6cd/eXDJaRL7Q9/MVrBRR+oIWNPJdyaMxA5X0WHj7IGMf90ppYhqtvGXB5rBQ0jA/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651454; c=relaxed/simple;
	bh=q+SCsuB6YoHs0LQ3r17tt3V8ZqFOV2Y6JaxZzT+ietU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpywmHENhQpFg4puNGELbysCyJWPNcMcJHOHNGLUBkMd35kRMwEiLQEBzwuCBDnl9RTIqJ+kwg3cNopHnAeFMaVgymlZ1wV5bP5iqMW3tVO0eIna1uhNcQDKK603rpNGSxq2v7GMfemp7KYDlPmL36EfCJdLznQUpyTUObTy+SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVBEHqTk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVBEHqTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651455; x=1802187455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q+SCsuB6YoHs0LQ3r17tt3V8ZqFOV2Y6JaxZzT+ietU=;
  b=XVBEHqTkOxEEh/7j+YO4UemlshmCdVoc8v47fIV7jWdsF7LIJaMl3Co9
   yD2Z/VvSEcWvSA7UygpFIruRj9gGJ+YPnokFz3MGpfxXXbyLJ609ItB7N
   HhE9I7GUjk6Wq5DOjOoOfwUYvBsdwUSnasKtWZ8pG1HuuuaEkTS2wHuKb
   scwaOZKR5Fsjm9H9+hLx8ucECFoddW9LBCWglQc5qayOLgJhaHDWv37sJ
   c+Iw4FertjPVGywub3lesaMF93S1PO20AvvBcEFiFa4pifO+nkwgJgiCF
   Nt0e6CB3G6xVofHs+mDsAHaL7zriqGI4pTLK9IKUpM7Ux47dposvXB2PV
   Q==;
X-CSE-ConnectionGUID: 8c69d1MVR9elIlYBEp+nfQ==
X-CSE-MsgGUID: KMQ0ePIuTeidXJ67ZgACXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71665083"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71665083"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:34 -0800
X-CSE-ConnectionGUID: ehS1ZE+0S36kY2sn3bATtg==
X-CSE-MsgGUID: 2FxEORCfTyGCR3wDz4WrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211627469"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 07:37:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTKM-00000000o4w-2DBy;
	Mon, 09 Feb 2026 15:37:30 +0000
Date: Mon, 9 Feb 2026 23:37:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 14/20] mm: swap: decouple virtual swap slot from
 backing store
Message-ID: <202602092300.lZO4Ee4N-lkp@intel.com>
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
In-Reply-To: <20260208215839.87595-15-nphamcs@gmail.com>
References: <20260208215839.87595-15-nphamcs@gmail.com>
TO: Nhat Pham <nphamcs@gmail.com>
TO: linux-mm@kvack.org
CC: akpm@linux-foundation.org
CC: hannes@cmpxchg.org
CC: hughd@google.com
CC: yosry.ahmed@linux.dev
CC: mhocko@kernel.org
CC: roman.gushchin@linux.dev
CC: shakeel.butt@linux.dev
CC: muchun.song@linux.dev
CC: len.brown@intel.com
CC: chengming.zhou@linux.dev
CC: kasong@tencent.com
CC: chrisl@kernel.org
CC: huang.ying.caritas@gmail.com
CC: ryan.roberts@arm.com
CC: shikemeng@huaweicloud.com
CC: viro@zeniv.linux.org.uk
CC: baohua@kernel.org
CC: bhe@redhat.com
CC: osalvador@suse.de
CC: lorenzo.stoakes@oracle.com
CC: christophe.leroy@csgroup.eu
CC: pavel@kernel.org
CC: kernel-team@meta.com
CC: linux-kernel@vger.kernel.org
CC: cgroups@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: peterx@redhat.com
CC: riel@surriel.com
CC: joshua.hahnjy@gmail.com

Hi Nhat,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Nhat-Pham/mm-swap-decouple-swap-cache-from-physical-swap-infrastructure/20260209-120606
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260208215839.87595-15-nphamcs%40gmail.com
patch subject: [PATCH v3 14/20] mm: swap: decouple virtual swap slot from backing store
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc-randconfig-r073-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092300.lZO4Ee4N-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602092300.lZO4Ee4N-lkp@intel.com/

smatch warnings:
mm/vswap.c:733 vswap_alloc_swap_slot() warn: variable dereferenced before check 'folio' (see line 701)

vim +/folio +733 mm/vswap.c

19a5fe94e9aae4 Nhat Pham 2026-02-08  682  
19a5fe94e9aae4 Nhat Pham 2026-02-08  683  /**
19a5fe94e9aae4 Nhat Pham 2026-02-08  684   * vswap_alloc_swap_slot - allocate physical swap space for a folio that is
19a5fe94e9aae4 Nhat Pham 2026-02-08  685   *                         already associated with virtual swap slots.
19a5fe94e9aae4 Nhat Pham 2026-02-08  686   * @folio: folio we want to allocate physical swap space for.
19a5fe94e9aae4 Nhat Pham 2026-02-08  687   *
19a5fe94e9aae4 Nhat Pham 2026-02-08  688   * Note that this does NOT release existing swap backends of the folio.
19a5fe94e9aae4 Nhat Pham 2026-02-08  689   * Callers need to handle this themselves.
19a5fe94e9aae4 Nhat Pham 2026-02-08  690  
19a5fe94e9aae4 Nhat Pham 2026-02-08  691   * Return: true if the folio is now backed by physical swap slots, false
19a5fe94e9aae4 Nhat Pham 2026-02-08  692   * otherwise.
19a5fe94e9aae4 Nhat Pham 2026-02-08  693   */
19a5fe94e9aae4 Nhat Pham 2026-02-08  694  bool vswap_alloc_swap_slot(struct folio *folio)
19a5fe94e9aae4 Nhat Pham 2026-02-08  695  {
19a5fe94e9aae4 Nhat Pham 2026-02-08  696  	int i, nr = folio_nr_pages(folio);
19a5fe94e9aae4 Nhat Pham 2026-02-08  697  	struct vswap_cluster *cluster = NULL;
19a5fe94e9aae4 Nhat Pham 2026-02-08  698  	struct swap_info_struct *si;
19a5fe94e9aae4 Nhat Pham 2026-02-08  699  	struct swap_cluster_info *ci;
19a5fe94e9aae4 Nhat Pham 2026-02-08  700  	swp_slot_t slot = { .val = 0 };
19a5fe94e9aae4 Nhat Pham 2026-02-08 @701  	swp_entry_t entry = folio->swap;
19a5fe94e9aae4 Nhat Pham 2026-02-08  702  	struct swp_desc *desc;
19a5fe94e9aae4 Nhat Pham 2026-02-08  703  	bool fallback = false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  704  
19a5fe94e9aae4 Nhat Pham 2026-02-08  705  	/*
19a5fe94e9aae4 Nhat Pham 2026-02-08  706  	 * We might have already allocated a backing physical swap slot in past
19a5fe94e9aae4 Nhat Pham 2026-02-08  707  	 * attempts (for instance, when we disable zswap). If the entire range is
19a5fe94e9aae4 Nhat Pham 2026-02-08  708  	 * already swapfile-backed we can skip swapfile case.
19a5fe94e9aae4 Nhat Pham 2026-02-08  709  	 */
19a5fe94e9aae4 Nhat Pham 2026-02-08  710  	if (vswap_swapfile_backed(entry, nr))
19a5fe94e9aae4 Nhat Pham 2026-02-08  711  		return true;
19a5fe94e9aae4 Nhat Pham 2026-02-08  712  
19a5fe94e9aae4 Nhat Pham 2026-02-08  713  	if (swap_slot_alloc(&slot, folio_order(folio)))
19a5fe94e9aae4 Nhat Pham 2026-02-08  714  		return false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  715  
19a5fe94e9aae4 Nhat Pham 2026-02-08  716  	if (!slot.val)
19a5fe94e9aae4 Nhat Pham 2026-02-08  717  		return false;
19a5fe94e9aae4 Nhat Pham 2026-02-08  718  
7f88e3ea20f231 Nhat Pham 2026-02-08  719  	/* establish the vrtual <-> physical swap slots linkages. */
7f88e3ea20f231 Nhat Pham 2026-02-08  720  	si = __swap_slot_to_info(slot);
7f88e3ea20f231 Nhat Pham 2026-02-08  721  	ci = swap_cluster_lock(si, swp_slot_offset(slot));
7f88e3ea20f231 Nhat Pham 2026-02-08  722  	vswap_rmap_set(ci, slot, entry.val, nr);
7f88e3ea20f231 Nhat Pham 2026-02-08  723  	swap_cluster_unlock(ci);
7f88e3ea20f231 Nhat Pham 2026-02-08  724  
7f88e3ea20f231 Nhat Pham 2026-02-08  725  	rcu_read_lock();
7f88e3ea20f231 Nhat Pham 2026-02-08  726  	for (i = 0; i < nr; i++) {
7f88e3ea20f231 Nhat Pham 2026-02-08  727  		desc = vswap_iter(&cluster, entry.val + i);
7f88e3ea20f231 Nhat Pham 2026-02-08  728  		VM_WARN_ON(!desc);
7f88e3ea20f231 Nhat Pham 2026-02-08  729  
19a5fe94e9aae4 Nhat Pham 2026-02-08  730  		if (desc->type == VSWAP_FOLIO) {
19a5fe94e9aae4 Nhat Pham 2026-02-08  731  			/* case 1: fallback from zswap store failure */
19a5fe94e9aae4 Nhat Pham 2026-02-08  732  			fallback = true;
19a5fe94e9aae4 Nhat Pham 2026-02-08 @733  			if (!folio)
19a5fe94e9aae4 Nhat Pham 2026-02-08  734  				folio = desc->swap_cache;
19a5fe94e9aae4 Nhat Pham 2026-02-08  735  			else
19a5fe94e9aae4 Nhat Pham 2026-02-08  736  				VM_WARN_ON(folio != desc->swap_cache);
19a5fe94e9aae4 Nhat Pham 2026-02-08  737  		} else {
19a5fe94e9aae4 Nhat Pham 2026-02-08  738  			/*
19a5fe94e9aae4 Nhat Pham 2026-02-08  739  			 * Case 2: zswap writeback.
19a5fe94e9aae4 Nhat Pham 2026-02-08  740  			 *
19a5fe94e9aae4 Nhat Pham 2026-02-08  741  			 * No need to free zswap entry here - it will be freed once zswap
19a5fe94e9aae4 Nhat Pham 2026-02-08  742  			 * writeback suceeds.
19a5fe94e9aae4 Nhat Pham 2026-02-08  743  			 */
19a5fe94e9aae4 Nhat Pham 2026-02-08  744  			VM_WARN_ON(desc->type != VSWAP_ZSWAP);
19a5fe94e9aae4 Nhat Pham 2026-02-08  745  			VM_WARN_ON(fallback);
19a5fe94e9aae4 Nhat Pham 2026-02-08  746  		}
19a5fe94e9aae4 Nhat Pham 2026-02-08  747  		desc->type = VSWAP_SWAPFILE;
7f88e3ea20f231 Nhat Pham 2026-02-08  748  		desc->slot.val = slot.val + i;
7f88e3ea20f231 Nhat Pham 2026-02-08  749  	}
7f88e3ea20f231 Nhat Pham 2026-02-08  750  	spin_unlock(&cluster->lock);
7f88e3ea20f231 Nhat Pham 2026-02-08  751  	rcu_read_unlock();
19a5fe94e9aae4 Nhat Pham 2026-02-08  752  	return true;
7f88e3ea20f231 Nhat Pham 2026-02-08  753  }
7f88e3ea20f231 Nhat Pham 2026-02-08  754  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
