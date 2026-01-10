Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B531A17C69
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 13:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768050958; cv=none; b=qD/vrdAL/4goPySUNu351NYk9xhcBwgZpldGBcvNYsi2Goa9E/lA5u2fkeMPk77w9g+GvRNbfdLWJDWPZuDyOCAi27PeSdI4Oc1EhSAqcZf0bm8UCHYrReX3i08CcbAOonm3VV53rOkM6y/YzAP3czl+tMSyUbGqZjqi+IokfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768050958; c=relaxed/simple;
	bh=/stlikl+q73i2RIC7Y1OvCCh3CXO/mRDEm5zsv1Qszk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M+lhInf/FkA/fWCtj2lZ59S6quU/QL4vhKn5btf7nYA5WCCPRTPx49s+wVkqQ2SV9FzvKzq4o2XJG1HTe5WKYcrilNSlNVGwvZRR618uIQDS8WXt/vhCJ2vVs7y9pcEO4s2PNwfjwu3HnWRcPnq/Db3rv6IqbAboEMF3Zq89NAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrJ418uB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrJ418uB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768050956; x=1799586956;
  h=date:from:to:cc:subject:message-id;
  bh=/stlikl+q73i2RIC7Y1OvCCh3CXO/mRDEm5zsv1Qszk=;
  b=SrJ418uB2vlHSHHC6061HxsEDIjewJzir7XpFChq6GejQNXH0x/0zvhs
   3vRqtQwBYLpJ8oy7g3WnFhEYheYxKi71VFJfN5NTQMIxf1rau8OixIxXB
   /ES9hWg7I5kKIRIt2PnNUoDIAApWmRZRBjSZ512yuCynmDGulFdxhhBwV
   GF+5evjJXm5OZs71gkwsddlT/i2aloPliTxESO8166iH8Mc/zIxcP7vDI
   tGZQJZIyNwpTtQ2Sx8zmkPZlcqU1DiatjI917X82+RLwIMDxyKm3gHfWt
   F4HaSyjNwtTAoi5mQlwZvGNuC3oHx9+RS/jtXBYJj6s7EjCnwPI5KCnjW
   A==;
X-CSE-ConnectionGUID: BNr52tvaRcucXFezZZOfYQ==
X-CSE-MsgGUID: NIymDUJyQguZ7MdbjQaZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69334960"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69334960"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 05:15:56 -0800
X-CSE-ConnectionGUID: 8uQmn1gTTvuGw24HWEdrsQ==
X-CSE-MsgGUID: qHQBNc6dSzKMPbSnfOY60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203709570"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Jan 2026 05:15:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veYor-000000008fm-1twr;
	Sat, 10 Jan 2026 13:15:53 +0000
Date: Sat, 10 Jan 2026 21:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lee-leds:for-leds-next 3/10]
 drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601102106.gMVy9BeS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-leds@vger.kernel.org
TO: Steffen Trumtrar <s.trumtrar@pengutronix.de>
CC: Lee Jones <lee@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   e257dc532c20bd93f0076c18cb5ffd739a5f0bb4
commit: 51f7560294c911e9394357a903ffa28eebe4b253 [3/10] leds: Add support for TI LP5860 LED driver chip
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
config: sh-randconfig-r113-20260110 (https://download.01.org/0day-ci/archive/20260110/202601102106.gMVy9BeS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601102106.gMVy9BeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601102106.gMVy9BeS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:87:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/leds/rgb/leds-lp5860-spi.c:88:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/leds/rgb/leds-lp5860-spi.c:89:1: sparse: sparse: bad integer constant expression
   drivers/leds/rgb/leds-lp5860-spi.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +87 drivers/leds/rgb/leds-lp5860-spi.c

51f7560294c911 Steffen Trumtrar 2025-12-01  86  
51f7560294c911 Steffen Trumtrar 2025-12-01 @87  MODULE_AUTHOR("Steffen Trumtrar <kernel@pengutronix.de>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
