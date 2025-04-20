Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4BC259C
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Apr 2025 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745112646; cv=none; b=gGHGLQbti52xf0YHWQxtCttfa+h3cBp/AsBxesGnI9/GWtW4edS6J0Ymh4N4EVeHEdWDfv0+ACA2jGU8i/knwKE2Nshr6+7+dcPbamV/SRmccyqn20xJ+2rsVb4wLvUxNytGcO+bD1RjhdIRxysi89ApWv75hcfIjSZfbSAq+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745112646; c=relaxed/simple;
	bh=bEpHOg2Xm59aeyhtk+jg4EeeUMMMhSyH+ytSALOfANQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ryAimFB/nfjo0xf3b0BFqufNmKzayxcQfsKaeet6xbi8G+0fGBOE+a3cQK0CkVhb+OSv+6WpmGDEdsmUAVMgkhFU87IeadIRzNPgGJfIOfgZceaJGdoESZ1iaaOOTg7mDoCIa00RGgjyz8flTfXkN5RNTaxn4suK2r2dDxwZmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGRnLKtB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGRnLKtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745112644; x=1776648644;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bEpHOg2Xm59aeyhtk+jg4EeeUMMMhSyH+ytSALOfANQ=;
  b=nGRnLKtBTRYJKV5nPQNVGaqibLqsM+BgYzM4QI1xKKFZXSv4N9XKMwik
   WEb9OjqQY3G/3SpLg4r5URNesRu10igUuLxga57aRIqVZy0FZLJkHuXCd
   OP8N5KrsYxQa5u8ogaIQWGOE6IK4kSIbhBSgDVpXqGObgZPGyoxcN7+tj
   V16VdzY9tf92s9U46K+9DvPRhmT2nLLlTlI/5toLZmnZGxhxjagZxtqDn
   rc1/82ntEfeQE4B2dClZLn3PpnzW/1DcaY0WzBTwDxOzr9rHHA+byJVxi
   O4XHVnLDYVmU7VaviuWsQ+aIZMDlSe7Tph7XP6g/N3b+TH6K3424OuVRD
   w==;
X-CSE-ConnectionGUID: mJQXHwOzT3SfW/f544z2Cw==
X-CSE-MsgGUID: jzgBYIV+SDCnXVJyHSFlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="49355633"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="49355633"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 18:30:43 -0700
X-CSE-ConnectionGUID: m5M+tMS6RGuU7qCZR4StpQ==
X-CSE-MsgGUID: 428ybTTYT2iBF6LcpsenFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131356546"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Apr 2025 18:30:43 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6JW3-0004Jt-1p;
	Sun, 20 Apr 2025 01:30:39 +0000
Date: Sun, 20 Apr 2025 09:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/4] powerpc: 512x: Rename wdt@ node to watchdog@
Message-ID: <202504200954.cBjuIpvJ-lkp@intel.com>
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
In-Reply-To: <20250418-watchdog-v1-1-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-1-987ff2046272@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Naveen N Rao <naveen@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-512x-Rename-wdt-node-to-watchdog/20250419-033055
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250418-watchdog-v1-1-987ff2046272%40posteo.net
patch subject: [PATCH 1/4] powerpc: 512x: Rename wdt@ node to watchdog@
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc-randconfig-052-20250420 (https://download.01.org/0day-ci/archive/20250420/202504200954.cBjuIpvJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200954.cBjuIpvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504200954.cBjuIpvJ-lkp@intel.com/

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
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
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
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
   arch/powerpc/boot/dts/pdm360ng.dtb: /sram@30000000: failed to match any schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/pdm360ng.dtb: /nfc@40000000: failed to match any schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /localbus@80000020: failed to match any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/pdm360ng.dtb: mram0@2,0 (mtd-ram): $nodename:0: 'mram0@2,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: mram1@2,10000 (mtd-ram): $nodename:0: 'mram1@2,10000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000: failed to match any schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipic']
>> arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/watchdog@900: failed to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/rtc@a00: failed to match any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/reset@e00: failed to match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/clock@f00: failed to match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/pmc@1000: failed to match any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/pdm360ng.dtb: gpio@1100 (fsl,mpc5121-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1300: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1380: failed to match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/sdhc@1500: failed to match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/pdm360ng.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
