Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793071572;
	b=kBl6gz6i/NTw+2yqcdU7iYeItSFsFtkXPEVhsDr2pueajtg//h7lLeOu1z8glMf49fTh
	 Y/AcE8IDjsk6GJiTgyUYzYcW6wYTGlr+ZuDS7ae+DwIQ71C5e4H0Na8vTS80XsFOO+9Gf
	 vz+hugXtCPNq4eBamPCu43i1bUgE8NH/P6URUFj0s6t+h/9AwL7CpsDefFkV1HBjeknKD
	 ZosBB24CXozc/zuxCY5nt/qAzQx+mw3eQmY6uxBANlZ4YeFtlGodN8/RmVHdDI+RFQ+Uj
	 XIbxqILB3UPcXQO/lF/awtE/cbIIP9USRSr/kipTEJLA5uZb+CyCLJU3T8bATotnB5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793071572;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Qv8keUD1iiNgDKz8X/G7I2op0Gkd6KHtQUuHY95kQ3c=;
	b=MmjZMStKSFZ5MHT7ixJHBxnbAvatHDO3RljR9dtppEGkUxtTAAi1uFLDPu1W0AQkkge0
	 1Lrmgthj+rxP/Siw45gr/9/qVQNTw5hIKc6THMq0L8t3byjpu+/Tiqqm3SgDZOMbwplgn
	 OqN5dmI1UmnGBU6f57L8zHj6vkTh/btC8JTb9hjsBX7MXk5mvJXerDnI3s30KqJ7OvdCC
	 ZTSSEYV2Br9sqtQqkj18ZqOIQ/BSy+E7nExsg9vuGb9lqC7rhU1jGkhyptQMSb7uVvepV
	 YrGbpsuNhfPTe9N09YfvrmHm8laJUYmbjWbdu9KpooKI6C5t4Z3yJPTl5ikU5Cl6P4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y7OXRuQt;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81339606A31A
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Oct 2026 03:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81339606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y7OXRuQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793071571; x=1824607571;
  h=date:from:to:cc:subject:message-id;
  bh=RtCodKQIwIrFzfYZPxpw0J6h2nxy3laW1QbdqjGYh0s=;
  b=Y7OXRuQtQLVqgAe+Ad8Hw7vIGpdztnPXn0ZOJKxjpVR/ZHeQ+W6Bj8Pu
   F0uwtLP5v4YATL6C3LUHAGSB6qvWOIsAuoGlitLXh3W5UR4cN1TckBphf
   BQdn66Q0O13WMoKWXrPptZIJDG0b6wfy9Tguewmxwsx9am/35PxwPT35Y
   07AY4xR0+/6dQbKv3XL9ENO+Tg+5TwEvp8reHcKTGy0Nn0/HVhHgtO2yn
   sCjaULiX5WTGm4tqrqurqRS+bzm8oWYSc3Ri/15+v84B5i7QlWRhWWvHW
   mtBJkgLy41ceBMnYANIGArosLqtBRAsz1MnyLXPyDmD5uXg2+xDTm6F0n
   Q==;
X-CSE-ConnectionGUID: Aw/28qHXTi2Ifp+9nSeAvA==
X-CSE-MsgGUID: RdPPfBFZRFGXwdYV9hf2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1663567"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1663567"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 20:26:11 -0700
X-CSE-ConnectionGUID: A1KUwDhlR3u/RX8Yi5qj2A==
X-CSE-MsgGUID: jX3G82D0TvmoQ+sD2QF9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4541754"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2026 20:26:10 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLXpA-000000004N5-1DqY;
	Tue, 27 Oct 2026 03:26:08 +0000
Date: Tue, 27 Oct 2026 04:25:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-ethernet 5/23]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@1:
 'enable-method' is a dependency of 'cpu-release-addr'
Message-ID: <202610270441.vqm5jvyo-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-ethernet
head:   cf136d48dabcbf056cf26e3c3377ac8cdf4b5b80
commit: b4d7379cc8f031b6b41b74cb1cb27f5681303cf2 [5/23] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610270441.vqm5jvyo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610270441.vqm5jvyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610270441.vqm5jvyo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpus: cpu@1: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@1 (arm,cortex-a7): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: cpu@1 (arm,cortex-a7): Unevaluated properties are not allowed ('device_type', 'next-level-cache' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
