Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A52101F2
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748697916; cv=none; b=LLjlAjzbc12f9wJ1iorcU0swnsxMn1m2WY64Rqf2VKzxlZbLZ7kEDgzqv0za3W9qgdB930nUPfonwk531xYizzYBqP3BbjZxCSLCu/ztuS7dtOI2UzKbxJ5+JKIdATTwNzzOs6zwc31Bo5e+3cvoDy59kwDcDlSukOT6qHYUMpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748697916; c=relaxed/simple;
	bh=gsFlY07XEBJAsKofB9F6wzNPnVfy/UKxxm9fC2EZb3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0C2NZH4e+Tx6dgl+Lc5imSgah7VopEethl9y8mi08+pT5vkeiMhYuho9s0aCB+RQWcODub2G8tZRN4GXa34XYWy5QsflC8BOWYItW/b418hICobgWehiakcSZceIkkSY28TBTsaXm6Rm44NpW+RE8KbVC3/7FzUWiehCCWiyQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDjkJl6E; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDjkJl6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748697913; x=1780233913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gsFlY07XEBJAsKofB9F6wzNPnVfy/UKxxm9fC2EZb3o=;
  b=ZDjkJl6ExBMakjse0jLD/M1j5UOE0cRdyBQYGPAeCwlrBESmz+jcAKwP
   Yrk+yLQooUAMACKRKzrclEAvAYGYQaqY9wx+LH4TxM04Ssg6kljYkH/HF
   N3X5E/uKEciWgUT1hqgAbB+8LiK73qaUz8elMtWFoTRpj+mxV6uGDBjdX
   ucSa3OjjdsqVeRrRKKCwixBTAZgcOOvSV9H3VcB29IyG07SUMV0gv6mW3
   +3gmmFR7XfpUl/43ep/9uaX7tzaXvkwnRiMGgFJWtCddM2TqWJx1A+Wgn
   Y7W8f2PD/9apzuEIFL1U8ZM9eWozUQ2Vi3yR2u5eIojn7hhxW0dhEsb7z
   w==;
X-CSE-ConnectionGUID: gnhZJSFKT7m9/QbfKfR7hQ==
X-CSE-MsgGUID: yZvpADaxSsCKwubXwXXIaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50874201"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="50874201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 06:25:13 -0700
X-CSE-ConnectionGUID: /ovMsx3MS2usHa4C9McGZw==
X-CSE-MsgGUID: wBsHz2a1R2yvqVfBQToGDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144450167"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 May 2025 06:25:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLMCz-000YQG-2w;
	Sat, 31 May 2025 13:25:09 +0000
Date: Sat, 31 May 2025 21:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-4 18/44]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40100000
 (renesas,r9a06g032-sdhci): Unevaluated properties are not allowed
 ('compatible', 'interrupt-names', 'interrupts' were unexpected)
Message-ID: <202505312120.001i4eZm-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git renesas/dt64-4
head:   f62bb41740462bf9fde4b110df5c7d3bc223fb3c
commit: 03a45e17e636ee1962d8c175c12a0ff48a0b7ccd [18/44] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port
:::::: branch date: 5 days ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250531/202505312120.001i4eZm-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312120.001i4eZm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505312120.001i4eZm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'xlnx,versal-8.9a' was expected
   	'xlnx,versal-net-emmc' was expected
   	'intel,lgm-sdhci-5.1-emmc' was expected
   	'intel,lgm-sdhci-5.1-sdxc' was expected
   	'intel,keembay-sdhci-5.1-emmc' was expected
   	'intel,keembay-sdhci-5.1-sd' was expected
   	'intel,keembay-sdhci-5.1-sdio' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): interrupts: [[0, 69, 4], [0, 70, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): Unevaluated properties are not allowed ('compatible', 'interrupt-names', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40101000 (renesas,r9a06g032-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-sdhci', 'renesas,rzn1-sdhci', 'arasan,sdhci-8.9a'] is too long
   	'arasan,sdhci-8.9a' was expected
   	'arasan,sdhci-4.9a' was expected
   	'arasan,sdhci-5.1' was expected
   	'rockchip,rk3399-sdhci-5.1' was expected
   	'xlnx,zynqmp-8.9a' was expected
   	'xlnx,versal-8.9a' was expected
   	'xlnx,versal-net-emmc' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
