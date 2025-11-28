Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928971FF7D7
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310015; cv=none; b=GRYe45J13jdJfLCMwjIALMOlGhlGUTGsfU70xHka/ef/GbG2veRXMfvrNYPk+97UPx5JTdbYHzwPlN+HNshUDxzZmuJpdEjg8yDR7IrDdJmm8DRY/xvKjm3FA/FDjCC0j1lLCdcOPD+XRRSDjI7g7zBTV40nGdR3428d8STaGr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310015; c=relaxed/simple;
	bh=I5hJycJZmHo/ffc96xMDHmyQx5MrwmEcOLgCaRnZPvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxpxYJK0P8c05AEewzZoKZeiLegJbin3IFI+OAa+jUHYxYtnY9F1QVdiUCNKlsgMpJD6waRQRU3wEdXD/9Iv4N9l7SEHTh1vgFmP5x426lbnMUgVjFLcV/bWedXhEvHS8jvWXRJcndelG7RiGEcZb73YqtZuZrlAHb1OOg3ZwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBjfbL6P; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBjfbL6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764310013; x=1795846013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5hJycJZmHo/ffc96xMDHmyQx5MrwmEcOLgCaRnZPvs=;
  b=FBjfbL6P7gsd0eRtGUVOcwNeZdUuhKXfD9RO2maZ28z86O+W3Xl98ywW
   EfEZadjmyPoqhP7+U2DUQ4imkupJSbK3WBinBIdZvV1Kn5/Yc77hiSwKh
   JsCkSf1eoNStEk+cCLBXuGEZFXBc0Avqzx8YnxLw1lGtGDPbdMxTuW1hL
   3DtZkUgY0PZtENpAnxzob9CD93xhofAP69wSsUwqkaDyq+cmPRFGcF1pT
   lTNxWmdTUp00UdztHm/A/S4RBmaaf0M4oHz+No+8aQxPABPpr4/xSKz5Z
   u6MVUXhrJkTqChhUkClP2Q6A8Jo7VjtVccRXYqtKg7DJTlAFvPOWieacQ
   w==;
X-CSE-ConnectionGUID: XIeiU5KpSMCEyn+9rWI2qg==
X-CSE-MsgGUID: eTX3Wd9+R1yPMUqNxLnohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83736710"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83736710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 22:06:53 -0800
X-CSE-ConnectionGUID: tAJSRr4lSIq26pTNZ8CRBg==
X-CSE-MsgGUID: Iv2lOHBmTyeLWAsfjXvX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="192514530"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 27 Nov 2025 22:06:51 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOrd3-000000001yP-1mtu;
	Fri, 28 Nov 2025 06:06:49 +0000
Date: Fri, 28 Nov 2025 07:06:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:riscv-dt-for-next 16/16]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000:
 failed to match any schema with compatible:
 ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
Message-ID: <202511280708.cWOT1hiJ-lkp@intel.com>
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
TO: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-dt-for-next
head:   a4aad736716d345d98c0eecbb0061fc9b6e578a1
commit: a4aad736716d345d98c0eecbb0061fc9b6e578a1 [16/16] riscv: dts: microchip: convert clock and reset to use syscon
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280708.cWOT1hiJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280708.cWOT1hiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511280708.cWOT1hiJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-disco-kit.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml
--
>> arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']
   arch/riscv/boot/dts/microchip/mpfs-tysom-m.dtb: clkcfg@3e001000 (microchip,mpfs-clkcfg): reg: [[0, 1040191488, 0, 4096]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
