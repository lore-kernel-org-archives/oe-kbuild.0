Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B44149DFF
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739334718; cv=none; b=H6SNV27dDyq2cvgJNZ2Gs/6TIcDZI/lM1SX7MCQ877Bv0wobm8HyOLEjUGoqJ8Up0DmZqP2cFHktN/Q7zE9GwjQttUKug84PbwQZhhWkiCbQp0qsVvGp71wTto2yN5YdzkKgyXaOS4/X1ris8xi9cjhXqFopYE47NvmWOLc3dOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739334718; c=relaxed/simple;
	bh=+lvuXan9KrDHpgBewZETmk2SDxaYg32IvzXvEPJIzvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JdvIS6x3xgZ7E2ppfhgfyZhaGqcTl06y2GbStFSyBKd05XYpzi9XUjAKtQXBegqbCwyrm5mUug4BfoWea6DnDLUZe7RguEICjHVvFbq1iJpsmcSaeXngb/X4eLDRBOA6HwHspx70bwok5EGnlTBLsUsv49gJQ8hmpWQSN/QDKQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLO+5RXp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLO+5RXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739334716; x=1770870716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+lvuXan9KrDHpgBewZETmk2SDxaYg32IvzXvEPJIzvY=;
  b=mLO+5RXpL6wn5JJxqMgXviz+LxVgPehQ+1hyz8xDwYUoq1p2jAWDpE0O
   noyn3dLyc+nLflATq8AY0HlH3sect/LlciKSkzIla3ZeyAH+mXSnDzfcz
   CI7491kEV9Z6r8qZdaixphTmynj6Gn345LSojFYXn5ndH4x4wqQTiLZ8z
   651n1lgA6ITqKY6zO5Po2rUr3TjvG9GYujwiYA7rioJGEK83ykngHUt2T
   eG3PEAF81/P6FmaiApC2aiTQ2M/Sx4QZKTn3g3kvc2yDar9dLe6SNnOZX
   2Ja9/QO+TM5zSP9LdTGlFnD7cswM3PqN4O4QGu5umQ9u8IWN+Bd2hmVvQ
   A==;
X-CSE-ConnectionGUID: dscFR5NfS0aScbmI8Z0GmQ==
X-CSE-MsgGUID: CPpLoIldSyC89IQHeRFPKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51406406"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51406406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 20:31:55 -0800
X-CSE-ConnectionGUID: +e8vGM7IRmauwrSQRrFRNw==
X-CSE-MsgGUID: 9JhiJUyeTjitBd/RgcqtUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="112666487"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Feb 2025 20:31:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti4Pf-00157D-1Y;
	Wed, 12 Feb 2025 04:31:51 +0000
Date: Wed, 12 Feb 2025 12:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 187/191]
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502121211.XPYKAmeS-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   058e9844046713928f5f78593e66e92da1b0c0c2
commit: 318dc5e7909d6f8a83a5c9183d4e388f7072b2fd [187/191] fixup! arm64: dts: apple: t600x: Add t6000 dispext device nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250212/202502121211.XPYKAmeS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121211.XPYKAmeS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502121211.XPYKAmeS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:505.39-524.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:526.39-545.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:166.9-175.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:505.39-524.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:526.39-545.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:166.9-175.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:505.39-524.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:526.39-545.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:166.9-175.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:505.39-524.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:526.39-545.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:166.9-175.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:505.39-524.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:526.39-545.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t600x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:166.9-175.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:514.9-523.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:535.9-544.5: Warning (graph_child_address): /soc/audio-controller@39b508000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +65 arch/arm64/boot/dts/apple/t600x-dieX.dtsi

98274d4a92ad02 Janne Grunau 2022-10-20 @65  	DIE_NODE(dcpext0):  dcp@289c00000 {

:::::: The code at line 65 was first introduced by commit
:::::: 98274d4a92ad02dc70b29589e20288d98d3c4b13 arm64: dts: apple: t600x: Add t6000 dispext device nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
