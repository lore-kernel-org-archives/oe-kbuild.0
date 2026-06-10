Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902037E0E4
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058632; cv=none; b=AAy4DEGmiw2LSQHRiqdcCUmv8QCnOxZSk6Wxi4tDD2dR+LarkdAVeHoFiXGXa1rtxiP+nMrNbgjQSzowDM8lWuCrDESLQCVuKNHLJOv6Bzi2pz+L/+1cx71OKdNEf5U3ojKVi1GWaOO6tNWO9uuJ7bXM1liObWCsjPaGGwTL8uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058632; c=relaxed/simple;
	bh=eOqBa2PHBwl0gcu69znwhGl4HG2IHVF19Xbbk6Xve7s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VOfRpV9bsORsWjuA49/bbiF2do49nEPMYch/lKSbrY3RKNZcQsjDGmf8XVrYUXGiM6u4Nbk7Ol5DLzyNa/qS2ywECIU0qL/xVdewN4ZhTXLKt7CkgqEOdXaRkTB9LHSY+9SnXT2uc/hZKl28TFlvV+teHw9nYWfS+GqrCtNmQyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1e92pfJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1e92pfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781058631; x=1812594631;
  h=date:from:to:cc:subject:message-id;
  bh=eOqBa2PHBwl0gcu69znwhGl4HG2IHVF19Xbbk6Xve7s=;
  b=Q1e92pfJYND7C+MTM0by+bP8yx/HpbBfhqtXFKzDFia4FBmEzQjNLdvB
   6jfWD5MFgOOzJwUSCMPKef4tZDwX+P9hJ3k3PL8b5j4H886LkXx2pr9cz
   gB4YMED+LB1dhUtEPATH9JONfYcuIVDUPq8x61h9Zr71JO7UmXCfOxHLG
   cQd+In8g0vGoKBUS+A8Kvyadmrc4QwZe3QIQ+HJ4yg86KpFouTe8iZKEX
   B/dK5O1ArA5xas0EhALTVxq9nnEzPTZKEfg6YAC3p0vAbKKJ5lLNxj8sL
   WugJUAP71QzZxNfGcosgTn1Jkd0ZnQ2NIJuKxh3caraZTiRKE+WXR3its
   g==;
X-CSE-ConnectionGUID: He7aL7XjSLq7QTvUva5ruQ==
X-CSE-MsgGUID: bYfNmDBuQNWksIPltFsLnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92515901"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92515901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:30 -0700
X-CSE-ConnectionGUID: AVacq+LCQOqZQ8iNuL/5qA==
X-CSE-MsgGUID: dlw8WqvrRLSelkHo7/zJNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="250951182"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Jun 2026 19:30:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8i1-000000003b1-3eCN;
	Wed, 10 Jun 2026 02:30:25 +0000
Date: Wed, 10 Jun 2026 04:30:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.3 84/95]
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: clock-controller@10420000
 (renesas,r9a09g047-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal',
 'audio_clkb', 'audio_clkc'] is too long
Message-ID: <202606100412.s9AxSDVp-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: John Madieu <john.madieu.xa@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.3
head:   039608fad80827cc1db55aed77478bf807093582
commit: 9c9094d5d889e6259683d9afbd4b578ccea0b700 [84/95] arm64: dts: renesas: rzv2h: Add audio clock inputs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260609 (https://download.01.org/0day-ci/archive/20260610/202606100412.s9AxSDVp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606100412.s9AxSDVp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100412.s9AxSDVp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: clock-controller@10420000 (renesas,r9a09g047-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
   arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: fcp@16470000 (renesas,r9a09g047-fcpvd): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g047-fcpvd', 'renesas,fcpv'] is too long
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	'renesas,r9a09g047-fcpvd' is not one of ['renesas,r9a07g043u-fcpvd', 'renesas,r9a07g044-fcpvd', 'renesas,r9a07g054-fcpvd', 'renesas,r9a09g056-fcpvd', 'renesas,r9a09g057-fcpvd']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: clock-controller@10420000 (renesas,r9a09g056-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpaper.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clock-names: ['audio_extal', 'rtxin', 'qextal', 'audio_clkb', 'audio_clkc'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml
>> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpaper.dtb: clock-controller@10420000 (renesas,r9a09g057-cpg): clocks: [[7], [8], [9], [10], [11]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
