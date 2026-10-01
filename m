Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCB546A618
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Oct 2026 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842249; cv=none; b=LIs2enN5+GTr8IcCZIV0FV7ctnzUhbS83OnIEMWaVFXmIUKpscFGSKAxNkqujBCnTNdyR0kJvTN7Zi7aMGJ6kiJlDsGyBnDcJdb3EYwI5+ipBBh3FkDIPP38xBl63VuTmNC6fBcgDk8t8ZKB580zQIDDfrAE0kDQxIb4MOidzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842249; c=relaxed/simple;
	bh=nDF9C+1Qa/DLZhDyqCZrW8+wi5tj/FUfd/kBz/hHFY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OsKo49fzs25AN9a2LyXLgm8GZGZO0R30lxut04oqbnDklb4xc0NMz8Hz6pLfHJzaKh8yvsnIL7Fp9mQcyxvPAKkyY8us7i5gAlExsm9yjb7wFFvT2vZZZSmSEEEEfGB4bTx2ARE0Uc2wHzC1JquG/yHM859pk5BqCw7Xf2yI8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOzH5rOG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOzH5rOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790842245; x=1822378245;
  h=date:from:to:cc:subject:message-id;
  bh=nDF9C+1Qa/DLZhDyqCZrW8+wi5tj/FUfd/kBz/hHFY8=;
  b=hOzH5rOGcmyR7fPghyZ+qwDCC10/DXh7wPxA3mewseY/Zv+3h3GGuIAX
   MLKdk4KO1ei+jhLajTYSbsvNsgyNyIE4d3mM9G+H+rPHGEAK4PG1khX2J
   dk5h4TcYheIbQ7oWT69bZ7dgo4mnNV2B1Vmj/pm0l6LqKkTlN0YHdj+WL
   b7QvP17gN2nn+sM4e5WG5dPgYOkMbOVBst3EPiK49rjD0kTZJAljxq4/J
   1zL2UxUE849Vz1DUkSQbhp/40aJGRXfTRlBS0LqxyBCHXDodQG7Nhwje6
   IKpGZ/+nwZPOM1y5+ZfmYSCIKX0aBHsdYCrYBPdYzd5nXcRti0mMgLCFG
   Q==;
X-CSE-ConnectionGUID: uUBJjL5jQTi4L8ONvwuzDg==
X-CSE-MsgGUID: eH4oZjkGSAeh1GvRQzffKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90805981"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90805981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 01:10:41 -0700
X-CSE-ConnectionGUID: eyQh519tR0arqM65XD0n/g==
X-CSE-MsgGUID: b9CLHF/DRQa46I9xWvA2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="274016962"
Received: from igk-lkp-server01.igk.intel.com (HELO ae472ef62802) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 01:10:39 -0700
Received: from kbuild by ae472ef62802 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCBsC-0000000004c-0BA9;
	Thu, 01 Oct 2026 08:10:36 +0000
Date: Thu, 01 Oct 2026 10:10:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb:
 pinctrl@f100000 (qcom,sc8280xp-tlmm): ec-int-n-state: 'oneOf' conditional
 failed, one must be fixed:
Message-ID: <202610010901.PKydksHK-lkp@intel.com>
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
TO: Clover <alex@ironrobin.net>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Clover/dt-bindings-embedded-controller-Add-Lenovo-ThinkPad-X13s-EC/20260926-195438
head:   20b5e87ec82bddfeab758ba04e7736688e63c4dd
commit: 20b5e87ec82bddfeab758ba04e7736688e63c4dd arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2401-20260930 (https://download.01.org/0day-ci/archive/20261001/202610010901.PKydksHK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610010901.PKydksHK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610010901.PKydksHK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4957.28-5036.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:5058.28-5118.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6588.29-6648.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22094000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:6670.29-6730.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@22000000/dsi@22096000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: pinctrl@f100000 (qcom,sc8280xp-tlmm): ec-int-n-state: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow True
   	'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: pinctrl@f100000 (qcom,sc8280xp-tlmm): ec-int-n-state: 'oneOf' conditional failed, one must be fixed:
   	False schema does not allow True
   	'function', 'input-enable', 'pins' do not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-tlmm.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
