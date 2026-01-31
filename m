Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33DC36998C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 20:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769891541; cv=none; b=CLuOqbfrIWMDIoGRvh9ZT3jWnKlsfJPfwj6eR4b5CDTiU06KlyI7Rmwe53ZkPe+CuatAuLL3IB1jXg4cVSDAY0YY8/YM6MarwT+VvIkiUeoilZaZfsphnC7WyTBkptIJCwq37S9d4QeUMeccLrjdkm4UznfmFZvAnden9jfctPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769891541; c=relaxed/simple;
	bh=TB5me7rzttBbnWT5OhNcmllR2LAHPpfc4H88pW7cDf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KEfj/ZXhQHnqx5NaLcEp4RX8BoCFcAwvEqDR/cjHeBlaT6pe2ESXV0LZdn0F1qPJcIF9P5axSMMvKDPA38J5R2wkRtp55nOHEE3UaHbrCuNmGShUEjgpAp+H8AwwW8k5HH0mQXcyP1zQdDf9IKy1j0WsIND/qM3u7fFPVHf4blw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+NmoSwi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+NmoSwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769891540; x=1801427540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TB5me7rzttBbnWT5OhNcmllR2LAHPpfc4H88pW7cDf8=;
  b=b+NmoSwikxy1X38uVoTJcsrZX5FdZMre2JWsm4OwQ6b1GkUW2aOTLIb0
   fvYY8XvuLv1k/S9rlYGkdtbB2C1cXmPThcLS3uVYrFUVvC2ow66WdOkfz
   HxuCwzRml3mzDCPk85UIDAKQKegOK9GDqpOAdLz+YqAY/Opmc4AzNAwCa
   Bx/9lPo1Y3PfMgUDum7y5UPimFp8xPwEFFJhsiV/X8rwds3FiGr40vLEe
   sfxV9QG1NV4D5ljSINqo70cupjrd+1jeRje3Tzu2e1JuVUAzETlbTWc1f
   hru8IbsdkP+FQdlKMqnSqOf6hfJ5Gp8/1/jZnq9RpvUnAirmwPC/5CfPA
   g==;
X-CSE-ConnectionGUID: 4copkRsrTcKkJMar3U3qlw==
X-CSE-MsgGUID: FFWuwggnTlyj5lhm/DKh1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="74968878"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="74968878"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 12:32:19 -0800
X-CSE-ConnectionGUID: Ja9iNSJhSHq1fLmL3AnoIg==
X-CSE-MsgGUID: tNT+PuxMQxqp2+rxCHICXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="246740784"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2026 12:32:18 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmHdf-000000002kH-1c13;
	Sat, 31 Jan 2026 20:32:15 +0000
Date: Sat, 31 Jan 2026 21:31:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:test-dma-heaps 1/3]
 arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: gpio-keys (gpio-keys):
 'poweroff' does not match any of the regexes:
 =?us-ascii?Q?'^(button|event|key|switch|(button|event|key|switch)-[a-z0-9?=
 =?us-ascii?Q?-]+|[a-z0-9-]+-(button|event|key|switch))$',?=
 '^pinctrl-[0-9]+$'
Message-ID: <202601312134.OMmCF5uJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maxime Ripard <mripard@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git test-dma-heaps
head:   cf4a57f0f42a01f8eb0546a7f37d100db6e969e7
commit: cea6ac2eadfb5ef99e659a4e9593119ddd2f90c2 [1/3] [HACK] arm64: dts: Add qemu test device tree
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260131/202601312134.OMmCF5uJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312134.OMmCF5uJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601312134.OMmCF5uJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dts:275.3-21: Warning (clocks_property): /pl061@9030000:clocks: cell 0 is not a phandle reference
   arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dts:301.3-21: Warning (clocks_property): /pl031@9010000:clocks: cell 0 is not a phandle reference
   arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dts:309.3-28: Warning (clocks_property): /pl011@9000000:clocks: cell 0 is not a phandle reference
   arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dts:309.3-28: Warning (clocks_property): /pl011@9000000:clocks: cell 1 is not a phandle reference
   arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dts:266.4-31: Warning (gpios_property): /gpio-keys/poweroff:gpios: cell 0 is not a phandle reference
>> arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: gpio-keys (gpio-keys): 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
>> arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: pl061@9030000 (arm,pl061): $nodename:0: 'pl061@9030000' does not match '^gpio@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/pl061-gpio.yaml
>> arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: pl031@9010000 (arm,pl031): $nodename:0: 'pl031@9010000' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/arm,pl031.yaml
>> arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: pl011@9000000 (arm,pl011): $nodename:0: 'pl011@9000000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml
>> arch/arm64/boot/dts/arm/qemu-virt-with-ecc.dtb: intc@8000000 (arm,cortex-a15-gic): $nodename:0: 'intc@8000000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
