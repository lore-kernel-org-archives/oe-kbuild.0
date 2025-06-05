Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000B27AC24
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Jun 2025 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148944; cv=none; b=MQwgtSaVw276UC1Bc/ary3PUS7b1P2dKDeDibvin946qN/VfSbbK67HVHXI9zCRo5r9vResBKL73CUiuz6V9MuMbmaV3/hJJ6iOqdz/h+rES90tmowcWZPNNIz7n1ldjfrK2L4yUnIXpqI1K00JVRgVm0yQ+CyoSE7FPDN93oas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148944; c=relaxed/simple;
	bh=2iCYJH22Cs4GGJhivwbrH6EJgbQOzb3TBV8h191suh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CElygqHziTjiDltuTt7Cue6OcWlZ/47ICfm/meEuPMW0dSZ1hmNQZXBAZ4bUUCVDRV4UQL9PKYQEfOf8ku7PoR89jqU5JjF5QJerwddcf3C818nk9hfTBkNx+HA0EoU8d1UKuY6X16Or3P6d/XpTSOEQYNtHKZw3IfutxGfImHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aI1sJfGj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aI1sJfGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749148942; x=1780684942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iCYJH22Cs4GGJhivwbrH6EJgbQOzb3TBV8h191suh0=;
  b=aI1sJfGj7BdBcE7CCgtE0Hbwk46dJsMQInBR89aXUQDnXVwG5wAXbXoX
   lrL47Xe8o6Qkr2qjhm0aNYtZxxhiXju0t0ehbooKpXDrurVrvRv1UDG8r
   Ydlzzkakd8AkacVfgqFEXeuWma2gDswIeX2kfCMOKoLe60DSOLiZUfVin
   7pkruMRVjh/1GERZtO0j/VzkvMKOVb9G+E2v+zSoJfkgKy+p+PcFZc24b
   XnIhbbFwqCcP7vXdhzmw8b3UcScAQ24z2TNHaA/v4gAse0Qnd6HQlAR8x
   HQ1SJoatMiuilkZKxeYVimbinIvtJB1wr/nVilgt48UhSyC9iAf/MrB5O
   A==;
X-CSE-ConnectionGUID: 8euBWWruTju6S22PnULg7w==
X-CSE-MsgGUID: ohLEmeETSZSG/d4yqZyZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55093085"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="55093085"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:42:19 -0700
X-CSE-ConnectionGUID: i3DoEweXSye1heqmM+NN9g==
X-CSE-MsgGUID: zPtsAl0OQDS3j8sqDvFhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="150749780"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2025 11:42:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNFXZ-0004Nx-1V;
	Thu, 05 Jun 2025 18:42:13 +0000
Date: Fri, 6 Jun 2025 02:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:master 8/33]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000
 (renesas,r9a09g056-gbeth): interrupt-names: ['macirq', 'eth_wake_irq',
 'eth_lpi', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3',
 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', '...
Message-ID: <202506060259.2716tcc5-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
head:   0cc4c9c39e8953745481c13288a46edc616dc7cd
commit: 18b4e571dc82ac91ae9a39e169c8de285845b80c [8/33] arm64: dts: renesas: r9a09g056: Add GBETH nodes
:::::: branch date: 9 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-052-20250605 (https://download.01.org/0day-ci/archive/20250606/202506060259.2716tcc5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060259.2716tcc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506060259.2716tcc5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'renesas,sdhi-r9a09g056' is not one of ['renesas,sdhi-r9a07g043', 'renesas,sdhi-r9a07g044', 'renesas,sdhi-r9a07g054', 'renesas,sdhi-r9a08g045', 'renesas,sdhi-r9a09g011']
   	'renesas,sdhi-r9a09g047' was expected
   	'renesas,rcar-gen1-sdhi' was expected
   	'renesas,rcar-gen2-sdhi' was expected
   	'renesas,rcar-gen3-sdhi' was expected
   	'renesas,rcar-gen4-sdhi' was expected
   	'renesas,rzg2l-sdhi' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/renesas,sdhi.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupt-names:3: 'rx-queue-0' is not one of ['eth_wake_irq', 'eth_lpi', 'sfty']
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3'] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c30000 (renesas,r9a09g056-gbeth): interrupts: [[0, 765, 4], [0, 767, 4], [0, 766, 4], [0, 772, 4], [0, 773, 4], [0, 774, 4], [0, 775, 4], [0, 768, 4], [0, 769, 4], [0, 770, 4], [0, 771, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupt-names:3: 'rx-queue-0' is not one of ['eth_wake_irq', 'eth_lpi', 'sfty']
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi', 'rx-queue-0', 'rx-queue-1', 'rx-queue-2', 'rx-queue-3', 'tx-queue-0', 'tx-queue-1', 'tx-queue-2', 'tx-queue-3'] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: ethernet@15c40000 (renesas,r9a09g056-gbeth): interrupts: [[0, 780, 4], [0, 782, 4], [0, 781, 4], [0, 787, 4], [0, 788, 4], [0, 789, 4], [0, 790, 4], [0, 783, 4], [0, 784, 4], [0, 785, 4], [0, 786, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
