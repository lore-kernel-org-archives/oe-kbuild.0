Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060693;
	b=UvLEp49KJc4GocQYin4e1E6DdI/RhK76UfCKoeKgr0fSS4bxs9c6xu0ob3VTCG6Hcbqg
	 G8s3p+lAU/zVxXWPRcV9RZ3xf3w1MadEDEFlEJF54f55olMNoyMULPvLtvwV0LbNXioft
	 wRjP56uFBIYZVkia1AvhqgwUybCBSVpNQDPhv5M9iar6LulZqFizfnWDsKjdzxdXvJomo
	 FBNaRQeiOSnxGaj92vidinZyWC75BjaELQ5Etsqv9fgb08ntk3xCWR/+SMZ6GCU76I1B5
	 fTMeh9fCYWsRRHfQo+f+cWUrqnK9EeRNr2SZ9c9Fp3Uyit+LVbdUfxIQ+cWelglpG1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060693;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ZjrBhpkmCaeqgeV4W+i+3IFhjNfm7VIaYtaHsNHvS10=;
	b=em03Zb4QYHMXzjBy4muGVkZ++USfkK9+98eByq+R4+rlETxnOspq3wzdfA0fJyTy+bTc
	 o1U/qikO4FjIJ0xsSRy96xaJlT7FoPAA9j44Zy8rDQwepsRBli4RuhagO4xcjF5N1+eKK
	 MqQMBnf8xKhH9vLDP8RL3J1fXlJHj9epmD3s62r4UBPjwGn/h2DTgH92psRzCIxMraIki
	 xo9gTMNjOEsUkNSlBHqtlI+lZRbc+5PntNNp1AHBfTGGGh0JUDDN4P3eiXb0AuQh90VEX
	 9ZGGvJAVW0kDHSIx5WYu5ndGa55zwaizlb9Vazml3Fcq19tOc7djYD4PxEGxcyKWASA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHBLf8UN;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9817606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 14:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9817606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MHBLf8UN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794060691; x=1825596691;
  h=date:from:to:cc:subject:message-id;
  bh=s/kEXiCeTS+aKOXD4K+UitrJ+dzopKld2ufqKkiUHHo=;
  b=MHBLf8UNALL8UiWAs559+e9rxvjSTguuN0j+4kAIVBzeLwnABeiwKebq
   46W7eVd8uzdP6LOFTvsGcm9knaCyOVqxVEiM12mfmIY+/aazQF+ZRU2Nr
   T7gQ3oJ67AguvmGq3VWB+COeA70R5tNYwdQi9BP6ORopLAukMXRZ4Hcf4
   shLv3XUQXzCXHlvLhkFnGve7hV25uGzaiaNms43ByBc1rkDqQ8+8LWLjS
   vcZVH8LGqZ7y0/mIlypEX1oHaM3jw2wR97d2ZF1QqmpR4HnZEABpZQ1eR
   vH1SSDczbkPUpvgEN5LjW3WTzh4jsI1v6EKMoAhRiKfX6gxeLqY6rl/K5
   A==;
X-CSE-ConnectionGUID: 7XminODFRq6i72tw/fb4uQ==
X-CSE-MsgGUID: TBr14cHVTuqYShB7FvWlVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2733582"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2733582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 06:11:30 -0800
X-CSE-ConnectionGUID: 796DK5Y6Q+6MSfqX5THsuQ==
X-CSE-MsgGUID: g1AfqTtfRXOhYtxCWhpnSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7837430"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2026 06:11:29 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPh8h-00000000Afn-01LO;
	Sat, 07 Nov 2026 14:11:27 +0000
Date: Sat, 07 Nov 2026 15:11:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_ct.c:117:11-20: ERROR:
 __cleanup(kfree) will cause an invalid free: the stack address of the
 annotated variable will be passed to kfree; declare the variable using
 __free(kfree) to cause the pointee to be freed
Message-ID: <202611071504.Sfm2Y3U5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d48723711bae9b8cdc56719c448ba42fef28cbee
commit: ea944d57eac746f9bd9056134751708c48084207 drm/xe/guc_ct: Cleanup ifdef'ry
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-2104-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071504.Sfm2Y3U5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea944d57eac7 ("drm/xe/guc_ct: Cleanup ifdef'ry")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611071504.Sfm2Y3U5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_ct.c:117:11-20: ERROR: __cleanup(kfree) will cause an invalid free: the stack address of the annotated variable will be passed to kfree; declare the variable using __free(kfree) to cause the pointee to be freed

vim +117 drivers/gpu/drm/xe/xe_guc_ct.c

ea944d57eac746f Lucas De Marchi 2025-11-19  112  
ea944d57eac746f Lucas De Marchi 2025-11-19  113  static void fast_req_dump(struct xe_guc_ct *ct, u16 fence, unsigned int slot)
ea944d57eac746f Lucas De Marchi 2025-11-19  114  {
ea944d57eac746f Lucas De Marchi 2025-11-19  115  	struct xe_gt *gt = ct_to_gt(ct);
ea944d57eac746f Lucas De Marchi 2025-11-19  116  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
ea944d57eac746f Lucas De Marchi 2025-11-19 @117  	char *buf __cleanup(kfree) = kmalloc(SZ_4K, GFP_NOWAIT);
ea944d57eac746f Lucas De Marchi 2025-11-19  118  
ea944d57eac746f Lucas De Marchi 2025-11-19  119  	if (buf && stack_depot_snprint(ct->fast_req[slot].stack, buf, SZ_4K, 0))
ea944d57eac746f Lucas De Marchi 2025-11-19  120  		xe_gt_err(gt, "Fence 0x%x was used by action %#04x sent at:\n%s\n",
ea944d57eac746f Lucas De Marchi 2025-11-19  121  			  fence, ct->fast_req[slot].action, buf);
ea944d57eac746f Lucas De Marchi 2025-11-19  122  	else
ea944d57eac746f Lucas De Marchi 2025-11-19  123  		xe_gt_err(gt, "Fence 0x%x was used by action %#04x [failed to retrieve stack]\n",
ea944d57eac746f Lucas De Marchi 2025-11-19  124  			  fence, ct->fast_req[slot].action);
ea944d57eac746f Lucas De Marchi 2025-11-19  125  #else
ea944d57eac746f Lucas De Marchi 2025-11-19  126  	xe_gt_err(gt, "Fence 0x%x was used by action %#04x\n",
ea944d57eac746f Lucas De Marchi 2025-11-19  127  		  fence, ct->fast_req[slot].action);
ea944d57eac746f Lucas De Marchi 2025-11-19  128  #endif
ea944d57eac746f Lucas De Marchi 2025-11-19  129  }
ea944d57eac746f Lucas De Marchi 2025-11-19  130  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
