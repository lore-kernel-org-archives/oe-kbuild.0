Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4E5503BC4
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649284; cv=none; b=SBnL93des7Zbw6lECbjbczuSwo//NwcKCXY2j6CZl/+LhjpLdW3VOyyXei+CgreZ+jclE2CWUGKWloyELfVSIO1tRHNDOI9zLQO3gXswXQI3Ezo3mQVaUkRdU4Ak7XZY4O6RtDPcHTHPyhC7gQdtsWlK6Wpamgr6Im+Hjw8lFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649284; c=relaxed/simple;
	bh=rszLeFj1MqvXkHLuLwtoeWmOypqqxFmh72lTKwSMKMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AJ7hBo02RlDEbSb111DWsktLCbLXVHlgRWefB9Jaimr+5r5wDfm/tyhulT7yUhyTt6ljS8at4+lTm21B2L3JZAU5RkG4JHLIEHH+UO2q1Xnr8B07v+tghgL0ZUFP9BFEoQ1CobyGGlruz69WZyjzQBVthmG9hOzJwVh/wtp8p8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/Ts5UG1; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/Ts5UG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789649273; x=1821185273;
  h=date:from:to:cc:subject:message-id;
  bh=rszLeFj1MqvXkHLuLwtoeWmOypqqxFmh72lTKwSMKMA=;
  b=D/Ts5UG1PtlffVqG0wO1Emt00vxMJDg+Ah/NKCBjp562K+4etC/HF7lY
   HY8zETRBNfLFHZule69nAbSb9kZ7h2isQN36Pg25W1eGAgPLNYZRY6hk6
   gZ7yfWXQ5HGxC6kWH7poAcgVdKSjNl+paO+z3m7jeewfvwU607Am5XL4n
   g8rXRmOQTT8jQ9a+B6vW5Tx9HrAJzU1cNntI73O55GJE3rQl40O1WeP7Z
   z1T+9Efn/BMsH61SiZRJqWs7qWonBt3hEdBU0AuM4A4YSpEO6PePX7EIn
   jQb3RCvFU2AXhhNGkF4VHVrE84yVLSDBZmcHtVqW52jIN1pi5QSk0HqQc
   A==;
X-CSE-ConnectionGUID: R1eI0lVaQLWSSRTY3ogR9A==
X-CSE-MsgGUID: bk8PrLkDTVeo7ut8Uedstg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="571238"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="571238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 05:47:47 -0700
X-CSE-ConnectionGUID: yD0k98gxSdiD5qXsL1+sQg==
X-CSE-MsgGUID: K5eoeUjJRNK9sqZtrYgeuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278985381"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 05:47:46 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7BWi-000000000b6-11ch;
	Thu, 17 Sep 2026 12:47:44 +0000
Date: Thu, 17 Sep 2026 14:47:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sashal-next:arch-next 19/20] arm64/vgic_its_save.c:289:21:
 error: too many arguments to function 'vm_phy_pages_alloc'
Message-ID: <202609171423.2ktWjS2k-lkp@intel.com>
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
TO: Oliver Upton <oupton@kernel.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-next.git arch-next
head:   9d473576e8cea2f7330c3a0798867c767254d326
commit: f2303ad1d9c408ff9b4ab33d2cd68cdd454f4bdf [19/20] Merge 'kvm-arm-fixes' from https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git (fixes)
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260917/202609171423.2ktWjS2k-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171423.2ktWjS2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609171423.2ktWjS2k-lkp@intel.com/

Note: the sashal-next/arch-next HEAD 9d473576e8cea2f7330c3a0798867c767254d326 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arm64/vgic_its_save.c: In function 'alloc_64k':
>> arm64/vgic_its_save.c:289:21: error: too many arguments to function 'vm_phy_pages_alloc'
     289 |         gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
         |                     ^~~~~~~~~~~~~~~~~~
   In file included from arm64/vgic_its_save.c:24:
   include/kvm_util.h:1062:21: note: declared here
    1062 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
         |                     ^~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
