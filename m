Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42288537F8
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 18:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732818249; cv=none; b=hWlAECtqo44sDkuYG4KLXLnTU/JHMYlzYRwJa42KfJYWjl1tBI4sZ+SblqoFEjQweZRb7+hWWXaIwiGCvddh6UB8w0utQhjuoybUVNX4nruVTWFXiW0eU9y33ZmtcKdNfIXpGUnlLh5AYNMyudQnqZNFVi/74mVeCCGGO+FsvgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732818249; c=relaxed/simple;
	bh=6iHgjt1dp94ZKJAyffuQ2Jq5uVyyH2hghodpb+A0KMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCsWOf9evZMfOV6I2GciaWng6EsIaFbd4a1XiFeOpFbUpPSur5eg/kMqhbQs+2CxQTsDTS7WIqSN60dJs0UChJ3W9puPduhZo0RGiUSSNSuvyaOLHgx1WsCZmDgqqL4tEai3zFCTp+9MZSn1eGTHyOx/WOrZipwPBUPb4Lv1Eyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIkjxB4+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIkjxB4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732818248; x=1764354248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6iHgjt1dp94ZKJAyffuQ2Jq5uVyyH2hghodpb+A0KMo=;
  b=PIkjxB4+BsttrsK+paCIN3me1Ltzw6SF5g8GI65h/HbKkHwId6yxYgTg
   xrgJiTgsNvahGlJbivuX0wBwTlB4HDKMQZPgjmQJoczURVvfk71cZzCqU
   l0HQHxi1vbzQnTRu00bTvKnyZShlL5T7l4JEXzl1gdlrnGYHeWLCrgtJO
   9e2lVpa7CNjmuKKIi7L1SAwlnKIpcGSSQO2AhqCgApKFcbOn40ePHTmRU
   tAmPSf8Vi7KgunQ05easBCiGQqhs2CxLFrsaWko3/+MZsdxwWYIcUY2Im
   eeYn0lxJtFCk0vjfN7fWMZr9lwh5ZP12CVahT0NUXVGCqRxi6tLXOYuah
   g==;
X-CSE-ConnectionGUID: 96DrEtd3RUmjr3eBX7UJaw==
X-CSE-MsgGUID: QWhbBXGkQNuf4bUWVrHiEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43548837"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="43548837"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:24:07 -0800
X-CSE-ConnectionGUID: 5UMFzF1bQBiJcVd5YoMD7A==
X-CSE-MsgGUID: z8zu5tfZTF2OhdzLNGSlGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97060610"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 10:24:06 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGjBL-0009uB-0f;
	Thu, 28 Nov 2024 18:24:03 +0000
Date: Fri, 29 Nov 2024 02:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 11/11] ARM: dts: socfpga: add Enclustra SoM dts files
Message-ID: <202411290213.VOpZ6JU1-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241116131025.114542-12-l.rubusch@gmail.com>
References: <20241116131025.114542-12-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
CC: marex@denx.de
CC: s.trumtrar@pengutronix.de
CC: l.rubusch@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12-rc7]
[also build test WARNING on linus/master next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/ARM-dts-socfpga-add-Enclustra-boot-mode-dtsi/20241121-092540
base:   v6.12-rc7
patch link:    https://lore.kernel.org/r/20241116131025.114542-12-l.rubusch%40gmail.com
patch subject: [PATCH v5 11/11] ARM: dts: socfpga: add Enclustra SoM dts files
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-001-20241121 (https://download.01.org/0day-ci/archive/20241129/202411290213.VOpZ6JU1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290213.VOpZ6JU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411290213.VOpZ6JU1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi:35.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.20-96.5: Warning (simple_bus_reg): /soc/base_fpga_region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi:35.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.20-96.5: Warning (simple_bus_reg): /soc/base_fpga_region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property

vim +35 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi

9e43c1044b96b9 Lothar Rubusch 2024-11-16   7  
9e43c1044b96b9 Lothar Rubusch 2024-11-16   8  / {
9e43c1044b96b9 Lothar Rubusch 2024-11-16   9  	model = "Enclustra Mercury SA1";
9e43c1044b96b9 Lothar Rubusch 2024-11-16  10  	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
9e43c1044b96b9 Lothar Rubusch 2024-11-16  11  
9e43c1044b96b9 Lothar Rubusch 2024-11-16  12  	chosen {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  13  		stdout-path = "serial0:115200n8";
9e43c1044b96b9 Lothar Rubusch 2024-11-16  14  	};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  15  
9e43c1044b96b9 Lothar Rubusch 2024-11-16  16  	aliases {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  17  		ethernet0 = &gmac1;
9e43c1044b96b9 Lothar Rubusch 2024-11-16  18  	};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  19  
9e43c1044b96b9 Lothar Rubusch 2024-11-16  20  	/* Adjusted the i2c labels to use generic base-board dtsi files for
9e43c1044b96b9 Lothar Rubusch 2024-11-16  21  	 * Enclustra Arria10 and Cyclone5 SoMs.
9e43c1044b96b9 Lothar Rubusch 2024-11-16  22  	 *
9e43c1044b96b9 Lothar Rubusch 2024-11-16  23  	 * The set of i2c0 and i2c1 labels defined in socfpga_cyclone5.dtsi and in
9e43c1044b96b9 Lothar Rubusch 2024-11-16  24  	 * socfpga_arria10.dtsi do not allow for using the same base-board .dtsi
9e43c1044b96b9 Lothar Rubusch 2024-11-16  25  	 * fragments. Thus define generic labels here to match the correct i2c
9e43c1044b96b9 Lothar Rubusch 2024-11-16  26  	 * bus in a generic base-board .dtsi file.
9e43c1044b96b9 Lothar Rubusch 2024-11-16  27  	 */
9e43c1044b96b9 Lothar Rubusch 2024-11-16  28  	soc {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  29  		i2c_encl: i2c@ffc04000 {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  30  		};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  31  		i2c_encl_fpga: i2c@ffc05000 {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  32  		};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  33  	};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  34  
9e43c1044b96b9 Lothar Rubusch 2024-11-16 @35  	memory {
9e43c1044b96b9 Lothar Rubusch 2024-11-16  36  		name = "memory";
9e43c1044b96b9 Lothar Rubusch 2024-11-16  37  		device_type = "memory";
9e43c1044b96b9 Lothar Rubusch 2024-11-16  38  		reg = <0x0 0x40000000>; /* 1GB */
9e43c1044b96b9 Lothar Rubusch 2024-11-16  39  	};
9e43c1044b96b9 Lothar Rubusch 2024-11-16  40  };
9e43c1044b96b9 Lothar Rubusch 2024-11-16  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
