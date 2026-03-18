Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7AD1D5ABA
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 01:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773795905; cv=none; b=jtanAPgWshSKbOAUPulAlkSsviQ6bhREej1zcl1jlvwXjePz0lAMtE7YLCutC0fl3sEHe3mTzYrWY/0NvzuIhEmoH5pBzs03tyygO5Pdz+KhNHv68fmNMLGCXoCFrAgOoqgcxRkPLtDthJ3kjJ+B414TbfWUNK4Hrx6TOGL9hmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773795905; c=relaxed/simple;
	bh=QvOIGpHpt5pnxZShLVe2KHYzeJbocz990LUCu0iLVwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t0bjAyFELmq7bGoPuNmbJMZSc0yomYO+/9oarj23mUf/i++74IRQeSlVlI+uZ84+h+QsQy+gSNR9WWNO+qdKI9Z1H7OQEZebCiEma6+hggfy6M4IkNbOnqpWqP/Zb2xsTczlKD+QxfOwYDpXKxqBsrF6D0hsswk9OESSxXnqG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBL7BwQ4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBL7BwQ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773795902; x=1805331902;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QvOIGpHpt5pnxZShLVe2KHYzeJbocz990LUCu0iLVwk=;
  b=IBL7BwQ4W4BJQjuoLWvkSexyzhUAga062iIGEg4bkYk2jENxy8bj3xBH
   yk2HHp+WFPlnzTOF1OzJQLVI49anpXnZZaHcz59I94mbIayh6TcmPLCSG
   +JRK0vZ6iVf5ZDd8JVAjyohbhNWz39l9QIS0bkzDFq3xWICYJS1Z/XLAN
   PvR1LMXYVi1cKb1SM17j0BoFu1CFHl+HuDTOEl0bK8q6CyW78gShoyKZk
   USpIVc9lNXZdO8T/lF4DMYPpyVwkrJjiGhGuv0sbWeQrq/qsptoYErNkk
   6VknvYfWlBgfFIUfLOAHIiGvVYxuDHeyo3nHX+Lu+tGpo8wsGUiyq+rPy
   g==;
X-CSE-ConnectionGUID: tpYQnmftQHSKR1kvIW//5g==
X-CSE-MsgGUID: oKX5CKm8ScqGko2QUKg8zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92413946"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92413946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:05:01 -0700
X-CSE-ConnectionGUID: qbMVSAIYRgWNPF27f3QCXA==
X-CSE-MsgGUID: fwZsE2gfQtWo4CT2voJ09w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="226905582"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Mar 2026 18:05:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2fLF-000000002H1-45Xu;
	Wed, 18 Mar 2026 01:04:57 +0000
Date: Wed, 18 Mar 2026 09:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4] powerpc: dts: Build devicetrees of enabled platforms
Message-ID: <202603180812.V1P1NEKX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260315-mpc83xx-dtb-v4-1-243849be4280@posteo.net>
References: <20260315-mpc83xx-dtb-v4-1-243849be4280@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: devicetree@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/powerpc-dts-Build-devicetrees-of-enabled-platforms/20260316-054914
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260315-mpc83xx-dtb-v4-1-243849be4280%40posteo.net
patch subject: [PATCH v4] powerpc: dts: Build devicetrees of enabled platforms
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-001-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180812.V1P1NEKX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180812.V1P1NEKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603180812.V1P1NEKX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o2d300.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/uc101.dts:109.13-149.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/uc101.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o2d.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mgcoge.dts:91.9-94.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mgcoge.dts:114.10-124.6: Warning (unit_address_vs_reg): /soc@f0000000/cpm@119c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mgcoge.dts:52.13-75.5: Warning (simple_bus_reg): /localbus@f0010100/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mgcoge.dts:77.13-88.5: Warning (simple_bus_reg): /localbus@f0010100/flash@5,0: simple-bus unit address format error, expected "500000000"
   arch/powerpc/boot/dts/mgcoge.dts:114.10-124.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/muram: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mgcoge.dts:170.15-185.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/mdio@10d40: simple-bus unit address format error, expected "10d00"
   arch/powerpc/boot/dts/mgcoge.dts:221.14-228.6: Warning (simple_bus_reg): /soc@f0000000/cpm@119c0/spi@11aa0: simple-bus unit address format error, expected "11a80"
   arch/powerpc/boot/dts/mgcoge.dts:105.13-230.5: Warning (interrupt_provider): /soc@f0000000/cpm@119c0: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/mgcoge.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/a3m071.dts:98.13-125.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/a3m071.dts:127.12-132.5: Warning (simple_bus_reg): /localbus/fpga@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/a3m071.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/motionpro.dts:102.12-105.5: Warning (simple_bus_reg): /localbus/cpld@2,0: simple-bus unit address format error, expected "200000000"
   arch/powerpc/boot/dts/motionpro.dts:108.14-111.5: Warning (simple_bus_reg): /localbus/anybus@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/motionpro.dts:112.26-115.5: Warning (simple_bus_reg): /localbus/pro_module_general@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/motionpro.dts:116.24-119.5: Warning (simple_bus_reg): /localbus/pro_module_dio@3,800: simple-bus unit address format error, expected "300000800"
   arch/powerpc/boot/dts/motionpro.dts:122.13-129.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/motionpro.dts:108.14-111.5: Warning (unique_unit_address_if_enabled): /localbus/anybus@3,0: duplicate unit-address (also used in node /localbus/pro_module_general@3,0)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/motionpro.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5121.dtsi:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/mpc5121.dtsi:457.13-466.5: Warning (spi_bus_bridge): /soc@80000000/psc@11900: node name for SPI buses should be 'spi'
>> arch/powerpc/boot/dts/pdm360ng.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
   arch/powerpc/boot/dts/mpc5121.dtsi:79.9-88.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/powerpc/boot/dts/mpc5121.dtsi:273.13-280.5: Warning (unique_unit_address_if_enabled): /soc@80000000/mdio@2800: duplicate unit-address (also used in node /soc@80000000/ethernet@2800)
   arch/powerpc/boot/dts/mpc5121.dtsi:508.20-525.4: Warning (interrupt_provider): /pci@80008500: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/pdm360ng.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o2mnt.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o2i.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/cm5200.dts:76.13-83.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/cm5200.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o3dnt.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:284.21-289.4: Warning (unit_address_vs_reg): /localbus: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/o2d.dtsi:75.13-95.5: Warning (simple_bus_reg): /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/o2d.dtsi:97.11-110.5: Warning (simple_bus_reg): /localbus/csi@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_address_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mpc5200b.dtsi:267.20-282.4: Warning (interrupt_provider): /pci@f0000d00: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/o2dnt2.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@0: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@80: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@100: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (unit_address_vs_reg): /soc@fef00000/dma-channel@180: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (unit_address_vs_reg): /pcie@fef09000: node has a unit name, but no reg or ranges property
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (pci_bridge): /pcie@fef09000: missing ranges for PCI bridge (or not a bridge)
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:129.9-143.4: Warning (pci_bridge): /pcie@fef09000/pcie@0: missing ranges for PCI bridge (or not a bridge)
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (unit_address_format): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_reg): Failed prerequisite 'pci_bridge'
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (pci_device_bus_num): Failed prerequisite 'pci_bridge'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:56.13-72.5: Warning (simple_bus_reg): /localbus@fef05000/flash@1,0: simple-bus unit address format error, expected "100000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:74.13-78.5: Warning (simple_bus_reg): /localbus@fef05000/nvram@3,0: simple-bus unit address format error, expected "300000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:80.12-83.5: Warning (simple_bus_reg): /localbus@fef05000/fpga@4,0: simple-bus unit address format error, expected "400000000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:85.19-91.5: Warning (simple_bus_reg): /localbus@fef05000/watchdog@4,2000: simple-bus unit address format error, expected "400002000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:101.23-108.5: Warning (simple_bus_reg): /localbus@fef05000/pic@4,4000: simple-bus unit address format error, expected "400004000"
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:109.26-114.5: Warning (simple_bus_reg): /localbus@fef05000/gpio@7,14000: simple-bus unit address format error, expected "700014000"
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:44.16-46.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@0: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:47.17-49.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@80: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:50.18-52.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@100: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:53.18-55.4: Warning (simple_bus_reg): /soc@fef00000/dma-channel@180: missing or empty reg/ranges property
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (unique_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:195.22-209.4: Warning (interrupt_provider): /pcie@fef08000: '#interrupt-cells' found, but node is not an interrupt provider
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (interrupt_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
