Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF90D29CE9
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766079017; cv=none; b=QLn6LzXSEzO3u0+kcoCHnyM5Tj/berV4Tz26RXkxxlx7UZdDyCQluWeSAx1xkYtUs6SH5BTXe8N6EZqtLjhBRXORRHDKwNnnUfe3pFv2l0FmxSliuV3d9+nL2V0cob2ZbVXLFUJ6/5fSXHC2bvzm6pdNcWAdz9dkmkUBPeskqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766079017; c=relaxed/simple;
	bh=6Rq/qDWq8GG/fBdoL+ZnrmrO8dmYy/9NbvidWxq8kvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MrSKvOzQA6ixpNgFsSGuBCfln5lSj2FPEaTOrfazXsKydNHNxF+9AYvTUB3KeVxHHtQkWsjx7XvraVoTkU4cw5qgRev3MyH9ehag9vkaI7ROadOc9VR1bX85bxQJgYDIqe/H7KcKx5UiohVTTOHve+9oKJh+At6yzVle71PJKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCfxfgPT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCfxfgPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766079015; x=1797615015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Rq/qDWq8GG/fBdoL+ZnrmrO8dmYy/9NbvidWxq8kvg=;
  b=FCfxfgPTxBjgq+9jSZws+7NGbHXqqdUjQ6HkMxa9gGxGMgk5kmBtQWcp
   ZPng9J0AlKtCRkVm2/AQrT4Qjy1RLKTkTYfPS/vLzNE7py3cU3TE1PZq+
   Ztyzb1MwKYMSf9ki+PItOb2vpMTQGk3b6abnKCglPU8GD/fnuXM8Mg7Tt
   +ZSC7pWgNB6YCHvSY4PtptsxJgGoYjPMyFTCS6UyY0jESVsU6WCVwOQQ7
   s2sNknfVaK0gORZ6RKK/0mBYcXRPzTYTRdVqA3OW0g1j8JIahRu/lMdlf
   hQSKkTh7J6782x4CDoJboPY8BtUab1nLeK2baYuk+EC/hH2yvpbe2TKqu
   w==;
X-CSE-ConnectionGUID: 71Y3L7AOT3eb3+HWPI3agg==
X-CSE-MsgGUID: nz5/8q+bT1KiNSI8hSM9Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67234054"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67234054"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 09:30:14 -0800
X-CSE-ConnectionGUID: 3yLCHWFUSNOOZSWotJEcnw==
X-CSE-MsgGUID: lRfRlcZxRYyvkl3uaYJ5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="222059969"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 09:30:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWHpK-0000000041s-3LZC;
	Thu, 18 Dec 2025 17:30:10 +0000
Date: Thu, 18 Dec 2025 18:30:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.20 110/115]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb:
 dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202512181830.UggcIcNI-lkp@intel.com>
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
head:   aeba91d1639c58e0649bbd023633155679a611d3
commit: d7bdd636a13d938b06cd73e013780f0f40f96466 [110/115] arm64: dts: renesas: r9a09g056: Add DMAC nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20251214 (https://download.01.org/0day-ci/archive/20251218/202512181830.UggcIcNI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181830.UggcIcNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181830.UggcIcNI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: dma-controller@14830000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: dma-controller@14830000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: dma-controller@11400000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: dma-controller@14830000 (renesas,r9a09g056-dmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
