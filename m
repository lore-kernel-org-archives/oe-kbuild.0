Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B245219A70
	for <oe-kbuild@lists.linux.dev>; Fri, 30 May 2025 15:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617590; cv=none; b=BRAUi9LO/ldFU2yET5NYebZ3PPV6NvxOL1xy4k9Q+oi4cA3Xj609fECsF7O6s+1HwqmY0x+SIy4y2mJQaWvUlxHZiwGrSwkbHCFWWfFZP/o0jYo2ACMbMx27lXjzC6vSRRNrL5crjb8MSeYfT4AVwVEpSXDHTD8v6bxfAgITY7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617590; c=relaxed/simple;
	bh=f6cWn0MqcHMQ7BWWhgtWbLzoK2rGZU5F8BwfTt9frwo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u1pl5uWhbc6t3sKcx6BV1Y80EPkwZGjeBtMhtuDc4K9Hv3zlBimXb+HZvuOJ4PkjE0LoKiCOW9E4Hkx3GX+nHlWoqRCzBQd0884hq9rzF7B/D0B3dxYcBfU5tswILEWvZhX6HmBQBppaAgRtsQdCj5cQFVzqrCuEhzksmcamdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9Jr3Gcb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9Jr3Gcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748617590; x=1780153590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6cWn0MqcHMQ7BWWhgtWbLzoK2rGZU5F8BwfTt9frwo=;
  b=I9Jr3Gcby2KCTWqaX9tdLp5Dxh/z/K6M7Qwqsn/4xzrhRF8TEc5jWHO1
   CnA8UHV1sEA7DB3mlY1He1kV1CSYA0MOHPnmzlqIIckgOV0qeJThcAUq2
   D/dpnuPjIn6+iAYyAbxOJP2GSQy1Gu6XrKLBUMsOx+PoewQ4H+zyC0wlT
   BykxnPrurrwglHO1AFkPGLHn3pEQcPbeyOXh4bhENOBZ3qh4MPSt6fxVz
   Y50sKS2iZjZmGGL0k91am7ifzkGD0m51/Jl+o9DIYoIFO89TYu2EugSBp
   X6CnfWyU0DTwKvxj1ZC/bpIJIrcafQzqjnLqJK9EH5MBcmDVs/zwx6/dp
   w==;
X-CSE-ConnectionGUID: G5285h+3Rf+xT5LbW1FtBA==
X-CSE-MsgGUID: ykoSifY1Ri2+tTrOKkR6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54511347"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54511347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 08:06:29 -0700
X-CSE-ConnectionGUID: PpeCb5d9RFGxFUcADcPURw==
X-CSE-MsgGUID: +J0S/ockSmiggC8cfNFQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143735971"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2025 08:06:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL1JR-000Xie-0s;
	Fri, 30 May 2025 15:06:25 +0000
Date: Fri, 30 May 2025 23:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-4 23/44]
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: /
 (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202505302236.GSGuxwTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt64-4
head:   f62bb41740462bf9fde4b110df5c7d3bc223fb3c
commit: a719915e76f2b1390fbed7d40848aaaf7823060c [23/44] arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support
:::::: branch date: 4 days ago
:::::: commit date: 5 weeks ago
config: arm64-randconfig-051-20250530 (https://download.01.org/0day-ci/archive/20250530/202505302236.GSGuxwTf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505302236.GSGuxwTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505302236.GSGuxwTf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2291.12-2301.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: / (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be fixed:
   	['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0'] is too long
>> 	arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: / (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be fixed:
   		['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0'] is too short
   		'shimafuji,kingfisher' was expected
   		'renesas,r8a779g3' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
   		'renesas,r8a779g0' is not one of ['renesas,r8a7795', 'renesas,r8a7796', 'renesas,r8a77961', 'renesas,r8a77965']
   		'renesas,r8a779g0' is not one of ['renesas,r8a779m0', 'renesas,r8a779m1', 'renesas,r8a779m2', 'renesas,r8a779m3', 'renesas,r8a779m4', 'renesas,r8a779m5', 'renesas,r8a779m8', 'renesas,r8a779mb']
   	'retronix,sparrow-hawk' is not one of ['renesas,kzm9d']
   	'retronix,sparrow-hawk' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
   	'retronix,sparrow-hawk' is not one of ['renesas,rza2mevb']
   	'retronix,sparrow-hawk' is not one of ['renesas,kzm9g']
   	'retronix,sparrow-hawk' is not one of ['renesas,ape6evm']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: / (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be fixed:
   	['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0'] is too long
>> 	arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtb: / (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be fixed:
   		['retronix,sparrow-hawk', 'renesas,r8a779g3', 'renesas,r8a779g0'] is too short
   		'shimafuji,kingfisher' was expected
   		'renesas,r8a779g3' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
   		'renesas,r8a779g0' is not one of ['renesas,r8a7795', 'renesas,r8a7796', 'renesas,r8a77961', 'renesas,r8a77965']
   		'renesas,r8a779g0' is not one of ['renesas,r8a779m0', 'renesas,r8a779m1', 'renesas,r8a779m2', 'renesas,r8a779m3', 'renesas,r8a779m4', 'renesas,r8a779m5', 'renesas,r8a779m8', 'renesas,r8a779mb']
   	'retronix,sparrow-hawk' is not one of ['renesas,kzm9d']
   	'retronix,sparrow-hawk' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
   	'retronix,sparrow-hawk' is not one of ['renesas,rza2mevb']
   	'retronix,sparrow-hawk' is not one of ['renesas,kzm9g']
   	'retronix,sparrow-hawk' is not one of ['renesas,ape6evm']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
