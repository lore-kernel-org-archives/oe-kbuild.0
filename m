Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252E3358D2
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250202; cv=none; b=RFM8/XOV03CtzaNxsvT2IBdT/F0K0giFjDDTaHWCn+Q+jROXhAhmzc+QDa5UiGzYhkpxaYopEgz0WrObaH8MnFinois+NhoRE9aUXoR/06nmm82AJkv/Go+Zi7AJISU1xR762ia5ODzgXjKj6CjFbRc7X+JJzm7NhmAywQObq+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250202; c=relaxed/simple;
	bh=Chrz4wFum4mNIW7M8em6niN/9sAoxBA4sSenj3ktyis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=moMB7ven+LtRVt1Fq1c1VftAHXkcbWkMD7rr/5FxLdJnJYGuXxh1GwGTt7xeCGpMtxGpfpn8JQQVNFwahsydib8mRUmFUoDFyKCqe13ivZhEn/WyJKjBeFFvQ4W+/hFKr/t5sMIx8Ri91fHReqOmibWj1AdUdRMH4wnAm+NNniI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVsVxDUn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVsVxDUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768250201; x=1799786201;
  h=date:from:to:cc:subject:message-id;
  bh=Chrz4wFum4mNIW7M8em6niN/9sAoxBA4sSenj3ktyis=;
  b=AVsVxDUnJ/I1Jblmsnc0nI90ceSd1RMFDIC95nPA1F0782RmIELfKx2y
   aRPvYd1ILrZ1VmMkHZ6npZomdI9uX8XqHfw9tv5J/QZxtolyMIuBpugRy
   6lrXyhknVTghBXZbE6VD9LRwkXROJeS9v3y03zm+p2n3gjP7AAS+kFiM+
   iVBkv+K6q6G/HNLfnQk5/1/sKu+3BQwShEZSnLUbdNM2MhI9Gz00oJOTU
   DDO4gp+ncxJyl+Ku33AGMwfrg0DS2aJ54ZIUfXbQubGKryxDuojzGRmFF
   ARk50LDShQdo8NZBxlOJHLIHR7N1fTX/MbfELw+oqkpIhTvMHahClOguq
   w==;
X-CSE-ConnectionGUID: stV8LFszSFiuAxdlrXChQQ==
X-CSE-MsgGUID: 4kz9CER5RPqPrxBBCLfuLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68538321"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68538321"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:36:40 -0800
X-CSE-ConnectionGUID: MwyqW9FeRhizM7rmVsZ9QA==
X-CSE-MsgGUID: ELSMDuQ0SRCUkR3Ix99pIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204205691"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 Jan 2026 12:36:40 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfOeT-000000000yv-0rQ4;
	Mon, 12 Jan 2026 20:36:37 +0000
Date: Mon, 12 Jan 2026 21:36:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 3/14]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to match
 any schema with compatible: ['microchip,pic64gx-curiosity-kit',
 'microchip,pic64gx']
Message-ID: <202601122148.PtiS1a9A-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: c9e47b89c4f505b3893573c64da7affdfec9713a [3/14] DROP riscv: dts: microchip: pic64gx pinctrl
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260112/202601122148.PtiS1a9A-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122148.PtiS1a9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601122148.PtiS1a9A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to match any schema with compatible: ['microchip,pic64gx-curiosity-kit', 'microchip,pic64gx']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /: failed to match any schema with compatible: ['microchip,pic64gx-curiosity-kit', 'microchip,pic64gx']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /syscontroller: failed to match any schema with compatible: ['microchip,pic64gx-sys-controller']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clint@2000000 (microchip,pic64gx-clint): compatible: 'oneOf' conditional failed, one must be fixed:
   	'microchip,pic64gx-clint' is not one of ['canaan,k210-clint', 'eswin,eic7700-clint', 'sifive,fu540-c000-clint', 'spacemit,k1-clint', 'starfive,jh7100-clint', 'starfive,jh7110-clint', 'starfive,jh8100-clint', 'tenstorrent,blackhole-clint']
   	'microchip,pic64gx-clint' is not one of ['allwinner,sun20i-d1-clint', 'sophgo,cv1800b-clint', 'sophgo,cv1812h-clint', 'sophgo,sg2002-clint', 'thead,th1520-clint']
   	'sifive,clint0' was expected
   	'sifive,clint2' was expected
   	'thead,c900-clint' was expected
   	'riscv,clint0' was expected
   	from schema $id: http://devicetree.org/schemas/timer/sifive,clint.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clint@2000000: failed to match any schema with compatible: ['microchip,pic64gx-clint', 'sifive,clint0']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): 'interrupt-controller@54', 'pinctrl@204' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000/interrupt-controller@54: failed to match any schema with compatible: ['microchip,pic64gx-gpio-irq-mux', 'microchip,mpfs-gpio-irq-mux']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,pic64gx-pinctrl-mssio', 'microchip,mpfs-pinctrl-mssio']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000/pinctrl@204: failed to match any schema with compatible: ['microchip,pic64gx-pinctrl-mssio', 'microchip,mpfs-pinctrl-mssio']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@20001000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@20101000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@20103000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@20105000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/watchdog@20107000: failed to match any schema with compatible: ['microchip,mpfs-wdt']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20120000 (microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20121000 (microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: gpio@20122000 (microchip,pic64gx-gpio): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: mailbox@37020800 (microchip,pic64gx-mailbox): compatible:0: 'microchip,mpfs-mailbox' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: mailbox@37020800 (microchip,pic64gx-mailbox): compatible: ['microchip,pic64gx-mailbox', 'microchip,mpfs-mailbox'] is too long
   	from schema $id: http://devicetree.org/schemas/mailbox/microchip,mpfs-mailbox.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/mailbox@37020800: failed to match any schema with compatible: ['microchip,pic64gx-mailbox', 'microchip,mpfs-mailbox']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38010000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38010000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-controller@38010000: failed to match any schema with compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38040000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38040000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-controller@38040000: failed to match any schema with compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38100000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38100000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-controller@38100000: failed to match any schema with compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38400000 (microchip,pic64gx-ccc): compatible:0: 'microchip,mpfs-ccc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clock-controller@38400000 (microchip,pic64gx-ccc): compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-ccc.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clock-controller@38400000: failed to match any schema with compatible: ['microchip,pic64gx-ccc', 'microchip,mpfs-ccc']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000 (microchip,pic64gx-clkcfg): compatible:0: 'microchip,mpfs-clkcfg' was expected
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clkcfg@3e001000 (microchip,pic64gx-clkcfg): compatible: ['microchip,pic64gx-clkcfg', 'microchip,mpfs-clkcfg'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clkcfg@3e001000: failed to match any schema with compatible: ['microchip,pic64gx-clkcfg', 'microchip,mpfs-clkcfg']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
