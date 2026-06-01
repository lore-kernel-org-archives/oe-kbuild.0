Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D55B39B975
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780307248; cv=none; b=JWRmsmtAga9aw8xhrGB5McDgRWgrvk6s5lE5XNsuESUaanVfntZ9/H8rCUnVEhbgI1HDU9Ish7qZ3H4AiLvx7osHBPovM3Vk1U6r/SQGZ7YrxTk3h15aXUdqO26zbV8yM7IWyOql/LIK2BKwI2LerhXFP8XrZiSjC3hYckfgYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780307248; c=relaxed/simple;
	bh=QTdyF9oAoZUuszmLymQovlFNo+bc8B/9NJXWxXhB5o8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YUknHBYaBTjzLdgdJfdWmg8ugw/aDn0Q2zQ2Hkz5Mbm+lfXKC3N7bj9c4oUAgfak6q6eaay983KJyG4ZuJF1qzD5heAyvFaS9VagxwuR72MDD3la0yuiy57hmZexHSiw2Dpj17awF9Sun3HgM2nW1NDe2aj4z8Bgx6mj8ZCbscg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXEmhsXM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXEmhsXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780307235; x=1811843235;
  h=date:from:to:cc:subject:message-id;
  bh=QTdyF9oAoZUuszmLymQovlFNo+bc8B/9NJXWxXhB5o8=;
  b=TXEmhsXMxA6N1zu0UzR6142dFIAlLWKpC0JIxGghg1o3ldSIRby8BEFA
   us6zPASIIAZpClpCAVk05eLajdr7R65RmcJjbpz0dVcnqTav/O4u/oqga
   9a/BXSeWYltvxIpmOChaxeki4EyY56y+ak7Hi/2M1yv0XF6ICgK+ftZ2l
   X+nTYd4LIcB9fFE+YXkdb8nSnaav4oMkcHGdojK2lfMi2JY8m8bEoN0Bb
   0NQFBoCQF5mcWdT2rWcIuse5IU1jBk1J9vxJyj5292XAkQem9x763ae2p
   qSCRF7LQEbl/Hmyi3eo7ADx3WWJJ0W34fW52wUXrGNXYGEwqZpIJW/+27
   w==;
X-CSE-ConnectionGUID: N5gHu3CWTImOmCJSdtWvfg==
X-CSE-MsgGUID: yCfQOvcCRrGoHz2OZT5LNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="83639161"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="83639161"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 02:47:14 -0700
X-CSE-ConnectionGUID: p+GLVpeuTT6inpfHoKA1fQ==
X-CSE-MsgGUID: sseOFoz1RqKuW1KEfKX87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="240536711"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2026 02:47:13 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTzEk-000000001Yz-3o5q;
	Mon, 01 Jun 2026 09:47:10 +0000
Date: Mon, 01 Jun 2026 11:46:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v7.2 34/83]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000
 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
Message-ID: <202606011134.zGmQCwfY-lkp@intel.com>
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
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
head:   0d4ed954061efc3e47fa889d3de0675f933f438f
commit: 4c443296ff17f5670ce926f47de8ec5a1f50f857 [34/83] arm64: dts: renesas: r9a09g056: Add PCIe node
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2054-20260531 (https://download.01.org/0day-ci/archive/20260601/202606011134.zGmQCwfY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011134.zGmQCwfY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011134.zGmQCwfY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): pcie@0,0:device-id: 59 is not one of [51, 57]
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible:0: 'renesas,r9a09g056-pcie' is not one of ['renesas,r9a08g045-pcie', 'renesas,r9a09g047-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pcie@13400000 (renesas,r9a09g056-pcie): compatible: ['renesas,r9a09g056-pcie', 'renesas,r9a09g047-pcie'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/renesas,r9a08g045-pcie.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
