Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76851597A
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862172; cv=none; b=k0AE3pFsp8ZqqcWujtkXYRWBACN6N4nsBdsIoz56UI1j+sFcBduyFiTFUa26ubmoQEz+M8wcH6oPpT27djssvQ8rCfVNAs7/c/JAeNXwUS+pyfRukm0OAyEfvyPLuAG3mzbbRGYm1uIe0mpk6+L7vsLizIBPHt3hztY6wXsC1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862172; c=relaxed/simple;
	bh=ywebUU/9Xr8vbfokqXJvQK+WB9bqeWERSxPEZ0HMOLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CXNCH2RVpYiZx8Hyr35lEX/5cPxkTEcmxe/KJTUS4+Sbsz6fuR+/1rfhtx2mbbHMsb27S+2BC+CIXcYAjORn0L4S+3Y0AMK5EiGmai/9Lb0FjsbHPN80E9P7A1RlrfEcSCM5XvjfEavgB253IQlPAIMd6mz0EJXy0oS3Lk6ZMw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTnml945; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTnml945"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790862162; x=1822398162;
  h=date:from:to:cc:subject:message-id;
  bh=ywebUU/9Xr8vbfokqXJvQK+WB9bqeWERSxPEZ0HMOLg=;
  b=NTnml945vcVgh5ieP1cuCsNGzfh/qVm0Rv/3igWVY3E4moRSvg+MRJDv
   6a1ENqbWuEgYBcY8Kkn5MpKQ7msInJrAYCfn5kN46W7jvDgVxbMvkXeQr
   Ziw4qbIrI+PQnPT74OXZb5nczfiv5olEUDL/E6U1bulR96vexze00IE4A
   0V3GDBg0JqV1PNyNu/fssBEjXplQ1DzCXockduLJAGV6Sg1e5vMPi6G4R
   wtNPa3TkjKcgy5MKv7mwS6IFVeDa0ZFTR3KEGDVDo746Nk2WEnnivnWSZ
   aB4WHuVhMR66/aB+i5Yw10hZ441dnepyJljrVB33VHmqHeUG8L1cvDXli
   Q==;
X-CSE-ConnectionGUID: PpJz3uHpT2C21wGUZnWBqg==
X-CSE-MsgGUID: t8GM8yUcT5aAEnhKewPQCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90832288"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90832288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 06:42:40 -0700
X-CSE-ConnectionGUID: F28L6gg1QEC6Sjqhy9tlqw==
X-CSE-MsgGUID: HaEiwu1qTsGjiER6UrcwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="303931401"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2026 06:42:40 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCH3V-0000000006t-0YO5;
	Thu, 01 Oct 2026 13:42:37 +0000
Date: Thu, 01 Oct 2026 15:42:04 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/bpf/verifier.c:15657:undefined reference to
 `__umoddi3'
Message-ID: <202610011511.kp41YMdn-lkp@intel.com>
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
TO: Eduard Zingerman <eddyz87@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-track-may_write-flags-in-liveness/20260926-071959
head:   588faaac20422c91861700e863668674da9cc06f
commit: d4a6f606bf5cbb4d84b533905e932f4a79fe17e3 bpf: representation for intervals with steps
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261001/202610011511.kp41YMdn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011511.kp41YMdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610011511.kp41YMdn-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `scalar_step_lsh':
>> kernel/bpf/verifier.c:15657:(.text+0x14102): undefined reference to `__umoddi3'
   ld: kernel/bpf/verifier.o: in function `scalar_step_mul':
   kernel/bpf/verifier.c:15646:(.text+0x15376): undefined reference to `__umoddi3'


vim +15657 kernel/bpf/verifier.c

d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15650  
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15651  static void scalar_step_lsh(struct bpf_reg_state *dst_reg, struct bpf_reg_state *src_reg)
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15652  {
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15653  	u64 amount = src_reg->var_off.value;
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15654  
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15655  	if (tnum_is_const(src_reg->var_off) && amount < 64 &&
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15656  	    !check_mul_overflow(dst_reg->step, 1ull << amount, &dst_reg->step))
d4a6f606bf5cbb Eduard Zingerman 2026-09-26 @15657  		dst_reg->base = (dst_reg->base * (1ull << amount)) % dst_reg->step;
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15658  	else
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15659  		reg_step_reset(dst_reg);
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15660  }
d4a6f606bf5cbb Eduard Zingerman 2026-09-26  15661  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
