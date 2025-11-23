Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E5F21019C
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 21:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763935163; cv=none; b=Vt19B7/jozUBCJiIw3jilwli7xPOB6S60VpmKYZd5l4opsbnHKB0ZlUb/8rgvIQGAYwWY1SqTdxsZ3bM8EiUDcQIrEvYS8dgCjEOvIng1uCACCmqbjVCFCEGoNzC272VvFS0TFlHnzXZosLCmXN09d2sxMRwxTdAhTVbH+TGkrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763935163; c=relaxed/simple;
	bh=25oQn+QHOM883aCciHWEbyc4yz6NPW7plsrnyQsgSFY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mc75dIWaFnRO+H0Cj6v8pcGSlIBN6PJgZq7/ixPWenT+9eqFbrzfAqhPLVsCkFGxkNCWlTNKGsVQxFoa+cAZ7vPzoWLAJez+RZIgdZg+n4FporryVlvTspRXiv8/KveUHFUhNrRHWBxui8E/a5xNVNZZKfPRQDVE5Q/kz/3WZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK5pxjv1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK5pxjv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763935162; x=1795471162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25oQn+QHOM883aCciHWEbyc4yz6NPW7plsrnyQsgSFY=;
  b=nK5pxjv19axHIM1HIHiY9u428dZN12ID6O8/jdICb6g968XTCQ9aAN7r
   q2o+b1TStlzslz13gd+5cchl//dJXyiMiRkHbsHiFlUgMQ7bwzR4N4PSG
   6AO4Z+bHVWAA9QZzUROGbDo422fZFnw2jmWf0EdZO3gUCTyGpBleJT1nj
   jpWgoPszKi0+zod7Bh/zif3pZU3CSdVkPHtzK4ge/Bu2rZKtb4Jp5rNh6
   sC1Wqvsu9yhDk/C2Wo6taDz3tZ0hlOPDnaP5rT7KGo3F7PTdOhLoeosNW
   uFol7Qly9U+J9D3HK66FZnG0s4RXVqyEf5sjtpyLWLaSUsjeD1xUQIQUF
   A==;
X-CSE-ConnectionGUID: jxsfbEMZRiylliZF8nCzSg==
X-CSE-MsgGUID: fUFNhxsrQ2un13WHwnYbAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65890502"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="65890502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 13:59:21 -0800
X-CSE-ConnectionGUID: yOtHeK9AQpKuETPFtOM60Q==
X-CSE-MsgGUID: TIaXZxx1TOSjc2asQgEHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="223127489"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Nov 2025 13:59:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNI73-0000000004T-0HuU;
	Sun, 23 Nov 2025 21:59:17 +0000
Date: Sun, 23 Nov 2025 22:58:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:qcom/dt64 39/134]
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66
 (maxim,max77705): '#interrupt-cells', 'interrupt-controller' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202511232241.qllBrGgT-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Dzmitry Sankouski <dsankouski@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git qcom/dt64
head:   f481e772e014da92fa1232de54e4cac66b5fc5e4
commit: 4372b15d89e253e40816f0bde100890cddd25a81 [39/134] arm64: dts: qcom: sdm845-starqltechn: fix max77705 interrupts
:::::: branch date: 9 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511232241.qllBrGgT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232241.qllBrGgT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511232241.qllBrGgT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4803.27-4858.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: pmic@66 (maxim,max77705): '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77705.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): $nodename:0: 'i2c21' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dtb: i2c21 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@60' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
