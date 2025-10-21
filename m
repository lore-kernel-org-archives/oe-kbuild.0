Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE562EFD98
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044607; cv=none; b=ApzqS+OW3RYBIxgev9qE9tD9DcAz83VOJcfVocW/S2GX35RKx6+uT/I/euUK1AljVmEBidjJeVrwa8fNUWaRiuVEl00RQa0YZC9YGlXs4zsFqQaHO+AbqpuVELUkV980XKYizJAtaL+rvdZNGjXO0RCYrLh4QRjj+V/lK4mVOTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044607; c=relaxed/simple;
	bh=4/4ZQDE/nfEqRM/HUpYTTOZ2tzksBW5a9FiNvD10KB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nWI686s3KhPOp3gbF8Pdd2S7IlbCbh4p2ySB2UN+etIfxBJqEjOxAOjkg7054YXKEFb65/YGg26vRP7w0DPR3BuUrrZSB+2uiVWnkWK3KGa/JtVQ4BeZtGYwTtTu1KqJNk20a1WZmaCBUCHtZ+1FUhWqplEISNw65aQ5ydVXXRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ekuw0RDx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ekuw0RDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761044606; x=1792580606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/4ZQDE/nfEqRM/HUpYTTOZ2tzksBW5a9FiNvD10KB0=;
  b=Ekuw0RDxgYm4h06u+3uGs/i4hYNoR3VN+6hO6p9zq9BB8hiDXZK7e5uZ
   cZ2vOpn4LFvlO72Z9sklOcXsvON1cz/8GmOy27OHcMNiceCuBhgaldHaD
   cTh1gGF5/VeBDGZ41m+v9xPSAwe+OZOPtzaVM0lRUQgXXPJtdFz6k3RSf
   2q0U0EuuOXfZ1PDFeP+hTGMrc14SxQBzAtGPkn8V/11gpAfH+vUu6PJqX
   f88nnqjP7mn1BSKU/gh6Vna+zq4XIdGJn+8ep6s/uEBlgVuEbehyvKFK3
   H5vxRb5UTsbOHYngdiOLSb24S9+xBhw4M3z/CVKWktf9LsoEoCmvkaVVM
   w==;
X-CSE-ConnectionGUID: ORy+G5DzSRagQxi2B/2ezw==
X-CSE-MsgGUID: a3wZjWyaTDeHEfcbbNwJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74509530"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="74509530"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:03:25 -0700
X-CSE-ConnectionGUID: eNH5wOwRTN+I33SIWD1P0w==
X-CSE-MsgGUID: uEPH9LRzQfCaAi05OdhofQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="220732792"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2025 04:03:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBA9B-000Akz-1i;
	Tue, 21 Oct 2025 11:03:21 +0000
Date: Tue, 21 Oct 2025 19:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/slab_common.c:1334:14: sparse: sparse: unsigned value that used
 to be signed checked against zero?
Message-ID: <202510211814.uzCHEQ0p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/slab_common.c:1334:14: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namhyung Kim <namhyung@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: a992d7a3979120fbd7c13435d27b3da8d9ed095a mm/bpf: Add bpf_get_kmem_cache() kfunc
date:   1 year ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year ago
config: m68k-randconfig-r123-20251020 (https://download.01.org/0day-ci/archive/20251021/202510211814.uzCHEQ0p-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211814.uzCHEQ0p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510211814.uzCHEQ0p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slab_common.c:1334:14: sparse: sparse: unsigned value that used to be signed checked against zero?
>> mm/slab_common.c:1334:14: sparse: signed value source

vim +1334 mm/slab_common.c

a992d7a3979120 Namhyung Kim 2024-10-10  1329  
a992d7a3979120 Namhyung Kim 2024-10-10  1330  __bpf_kfunc struct kmem_cache *bpf_get_kmem_cache(u64 addr)
a992d7a3979120 Namhyung Kim 2024-10-10  1331  {
a992d7a3979120 Namhyung Kim 2024-10-10  1332  	struct slab *slab;
a992d7a3979120 Namhyung Kim 2024-10-10  1333  
a992d7a3979120 Namhyung Kim 2024-10-10 @1334  	if (!virt_addr_valid((void *)(long)addr))
a992d7a3979120 Namhyung Kim 2024-10-10  1335  		return NULL;
a992d7a3979120 Namhyung Kim 2024-10-10  1336  
a992d7a3979120 Namhyung Kim 2024-10-10  1337  	slab = virt_to_slab((void *)(long)addr);
a992d7a3979120 Namhyung Kim 2024-10-10  1338  	return slab ? slab->slab_cache : NULL;
a992d7a3979120 Namhyung Kim 2024-10-10  1339  }
a992d7a3979120 Namhyung Kim 2024-10-10  1340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
