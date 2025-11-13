Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9692773F
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763036172; cv=none; b=ao2aohXUm/fItVBDqj3r75/U0tZjf6i6sPL0REdVTE6Ujef3NYKJSHyX9nkfQFm5gJUoQnBO5ixPFDuXEEk8hCpfQ4kIA+tnSJguH4kCmnfpFMtPzKpcg0IY+2Uw3gRnjiRdVtT8a4ISVcdJb8RVeQvZthZ52FVz+zdtHxopA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763036172; c=relaxed/simple;
	bh=GKONUG5JJGUsXwZDO9SC0AmKmaoVHfwYs5KGe3a4NWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sx/dKDxmxrBeKmzRgyd6w32sncjVFh33+M5Es5UMjn/XlN3IWDBvJUyOT9owvZUXZsL/n178tUfGljIKFdmzaHr5m/4reUBuyvPtAhX9K4vJN2uF0n4UTR3PIyY/OZJTDoN9etzRQPlUkMTj+Iu6iNVjIpcwszKMcp4zu/RM+DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns+d5GfR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns+d5GfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763036171; x=1794572171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKONUG5JJGUsXwZDO9SC0AmKmaoVHfwYs5KGe3a4NWg=;
  b=ns+d5GfRlmYNq+NNUUGbxyjduTguquYoQQJLRZTXGjdifhfC4gmQKH87
   aOYgDJ6ncgobLbMxdwWUD04YurQetDSHo8+Il5H96kb5QOOGZI8RYVvru
   6fT4+NBwjxg3LVRhimV7ptIKRsUxP44yDCvlBqGFtSZZfMRM3/pfVOsGL
   f3nob0HmMGWRk3PD498Y2K8J5Ifcb9QhL8Vj9ux2osPhF/tBmOHd4eTjt
   e8HukxSl5Esj2j2GODkqIQ5KdPAAD+xqmBRGHGDySGOO5tp1eq8c73JyS
   qosP/0/fiT2v+hx/yWPd57Cbc7n++Rkgp59nj8uYyT/WGPIS2pyvISdyh
   Q==;
X-CSE-ConnectionGUID: 9ajRyTwfRea7+gVLd1PVtQ==
X-CSE-MsgGUID: AG+zw+yyRcCoNM2rdaKCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64998436"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64998436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 04:16:10 -0800
X-CSE-ConnectionGUID: hksmfllUQcminTdR8atIBQ==
X-CSE-MsgGUID: dr7xkLJ6QXetaIsRtY7+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="193602838"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2025 04:16:09 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJWFC-0005J9-3A;
	Thu, 13 Nov 2025 12:16:06 +0000
Date: Thu, 13 Nov 2025 20:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: xe_vma_destroy_unlocked+0x60:
 unreachable instruction
Message-ID: <202511132000.ogXLApiT-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Dave Airlie <airlied@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6fa9041b7177f6771817b95e83f6df17b147c8c6
commit: 0faeb8cf99c040886ac4917b0d7f4684dc9ae846 Merge tag 'drm-xe-next-2025-09-19' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next
date:   8 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 weeks ago
config: loongarch-randconfig-002-20251113 (https://download.01.org/0day-ci/archive/20251113/202511132000.ogXLApiT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511132000.ogXLApiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511132000.ogXLApiT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: kernel_entry+0x0: unreachable instruction
   vmlinux.o: warning: objtool: smpboot_entry+0x0: unreachable instruction
>> vmlinux.o: warning: objtool: xe_vma_destroy_unlocked+0x60: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
