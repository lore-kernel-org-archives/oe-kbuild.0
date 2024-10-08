Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6107426ADD
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728395570; cv=none; b=QHEvHCzSx7PRFikZAWCA+OY3xlmRmrL2rjH6+mfJVZh2pjuDdI1JLXQuiO5jHt/5GT8Jv3eq8lrh/KbZ5ssaxjd7rinywplCZQOfox4DTNVUHxOpSJV6z9SVYv8+jPRJz1OVtFhzPG4Q3sZP9XCI4MluDpdHbglpmSZ+7GuhKVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728395570; c=relaxed/simple;
	bh=gwuUZ0o4Gnqit1jvTbAel/oYwSulgq4KEP+oNAPChqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AU9GqQkYYN2VQMrZzbSxUrOfNDF5/eY2Z2GFLehYeQSSk8smmF2vNVUlMHnboiXytzDx75NHd21W7iLQRtxtSqh4FvDb9KDuJrI5LRS93/MAE+CLTPHa8kNj2lXTonmtkJVkOR28ltiu2rhoXr35EmEPFu5ff4a7cDocm++weDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB0KGljd; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB0KGljd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728395568; x=1759931568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gwuUZ0o4Gnqit1jvTbAel/oYwSulgq4KEP+oNAPChqU=;
  b=LB0KGljdB2kuHrb57FqCPFHpwbTQsXotYroKMYs6oBJnwK4CEWlcWD7+
   Roq9MvVCIXH+7pB43qYNBHme9PEXW4sI7EktgnYxhHI6lConrAZHAcbV3
   C16n23pPB8orH7YfyNG9soVNb/xzuli8ySVQooglBRu0tHckdLPz18p8C
   +gr6aT6FlGAJas1icQqbF521cFw9j27ZyUQqRI++vnxnhE92TYFg+bzBw
   /hFfrTIAd6e1hrV8/rSBzWVGoU6rplEF099Ki5ZhMg7ytnsRcJ9wRTVt9
   QMKuKGrV0ERqfaQF9T43r615N6N8syKEvhWtZ9uor4zFhw83Il+DUSlUf
   A==;
X-CSE-ConnectionGUID: vq3OA6iAQtSJYpjLw+3QWg==
X-CSE-MsgGUID: 02qlQwkmTEK1ZZm3Wfp5QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="30470011"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="30470011"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 06:52:48 -0700
X-CSE-ConnectionGUID: 67jy7SKfS1qioLk4ummOJA==
X-CSE-MsgGUID: ECD7WigCSAWnpUp0WKao3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80277919"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Oct 2024 06:52:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syAdo-0007wg-2S;
	Tue, 08 Oct 2024 13:52:44 +0000
Date: Tue, 8 Oct 2024 21:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/8] ARM: dts: socfpga: add Enclustra SoM dts files
Message-ID: <202410082141.XSjVC0sV-lkp@intel.com>
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
In-Reply-To: <20241007133115.1482619-9-l.rubusch@gmail.com>
References: <20241007133115.1482619-9-l.rubusch@gmail.com>
TO: Lothar Rubusch <l.rubusch@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dinguyen@kernel.org
TO: marex@denx.de
TO: s.trumtrar@pengutronix.de
CC: l.rubusch@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.12-rc2 next-20241008]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/ARM-dts-socfpga-fix-dtschema-issues/20241007-213514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241007133115.1482619-9-l.rubusch%40gmail.com
patch subject: [PATCH 8/8] ARM: dts: socfpga: add Enclustra SoM dts files
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082141.XSjVC0sV-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410082141.XSjVC0sV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410082141.XSjVC0sV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi:35.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.15-96.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
--
>> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi:35.9-39.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.15-96.5: Warning (simple_bus_reg): /soc/fpga-region: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (simple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (simple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
   arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (simple_bus_reg): /soc/usbphy: missing or empty reg/ranges property

vim +35 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi

b4646a1f0f7278 Lothar Rubusch 2024-10-07   7  
b4646a1f0f7278 Lothar Rubusch 2024-10-07   8  / {
b4646a1f0f7278 Lothar Rubusch 2024-10-07   9  	model = "Enclustra Mercury+ SA2";
b4646a1f0f7278 Lothar Rubusch 2024-10-07  10  	compatible = "altr,socfpga-cyclone5", "altr,socfpga";
b4646a1f0f7278 Lothar Rubusch 2024-10-07  11  
b4646a1f0f7278 Lothar Rubusch 2024-10-07  12  	chosen {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  13  		stdout-path = "serial0:115200n8";
b4646a1f0f7278 Lothar Rubusch 2024-10-07  14  	};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  15  
b4646a1f0f7278 Lothar Rubusch 2024-10-07  16  	aliases {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  17  		ethernet0 = &gmac1;
b4646a1f0f7278 Lothar Rubusch 2024-10-07  18  	};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  19  
b4646a1f0f7278 Lothar Rubusch 2024-10-07  20  	/* Adjusted the i2c labels to use generic base-board dtsi files for
b4646a1f0f7278 Lothar Rubusch 2024-10-07  21  	 * Enclustra Arria10 and Cyclone5 SoMs.
b4646a1f0f7278 Lothar Rubusch 2024-10-07  22  	 *
b4646a1f0f7278 Lothar Rubusch 2024-10-07  23  	 * The set of i2c0 and i2c1 labels defined in socfpga_cyclone5.dtsi and in
b4646a1f0f7278 Lothar Rubusch 2024-10-07  24  	 * socfpga_arria10.dtsi do not allow for using the same base-board .dtsi
b4646a1f0f7278 Lothar Rubusch 2024-10-07  25  	 * fragments. Thus define generic labels here to match the correct i2c
b4646a1f0f7278 Lothar Rubusch 2024-10-07  26  	 * bus in a generic base-board .dtsi file.
b4646a1f0f7278 Lothar Rubusch 2024-10-07  27  	 */
b4646a1f0f7278 Lothar Rubusch 2024-10-07  28  	soc {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  29  		i2c_encl: i2c@ffc04000 {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  30  		};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  31  		i2c_encl_fpga: i2c@ffc05000 {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  32  		};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  33  	};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  34  
b4646a1f0f7278 Lothar Rubusch 2024-10-07 @35  	memory {
b4646a1f0f7278 Lothar Rubusch 2024-10-07  36  		name = "memory";
b4646a1f0f7278 Lothar Rubusch 2024-10-07  37  		device_type = "memory";
b4646a1f0f7278 Lothar Rubusch 2024-10-07  38  		reg = <0x0 0x80000000>; /* 2GB */
b4646a1f0f7278 Lothar Rubusch 2024-10-07  39  	};
b4646a1f0f7278 Lothar Rubusch 2024-10-07  40  };
b4646a1f0f7278 Lothar Rubusch 2024-10-07  41  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
