Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E683126C6
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358152; cv=none; b=OXwYqaXvCGqaPOjYUgm6N0/TKPY9cxEuHR9sXYjRwOqgzNK0b4ezGaeBivAQJiXfaye+OgwES+kZGYGIxFzArOvIAdruXawOiGeo8XJBS0CBYCdit9IHCQ3GSwqQt1NnkXmotgR9dbEt/Aa6GpReedP99YeBWTDY8NxMDtPfTO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358152; c=relaxed/simple;
	bh=vbi3JPCidtMdoUCki0CH8PrEsCy6nkaJnaP/fP40e0w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z+zGm7LjuUAYk868LHpxjzAVjzepZbeDDkbk3atfjFULDuJ1i3FFXn02E+3B8V69NSCzCfXQSpyN1sdtZhIoLK1j4oXjrDaCPIcheYhNfMcbV1iCXoiXGKBTglzn5mBiGc6sUQD/58Jt+k4k7sbk/GySMM2uqHsc7pk9G0Amr+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BCuPGqVW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BCuPGqVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767358150; x=1798894150;
  h=date:from:to:cc:subject:message-id;
  bh=vbi3JPCidtMdoUCki0CH8PrEsCy6nkaJnaP/fP40e0w=;
  b=BCuPGqVWS2fWbM5CP5AekVZInY8x4FkJL7vNA1myWTCa7QXsefi6wxpa
   7f4GJKt6Xg4MoluQhxJNG2QIzwwfT/5curGJxVUYS5H3TfoXbG6uuvRVl
   727yJOtJLDGS4/fcACbChWbLj7YFJ6yXwui71MJsImIYVMco7d6TE8Cm7
   2xrAP7+GjS58PY+MLqkIwo2OkXRNZQ+dSO+ztvimDPD2NFKY3roMdtO4n
   SGEV/LeGQIpwoj00ccYc7h6hz0pqfqSPX5MvCtSSXKz/rm4W/IDQXmM+i
   2ut6RPNSpdvAkHU6vwFnytsCT0zVgAAgfM2/w5OsKSGnYIhgNcNFScoIX
   A==;
X-CSE-ConnectionGUID: joakHgbAQdSXI/WACpPRRQ==
X-CSE-MsgGUID: VLX9J4jwQVqi2WZSxzMCCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80297338"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="80297338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:49:08 -0800
X-CSE-ConnectionGUID: vXIpTcejTuuEv6LhGg2e+g==
X-CSE-MsgGUID: IXXq68yVTNep82PGATgzow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="206301614"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jan 2026 04:49:06 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbeaW-000000000Qz-0rpn;
	Fri, 02 Jan 2026 12:49:04 +0000
Date: Fri, 02 Jan 2026 13:48:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.20 34/42]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: thermal@11000000
 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202601021344.I9NxJfgs-lkp@intel.com>
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
TO: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
head:   6b9804013bdd7370cf6d2ef0e86588abe97fd2e6
commit: b2cca585b1d4575fa09161526cd2f40f0dd7be2e [34/42] arm64: dts: renesas: r9a09g056: Add TSU nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20260101 (https://download.01.org/0day-ci/archive/20260102/202601021344.I9NxJfgs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021344.I9NxJfgs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601021344.I9NxJfgs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a09g056.dtsi:1391.10-1401.6: Warning (graph_child_address): /soc/display@16460000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: thermal@11000000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: thermal@14002000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: thermal@11000000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: thermal@14002000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: thermal@11000000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: thermal@14002000 (renesas,r9a09g056-tsu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-tsu', 'renesas,r9a09g047-tsu'] is too long
   	'renesas,r9a09g047-tsu' was expected
   	'renesas,r9a09g057-tsu' was expected
   	from schema $id: http://devicetree.org/schemas/thermal/renesas,r9a09g047-tsu.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
