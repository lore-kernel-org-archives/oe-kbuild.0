Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54A233126
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Oct 2026 23:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791155864; cv=none; b=MYsV5U/SrnISCquTh4A3mOBXOzueRyZ82fBXQnUq3uE+tBy9AGbOU/OWGMaf0SLrQhjgAzsWuLwV9ewYj6uZbN9MtcUt2DryFOqcKc5r2nFq+7zFFRMLJ1A/IS1hDuW9lR7YjuaTILFux+HiagukER5zsrRjWj5EYReTE5wQC0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791155864; c=relaxed/simple;
	bh=QQEiUVCiYHuFoM+Kewkws3f60iiW+ueMFVbMtr7psyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jg+mMWdUsi/ThXthwYA0/w5JTGEuwWJ+VVuuqb17uoFPePzMR0DdiqBIJmXCOZcudH5HUPVE1qCVuaJ1mMk5EdVqj64luWZVuIBAfna/ng2LGC7MpbqqBKYYDsVNWz42hmnyWTmH7Tm6EC4pHLDQgedDoUhx2KVV7noCNE30lkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jymJjM2M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jymJjM2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791155862; x=1822691862;
  h=date:from:to:cc:subject:message-id;
  bh=QQEiUVCiYHuFoM+Kewkws3f60iiW+ueMFVbMtr7psyU=;
  b=jymJjM2M5xwFQjOEOV+GE9l6V+8CcJvnh3DrV3PY+fjM5Eq2zm8LOyl4
   zzqm6Vw9X8o8LwEU+6uXH8+E0vWOa/+cKqp5Ij+GROYtPfv/Xu2kQJ50R
   7agi7BPFyqaPQKYBXWSaHBB0sQMgwZPz/8fJjTPi9cCuxKDcx/Iyl/mtI
   vHrC0wieTWGbw1iWAK/42VPd5K0S6+n+V2eA4Wcx8Xngqa5F6xKRatfBZ
   JUxXplz5i1oL4QzqLjIkNNo0MkZocxBl23iYjYjvFnAhtWzYig4N0Hf/2
   jGLPUoI595/8JhB6v7scm4xkSNbMRv+h33bd58ZioR6W9CnaVFIyDBtwz
   w==;
X-CSE-ConnectionGUID: 7e7kOZ8NRm+QqVo4h2VLLg==
X-CSE-MsgGUID: ImS4DGmJS8mb/DaMiXRWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90859704"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90859704"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 16:17:42 -0700
X-CSE-ConnectionGUID: DaScLagwRqe2CzuxUFjuDg==
X-CSE-MsgGUID: 1rYmDCm5SD6oj9yQmiEudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="758362"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 04 Oct 2026 16:17:40 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDVSc-00000000V9B-0nQR;
	Sun, 04 Oct 2026 23:17:38 +0000
Date: Mon, 05 Oct 2026 07:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/resctrl/mpam_internal.h:166:7: warning: ignoring
 return value of function declared with 'warn_unused_result' attribute
Message-ID: <202610050742.agvnBvHF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Andre-Przywara/arm_mpam-let-low-level-MSC-accessors-return-an-error/20261001-173426, commit: a7acc3c42586b611e6886e6c157acae728ed4374"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Andre Przywara <andre.przywara@arm.com>
CC: 0day robot <lkp@intel.com>
CC: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
CC: Ben Horgan <ben.horgan@arm.com>
CC: Gavin Shan <gshan@redhat.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/arm_mpam-let-low-level-MSC-accessors-return-an-error/20261001-173426
head:   17dd5fecde831cbffa974ca04c37ea7370652673
commit: a7acc3c42586b611e6886e6c157acae728ed4374 arm_mpam: propagate MSC access errors for hw_probe functions
date:   3 days ago
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610050742.agvnBvHF-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050742.agvnBvHF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610050742.agvnBvHF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/resctrl/mpam_devices.c:30:
>> drivers/resctrl/mpam_internal.h:166:7: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     166 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
         |              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:401:41: note: expanded from macro 'DEFINE_GUARD'
     401 |         DEFINE_CLASS(_name, _type, _unlock, ({ _lock; _T; }), _type _T); \
         |                                                ^~~~~
   include/linux/cleanup.h:287:13: note: expanded from macro 'DEFINE_CLASS'
     287 | { _type t = _init; return t; }
         |             ^~~~~
   1 warning generated.


vim +/warn_unused_result +166 drivers/resctrl/mpam_internal.h

d02beb06ca2a62 James Morse    2025-11-19  164  
a7acc3c42586b6 Andre Przywara 2026-10-01  165  DEFINE_GUARD(mon_sel, struct mpam_msc *,
a7acc3c42586b6 Andre Przywara 2026-10-01 @166  	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
a7acc3c42586b6 Andre Przywara 2026-10-01  167  DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
a7acc3c42586b6 Andre Przywara 2026-10-01  168  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
