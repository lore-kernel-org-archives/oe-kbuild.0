Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F219D074
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567937; cv=none; b=p7goNK7ny66BFzox7AUiV1bf7vHimb3Ab2IPBQxmUU4bP40LaJn4yE8bkZMCjQCQHeLAQjGIoMxAaVl0DBPeqROcpD2Ldf/HOOgx/dBsCfcfKEWaUfw3YWiwcMkuNU4iLO5LnDUpR/5/4wwh9EJwI68Z8JALQ9GLs6YaN4hRwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567937; c=relaxed/simple;
	bh=mTnf4Rm4MiEjS2o9ogytGEcyMBQcS4sMStjVDxnW58o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gAwiNPJz58ombFOA25UPnhS662/u3Kb5Pw9lWd+T2AMlwrtwkLiTHIP4DO4XbyqGXgEreU5qT5z8KUMrRsTaffNZj7tWsQSj0xRjUlPbtZo1uzzDx2UQH5ZHdUVpUEo8Vh5TnipJd9t1VM/nI4Foev9fEiROFrOyWi5uk5S6zDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKB9kL6m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKB9kL6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766567935; x=1798103935;
  h=date:from:to:cc:subject:message-id;
  bh=mTnf4Rm4MiEjS2o9ogytGEcyMBQcS4sMStjVDxnW58o=;
  b=iKB9kL6mNCcNlaXtzbuiVa8/rdbz3zlLHFeyIpAwrUKRiZr3zSDvqE9d
   5FMXBvhkVE5Qo6lSuEjQ1e9RgiqvI9Z+vWVV0H8tyoEH55Zf2kpK673cM
   479TwEy6vqYDLfWEN3+WlNjKeXBJMERx3/IFZscZ/mDfYDIJcUJFn2SuR
   /2MrJOi5eETSNfEV1t8OwyoyPwacS5LNnhimwAKyRxWVw33FG1xtJ+bYA
   xoiDINZwSwV2WdEuQky+9FbxlPFl2l/0P+qG3JBooAZxWsyOR4V4+ZZQC
   MP+o1el3v5eKHxEqVTiCsTznZsdLOH2I0kGOEM5qYr8Hs+InH9Aw5Ssdr
   w==;
X-CSE-ConnectionGUID: knGFlnxSTMWfc+baSRAZOA==
X-CSE-MsgGUID: avBaWZgGQyOKrzhrTU3Dxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78715184"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="78715184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 01:18:54 -0800
X-CSE-ConnectionGUID: b5AEpRS2TO69eRTkSGGSQA==
X-CSE-MsgGUID: K6NkS2rfQsKfU754RJ4uqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="230643778"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Dec 2025 01:18:54 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYL19-000000002sz-0RFM;
	Wed, 24 Dec 2025 09:18:51 +0000
Date: Wed, 24 Dec 2025 17:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [phy:next 13/81] drivers/phy/phy-spacemit-k1-pcie.c:669:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512241732.lKi3hqk6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/phy-spacemit-k1-pcie.c:669:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon <kishon@ti.com>
TO: Alex Elder <elder@riscstar.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   27287e3b52b5954b73203d32ee76ffd5f53f5074
commit: 57e920b92724dd568526990c04e79ed54241c5fc [13/81] phy: spacemit: Introduce PCIe/combo PHY
:::::: branch date: 2 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-r113-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241732.lKi3hqk6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241732.lKi3hqk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512241732.lKi3hqk6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-spacemit-k1-pcie.c:669:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-spacemit-k1-pcie.c:669:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/phy-spacemit-k1-pcie.c:670:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-spacemit-k1-pcie.c:670:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/phy-spacemit-k1-pcie.c:670:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-spacemit-k1-pcie.c:670:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +669 drivers/phy/phy-spacemit-k1-pcie.c

57e920b92724dd Alex Elder 2025-12-18  668  
57e920b92724dd Alex Elder 2025-12-18 @669  MODULE_DESCRIPTION("SpacemiT K1 PCIe and USB 3 PHY driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
