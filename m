Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6423A248880
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775942006; cv=none; b=QDXsNlhUkze28tteLTLEYWenygHD/tkEKi0924yiI/eMTc3IMvPoF3QCBJA5trr0srGvkKNSCwk+5mN8FKluFEr2nmG2c3q1WXJd1xYWtn8tZTIxWxqFCzHjTSjsWHOATCbyF+4sni9CEcMW922JVPHe00URzjSfgBqZ0hUcI80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775942006; c=relaxed/simple;
	bh=sFjV7ad2FXAW/oTGb72e/d5ZHdWzQfyN9b6YWxQle6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K6Xkwrd4CDjFN1hI04YKD0to1O9KfuV4PfIeAv1OOzK0/a6J9FHoyNn/oEmX4iynVK5ntWahoII8l1eiI030PHEHjg4JF/ap9bm7A6iIWkiQZZaAoN7+E3hYi/g8LN3Et+BOYITglF8Y/ES4jQAq9DwpXQ1m6SFj49APgCFndII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGEXexLT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGEXexLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775942004; x=1807478004;
  h=date:from:to:cc:subject:message-id;
  bh=sFjV7ad2FXAW/oTGb72e/d5ZHdWzQfyN9b6YWxQle6U=;
  b=cGEXexLTyCZVJPBGHXugvKugWiQ+pYGNT3Tf1Ge8oAdWTO4gvl3AZRV2
   PgnFPGv+SsUWESPN9mcz//j/gE03G0ROSRc3rjZ+TB3SJ7PYVpdizDC31
   M/KiZ7eW/KrT8kYW8L+bR0cJlMraZUY4bxNtqODHDrIM9rYmVke2Slbjm
   LtQSBvkP8pSzpGBSt5JZGHEMXEGXdwAa7Nj51dOLGhpDmU8HdBg432s5Z
   850VWNkeyJ6Yd2/+1G6yn/2/Gpt9Pidz8EbD5CLbBGizvBepc9+qmUwlp
   i8n4niRZ6xmaQRkRh2DCpXBlXw2/FLMR/6IITT81Tu/OTsK/iq95qXCsg
   Q==;
X-CSE-ConnectionGUID: CD+9p84ESpGDfa5E5gpmJg==
X-CSE-MsgGUID: Aas429QpSbu7FvZK4qiclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94502331"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="94502331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 14:13:23 -0700
X-CSE-ConnectionGUID: ceGK7S0ET16K+sG4esUA9g==
X-CSE-MsgGUID: m5noULiqRYChHWzHq7Jp3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="234331565"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2026 14:13:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBfdo-00000000B8b-2VmJ;
	Sat, 11 Apr 2026 21:13:20 +0000
Date: Sat, 11 Apr 2026 23:12:50 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:spacemit/dt 19/20]
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4010800 (spacemit,k3-i2c):
 compatible:0: 'spacemit,k1-i2c' was expected
Message-ID: <202604112331.eerYfR1U-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Yixun Lan <dlan@kernel.org>
CC: Troy Mitchell <troy.mitchell@linux.spacemit.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git spacemit/dt
head:   af62a095eb0c3359d477b55ef72d2afd94c83c8f
commit: cb322cbffb1e70b4ca1be7955ed19fe486de8295 [19/20] dts: riscv: spacemit: k3: Add i2c nodes
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: riscv-randconfig-2051-20260411 (https://download.01.org/0day-ci/archive/20260411/202604112331.eerYfR1U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112331.eerYfR1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604112331.eerYfR1U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac80000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac80000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac82000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac82000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac8e000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
   arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/ethernet@cac8e000: failed to match any schema with compatible: ['spacemit,k3-dwmac', 'snps,dwmac-5.40a']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4010800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4010800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4010800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4011000 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4011000 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4011000: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4012000 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4012000 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4012000: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4012800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4012800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4012800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4013800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4013800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4013800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4018800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d4018800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d4018800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d401d800 (spacemit,k3-i2c): compatible:0: 'spacemit,k1-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: i2c@d401d800 (spacemit,k3-i2c): compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c'] is too long
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml
>> arch/riscv/boot/dts/spacemit/k3-pico-itx.dtb: /soc/i2c@d401d800: failed to match any schema with compatible: ['spacemit,k3-i2c', 'spacemit,k1-i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
