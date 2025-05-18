Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA7E6BFC0
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747588553; cv=none; b=Vg8U9j4xooPTPtSdvtIKdoux7IQQXS2MfNIqg8H6GIEY4cAUlPv5xksujbyMDjBQ9j09T5WdzheOtLl09EHMbde3slpJnkOdcHsHHuNCKD1hlm2WG4DPLwW2WGA+WsvyxsfBHwWDm4lJneDqdyzSpVO9MkyVHuDuoNJUEcm6GlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747588553; c=relaxed/simple;
	bh=v5d6CXLygdYrPScYKVnFzq7JY03utD58mK+UM16GoUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICSuz0qk3smIXXl1AwBg7M9TRt2LCBEoOz7I0FiNVwMpblxhvNjHUtOg89iXNVa+yYf3km5oDGxq+H4DXbjuoOSrZpn7Av0389QWsrtlWEJW4tpD4gvucxiSqjW6jP3ezk4880wtXe3woz8foJG0O7OG4/u1xipjmBPQgWWhkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQFNDwYI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQFNDwYI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747588551; x=1779124551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5d6CXLygdYrPScYKVnFzq7JY03utD58mK+UM16GoUw=;
  b=GQFNDwYIN0ydhLP7u+RulmspfItvlCRMWCnPCPtF+0kEpK09aCgch3pM
   A8xmU3H4mpn7P2pd78jN076IRl068erErctYKiQKLdFK9m/g2n3ajtRPo
   YHYQjGt3wbr3k2IVQlgbXngo8XvTlmayhi+Pw93c2WuJMRlM+aH88co58
   su7SO1qGESMrP2NT7f3N9yqAqj66faUbx8GK8ZHJlmMg1vWO/fsUyYJ/v
   1F3MDvtU/quoSKuXZ+cDRPCw7/Z2+u6PevnTjlrplsvsfOQuNyvaefpad
   69YDWOsd3wR4Qn6ZqdmLEjbwDUmZnanmML80j/uwAtWpdsNZjtRkCbLID
   w==;
X-CSE-ConnectionGUID: IqTU37eVSYOsg8TPEgLj6w==
X-CSE-MsgGUID: HLWPq3CdQQuk3shR8+0T3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="59722090"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="59722090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 10:15:50 -0700
X-CSE-ConnectionGUID: c4b1jrO9SGmgxZqalX+27w==
X-CSE-MsgGUID: 7OZOhaB/TLGFzf+qw0kP6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="139568886"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 10:15:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGhc2-000KvH-2g;
	Sun, 18 May 2025 17:15:46 +0000
Date: Mon, 19 May 2025 01:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x74:
 unreachable instruction
Message-ID: <202505190109.1qhIA4Zy-lkp@intel.com>
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
TO: Huacai Chen <chenhuacai@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: 4103cfe9dcb88010ae4911d3ff417457d1b6a720 LoongArch: Increase ARCH_DMA_MINALIGN up to 16
date:   7 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250519/202505190109.1qhIA4Zy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505190109.1qhIA4Zy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505190109.1qhIA4Zy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x74: unreachable instruction
   crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x8c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
