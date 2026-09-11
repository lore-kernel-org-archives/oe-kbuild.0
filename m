Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978B5360EE5
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 22:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167028; cv=none; b=Q4cX/6zUp7+jp5fKSlsq7kewvan4V03hVH7mFUsTuaMFsZoXfNgAUEWH3BTzeTrEfpQwukm4kglmbVzi7uLOSJCzXrVh+kquHmN1sxg4mmK75yQGEpDmFeEO87CYFRwaAELxkK89xQupNNYeWIZuOOrOmJj2INUGy8VE0QGpbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167028; c=relaxed/simple;
	bh=SgLZVoDe8zVktv3hy2tEow6vUn8Om51MveQkQFmi+l8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EWVgHeZTsbu8W/BThfPBM7b9my/TAGvwpETYgq9ZKxUYc7PAjadYTx8hbAKmBZQPz0LotoEPMQjHZLXaiyA/yz9+vli3QL+NIvtnS0yC0nPw7ynMZOV798wUqt4+EaN80TD3P2Y9FiOghbt8zt+5EXnvVltjEpPVasMVZAwqk8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYTPjf/x; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYTPjf/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789167027; x=1820703027;
  h=date:from:to:cc:subject:message-id;
  bh=SgLZVoDe8zVktv3hy2tEow6vUn8Om51MveQkQFmi+l8=;
  b=jYTPjf/xDfz9iG/uLGo4jlYejRWY38c/0F8x0FEgUDWuf454oDGp8XbC
   lAk0C9b34s4usjGaALqRFCQDuoLOXt9tMp3XXLl4UvpLQIxUrpO5yDpNv
   nD1XcqFjLlcyFHKil/A/D4Q6TOm5TzwmaPmMJmIi6WTO480fnFMD32wA4
   VN1DlkwBJmxC8b463doOkVCsqwtDTRT1A2mLwkmARiRab0pc023EOiqTw
   aX2+6CcylX+bOjhL1owxd9zCIdG5l9Z4Rha+9iLOe1qQno63SktU1wIrM
   UsUVZvsbht46guQtrvFxVszFHiWwhQnq2XlNBQgips7p2Mwcn4elrsYfj
   A==;
X-CSE-ConnectionGUID: H6nYrna+R9CejWxIqQul6g==
X-CSE-MsgGUID: IuWiYvw0R1ODKSDwaxHtYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="101154497"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="101154497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:50:26 -0700
X-CSE-ConnectionGUID: sVZBGeckQcaBrGZX3LKuhg==
X-CSE-MsgGUID: rqbSXI70SrilT3P1wNSdww==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 15:50:25 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5A4d-000000000tP-0o5c;
	Fri, 11 Sep 2026 22:50:23 +0000
Date: Sat, 12 Sep 2026 00:50:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning:
 arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202609120034.8tGmDzGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   827751b699b79a6e569983359c02dce67f81b94c
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: mips-randconfig-r062-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120034.8tGmDzGm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 707c032dae3bee24eae29c6f4c459a6d6dc6556d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120034.8tGmDzGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609120034.8tGmDzGm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/mips/cavium-octeon/executive/cvmx-boot-vector.c:155 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * Get a pointer to the per-core table of reset vector pointers

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
