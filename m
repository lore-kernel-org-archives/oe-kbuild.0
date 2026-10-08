Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5942381EA3
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482699; cv=none; b=j4uqF+GpPvuoKe2qTycVByZ3k8i91cPHRZvKgTPh4P98+Bdmq/OCAHoo1KtSomxFAq4Qq6tbsXloWIF3U+AvYBurieXTUC7KMduEOjqTdpvtoKS5xCSBmNu8nE0MJUll/LninSyV2go32qN8dG7nU4qOaksI4E+nLJGQ6tZ4KTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482699; c=relaxed/simple;
	bh=dgGN5oJGd/8klt+Rv3JEY48Z0zHL8BupV9n89dfLxZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFwssfBdYipcbZkqRT2dj0QrpmWZjiU8Gx3KavTsRYydyxd7T7S5TnPnE/T2zajqAC4CGGlJelxeNgwlWqGd6r98wUiLanJZOwVATfdsmlqmV55HFTHLU++9MMMjfYaNDRyYSm0thbpfZn7UwglgIvcrkmkfDvhdegBRcBIxS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/HQegw0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/HQegw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791482697; x=1823018697;
  h=date:from:to:cc:subject:message-id;
  bh=dgGN5oJGd/8klt+Rv3JEY48Z0zHL8BupV9n89dfLxZk=;
  b=A/HQegw0q/W/Hze6BRZBaZk/H8IcKrlNtJ3UcKUz6bHKw5ad7ihEzN3s
   wqRgVLoUNKD1a1eAgrO1Pnq5QDV1ieij6u+UBTHEJtcVZ1hpkPkpICku0
   zZ1vgFj/uPl6n1apfPfEetbi+TeO2+WmlPnKIdiK0wDGyzDmjuLQOMKSw
   599erviC9h6ZH4LoBJfxlWGUTMbEq+8v4aO2A+PgU8K2nGfVQGWx/dzA9
   3/tCQpCghldlT/tF9/bGkfuE25pUzoi04q3+uPyf2r/yTX4mFbvMf3et1
   mbU7u0oK5SRLq7oE77caAAX9k7IH0XO8m23bcvQpoFoakAe/ib97X/q7M
   Q==;
X-CSE-ConnectionGUID: 5j+6V6PRQfSxeBil2ytMhw==
X-CSE-MsgGUID: 1dhqZznsQyeK8ktyAR0eLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="173222"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="173222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 11:04:56 -0700
X-CSE-ConnectionGUID: YgPapURxRPuamZPl7m6wBQ==
X-CSE-MsgGUID: /ozYPaBPRTSHzdvlHIcorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="199060"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2026 11:04:55 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEsU9-000000005qH-00ze;
	Thu, 08 Oct 2026 18:04:53 +0000
Date: Thu, 08 Oct 2026 20:04:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 591/15343]
 drivers/gpu/drm/amd/ras/core/ras_psp.c:137:15-16: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 136)
Message-ID: <202610081904.S2BQWEmZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: YiPeng Chai <YiPeng.Chai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: ba74c69d0c8c38b7df50a4201e0dc9557d11da95 [591/15343] drm/amdgpu: refactor memory handling to support both external and internal allocation
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-2100-20261008 (https://download.01.org/0day-ci/archive/20261008/202610081904.S2BQWEmZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610081904.S2BQWEmZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/ras/core/ras_psp.c:137:15-16: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 136)

vim +137 drivers/gpu/drm/amd/ras/core/ras_psp.c

c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  125  
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  126  static int ras_psp_free_mem(struct ras_core_context *ras_core,
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  127  			struct gpu_mem_block *gpu_mem)
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  128  {
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  129  	if (!gpu_mem)
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  130  		return 0;
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  131  
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  132  	if (!gpu_mem->ref_count) {
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  133  		return 0;
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  134  	} else if (gpu_mem->ref_count == 1) {
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  135  		ras_core_put_gpu_mem(ras_core, gpu_mem->mem_type, gpu_mem);
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19 @136  		memset(gpu_mem, 0, sizeof(*gpu_mem));
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19 @137  		kfree(gpu_mem);
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  138  	} else if (gpu_mem->ref_count > 1) {
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  139  		gpu_mem->ref_count--;
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  140  	}
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  141  
c49ef01183b036 drivers/gpu/drm/amd/ras/rascore/ras_psp.c YiPeng Chai 2025-06-05  142  	return 0;
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  143  }
ba74c69d0c8c38 drivers/gpu/drm/amd/ras/core/ras_psp.c    YiPeng Chai 2026-05-19  144  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
