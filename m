Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BA81D4323
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Nov 2024 22:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732229225; cv=none; b=i69oUlJIXhLchOMBmFoHQyXkUN5uCQ3lRm2OSE86wbaxoCfw8f+VRrPct+ZdM4OuJCHORCYHQ7gbOTW9wQSlIGWyBp9BQ1ZdN78XPECKe5QhhmlB+mAW9onAfU9BmhNBzWykOkk0XMPOY6drmognHMEQmB3bhtCdN3F04tRTRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732229225; c=relaxed/simple;
	bh=aRb3+T4Nxa1ILm/ImZSReb+N2U+XwPDiAN9DDV/Xr9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GF+JmLgSDlSvjenAtKHVuQAKTywTL673lqED+yQBeW4LT46L9wWw//S5WqOfAL/lKpX/sMosyP9MtmY3C0mw1nyqOW/mwFFjZbPA2XIg3F+pwj/OeJsjp0TvKRGvWA3Rtuwo8IIK5mMHJIZjDQKpHeVC4mE0W9pfN9WXRdNFghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dq3JYnmR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dq3JYnmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732229224; x=1763765224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRb3+T4Nxa1ILm/ImZSReb+N2U+XwPDiAN9DDV/Xr9Q=;
  b=dq3JYnmR8h2QOrDH0U+oTpJGUWF76rYTyosP9qD923OCLrMTDvEW2b+T
   fWMfYEZe+NRhk+pFr/asdTZ+rw6AjwbteO4EFiCA6sjP8SbvNAJJhEqBc
   JQv6qzQn70drJv6PX4qViT03lLhKksZDpFzwhDKc/XxVljqQnJ4Qvs3H1
   v1z1QqTNgOqQ7SSiD+pP5FU99n1EiUU4DuNgRQuX3jR/+4ZU4SsGPHJsd
   9UUSUiN57gTTS1FxHZiTMBBjnHUWqVq9h0LLmQTRQHr3a0S8nId7zmkXV
   LtcdOZFgr80vZoPJxTyEsSY7s/2vbMCrJo/uRlXPkaENePvyhDT5i/6Gb
   w==;
X-CSE-ConnectionGUID: OXnTxzQESvKlslubK95Rqw==
X-CSE-MsgGUID: FPObqcU4QienPDZskbVHZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36150201"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36150201"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 14:47:04 -0800
X-CSE-ConnectionGUID: 5s6aA5aaRU6hhXLpnHE8AA==
X-CSE-MsgGUID: /nxLskoFS0OT0oMEC5FBAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="94482428"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Nov 2024 14:47:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEFwy-0003Qz-1Q;
	Thu, 21 Nov 2024 22:47:00 +0000
Date: Fri, 22 Nov 2024 06:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 11/11] ARM: dts: socfpga: add Enclustra SoM dts files
Message-ID: <202411220644.yjZUVhxE-lkp@intel.com>
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
[also build test WARNING on linus/master next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/ARM-dts-socfpga-add-Enclustra-boot-mode-dtsi/20241121-092540
base:   v6.12-rc7
patch link:    https://lore.kernel.org/r/20241116131025.114542-12-l.rubusch%40gmail.com
patch subject: [PATCH v5 11/11] ARM: dts: socfpga: add Enclustra SoM dts files
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-001-20241121 (https://download.01.org/0day-ci/archive/20241122/202411220644.yjZUVhxE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220644.yjZUVhxE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411220644.yjZUVhxE-lkp@intel.com/

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
