Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF7B1FC8
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 23:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766705600; cv=none; b=FHtWmSMIdnOg1cXcezkIKpNNLLJsBHlUGcv4aqM1gbHrb5wEe6R9H8SdrmVSakFn91IivZeTpS4ys1c+6LR42NHlEtAWs9K0Gd/To8yHVArDc8+rOctanL2I8Iwq+iutQ7AFYQ3mu7WWSK0Ef/Jdgbfe3G3W7hOR286qsN7xrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766705600; c=relaxed/simple;
	bh=RyksLn+hjvbRRwPubOD9X8KZ+arWNrsqJ9Sh19Vytd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uojxhzn+zZpudRqDAhDHyVTLwTK1vdH7h9th+o7+0vG3HdYiFTxWmR3ycKM3p4UvK4iu5lsBYhLjTTtqxt0UIJHjX2ndmZn2SW9ySgNnf0vFg/2HykwO7HEueUd49/mvxV7H2Ls6Nq9qLbhsMbRuJ65p1G+X38u3UWGyTUwTgbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3C583Fc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3C583Fc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766705598; x=1798241598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RyksLn+hjvbRRwPubOD9X8KZ+arWNrsqJ9Sh19Vytd8=;
  b=g3C583FcowiCeQNwEy9p1yWCpopQ0eqCDsIL5Fbz5NjjKf/B12V8P7iB
   EqRyQqsIjLX0Qfjm3cQeQgJ/eAOS7ASLGt71FVxAcDv8EtfurYYiLLC7D
   K6bHw/NcjuZQ+99+XJqW6Ocs9kRcU+tyeGQwasOABGmdJR4MpkbHIw3UB
   ecrW/zGBuovCgECQ6lMu+jovwwh9Ail9p8fhzxcBoDT87xeEwoGSkz6Yh
   hNmXkN+zdRnRlph3HLdASU1G48WW2Ej1kpvNQYPFju+rAjZATUXgqZP/D
   aSWQAnBqT+yWyQAaFiYzE7n3qMpfh7Yu6I78TxG4nPW8XaK6WWJIHKD11
   g==;
X-CSE-ConnectionGUID: 59vnWhJzRZKV4tMbnZItCA==
X-CSE-MsgGUID: HBVTXL2kRHWDL3JQZltx1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71066496"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="71066496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 15:33:17 -0800
X-CSE-ConnectionGUID: qJq0hEhzSruzybVeLzgzow==
X-CSE-MsgGUID: Sk65ZQ3cR7K6icHg6i1N7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237684582"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 15:33:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYupV-000000006hM-3HZ0;
	Thu, 25 Dec 2025 23:33:13 +0000
Date: Fri, 26 Dec 2025 00:33:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.20 23/30]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000
 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk',
 'vclk']
Message-ID: <202512260031.ys3UKOap-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
head:   666e5eabd623586d0efa333a863122661c7668c6
commit: 4636957e62eac72dcb145e6900a80d62b0fb87fa [23/30] arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251226/202512260031.ys3UKOap-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260031.ys3UKOap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512260031.ys3UKOap-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
