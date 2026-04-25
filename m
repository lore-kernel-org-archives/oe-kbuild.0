Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823611C84CB
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Apr 2026 01:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777079831; cv=none; b=gZmIMSuhDNI5AMlz3PSliWkZq2sZDsIroyNpgdyG3g63KQgV3A0gVUZ6V5nIfYB0yK7L94I3bkkcGYa76KQWjqoaa+V9GsujmUsa8KtcDxsVBvWNoGH4u99jthcSXhyrIxs124Ry0dawa/vZ+hRuhowf6de+UjJRNWs9pPEhCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777079831; c=relaxed/simple;
	bh=Xl3DcYWZ/LZ88+8IiJgB+gWIZgqTPuaHAd+5tw8S7Ow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=esz88itkSFYqvz8UnTqWh0Upy+EmSwy00eTBazuvrbov5/M9VpxDH1eG5dramG/Z4O8o8e2E8RUslL+Qcf0m64f/u3HUOFdO4ND4XRfyvbluK6O7MBndKhN26j+l/bOrqHzRwqJbNRiPi9Ka2OmG7a+TNhVRApuxHcgKQdEE7nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD7VqrWd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD7VqrWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777079829; x=1808615829;
  h=date:from:to:cc:subject:message-id;
  bh=Xl3DcYWZ/LZ88+8IiJgB+gWIZgqTPuaHAd+5tw8S7Ow=;
  b=fD7VqrWddtTqbTxd+TPTRH06n/FaGTbd3Bhmd4KzE98P54TDElPrpusF
   9D9me78DncGPYIiBAROcgLYLcIN9AA5Be2i0zLCHOvGWbixqI4h/SENO2
   Y00BScJ6XTSdGAjQRIoyRCwDEZKLRRgEMkT4o7Vrqy375YklTnNL8Kba9
   6Acn8ZIf6xUnwGZHp/PYTOOz/XjlyvJ/hlZdd9Z2eBsGnNUbEqZ2riyz4
   SRZw1JvxvEISgBcPKLBRMgPc79PldxyVF0An08xqsjN/CZ5R4ZGub/T3/
   oJCxtszuvwvUrVjVnVe/pafIjLPhzlU2CrkWwOOIDw3omQgzQ6Hcpsmqg
   A==;
X-CSE-ConnectionGUID: JmaPvQMBQPe7QEyJjAVJkA==
X-CSE-MsgGUID: llK1EuRISl6oFtz6+nTdDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="81924265"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="81924265"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:17:09 -0700
X-CSE-ConnectionGUID: NineL3wYQb+fCWZ54NBH7A==
X-CSE-MsgGUID: NBgugj7mQSKsag/3ytzywQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; 
   d="scan'208";a="226568973"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2026 18:17:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGRdp-000000003Kr-3FRe;
	Sat, 25 Apr 2026 01:17:05 +0000
Date: Sat, 25 Apr 2026 03:16:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [anolis-intel-cloud:devel-6.6 167/167] mm/slab.h:566:14:
 error: 'cgroup_memory_nokmem' undeclared
Message-ID: <202604250351.MxVTo0A2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: aubrey.li@linux.intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   d74213f3218f32dfb6294e3ebd507edd680f6b3d
commit: e9a0e3dfc6105b270871d6618950986cecfc901f [167/167] mm: introduce slabobj_ext to support slab object extensions
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260425/202604250351.MxVTo0A2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604250351.MxVTo0A2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604250351.MxVTo0A2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/mempool.c:21:
   mm/slab.h: In function 'free_slab_obj_exts':
>> mm/slab.h:566:14: error: 'cgroup_memory_nokmem' undeclared (first use in this function)
     566 |         if (!cgroup_memory_nokmem &&
         |              ^~~~~~~~~~~~~~~~~~~~
   mm/slab.h:566:14: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from mm/kasan/common.c:31:
   mm/kasan/../slab.h: In function 'free_slab_obj_exts':
>> mm/kasan/../slab.h:566:14: error: 'cgroup_memory_nokmem' undeclared (first use in this function)
     566 |         if (!cgroup_memory_nokmem &&
         |              ^~~~~~~~~~~~~~~~~~~~
   mm/kasan/../slab.h:566:14: note: each undeclared identifier is reported only once for each function it appears in


vim +/cgroup_memory_nokmem +566 mm/slab.h

e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  554  
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  555  static inline void free_slab_obj_exts(struct slab *slab)
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  556  {
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  557  	struct slabobj_ext *obj_exts;
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  558  
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  559  	obj_exts = slab_obj_exts(slab);
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  560  	if (!obj_exts)
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  561  		return;
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  562  
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  563  	/* kidled: free the age array stored in the tail slot.
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  564  	 * Only when kmem is enabled (!cgroup_memory_nokmem); when kmem is
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  565  	 * disabled kidled uses the SLAB_AGE path (handled separately). */
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21 @566  	if (!cgroup_memory_nokmem &&
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  567  	    kidled_available_slab(slab_folio(slab), slab->slab_cache)) {
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  568  		unsigned int objects = objs_per_slab(slab->slab_cache, slab);
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  569  		if (likely(obj_exts[objects].objcg))
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  570  			kfree(obj_exts[objects].objcg);
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  571  	}
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  572  
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  573  	kfree(obj_exts);
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  574  	slab->obj_exts = 0;
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  575  }
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  576  #else /* CONFIG_SLAB_OBJ_EXT */
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  577  static int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  578  			       gfp_t gfp, bool new_slab)
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  579  {
e9a0e3dfc6105b Suren Baghdasaryan 2024-03-21  580  	return 0;
8b3c94b88f204d zhongjiang-ali     2022-07-30  581  }
fcf645954e9854 zhongjiang-ali     2022-07-30  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
