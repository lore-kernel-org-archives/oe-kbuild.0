Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A5335295C
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769865980; cv=none; b=nTNI9p/PNxTMw2bMGda0Wn/ysgEs7Ajwr2dqoJWC0lumvOf6EPQ0pjGmPLPsVzUzaLoPvTTrGBcwNboi+74VW1NGSJSPDL8MhiWYgXsEUJNVYNXCyadQWaSuIQOwKRIRgIgYFImedFTKzvFVJ1UpifdielA4IlUu+TGASBhKV/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769865980; c=relaxed/simple;
	bh=EZzw7lcyO3yRUJeOY+top42W8AVc0ZAur//0QI9m/Yc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nsm3k2IWK1igNVIM/K7IVtXWsGoV1shO/Db84fXD4e1jTi9IIeanV3yjXoQBU2IEE+SCNjIwbq3sSpkgiLja7U5y3MBAuv5DLdF2sQZoECr2e5BNyzQygwlQI+v5YJmO3iW7fYiUUVX8kI/V9YLXT2k77ngvcfblqUcFzfd+RZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqk279tn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqk279tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769865978; x=1801401978;
  h=date:from:to:cc:subject:message-id;
  bh=EZzw7lcyO3yRUJeOY+top42W8AVc0ZAur//0QI9m/Yc=;
  b=kqk279tnrEcbiPrzMy8vrTHUtGKWds9H2lRrogWD4tUBljO7CuYfNAtv
   8RXWzYKEGyOuEZFe3T8hEsTobmM6/XvbD6IjRwvwHiInkpUfJvTHRym+T
   wdKIb/u32Tcqyu3XBD/qQcHI229YljCA0KsGNTG+CP7KivJK/hO68B68q
   QWYPF+Gm5wkTi9nqNAuJiegrbzT5j/MChUoRof/Mr3lO5njVtlJBUul+r
   tGNQB9s1pBiYSe9lk8C+cFI8Fkd6G5J5Lrk0MuCoc0t3ejPWMPfRy/D3S
   xf7EKKsPacLYZkQRuOTvqLcobi1mtJzo4gD7G/SKAMAHu+TnHdGeg8OQw
   A==;
X-CSE-ConnectionGUID: /TNhxjRQSmilHIPXZfz94A==
X-CSE-MsgGUID: D4FdfjwQR2+ZZxfQiuON2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="96556136"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="96556136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 05:26:17 -0800
X-CSE-ConnectionGUID: 86lo/2wyTF6ozxyBfsqZqg==
X-CSE-MsgGUID: rg6n4U6JQrG22cl/cUc35g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="246692755"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2026 05:26:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmAzN-000000002hl-2FvQ;
	Sat, 31 Jan 2026 13:26:13 +0000
Date: Sat, 31 Jan 2026 14:25:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dinguyen:socfpga_dts_for_v6.20_v2 1/12]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb:
 nand-controller@10b80000 (cdns,hp-nfc): Unevaluated properties are not
 allowed ('dma-coherent' was unexpected)
Message-ID: <202601311445.euLW3QVD-lkp@intel.com>
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
TO: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_dts_for_v6.20_v2
head:   42a8d7d72185247c0bbada1d2c44bef743ee6a5d
commit: 8c4caab05ff162e2dd9b66a72a21d9605fb143cf [1/12] arm64: dts: socfpga: agilex5: Add dma-coherent property
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311445.euLW3QVD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311445.euLW3QVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601311445.euLW3QVD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@10db0000 (snps,axi-dma-1.01a): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml
   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: dma-controller@10dc0000 (snps,axi-dma-1.01a): 'dma-coherent' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dw-axi-dmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
