Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ED733F377
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 04:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785038862; cv=none; b=s3yRLzRmbSX7X4UnZeWfxDx2vVWY9JaGgNoI+dZhQlIvFNVbeWKN35D7rhqkA7cGik2sBzu/WUxgo45nPiN09Ah0nnk49oa7psWYDgJDkwUCxyyLhuexGBgGi97AlmoNUsbdXndy9hRJFETHHClPIUqqXSotsAotOmCT4Q/lYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785038862; c=relaxed/simple;
	bh=gd6BM445LHCaG2Hwivd9aV+kFL1ystLB7msC8J/YmxM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=otiS/qrW7P+rr2ixNTAF6DSRh+TJo0A2xgpFDZnxyFs3etWivv+aQBe+p8ePQM9c4X5ehNUqq/qkewXXbjIR909C7sMrj43d09iix8NmRoq3XXGQXcw6IFTDiqD5oYpAzYuRED6a6obglVYPgr027Rdm83N6ydNvQPwb2Wbs0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4FmMHis; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4FmMHis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785038860; x=1816574860;
  h=date:from:to:cc:subject:message-id;
  bh=gd6BM445LHCaG2Hwivd9aV+kFL1ystLB7msC8J/YmxM=;
  b=d4FmMHisoYB+Otlv+OFgQZz/lESk43A7krYqslclYIeWdAek1RJH+dEu
   IWFIoMc0EekealKJx+yKGA0nRz4NhbQ5jfrQNiNhQmh4PgnElPa8+hokF
   OdzOV3AI2tEM8quwKScXb3Rc/8Y7TcKNKd1bBACapbKmAONL6U4qzMApP
   8uMzx6guJhPrDyu75bJtT8RGBPFPk/yw+b78ejXH2/H8zk9Y7l7LNAdrC
   s3DtWytFn1bUV2Nq5Uj5A5NTS/XaEjTjM1c0iDsvboQCz7L5lnQ/20+n4
   SdmnR1SL9lr35fHKdwGZji/MbLX3NR2dk6Qz+5Di0RBe4UMRgx5tdNo/a
   Q==;
X-CSE-ConnectionGUID: o6ZYaNS8SIqtDhaQAAfl6w==
X-CSE-MsgGUID: mECPfLhfT/qgna91aSFHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85835042"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="85835042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 21:07:39 -0700
X-CSE-ConnectionGUID: 7Y3w+WNYTayBHCPQIpzSEg==
X-CSE-MsgGUID: TegS5KpRTrGDEr5XP+l8jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="283590829"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jul 2026 21:07:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnq9H-00000000cGd-2cN1;
	Sun, 26 Jul 2026 04:07:35 +0000
Date: Sun, 26 Jul 2026 12:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:b4/objext_split 18/20] mm/slab_common.c:1005
 new_kmalloc_cache() warn: bitwise AND condition is false here
Message-ID: <202607261113.qeGOoAYg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
CC: Hao Li <hao.li@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/objext_split
head:   fdc90eeb9c4ea57fc40590b2e91edf1c7b7cd9e8
commit: ac8c98b4bf14cd70e9815db4d8fa54879b24fc91 [18/20] mm/slab: add cache_ and slab_needs_objcg() helpers
:::::: branch date: 34 hours ago
:::::: commit date: 35 hours ago
config: alpha-randconfig-r071-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261113.qeGOoAYg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607261113.qeGOoAYg-lkp@intel.com/

smatch warnings:
mm/slab_common.c:1005 new_kmalloc_cache() warn: bitwise AND condition is false here

vim +1005 mm/slab_common.c

3c615294058429 GONG, Ruiqi            2023-07-14   992  
13e680fb6a1e77 Waiman Long            2021-06-28   993  	/*
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   994) 	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   995) 	 * aliased with any other type, make sure it's never merged with any other
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   996) 	 * cache.
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   997) 	 *
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   998) 	 * In other cases the kmalloc cache may end up being used for a
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09   999) 	 * __GFP_ACCOUNT allocation so mark it as such. The exception is a
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09  1000) 	 * KMALLOC_NO_OBJ_EXT cache.
13e680fb6a1e77 Waiman Long            2021-06-28  1001  	 */
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09  1002) 	if (!mem_cgroup_kmem_disabled()) {
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09  1003) 		if (type == KMALLOC_NORMAL && KMALLOC_RECLAIM != KMALLOC_NORMAL)
d5bf485746991c Vlastimil Babka        2023-06-13  1004  			flags |= SLAB_NO_MERGE;
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09 @1005) 		else if (!(flags & SLAB_NO_OBJ_EXT))
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09  1006) 			flags |= SLAB_MAY_ACCOUNT;
ac8c98b4bf14cd Vlastimil Babka (SUSE  2026-07-09  1007) 	}
d5bf485746991c Vlastimil Babka        2023-06-13  1008  
963e84b0f26229 Catalin Marinas        2023-06-12  1009  	if (minalign > ARCH_KMALLOC_MINALIGN) {
963e84b0f26229 Catalin Marinas        2023-06-12  1010  		aligned_size = ALIGN(aligned_size, minalign);
963e84b0f26229 Catalin Marinas        2023-06-12  1011  		aligned_idx = __kmalloc_index(aligned_size, false);
963e84b0f26229 Catalin Marinas        2023-06-12  1012  	}
963e84b0f26229 Catalin Marinas        2023-06-12  1013  
963e84b0f26229 Catalin Marinas        2023-06-12  1014  	if (!kmalloc_caches[type][aligned_idx])
963e84b0f26229 Catalin Marinas        2023-06-12  1015  		kmalloc_caches[type][aligned_idx] = create_kmalloc_cache(
963e84b0f26229 Catalin Marinas        2023-06-12  1016  					kmalloc_info[aligned_idx].name[type],
963e84b0f26229 Catalin Marinas        2023-06-12  1017  					aligned_size, flags);
963e84b0f26229 Catalin Marinas        2023-06-12  1018  	if (idx != aligned_idx)
963e84b0f26229 Catalin Marinas        2023-06-12  1019  		kmalloc_caches[type][idx] = kmalloc_caches[type][aligned_idx];
a9730fca9946f3 Christoph Lameter      2015-06-29  1020  }
a9730fca9946f3 Christoph Lameter      2015-06-29  1021  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
