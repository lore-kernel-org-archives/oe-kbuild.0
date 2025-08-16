Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B72D7D35
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755342913; cv=none; b=D4QohNJ+NcCjlSIsbyJuR3vWnkGrT5K4ZHf7PNvMe51N2lkF8MMZuDvWchXFXyytyjylPGRe+OdfEvfN6WkW2O+x/eOT+iLrGVBg/SHUrFvgDTAS9R52XUMIzpcwZd82j+pK03YZQJxRkiWBuueL7wP7fP9VxKOthDrDgEiPUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755342913; c=relaxed/simple;
	bh=k2zGypRBZ6MzQUnvKf9FuEkFNY7W7ZLpKhPrY7S0COs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+7YLQia8VDM68kNnSlxIoyUvrHZJii7Mr71wh6MYM5POZP2XExw31sbW4D7KA7B5NiZV592CL9ICmnCTrrTIpYRh4b/CXOAB2Rf6sQa+PZixRVnTLKPHnPNWyEQ+SBzCmeVyFSskI6lMRf54kKqTfKPc4fOxDbmH9/t8mY736g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NiTK1Xsu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NiTK1Xsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755342911; x=1786878911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k2zGypRBZ6MzQUnvKf9FuEkFNY7W7ZLpKhPrY7S0COs=;
  b=NiTK1Xsu48AKKicekKBblYho/0IELBY6jdKhggYgAWt/Gb88YkbEbyDX
   QWc2caYe2+DadILV44WZo3G8ZkiGCd1S3QmHUC8wiuPhPwGd/v3Vtw/AI
   yQtcltMw7z5fI2dh3TxEIeqwUwtw+26h119ZN+1k6jr8sXJ47ond33vBN
   1RGoHEmGaxPtalL5VoGZYs+E5TjVEnxYohtMWLZE8GNVHyGSiYrMt9Ved
   36w+2GR1Ia4S8QMETL9MofFb+NsY+mzmKB8F1x1I0XnUiZRJmuklP8eH4
   304RwWvBILsoyP9bBGBLBuyJk4w7m7LaHC9qJ2QsNlR6m7nk4TYBbsyal
   w==;
X-CSE-ConnectionGUID: uQAx/apXTomYh2L/bMcAzg==
X-CSE-MsgGUID: 8bjjOipgT7SJ/AKn8XXBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83070416"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="83070416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 04:15:11 -0700
X-CSE-ConnectionGUID: NTV4NMXpS0ma0LYnqbzCgw==
X-CSE-MsgGUID: zwrpqGbRRM2Kue5IkcoZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166429181"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 Aug 2025 04:15:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unEsN-000Cq8-1E;
	Sat, 16 Aug 2025 11:15:07 +0000
Date: Sat, 16 Aug 2025 19:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] arm64: dts: broadcom: Enable RP1 ethernet for
 Raspberry Pi 5
Message-ID: <202508161814.g72gYugV-lkp@intel.com>
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
In-Reply-To: <20250815135911.1383385-6-svarbanov@suse.de>
References: <20250815135911.1383385-6-svarbanov@suse.de>
TO: Stanimir Varbanov <svarbanov@suse.de>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-rpi-kernel@lists.infradead.org
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
CC: Andrew Lunn <andrew+netdev@lunn.ch>
CC: "David S . Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Andrea della Porta <andrea.porta@suse.com>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: Phil Elwell <phil@raspberrypi.com>
CC: Jonathan Bell <jonathan@raspberrypi.com>
CC: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Stanimir Varbanov <svarbanov@suse.de>

Hi Stanimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net/main net-next/main linus/master v6.17-rc1 next-20250815]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanimir-Varbanov/net-cadence-macb-Set-upper-32bits-of-DMA-ring-buffer/20250815-220352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250815135911.1383385-6-svarbanov%40suse.de
patch subject: [PATCH 5/5] arm64: dts: broadcom: Enable RP1 ethernet for Raspberry Pi 5
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250816/202508161814.g72gYugV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161814.g72gYugV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508161814.g72gYugV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:32.7-42.4: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus/pci-ep-bus@1/ethernet@40100000/mdio: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback

vim +32 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts

56939dde8b55c6 Stanimir Varbanov 2025-08-15  26  
56939dde8b55c6 Stanimir Varbanov 2025-08-15  27  &rp1_eth {
56939dde8b55c6 Stanimir Varbanov 2025-08-15  28  	status = "okay";
56939dde8b55c6 Stanimir Varbanov 2025-08-15  29  	phy-mode = "rgmii-id";
56939dde8b55c6 Stanimir Varbanov 2025-08-15  30  	phy-handle = <&phy1>;
56939dde8b55c6 Stanimir Varbanov 2025-08-15  31  
56939dde8b55c6 Stanimir Varbanov 2025-08-15 @32  	mdio {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
