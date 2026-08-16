Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D23C988B
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 11:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786880781; cv=none; b=cjBJSSwOvSpxyD2ziuN9JmDTT2+eGyExt8TGJhI1MGWekTFkRfcwSz36wCi+S674ThZtM/gQBUAzaGq3ZABUmH39QBw8YFWXM9rbfJKIyUyHSvcW2hfIUsBV4PiJnEjY39c/P5TdE9qS8/+o1FYy87DWxVl5ANlnr4dFiZ/Y3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786880781; c=relaxed/simple;
	bh=sUetarEehpiwCU54cj8g/Y4REKZymsMSAqIoZd+fnKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RJVp5TZfjshE1dz2Ed/NL9xMEdcGbctyFINoCGEGsLUxvfcN74H33x/XFTvH4P40OzYNW081P8KWohOS6Rm2UUexD2NKbX6lhf2Iew5gPZ9ycp0goUXA1FdF4DCUP15Pt6Z9wRtKoWkBsAzPd+mJ4P/tnEJBsPD3N/IkqQcPWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKbES/oQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKbES/oQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786880779; x=1818416779;
  h=date:from:to:cc:subject:message-id;
  bh=sUetarEehpiwCU54cj8g/Y4REKZymsMSAqIoZd+fnKg=;
  b=MKbES/oQsXt7LmDwXl3XF/D9BsSzyCfXLOMC+Hc/SovODN/j72FOAvYB
   d5KFcbMorPlAOg7Ndbiv3CEJJzvU/16aDzHqTZ+f3pWuCTJ+nQMEYVtyK
   lMSYjuZ/5bjiI4AtyGYEt7/769p7wUxZx+PqD09Af4KDnVFR5F7PutVwC
   C0KfW0cdPuKvNOR8diiBv6RIKr5M15fnjcr2A0uoucRdXP46TxVPFmmOp
   SNmiD5g37cYB4PFOKKx+e2vt9CcflvrnyOyEgg865tcwBIPRtQkEn0GQ5
   HWvljFvonKKDuyfbQ4QUkP+E9KWRO/ELe/VhpwByDXDVFKXAbRHlo+yRU
   A==;
X-CSE-ConnectionGUID: oYfnhNA/Ru+qALkMrWKgOA==
X-CSE-MsgGUID: 6i5CdZsuQE6ToBg2+cj/tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87401238"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87401238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 04:46:19 -0700
X-CSE-ConnectionGUID: Z8d1j9LHS/y5w21iyQT2LQ==
X-CSE-MsgGUID: AIVT1pk7TQSga5gquamAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="266654529"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2026 04:46:18 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvZJf-000000006aD-2WDI;
	Sun, 16 Aug 2026 11:46:15 +0000
Date: Sun, 16 Aug 2026 13:45:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0
 (spi-nand): spi-rx-buswidth: b'\x00\x00\x00\x04' is not of type 'object',
 'integer', 'array', 'boolean', 'null'
Message-ID: <202608161339.IR1HmbKI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Wunderlich <frank-w@public-files.de>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3eb40771c00a8488fa6ed2cc1fe203477908bf38
commit: 987697749def9c5e10d9a2d992f012db61ae1967 arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260816/202608161339.IR1HmbKI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161339.IR1HmbKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 987697749def ("arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608161339.IR1HmbKI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): spi-rx-buswidth: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc-nand.dtb: flash@0 (spi-nand): spi-tx-buswidth: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: crypto@10320000 (inside-secure,safexcel-eip97): interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml
   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): Unevaluated properties are not allowed ('spi-rx-buswidth', 'spi-tx-buswidth' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/spi-nand.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): spi-rx-buswidth: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd-nand.dtb: flash@0 (spi-nand): spi-tx-buswidth: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
