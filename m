Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669B3348C65
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Aug 2026 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524080; cv=none; b=FC4Puc3GmqG267NqOseT8H6VRGGHonAhNCSXB9wzfgMsfrSiXgrGPA3KAuwJxS9cLGqP5/ZQLNZfxixoTMingFF8hlCoheqftACQUDGDFf46qszNVaRUnzm2f+99PbEhM9cnBWm819IHV4ToekrXHN+wjvNzbLvLcTuaTIN83NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524080; c=relaxed/simple;
	bh=tpi8kpGqVWZZ1BTweIrLI0Y/JNA/FVB+qlFqEcDEaYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cR4cXZS+8h1P6Pmkr63mfMyOgZgLENLVsGslXgghrIvZCtLUQ1kg6vV2o78f8U41CkJAHaPfRroygebxRj/n1lsMSfeWYA4sCkc+P6+LzvKsljUu/NzTU7Gvyo1gxei2EYHt4S4DMQGA0ZCYmX8fjlOZIUyFsEJSW5BCmUN5lYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hcy2SyRZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hcy2SyRZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786524078; x=1818060078;
  h=date:from:to:cc:subject:message-id;
  bh=tpi8kpGqVWZZ1BTweIrLI0Y/JNA/FVB+qlFqEcDEaYo=;
  b=Hcy2SyRZzSlCZnKjhIPJAVmvb0cmVZkdK8ETWwT4lRC69C7OBHwZ6cUU
   RpQ4btll4FJOrZll+8LxVlOs/5uer88ohRQOlZuMllALpT7Z1tyuKNxii
   JlCmgW+58ap5KoknpxFDIv+eSQtWIKeWrYY3f1pMi3Cjy6vfGhnPXjEKO
   8XlZonR89pRX2CrF99iJvpf7Wg60IuHBxuW3rD8x3fMPGL0UFZt7O0xDH
   sQgeQ+SXxW3V647cupVsoxI3V9DXZUPjTpNQf52vO2a18xhtRjMUMVuHy
   ZOSeOxVPEW2mya+g75xUcPq4GHMzoVfCMz0kHFMEUjlrJwp8k6K4WEZHr
   A==;
X-CSE-ConnectionGUID: T/KBT7rkRTGDx1FJufrxpQ==
X-CSE-MsgGUID: XTF3lPl6QzupjHGcjImPsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87192905"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="87192905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 01:41:18 -0700
X-CSE-ConnectionGUID: 4ueGd2rbSYWYKMvCwuFtHg==
X-CSE-MsgGUID: dzfbmQs6RC29ZyCeMBZtjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="262271930"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 01:41:16 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu4WQ-00000000Q9S-2tmP;
	Wed, 12 Aug 2026 08:41:14 +0000
Date: Wed, 12 Aug 2026 16:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/kernel/machine_kexec_file.c:106:11: error: no
 member named 'elfcorehdr_index' in 'struct kimage'
Message-ID: <202608121606.2JgPBuzy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Jinjie-Ruan/kexec-Extract-kexec_free_segment_cma-from-kimage_free_cma/20260811-191927, commit: 636a631bfe0bf9899ded5fdcef1717e8ed499c76"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/kexec-Extract-kexec_free_segment_cma-from-kimage_free_cma/20260811-191927
head:   636a631bfe0bf9899ded5fdcef1717e8ed499c76
commit: 636a631bfe0bf9899ded5fdcef1717e8ed499c76 arm64: crash: Add crash hotplug support
date:   21 hours ago
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-002-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121606.2JgPBuzy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121606.2JgPBuzy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608121606.2JgPBuzy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/machine_kexec_file.c:106:11: error: no member named 'elfcorehdr_index' in 'struct kimage'
     106 |                         image->elfcorehdr_index = image->nr_segments - 1;
         |                         ~~~~~  ^
   1 error generated.


vim +106 arch/arm64/kernel/machine_kexec_file.c

4451045951624f Jinjie Ruan     2026-07-29   95  
3751e728cef290 AKASHI Takahiro 2019-12-16   96  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
3751e728cef290 AKASHI Takahiro 2019-12-16   97  		kbuf.buf_align = SZ_64K; /* largest supported page size */
3751e728cef290 AKASHI Takahiro 2019-12-16   98  		kbuf.buf_max = ULONG_MAX;
3751e728cef290 AKASHI Takahiro 2019-12-16   99  		kbuf.top_down = true;
3751e728cef290 AKASHI Takahiro 2019-12-16  100  
3751e728cef290 AKASHI Takahiro 2019-12-16  101  		ret = kexec_add_buffer(&kbuf);
4451045951624f Jinjie Ruan     2026-07-29  102  		if (ret)
3751e728cef290 AKASHI Takahiro 2019-12-16  103  			goto out_err;
728f736222b0ac Jinjie Ruan     2026-07-29  104  
636a631bfe0bf9 Jinjie Ruan     2026-07-29  105  		if (IS_ENABLED(CONFIG_CRASH_HOTPLUG) && pnum < PN_XNUM)
636a631bfe0bf9 Jinjie Ruan     2026-07-29 @106  			image->elfcorehdr_index = image->nr_segments - 1;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
