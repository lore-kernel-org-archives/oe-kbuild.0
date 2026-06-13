Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC6282F12
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jun 2026 05:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781327370; cv=none; b=XZbByQ7hdpdLgHZlHbZKcnnGDSowwW5DUeIPCBXcLqpij/TVTFNq9euoM5xfxTyrWk17pn7UYqnIsL7mY0xJh7Yv9cfvJ1r5uqkfu0p2x3/Vhugo+ANxRhfAPN7KJ6wh5Mn/XIAR3T2XB5ADxOnw4hATAx2GVcEoH+WEFQA/rD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781327370; c=relaxed/simple;
	bh=e5yEZrS7a+befZ4uYqX7kAii4ut0tAY3VGVAhvOdf4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l2X2avj6pKD57MDUgGzg2uDxDmGkZMH9oSYyOkcNQzo2GyB2W/nXgtzXeA3tHVlybH+DaoM5iKHXArvIX0Zfu/AOhtVWEoGOaLXIK988nSFhjJsGILtgQbWR/uWIWDVyO/kjGhqr1FXRM+ssPvxN4pRpK936FrZu9wk0doeQne4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENIDA0kt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENIDA0kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781327369; x=1812863369;
  h=date:from:to:cc:subject:message-id;
  bh=e5yEZrS7a+befZ4uYqX7kAii4ut0tAY3VGVAhvOdf4A=;
  b=ENIDA0ktl/SrsRuoqIjDFr7L1tMWEpl4vx6/od76nyB821fk52Rmi920
   DdnSBEG8qKhkD68NTx5jClHULpA7HswxeVy3Rkr/cdN8nE6mqGUX9gpKT
   j+RxCya+T6Pd16MB+2LOzOT25Rjuomm6PkzgyaXmgubq2ffPU9hwE8MAX
   ZwdFaR6PXJMtOTaclqR/DcH26AuMdFdsn0TiwmmaWis9SF5VcLMOCYn/k
   zDXM2yJmSwXuS/v0B0HVGsj7zjSfrqZpol2Z05Bg6xj4sg7x/UYiGrqDj
   wK04wWMV/G3I71+0Bt6H9M3VwcJB4vxosFfFp6YEvI7++ToTLxs+YMBGH
   Q==;
X-CSE-ConnectionGUID: WX8RlWEDRomo/5A9cUU4Sg==
X-CSE-MsgGUID: 9IHLrj4FSLePhCdP/CDW/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81899485"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="81899485"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 22:09:29 -0700
X-CSE-ConnectionGUID: dqtEyvUgTkSeKYkbDKkgYw==
X-CSE-MsgGUID: UdrMWb8jRSS69dWpjS8kNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="277191103"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 22:09:28 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYGcX-00000000Pgw-3ZW4;
	Sat, 13 Jun 2026 05:09:25 +0000
Date: Sat, 13 Jun 2026 13:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/base/regmap/regmap-irq.o: warning: objtool:
 read_irq_data+0x6d8: unreachable instruction
Message-ID: <202606131353.cjEkOhLi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mathieu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 1c12fbdf40e17df2efc24bf2009a0c3bfa75bfa7 regmap: irq: Add support for chips without separate IRQ status
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r064-20260608 (https://download.01.org/0day-ci/archive/20260613/202606131353.cjEkOhLi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131353.cjEkOhLi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1c12fbdf40e1 ("regmap: irq: Add support for chips without separate IRQ status")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606131353.cjEkOhLi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/regmap/regmap-irq.o: warning: objtool: read_irq_data+0x6d8: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
