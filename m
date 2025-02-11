Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242B1F429C
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739272383; cv=none; b=Fl8zmn6FW8bXuphJfoVo0+0f8FYF748oCZxYKBQaKngREF/Zo/CbOxPXA0VcKJKLQdrigbgxUZN/BNSzgf2e7leSNOX2TEwg5XyIpfCZg9HTYtntQb/yfJqeNqWVNEpxt65rWF9QJ0K9zCdDlSfK2x9d9kKvy6/bEK86LQzwzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739272383; c=relaxed/simple;
	bh=39IqUlY99XmW6SDdTTcfNgVZlo5CVC4bRcBFyVYxzkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlSzvFnA0Dxk1vrzba2cZNPbdhSpZLgR/yNFs6dvdnYJmeNMRsiw4OMyBD1sBHTOqhoEldAriHT3zZEobRFG40a9XUMvL2oKhE6hfO+pa7rH/aPCyaI+xH546JLAAkdz/pyzLBcqRBj29Ku4ddqpLDeS/k2G+qWv2ybri+noSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7RThb4c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7RThb4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739272380; x=1770808380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39IqUlY99XmW6SDdTTcfNgVZlo5CVC4bRcBFyVYxzkU=;
  b=O7RThb4cyAYqqFPRzRuF5hCmwG1vIoLMjrz22s9dIc/vte2F9iqLUtb2
   vZ4F6dLoVriHooaRSAQxTATl3XfXeLsQ5hoo5M8kJd1vmhohJEiYHiPpF
   XAobwkFdv7KivYgSUoY95XHey4UJxsTtfxBhGYD8e8gsRuE+P9poB7NUH
   kEimQK5ty16hgAB+b6ijiP6luBOlpQJanaiumStpvTNcgnyMgAbdSGx81
   HBsNVcBkL5c2gEGKKezbMHMmEHyWBRMnwhAt5a4XXydkiyV5Rfs3SZZCh
   NZOeO6y+9OSX3PLWyj2XtrTls/IStMFmNP2SfR71GNu9t6C4QDY9Y51w9
   A==;
X-CSE-ConnectionGUID: 5Mz/p9JxQxSz5AycGO+EpA==
X-CSE-MsgGUID: 0o1KuSClSLOPgz3UaVJyLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51312809"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51312809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 03:12:59 -0800
X-CSE-ConnectionGUID: ardvj60aSsGarrxa4D3rVA==
X-CSE-MsgGUID: bIdE0GADSO+FEKuA//hBvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112960697"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 03:12:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thoCF-00145P-1T;
	Tue, 11 Feb 2025 11:12:55 +0000
Date: Tue, 11 Feb 2025 19:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 183/191]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502111938.XCCcGcVf-lkp@intel.com>
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
commit: 05b2ee2fa9cdb357177d906a8951e4ae24c1ee8b [183/191] fixup! arch: arm64: apple: t600x: Add display controller related device tree nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250211/202502111938.XCCcGcVf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111938.XCCcGcVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502111938.XCCcGcVf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:486.14-500.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:502.14-511.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t600x-common.dtsi:487.28-490.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:492.34-495.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:497.22-500.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:306.14-315.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:317.14-326.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:407.29-412.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:502.39-521.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:523.39-542.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:369.21-405.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@38bc00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:343.9-352.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:395.9-404.5: Warning (graph_child_address): /soc/dcp@38bc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:89.9-98.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-dieX.dtsi:163.9-172.5: Warning (graph_child_address): /soc/dcp@28cc00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +369 arch/arm64/boot/dts/apple/t600x-die0.dtsi

ea805ca512ebac Janne Grunau 2022-03-11 @369  	dcp: dcp@38bc00000 {
ea805ca512ebac Janne Grunau 2022-03-11  370  		compatible = "apple,t6000-dcp", "apple,dcp";
ea805ca512ebac Janne Grunau 2022-03-11  371  		mboxes = <&dcp_mbox>;
ea805ca512ebac Janne Grunau 2022-03-11  372  		mbox-names = "mbox";
ea805ca512ebac Janne Grunau 2022-03-11  373  		iommus = <&dcp_dart 0>;
ea805ca512ebac Janne Grunau 2022-03-11  374  
ea805ca512ebac Janne Grunau 2022-03-11  375  		reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
ea805ca512ebac Janne Grunau 2022-03-11  376  		reg = <0x3 0x8bc00000 0x0 0x4000>,
ea805ca512ebac Janne Grunau 2022-03-11  377  			<0x3 0x8a000000 0x0 0x3000000>,
ea805ca512ebac Janne Grunau 2022-03-11  378  			<0x3 0x8b320000 0x0 0x4000>,
ea805ca512ebac Janne Grunau 2022-03-11  379  			<0x3 0x8b344000 0x0 0x4000>,
ea805ca512ebac Janne Grunau 2022-03-11  380  			<0x3 0x8b800000 0x0 0x800000>;
ea805ca512ebac Janne Grunau 2022-03-11  381  		apple,bw-scratch = <&pmgr_dcp 0 4 0x988>;
ea805ca512ebac Janne Grunau 2022-03-11  382  		power-domains = <&ps_disp0_cpu0>;
24437db4ab9449 Janne Grunau 2023-01-09  383  		resets = <&ps_disp0_cpu0>;
ea805ca512ebac Janne Grunau 2022-03-11  384  		clocks = <&clk_disp0>;
ea805ca512ebac Janne Grunau 2022-03-11  385  		phandle = <&dcp>;
05b2ee2fa9cdb3 Janne Grunau 2025-02-09  386  		// required bus properties for 'piodma' subdevice
05b2ee2fa9cdb3 Janne Grunau 2025-02-09  387  		#address-cells = <2>;
05b2ee2fa9cdb3 Janne Grunau 2025-02-09  388  		#size-cells = <2>;
ea805ca512ebac Janne Grunau 2022-03-11  389  
ea805ca512ebac Janne Grunau 2022-03-11  390  		disp0_piodma: piodma {
ea805ca512ebac Janne Grunau 2022-03-11  391  			iommus = <&disp0_dart 4>;
ea805ca512ebac Janne Grunau 2022-03-11  392  			phandle = <&disp0_piodma>;
ea805ca512ebac Janne Grunau 2022-03-11  393  		};
d2b345b0dd2313 Janne Grunau 2023-11-19  394  
d2b345b0dd2313 Janne Grunau 2023-11-19  395  		ports {
d2b345b0dd2313 Janne Grunau 2023-11-19  396  			#address-cells = <1>;
d2b345b0dd2313 Janne Grunau 2023-11-19  397  			#size-cells = <0>;
d2b345b0dd2313 Janne Grunau 2023-11-19  398  			port@0 {
d2b345b0dd2313 Janne Grunau 2023-11-19  399  				reg = <0>;
d2b345b0dd2313 Janne Grunau 2023-11-19  400  				dcp_audio: endpoint {
d2b345b0dd2313 Janne Grunau 2023-11-19  401  					remote-endpoint = <&dpaudio0_dcp>;
d2b345b0dd2313 Janne Grunau 2023-11-19  402  				};
d2b345b0dd2313 Janne Grunau 2023-11-19  403  			};
d2b345b0dd2313 Janne Grunau 2023-11-19  404  		};
ea805ca512ebac Janne Grunau 2022-03-11  405  	};
ea805ca512ebac Janne Grunau 2022-03-11  406  
ea805ca512ebac Janne Grunau 2022-03-11 @407  	display: display-subsystem {

:::::: The code at line 369 was first introduced by commit
:::::: ea805ca512ebacc4d8777e5d2fcfdd2d279454d4 arch: arm64: apple: t600x: Add display controller related device tree nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
