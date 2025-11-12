Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8422D2384
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Nov 2025 05:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762925053; cv=none; b=DAdu9CenbEplOEmcZYVepaIxiIXs8rtsgp7pDEY3Jf0FAQqst8Ri76t+Jl9OYCIbhGZO8a8qSjPmZ7tzrFM938jlq4p9e4jBfXFCCb5ebpq7kzgbwwZBdFe85rF1zM6Muth4vu07AwAukiXIWEJWc7Fuuys5dSDBwCKkm8naLeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762925053; c=relaxed/simple;
	bh=HwsT7rqcjZTWUGrO3OJaVvFwWR75vHhvb8oMtVW5fjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lR7DiKNbxxVkE8AEdMFMDVKKOqhgV75LeeGugI0HwfWCPJQs8E3mezGD1yAdG3/P2vspb1SVufSBIodhUf5sTH+MTPNBV2e4vGFX1B2v1it+w5U8sDMPm8JWyyifyEO+GC+5APMYnrzPHB/IzRiQgy4slGhfMWEWqDviDfKjhvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fom9Vq00; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fom9Vq00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762925051; x=1794461051;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HwsT7rqcjZTWUGrO3OJaVvFwWR75vHhvb8oMtVW5fjU=;
  b=fom9Vq00AV9Kk/EFhXrydfz49T08OxBoxNsG31CYyHxIH8k7coVGyQYs
   UofS31FKnT4uC1b9U7nOnyJzlfPm4Vih8dy/C2s/P7UayAxVdvK6szWB5
   xOIwK0ZMgE3n2VR3V7fVnydKrBa5Zf0XaxM1TMuUdDXArRBAVKTiNZk09
   grrALWQ2gp7xNjaT9dwf+/WW2mnZnlj+NeRSnplpEiSOi/y4PRQbvhxk2
   Y5s5gl3kvLgGDCfogSojLAEC21nGTcXZfH+UtV+EYlXUusAKNmmtb+Okr
   kK0gSYOx4qSDANz/c/PHM9i+8fl7ODDT2nAm+EL26RPxXeq5xLAQEhxqA
   A==;
X-CSE-ConnectionGUID: 2/2WV6AYTfmUvSd1OSR0yQ==
X-CSE-MsgGUID: s7dddz6bSdKlw3fZRk8Dpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="68844407"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="68844407"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 21:24:10 -0800
X-CSE-ConnectionGUID: 9lUHHtJ0Tr+fHMlXVN+Dtg==
X-CSE-MsgGUID: yvFauDybTI6vP6dJOcXTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="194331792"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2025 21:24:09 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJ3Kx-000000004HM-0HAK;
	Wed, 12 Nov 2025 05:24:07 +0000
Date: Wed, 12 Nov 2025 06:24:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [powerpc:next-test 11/17] arch/powerpc/boot/dts/ac14xx.dtb:
 /soc@80000000/watchdog@900: failed to match any schema with compatible:
 ['fsl,mpc5121-wdt']
Message-ID: <202511120646.XRCyyPAr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linuxppc-dev@lists.ozlabs.org
TO: "J. Neuschäfer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   2617bd81ae54128e63e764c48935e572e3dee501
commit: 0070b2cbfe7389159669c3a5bb23d2ef89043055 [11/17] powerpc: 512x: Rename wdt@ node to watchdog@
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc-randconfig-2051-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120646.XRCyyPAr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 00d2780cca3438c3f2ce56a2f9d5549bbcb67131)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120646.XRCyyPAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511120646.XRCyyPAr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ac14xx.dtb: /nfc@40000000: failed to match any schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020: failed to match any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/fram@1,0: failed to match any schema with compatible: ['ifm,ac14xx-fram', 'linux,uio-pdrv-genirq']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/fram@1,0: failed to match any schema with compatible: ['ifm,ac14xx-fram', 'linux,uio-pdrv-genirq']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/asi@2,0: failed to match any schema with compatible: ['ifm,ac14xx-asi-fpga']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/netx@3,0: failed to match any schema with compatible: ['ifm,netx']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/safety@5,0: failed to match any schema with compatible: ['ifm,safety']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
>> arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/watchdog@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121rev2-clock', 'fsl,mpc5121-clock']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121rev2-clock', 'fsl,mpc5121-clock']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/ac14xx.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/mpc5121ads.dtb: /mbx@20000000: failed to match any schema with compatible: ['fsl,mpc5121-mbx']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /nfc@40000000: failed to match any schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020: failed to match any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/board-control@2,0: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/pic@2,a: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld-pic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
>> arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/watchdog@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: gpio@1100 (fsl,mpc5121-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
   arch/powerpc/boot/dts/pdm360ng.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/pdm360ng.dtb: /nfc@40000000: failed to match any schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /localbus@80000020: failed to match any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/pdm360ng.dtb: mram0@2,0 (mtd-ram): $nodename:0: 'mram0@2,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: mram1@2,10000 (mtd-ram): $nodename:0: 'mram1@2,10000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
>> arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/watchdog@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/pdm360ng.dtb: gpio@1100 (fsl,mpc5121-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/pdm360ng.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
