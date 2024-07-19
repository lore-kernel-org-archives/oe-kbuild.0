Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384211474DA
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721415049; cv=none; b=Y3HzpeuSCNwDwM7Ar9YA/GfUCKZCmgJ3hXbi2gY2XJgMWkBPHcCJtPRbfXGnYEl0mm7pk4CS1wHRfYPHRjcV/4Oz7LrG8267JQJglSwKkxBFwUVh6Ds19rLlss19yhHFj+09IfgkdoTeiK5sip5hFPEoWJMXa8/HLmfIbJgrhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721415049; c=relaxed/simple;
	bh=oQGdTQL5zMJsSz2S0wSJ4Z0mCOjeg3VgX5z/WoYE31g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8F5mNI3ZXaytPFuhe2dtUmvv2B3P4bmRWTULB5ft5mRXq/QEGSB5yi3P/LDojCYXPlxFpyHPR1wdNTMkxhW+6CoVXiRCoSQ3l9AQQzEofyAbZ0pVCAue93vRtOHEFl7w/5jLPqe/HoJnzIiODnPGpWrlvAxENMwHohLMH6TA50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRs7XT+U; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRs7XT+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721415045; x=1752951045;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oQGdTQL5zMJsSz2S0wSJ4Z0mCOjeg3VgX5z/WoYE31g=;
  b=WRs7XT+UdczW5QYXcqsQVr2yhLHfUPmySn9gS6mNLFApSy6XpWtylBJn
   bfrQp/iyScY7eUzsuW1s+rVnFlUc2xCDDL0tDw4I53lWSV12HmCDCkkBY
   ZRGxjnmHqx65lJWlj1b3AUWRraEeGfJZ2bsPy23QYITWozRem8GyYn4+Q
   1H6dOf5OGU8TN9/USb3t+J/hZu94vKRzERNRQaf2ZJSK6AXd0m8WN0dA0
   hOBXQCLftdAaumQ775mLLs0We7FlQjOA3zVc8iNyVzZn6y9p3+aUL3Z/7
   BENS6F1PzGZ3kFqnCGHQmvomMqsiNE0cBCDFsHsjQcNOYUBKVyMiGQdeX
   g==;
X-CSE-ConnectionGUID: SdvblenhTherEhEv/u6Rew==
X-CSE-MsgGUID: V4Ky5hZISGqyLOaH62aOgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22913220"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="22913220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 11:50:43 -0700
X-CSE-ConnectionGUID: 1k333ZIaSU+i/PV36NTAVQ==
X-CSE-MsgGUID: pytyH+beTKmCUQnv19ua1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51237121"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jul 2024 11:50:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUsgg-000iUI-1B;
	Fri, 19 Jul 2024 18:50:38 +0000
Date: Sat, 20 Jul 2024 02:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v2 2/4] arm: dts: marvell: armada-38x: add
 description for usb phys
Message-ID: <202407200236.1EFOPha5-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240716-a38x-utmi-phy-v2-2-dae3a9c6ca3e@solid-run.com>
References: <20240716-a38x-utmi-phy-v2-2-dae3a9c6ca3e@solid-run.com>
TO: Josua Mayer <josua@solid-run.com>

Hi Josua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/dt-bindings-phy-cp110-utmi-phy-add-compatible-string-for-armada-38x/20240717-150210
base:   1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
patch link:    https://lore.kernel.org/r/20240716-a38x-utmi-phy-v2-2-dae3a9c6ca3e%40solid-run.com
patch subject: [PATCH RFC v2 2/4] arm: dts: marvell: armada-38x: add description for usb phys
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-002-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200236.1EFOPha5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200236.1EFOPha5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407200236.1EFOPha5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/marvell/armada-388-db.dts:179.32-188.5: Warning (unit_address_vs_reg): /sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
--
   arch/arm/boot/dts/marvell/armada-385-db-ap.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-388-rd.dts:24.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:422.23-434.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
--
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (unit_address_vs_reg): /soc/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-385-linksys.dtsi:21.9-24.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (unit_address_vs_reg): /soc/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts:27.9-30.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:422.23-434.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)
--
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (unit_address_vs_reg): /soc/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts:20.9-23.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-385-synology-ds116.dts:129.12-143.5: Warning (simple_bus_reg): /soc/gpio-fan: missing or empty reg/ranges property
--
   arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts:32.9-35.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-385-clearfog-gtr.dtsi:84.9-87.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (unit_address_vs_reg): /soc/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts:28.9-31.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-385-db-88f6820-amc.dts:129.10-150.4: Warning (avoid_unnecessary_addr_size): /soc/spi@10680/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-385-atl-x530.dts:171.10-199.4: Warning (avoid_unnecessary_addr_size): /soc/spi@10680/flash@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
--
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-388-helios4.dts:244.14-249.6: Warning (simple_bus_reg): /soc/internal-regs/spi@10680: missing or empty reg/ranges property
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-388-gp.dts:23.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
--
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (unit_address_vs_reg): /soc/pcie: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts:34.9-37.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/marvell/armada-38x.dtsi:45.11-48.5: Warning (simple_bus_reg): /soc/bootrom: simple-bus unit address format error, expected "11d000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:50.32-58.5: Warning (simple_bus_reg): /soc/devbus-bootcs: simple-bus unit address format error, expected "f001000000010400"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:60.26-68.5: Warning (simple_bus_reg): /soc/devbus-cs0: simple-bus unit address format error, expected "f001000000010408"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:70.26-78.5: Warning (simple_bus_reg): /soc/devbus-cs1: simple-bus unit address format error, expected "f001000000010410"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:80.26-88.5: Warning (simple_bus_reg): /soc/devbus-cs2: simple-bus unit address format error, expected "f001000000010418"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:90.26-98.5: Warning (simple_bus_reg): /soc/devbus-cs3: simple-bus unit address format error, expected "f001000000010420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:100.17-691.5: Warning (simple_bus_reg): /soc/internal-regs: simple-bus unit address format error, expected "f001000000000000"
>> arch/arm/boot/dts/marvell/armada-38x.dtsi:395.37-398.6: Warning (simple_bus_reg): /soc/internal-regs/system-controller@18400: simple-bus unit address format error, expected "18420"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:636.27-640.6: Warning (simple_bus_reg): /soc/internal-regs/thermal@e8078: simple-bus unit address format error, expected "e4078"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:693.26-700.5: Warning (simple_bus_reg): /soc/sa-sram0: simple-bus unit address format error, expected "919000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:702.26-709.5: Warning (simple_bus_reg): /soc/sa-sram1: simple-bus unit address format error, expected "915000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:711.20-720.5: Warning (simple_bus_reg): /soc/bm-bppi: simple-bus unit address format error, expected "c04000000000000"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:722.19-732.5: Warning (simple_bus_reg): /soc/spi@10600: simple-bus unit address format error, expected "f001000000010600"
   arch/arm/boot/dts/marvell/armada-38x.dtsi:734.19-744.5: Warning (simple_bus_reg): /soc/spi@10680: simple-bus unit address format error, expected "f001000000010680"
   arch/arm/boot/dts/marvell/armada-385.dtsi:36.15-179.5: Warning (simple_bus_reg): /soc/pcie: simple-bus unit address format error, expected "f001000000080000"
   arch/arm/boot/dts/marvell/armada-381-netgear-gs110emx.dts:243.10-286.4: Warning (avoid_unnecessary_addr_size): /soc/spi@10600/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/marvell/armada-38x.dtsi:422.23-434.6: Warning (unique_unit_address_if_enabled): /soc/internal-regs/timer@20300: duplicate unit-address (also used in node /soc/internal-regs/watchdog@20300)

vim +/18420 +395 arch/arm/boot/dts/marvell/armada-38x.dtsi

0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   16  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   17  / {
abe60a3a7afb40 arch/arm/boot/dts/armada-38x.dtsi         Rob Herring      2019-01-09   18  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/armada-38x.dtsi         Rob Herring      2019-01-09   19  	#size-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/armada-38x.dtsi         Rob Herring      2019-01-09   20  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   21  	model = "Marvell Armada 38x family SoC";
8dbdb8e704db34 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2014-06-23   22  	compatible = "marvell,armada380";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   23  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   24  	aliases {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   25  		gpio0 = &gpio0;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   26  		gpio1 = &gpio1;
bf6acf1657ab90 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2015-03-03   27  		serial0 = &uart0;
bf6acf1657ab90 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2015-03-03   28  		serial1 = &uart1;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   29  	};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   30  
754c4b1b2bddc6 arch/arm/boot/dts/armada-38x.dtsi         Ezequiel Garcia  2015-03-03   31  	pmu {
754c4b1b2bddc6 arch/arm/boot/dts/armada-38x.dtsi         Ezequiel Garcia  2015-03-03   32  		compatible = "arm,cortex-a9-pmu";
754c4b1b2bddc6 arch/arm/boot/dts/armada-38x.dtsi         Ezequiel Garcia  2015-03-03   33  		interrupts-extended = <&mpic 3>;
754c4b1b2bddc6 arch/arm/boot/dts/armada-38x.dtsi         Ezequiel Garcia  2015-03-03   34  	};
754c4b1b2bddc6 arch/arm/boot/dts/armada-38x.dtsi         Ezequiel Garcia  2015-03-03   35  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   36  	soc {
a9e274c42da921 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-12-30   37  		compatible = "marvell,armada380-mbus", "simple-bus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   38  		#address-cells = <2>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   39  		#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   40  		controller = <&mbusc>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   41  		interrupt-parent = <&gic>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   42  		pcie-mem-aperture = <0xe0000000 0x8000000>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   43  		pcie-io-aperture  = <0xe8000000 0x100000>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   44  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   45  		bootrom {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   46  			compatible = "marvell,bootrom";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   47  			reg = <MBUS_ID(0x01, 0x1d) 0 0x200000>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   48  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   49  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01   50  		devbus_bootcs: devbus-bootcs {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   51  			compatible = "marvell,mvebu-devbus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   52  			reg = <MBUS_ID(0xf0, 0x01) 0x10400 0x8>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   53  			ranges = <0 MBUS_ID(0x01, 0x2f) 0 0xffffffff>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   54  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   55  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   56  			clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   57  			status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   58  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   59  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01   60  		devbus_cs0: devbus-cs0 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   61  			compatible = "marvell,mvebu-devbus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   62  			reg = <MBUS_ID(0xf0, 0x01) 0x10408 0x8>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   63  			ranges = <0 MBUS_ID(0x01, 0x3e) 0 0xffffffff>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   64  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   65  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   66  			clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   67  			status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   68  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   69  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01   70  		devbus_cs1: devbus-cs1 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   71  			compatible = "marvell,mvebu-devbus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   72  			reg = <MBUS_ID(0xf0, 0x01) 0x10410 0x8>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   73  			ranges = <0 MBUS_ID(0x01, 0x3d) 0 0xffffffff>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   74  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   75  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   76  			clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   77  			status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   78  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   79  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01   80  		devbus_cs2: devbus-cs2 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   81  			compatible = "marvell,mvebu-devbus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   82  			reg = <MBUS_ID(0xf0, 0x01) 0x10418 0x8>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   83  			ranges = <0 MBUS_ID(0x01, 0x3b) 0 0xffffffff>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   84  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   85  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   86  			clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   87  			status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   88  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   89  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01   90  		devbus_cs3: devbus-cs3 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   91  			compatible = "marvell,mvebu-devbus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   92  			reg = <MBUS_ID(0xf0, 0x01) 0x10420 0x8>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   93  			ranges = <0 MBUS_ID(0x01, 0x37) 0 0xffffffff>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   94  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   95  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   96  			clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   97  			status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   98  		};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17   99  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  100  		internal-regs {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  101  			compatible = "simple-bus";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  102  			#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  103  			#size-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  104  			ranges = <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  105  
042fa3dcd5e988 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2019-09-27  106  			sdramc: sdramc@1400 {
042fa3dcd5e988 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2019-09-27  107  				compatible = "marvell,armada-xp-sdram-controller";
042fa3dcd5e988 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2019-09-27  108  				reg = <0x1400 0x500>;
042fa3dcd5e988 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2019-09-27  109  			};
042fa3dcd5e988 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2019-09-27  110  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  111  			L2: cache-controller@8000 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  112  				compatible = "arm,pl310-cache";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  113  				reg = <0x8000 0x1000>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  114  				cache-unified;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  115  				cache-level = <2>;
cda80a82ac3e89 arch/arm/boot/dts/armada-38x.dtsi         Yan Markman      2016-10-16  116  				arm,double-linefill-incr = <0>;
c8f5a878e55459 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2015-06-11  117  				arm,double-linefill-wrap = <0>;
cda80a82ac3e89 arch/arm/boot/dts/armada-38x.dtsi         Yan Markman      2016-10-16  118  				arm,double-linefill = <0>;
c8f5a878e55459 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2015-06-11  119  				prefetch-data = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  120  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  121  
964a6156d305c3 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-14  122  			scu@c000 {
964a6156d305c3 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-14  123  				compatible = "arm,cortex-a9-scu";
964a6156d305c3 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-14  124  				reg = <0xc000 0x58>;
964a6156d305c3 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-14  125  			};
964a6156d305c3 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-14  126  
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  127  			timer@c200 {
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  128  				compatible = "arm,cortex-a9-global-timer";
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  129  				reg = <0xc200 0x20>;
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  130  				interrupts = <GIC_PPI 11 (IRQ_TYPE_EDGE_RISING | GIC_CPU_MASK_SIMPLE(2))>;
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  131  				clocks = <&coreclk 2>;
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  132  			};
0f015017a95c27 arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2017-08-01  133  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  134  			timer@c600 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  135  				compatible = "arm,cortex-a9-twd-timer";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  136  				reg = <0xc600 0x20>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  137  				interrupts = <GIC_PPI 13 (IRQ_TYPE_EDGE_RISING | GIC_CPU_MASK_SIMPLE(2))>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  138  				clocks = <&coreclk 2>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  139  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  140  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  141  			gic: interrupt-controller@d000 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  142  				compatible = "arm,cortex-a9-gic";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  143  				#interrupt-cells = <3>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  144  				#size-cells = <0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  145  				interrupt-controller;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  146  				reg = <0xd000 0x1000>,
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  147  				      <0xc100 0x100>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  148  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  149  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  150  			i2c0: i2c@11000 {
fbffee74986c89 arch/arm/boot/dts/armada-38x.dtsi         Kalyan Kinthada  2017-09-29  151  				compatible = "marvell,mv78230-a0-i2c", "marvell,mv64xxx-i2c";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  152  				reg = <0x11000 0x20>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  153  				#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  154  				#size-cells = <0>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  155  				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  156  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  157  				status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  158  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  159  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  160  			i2c1: i2c@11100 {
fbffee74986c89 arch/arm/boot/dts/armada-38x.dtsi         Kalyan Kinthada  2017-09-29  161  				compatible = "marvell,mv78230-a0-i2c", "marvell,mv64xxx-i2c";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  162  				reg = <0x11100 0x20>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  163  				#address-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  164  				#size-cells = <0>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  165  				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  166  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  167  				status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  168  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  169  
10c5c472703714 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  170  			uart0: serial@12000 {
62480772263ab6 arch/arm/boot/dts/armada-38x.dtsi         Marek Behún      2021-11-09  171  				compatible = "marvell,armada-38x-uart", "ns16550a";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  172  				reg = <0x12000 0x100>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  173  				reg-shift = <2>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  174  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  175  				reg-io-width = <1>;
64939dc5bf264c arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-18  176  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  177  				status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  178  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  179  
8a48dccb8350ad arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2015-03-03  180  			uart1: serial@12100 {
62480772263ab6 arch/arm/boot/dts/armada-38x.dtsi         Marek Behún      2021-11-09  181  				compatible = "marvell,armada-38x-uart", "ns16550a";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  182  				reg = <0x12100 0x100>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  183  				reg-shift = <2>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  184  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  185  				reg-io-width = <1>;
64939dc5bf264c arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-04-18  186  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  187  				status = "disabled";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  188  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  189  
10c5c472703714 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  190  			pinctrl: pinctrl@18000 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  191  				reg = <0x18000 0x20>;
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  192  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  193  				ge0_rgmii_pins: ge-rgmii-pins-0 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  194  					marvell,pins = "mpp6", "mpp7", "mpp8",
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  195  						       "mpp9", "mpp10", "mpp11",
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  196  						       "mpp12", "mpp13", "mpp14",
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  197  						       "mpp15", "mpp16", "mpp17";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  198  					marvell,function = "ge0";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  199  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  200  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  201  				ge1_rgmii_pins: ge-rgmii-pins-1 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  202  					marvell,pins = "mpp21", "mpp27", "mpp28",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  203  						       "mpp29", "mpp30", "mpp31",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  204  						       "mpp32", "mpp37", "mpp38",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  205  						       "mpp39", "mpp40", "mpp41";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  206  					marvell,function = "ge1";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  207  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  208  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  209  				i2c0_pins: i2c-pins-0 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  210  					marvell,pins = "mpp2", "mpp3";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  211  					marvell,function = "i2c0";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  212  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  213  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  214  				mdio_pins: mdio-pins {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  215  					marvell,pins = "mpp4", "mpp5";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  216  					marvell,function = "ge";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  217  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  218  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  219  				ref_clk0_pins: ref-clk-pins-0 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  220  					marvell,pins = "mpp45";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  221  					marvell,function = "ref";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  222  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  223  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  224  				ref_clk1_pins: ref-clk-pins-1 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  225  					marvell,pins = "mpp46";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  226  					marvell,function = "ref";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  227  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  228  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  229  				spi0_pins: spi-pins-0 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  230  					marvell,pins = "mpp22", "mpp23", "mpp24",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  231  						       "mpp25";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  232  					marvell,function = "spi0";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  233  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  234  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  235  				spi1_pins: spi-pins-1 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  236  					marvell,pins = "mpp56", "mpp57", "mpp58",
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  237  						       "mpp59";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  238  					marvell,function = "spi1";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  239  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  240  
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  241  				nand_pins: nand-pins {
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  242  					marvell,pins = "mpp22", "mpp34", "mpp23",
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  243  						       "mpp33", "mpp38", "mpp28",
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  244  						       "mpp40", "mpp42", "mpp35",
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  245  						       "mpp36", "mpp25", "mpp30",
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  246  						       "mpp32";
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  247  					marvell,function = "dev";
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  248  				};
4c0437d03519c0 arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2016-08-24  249  
ba369daa40f18e arch/arm/boot/dts/armada-38x.dtsi         Sean Nyekjaer    2017-11-28  250  				nand_rb: nand-rb {
ba369daa40f18e arch/arm/boot/dts/armada-38x.dtsi         Sean Nyekjaer    2017-11-28  251  					marvell,pins = "mpp41";
ba369daa40f18e arch/arm/boot/dts/armada-38x.dtsi         Sean Nyekjaer    2017-11-28  252  					marvell,function = "nand";
ba369daa40f18e arch/arm/boot/dts/armada-38x.dtsi         Sean Nyekjaer    2017-11-28  253  				};
ba369daa40f18e arch/arm/boot/dts/armada-38x.dtsi         Sean Nyekjaer    2017-11-28  254  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  255  				uart0_pins: uart-pins-0 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  256  					marvell,pins = "mpp0", "mpp1";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  257  					marvell,function = "ua0";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  258  				};
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  259  
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  260  				uart1_pins: uart-pins-1 {
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  261  					marvell,pins = "mpp19", "mpp20";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  262  					marvell,function = "ua1";
91b4c91f919abf arch/arm/boot/dts/armada-38x.dtsi         Maxime Ripard    2015-01-08  263  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  264  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  265  				sdhci_pins: sdhci-pins {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  266  					marvell,pins = "mpp48", "mpp49", "mpp50",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  267  						       "mpp52", "mpp53", "mpp54",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  268  						       "mpp55", "mpp57", "mpp58",
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  269  						       "mpp59";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  270  					marvell,function = "sd0";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  271  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  272  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  273  				sata0_pins: sata-pins-0 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  274  					marvell,pins = "mpp20";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  275  					marvell,function = "sata0";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  276  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  277  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  278  				sata1_pins: sata-pins-1 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  279  					marvell,pins = "mpp19";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  280  					marvell,function = "sata1";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  281  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  282  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  283  				sata2_pins: sata-pins-2 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  284  					marvell,pins = "mpp47";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  285  					marvell,function = "sata2";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  286  				};
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  287  
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  288  				sata3_pins: sata-pins-3 {
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  289  					marvell,pins = "mpp44";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  290  					marvell,function = "sata3";
34598503049688 arch/arm/boot/dts/armada-38x.dtsi         Gregory CLEMENT  2015-01-08  291  				};
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  292  
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  293  				i2s_pins: i2s-pins {
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  294  					marvell,pins = "mpp48", "mpp49",
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  295  						       "mpp50", "mpp51",
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  296  						       "mpp52", "mpp53";
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  297  					marvell,function = "audio";
72ef30aa100a8d arch/arm/boot/dts/armada-38x.dtsi         Marcin Wojtas    2022-09-20  298  				};
424175c5b4b2dc arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-09-20  299  
424175c5b4b2dc arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-09-20  300  				spdif_pins: spdif-pins {
424175c5b4b2dc arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-09-20  301  					marvell,pins = "mpp51";
424175c5b4b2dc arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-09-20  302  					marvell,function = "audio";
424175c5b4b2dc arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-09-20  303  				};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  304  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  305  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  306  			gpio0: gpio@18100 {
75b58cf5ce2165 arch/arm/boot/dts/armada-38x.dtsi         Klaus Kudielka   2023-01-07  307  				compatible = "marvell,armada-370-gpio",
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  308  					     "marvell,orion-gpio";
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  309  				reg = <0x18100 0x40>, <0x181c0 0x08>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  310  				reg-names = "gpio", "pwm";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  311  				ngpios = <32>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  312  				gpio-controller;
467b43a944b3c7 arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-07-27  313  				gpio-ranges = <&pinctrl 0 0 32>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  314  				#gpio-cells = <2>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  315  				#pwm-cells = <2>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  316  				interrupt-controller;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  317  				#interrupt-cells = <2>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  318  				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  319  					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  320  					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  321  					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  322  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  323  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  324  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  325  			gpio1: gpio@18140 {
75b58cf5ce2165 arch/arm/boot/dts/armada-38x.dtsi         Klaus Kudielka   2023-01-07  326  				compatible = "marvell,armada-370-gpio",
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  327  					     "marvell,orion-gpio";
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  328  				reg = <0x18140 0x40>, <0x181c8 0x08>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  329  				reg-names = "gpio", "pwm";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  330  				ngpios = <28>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  331  				gpio-controller;
467b43a944b3c7 arch/arm/boot/dts/armada-38x.dtsi         Pali Rohár       2022-07-27  332  				gpio-ranges = <&pinctrl 0 32 28>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  333  				#gpio-cells = <2>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  334  				#pwm-cells = <2>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  335  				interrupt-controller;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  336  				#interrupt-cells = <2>;
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  337  				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  338  					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  339  					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
d11548e3113961 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-20  340  					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
7cb2acb3fbae5e arch/arm/boot/dts/armada-38x.dtsi         Ralph Sennhauser 2017-06-01  341  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  342  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  343  
a126de75c1b88d arch/arm/boot/dts/armada-38x.dtsi         Chris Packham    2017-02-01  344  			systemc: system-controller@18200 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  345  				compatible = "marvell,armada-380-system-controller",
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  346  					     "marvell,armada-370-xp-system-controller";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  347  				reg = <0x18200 0x100>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  348  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  349  
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  350  			gateclk: clock-gating-control@18220 {
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  351  				compatible = "marvell,armada-380-gating-clock";
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  352  				reg = <0x18220 0x4>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  353  				clocks = <&coreclk 0>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  354  				#clock-cells = <1>;
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  355  			};
0d3d96ab005907 arch/arm/boot/dts/armada-38x.dtsi         Thomas Petazzoni 2014-02-17  356  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  357  			comphy: phy@18300 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  358  				compatible = "marvell,armada-380-comphy";
09781ba0395c46 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2020-07-21  359  				reg-names = "comphy", "conf";
09781ba0395c46 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2020-07-21  360  				reg = <0x18300 0x100>, <0x18460 4>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  361  				#address-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  362  				#size-cells = <0>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  363  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  364  				comphy0: phy@0 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  365  					reg = <0>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  366  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  367  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  368  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  369  				comphy1: phy@1 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  370  					reg = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  371  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  372  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  373  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  374  				comphy2: phy@2 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  375  					reg = <2>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  376  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  377  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  378  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  379  				comphy3: phy@3 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  380  					reg = <3>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  381  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  382  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  383  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  384  				comphy4: phy@4 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  385  					reg = <4>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  386  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  387  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  388  
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  389  				comphy5: phy@5 {
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  390  					reg = <5>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  391  					#phy-cells = <1>;
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  392  				};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  393  			};
f3a6a9f3704aa9 arch/arm/boot/dts/armada-38x.dtsi         Russell King     2019-02-07  394  
8a091d07db911f arch/arm/boot/dts/marvell/armada-38x.dtsi Josua Mayer      2024-07-16 @395  			syscon0: system-controller@18400 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
