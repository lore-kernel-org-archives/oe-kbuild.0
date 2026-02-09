Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2223D281
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Feb 2026 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770645295; cv=none; b=j52qDSXABy4rOs+AYyI0azljvRw9X+ZVfnSUi3T2qCuQ667Wo1izIPdeuv35krGYd2h0kTD5pIhiGPBP61rqLR+EGUakPnjfZq/In+PYSk4kskLWtS0nLHoAAOc00sjXcqsBO/wjtQmB3B51zZONju/ewZpxFAAB7JgzILBUUwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770645295; c=relaxed/simple;
	bh=RFkPZsy5ylUvzcOobG7zgRZEqrD1l/2QwajnBwVCmes=;
	h=Date:From:To:Subject:Message-ID; b=EDqoTNZez7xIHd7cd1hmGaNLP9Cifu1sDO8C5MmvBf1dlYVnKFqwLfOr21I3QL96F+q4SoWpdzPhQPijS+UAQunnYCe4m900FVwNv3XrjlZwIeaPYfknSkKEirLPs75E7lx/RMnR0AKdIeea5m1sbc4ci84oRPM1yB/TuS4wshs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cj4mHEo6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cj4mHEo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770645296; x=1802181296;
  h=date:from:to:subject:message-id;
  bh=RFkPZsy5ylUvzcOobG7zgRZEqrD1l/2QwajnBwVCmes=;
  b=cj4mHEo6DqTcs18tkipOkexcab9wjRPLW5IAEfFRGX3auYztbo/dpMK7
   FAXAg/VjbWEFax1DItDepYqouqUqPbEI+3ZqUJMi+FOSWWbXessSB0oTr
   Zeb65zLvgdXlOIDRXJc+iaPlTuaT1gh8MjQXuRsW+uMKPSISDIUjwPyOF
   3072J9b5qBqqrs+dvrngkVRWI7msa7+JEqh5tRt4oqRc65kGthNVuc4XF
   ovti6r9RJEhl+A2FccXENo2HEAUE9DqpIDlpS6fb1PAn5K0KNs+nYzZr3
   vgYBCefxGV5WaubQEy32VW3Vv9HZew8ugYl3HirJHun/qx8ySNRCXCSzn
   A==;
X-CSE-ConnectionGUID: CVIyZb6HTsi37kvD9XDO0Q==
X-CSE-MsgGUID: r8BJBeo1TGiCtZ/fMoHk8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75603752"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75603752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 05:54:52 -0800
X-CSE-ConnectionGUID: uu84a6CFQhmx4W/lWPYDJQ==
X-CSE-MsgGUID: aQEdcf0VSMG7VnWe5IwbNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="215774395"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 05:54:51 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpRiz-000000000FR-1Kg3
	for oe-kbuild@lists.linux.dev;
	Mon, 09 Feb 2026 13:54:49 +0000
Date: Mon, 09 Feb 2026 14:54:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [leon-rdma:refactor-umem-v1 78/80] checkpatch:
 WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
Message-ID: <202602091448.Md7q4356-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git refactor-umem-v1
head:   a13eb692588830b3d09a9dcb14d384ccfc029902
commit: 02d68b173e6b85da8ceab2527e44cbe18d22b40e [78/80] RDMA/mthca: Remove resize support for kernel CQs
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602091448.Md7q4356-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SIZEOF_PARENTHESIS: sizeof ucmd should be sizeof(ucmd)
#85: FILE: drivers/infiniband/hw/mthca/mthca_provider.c:671:
+	if (ib_copy_from_udata(&ucmd, udata, sizeof ucmd)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
