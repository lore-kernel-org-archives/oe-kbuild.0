Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD5128EC
	for <oe-kbuild@lists.linux.dev>; Wed, 14 May 2025 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747190977; cv=none; b=PTehT4SREscKUazNcmZp+tjrDmXRGIXg5EJLNK73+qW84pRnORsnGIj0HtX64HiVxP7bBwv5tsOIEHhD+aLJp+e8JZ5XqqaOK+5p8Nj8/oq18ncu0776F8MGnZ+WOAKVVdCnWQ49Vm1RhgkoE1ep+P+J7s+kMjWrUux9m30gkzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747190977; c=relaxed/simple;
	bh=lk9h59SMKPy8VE7uxSrcADxp5oIe1Z2xYfQMWeLES3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afX84eF9i2m9YC/q/InPQazZzys/OohIzRZ5g7/Ctv+5s34oFOifc5YJqKeVfOSl2WqAPCdRmNhLaNNGOHeorhdjas2kOwBqEnyO4C5mwYGOzKFhK3C2P9yVl2svIOOzrU+0q/Ym0uK4GyDRcf8uH0uu0LvDfrmHBGeyJBR5GrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BliIFbF+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BliIFbF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747190975; x=1778726975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lk9h59SMKPy8VE7uxSrcADxp5oIe1Z2xYfQMWeLES3I=;
  b=BliIFbF+Yia76EjbMGo3N3PfBhwuSnDlhErkFpC+39QVFfUINhMez3XY
   wLYZUY9QcoFJaBCOfFWrxsFzuh+QhN8nee0kk71A1KQa9EPDEBqTiUton
   tTpeLn1XftbbAbYvf6x9gUgUyvvXNgV/otHMrGJtaw9X+pQUUL0xAIokR
   DIfv61h9HO5x+xdnB53+ROXai98QBbIRpGKtGBa0kkEJ82nLO4okvKBxe
   hqk+E6MtrAVE1R1abBZQgUCwFTF2IQEzeRX/XcB3tUcKXco9vtO0241UH
   VwwSVC5dnAy8ZXV9J7orcy+kvjafBvf9ZPyb3GtogjhKskAtr0UBvRw11
   w==;
X-CSE-ConnectionGUID: UbWq1rzCQTeaText8YBnOQ==
X-CSE-MsgGUID: 4K9g6IM9R7Ww8nxsohlkLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48998234"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="48998234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:49:34 -0700
X-CSE-ConnectionGUID: 808fST0uSW2Nc/TmaYRv6A==
X-CSE-MsgGUID: /ibj8rhrQ22AxXQ1kn/l4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="161195465"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2025 19:49:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF2BX-000Gcb-2C;
	Wed, 14 May 2025 02:49:31 +0000
Date: Wed, 14 May 2025 10:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: warning: objtool:
 amdgpu_vm_update_range+0x4fc: unreachable instruction
Message-ID: <202505141011.BKcYxI92-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
commit: 624bde3465f660e54a7cd4c1efc3e536349fead5 loongarch: Use ASM_REACHABLE
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250514/202505141011.BKcYxI92-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141011.BKcYxI92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505141011.BKcYxI92-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.o: warning: objtool: amdgpu_vm_update_range+0x4fc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
