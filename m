Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901630BB86
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580412; cv=none; b=h81HEFV9gcT80YKwpT65TLC6gXl9TiltfOdnK4MZgGQ6nSoxfhDM5JflcVRaL9v7JGFXkVZoobmEGFz5qLPdBkUIy/9OW3Pvx0g4fdmN0z39+GGTM7PtKHjiwff6IyiHyvvOt8qIHfOVJkzxG+zRtH3Q9IqoIhPAlBcs5Av4WIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580412; c=relaxed/simple;
	bh=FUftZ723+aooRByFDRtH3OlY6D1ad4xGgvls5osGU/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mpqjG+G26avyPd1CXFzbD5Zsri6bpHF7oVnMlwO+MsZhzjMu9xkFCa0Jp5uervvxdUHsV730wK5/pGsO4PM282CGm2xwVrqDDNvtqGX25aTi2BEMmJzu4t3LFfzbchraWhLSbwK8c1XO8bciMbbZ6SGM+iPzGrd3oL8JSHEYhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfNqOnZq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfNqOnZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768580411; x=1800116411;
  h=date:from:to:cc:subject:message-id;
  bh=FUftZ723+aooRByFDRtH3OlY6D1ad4xGgvls5osGU/U=;
  b=jfNqOnZqz6q0iJhBt2PtIi2ldJ9bhOBnpFQE6NYCA/0vOJZRKJcnz9nZ
   /e4cyU8am4tW3ZZR6f7c1inWQ3UlLmPd4ubqFP0mNNLXUKEQa7peSzRlA
   vzHJyhFVPRho3ZkwD2hvASpWFaWNssQtBn6Ph9bziRNqlESeKl1TzmC1u
   d79vMwDHVXipxrxGwtmM3KyOrEcneA+b39FnJQVl52k89iLdCaiBfAZ4w
   L3MT7+iFDTOu7nmxQUzEwcUBcgwSS6FpPPQBtowMXNgINaVWOYrM/94WQ
   lmk+SYsVdw6eaiJ4Rx1gbxelg2LbuTnjhNsWM/eAaEpozenLt0awteuEJ
   Q==;
X-CSE-ConnectionGUID: TfsGprXiS9y7v8vjLvfMpA==
X-CSE-MsgGUID: LbJX6nkRR+KbaSIP3DOKJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69099069"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="69099069"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 08:20:10 -0800
X-CSE-ConnectionGUID: aC6Qa2p7Sey6pIUJB2j1aQ==
X-CSE-MsgGUID: wsIhym0JTKqfAztrSXg9Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="228292739"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2026 08:20:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgmYR-00000000L2O-0Nvg;
	Fri, 16 Jan 2026 16:20:07 +0000
Date: Sat, 17 Jan 2026 00:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5534/6849]
 drivers/gpio/gpio-bd72720.c:279:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601170055.OiQ239vr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpio/gpio-bd72720.c:279:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>
CC: Lee Jones <lee@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: 6b367741e01430947f66ad863bfc1e57ad42b7bc [5534/6849] gpio: Support ROHM BD72720 gpios
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: csky-randconfig-r131-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170055.OiQ239vr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170055.OiQ239vr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601170055.OiQ239vr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-bd72720.c:279:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-bd72720.c:279:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-bd72720.c:280:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-bd72720.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-bd72720.c:281:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-bd72720.c:281:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpio/gpio-bd72720.c:281:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-bd72720.c:281:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +279 drivers/gpio/gpio-bd72720.c

6b367741e014309 Matti Vaittinen 2025-12-15  278  
6b367741e014309 Matti Vaittinen 2025-12-15 @279  MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
