Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E881DF980
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Jun 2025 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231134; cv=none; b=GiPTS1uPOXvYULSnXyw6h6vU3lPJaw8UKifd33hxFgXeMEmNooBU5CXWm4SSXwwB4+TyL31Q9k8YpvqSeUb79peW/+SBAMfJpA+PIh1LM/Uqt2DOgZ7MJcPfDfXE5Pn/aRAZsj5VGml8eU/NrmgzKnjtCzTK+OmYmCLpLj/u3ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231134; c=relaxed/simple;
	bh=9z0mvCrHFHouAIG2nGowtjUNPSWAKc5Z8QgG5TI4Uu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L3pALr8snMqpYTyEPIIqLszKpHi6HPhsnFmhkRGUtNjACkqvkfOen+D3koLQReXNK5INVHzIHVRlkPOtuGZ1bekIVKBlzNPIuBMdyv9pcYAvkkHP8oOJ1C32x4wJdZNLBNRX16+NiLJ7Ek88QIdRaaF23kSKtagx88nP3mL3KVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0gUj2FJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0gUj2FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749231133; x=1780767133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9z0mvCrHFHouAIG2nGowtjUNPSWAKc5Z8QgG5TI4Uu8=;
  b=J0gUj2FJJyPuzmsr3FGblBzh52b8ab/P4CnDhlMJIg3e8/tikAum2DrS
   FiDSXGr+AIjzt82sbKNEgp9w/s9MIjedOtAf6Hf3RjRJj1CeF8iOt9uSb
   ZT9ahIFgZyHyA7HuSUeJHR7FN53fHgeH6PoruXAf7kNHsZzztPxOd0JVT
   yEoacxlpi9FQguI92DK8jlWtDRP4PGCn5Da6f+5AexpYDdLBsjdR5EbEO
   TvUSpyHWT8gwfI5SIMCYW/bGextW8fYGdtIobup/IuDd1Vwd/ELgxnhcZ
   9VAI/UyqN63fFWKMC0pG6MAECVwGrWaK1t/rs3SIhQWpA/co0HjKie4Ft
   w==;
X-CSE-ConnectionGUID: LLkYmWxQQemJGBs8TdrhSg==
X-CSE-MsgGUID: cfm02ANlRcaF+gevE+IiWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51267689"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51267689"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 10:32:12 -0700
X-CSE-ConnectionGUID: qGgLHF4IQrmdQXx7wTi05g==
X-CSE-MsgGUID: /YV5I4mmTeq556AJONNoAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="151139298"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2025 10:32:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNavI-0005AP-2P;
	Fri, 06 Jun 2025 17:32:08 +0000
Date: Sat, 7 Jun 2025 01:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/xfrm/xfrm_ipcomp.o: warning: objtool: ipcomp_setup_req+0x2f4:
 unreachable instruction
Message-ID: <202506070129.qZblutUz-lkp@intel.com>
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
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e271ed52b344ac02d4581286961d0c40acc54c03
commit: eb2953d26971f3083bbf95de4bc997b5bedf0b6e xfrm: ipcomp: Use crypto_acomp interface
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
config: loongarch-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070129.qZblutUz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070129.qZblutUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070129.qZblutUz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/xfrm/xfrm_ipcomp.o: warning: objtool: ipcomp_setup_req+0x2f4: unreachable instruction
>> net/xfrm/xfrm_ipcomp.o: warning: objtool: ipcomp_post_acomp+0x14c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
