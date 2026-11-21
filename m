Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225707;
	b=2L8QFfAD3Yp3NXBYM0pi9PHAbWl7bPItKSm/8OK63jlv+kHrJlJwqq5lH44xJFPU08hB
	 KBaRYpS556CRle2YFWv/6iYCYaf7A7rV9KUmod5nbE+aWYCkHj/AzxYca+G1vnOFE1Wm9
	 xV62sMdVtXclEfksD4tDwioYZZbJWYg9oiqcPB2gcSq1QUwr6uffWNEokSPdWA+ng+9fy
	 pIXHUbBsFkB/FzkkUUQF3I/NwhpcRTNk67wqlLk0MUxwBQjfwWz5DYxAbpJkYgDlTJWYW
	 fz64kw/BiZazMea3ve5FJoXXlOXrJaVdfIsWAnqT3z3wsaQ1wvYGec3oMI6rrAbjQRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225707;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=rcoTbZKFSvxvwge/m6zqQVR8w1IM3FwijuNTGk17Xsw=;
	b=af3YFgjmOPJ0XHl8Wao1f7qPX5YK5Jj3GwlfZAUQKqeXtjmXMHlaa64+6GFFTiaE2G/p
	 7DgeFleSxudkKlU56WZw1YI9ComjYi6VERxc/iO0Bxzr1iZ6qnhCIsojuKStJsvt4oHbI
	 6Y6y4TeH/3B5jYcgMWqtlfJe0k8xb83wGU/4jq58tLXzZGrAMSJKvlVQdV3WVGS/S6Bad
	 2m4XLNuE/5kihbW9V8coUfhc7/juuIljSkz4hPdk01wI8493aCn9MpYILwrGRVEp+OdJX
	 GdW3amRjCmSMA/+h1tgGoWAHO+gws1DLjuaQtwESBZT2IY+PfsmfO5rsOYiGT3EV6Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mb88oaaJ;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B653606A696
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 01:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B653606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mb88oaaJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795225705; x=1826761705;
  h=date:from:to:cc:subject:message-id;
  bh=he5opOtsQeQQeTwSFeZEP0opqowaK15JMpg+6BLXJOQ=;
  b=Mb88oaaJCtVPJ+Y1rNJ9CojBY1XBIIOCcayIrJFmr79WbUxU7H/SnTvr
   d66VHtng84tJDjGBZ1krTVaTGNt7xQZH2OULJI58ff4VAVyX3crsZkZN+
   mbA2aRFjbd2RvLdzlQox56nhuDl56Hm1Yy2IjVldvh+U4pqtH5eSBTAIv
   s27YzNXofKHCk24VGlehOYeCcbl869/BWv7xwrGAa9OPaJeYGFM+S3fta
   s3A8hBBWTZu3yh1QE/4B44nvpzpfMJP1JBL2Skxmmez8YIuIeQLq7M8CH
   QKI1w3DoWKLSpCJwj9jNwrd7fRXd2tuGrBkpJDqRtZhoNmXtJKde2mhXe
   g==;
X-CSE-ConnectionGUID: dV7n04JrRuu8YYhFTbm3Ng==
X-CSE-MsgGUID: KDkU3UJOTSqqs2QO1gFr7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3995855"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3995855"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 17:48:25 -0800
X-CSE-ConnectionGUID: HMrtbDndRy+p/3Z62KsJkQ==
X-CSE-MsgGUID: FWrArmcfQyilpL3F4qv0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11042445"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2026 17:48:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUaDF-000000004D3-4655;
	Sat, 21 Nov 2026 01:48:21 +0000
Date: Sat, 21 Nov 2026 02:48:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lpieralisi:b4/acpi-static-table-irq-probe-defer-v2 3/10]
 include/linux/acpi.h:71:3: error: call to undeclared function 'FIELD_PREP';
 ISO C99 and later do not support implicit function declarations
Message-ID: <20261121024145.PCQf9iwI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Lorenzo Pieralisi <lpieralisi@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/acpi-static-table-irq-probe-defer-v2
head:   a75860f203b994ab67f8a876c7f568ac0f7f84c0
commit: 5df91ea5bcbef51cb967f3a07dd7c69c50681213 [3/10] ACPI: Introduce irq_get() for static fwnodes
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-2004-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121024145.PCQf9iwI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121024145.PCQf9iwI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121024145.PCQf9iwI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/acpi.h:71:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> Unable to generate bindings: clang diagnosed error: include/linux/acpi.h:71:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]


vim +/FIELD_PREP +71 include/linux/acpi.h

5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  69  
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  70  #define ACPI_STATIC_IRQ_FLAGS(trigger, polarity) \
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04 @71  	(FIELD_PREP(ACPI_STATIC_IRQ_TRIGGER_MASK, (trigger))	| \
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  72  	 FIELD_PREP(ACPI_STATIC_IRQ_POLARITY_MASK, (polarity)))
5df91ea5bcbef51 Lorenzo Pieralisi 2026-09-04  73  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
