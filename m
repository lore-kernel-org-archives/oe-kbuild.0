Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AFF3FB05A
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457897; cv=none; b=M5y1MQakjyVpuYQv/jfx/7zJR1/eVAYtWiI2i0rmDGgUeudSbtx8o6YW1lYPJBa4KWtFqGNNXfFHMzQMCGwnNvO7klBGU+Gjt+dub32jtiXwLXpBDBuH4bQco7f3IyZQkeCjuXauBMyeGEu5NKfI5HuZM7L3wSGPRf7wKYEWB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457897; c=relaxed/simple;
	bh=KZTgRTZpZk2WOkHqdF6pP60XB+OWISERWucW06+2tD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MZSbqXiR7DeDoBElubSTfKjI4DXZmkLR9nUKYDracw3tE/SEs/QuAr16yUxfBXhR3ORk48nKJjPWN6Ct6TRcJdECdCQ/WlsaKlekuIU07UaYz576GyHnlAWhVfd9v7lcboxmUi20t8/3nt5sN2gKsE2oOw/1AV20K+blv1dg19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXxAB0Jy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXxAB0Jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774457894; x=1805993894;
  h=date:from:to:cc:subject:message-id;
  bh=KZTgRTZpZk2WOkHqdF6pP60XB+OWISERWucW06+2tD0=;
  b=dXxAB0JyyVI4UxZrYrVyLmFSMrotYM85s99R1uzCvXeqmx/CNMHfgeMr
   6PzliL25zozAK4RpFDcy1o6DXZZuQ8nPXK/A15GaJ5DrisbpN89vjixy5
   Rb13AYl0mwgEU0gqOP4XpIgi4LMGlwxyQqtSTi3sDRxigeNBUpcFUnB2j
   KRSAH/Rtpy75eB75ZiBWD/iw3kX/IR5uOjgfjFkjWh7WcptpEbhGH7K07
   GKWqYNlLdYcrwAYZkS6Nc3vhyaumjhicAenf6i0XrG3H9RZ5aU0g4hrmC
   +rTKPBIBs2+92Ok6t3ESk9hNbzE9F9zw8pO3L22V+fkk6sZhw+7r0zRQ3
   Q==;
X-CSE-ConnectionGUID: WgLyyewwT+icdp3t9CNykA==
X-CSE-MsgGUID: UdnEIGMeQPGmm8kvTg8mMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75522367"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75522367"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 09:58:13 -0700
X-CSE-ConnectionGUID: 2BdPY2TvRz+ZRX3QHecd0g==
X-CSE-MsgGUID: layYorq5Rg2WIStAAxjzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="220335259"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Mar 2026 09:58:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5RYX-000000007Jr-2TPo;
	Wed, 25 Mar 2026 16:58:09 +0000
Date: Thu, 26 Mar 2026 00:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/tee/qcomtee/core.c:193 qcomtee_idx_erase() warn:
 impossible condition '(idx > ((~0))) => (2147483649-u32max > u32max)'
Message-ID: <202603260026.qDIAqzZw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: d6e290837e50f73f88f31f19bd8a7213d92e6e46 tee: add Qualcomm TEE driver
date:   6 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 months ago
config: riscv-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260026.qDIAqzZw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260026.qDIAqzZw-lkp@intel.com/

smatch warnings:
drivers/tee/qcomtee/core.c:193 qcomtee_idx_erase() warn: impossible condition '(idx > ((~0))) => (2147483649-u32max > u32max)'

vim +193 drivers/tee/qcomtee/core.c

d6e290837e50f7 Amirreza Zarrabi 2025-09-11  187  
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  188  struct qcomtee_object *qcomtee_idx_erase(struct qcomtee_object_invoke_ctx *oic,
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  189  					 u32 idx)
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  190  {
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  191  	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  192  
d6e290837e50f7 Amirreza Zarrabi 2025-09-11 @193  	if (idx < QCOMTEE_OBJECT_ID_START || idx > QCOMTEE_OBJECT_ID_END)
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  194  		return NULL_QCOMTEE_OBJECT;
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  195  
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  196  	return xa_erase(&qcomtee->xa_local_objects, idx);
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  197  }
d6e290837e50f7 Amirreza Zarrabi 2025-09-11  198  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
