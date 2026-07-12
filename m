Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB6D1474CC
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 01:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783820103; cv=none; b=PCSEz5L0kK49Y9pGAHr6TseqlgJuR5YsBHV2jSKSHG3kRHd51mugdru7+tZ7otOISOsBqcObuK9RSZxDnD54p09qQQuyzTTY6ZEnl9PbeE5vsceTlGuwC5A/5SsC1uQwl1ThqI3bAXeVKwB1ymTScoeI6r4Mx97VvYqH4IdlWaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783820103; c=relaxed/simple;
	bh=D56LIqE7+S2RlncEBPmUGTyt+cW9eojA0RAKuwzxyuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gcqZC0eamNFjzgOqib0rPEpERkacrYbkaoYg44KzVz49TFLq6zGupb2w29eLwYIZuMCkdNSBKYn/eOA9a1U3v2rTA7MSki946qaina8EelhO7vtQKR+/qJF2Hg0vBPFxMydCiO+a3pFWV/w2Kn+rhsO4Jz0mE2lY6kcIuFuzKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsKUna9d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsKUna9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783820101; x=1815356101;
  h=date:from:to:cc:subject:message-id;
  bh=D56LIqE7+S2RlncEBPmUGTyt+cW9eojA0RAKuwzxyuo=;
  b=XsKUna9dLoYrgWjivJyGEIu/gR1xBK7byC/vAMe828WVLAmHES1/RMvP
   nzxRL3NZBFGbS2O3NvwOgAsBa7dFhm0HuVo68UCgGZ2whALIcUSwyyO7E
   cRr2M64WypAB0+piByAGSDXDCtKnERuzux071cEVQA8ES7pn9meXA+kBk
   R0IMqMEmYtJnrISe/z45pjU1QqRcmtu/8EP8P6fbjHQrOkHlZRX8EVVJb
   ndtVZTLCRyhyh5biTbeF3iQdxmxF4568MTCaiRaeHC+fNNttepmQ6VTGR
   0qGNBC7pjAfXW0c7WrjsNqWBB02xlVKZm7+2j/U/JpQGFZKDwqQPPeJU/
   Q==;
X-CSE-ConnectionGUID: vC9gZ5LTTo+kuMB3OOlrjQ==
X-CSE-MsgGUID: 9jMp9u9vSl6I2cFXObV/Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84445135"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84445135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:35:01 -0700
X-CSE-ConnectionGUID: NeNeYK/EQQam6fY91Hhvbg==
X-CSE-MsgGUID: n3KJc5PHQI2N0stVs6WyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253474279"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Jul 2026 18:35:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wij5r-00000000KZZ-1Sn3;
	Sun, 12 Jul 2026 01:34:56 +0000
Date: Sun, 12 Jul 2026 09:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: aarch64-linux-ld:
 drivers/pinctrl/mediatek/pinctrl-mt6858.o:undefined reference to
 `mtk_paris_pinctrl_pm_ops'
Message-ID: <202607120837.q7gMeHcY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Nikolai-Burov-via-B4-Relay/dt-bindings-pinctrl-mediatek-Add-MT6858/20260710-230327, commit: 7ef920e9afe736dec1b7097c8f04f41404a92cca"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nikolai Burov <nikolai.burov@jolla.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nikolai-Burov-via-B4-Relay/dt-bindings-pinctrl-mediatek-Add-MT6858/20260710-230327
head:   32a5b7b55eec287987b177ad143cfe5431cbc08c
commit: 7ef920e9afe736dec1b7097c8f04f41404a92cca pinctrl: mediatek: Add driver for MT6858
date:   33 hours ago
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-003-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120837.q7gMeHcY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120837.q7gMeHcY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607120837.q7gMeHcY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/pinctrl/mediatek/pinctrl-mt6858.o:(.data+0xa0): undefined reference to `mtk_paris_pinctrl_pm_ops'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
