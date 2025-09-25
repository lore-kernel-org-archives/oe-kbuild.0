Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739BBEEAB
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760550; cv=none; b=u5o46vXvz6fY5/KCnIBWa5qXYnqsME5Ilqsgqy5tuG3wjp2hN80b2aWEUPtCs38OII7Gv18Tg9Pvu+2//Z78JN5vDEj+K2Gf71/9QHsKPAOeddHyQjayHC/3JEzumsJUTQJtbMxgzTZA6TLtj2iYoZ27h8omj5WhLyMCri2DhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760550; c=relaxed/simple;
	bh=wwHm366pY8r67zVvOCMXQWZCZTQihKolOw085KqBKGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kx8xEAntzK4pa4wEtBSiEcCpiVn3KYArvBE2kg/ks6dz0qGI41jtc4IOHApyrW73o2s1eflBOAy7B/nrXjpE/c86/JhJgwhwVme1Hf2yw1PvlAputrDhLmYgUCdyRzo+eIrLBGF8rNXJrHs/zro0M7AlTKNm2rj+j/ILUDRcDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dcQ4EDsq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcQ4EDsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758760549; x=1790296549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwHm366pY8r67zVvOCMXQWZCZTQihKolOw085KqBKGE=;
  b=dcQ4EDsqB3e3JKdz0NkU/n/ssvl0KKi3/DEsXJUrsajLXIdWEd+sqkPy
   dAv/prbfj0+qpCJhJECxxum1WDeKk6TP1jyR53hel686CDs1rDwI3fevw
   lvH+zU/zQq34kH2ap0uqvaWZrjaaBHOJ9u77jfbpd91X7ctpOpBGfXWl2
   i3zctDLJ+qCo2BlFW1ALNv/e500yi+7lidpd1H68GX0BFm8YjHqhKiwDg
   jplZnBtb/jCj4oNxnYgoD1Ood+VaFF2mgSlnaAQUJaHbYalNodiRDnRuq
   kjKMEX14YkVdPk4gChD7HDcQEUbFSVyWhveKFWUZjSs4WnpqaJPCLRIBq
   Q==;
X-CSE-ConnectionGUID: RYBZnerbSUan8GZv3XeSrg==
X-CSE-MsgGUID: x/7Fpi1GQ7ehgPUrTGe+vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78708470"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="78708470"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 17:35:48 -0700
X-CSE-ConnectionGUID: zqQ8mDPwRTyIHPJzZQFGlw==
X-CSE-MsgGUID: vP064StCTfiqqNJU9oeQIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="214309636"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2025 17:35:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ZxX-0004kZ-1f;
	Thu, 25 Sep 2025 00:35:43 +0000
Date: Thu, 25 Sep 2025 08:34:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: error: <unknown>:0:0: ran out of registers during register
 allocation in function 'hv_apicid_to_vp_index'
Message-ID: <202509250820.EexpIhk8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "CONFIG_MATOM=y does not really work well with clang on i386"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Roman Kisel <romank@linux.microsoft.com>
CC: Wei Liu <wei.liu@kernel.org>
CC: Michael Kelley <mhklinux@outlook.com>

Hi Roman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0ca0df179c4b21e2a6c4a4fb637aa8fa14575cb
commit: 86c48271e0d60c82665e9fd61277002391efcef7 x86/hyperv: Fix APIC ID and VP index confusion in hv_snp_boot_ap()
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: i386-buildonly-randconfig-005-20250925 (https://download.01.org/0day-ci/archive/20250925/202509250820.EexpIhk8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250820.EexpIhk8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509250820.EexpIhk8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_apicid_to_vp_index'
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
