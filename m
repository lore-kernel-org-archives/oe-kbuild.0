Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE22190685
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730876176; cv=none; b=tsFbBgLJCT+GgUDH2ZXX2q5o+Yu7b8//vTpfwZbyqRnTtePXjOJII0xg53xZNpQB1Lj3S5QrT3T/toOSHrufxMtseaeUjN8yzleJaLbDG1X1Qe8k2ixtf2Z7u0vaF9Sc6YSv7UzBKhJRgWi95J8UZV04OXsv4SirEGE2PFpXtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730876176; c=relaxed/simple;
	bh=vNFVygm4ngnC2zChPwulTb+7MUD6swECE31n5F1qfLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6qtazwjKhtoULhZuPMCeX2gbGjWz55doH/8RgEk3SfIsWWVF+XXZlwyt+GRaxmUg3VrJ1gk67QPXRSo+HqekzxPk4J7eTJJ8eWBEFoeR6Ih9FnK2lO65zDqZESblLifwJ3AFohvU94IZmLVScc1Sr1Cypc6o+vkszeyQ1Yrxtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acZ1QOW2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acZ1QOW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730876173; x=1762412173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vNFVygm4ngnC2zChPwulTb+7MUD6swECE31n5F1qfLk=;
  b=acZ1QOW23WzjpDy1H2fUqJA7WApx0UdN2GDN6M2kRZDIx5rFyQb5BxMc
   2C97RrF7vl8kHxrlVOjlTAEomLSrzgc/wpiOw2qsD/JO7nmkD5qNv1gLL
   f7t3RVUwvRa0RYtQv1Pcjh9jw3vmjqTzl8HaAI6gx+dkPLCH/zUbKj4q0
   Axrxrz3W+abhMzuYbo66rVVsExaI+xNtOlyVJOP5lLTNOde+Qq30+DkB9
   OuCy+jICIqDXMC58d5DfF2SMLSgzuK840PnKDxpp0WONeygqvS4LEzq+F
   hdByjuGN1w+YHyDatBLEoyP7qqTM46+P559+PcDSTYkZ2wtTQPzc6bbQb
   A==;
X-CSE-ConnectionGUID: 33OS8HXIRf2ZA9awYhL+7g==
X-CSE-MsgGUID: LA8V1rIsSaCQ2t8NEY/vgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41207037"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41207037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 22:56:13 -0800
X-CSE-ConnectionGUID: tlhEOAliSw+3TcmbeKccAw==
X-CSE-MsgGUID: Qfxv88qlRs6YKrldvc290A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84283975"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 22:56:12 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ZxZ-000n1c-2r;
	Wed, 06 Nov 2024 06:56:09 +0000
Date: Wed, 6 Nov 2024 14:55:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vbabka:b4/slub-percpu-sheaves 8/9] mm/slub.c:4932
 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'
Message-ID: <202411061426.Ztzp9ABZ-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slub-percpu-sheaves
head:   c2ef14761b7d660275c07a6f6c53db215045bcfc
commit: 7b79b3645d1e8aa28c52bcf891b8d3d59eb2bf1e [8/9] mm, slub: sheaf prefilling
:::::: branch date: 12 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-141-20241106 (https://download.01.org/0day-ci/archive/20241106/202411061426.Ztzp9ABZ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411061426.Ztzp9ABZ-lkp@intel.com/

smatch warnings:
mm/slub.c:4932 kmem_cache_prefill_sheaf() warn: returning freed memory 'sheaf'

vim +/sheaf +4932 mm/slub.c

81819f0fc8285a Christoph Lameter 2007-05-06  4898  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4899  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4900  struct slab_sheaf *
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4901  kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int count)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4902  {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4903  	struct slub_percpu_sheaves *pcs;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4904  	struct slab_sheaf *sheaf = NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4905  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4906  	//TODO: handle via oversize sheaf
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4907  	if (count > s->sheaf_capacity)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4908  		return NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4909  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4910  	pcs = cpu_sheaves_lock(s->cpu_sheaves);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4911  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4912  	if (pcs->spare && pcs->spare->size > 0) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4913  		sheaf = pcs->spare;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4914  		pcs->spare = NULL;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4915  	}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4916  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4917  	if (!sheaf)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4918  		sheaf = barn_get_full_or_empty_sheaf(pcs->barn);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4919  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4920  	cpu_sheaves_unlock(s->cpu_sheaves);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4921  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4922  	if (!sheaf)
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4923  		sheaf = alloc_empty_sheaf(s, gfp);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4924  
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4925  	if (sheaf && sheaf->size < count) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4926  		if (refill_sheaf(s, sheaf, gfp)) {
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4927  			sheaf_flush(s, sheaf);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4928  			free_empty_sheaf(s, sheaf);
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4929  		}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4930  	}
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4931  
7b79b3645d1e8a Vlastimil Babka   2024-11-05 @4932  	return sheaf;
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4933  }
7b79b3645d1e8a Vlastimil Babka   2024-11-05  4934  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
