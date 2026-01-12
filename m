Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E31E285072
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 22:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768256563; cv=none; b=DyajEqG0qo6EblYCD4VsgMR9Bm45/5yktVWusWDAPLN6hA9vyVFIf/2YBGXXE7aecsOQBKMsUeIyjVX8NmXxqV7HSa+m4xVck1co2D713BWnxDmpvdJQGOPIt+hZ3nzCT16G6DXbNmuGrtUWBD0SpiUQKlIiLgHsoBSDE6e/bjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768256563; c=relaxed/simple;
	bh=qX5RbOKYG3aoFSU/2J7kvCnEf4HoAaGAn8+oUXTojeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jT3lU2JOFsXD78bRaxgE3RdQz01UU8wsUQ7UA8dKjM2Yw9j9RwN+H5hQn2UES9m5eJenR+3c70GyK8MBAFVIsJO5PXK9S65sLW3bperA6y3aX5E1fctZ7W6eKtWIiK8PeydyLM/m8jnazvUADwotvolIpIPfGFIuWibZjr4R2u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npt33xv4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npt33xv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768256561; x=1799792561;
  h=date:from:to:cc:subject:message-id;
  bh=qX5RbOKYG3aoFSU/2J7kvCnEf4HoAaGAn8+oUXTojeE=;
  b=npt33xv4LKk2A0BLNvxIMv2kRJoxobxEcwr2A6hvb7qRksN72IiRBeeT
   JCUFqtDwCl8BRhW1bG5HgATaEHoF0eZzSEEAONkMXkKN7zRt/CgcuV4T9
   4qk2Ekfjy0CAv8aiNGGJ9XDaF0/OKJjzMnbAYAHOJLbB1zv2pGxC54mjJ
   02NlfLtrhRQje71kZrDcyExVisjMBQbtLLG5dHcyzwWFpRCeDkho1tvfG
   JB66hHgkjDHl8GLczz0iqMa8F9jy7sFkf7ZnYKtgqpDMXt+WIB7y8YnyR
   UhmDcACO/npDga2PHomwnjSM06lCgKECgRJXhDvzJRsMXtiJx9PEwITkW
   A==;
X-CSE-ConnectionGUID: dI25i3WUQ7Se0YudUYpEXQ==
X-CSE-MsgGUID: VSfDdVK2Qzmaf3T0qzDqOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69437372"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69437372"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 14:22:40 -0800
X-CSE-ConnectionGUID: YPKH+DxgQkmUbFd7tKL40A==
X-CSE-MsgGUID: qHswoD5JT7iwbbbkzq/d0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="203414845"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 14:22:40 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfQJ3-000000000zR-2TUh;
	Mon, 12 Jan 2026 22:22:37 +0000
Date: Mon, 12 Jan 2026 23:21:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 9/14]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000
 (microchip,pic64gx-mss-top-sysreg): 'interrupt-controller@54' does not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202601122330.cgYg8Fsd-lkp@intel.com>
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
commit: 46b4a4b77e6a6e030c2ed93f25c55826250b1669 [9/14] dt-bindings: pinctrl: document polarfire soc mssio pin controller
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-2052-20260112 (https://download.01.org/0day-ci/archive/20260112/202601122330.cgYg8Fsd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122330.cgYg8Fsd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601122330.cgYg8Fsd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /syscontroller: failed to match any schema with compatible: ['microchip,pic64gx-sys-controller']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: clint@2000000 (microchip,pic64gx-clint): compatible: 'oneOf' conditional failed, one must be fixed:
   	'microchip,pic64gx-clint' is not one of ['canaan,k210-clint', 'eswin,eic7700-clint', 'sifive,fu540-c000-clint', 'spacemit,k1-clint', 'starfive,jh7100-clint', 'starfive,jh7110-clint', 'starfive,jh8100-clint', 'tenstorrent,blackhole-clint']
   	'microchip,pic64gx-clint' is not one of ['allwinner,sun20i-d1-clint', 'sophgo,cv1800b-clint', 'sophgo,cv1812h-clint', 'sophgo,sg2002-clint', 'thead,th1520-clint']
   	'sifive,clint0' was expected
   	'sifive,clint2' was expected
   	'thead,c900-clint' was expected
   	'riscv,clint0' was expected
   	from schema $id: http://devicetree.org/schemas/timer/sifive,clint.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/clint@2000000: failed to match any schema with compatible: ['microchip,pic64gx-clint', 'sifive,clint0']
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): 'interrupt-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
