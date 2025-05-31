Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E8E3A1B6
	for <oe-kbuild@lists.linux.dev>; Sat, 31 May 2025 02:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748657608; cv=none; b=g0Ix7sSkrfZ+5tDBeiGAguLgoky4Bvp8dr6X9b5lAUfzQJWvq0gJhCY64bVzwvefmULHvu6vwwGTQDhfj69wXEqizN1glpKj8YUPtnZ9+w13bgteuqZyKxrZLVKdIBxluYZkCmVLnhswh+J4wnzg41HVpSe7yKDAmkLHujA5Lus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748657608; c=relaxed/simple;
	bh=nCAPHqaZLjGdxk16cOh+jb5KASLdSNr0i+Gj8S39ISU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvP2BajQf3/9RTMFXg4mm//R7e006Mt3eYaov2GBujmnkI51Qyi1q20GJV7wEjLNHDCTfcCxtrX9cCQftp2QiLYIFgNGSZBhr5ROt6VcMPGqRTRrDIf5/RgZz8F1ILyAgkmjhKsvK0mOE1xK+oygFBj6gZpm9oqC6/KFElE+0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfUpWqeb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfUpWqeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748657606; x=1780193606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nCAPHqaZLjGdxk16cOh+jb5KASLdSNr0i+Gj8S39ISU=;
  b=XfUpWqebSTcLtro+Rnuj7x07Uis7t8kM8qrAsKOJaotdx4w+ekgQspv6
   1MWyXap2gesBjKRo1wjtJgLSlV7AoG2ANNTutIyppW9FiIvR3CArolA5r
   w+rfH45NuF1Rk+/6e4fbFXl54EkmhijmpS+hgqbtUnARQRmVS8rWW8md7
   uU/7PiTY84/JUiRQLzSQE11wdyZPZEKaXtA+lDat+0rmSm8+rAhNKzCF0
   KWz1XXQeRMgF8G3MExPCBVbn8AF/55qOFExDG1p6KB9OilNB+YwJ4K5bX
   5fpYtVPsF6NaXfa36SAkWvZYZrpVtd+zWCj92J0F6dxsNT8I0XVpthdAP
   w==;
X-CSE-ConnectionGUID: PDHxNNqhRXKKvlBaGEVBMA==
X-CSE-MsgGUID: qDLI/D28QbG2Rd6nDbihBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50856108"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="50856108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 19:13:22 -0700
X-CSE-ConnectionGUID: 2wy7QjIOSYGWAXN3E9WpSw==
X-CSE-MsgGUID: NkY87ACESOqDDbgyecSWaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="144679498"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2025 19:13:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLBip-000Y8Y-1a;
	Sat, 31 May 2025 02:13:19 +0000
Date: Sat, 31 May 2025 10:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:renesas/dt64-4 17/44]
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: mmc@40100000
 (renesas,r9a06g032-sdhci): compatible: 'oneOf' conditional failed, one must
 be fixed:
Message-ID: <202505311044.G3NFzh1p-lkp@intel.com>
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
commit: 5147708ee812a5eac5202f231d48b5be1fea781d [17/44] ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
:::::: branch date: 5 days ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250531/202505311044.G3NFzh1p-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311044.G3NFzh1p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505311044.G3NFzh1p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-sdhci', 'renesas,rzn1-sdhci', 'arasan,sdhci-8.9a'] is too long
   	'arasan,sdhci-8.9a' was expected
   	'arasan,sdhci-4.9a' was expected
   	'arasan,sdhci-5.1' was expected
   	'rockchip,rk3399-sdhci-5.1' was expected
   	'xlnx,zynqmp-8.9a' was expected
   	'xlnx,versal-8.9a' was expected
   	'xlnx,versal-net-emmc' was expected
   	'intel,lgm-sdhci-5.1-emmc' was expected
   	'intel,lgm-sdhci-5.1-sdxc' was expected
   	'intel,keembay-sdhci-5.1-emmc' was expected
   	'intel,keembay-sdhci-5.1-sd' was expected
   	'intel,keembay-sdhci-5.1-sdio' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): interrupts: [[0, 69, 4], [0, 70, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
   arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dtb: mmc@40101000 (renesas,r9a06g032-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-sdhci', 'renesas,rzn1-sdhci', 'arasan,sdhci-8.9a'] is too long
   	'arasan,sdhci-8.9a' was expected
   	'arasan,sdhci-4.9a' was expected
   	'arasan,sdhci-5.1' was expected
   	'rockchip,rk3399-sdhci-5.1' was expected
   	'xlnx,zynqmp-8.9a' was expected
   	'xlnx,versal-8.9a' was expected
   	'xlnx,versal-net-emmc' was expected
--
   arch/arm/boot/dts/renesas/r9a06g032.dtsi:439.27-488.5: Warning (avoid_unnecessary_addr_size): /soc/switch@44050000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r9a06g032-sdhci', 'renesas,rzn1-sdhci', 'arasan,sdhci-8.9a'] is too long
   	'arasan,sdhci-8.9a' was expected
   	'arasan,sdhci-4.9a' was expected
   	'arasan,sdhci-5.1' was expected
   	'rockchip,rk3399-sdhci-5.1' was expected
   	'xlnx,zynqmp-8.9a' was expected
   	'xlnx,versal-8.9a' was expected
   	'xlnx,versal-net-emmc' was expected
   	'intel,lgm-sdhci-5.1-emmc' was expected
   	'intel,lgm-sdhci-5.1-sdxc' was expected
   	'intel,keembay-sdhci-5.1-emmc' was expected
   	'intel,keembay-sdhci-5.1-sd' was expected
   	'intel,keembay-sdhci-5.1-sdio' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml#
>> arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dtb: mmc@40100000 (renesas,r9a06g032-sdhci): interrupts: [[0, 69, 4], [0, 70, 4]] is too long
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
