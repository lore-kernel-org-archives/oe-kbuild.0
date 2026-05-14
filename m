Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38163A6B78
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731857; cv=none; b=lIzN9biB/vmFK7C5Th2KT3aKXvE98FA5jtU0rhq65K6k2VR5YeKw67r1wmMNH73wiXL1eiW4UhD8pjFIDngULugklIzwFZTw8BjkRyYZH6JxEMOslltkB+s6KQgnCby0DvpudPqyH98GABHWRSlzI+TESDOgOYPejs1RM3a3Wdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731857; c=relaxed/simple;
	bh=GgV5jH+m8HhJFaEnNuM12aZOK70CwlCas27F2sG1qvU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Usn/zfc2nes3EetLQ8OBBkSRZbzf0Ybtw1bwjd40VKoy/MHjBVkWs+cNLlMlpZ9rQpJthPg2Kh3bU8U7i0CXwkXa+dRK+5RUXD22Xlicxi2vHVqa1dR6RT4NXHK5+RrBUykAyIz8UZReW4aq6+r2dhOyItQnW3rPdJDOgjCt+cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkIJHIca; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkIJHIca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778731855; x=1810267855;
  h=date:from:to:cc:subject:message-id;
  bh=GgV5jH+m8HhJFaEnNuM12aZOK70CwlCas27F2sG1qvU=;
  b=HkIJHIcaXwXX4ZlMsKnaX/neNpTUHB+z/4C9WUt01vcIVlpHAnUyLvyO
   2D+MAdrnbTdmPgW9mgrUnuxaymwyCSGFcToQrpHklvcCITDcOhlVKj6B6
   I3g29ritX5smPOQkA88FevGAOSlod8QvCi2IgOxM5sHeYcv/VqhHRYt0Y
   vogK14V9ifSfRiCohmfUVS45asCYt+kHB6pqLqgEWDUvsTYjdwCzwO9vX
   TRWfQ3bSsy+1Y16Xd5505ZrC82LlcGRJU+mX5btO5fLoMODwE79de8pHL
   AW6AbJA3zSNM8hNWUzWu9uZP2Lkkr2XGHuxYL8d8PSnF3G+4gBSjo4CEC
   A==;
X-CSE-ConnectionGUID: R+YCRw2IS9WmU1PACC4yHA==
X-CSE-MsgGUID: gN3b0gjHTyWUevslaj+TBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79700567"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79700567"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 21:10:54 -0700
X-CSE-ConnectionGUID: jT9nxrLiREiXcRUGBTiXmA==
X-CSE-MsgGUID: I10jp/jtT+2LoR3BJjUwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238388898"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 21:10:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNNPP-000000008kX-1t3j;
	Thu, 14 May 2026 04:10:51 +0000
Date: Thu, 14 May 2026 06:10:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.1-next/dts64 19/32]
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply',
 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply',
 'vsys-smps-supply', 'vsys-vcore-supp...
Message-ID: <202605140604.ZyYkSunC-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.1-next/dts64
head:   7264d37c63139f2ce8c073ead1ed4409fbba12d6
commit: 9945dd30790e68ccfa0de9560aa120585ebb8260 [19/32] arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260514/202605140604.ZyYkSunC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140604.ZyYkSunC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140604.ZyYkSunC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@11230000 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
--
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@11230000 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
