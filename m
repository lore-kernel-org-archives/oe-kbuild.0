Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46F3F99E3
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041084; cv=none; b=MDFNjENdz1ROJKMKMdMOfwzen42ROmuTgJVMojnYOrvaU3RvnZN5RbWuhW9YYwCqx3cRke7jM0ZN3vWkKfzHkHqBDutRl9bHXflkf92K+42xhbodp63USfBlpPg1L3tiCReFmJRyTqFfFP+8AU7jqVlWa0Ngt4Xe0YtHSFjmDaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041084; c=relaxed/simple;
	bh=3RTQno6FtgvtenhM73PlOFq8qiqtT4vskI08lMCwLFg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sTnf3f75/Dm8z6ghIxZnSFWzV1PGUXoAmOOmdd37EVw3O6yWUGX+nazF5r+HQGKpzTIXc00xbYKQpcSB1iUUZTe2JhqvXuFoNtoJSTBi8dLl9fqpMhoIBAjpRl9hrakGV4EnogF3c1+DF6EahIKSFQiuSVAENi6R/8KHwmO59kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byxGx8SX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byxGx8SX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775041082; x=1806577082;
  h=date:from:to:cc:subject:message-id;
  bh=3RTQno6FtgvtenhM73PlOFq8qiqtT4vskI08lMCwLFg=;
  b=byxGx8SXVcry78226j5DmVYObspbZJvOoatUWvc3/9+ATtOXKfaCa93A
   vOcQBOdqXHGP/UJXVCk9NNaGg8hw3WSkkn+LGKX75rgVTcZhI9mg+vlfT
   VBlcfp8TNNOEFG7ZMJ80iwLT/cIU2VrsCo85NQwO6pZazA6nalGh0ONNU
   JOj9OxCt6ARkwW2dw2xCe/GwqInMbplQNfkXlztL2pXgOhgdIJ2kj/j44
   JswWmQDwA+I+9RM9qnJA7LxK10Td3o5Y/pALL8yCslIgsPmWX0NfE7pYP
   4wIvE8Q+q8pg6QIDYZs+7kjQsyhIkNCM2TYXPt8zrsOEPt/nkrOJx+PQ+
   Q==;
X-CSE-ConnectionGUID: L2W7BPPgRjyqLeOBhj/W0A==
X-CSE-MsgGUID: nMqFdh1iQWePr5aGoX6y8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79681204"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79681204"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 03:58:02 -0700
X-CSE-ConnectionGUID: 73XWm63KSc67D3wBP4529g==
X-CSE-MsgGUID: zpHveRowRMeTDzporNhuRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226508882"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 01 Apr 2026 03:58:00 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7tGn-000000008gf-3Q9j;
	Wed, 01 Apr 2026 10:57:57 +0000
Date: Wed, 01 Apr 2026 12:57:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:riscv-dt-for-next 8/8]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000
 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202604011214.LVm2WDcg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor.dooley@microchip.com>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-dt-for-next
head:   b0258f69f1e0ed98e8506706da9ef538389b27ea
commit: b0258f69f1e0ed98e8506706da9ef538389b27ea [8/8] riscv: dts: microchip: update mpfs gpio interrupts to better match the SoC
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: riscv-randconfig-2051-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011214.LVm2WDcg-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev9+g4cd3cdfac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011214.LVm2WDcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604011214.LVm2WDcg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/can/microchip,mpfs-can.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']
--
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: syscon@20002000 (microchip,mpfs-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,mpfs-irqmux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
