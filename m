Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C727181A
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 23:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318192; cv=none; b=SWGtnAu0sRXCUJtY/C62PfyvVMQzfg5/GedOANUeVxXEqBx+1w9BbgFTlkRoBf1nJpJ/M7pwdY2O1U3MSZVO6gNcuSS9ozwdI6Y0ETxIlNA2rPSVWwAWIF83dYWJf6cH+d9E42K8bWR7tuyhYYRMWjWuiXT5DBVacLS+5dtLEvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318192; c=relaxed/simple;
	bh=BGKlFzwniiV/Doyxbk0Y4EN3lXl2xPei7TEwzmsxQnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbjM8YdI596VnhbUcuzdgPJk2v5oqpgb5KVq/JoMbPIKIerA8qw5+3i7g65QAgHpHqmT+h9/EkGLghIf+dc8d7/yfT0KZW9KdSFWBu78YGNINPSwpU/ofON9jTnKHiNSyYw75M4krqCAr0mZsHbqeUbZxEE5rNbzPItVdTRBru8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACITb+oS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACITb+oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739318187; x=1770854187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BGKlFzwniiV/Doyxbk0Y4EN3lXl2xPei7TEwzmsxQnY=;
  b=ACITb+oSJelVcfuzo1u97+GYqc3vwfLUhckRwJ6fQ3xqa5HzmhFXTpZr
   4L9CbkqhCBmK/a4BtVupbKbVlRx/pZy+PaJVcWgkv+oIj8gxiwpadpxIk
   5zKgbsopatJ4rioL0RvF3Co0zC1fcy6WRIoiv+KLQ2xMBlqnjQckuuNQG
   ahY3Usl2YDfWQLcqr70I0pO2qQu9A7iP6uDRzxEX10hrYhhh9z3iSWNeU
   VPSDXJq/rZCtImtFlTtMLGX1hmbQbXvTh8MH3tIVNW7SJr1C2NDIuZJFO
   q6dVqVdMNgJVjSLwCOt4pYdZcN50ZHoyjTgtY0ebFcL1oY5mZrrzaQs7D
   Q==;
X-CSE-ConnectionGUID: 1dxqGGbFTvavTYlBCqjBcw==
X-CSE-MsgGUID: 8E8m6m/mRfq2q63bVMxmag==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39876516"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39876516"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 15:56:24 -0800
X-CSE-ConnectionGUID: j+oZjDtkT+KLXQ391EiaoA==
X-CSE-MsgGUID: oajfk29VQiqvFg6VerOTjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113135490"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Feb 2025 15:56:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti071-0014qr-20;
	Tue, 11 Feb 2025 23:56:19 +0000
Date: Wed, 12 Feb 2025 07:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 186/191]
 arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502120701.eE0QJxvk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   058e9844046713928f5f78593e66e92da1b0c0c2
commit: 7b42205ea9f196bc66c22a006067fa2511e49f34 [186/191] fixup! arm64: dts: apple: t8103: Add dcpext/dispext0 nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250212/202502120701.eE0QJxvk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120701.eE0QJxvk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502120701.eE0QJxvk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j274.dts:119.14-128.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:130.14-139.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:647.30-653.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:606.22-645.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1133.43-1136.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:635.10-644.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:914.10-923.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:935.10-944.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1480.10-1489.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: aliases: 'disp0_piodma' does not match any of the regexes: '^[a-z][a-z0-9\\-]*$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j293.dts:218.14-228.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:230.14-239.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:647.30-653.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:606.22-645.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1133.43-1136.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:635.10-644.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:914.10-923.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:935.10-944.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1480.10-1489.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j313.dts:151.14-160.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:162.14-171.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:647.30-653.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:606.22-645.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1133.43-1136.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:635.10-644.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:914.10-923.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:935.10-944.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1480.10-1489.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   panel: size (25) error for type phandle
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j456.dts:127.14-136.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:647.30-653.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:606.22-645.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1133.43-1136.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:635.10-644.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:914.10-923.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:935.10-944.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1480.10-1489.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t8103.dtsi:442.28-445.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:447.34-450.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:452.22-455.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j457.dts:100.14-109.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:647.30-653.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:606.22-645.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@231c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:1450.25-1490.5: Warning (avoid_unnecessary_addr_size): /soc/dcp@271c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1133.43-1136.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t8103.dtsi:635.10-644.6: Warning (graph_child_address): /soc/dcp@231c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:914.10-923.6: Warning (graph_child_address): /soc/audio-controller@238330000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:935.10-944.6: Warning (graph_child_address): /soc/audio-controller@238334000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:1480.10-1489.6: Warning (graph_child_address): /soc/dcp@271c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +1450 arch/arm64/boot/dts/apple/t8103.dtsi

7d2d16ccf15d8e Hector Martin     2021-02-04    16  
7d2d16ccf15d8e Hector Martin     2021-02-04    17  / {
7d2d16ccf15d8e Hector Martin     2021-02-04    18  	compatible = "apple,t8103", "apple,arm-platform";
7d2d16ccf15d8e Hector Martin     2021-02-04    19  
7d2d16ccf15d8e Hector Martin     2021-02-04    20  	#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    21  	#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    22  
b07d5464cdbef9 Asahi Lina        2022-10-22    23  	aliases {
b07d5464cdbef9 Asahi Lina        2022-10-22    24  		gpu = &gpu;
b07d5464cdbef9 Asahi Lina        2022-10-22    25  	};
b07d5464cdbef9 Asahi Lina        2022-10-22    26  
7d2d16ccf15d8e Hector Martin     2021-02-04    27  	cpus {
7d2d16ccf15d8e Hector Martin     2021-02-04    28  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    29  		#size-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04    30  
3e895a6460ec38 Hector Martin     2022-05-03    31  		cpu-map {
3e895a6460ec38 Hector Martin     2022-05-03    32  			cluster0 {
3e895a6460ec38 Hector Martin     2022-05-03    33  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03    34  					cpu = <&cpu_e0>;
3e895a6460ec38 Hector Martin     2022-05-03    35  				};
3e895a6460ec38 Hector Martin     2022-05-03    36  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03    37  					cpu = <&cpu_e1>;
3e895a6460ec38 Hector Martin     2022-05-03    38  				};
3e895a6460ec38 Hector Martin     2022-05-03    39  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03    40  					cpu = <&cpu_e2>;
3e895a6460ec38 Hector Martin     2022-05-03    41  				};
3e895a6460ec38 Hector Martin     2022-05-03    42  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03    43  					cpu = <&cpu_e3>;
3e895a6460ec38 Hector Martin     2022-05-03    44  				};
3e895a6460ec38 Hector Martin     2022-05-03    45  			};
3e895a6460ec38 Hector Martin     2022-05-03    46  
3e895a6460ec38 Hector Martin     2022-05-03    47  			cluster1 {
3e895a6460ec38 Hector Martin     2022-05-03    48  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03    49  					cpu = <&cpu_p0>;
3e895a6460ec38 Hector Martin     2022-05-03    50  				};
3e895a6460ec38 Hector Martin     2022-05-03    51  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03    52  					cpu = <&cpu_p1>;
3e895a6460ec38 Hector Martin     2022-05-03    53  				};
3e895a6460ec38 Hector Martin     2022-05-03    54  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03    55  					cpu = <&cpu_p2>;
3e895a6460ec38 Hector Martin     2022-05-03    56  				};
3e895a6460ec38 Hector Martin     2022-05-03    57  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03    58  					cpu = <&cpu_p3>;
3e895a6460ec38 Hector Martin     2022-05-03    59  				};
3e895a6460ec38 Hector Martin     2022-05-03    60  			};
3e895a6460ec38 Hector Martin     2022-05-03    61  		};
3e895a6460ec38 Hector Martin     2022-05-03    62  
3e895a6460ec38 Hector Martin     2022-05-03    63  		cpu_e0: cpu@0 {
7d2d16ccf15d8e Hector Martin     2021-02-04    64  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    65  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    66  			reg = <0x0 0x0>;
7d2d16ccf15d8e Hector Martin     2021-02-04    67  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    68  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    69  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    70  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    71  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    72  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    73  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    74  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04    75  		};
7d2d16ccf15d8e Hector Martin     2021-02-04    76  
3e895a6460ec38 Hector Martin     2022-05-03    77  		cpu_e1: cpu@1 {
7d2d16ccf15d8e Hector Martin     2021-02-04    78  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    79  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    80  			reg = <0x0 0x1>;
7d2d16ccf15d8e Hector Martin     2021-02-04    81  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    82  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    83  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    84  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    85  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    86  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    87  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06    88  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04    89  		};
7d2d16ccf15d8e Hector Martin     2021-02-04    90  
3e895a6460ec38 Hector Martin     2022-05-03    91  		cpu_e2: cpu@2 {
7d2d16ccf15d8e Hector Martin     2021-02-04    92  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04    93  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04    94  			reg = <0x0 0x2>;
7d2d16ccf15d8e Hector Martin     2021-02-04    95  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04    96  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03    97  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03    98  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03    99  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   100  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   101  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   102  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   103  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   104  
3e895a6460ec38 Hector Martin     2022-05-03   105  		cpu_e3: cpu@3 {
7d2d16ccf15d8e Hector Martin     2021-02-04   106  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   107  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   108  			reg = <0x0 0x3>;
7d2d16ccf15d8e Hector Martin     2021-02-04   109  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   110  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   111  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   112  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03   113  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   114  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   115  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   116  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   117  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   118  
3e895a6460ec38 Hector Martin     2022-05-03   119  		cpu_p0: cpu@10100 {
7d2d16ccf15d8e Hector Martin     2021-02-04   120  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   121  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   122  			reg = <0x0 0x10100>;
7d2d16ccf15d8e Hector Martin     2021-02-04   123  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   124  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   125  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   126  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   127  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   128  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   129  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   130  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   131  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   132  
3e895a6460ec38 Hector Martin     2022-05-03   133  		cpu_p1: cpu@10101 {
7d2d16ccf15d8e Hector Martin     2021-02-04   134  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   135  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   136  			reg = <0x0 0x10101>;
7d2d16ccf15d8e Hector Martin     2021-02-04   137  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   138  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   139  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   140  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   141  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   142  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   143  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   144  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   145  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   146  
3e895a6460ec38 Hector Martin     2022-05-03   147  		cpu_p2: cpu@10102 {
7d2d16ccf15d8e Hector Martin     2021-02-04   148  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   149  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   150  			reg = <0x0 0x10102>;
7d2d16ccf15d8e Hector Martin     2021-02-04   151  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   152  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   153  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   154  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   155  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   156  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   157  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   158  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   159  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   160  
3e895a6460ec38 Hector Martin     2022-05-03   161  		cpu_p3: cpu@10103 {
7d2d16ccf15d8e Hector Martin     2021-02-04   162  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   163  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   164  			reg = <0x0 0x10103>;
7d2d16ccf15d8e Hector Martin     2021-02-04   165  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   166  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   167  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   168  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03   169  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   170  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   171  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   172  			d-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   173  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06   174  
9ecb7a4b8ac67c Janne Grunau      2022-12-06   175  		l2_cache_0: l2-cache-0 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06   176  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06   177  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   178  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   179  			cache-size = <0x400000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   180  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06   181  
9ecb7a4b8ac67c Janne Grunau      2022-12-06   182  		l2_cache_1: l2-cache-1 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06   183  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06   184  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   185  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   186  			cache-size = <0xc00000>;
3e895a6460ec38 Hector Martin     2022-05-03   187  		};
3e895a6460ec38 Hector Martin     2022-05-03   188  	};
3e895a6460ec38 Hector Martin     2022-05-03   189  
3e895a6460ec38 Hector Martin     2022-05-03   190  	ecluster_opp: opp-table-0 {
3e895a6460ec38 Hector Martin     2022-05-03   191  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03   192  
3e895a6460ec38 Hector Martin     2022-05-03   193  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03   194  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03   195  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03   196  			clock-latency-ns = <7500>;
86a2d5f1f97151 James Calligeros  2023-11-06   197  			opp-microwatt = <47296>;
7d2d16ccf15d8e Hector Martin     2021-02-04   198  		};
3e895a6460ec38 Hector Martin     2022-05-03   199  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03   200  			opp-hz = /bits/ 64 <972000000>;
3e895a6460ec38 Hector Martin     2022-05-03   201  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03   202  			clock-latency-ns = <22000>;
86a2d5f1f97151 James Calligeros  2023-11-06   203  			opp-microwatt = <99715>;
3e895a6460ec38 Hector Martin     2022-05-03   204  		};
3e895a6460ec38 Hector Martin     2022-05-03   205  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03   206  			opp-hz = /bits/ 64 <1332000000>;
3e895a6460ec38 Hector Martin     2022-05-03   207  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03   208  			clock-latency-ns = <27000>;
86a2d5f1f97151 James Calligeros  2023-11-06   209  			opp-microwatt = <188860>;
3e895a6460ec38 Hector Martin     2022-05-03   210  		};
3e895a6460ec38 Hector Martin     2022-05-03   211  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03   212  			opp-hz = /bits/ 64 <1704000000>;
3e895a6460ec38 Hector Martin     2022-05-03   213  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03   214  			clock-latency-ns = <33000>;
86a2d5f1f97151 James Calligeros  2023-11-06   215  			opp-microwatt = <288891>;
3e895a6460ec38 Hector Martin     2022-05-03   216  		};
3e895a6460ec38 Hector Martin     2022-05-03   217  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03   218  			opp-hz = /bits/ 64 <2064000000>;
3e895a6460ec38 Hector Martin     2022-05-03   219  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03   220  			clock-latency-ns = <50000>;
86a2d5f1f97151 James Calligeros  2023-11-06   221  			opp-microwatt = <412979>;
3e895a6460ec38 Hector Martin     2022-05-03   222  		};
3e895a6460ec38 Hector Martin     2022-05-03   223  	};
3e895a6460ec38 Hector Martin     2022-05-03   224  
3e895a6460ec38 Hector Martin     2022-05-03   225  	pcluster_opp: opp-table-1 {
3e895a6460ec38 Hector Martin     2022-05-03   226  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03   227  
3e895a6460ec38 Hector Martin     2022-05-03   228  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03   229  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03   230  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03   231  			clock-latency-ns = <8000>;
86a2d5f1f97151 James Calligeros  2023-11-06   232  			opp-microwatt = <290230>;
3e895a6460ec38 Hector Martin     2022-05-03   233  		};
3e895a6460ec38 Hector Martin     2022-05-03   234  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03   235  			opp-hz = /bits/ 64 <828000000>;
3e895a6460ec38 Hector Martin     2022-05-03   236  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03   237  			clock-latency-ns = <19000>;
86a2d5f1f97151 James Calligeros  2023-11-06   238  			opp-microwatt = <449013>;
3e895a6460ec38 Hector Martin     2022-05-03   239  		};
3e895a6460ec38 Hector Martin     2022-05-03   240  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03   241  			opp-hz = /bits/ 64 <1056000000>;
3e895a6460ec38 Hector Martin     2022-05-03   242  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03   243  			clock-latency-ns = <21000>;
86a2d5f1f97151 James Calligeros  2023-11-06   244  			opp-microwatt = <647097>;
3e895a6460ec38 Hector Martin     2022-05-03   245  		};
3e895a6460ec38 Hector Martin     2022-05-03   246  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03   247  			opp-hz = /bits/ 64 <1284000000>;
3e895a6460ec38 Hector Martin     2022-05-03   248  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03   249  			clock-latency-ns = <23000>;
86a2d5f1f97151 James Calligeros  2023-11-06   250  			opp-microwatt = <865620>;
3e895a6460ec38 Hector Martin     2022-05-03   251  		};
3e895a6460ec38 Hector Martin     2022-05-03   252  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03   253  			opp-hz = /bits/ 64 <1500000000>;
3e895a6460ec38 Hector Martin     2022-05-03   254  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03   255  			clock-latency-ns = <24000>;
86a2d5f1f97151 James Calligeros  2023-11-06   256  			opp-microwatt = <1112838>;
3e895a6460ec38 Hector Martin     2022-05-03   257  		};
3e895a6460ec38 Hector Martin     2022-05-03   258  		opp06 {
3e895a6460ec38 Hector Martin     2022-05-03   259  			opp-hz = /bits/ 64 <1728000000>;
3e895a6460ec38 Hector Martin     2022-05-03   260  			opp-level = <6>;
3e895a6460ec38 Hector Martin     2022-05-03   261  			clock-latency-ns = <29000>;
86a2d5f1f97151 James Calligeros  2023-11-06   262  			opp-microwatt = <1453271>;
3e895a6460ec38 Hector Martin     2022-05-03   263  		};
3e895a6460ec38 Hector Martin     2022-05-03   264  		opp07 {
3e895a6460ec38 Hector Martin     2022-05-03   265  			opp-hz = /bits/ 64 <1956000000>;
3e895a6460ec38 Hector Martin     2022-05-03   266  			opp-level = <7>;
3e895a6460ec38 Hector Martin     2022-05-03   267  			clock-latency-ns = <31000>;
86a2d5f1f97151 James Calligeros  2023-11-06   268  			opp-microwatt = <1776667>;
3e895a6460ec38 Hector Martin     2022-05-03   269  		};
3e895a6460ec38 Hector Martin     2022-05-03   270  		opp08 {
3e895a6460ec38 Hector Martin     2022-05-03   271  			opp-hz = /bits/ 64 <2184000000>;
3e895a6460ec38 Hector Martin     2022-05-03   272  			opp-level = <8>;
3e895a6460ec38 Hector Martin     2022-05-03   273  			clock-latency-ns = <34000>;
86a2d5f1f97151 James Calligeros  2023-11-06   274  			opp-microwatt = <2366690>;
3e895a6460ec38 Hector Martin     2022-05-03   275  		};
3e895a6460ec38 Hector Martin     2022-05-03   276  		opp09 {
3e895a6460ec38 Hector Martin     2022-05-03   277  			opp-hz = /bits/ 64 <2388000000>;
3e895a6460ec38 Hector Martin     2022-05-03   278  			opp-level = <9>;
3e895a6460ec38 Hector Martin     2022-05-03   279  			clock-latency-ns = <36000>;
86a2d5f1f97151 James Calligeros  2023-11-06   280  			opp-microwatt = <2892193>;
3e895a6460ec38 Hector Martin     2022-05-03   281  		};
3e895a6460ec38 Hector Martin     2022-05-03   282  		opp10 {
3e895a6460ec38 Hector Martin     2022-05-03   283  			opp-hz = /bits/ 64 <2592000000>;
3e895a6460ec38 Hector Martin     2022-05-03   284  			opp-level = <10>;
3e895a6460ec38 Hector Martin     2022-05-03   285  			clock-latency-ns = <51000>;
86a2d5f1f97151 James Calligeros  2023-11-06   286  			opp-microwatt = <3475417>;
3e895a6460ec38 Hector Martin     2022-05-03   287  		};
3e895a6460ec38 Hector Martin     2022-05-03   288  		opp11 {
3e895a6460ec38 Hector Martin     2022-05-03   289  			opp-hz = /bits/ 64 <2772000000>;
3e895a6460ec38 Hector Martin     2022-05-03   290  			opp-level = <11>;
3e895a6460ec38 Hector Martin     2022-05-03   291  			clock-latency-ns = <54000>;
86a2d5f1f97151 James Calligeros  2023-11-06   292  			opp-microwatt = <3959410>;
3e895a6460ec38 Hector Martin     2022-05-03   293  		};
3e895a6460ec38 Hector Martin     2022-05-03   294  		opp12 {
3e895a6460ec38 Hector Martin     2022-05-03   295  			opp-hz = /bits/ 64 <2988000000>;
3e895a6460ec38 Hector Martin     2022-05-03   296  			opp-level = <12>;
3e895a6460ec38 Hector Martin     2022-05-03   297  			clock-latency-ns = <55000>;
86a2d5f1f97151 James Calligeros  2023-11-06   298  			opp-microwatt = <4540620>;
3e895a6460ec38 Hector Martin     2022-05-03   299  		};
3e895a6460ec38 Hector Martin     2022-05-03   300  		/* Not available until CPU deep sleep is implemented */
3e895a6460ec38 Hector Martin     2022-05-03   301  		opp13 {
3e895a6460ec38 Hector Martin     2022-05-03   302  			opp-hz = /bits/ 64 <3096000000>;
3e895a6460ec38 Hector Martin     2022-05-03   303  			opp-level = <13>;
3e895a6460ec38 Hector Martin     2022-05-03   304  			clock-latency-ns = <55000>;
86a2d5f1f97151 James Calligeros  2023-11-06   305  			opp-microwatt = <4745031>;
3e895a6460ec38 Hector Martin     2022-05-03   306  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   307  		};
3e895a6460ec38 Hector Martin     2022-05-03   308  		opp14 {
3e895a6460ec38 Hector Martin     2022-05-03   309  			opp-hz = /bits/ 64 <3144000000>;
3e895a6460ec38 Hector Martin     2022-05-03   310  			opp-level = <14>;
3e895a6460ec38 Hector Martin     2022-05-03   311  			clock-latency-ns = <56000>;
86a2d5f1f97151 James Calligeros  2023-11-06   312  			opp-microwatt = <4822390>;
3e895a6460ec38 Hector Martin     2022-05-03   313  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   314  		};
3e895a6460ec38 Hector Martin     2022-05-03   315  		opp15 {
3e895a6460ec38 Hector Martin     2022-05-03   316  			opp-hz = /bits/ 64 <3204000000>;
3e895a6460ec38 Hector Martin     2022-05-03   317  			opp-level = <15>;
3e895a6460ec38 Hector Martin     2022-05-03   318  			clock-latency-ns = <56000>;
86a2d5f1f97151 James Calligeros  2023-11-06   319  			opp-microwatt = <4951324>;
3e895a6460ec38 Hector Martin     2022-05-03   320  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03   321  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   322  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   323  
b07d5464cdbef9 Asahi Lina        2022-10-22   324  	gpu_opp: opp-table-gpu {
b07d5464cdbef9 Asahi Lina        2022-10-22   325  		compatible = "operating-points-v2";
b07d5464cdbef9 Asahi Lina        2022-10-22   326  
b07d5464cdbef9 Asahi Lina        2022-10-22   327  		/*
b07d5464cdbef9 Asahi Lina        2022-10-22   328  		 * NOTE: The voltage and power values are device-specific and
b07d5464cdbef9 Asahi Lina        2022-10-22   329  		 * must be filled in by the bootloader.
b07d5464cdbef9 Asahi Lina        2022-10-22   330  		 */
b07d5464cdbef9 Asahi Lina        2022-10-22   331  		opp00 {
b07d5464cdbef9 Asahi Lina        2022-10-22   332  			opp-hz = /bits/ 64 <0>;
b07d5464cdbef9 Asahi Lina        2022-10-22   333  			opp-microvolt = <400000>;
b99405236eb112 Asahi Lina        2022-11-02   334  			opp-microwatt = <0>;
b07d5464cdbef9 Asahi Lina        2022-10-22   335  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   336  		opp01 {
b07d5464cdbef9 Asahi Lina        2022-10-22   337  			opp-hz = /bits/ 64 <396000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   338  			opp-microvolt = <603000>;
b99405236eb112 Asahi Lina        2022-11-02   339  			opp-microwatt = <3714690>;
b07d5464cdbef9 Asahi Lina        2022-10-22   340  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   341  		opp02 {
b07d5464cdbef9 Asahi Lina        2022-10-22   342  			opp-hz = /bits/ 64 <528000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   343  			opp-microvolt = <640000>;
b99405236eb112 Asahi Lina        2022-11-02   344  			opp-microwatt = <5083260>;
b07d5464cdbef9 Asahi Lina        2022-10-22   345  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   346  		opp03 {
b07d5464cdbef9 Asahi Lina        2022-10-22   347  			opp-hz = /bits/ 64 <720000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   348  			opp-microvolt = <690000>;
b99405236eb112 Asahi Lina        2022-11-02   349  			opp-microwatt = <7429380>;
b07d5464cdbef9 Asahi Lina        2022-10-22   350  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   351  		opp04 {
b07d5464cdbef9 Asahi Lina        2022-10-22   352  			opp-hz = /bits/ 64 <924000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   353  			opp-microvolt = <784000>;
b99405236eb112 Asahi Lina        2022-11-02   354  			opp-microwatt = <11730600>;
b07d5464cdbef9 Asahi Lina        2022-10-22   355  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   356  		opp05 {
b07d5464cdbef9 Asahi Lina        2022-10-22   357  			opp-hz = /bits/ 64 <1128000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   358  			opp-microvolt = <862000>;
b99405236eb112 Asahi Lina        2022-11-02   359  			opp-microwatt = <17009370>;
b07d5464cdbef9 Asahi Lina        2022-10-22   360  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   361  		opp06 {
b07d5464cdbef9 Asahi Lina        2022-10-22   362  			opp-hz = /bits/ 64 <1278000000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   363  			opp-microvolt = <931000>;
b99405236eb112 Asahi Lina        2022-11-02   364  			opp-microwatt = <19551000>;
b07d5464cdbef9 Asahi Lina        2022-10-22   365  		};
b07d5464cdbef9 Asahi Lina        2022-10-22   366  	};
b07d5464cdbef9 Asahi Lina        2022-10-22   367  
7d2d16ccf15d8e Hector Martin     2021-02-04   368  	timer {
7d2d16ccf15d8e Hector Martin     2021-02-04   369  		compatible = "arm,armv8-timer";
7d2d16ccf15d8e Hector Martin     2021-02-04   370  		interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04   371  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
7d2d16ccf15d8e Hector Martin     2021-02-04   372  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   373  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   374  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04   375  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04   376  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   377  
0f522efcd79634 Marc Zyngier      2021-11-02   378  	pmu-e {
0f522efcd79634 Marc Zyngier      2021-11-02   379  		compatible = "apple,icestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02   380  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02   381  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02   382  	};
0f522efcd79634 Marc Zyngier      2021-11-02   383  
0f522efcd79634 Marc Zyngier      2021-11-02   384  	pmu-p {
0f522efcd79634 Marc Zyngier      2021-11-02   385  		compatible = "apple,firestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02   386  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02   387  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02   388  	};
0f522efcd79634 Marc Zyngier      2021-11-02   389  
57337b25244212 Hector Martin     2021-10-05   390  	clkref: clock-ref {
7d2d16ccf15d8e Hector Martin     2021-02-04   391  		compatible = "fixed-clock";
7d2d16ccf15d8e Hector Martin     2021-02-04   392  		#clock-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   393  		clock-frequency = <24000000>;
57337b25244212 Hector Martin     2021-10-05   394  		clock-output-names = "clkref";
7d2d16ccf15d8e Hector Martin     2021-02-04   395  	};
7d2d16ccf15d8e Hector Martin     2021-02-04   396  
9ba99beb5e1ff4 Janne Grunau      2024-11-01   397  	clk_120m: clock-120m {
9ba99beb5e1ff4 Janne Grunau      2024-11-01   398  		compatible = "fixed-clock";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   399  		#clock-cells = <0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   400  		clock-frequency = <120000000>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   401  		clock-output-names = "clk_120m";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   402  	};
9ba99beb5e1ff4 Janne Grunau      2024-11-01   403  
9ba99beb5e1ff4 Janne Grunau      2024-11-01   404  	clk_200m: clock-200m {
9ba99beb5e1ff4 Janne Grunau      2024-11-01   405  		compatible = "fixed-clock";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   406  		#clock-cells = <0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   407  		clock-frequency = <200000000>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   408  		clock-output-names = "clk_200m";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   409  	};
9ba99beb5e1ff4 Janne Grunau      2024-11-01   410  
bb55263c1dd9f6 Hector Martin     2021-09-20   411  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
bb55263c1dd9f6 Hector Martin     2021-09-20   412  	clk_disp0: clock-disp0 {
bb55263c1dd9f6 Hector Martin     2021-09-20   413  		compatible = "fixed-clock";
bb55263c1dd9f6 Hector Martin     2021-09-20   414  		#clock-cells = <0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   415  		clock-frequency = <533333328>;
bb55263c1dd9f6 Hector Martin     2021-09-20   416  		clock-output-names = "clk_disp0";
bb55263c1dd9f6 Hector Martin     2021-09-20   417  	};
bb55263c1dd9f6 Hector Martin     2021-09-20   418  
0ec238bb9b4d88 Janne Grunau      2022-09-30   419  	/* Pixel clock? frequency in Hz (compare: 4K@60 VGA clock 533.250 MHz) */
0ec238bb9b4d88 Janne Grunau      2022-09-30   420  	clk_dispext0: clock-dispext0 {
0ec238bb9b4d88 Janne Grunau      2022-09-30   421  		compatible = "fixed-clock";
0ec238bb9b4d88 Janne Grunau      2022-09-30   422  		#clock-cells = <0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30   423  		clock-frequency = <0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30   424  		clock-output-names = "clk_dispext0";
0ec238bb9b4d88 Janne Grunau      2022-09-30   425  	};
0ec238bb9b4d88 Janne Grunau      2022-09-30   426  
8a3df85ad87d2e Martin Povišer    2022-09-16   427  	/*
8a3df85ad87d2e Martin Povišer    2022-09-16   428  	 * This is a fabulated representation of the input clock
8a3df85ad87d2e Martin Povišer    2022-09-16   429  	 * to NCO since we don't know the true clock tree.
8a3df85ad87d2e Martin Povišer    2022-09-16   430  	 */
8a3df85ad87d2e Martin Povišer    2022-09-16   431  	nco_clkref: clock-ref-nco {
8a3df85ad87d2e Martin Povišer    2022-09-16   432  		compatible = "fixed-clock";
8a3df85ad87d2e Martin Povišer    2022-09-16   433  		#clock-cells = <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16   434  		clock-output-names = "nco_ref";
8a3df85ad87d2e Martin Povišer    2022-09-16   435  	};
8a3df85ad87d2e Martin Povišer    2022-09-16   436  
68af00ba18f806 Asahi Lina        2022-08-18   437  	reserved-memory {
68af00ba18f806 Asahi Lina        2022-08-18   438  		#address-cells = <2>;
68af00ba18f806 Asahi Lina        2022-08-18   439  		#size-cells = <2>;
68af00ba18f806 Asahi Lina        2022-08-18   440  		ranges;
68af00ba18f806 Asahi Lina        2022-08-18   441  
68af00ba18f806 Asahi Lina        2022-08-18   442  		uat_handoff: uat-handoff {
68af00ba18f806 Asahi Lina        2022-08-18   443  			reg = <0 0 0 0>;
68af00ba18f806 Asahi Lina        2022-08-18   444  			no-map;
68af00ba18f806 Asahi Lina        2022-08-18   445  		};
68af00ba18f806 Asahi Lina        2022-08-18   446  
68af00ba18f806 Asahi Lina        2022-08-18   447  		uat_pagetables: uat-pagetables {
68af00ba18f806 Asahi Lina        2022-08-18   448  			reg = <0 0 0 0>;
68af00ba18f806 Asahi Lina        2022-08-18   449  			no-map;
68af00ba18f806 Asahi Lina        2022-08-18   450  		};
68af00ba18f806 Asahi Lina        2022-08-18   451  
68af00ba18f806 Asahi Lina        2022-08-18   452  		uat_ttbs: uat-ttbs {
68af00ba18f806 Asahi Lina        2022-08-18   453  			reg = <0 0 0 0>;
68af00ba18f806 Asahi Lina        2022-08-18   454  			no-map;
68af00ba18f806 Asahi Lina        2022-08-18   455  		};
68af00ba18f806 Asahi Lina        2022-08-18   456  	};
68af00ba18f806 Asahi Lina        2022-08-18   457  
7d2d16ccf15d8e Hector Martin     2021-02-04   458  	soc {
7d2d16ccf15d8e Hector Martin     2021-02-04   459  		compatible = "simple-bus";
7d2d16ccf15d8e Hector Martin     2021-02-04   460  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   461  		#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   462  
7d2d16ccf15d8e Hector Martin     2021-02-04   463  		ranges;
7d2d16ccf15d8e Hector Martin     2021-02-04   464  		nonposted-mmio;
fed55afe76a709 Hector Martin     2023-04-11   465  		/* Required to get >32-bit DMA via DARTs */
fed55afe76a709 Hector Martin     2023-04-11   466  		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   467  
b07d5464cdbef9 Asahi Lina        2022-10-22   468  		gpu: gpu@206400000 {
68af00ba18f806 Asahi Lina        2022-08-18   469  			compatible = "apple,agx-t8103", "apple,agx-g13g";
68af00ba18f806 Asahi Lina        2022-08-18   470  			reg = <0x2 0x6400000 0 0x40000>,
68af00ba18f806 Asahi Lina        2022-08-18   471  				<0x2 0x4000000 0 0x1000000>;
68af00ba18f806 Asahi Lina        2022-08-18   472  			reg-names = "asc", "sgx";
68af00ba18f806 Asahi Lina        2022-08-18   473  			interrupt-parent = <&aic>;
68af00ba18f806 Asahi Lina        2022-08-18   474  			interrupts = <AIC_IRQ 563 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   475  				<AIC_IRQ 564 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   476  				<AIC_IRQ 565 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   477  				<AIC_IRQ 566 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   478  				<AIC_IRQ 579 IRQ_TYPE_LEVEL_HIGH>;
68af00ba18f806 Asahi Lina        2022-08-18   479  			mboxes = <&agx_mbox>;
68af00ba18f806 Asahi Lina        2022-08-18   480  			power-domains = <&ps_gfx>;
68af00ba18f806 Asahi Lina        2022-08-18   481  			memory-region = <&uat_ttbs>, <&uat_pagetables>, <&uat_handoff>;
68af00ba18f806 Asahi Lina        2022-08-18   482  			memory-region-names = "ttbs", "pagetables", "handoff";
b07d5464cdbef9 Asahi Lina        2022-10-22   483  
95dd1a9b126ca2 Asahi Lina        2022-11-25   484  			apple,firmware-version = <12 3 0>;
95dd1a9b126ca2 Asahi Lina        2022-11-25   485  			apple,firmware-compat = <12 3 0>;
95dd1a9b126ca2 Asahi Lina        2022-11-25   486  
b07d5464cdbef9 Asahi Lina        2022-10-22   487  			operating-points-v2 = <&gpu_opp>;
b99405236eb112 Asahi Lina        2022-11-02   488  			apple,perf-base-pstate = <1>;
b99405236eb112 Asahi Lina        2022-11-02   489  			apple,min-sram-microvolt = <850000>;
b99405236eb112 Asahi Lina        2022-11-02   490  			apple,avg-power-filter-tc-ms = <1000>;
b99405236eb112 Asahi Lina        2022-11-02   491  			apple,avg-power-ki-only = <7.5>;
b99405236eb112 Asahi Lina        2022-11-02   492  			apple,avg-power-kp = <4.0>;
b99405236eb112 Asahi Lina        2022-11-02   493  			apple,avg-power-min-duty-cycle = <40>;
b99405236eb112 Asahi Lina        2022-11-02   494  			apple,avg-power-target-filter-tc = <125>;
b99405236eb112 Asahi Lina        2022-11-02   495  			apple,fast-die0-integral-gain = <200.0>;
b99405236eb112 Asahi Lina        2022-11-02   496  			apple,fast-die0-proportional-gain = <5.0>;
b99405236eb112 Asahi Lina        2022-11-02   497  			apple,perf-filter-drop-threshold = <0>;
b99405236eb112 Asahi Lina        2022-11-02   498  			apple,perf-filter-time-constant = <5>;
b99405236eb112 Asahi Lina        2022-11-02   499  			apple,perf-filter-time-constant2 = <50>;
b99405236eb112 Asahi Lina        2022-11-02   500  			apple,perf-integral-gain2 = <0.197392>;
b99405236eb112 Asahi Lina        2022-11-02   501  			apple,perf-integral-min-clamp = <0>;
b99405236eb112 Asahi Lina        2022-11-02   502  			apple,perf-proportional-gain2 = <6.853981>;
b99405236eb112 Asahi Lina        2022-11-02   503  			apple,perf-tgt-utilization = <85>;
b99405236eb112 Asahi Lina        2022-11-02   504  			apple,power-sample-period = <8>;
b99405236eb112 Asahi Lina        2022-11-02   505  			apple,power-zones = <30000 100 6875>;
b99405236eb112 Asahi Lina        2022-11-02   506  			apple,ppm-filter-time-constant-ms = <100>;
b99405236eb112 Asahi Lina        2022-11-02   507  			apple,ppm-ki = <91.5>;
b99405236eb112 Asahi Lina        2022-11-02   508  			apple,ppm-kp = <6.9>;
b99405236eb112 Asahi Lina        2022-11-02   509  			apple,pwr-filter-time-constant = <313>;
b99405236eb112 Asahi Lina        2022-11-02   510  			apple,pwr-integral-gain = <0.0202129>;
b99405236eb112 Asahi Lina        2022-11-02   511  			apple,pwr-integral-min-clamp = <0>;
b99405236eb112 Asahi Lina        2022-11-02   512  			apple,pwr-min-duty-cycle = <40>;
b99405236eb112 Asahi Lina        2022-11-02   513  			apple,pwr-proportional-gain = <5.2831855>;
1fee3729a9d699 Asahi Lina        2022-11-04   514  
1fee3729a9d699 Asahi Lina        2022-11-04   515  			apple,core-leak-coef = <1000.0>;
1fee3729a9d699 Asahi Lina        2022-11-04   516  			apple,sram-leak-coef = <45.0>;
68af00ba18f806 Asahi Lina        2022-08-18   517  		};
68af00ba18f806 Asahi Lina        2022-08-18   518  
68af00ba18f806 Asahi Lina        2022-08-18   519  		agx_mbox: mbox@206408000 {
68af00ba18f806 Asahi Lina        2022-08-18   520  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
68af00ba18f806 Asahi Lina        2022-08-18   521  			reg = <0x2 0x6408000 0x0 0x4000>;
68af00ba18f806 Asahi Lina        2022-08-18   522  			interrupt-parent = <&aic>;
68af00ba18f806 Asahi Lina        2022-08-18   523  			interrupts = <AIC_IRQ 575 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   524  				<AIC_IRQ 576 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   525  				<AIC_IRQ 577 IRQ_TYPE_LEVEL_HIGH>,
68af00ba18f806 Asahi Lina        2022-08-18   526  				<AIC_IRQ 578 IRQ_TYPE_LEVEL_HIGH>;
68af00ba18f806 Asahi Lina        2022-08-18   527  			interrupt-names = "send-empty", "send-not-empty",
68af00ba18f806 Asahi Lina        2022-08-18   528  				"recv-empty", "recv-not-empty";
68af00ba18f806 Asahi Lina        2022-08-18   529  			#mbox-cells = <0>;
68af00ba18f806 Asahi Lina        2022-08-18   530  		};
68af00ba18f806 Asahi Lina        2022-08-18   531  
3e895a6460ec38 Hector Martin     2022-05-03   532  		cpufreq_e: performance-controller@210e20000 {
3e895a6460ec38 Hector Martin     2022-05-03   533  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03   534  			reg = <0x2 0x10e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03   535  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03   536  		};
3e895a6460ec38 Hector Martin     2022-05-03   537  
3e895a6460ec38 Hector Martin     2022-05-03   538  		cpufreq_p: performance-controller@211e20000 {
3e895a6460ec38 Hector Martin     2022-05-03   539  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03   540  			reg = <0x2 0x11e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03   541  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03   542  		};
3e895a6460ec38 Hector Martin     2022-05-03   543  
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   544  		display_dfr: display-pipe@228200000 {
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   545  			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   546  			reg-names = "be", "fe", "mipi";
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   547  			reg = <0x2 0x28200000 0x0 0xc000>,
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   548  				<0x2 0x28400000 0x0 0x4000>,
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   549  				<0x2 0x28600000 0x0 0x100000>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   550  			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>, <&ps_mipi_dsi>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   551  			interrupt-parent = <&aic>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   552  			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   553  				<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   554  			interrupt-names = "be", "fe";
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   555  			status = "disabled";
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   556  			iommus = <&displaydfr_dart 0>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   557  			#address-cells = <1>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   558  			#size-cells = <0>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   559  		};
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   560  
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   561  		displaydfr_dart: iommu@228304000 {
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   562  			compatible = "apple,t8103-dart";
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   563  			reg = <0x2 0x28304000 0x0 0x4000>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   564  			interrupt-parent = <&aic>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   565  			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   566  			#iommu-cells = <1>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   567  			power-domains = <&ps_dispdfr_fe>;
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   568  		};
d9919fc9751fb6 Sasha Finkelstein 2023-04-18   569  
bb55263c1dd9f6 Hector Martin     2021-09-20   570  		disp0_dart: iommu@231304000 {
bb55263c1dd9f6 Hector Martin     2021-09-20   571  			compatible = "apple,t8103-dart";
bb55263c1dd9f6 Hector Martin     2021-09-20   572  			reg = <0x2 0x31304000 0x0 0x4000>;
bb55263c1dd9f6 Hector Martin     2021-09-20   573  			#iommu-cells = <1>;
bb55263c1dd9f6 Hector Martin     2021-09-20   574  			interrupt-parent = <&aic>;
bb55263c1dd9f6 Hector Martin     2021-09-20   575  			interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
eabba8bacd7802 Hector Martin     2022-12-13   576  			power-domains = <&ps_disp0_cpu0>;
d072d6c67ad318 Janne Grunau      2023-11-06   577  			apple,dma-range = <0x0 0x0 0x0 0xfc000000>;
bb55263c1dd9f6 Hector Martin     2021-09-20   578  			status = "disabled";
bb55263c1dd9f6 Hector Martin     2021-09-20   579  		};
bb55263c1dd9f6 Hector Martin     2021-09-20   580  
bb55263c1dd9f6 Hector Martin     2021-09-20   581  		dcp_dart: iommu@23130c000 {
bb55263c1dd9f6 Hector Martin     2021-09-20   582  			compatible = "apple,t8103-dart";
bb55263c1dd9f6 Hector Martin     2021-09-20   583  			reg = <0x2 0x3130c000 0x0 0x4000>;
bb55263c1dd9f6 Hector Martin     2021-09-20   584  			#iommu-cells = <1>;
bb55263c1dd9f6 Hector Martin     2021-09-20   585  			interrupt-parent = <&aic>;
bb55263c1dd9f6 Hector Martin     2021-09-20   586  			interrupts = <AIC_IRQ 445 IRQ_TYPE_LEVEL_HIGH>;
d072d6c67ad318 Janne Grunau      2023-11-06   587  			apple,dma-range = <0xf 0x00000000 0x0 0xfc000000>;
eabba8bacd7802 Hector Martin     2022-12-13   588  			power-domains = <&ps_disp0_cpu0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   589  		};
bb55263c1dd9f6 Hector Martin     2021-09-20   590  
bb55263c1dd9f6 Hector Martin     2021-09-20   591  		dcp_mbox: mbox@231c08000 {
bb55263c1dd9f6 Hector Martin     2021-09-20   592  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
bb55263c1dd9f6 Hector Martin     2021-09-20   593  			reg = <0x2 0x31c08000 0x0 0x4000>;
bb55263c1dd9f6 Hector Martin     2021-09-20   594  			interrupt-parent = <&aic>;
bb55263c1dd9f6 Hector Martin     2021-09-20   595  			interrupts = <AIC_IRQ 427 IRQ_TYPE_LEVEL_HIGH>,
bb55263c1dd9f6 Hector Martin     2021-09-20   596  				<AIC_IRQ 428 IRQ_TYPE_LEVEL_HIGH>,
bb55263c1dd9f6 Hector Martin     2021-09-20   597  				<AIC_IRQ 429 IRQ_TYPE_LEVEL_HIGH>,
bb55263c1dd9f6 Hector Martin     2021-09-20   598  				<AIC_IRQ 430 IRQ_TYPE_LEVEL_HIGH>;
bb55263c1dd9f6 Hector Martin     2021-09-20   599  			interrupt-names = "send-empty", "send-not-empty",
bb55263c1dd9f6 Hector Martin     2021-09-20   600  				"recv-empty", "recv-not-empty";
bb55263c1dd9f6 Hector Martin     2021-09-20   601  			#mbox-cells = <0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   602  			power-domains = <&ps_disp0_cpu0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   603  			resets = <&ps_disp0_cpu0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   604  		};
bb55263c1dd9f6 Hector Martin     2021-09-20   605  
bb55263c1dd9f6 Hector Martin     2021-09-20   606  		dcp: dcp@231c00000 {
bb55263c1dd9f6 Hector Martin     2021-09-20   607  			compatible = "apple,t8103-dcp", "apple,dcp";
bb55263c1dd9f6 Hector Martin     2021-09-20   608  			mboxes = <&dcp_mbox>;
bb55263c1dd9f6 Hector Martin     2021-09-20   609  			mbox-names = "mbox";
bb55263c1dd9f6 Hector Martin     2021-09-20   610  			iommus = <&dcp_dart 0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   611  
bb55263c1dd9f6 Hector Martin     2021-09-20   612  			reg-names = "coproc", "disp-0", "disp-1", "disp-2",
bb55263c1dd9f6 Hector Martin     2021-09-20   613  				"disp-3", "disp-4";
bb55263c1dd9f6 Hector Martin     2021-09-20   614  			reg = <0x2 0x31c00000 0x0 0x4000>,
bb55263c1dd9f6 Hector Martin     2021-09-20   615  				<0x2 0x30000000 0x0 0x3e8000>,
bb55263c1dd9f6 Hector Martin     2021-09-20   616  				<0x2 0x31320000 0x0 0x4000>,
bb55263c1dd9f6 Hector Martin     2021-09-20   617  				<0x2 0x31344000 0x0 0x4000>,
bb55263c1dd9f6 Hector Martin     2021-09-20   618  				<0x2 0x31800000 0x0 0x800000>,
bb55263c1dd9f6 Hector Martin     2021-09-20   619  				<0x2 0x3b3d0000 0x0 0x4000>;
bb55263c1dd9f6 Hector Martin     2021-09-20   620  			apple,bw-scratch = <&pmgr_dcp 0 5 0x14>;
bb55263c1dd9f6 Hector Martin     2021-09-20   621  			apple,bw-doorbell = <&pmgr_dcp 1 6>;
bb55263c1dd9f6 Hector Martin     2021-09-20   622  			power-domains = <&ps_disp0_cpu0>;
08861fdaa04299 Janne Grunau      2023-01-09   623  			resets = <&ps_disp0_cpu0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   624  			clocks = <&clk_disp0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   625  			phandle = <&dcp>;
78af5af6672ecd Janne Grunau      2025-02-09   626  			// required bus properties for 'piodma' subdevice
78af5af6672ecd Janne Grunau      2025-02-09   627  			#address-cells = <2>;
78af5af6672ecd Janne Grunau      2025-02-09   628  			#size-cells = <2>;
bb55263c1dd9f6 Hector Martin     2021-09-20   629  
bb55263c1dd9f6 Hector Martin     2021-09-20   630  			disp0_piodma: piodma {
bb55263c1dd9f6 Hector Martin     2021-09-20   631  				iommus = <&disp0_dart 4>;
bb55263c1dd9f6 Hector Martin     2021-09-20   632  				phandle = <&disp0_piodma>;
bb55263c1dd9f6 Hector Martin     2021-09-20   633  			};
94dd85b5237c66 Martin Povišer    2022-11-28   634  
94dd85b5237c66 Martin Povišer    2022-11-28   635  			ports {
94dd85b5237c66 Martin Povišer    2022-11-28   636  				#address-cells = <1>;
94dd85b5237c66 Martin Povišer    2022-11-28   637  				#size-cells = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   638  				port@0 {
94dd85b5237c66 Martin Povišer    2022-11-28   639  					reg = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   640  					dcp_audio: endpoint {
94dd85b5237c66 Martin Povišer    2022-11-28   641  						remote-endpoint = <&dpaudio0_dcp>;
94dd85b5237c66 Martin Povišer    2022-11-28   642  					};
94dd85b5237c66 Martin Povišer    2022-11-28   643  				};
94dd85b5237c66 Martin Povišer    2022-11-28   644  			};
bb55263c1dd9f6 Hector Martin     2021-09-20   645  		};
bb55263c1dd9f6 Hector Martin     2021-09-20   646  
bb55263c1dd9f6 Hector Martin     2021-09-20   647  		display: display-subsystem {
bb55263c1dd9f6 Hector Martin     2021-09-20   648  			compatible = "apple,display-subsystem";
0ec238bb9b4d88 Janne Grunau      2022-09-30   649  			/* disp_dart0 must be 1st since it is locked */
bb55263c1dd9f6 Hector Martin     2021-09-20   650  			iommus = <&disp0_dart 0>;
bb55263c1dd9f6 Hector Martin     2021-09-20   651  			/* generate phandle explicitly for use in loader */
bb55263c1dd9f6 Hector Martin     2021-09-20   652  			phandle = <&display>;
bb55263c1dd9f6 Hector Martin     2021-09-20   653  		};
bb55263c1dd9f6 Hector Martin     2021-09-20   654  
9034850b962654 Eileen Yoon       2023-08-31   655  		isp_dart0: iommu@22c0e8000 {
9034850b962654 Eileen Yoon       2023-08-31   656  			compatible = "apple,t8103-dart";
9034850b962654 Eileen Yoon       2023-08-31   657  			reg = <0x2 0x2c0e8000 0x0 0x4000>;
9034850b962654 Eileen Yoon       2023-08-31   658  			#iommu-cells = <1>;
9034850b962654 Eileen Yoon       2023-08-31   659  			interrupt-parent = <&aic>;
9034850b962654 Eileen Yoon       2023-08-31   660  			interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
9034850b962654 Eileen Yoon       2023-08-31   661  			power-domains = <&ps_isp_sys>;
9034850b962654 Eileen Yoon       2023-08-31   662  
9034850b962654 Eileen Yoon       2023-08-31   663  			status = "disabled";
9034850b962654 Eileen Yoon       2023-08-31   664  		};
9034850b962654 Eileen Yoon       2023-08-31   665  
9034850b962654 Eileen Yoon       2023-08-31   666  		isp_dart1: iommu@22c0f4000 {
9034850b962654 Eileen Yoon       2023-08-31   667  			compatible = "apple,t8103-dart";
9034850b962654 Eileen Yoon       2023-08-31   668  			reg = <0x2 0x2c0f4000 0x0 0x4000>;
9034850b962654 Eileen Yoon       2023-08-31   669  			#iommu-cells = <1>;
9034850b962654 Eileen Yoon       2023-08-31   670  			interrupt-parent = <&aic>;
9034850b962654 Eileen Yoon       2023-08-31   671  			interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
9034850b962654 Eileen Yoon       2023-08-31   672  			power-domains = <&ps_isp_sys>;
9034850b962654 Eileen Yoon       2023-08-31   673  
9034850b962654 Eileen Yoon       2023-08-31   674  			status = "disabled";
9034850b962654 Eileen Yoon       2023-08-31   675  		};
9034850b962654 Eileen Yoon       2023-08-31   676  
9034850b962654 Eileen Yoon       2023-08-31   677  		isp_dart2: iommu@22c0fc000 {
9034850b962654 Eileen Yoon       2023-08-31   678  			compatible = "apple,t8103-dart";
9034850b962654 Eileen Yoon       2023-08-31   679  			reg = <0x2 0x2c0fc000 0x0 0x4000>;
9034850b962654 Eileen Yoon       2023-08-31   680  			#iommu-cells = <1>;
9034850b962654 Eileen Yoon       2023-08-31   681  			interrupt-parent = <&aic>;
9034850b962654 Eileen Yoon       2023-08-31   682  			interrupts = <AIC_IRQ 251 IRQ_TYPE_LEVEL_HIGH>;
9034850b962654 Eileen Yoon       2023-08-31   683  			power-domains = <&ps_isp_sys>;
9034850b962654 Eileen Yoon       2023-08-31   684  
9034850b962654 Eileen Yoon       2023-08-31   685  			status = "disabled";
9034850b962654 Eileen Yoon       2023-08-31   686  		};
9034850b962654 Eileen Yoon       2023-08-31   687  
9034850b962654 Eileen Yoon       2023-08-31   688  		isp: isp@22a000000 {
9034850b962654 Eileen Yoon       2023-08-31   689  			compatible = "apple,t8103-isp", "apple,isp";
9034850b962654 Eileen Yoon       2023-08-31   690  			iommus = <&isp_dart0 0>, <&isp_dart1 0>, <&isp_dart2 0>;
9034850b962654 Eileen Yoon       2023-08-31   691  			reg-names = "coproc", "mbox", "gpio", "mbox2";
9034850b962654 Eileen Yoon       2023-08-31   692  			reg = <0x2 0x2a000000 0x0 0x2000000>,
9034850b962654 Eileen Yoon       2023-08-31   693  				<0x2 0x2c104000 0x0 0x100>,
9034850b962654 Eileen Yoon       2023-08-31   694  				<0x2 0x2c104170 0x0 0x100>,
9034850b962654 Eileen Yoon       2023-08-31   695  				<0x2 0x2c1043f0 0x0 0x100>;
9034850b962654 Eileen Yoon       2023-08-31   696  			interrupt-parent = <&aic>;
9034850b962654 Eileen Yoon       2023-08-31   697  			interrupts = <AIC_IRQ 246 IRQ_TYPE_LEVEL_HIGH>;
9034850b962654 Eileen Yoon       2023-08-31   698  			power-domains = <&ps_isp_sys>, <&ps_isp_set0>,
9034850b962654 Eileen Yoon       2023-08-31   699  				<&ps_isp_set1>, <&ps_isp_set2>, <&ps_isp_fe>,
9034850b962654 Eileen Yoon       2023-08-31   700  				<&ps_isp_set4>, <&ps_isp_set5>, <&ps_isp_set6>,
9034850b962654 Eileen Yoon       2023-08-31   701  				<&ps_isp_set7>, <&ps_isp_set8>, <&ps_isp_set9>,
9034850b962654 Eileen Yoon       2023-08-31   702  				<&ps_isp_set10>, <&ps_isp_set11>,
9034850b962654 Eileen Yoon       2023-08-31   703  				<&ps_isp_set12>;
9034850b962654 Eileen Yoon       2023-08-31   704  
9034850b962654 Eileen Yoon       2023-08-31   705  			apple,dart-vm-size = <0x0 0xa0000000>;
9034850b962654 Eileen Yoon       2023-08-31   706  
9034850b962654 Eileen Yoon       2023-08-31   707  			status = "disabled";
9034850b962654 Eileen Yoon       2023-08-31   708  		};
9034850b962654 Eileen Yoon       2023-08-31   709  
63bf0b66ddfa67 Hector Martin     2022-12-05   710  		sio_dart: iommu@235004000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   711  			compatible = "apple,t8103-dart";
8a3df85ad87d2e Martin Povišer    2022-09-16   712  			reg = <0x2 0x35004000 0x0 0x4000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   713  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16   714  			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16   715  			#iommu-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   716  			power-domains = <&ps_sio_cpu>;
8a3df85ad87d2e Martin Povišer    2022-09-16   717  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   718  
90458f6eec42aa Janne Grunau      2021-11-23   719  		i2c0: i2c@235010000 {
90458f6eec42aa Janne Grunau      2021-11-23   720  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   721  			reg = <0x2 0x35010000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   722  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   723  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   724  			interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   725  			pinctrl-0 = <&i2c0_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   726  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   727  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   728  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   729  			power-domains = <&ps_i2c0>;
90458f6eec42aa Janne Grunau      2021-11-23   730  		};
90458f6eec42aa Janne Grunau      2021-11-23   731  
90458f6eec42aa Janne Grunau      2021-11-23   732  		i2c1: i2c@235014000 {
90458f6eec42aa Janne Grunau      2021-11-23   733  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   734  			reg = <0x2 0x35014000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   735  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   736  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   737  			interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   738  			pinctrl-0 = <&i2c1_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   739  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   740  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   741  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   742  			power-domains = <&ps_i2c1>;
90458f6eec42aa Janne Grunau      2021-11-23   743  		};
90458f6eec42aa Janne Grunau      2021-11-23   744  
90458f6eec42aa Janne Grunau      2021-11-23   745  		i2c2: i2c@235018000 {
90458f6eec42aa Janne Grunau      2021-11-23   746  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   747  			reg = <0x2 0x35018000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   748  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   749  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   750  			interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   751  			pinctrl-0 = <&i2c2_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   752  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   753  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   754  			#size-cells = <0x0>;
90458f6eec42aa Janne Grunau      2021-11-23   755  			status = "disabled"; /* not used in all devices */
106ba3b48a35dd Hector Martin     2021-11-24   756  			power-domains = <&ps_i2c2>;
90458f6eec42aa Janne Grunau      2021-11-23   757  		};
90458f6eec42aa Janne Grunau      2021-11-23   758  
90458f6eec42aa Janne Grunau      2021-11-23   759  		i2c3: i2c@23501c000 {
90458f6eec42aa Janne Grunau      2021-11-23   760  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   761  			reg = <0x2 0x3501c000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   762  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   763  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   764  			interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   765  			pinctrl-0 = <&i2c3_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   766  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   767  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   768  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   769  			power-domains = <&ps_i2c3>;
90458f6eec42aa Janne Grunau      2021-11-23   770  		};
90458f6eec42aa Janne Grunau      2021-11-23   771  
90458f6eec42aa Janne Grunau      2021-11-23   772  		i2c4: i2c@235020000 {
90458f6eec42aa Janne Grunau      2021-11-23   773  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23   774  			reg = <0x2 0x35020000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05   775  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23   776  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23   777  			interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23   778  			pinctrl-0 = <&i2c4_pins>;
90458f6eec42aa Janne Grunau      2021-11-23   779  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23   780  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23   781  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24   782  			power-domains = <&ps_i2c4>;
90458f6eec42aa Janne Grunau      2021-11-23   783  			status = "disabled"; /* only used in J293 */
90458f6eec42aa Janne Grunau      2021-11-23   784  		};
90458f6eec42aa Janne Grunau      2021-11-23   785  
348981c783b985 Sasha Finkelstein 2023-04-03   786  		fpwm1: pwm@235044000 {
348981c783b985 Sasha Finkelstein 2023-04-03   787  			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
348981c783b985 Sasha Finkelstein 2023-04-03   788  			reg = <0x2 0x35044000 0x0 0x4000>;
348981c783b985 Sasha Finkelstein 2023-04-03   789  			power-domains = <&ps_fpwm1>;
348981c783b985 Sasha Finkelstein 2023-04-03   790  			clocks = <&clkref>;
348981c783b985 Sasha Finkelstein 2023-04-03   791  			#pwm-cells = <2>;
348981c783b985 Sasha Finkelstein 2023-04-03   792  			status = "disabled";
348981c783b985 Sasha Finkelstein 2023-04-03   793  		};
348981c783b985 Sasha Finkelstein 2023-04-03   794  
9ba99beb5e1ff4 Janne Grunau      2024-11-01   795  		spi0: spi@235100000 {
9ba99beb5e1ff4 Janne Grunau      2024-11-01   796  			compatible = "apple,t8103-spi", "apple,spi";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   797  			reg = <0x2 0x35100000 0x0 0x4000>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   798  			interrupt-parent = <&aic>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   799  			interrupts = <AIC_IRQ 614 IRQ_TYPE_LEVEL_HIGH>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   800  			clocks = <&clk_200m>;
0e629442aa9ea5 Sasha Finkelstein 2023-01-21   801  			pinctrl-0 = <&spi0_pins>;
0e629442aa9ea5 Sasha Finkelstein 2023-01-21   802  			pinctrl-names = "default";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   803  			power-domains = <&ps_spi0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   804  			#address-cells = <1>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   805  			#size-cells = <0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   806  			status = "disabled";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   807  		};
9ba99beb5e1ff4 Janne Grunau      2024-11-01   808  
9ba99beb5e1ff4 Janne Grunau      2024-11-01   809  		spi1: spi@235104000 {
9ba99beb5e1ff4 Janne Grunau      2024-11-01   810  			compatible = "apple,t8103-spi", "apple,spi";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   811  			reg = <0x2 0x35104000 0x0 0x4000>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   812  			interrupt-parent = <&aic>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   813  			interrupts = <AIC_IRQ 615 IRQ_TYPE_LEVEL_HIGH>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   814  			clocks = <&clk_200m>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   815  			pinctrl-0 = <&spi1_pins>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   816  			pinctrl-names = "default";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   817  			power-domains = <&ps_spi1>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   818  			#address-cells = <1>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   819  			#size-cells = <0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   820  			status = "disabled";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   821  		};
9ba99beb5e1ff4 Janne Grunau      2024-11-01   822  
9ba99beb5e1ff4 Janne Grunau      2024-11-01   823  		spi3: spi@23510c000 {
9ba99beb5e1ff4 Janne Grunau      2024-11-01   824  			compatible = "apple,t8103-spi", "apple,spi";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   825  			reg = <0x2 0x3510c000 0x0 0x4000>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   826  			interrupt-parent = <&aic>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   827  			interrupts = <AIC_IRQ 617 IRQ_TYPE_LEVEL_HIGH>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   828  			clocks = <&clk_120m>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   829  			pinctrl-0 = <&spi3_pins>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   830  			pinctrl-names = "default";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   831  			power-domains = <&ps_spi3>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   832  			#address-cells = <1>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   833  			#size-cells = <0>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01   834  			status = "disabled";
9ba99beb5e1ff4 Janne Grunau      2024-11-01   835  		};
9ba99beb5e1ff4 Janne Grunau      2024-11-01   836  
7d2d16ccf15d8e Hector Martin     2021-02-04   837  		serial0: serial@235200000 {
7d2d16ccf15d8e Hector Martin     2021-02-04   838  			compatible = "apple,s5l-uart";
7d2d16ccf15d8e Hector Martin     2021-02-04   839  			reg = <0x2 0x35200000 0x0 0x1000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   840  			reg-io-width = <4>;
7d2d16ccf15d8e Hector Martin     2021-02-04   841  			interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04   842  			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04   843  			/*
7d2d16ccf15d8e Hector Martin     2021-02-04   844  			 * TODO: figure out the clocking properly, there may
7d2d16ccf15d8e Hector Martin     2021-02-04   845  			 * be a third selectable clock.
7d2d16ccf15d8e Hector Martin     2021-02-04   846  			 */
57337b25244212 Hector Martin     2021-10-05   847  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04   848  			clock-names = "uart", "clk_uart_baud0";
106ba3b48a35dd Hector Martin     2021-11-24   849  			power-domains = <&ps_uart0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   850  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04   851  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   852  
2ba22cfeda4456 Hector Martin     2021-09-20   853  		serial2: serial@235208000 {
2ba22cfeda4456 Hector Martin     2021-09-20   854  			compatible = "apple,s5l-uart";
2ba22cfeda4456 Hector Martin     2021-09-20   855  			reg = <0x2 0x35208000 0x0 0x1000>;
2ba22cfeda4456 Hector Martin     2021-09-20   856  			reg-io-width = <4>;
2ba22cfeda4456 Hector Martin     2021-09-20   857  			interrupt-parent = <&aic>;
2ba22cfeda4456 Hector Martin     2021-09-20   858  			interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
57337b25244212 Hector Martin     2021-10-05   859  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04   860  			clock-names = "uart", "clk_uart_baud0";
2ba22cfeda4456 Hector Martin     2021-09-20   861  			power-domains = <&ps_uart2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   862  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04   863  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   864  
94dd85b5237c66 Martin Povišer    2022-11-28   865  		sio_mbox: mbox@236408000 {
94dd85b5237c66 Martin Povišer    2022-11-28   866  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
94dd85b5237c66 Martin Povišer    2022-11-28   867  			reg = <0x2 0x36408000 0x0 0x4000>;
94dd85b5237c66 Martin Povišer    2022-11-28   868  			interrupt-parent = <&aic>;
94dd85b5237c66 Martin Povišer    2022-11-28   869  			interrupts = <AIC_IRQ 640 IRQ_TYPE_LEVEL_HIGH>,
94dd85b5237c66 Martin Povišer    2022-11-28   870  				<AIC_IRQ 641 IRQ_TYPE_LEVEL_HIGH>,
94dd85b5237c66 Martin Povišer    2022-11-28   871  				<AIC_IRQ 642 IRQ_TYPE_LEVEL_HIGH>,
94dd85b5237c66 Martin Povišer    2022-11-28   872  				<AIC_IRQ 643 IRQ_TYPE_LEVEL_HIGH>;
94dd85b5237c66 Martin Povišer    2022-11-28   873  			interrupt-names = "send-empty", "send-not-empty",
94dd85b5237c66 Martin Povišer    2022-11-28   874  				"recv-empty", "recv-not-empty";
94dd85b5237c66 Martin Povišer    2022-11-28   875  			#mbox-cells = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   876  			power-domains = <&ps_sio>;
94dd85b5237c66 Martin Povišer    2022-11-28   877  		};
94dd85b5237c66 Martin Povišer    2022-11-28   878  
94dd85b5237c66 Martin Povišer    2022-11-28   879  		sio: sio@236400000 {
94dd85b5237c66 Martin Povišer    2022-11-28   880  			compatible = "apple,t8103-sio", "apple,sio";
94dd85b5237c66 Martin Povišer    2022-11-28   881  			reg = <0x2 0x36400000 0x0 0x8000>;
94dd85b5237c66 Martin Povišer    2022-11-28   882  			dma-channels = <128>;
94dd85b5237c66 Martin Povišer    2022-11-28   883  			#dma-cells = <1>;
94dd85b5237c66 Martin Povišer    2022-11-28   884  			mboxes = <&sio_mbox>;
94dd85b5237c66 Martin Povišer    2022-11-28   885  			iommus = <&sio_dart 0>;
94dd85b5237c66 Martin Povišer    2022-11-28   886  			power-domains = <&ps_sio_cpu>;
94dd85b5237c66 Martin Povišer    2022-11-28   887  			resets = <&ps_sio>; /* TODO: verify reset does something */
94dd85b5237c66 Martin Povišer    2022-11-28   888  			status = "disabled";
94dd85b5237c66 Martin Povišer    2022-11-28   889  		};
94dd85b5237c66 Martin Povišer    2022-11-28   890  
8a3df85ad87d2e Martin Povišer    2022-09-16   891  		admac: dma-controller@238200000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   892  			compatible = "apple,t8103-admac", "apple,admac";
8a3df85ad87d2e Martin Povišer    2022-09-16   893  			reg = <0x2 0x38200000 0x0 0x34000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   894  			dma-channels = <24>;
8a3df85ad87d2e Martin Povišer    2022-09-16   895  			interrupts-extended = <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16   896  					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   897  					      <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16   898  					      <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16   899  			#dma-cells = <1>;
63bf0b66ddfa67 Hector Martin     2022-12-05   900  			iommus = <&sio_dart 2>;
8a3df85ad87d2e Martin Povišer    2022-09-16   901  			power-domains = <&ps_sio_adma>;
56fed763f6b2dc Martin Povišer    2022-09-18   902  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16   903  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   904  
94dd85b5237c66 Martin Povišer    2022-11-28   905  		dpaudio0: audio-controller@238330000 {
94dd85b5237c66 Martin Povišer    2022-11-28   906  			compatible = "apple,t8103-dpaudio", "apple,dpaudio";
94dd85b5237c66 Martin Povišer    2022-11-28   907  			reg = <0x2 0x38330000 0x0 0x4000>;
94dd85b5237c66 Martin Povišer    2022-11-28   908  			dmas = <&sio 0x64>;
94dd85b5237c66 Martin Povišer    2022-11-28   909  			dma-names = "tx";
94dd85b5237c66 Martin Povišer    2022-11-28   910  			power-domains = <&ps_dpa0>;
94dd85b5237c66 Martin Povišer    2022-11-28   911  			reset-domains = <&ps_dpa0>;
94dd85b5237c66 Martin Povišer    2022-11-28   912  			status = "disabled";
94dd85b5237c66 Martin Povišer    2022-11-28   913  
94dd85b5237c66 Martin Povišer    2022-11-28   914  			ports {
94dd85b5237c66 Martin Povišer    2022-11-28   915  				#address-cells = <1>;
94dd85b5237c66 Martin Povišer    2022-11-28   916  				#size-cells = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   917  				port@0 {
94dd85b5237c66 Martin Povišer    2022-11-28   918  					reg = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   919  					dpaudio0_dcp: endpoint {
94dd85b5237c66 Martin Povišer    2022-11-28   920  						remote-endpoint = <&dcp_audio>;
94dd85b5237c66 Martin Povišer    2022-11-28   921  					};
94dd85b5237c66 Martin Povišer    2022-11-28   922  				};
94dd85b5237c66 Martin Povišer    2022-11-28   923  			};
94dd85b5237c66 Martin Povišer    2022-11-28   924  		};
94dd85b5237c66 Martin Povišer    2022-11-28   925  
94dd85b5237c66 Martin Povišer    2022-11-28   926  		dpaudio1: audio-controller@238334000 {
94dd85b5237c66 Martin Povišer    2022-11-28   927  			compatible = "apple,t8103-dpaudio", "apple,dpaudio";
94dd85b5237c66 Martin Povišer    2022-11-28   928  			reg = <0x2 0x38334000 0x0 0x4000>;
94dd85b5237c66 Martin Povišer    2022-11-28   929  			dmas = <&sio 0x66>;
94dd85b5237c66 Martin Povišer    2022-11-28   930  			dma-names = "tx";
94dd85b5237c66 Martin Povišer    2022-11-28   931  			power-domains = <&ps_dpa1>;
94dd85b5237c66 Martin Povišer    2022-11-28   932  			reset-domains = <&ps_dpa1>;
94dd85b5237c66 Martin Povišer    2022-11-28   933  			status = "disabled";
94dd85b5237c66 Martin Povišer    2022-11-28   934  
94dd85b5237c66 Martin Povišer    2022-11-28   935  			ports {
94dd85b5237c66 Martin Povišer    2022-11-28   936  				#address-cells = <1>;
94dd85b5237c66 Martin Povišer    2022-11-28   937  				#size-cells = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   938  				port@0 {
94dd85b5237c66 Martin Povišer    2022-11-28   939  					reg = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28   940  					dpaudio1_dcp: endpoint {
94dd85b5237c66 Martin Povišer    2022-11-28   941  						remote-endpoint = <&dcpext_audio>;
94dd85b5237c66 Martin Povišer    2022-11-28   942  					};
94dd85b5237c66 Martin Povišer    2022-11-28   943  				};
94dd85b5237c66 Martin Povišer    2022-11-28   944  			};
94dd85b5237c66 Martin Povišer    2022-11-28   945  		};
94dd85b5237c66 Martin Povišer    2022-11-28   946  
8a3df85ad87d2e Martin Povišer    2022-09-16   947  		mca: i2s@238400000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   948  			compatible = "apple,t8103-mca", "apple,mca";
8a3df85ad87d2e Martin Povišer    2022-09-16   949  			reg = <0x2 0x38400000 0x0 0x18000>,
8a3df85ad87d2e Martin Povišer    2022-09-16   950  			      <0x2 0x38300000 0x0 0x30000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   951  
8a3df85ad87d2e Martin Povišer    2022-09-16   952  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16   953  			interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   954  				     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   955  				     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   956  				     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   957  				     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16   958  				     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16   959  
8a3df85ad87d2e Martin Povišer    2022-09-16   960  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16   961  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
8a3df85ad87d2e Martin Povišer    2022-09-16   962  				 <&nco 3>, <&nco 4>, <&nco 4>;
8a3df85ad87d2e Martin Povišer    2022-09-16   963  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
8a3df85ad87d2e Martin Povišer    2022-09-16   964  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
8a3df85ad87d2e Martin Povišer    2022-09-16   965  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
8a3df85ad87d2e Martin Povišer    2022-09-16   966  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
8a3df85ad87d2e Martin Povišer    2022-09-16   967  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
8a3df85ad87d2e Martin Povišer    2022-09-16   968  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
8a3df85ad87d2e Martin Povišer    2022-09-16   969  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
8a3df85ad87d2e Martin Povišer    2022-09-16   970  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
8a3df85ad87d2e Martin Povišer    2022-09-16   971  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
8a3df85ad87d2e Martin Povišer    2022-09-16   972  				"tx1a", "rx1a", "tx1b", "rx1b",
8a3df85ad87d2e Martin Povišer    2022-09-16   973  				"tx2a", "rx2a", "tx2b", "rx2b",
8a3df85ad87d2e Martin Povišer    2022-09-16   974  				"tx3a", "rx3a", "tx3b", "rx3b",
8a3df85ad87d2e Martin Povišer    2022-09-16   975  				"tx4a", "rx4a", "tx4b", "rx4b",
8a3df85ad87d2e Martin Povišer    2022-09-16   976  				"tx5a", "rx5a", "tx5b", "rx5b";
8a3df85ad87d2e Martin Povišer    2022-09-16   977  
8a3df85ad87d2e Martin Povišer    2022-09-16   978  			#sound-dai-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   979  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   980  
8a3df85ad87d2e Martin Povišer    2022-09-16   981  		nco: clock-controller@23b044000 {
8a3df85ad87d2e Martin Povišer    2022-09-16   982  			compatible = "apple,t8103-nco", "apple,nco";
8a3df85ad87d2e Martin Povišer    2022-09-16   983  			reg = <0x2 0x3b044000 0x0 0x14000>;
8a3df85ad87d2e Martin Povišer    2022-09-16   984  			clocks = <&nco_clkref>;
8a3df85ad87d2e Martin Povišer    2022-09-16   985  			#clock-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16   986  		};
8a3df85ad87d2e Martin Povišer    2022-09-16   987  
7d2d16ccf15d8e Hector Martin     2021-02-04   988  		aic: interrupt-controller@23b100000 {
7d2d16ccf15d8e Hector Martin     2021-02-04   989  			compatible = "apple,t8103-aic", "apple,aic";
7d2d16ccf15d8e Hector Martin     2021-02-04   990  			#interrupt-cells = <3>;
7d2d16ccf15d8e Hector Martin     2021-02-04   991  			interrupt-controller;
7d2d16ccf15d8e Hector Martin     2021-02-04   992  			reg = <0x2 0x3b100000 0x0 0x8000>;
106ba3b48a35dd Hector Martin     2021-11-24   993  			power-domains = <&ps_aic>;
1852e22b318b8d Marc Zyngier      2021-12-14   994  
1852e22b318b8d Marc Zyngier      2021-12-14   995  			affinities {
1852e22b318b8d Marc Zyngier      2021-12-14   996  				e-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14   997  					apple,fiq-index = <AIC_CPU_PMU_E>;
3e895a6460ec38 Hector Martin     2022-05-03   998  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
1852e22b318b8d Marc Zyngier      2021-12-14   999  				};
1852e22b318b8d Marc Zyngier      2021-12-14  1000  
1852e22b318b8d Marc Zyngier      2021-12-14  1001  				p-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14  1002  					apple,fiq-index = <AIC_CPU_PMU_P>;
3e895a6460ec38 Hector Martin     2022-05-03  1003  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
1852e22b318b8d Marc Zyngier      2021-12-14  1004  				};
1852e22b318b8d Marc Zyngier      2021-12-14  1005  			};
106ba3b48a35dd Hector Martin     2021-11-24  1006  		};
106ba3b48a35dd Hector Martin     2021-11-24  1007  
106ba3b48a35dd Hector Martin     2021-11-24  1008  		pmgr: power-management@23b700000 {
106ba3b48a35dd Hector Martin     2021-11-24  1009  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
106ba3b48a35dd Hector Martin     2021-11-24  1010  			#address-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24  1011  			#size-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24  1012  			reg = <0x2 0x3b700000 0 0x14000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  1013  		};
0a8282b831196b Mark Kettenis     2021-10-25  1014  
bb55263c1dd9f6 Hector Martin     2021-09-20  1015  		pmgr_dcp: power-management@23b738000 {
bb55263c1dd9f6 Hector Martin     2021-09-20  1016  			reg = <0x2 0x3b738000 0x0 0x1000>,
bb55263c1dd9f6 Hector Martin     2021-09-20  1017  				<0x2 0x3bc3c000 0x0 0x1000>;
bb55263c1dd9f6 Hector Martin     2021-09-20  1018  			reg-names = "dcp-bw-scratch", "dcp-bw-doorbell";
bb55263c1dd9f6 Hector Martin     2021-09-20  1019  			#apple,bw-scratch-cells = <3>;
bb55263c1dd9f6 Hector Martin     2021-09-20  1020  			#apple,bw-doorbell-cells = <2>;
bb55263c1dd9f6 Hector Martin     2021-09-20  1021  		};
bb55263c1dd9f6 Hector Martin     2021-09-20  1022  
0a8282b831196b Mark Kettenis     2021-10-25  1023  		pinctrl_ap: pinctrl@23c100000 {
0a8282b831196b Mark Kettenis     2021-10-25  1024  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  1025  			reg = <0x2 0x3c100000 0x0 0x100000>;
106ba3b48a35dd Hector Martin     2021-11-24  1026  			power-domains = <&ps_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25  1027  
0a8282b831196b Mark Kettenis     2021-10-25  1028  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  1029  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1030  			gpio-ranges = <&pinctrl_ap 0 0 212>;
0a8282b831196b Mark Kettenis     2021-10-25  1031  			apple,npins = <212>;
0a8282b831196b Mark Kettenis     2021-10-25  1032  
0a8282b831196b Mark Kettenis     2021-10-25  1033  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  1034  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1035  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  1036  			interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1037  				     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1038  				     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1039  				     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1040  				     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1041  				     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1042  				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  1043  
90458f6eec42aa Janne Grunau      2021-11-23  1044  			i2c0_pins: i2c0-pins {
90458f6eec42aa Janne Grunau      2021-11-23  1045  				pinmux = <APPLE_PINMUX(192, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  1046  					 <APPLE_PINMUX(188, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  1047  			};
90458f6eec42aa Janne Grunau      2021-11-23  1048  
90458f6eec42aa Janne Grunau      2021-11-23  1049  			i2c1_pins: i2c1-pins {
90458f6eec42aa Janne Grunau      2021-11-23  1050  				pinmux = <APPLE_PINMUX(201, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  1051  					 <APPLE_PINMUX(199, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  1052  			};
0a8282b831196b Mark Kettenis     2021-10-25  1053  
90458f6eec42aa Janne Grunau      2021-11-23  1054  			i2c2_pins: i2c2-pins {
90458f6eec42aa Janne Grunau      2021-11-23  1055  				pinmux = <APPLE_PINMUX(163, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  1056  					 <APPLE_PINMUX(162, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  1057  			};
0a8282b831196b Mark Kettenis     2021-10-25  1058  
90458f6eec42aa Janne Grunau      2021-11-23  1059  			i2c3_pins: i2c3-pins {
90458f6eec42aa Janne Grunau      2021-11-23  1060  				pinmux = <APPLE_PINMUX(73, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  1061  					 <APPLE_PINMUX(72, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  1062  			};
0a8282b831196b Mark Kettenis     2021-10-25  1063  
90458f6eec42aa Janne Grunau      2021-11-23  1064  			i2c4_pins: i2c4-pins {
90458f6eec42aa Janne Grunau      2021-11-23  1065  				pinmux = <APPLE_PINMUX(135, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  1066  					 <APPLE_PINMUX(134, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  1067  			};
90458f6eec42aa Janne Grunau      2021-11-23  1068  
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1069  			spi0_pins: spi0-pins {
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1070  				pinmux = <APPLE_PINMUX(67, 1)>,
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1071  					<APPLE_PINMUX(68, 1)>,
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1072  					<APPLE_PINMUX(69, 1)>;
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1073  			};
0e629442aa9ea5 Sasha Finkelstein 2023-01-21  1074  
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1075  			spi1_pins: spi1-pins {
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1076  				pinmux = <APPLE_PINMUX(42, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1077  					<APPLE_PINMUX(43, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1078  					<APPLE_PINMUX(44, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1079  					<APPLE_PINMUX(45, 1)>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1080  			};
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1081  
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1082  			spi3_pins: spi3-pins {
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1083  				pinmux = <APPLE_PINMUX(46, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1084  					<APPLE_PINMUX(47, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1085  					<APPLE_PINMUX(48, 1)>,
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1086  					<APPLE_PINMUX(49, 1)>;
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1087  			};
9ba99beb5e1ff4 Janne Grunau      2024-11-01  1088  
0a8282b831196b Mark Kettenis     2021-10-25  1089  			pcie_pins: pcie-pins {
0a8282b831196b Mark Kettenis     2021-10-25  1090  				pinmux = <APPLE_PINMUX(150, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25  1091  					 <APPLE_PINMUX(151, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25  1092  					 <APPLE_PINMUX(32, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  1093  			};
0a8282b831196b Mark Kettenis     2021-10-25  1094  		};
0a8282b831196b Mark Kettenis     2021-10-25  1095  
1e0399402ef5a6 Hector Martin     2022-02-15  1096  		nub_spmi: spmi@23d0d9300 {
1e0399402ef5a6 Hector Martin     2022-02-15  1097  			compatible = "apple,t8103-spmi", "apple,spmi";
1e0399402ef5a6 Hector Martin     2022-02-15  1098  			reg = <0x2 0x3d0d9300 0x0 0x100>;
1e0399402ef5a6 Hector Martin     2022-02-15  1099  			#address-cells = <2>;
1e0399402ef5a6 Hector Martin     2022-02-15  1100  			#size-cells = <0>;
1e0399402ef5a6 Hector Martin     2022-02-15  1101  
1e0399402ef5a6 Hector Martin     2022-02-15  1102  			pmu1: pmu@f {
1e0399402ef5a6 Hector Martin     2022-02-15  1103  				compatible = "apple,sera-pmu", "apple,spmi-pmu";
1e0399402ef5a6 Hector Martin     2022-02-15  1104  				reg = <0xf SPMI_USID>;
1e0399402ef5a6 Hector Martin     2022-02-15  1105  				#address-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1106  				#size-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1107  
1e0399402ef5a6 Hector Martin     2022-02-15  1108  				rtc_nvmem@d000 {
1e0399402ef5a6 Hector Martin     2022-02-15  1109  					compatible = "apple,spmi-pmu-nvmem";
1e0399402ef5a6 Hector Martin     2022-02-15  1110  					reg = <0xd000 0x300>;
1e0399402ef5a6 Hector Martin     2022-02-15  1111  					#address-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1112  					#size-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1113  
1e0399402ef5a6 Hector Martin     2022-02-15  1114  					pm_setting: pm-setting@1 {
1e0399402ef5a6 Hector Martin     2022-02-15  1115  						reg = <0x1 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1116  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1117  
1e0399402ef5a6 Hector Martin     2022-02-15  1118  					rtc_offset: rtc-offset@100 {
1e0399402ef5a6 Hector Martin     2022-02-15  1119  						reg = <0x100 0x6>;
1e0399402ef5a6 Hector Martin     2022-02-15  1120  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1121  				};
1e0399402ef5a6 Hector Martin     2022-02-15  1122  
1e0399402ef5a6 Hector Martin     2022-02-15  1123  				legacy_nvmem@9f00 {
1e0399402ef5a6 Hector Martin     2022-02-15  1124  					compatible = "apple,spmi-pmu-nvmem";
1e0399402ef5a6 Hector Martin     2022-02-15  1125  					reg = <0x9f00 0x20>;
1e0399402ef5a6 Hector Martin     2022-02-15  1126  					#address-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1127  					#size-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1128  
1e0399402ef5a6 Hector Martin     2022-02-15  1129  					boot_stage: boot-stage@1 {
1e0399402ef5a6 Hector Martin     2022-02-15  1130  						reg = <0x1 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1131  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1132  
1e0399402ef5a6 Hector Martin     2022-02-15  1133  					boot_error_count: boot-error-count@2 {
1e0399402ef5a6 Hector Martin     2022-02-15  1134  						reg = <0x2 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1135  						bits = <0 4>;
1e0399402ef5a6 Hector Martin     2022-02-15  1136  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1137  
1e0399402ef5a6 Hector Martin     2022-02-15  1138  					panic_count: panic-count@2 {
1e0399402ef5a6 Hector Martin     2022-02-15  1139  						reg = <0x2 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1140  						bits = <4 4>;
1e0399402ef5a6 Hector Martin     2022-02-15  1141  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1142  
1e0399402ef5a6 Hector Martin     2022-02-15  1143  					boot_error_stage: boot-error-stage@3 {
1e0399402ef5a6 Hector Martin     2022-02-15  1144  						reg = <0x3 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1145  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1146  
1e0399402ef5a6 Hector Martin     2022-02-15  1147  					shutdown_flag: shutdown-flag@f {
1e0399402ef5a6 Hector Martin     2022-02-15  1148  						reg = <0xf 0x1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1149  						bits = <3 1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1150  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1151  				};
1e0399402ef5a6 Hector Martin     2022-02-15  1152  
1e0399402ef5a6 Hector Martin     2022-02-15  1153  				scrpad_nvmem@a000 {
1e0399402ef5a6 Hector Martin     2022-02-15  1154  					compatible = "apple,spmi-pmu-nvmem";
1e0399402ef5a6 Hector Martin     2022-02-15  1155  					reg = <0xa000 0x1000>;
1e0399402ef5a6 Hector Martin     2022-02-15  1156  					#address-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1157  					#size-cells = <1>;
1e0399402ef5a6 Hector Martin     2022-02-15  1158  
1e0399402ef5a6 Hector Martin     2022-02-15  1159  					fault_shadow: fault-shadow@67b {
1e0399402ef5a6 Hector Martin     2022-02-15  1160  						reg = <0x67b 0x10>;
1e0399402ef5a6 Hector Martin     2022-02-15  1161  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1162  
1e0399402ef5a6 Hector Martin     2022-02-15  1163  					socd: socd@b00 {
1e0399402ef5a6 Hector Martin     2022-02-15  1164  						reg = <0xb00 0x400>;
1e0399402ef5a6 Hector Martin     2022-02-15  1165  					};
1e0399402ef5a6 Hector Martin     2022-02-15  1166  				};
1e0399402ef5a6 Hector Martin     2022-02-15  1167  
1e0399402ef5a6 Hector Martin     2022-02-15  1168  			};
1e0399402ef5a6 Hector Martin     2022-02-15  1169  		};
1e0399402ef5a6 Hector Martin     2022-02-15  1170  
0a8282b831196b Mark Kettenis     2021-10-25  1171  		pinctrl_nub: pinctrl@23d1f0000 {
0a8282b831196b Mark Kettenis     2021-10-25  1172  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  1173  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
106ba3b48a35dd Hector Martin     2021-11-24  1174  			power-domains = <&ps_nub_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25  1175  
0a8282b831196b Mark Kettenis     2021-10-25  1176  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  1177  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1178  			gpio-ranges = <&pinctrl_nub 0 0 23>;
0a8282b831196b Mark Kettenis     2021-10-25  1179  			apple,npins = <23>;
0a8282b831196b Mark Kettenis     2021-10-25  1180  
0a8282b831196b Mark Kettenis     2021-10-25  1181  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  1182  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1183  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  1184  			interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1185  				     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1186  				     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1187  				     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1188  				     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1189  				     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1190  				     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  1191  		};
0a8282b831196b Mark Kettenis     2021-10-25  1192  
8adf987ce08275 Hector Martin     2021-12-12  1193  		pmgr_mini: power-management@23d280000 {
8adf987ce08275 Hector Martin     2021-12-12  1194  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
8adf987ce08275 Hector Martin     2021-12-12  1195  			#address-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12  1196  			#size-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12  1197  			reg = <0x2 0x3d280000 0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12  1198  		};
8adf987ce08275 Hector Martin     2021-12-12  1199  
b4d11106d751a4 Sven Peter        2021-12-11  1200  		wdt: watchdog@23d2b0000 {
b4d11106d751a4 Sven Peter        2021-12-11  1201  			compatible = "apple,t8103-wdt", "apple,wdt";
b4d11106d751a4 Sven Peter        2021-12-11  1202  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  1203  			clocks = <&clkref>;
b4d11106d751a4 Sven Peter        2021-12-11  1204  			interrupt-parent = <&aic>;
b4d11106d751a4 Sven Peter        2021-12-11  1205  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
b4d11106d751a4 Sven Peter        2021-12-11  1206  		};
b4d11106d751a4 Sven Peter        2021-12-11  1207  
27913c5f607fb0 Hector Martin     2022-02-04  1208  		smc_mbox: mbox@23e408000 {
27913c5f607fb0 Hector Martin     2022-02-04  1209  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
27913c5f607fb0 Hector Martin     2022-02-04  1210  			reg = <0x2 0x3e408000 0x0 0x4000>;
27913c5f607fb0 Hector Martin     2022-02-04  1211  			interrupt-parent = <&aic>;
27913c5f607fb0 Hector Martin     2022-02-04  1212  			interrupts = <AIC_IRQ 400 IRQ_TYPE_LEVEL_HIGH>,
27913c5f607fb0 Hector Martin     2022-02-04  1213  				<AIC_IRQ 401 IRQ_TYPE_LEVEL_HIGH>,
27913c5f607fb0 Hector Martin     2022-02-04  1214  				<AIC_IRQ 402 IRQ_TYPE_LEVEL_HIGH>,
27913c5f607fb0 Hector Martin     2022-02-04  1215  				<AIC_IRQ 403 IRQ_TYPE_LEVEL_HIGH>;
27913c5f607fb0 Hector Martin     2022-02-04  1216  			interrupt-names = "send-empty", "send-not-empty",
27913c5f607fb0 Hector Martin     2022-02-04  1217  				"recv-empty", "recv-not-empty";
27913c5f607fb0 Hector Martin     2022-02-04  1218  			#mbox-cells = <0>;
27913c5f607fb0 Hector Martin     2022-02-04  1219  		};
27913c5f607fb0 Hector Martin     2022-02-04  1220  
27913c5f607fb0 Hector Martin     2022-02-04  1221  		smc: smc@23e400000 {
27913c5f607fb0 Hector Martin     2022-02-04  1222  			compatible = "apple,t8103-smc", "apple,smc";
27913c5f607fb0 Hector Martin     2022-02-04  1223  			reg = <0x2 0x3e400000 0x0 0x4000>,
27913c5f607fb0 Hector Martin     2022-02-04  1224  				<0x2 0x3fe00000 0x0 0x100000>;
27913c5f607fb0 Hector Martin     2022-02-04  1225  			reg-names = "smc", "sram";
27913c5f607fb0 Hector Martin     2022-02-04  1226  			mboxes = <&smc_mbox>;
27913c5f607fb0 Hector Martin     2022-02-04  1227  
27913c5f607fb0 Hector Martin     2022-02-04  1228  			smc_gpio: gpio {
27913c5f607fb0 Hector Martin     2022-02-04  1229  				gpio-controller;
27913c5f607fb0 Hector Martin     2022-02-04  1230  				#gpio-cells = <2>;
27913c5f607fb0 Hector Martin     2022-02-04  1231  			};
1e0399402ef5a6 Hector Martin     2022-02-15  1232  
1e0399402ef5a6 Hector Martin     2022-02-15  1233  			smc_rtc: rtc {
1e0399402ef5a6 Hector Martin     2022-02-15  1234  				nvmem-cells = <&rtc_offset>;
1e0399402ef5a6 Hector Martin     2022-02-15  1235  				nvmem-cell-names = "rtc_offset";
1e0399402ef5a6 Hector Martin     2022-02-15  1236  			};
1e0399402ef5a6 Hector Martin     2022-02-15  1237  
1e0399402ef5a6 Hector Martin     2022-02-15  1238  			smc_reboot: reboot {
1e0399402ef5a6 Hector Martin     2022-02-15  1239  				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
1e0399402ef5a6 Hector Martin     2022-02-15  1240  					<&boot_error_count>, <&panic_count>, <&pm_setting>;
1e0399402ef5a6 Hector Martin     2022-02-15  1241  				nvmem-cell-names = "shutdown_flag", "boot_stage",
1e0399402ef5a6 Hector Martin     2022-02-15  1242  					"boot_error_count", "panic_count", "pm_setting";
1e0399402ef5a6 Hector Martin     2022-02-15  1243  			};
27913c5f607fb0 Hector Martin     2022-02-04  1244  		};
27913c5f607fb0 Hector Martin     2022-02-04  1245  
0a8282b831196b Mark Kettenis     2021-10-25  1246  		pinctrl_smc: pinctrl@23e820000 {
0a8282b831196b Mark Kettenis     2021-10-25  1247  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  1248  			reg = <0x2 0x3e820000 0x0 0x4000>;
0a8282b831196b Mark Kettenis     2021-10-25  1249  
0a8282b831196b Mark Kettenis     2021-10-25  1250  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  1251  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1252  			gpio-ranges = <&pinctrl_smc 0 0 16>;
0a8282b831196b Mark Kettenis     2021-10-25  1253  			apple,npins = <16>;
0a8282b831196b Mark Kettenis     2021-10-25  1254  
0a8282b831196b Mark Kettenis     2021-10-25  1255  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  1256  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  1257  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  1258  			interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1259  				     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1260  				     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1261  				     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1262  				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1263  				     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  1264  				     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  1265  		};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1266  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1267  		sep_dart: iommu@2412c0000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1268  			compatible = "apple,t8103-dart";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1269  			reg = <0x2 0x412c0000 0x0 0x4000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1270  			#iommu-cells = <1>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1271  			interrupt-parent = <&aic>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1272  			interrupts = <AIC_IRQ 259 IRQ_TYPE_LEVEL_HIGH>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1273  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1274  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1275  		sep: sep@242400000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1276  			compatible = "apple,sep";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1277  			reg = <0x2 0x42400000 0x0 0x6C000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1278  			mboxes = <&sep_mbox>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1279  			mbox-names = "mbox";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1280  			iommus = <&sep_dart 0>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1281  			status = "disabled";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1282  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1283  
b830d7177a9017 Sasha Finkelstein 2024-11-10  1284  		sep_mbox: mbox@242408000 {
b830d7177a9017 Sasha Finkelstein 2024-11-10  1285  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1286  			reg = <0x2 0x42408000 0x0 0x4000>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1287  			interrupt-parent = <&aic>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1288  			interrupts = <AIC_IRQ 253 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1289  				<AIC_IRQ 254 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1290  				<AIC_IRQ 255 IRQ_TYPE_LEVEL_HIGH>,
b830d7177a9017 Sasha Finkelstein 2024-11-10  1291  				<AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1292  			interrupt-names = "send-empty", "send-not-empty",
b830d7177a9017 Sasha Finkelstein 2024-11-10  1293  				"recv-empty", "recv-not-empty";
b830d7177a9017 Sasha Finkelstein 2024-11-10  1294  			#mbox-cells = <0>;
b830d7177a9017 Sasha Finkelstein 2024-11-10  1295  		};
b830d7177a9017 Sasha Finkelstein 2024-11-10  1296  
8adf987ce08275 Hector Martin     2021-12-12  1297  		pinctrl_aop: pinctrl@24a820000 {
8adf987ce08275 Hector Martin     2021-12-12  1298  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
8adf987ce08275 Hector Martin     2021-12-12  1299  			reg = <0x2 0x4a820000 0x0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12  1300  
8adf987ce08275 Hector Martin     2021-12-12  1301  			gpio-controller;
8adf987ce08275 Hector Martin     2021-12-12  1302  			#gpio-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12  1303  			gpio-ranges = <&pinctrl_aop 0 0 42>;
8adf987ce08275 Hector Martin     2021-12-12  1304  			apple,npins = <42>;
8adf987ce08275 Hector Martin     2021-12-12  1305  
8adf987ce08275 Hector Martin     2021-12-12  1306  			interrupt-controller;
8adf987ce08275 Hector Martin     2021-12-12  1307  			#interrupt-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12  1308  			interrupt-parent = <&aic>;
8adf987ce08275 Hector Martin     2021-12-12  1309  			interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1310  				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1311  				     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1312  				     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1313  				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1314  				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  1315  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
8adf987ce08275 Hector Martin     2021-12-12  1316  		};
8adf987ce08275 Hector Martin     2021-12-12  1317  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1318  		aop_mbox: mbox@24a408000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1319  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1320  			reg = <0x2 0x4a408000 0x0 0x4000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1321  			interrupt-parent = <&aic>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1322  			interrupts = <AIC_IRQ 285 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1323  				<AIC_IRQ 286 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1324  				<AIC_IRQ 287 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1325  				<AIC_IRQ 288 IRQ_TYPE_LEVEL_HIGH>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1326  			interrupt-names = "send-empty", "send-not-empty",
3418bd42eece5c Sasha Finkelstein 2024-11-09  1327  				"recv-empty", "recv-not-empty";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1328  			#mbox-cells = <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1329  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1330  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1331  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1332  		aop_dart: iommu@24a808000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1333  			compatible = "apple,t8103-dart";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1334  			reg = <0x2 0x4a808000 0x0 0x4000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1335  			#iommu-cells = <1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1336  			interrupt-parent = <&aic>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1337  			interrupts = <AIC_IRQ 300 IRQ_TYPE_LEVEL_HIGH>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1338  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1339  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1340  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1341  		aop_admac: dma-controller@24a980000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1342  			/*
3418bd42eece5c Sasha Finkelstein 2024-11-09  1343  			* Use "admac2" until commit "dmaengine: apple-admac:
3418bd42eece5c Sasha Finkelstein 2024-11-09  1344  			* Avoid accessing registers in probe" is long enough
3418bd42eece5c Sasha Finkelstein 2024-11-09  1345  			* upstream (not yet as of 2024-12-30)
3418bd42eece5c Sasha Finkelstein 2024-11-09  1346  			*/
3418bd42eece5c Sasha Finkelstein 2024-11-09  1347  			// compatible = "apple,t8103-admac", "apple,admac";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1348  			compatible = "apple,t8103-admac2", "apple,admac2";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1349  			reg = <0x2 0x4a980000 0x0 0x34000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1350  			#dma-cells = <1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1351  			dma-channels = <16>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1352  			interrupts-extended = <0>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1353  					      <0>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1354  					      <&aic AIC_IRQ 321 IRQ_TYPE_LEVEL_HIGH>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1355  					      <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1356  			iommus = <&aop_dart 7>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1357  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1358  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1359  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1360  		aop: aop@24ac00000 {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1361  			compatible = "apple,aop";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1362  			reg = <0x2 0x4ac00000 0x0 0x1e0000>,
3418bd42eece5c Sasha Finkelstein 2024-11-09  1363  			      <0x2 0x4a400000 0x0 0x6C000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1364  			mboxes = <&aop_mbox>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1365  			mbox-names = "mbox";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1366  			iommus = <&aop_dart 0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1367  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1368  			apple,aop-target = <1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1369  			apple,aop-alignment = <128>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1370  			status = "disabled";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1371  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1372  			aop_audio: audio {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1373  				dmas = <&aop_admac 1>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1374  				dma-names = "dma";
3418bd42eece5c Sasha Finkelstein 2024-11-09  1375  				apple,bytes-per-sample = <2>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1376  				apple,clock-source = <0x706c6c20>; // 'pll '
3418bd42eece5c Sasha Finkelstein 2024-11-09  1377  				apple,pdm-frequency = <2400000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1378  				apple,pdmc-frequency = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1379  				apple,slow-clock-speed = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1380  				apple,fast-clock-speed = <24000000>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1381  				apple,channel-polarity-select = <256>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1382  				apple,channel-phase-select = <0>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1383  				apple,mic-turn-on-time-ms = <20>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1384  				apple,mic-settle-time-ms = <50>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1385  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1386  				apple,filter-lengths = <0x542c47>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1387  				apple,decm-ratios = [0f 05 02];
3418bd42eece5c Sasha Finkelstein 2024-11-09  1388  				apple,decm-latency = <15>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1389  				apple,coefficients = <
3418bd42eece5c Sasha Finkelstein 2024-11-09  1390  					0x88030000 0x82080000 0x51120000 0x0a230000 0xce3d0000 0x97660000
3418bd42eece5c Sasha Finkelstein 2024-11-09  1391  					0x43a20000 0x9cf60000 0x536a0100 0xe6040200 0x7ece0200 0xaecf0300
3418bd42eece5c Sasha Finkelstein 2024-11-09  1392  					0x2e110500 0x7d9b0600 0x75760800 0xd8a80a00 0xd2370d00 0x82261000
3418bd42eece5c Sasha Finkelstein 2024-11-09  1393  					0x86751300 0x97221700 0x39281b00 0x897d1f00 0x2e162400 0x69e22800
3418bd42eece5c Sasha Finkelstein 2024-11-09  1394  					0x56cf2d00 0x51c73200 0x80b23700 0x87773c00 0x4cfc4000 0xd9264500
3418bd42eece5c Sasha Finkelstein 2024-11-09  1395  					0x47de4800 0xa00b4c00 0xc19a4e00 0x1f7b5000 0x68a05100 0x06035200
3418bd42eece5c Sasha Finkelstein 2024-11-09  1396  					0x4a250000 0x4caf0000 0xc0070200 0x45990400 0x9a840800 0x7d380d00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1397  					0x5f1a1100 0xd9811100 0x80440b00 0x8ee5fbff 0xca32e3ff 0x52c7c4ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1398  					0xa6bca8ff 0x83e69aff 0xb85ba8ff 0x6baedbff 0xe7d83800 0x2442ba00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1399  					0x33205001 0x6edce201 0x42235802 0x2c509902 0xcffaffff 0x530affff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1400  					0x6623fbff 0xa03ef4ff 0xe668f0ff 0xb835f7ff 0x56ec0400 0x37a30900
3418bd42eece5c Sasha Finkelstein 2024-11-09  1401  					0x00d4feff 0x78a3f5ff 0x03bffeff 0x84d50b00 0xbe0b0400 0x5254f2ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1402  					0x6d3ff8ff 0xc57f0f00 0xe69e0c00 0x7903efff 0xd533edff 0xecd11100
3418bd42eece5c Sasha Finkelstein 2024-11-09  1403  					0x7d691a00 0xd655eeff 0x8866dcff 0x57261000 0xc78d2e00 0x822ef3ff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1404  					0x6369c4ff 0xcd080700 0x35344b00 0xaf210200 0x83b6a1ff 0xe2d5efff
3418bd42eece5c Sasha Finkelstein 2024-11-09  1405  					0x949b7600 0xf3d72500 0xfffc67ff 0xe3acb6ff 0x521bcc00 0x3c8a8b00
3418bd42eece5c Sasha Finkelstein 2024-11-09  1406  					0x9f0ccdfe 0x5c68ccfe 0x4dc59802 0x82cffb06>;
3418bd42eece5c Sasha Finkelstein 2024-11-09  1407  			};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1408  
3418bd42eece5c Sasha Finkelstein 2024-11-09  1409  			aop_als: als {
3418bd42eece5c Sasha Finkelstein 2024-11-09  1410  				// intentionally empty
3418bd42eece5c Sasha Finkelstein 2024-11-09  1411  			};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1412  		};
3418bd42eece5c Sasha Finkelstein 2024-11-09  1413  
0ec238bb9b4d88 Janne Grunau      2022-09-30  1414  		dispext0_dart: iommu@271304000 {
0ec238bb9b4d88 Janne Grunau      2022-09-30  1415  			compatible = "apple,t8103-dart";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1416  			reg = <0x2 0x71304000 0x0 0x4000>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1417  			#iommu-cells = <1>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1418  			interrupt-parent = <&aic>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1419  			interrupts = <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1420  			power-domains = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1421  			status = "disabled";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1422  		};
0ec238bb9b4d88 Janne Grunau      2022-09-30  1423  
0ec238bb9b4d88 Janne Grunau      2022-09-30  1424  		dcpext_dart: iommu@27130c000 {
0ec238bb9b4d88 Janne Grunau      2022-09-30  1425  			compatible = "apple,t8103-dart";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1426  			reg = <0x2 0x7130c000 0x0 0x4000>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1427  			#iommu-cells = <1>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1428  			interrupt-parent = <&aic>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1429  			interrupts = <AIC_IRQ 481 IRQ_TYPE_LEVEL_HIGH>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1430  			power-domains = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1431  			status = "disabled";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1432  		};
0ec238bb9b4d88 Janne Grunau      2022-09-30  1433  
0ec238bb9b4d88 Janne Grunau      2022-09-30  1434  		dcpext_mbox: mbox@271c08000 {
0ec238bb9b4d88 Janne Grunau      2022-09-30  1435  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1436  			reg = <0x2 0x71c08000 0x0 0x4000>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1437  			interrupt-parent = <&aic>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1438  			interrupts = <AIC_IRQ 466 IRQ_TYPE_LEVEL_HIGH>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1439  			<AIC_IRQ 467 IRQ_TYPE_LEVEL_HIGH>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1440  			<AIC_IRQ 468 IRQ_TYPE_LEVEL_HIGH>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1441  			<AIC_IRQ 469 IRQ_TYPE_LEVEL_HIGH>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1442  			interrupt-names = "send-empty", "send-not-empty",
0ec238bb9b4d88 Janne Grunau      2022-09-30  1443  			"recv-empty", "recv-not-empty";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1444  			#mbox-cells = <0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1445  			power-domains = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1446  			resets = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1447  			status = "disabled";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1448  		};
0ec238bb9b4d88 Janne Grunau      2022-09-30  1449  
0ec238bb9b4d88 Janne Grunau      2022-09-30 @1450  		dcpext: dcp@271c00000 {
0ec238bb9b4d88 Janne Grunau      2022-09-30  1451  			compatible = "apple,t8103-dcpext", "apple,dcpext";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1452  			mboxes = <&dcpext_mbox>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1453  			mbox-names = "mbox";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1454  			iommus = <&dcpext_dart 0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1455  			phandle = <&dcpext>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1456  
0ec238bb9b4d88 Janne Grunau      2022-09-30  1457  			reg-names = "coproc", "disp-0", "disp-1", "disp-2",
0ec238bb9b4d88 Janne Grunau      2022-09-30  1458  			"disp-3", "disp-4";
0ec238bb9b4d88 Janne Grunau      2022-09-30  1459  			reg = <0x2 0x71c00000 0x0 0x4000>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1460  			      <0x2 0x70000000 0x0 0x118000>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1461  			      <0x2 0x71320000 0x0 0x4000>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1462  			      <0x2 0x71344000 0x0 0x4000>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1463  			      <0x2 0x71800000 0x0 0x800000>,
0ec238bb9b4d88 Janne Grunau      2022-09-30  1464  			      <0x2 0x3b3d0000 0x0 0x4000>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1465  			apple,bw-scratch = <&pmgr_dcp 0 5 0x18>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1466  			apple,bw-doorbell = <&pmgr_dcp 1 6>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1467  			power-domains = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1468  			resets = <&ps_dispext_cpu0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1469  			clocks = <&clk_dispext0>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1470  			apple,asc-dram-mask = <0xf 0x00000000>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1471  			status = "disabled";
7b42205ea9f196 Janne Grunau      2025-02-09  1472  			// required bus properties for 'piodma' subdevice
7b42205ea9f196 Janne Grunau      2025-02-09  1473  			#address-cells = <2>;
7b42205ea9f196 Janne Grunau      2025-02-09  1474  			#size-cells = <2>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1475  
0ec238bb9b4d88 Janne Grunau      2022-09-30  1476  			piodma {
0ec238bb9b4d88 Janne Grunau      2022-09-30  1477  				iommus = <&dispext0_dart 4>;
0ec238bb9b4d88 Janne Grunau      2022-09-30  1478  			};
94dd85b5237c66 Martin Povišer    2022-11-28  1479  
94dd85b5237c66 Martin Povišer    2022-11-28  1480  			ports {
94dd85b5237c66 Martin Povišer    2022-11-28  1481  				#address-cells = <1>;
94dd85b5237c66 Martin Povišer    2022-11-28  1482  				#size-cells = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28  1483  				port@0 {
94dd85b5237c66 Martin Povišer    2022-11-28  1484  					reg = <0>;
94dd85b5237c66 Martin Povišer    2022-11-28  1485  					dcpext_audio: endpoint {
94dd85b5237c66 Martin Povišer    2022-11-28  1486  						remote-endpoint = <&dpaudio1_dcp>;
94dd85b5237c66 Martin Povišer    2022-11-28  1487  					};
94dd85b5237c66 Martin Povišer    2022-11-28  1488  				};
94dd85b5237c66 Martin Povišer    2022-11-28  1489  			};
0ec238bb9b4d88 Janne Grunau      2022-09-30  1490  		};
0ec238bb9b4d88 Janne Grunau      2022-09-30  1491  
5316d73ba81b5d Sven Peter        2022-06-02  1492  		ans_mbox: mbox@277408000 {
5316d73ba81b5d Sven Peter        2022-06-02  1493  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
5316d73ba81b5d Sven Peter        2022-06-02  1494  			reg = <0x2 0x77408000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02  1495  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02  1496  			interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  1497  				<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  1498  				<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  1499  				<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02  1500  			interrupt-names = "send-empty", "send-not-empty",
5316d73ba81b5d Sven Peter        2022-06-02  1501  				"recv-empty", "recv-not-empty";
5316d73ba81b5d Sven Peter        2022-06-02  1502  			#mbox-cells = <0>;
5316d73ba81b5d Sven Peter        2022-06-02  1503  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  1504  		};
5316d73ba81b5d Sven Peter        2022-06-02  1505  
5316d73ba81b5d Sven Peter        2022-06-02  1506  		sart: iommu@27bc50000 {
5316d73ba81b5d Sven Peter        2022-06-02  1507  			compatible = "apple,t8103-sart";
5316d73ba81b5d Sven Peter        2022-06-02  1508  			reg = <0x2 0x7bc50000 0x0 0x10000>;
5316d73ba81b5d Sven Peter        2022-06-02  1509  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  1510  		};
5316d73ba81b5d Sven Peter        2022-06-02  1511  
5316d73ba81b5d Sven Peter        2022-06-02  1512  		nvme@27bcc0000 {
5316d73ba81b5d Sven Peter        2022-06-02  1513  			compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
5316d73ba81b5d Sven Peter        2022-06-02  1514  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
5316d73ba81b5d Sven Peter        2022-06-02  1515  				<0x2 0x77400000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02  1516  			reg-names = "nvme", "ans";
5316d73ba81b5d Sven Peter        2022-06-02  1517  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02  1518  			interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02  1519  			mboxes = <&ans_mbox>;
5316d73ba81b5d Sven Peter        2022-06-02  1520  			apple,sart = <&sart>;
5316d73ba81b5d Sven Peter        2022-06-02  1521  			power-domains = <&ps_ans2>, <&ps_apcie_st>;
5316d73ba81b5d Sven Peter        2022-06-02  1522  			power-domain-names = "ans", "apcie0";
5316d73ba81b5d Sven Peter        2022-06-02  1523  			resets = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  1524  		};
5316d73ba81b5d Sven Peter        2022-06-02  1525  
a7ea0dc7a1c22a Sven Peter        2022-11-15  1526  		efuse@23d2bc000 {
a7ea0dc7a1c22a Sven Peter        2022-11-15  1527  			compatible = "apple,t8103-efuses", "apple,efuses";
a7ea0dc7a1c22a Sven Peter        2022-11-15  1528  			reg = <0x2 0x3d2bc000 0x0 0x1000>;
a7ea0dc7a1c22a Sven Peter        2022-11-15  1529  			#address-cells = <1>;
a7ea0dc7a1c22a Sven Peter        2022-11-15  1530  			#size-cells = <1>;
3f47162ee42783 Sven Peter        2022-11-30  1531  			atcphy0_auspll_rodco_bias_adjust: efuse@430,26 {
3f47162ee42783 Sven Peter        2022-11-30  1532  				reg = <0x430 4>;
3f47162ee42783 Sven Peter        2022-11-30  1533  				bits = <26 3>;
3f47162ee42783 Sven Peter        2022-11-30  1534  			};
3f47162ee42783 Sven Peter        2022-11-30  1535  
3f47162ee42783 Sven Peter        2022-11-30  1536  			atcphy0_auspll_rodco_encap: efuse@430,29 {
3f47162ee42783 Sven Peter        2022-11-30  1537  				reg = <0x430 4>;
3f47162ee42783 Sven Peter        2022-11-30  1538  				bits = <29 2>;
3f47162ee42783 Sven Peter        2022-11-30  1539  			};
3f47162ee42783 Sven Peter        2022-11-30  1540  
3f47162ee42783 Sven Peter        2022-11-30  1541  			atcphy0_auspll_dtc_vreg_adjust: efuse@430,31 {
3f47162ee42783 Sven Peter        2022-11-30  1542  				reg = <0x430 8>;
3f47162ee42783 Sven Peter        2022-11-30  1543  				bits = <31 3>;
3f47162ee42783 Sven Peter        2022-11-30  1544  			};
3f47162ee42783 Sven Peter        2022-11-30  1545  
3f47162ee42783 Sven Peter        2022-11-30  1546  			atcphy0_auspll_fracn_dll_start_capcode: efuse@434,2 {
3f47162ee42783 Sven Peter        2022-11-30  1547  				reg = <0x434 4>;
3f47162ee42783 Sven Peter        2022-11-30  1548  				bits = <2 2>;
3f47162ee42783 Sven Peter        2022-11-30  1549  			};
3f47162ee42783 Sven Peter        2022-11-30  1550  
3f47162ee42783 Sven Peter        2022-11-30  1551  			atcphy0_aus_cmn_shm_vreg_trim: efuse@434,4 {
3f47162ee42783 Sven Peter        2022-11-30  1552  				reg = <0x434 4>;
3f47162ee42783 Sven Peter        2022-11-30  1553  				bits = <4 5>;
3f47162ee42783 Sven Peter        2022-11-30  1554  			};
3f47162ee42783 Sven Peter        2022-11-30  1555  
3f47162ee42783 Sven Peter        2022-11-30  1556  			atcphy0_cio3pll_dco_coarsebin0: efuse@434,9 {
3f47162ee42783 Sven Peter        2022-11-30  1557  				reg = <0x434 4>;
3f47162ee42783 Sven Peter        2022-11-30  1558  				bits = <9 6>;
3f47162ee42783 Sven Peter        2022-11-30  1559  			};
3f47162ee42783 Sven Peter        2022-11-30  1560  
3f47162ee42783 Sven Peter        2022-11-30  1561  			atcphy0_cio3pll_dco_coarsebin1: efuse@434,15 {
3f47162ee42783 Sven Peter        2022-11-30  1562  				reg = <0x434 4>;
3f47162ee42783 Sven Peter        2022-11-30  1563  				bits = <15 6>;
3f47162ee42783 Sven Peter        2022-11-30  1564  			};
3f47162ee42783 Sven Peter        2022-11-30  1565  
3f47162ee42783 Sven Peter        2022-11-30  1566  			atcphy0_cio3pll_dll_start_capcode: efuse@434,21 {
3f47162ee42783 Sven Peter        2022-11-30  1567  				reg = <0x434 4>;
3f47162ee42783 Sven Peter        2022-11-30  1568  				bits = <21 2>;
3f47162ee42783 Sven Peter        2022-11-30  1569  			};
3f47162ee42783 Sven Peter        2022-11-30  1570  
3f47162ee42783 Sven Peter        2022-11-30  1571  			atcphy0_cio3pll_dtc_vreg_adjust: efuse@434,23 {
3f47162ee42783 Sven Peter        2022-11-30  1572  				reg = <0x434 0x4>;
3f47162ee42783 Sven Peter        2022-11-30  1573  				bits = <23 3>;
3f47162ee42783 Sven Peter        2022-11-30  1574  			};
3f47162ee42783 Sven Peter        2022-11-30  1575  
3f47162ee42783 Sven Peter        2022-11-30  1576  			atcphy1_auspll_rodco_bias_adjust: efuse@438,4 {
3f47162ee42783 Sven Peter        2022-11-30  1577  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1578  				bits = <4 3>;
3f47162ee42783 Sven Peter        2022-11-30  1579  			};
3f47162ee42783 Sven Peter        2022-11-30  1580  
3f47162ee42783 Sven Peter        2022-11-30  1581  			atcphy1_auspll_rodco_encap: efuse@438,7 {
3f47162ee42783 Sven Peter        2022-11-30  1582  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1583  				bits = <7 2>;
3f47162ee42783 Sven Peter        2022-11-30  1584  			};
3f47162ee42783 Sven Peter        2022-11-30  1585  
3f47162ee42783 Sven Peter        2022-11-30  1586  			atcphy1_auspll_dtc_vreg_adjust: efuse@438,9 {
3f47162ee42783 Sven Peter        2022-11-30  1587  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1588  				bits = <9 3>;
3f47162ee42783 Sven Peter        2022-11-30  1589  			};
3f47162ee42783 Sven Peter        2022-11-30  1590  
3f47162ee42783 Sven Peter        2022-11-30  1591  			atcphy1_auspll_fracn_dll_start_capcode: efuse@438,12 {
3f47162ee42783 Sven Peter        2022-11-30  1592  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1593  				bits = <12 2>;
3f47162ee42783 Sven Peter        2022-11-30  1594  			};
3f47162ee42783 Sven Peter        2022-11-30  1595  
3f47162ee42783 Sven Peter        2022-11-30  1596  			atcphy1_aus_cmn_shm_vreg_trim: efuse@438,14 {
3f47162ee42783 Sven Peter        2022-11-30  1597  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1598  				bits = <14 5>;
3f47162ee42783 Sven Peter        2022-11-30  1599  			};
3f47162ee42783 Sven Peter        2022-11-30  1600  
3f47162ee42783 Sven Peter        2022-11-30  1601  			atcphy1_cio3pll_dco_coarsebin0: efuse@438,19 {
3f47162ee42783 Sven Peter        2022-11-30  1602  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1603  				bits = <19 6>;
3f47162ee42783 Sven Peter        2022-11-30  1604  			};
3f47162ee42783 Sven Peter        2022-11-30  1605  
3f47162ee42783 Sven Peter        2022-11-30  1606  			atcphy1_cio3pll_dco_coarsebin1: efuse@438,25 {
3f47162ee42783 Sven Peter        2022-11-30  1607  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1608  				bits = <25 6>;
3f47162ee42783 Sven Peter        2022-11-30  1609  			};
3f47162ee42783 Sven Peter        2022-11-30  1610  
3f47162ee42783 Sven Peter        2022-11-30  1611  			atcphy1_cio3pll_dll_start_capcode: efuse@438,31 {
3f47162ee42783 Sven Peter        2022-11-30  1612  				reg = <0x438 4>;
3f47162ee42783 Sven Peter        2022-11-30  1613  				bits = <31 1>;
3f47162ee42783 Sven Peter        2022-11-30  1614  			};
3f47162ee42783 Sven Peter        2022-11-30  1615  
3f47162ee42783 Sven Peter        2022-11-30  1616  			atcphy1_cio3pll_dll_start_capcode_workaround: efuse@43c,0 {
3f47162ee42783 Sven Peter        2022-11-30  1617  				reg = <0x43c 0x4>;
3f47162ee42783 Sven Peter        2022-11-30  1618  				bits = <0 1>;
3f47162ee42783 Sven Peter        2022-11-30  1619  			};
3f47162ee42783 Sven Peter        2022-11-30  1620  
3f47162ee42783 Sven Peter        2022-11-30  1621  			atcphy1_cio3pll_dtc_vreg_adjust: efuse@43c,1 {
3f47162ee42783 Sven Peter        2022-11-30  1622  				reg = <0x43c 0x4>;
3f47162ee42783 Sven Peter        2022-11-30  1623  				bits = <1 3>;
3f47162ee42783 Sven Peter        2022-11-30  1624  			};
a7ea0dc7a1c22a Sven Peter        2022-11-15  1625  		};
a7ea0dc7a1c22a Sven Peter        2022-11-15  1626  
948ea8a7b2bd56 Hector Martin     2021-11-26  1627  		dwc3_0: usb@382280000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1628  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
948ea8a7b2bd56 Hector Martin     2021-11-26  1629  			reg = <0x3 0x82280000 0x0 0x100000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1630  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1631  			interrupts = <AIC_IRQ 777 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1632  			dr_mode = "otg";
948ea8a7b2bd56 Hector Martin     2021-11-26  1633  			usb-role-switch;
948ea8a7b2bd56 Hector Martin     2021-11-26  1634  			role-switch-default-mode = "host";
948ea8a7b2bd56 Hector Martin     2021-11-26  1635  			iommus = <&dwc3_0_dart_0 0>, <&dwc3_0_dart_1 1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1636  			power-domains = <&ps_atc0_usb>;
3f47162ee42783 Sven Peter        2022-11-30  1637  			resets = <&atcphy0>;
3f47162ee42783 Sven Peter        2022-11-30  1638  			phys = <&atcphy0 PHY_TYPE_USB2>, <&atcphy0 PHY_TYPE_USB3>;
3f47162ee42783 Sven Peter        2022-11-30  1639  			phy-names = "usb2-phy", "usb3-phy";
948ea8a7b2bd56 Hector Martin     2021-11-26  1640  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1641  
948ea8a7b2bd56 Hector Martin     2021-11-26  1642  		dwc3_0_dart_0: iommu@382f00000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1643  			compatible = "apple,t8103-dart";
948ea8a7b2bd56 Hector Martin     2021-11-26  1644  			reg = <0x3 0x82f00000 0x0 0x4000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1645  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1646  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1647  			#iommu-cells = <1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1648  			power-domains = <&ps_atc0_usb>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1649  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1650  
948ea8a7b2bd56 Hector Martin     2021-11-26  1651  		dwc3_0_dart_1: iommu@382f80000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1652  			compatible = "apple,t8103-dart";
948ea8a7b2bd56 Hector Martin     2021-11-26  1653  			reg = <0x3 0x82f80000 0x0 0x4000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1654  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1655  			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1656  			#iommu-cells = <1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1657  			power-domains = <&ps_atc0_usb>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1658  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1659  
3f47162ee42783 Sven Peter        2022-11-30  1660  		atcphy0: phy@383000000 {
3f47162ee42783 Sven Peter        2022-11-30  1661  			compatible = "apple,t8103-atcphy";
3f47162ee42783 Sven Peter        2022-11-30  1662  			reg = <0x3 0x83000000 0x0 0x4c000>,
3f47162ee42783 Sven Peter        2022-11-30  1663  				<0x3 0x83050000 0x0 0x8000>,
3f47162ee42783 Sven Peter        2022-11-30  1664  				<0x3 0x80000000 0x0 0x4000>,
3f47162ee42783 Sven Peter        2022-11-30  1665  				<0x3 0x82a90000 0x0 0x4000>,
3f47162ee42783 Sven Peter        2022-11-30  1666  				<0x3 0x82a84000 0x0 0x4000>;
3f47162ee42783 Sven Peter        2022-11-30  1667  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
3f47162ee42783 Sven Peter        2022-11-30  1668  				"pipehandler";
3f47162ee42783 Sven Peter        2022-11-30  1669  
3f47162ee42783 Sven Peter        2022-11-30  1670  			#phy-cells = <1>;
3f47162ee42783 Sven Peter        2022-11-30  1671  			#reset-cells = <0>;
3f47162ee42783 Sven Peter        2022-11-30  1672  
3f47162ee42783 Sven Peter        2022-11-30  1673  			nvmem-cells = <&atcphy0_aus_cmn_shm_vreg_trim>,
3f47162ee42783 Sven Peter        2022-11-30  1674  				<&atcphy0_auspll_rodco_encap>,
3f47162ee42783 Sven Peter        2022-11-30  1675  				<&atcphy0_auspll_rodco_bias_adjust>,
3f47162ee42783 Sven Peter        2022-11-30  1676  				<&atcphy0_auspll_fracn_dll_start_capcode>,
3f47162ee42783 Sven Peter        2022-11-30  1677  				<&atcphy0_auspll_dtc_vreg_adjust>,
3f47162ee42783 Sven Peter        2022-11-30  1678  				<&atcphy0_cio3pll_dco_coarsebin0>,
3f47162ee42783 Sven Peter        2022-11-30  1679  				<&atcphy0_cio3pll_dco_coarsebin1>,
3f47162ee42783 Sven Peter        2022-11-30  1680  				<&atcphy0_cio3pll_dll_start_capcode>,
3f47162ee42783 Sven Peter        2022-11-30  1681  				<&atcphy0_cio3pll_dtc_vreg_adjust>;
3f47162ee42783 Sven Peter        2022-11-30  1682  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
3f47162ee42783 Sven Peter        2022-11-30  1683  				"auspll_rodco_encap",
3f47162ee42783 Sven Peter        2022-11-30  1684  				"auspll_rodco_bias_adjust",
3f47162ee42783 Sven Peter        2022-11-30  1685  				"auspll_fracn_dll_start_capcode",
3f47162ee42783 Sven Peter        2022-11-30  1686  				"auspll_dtc_vreg_adjust",
3f47162ee42783 Sven Peter        2022-11-30  1687  				"cio3pll_dco_coarsebin0",
3f47162ee42783 Sven Peter        2022-11-30  1688  				"cio3pll_dco_coarsebin1",
3f47162ee42783 Sven Peter        2022-11-30  1689  				"cio3pll_dll_start_capcode",
3f47162ee42783 Sven Peter        2022-11-30  1690  				"cio3pll_dtc_vreg_adjust";
3f47162ee42783 Sven Peter        2022-11-30  1691  
3f47162ee42783 Sven Peter        2022-11-30  1692  			orientation-switch;
3f47162ee42783 Sven Peter        2022-11-30  1693  			mode-switch;
3f47162ee42783 Sven Peter        2022-11-30  1694  			svid = <0xff01>, <0x8087>;
3f47162ee42783 Sven Peter        2022-11-30  1695  			power-domains = <&ps_atc0_usb>;
3f47162ee42783 Sven Peter        2022-11-30  1696  		};
3f47162ee42783 Sven Peter        2022-11-30  1697  
948ea8a7b2bd56 Hector Martin     2021-11-26  1698  		dwc3_1: usb@502280000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1699  			compatible = "apple,t8103-dwc3", "apple,dwc3", "snps,dwc3";
948ea8a7b2bd56 Hector Martin     2021-11-26  1700  			reg = <0x5 0x02280000 0x0 0x100000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1701  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1702  			interrupts = <AIC_IRQ 857 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1703  			dr_mode = "otg";
948ea8a7b2bd56 Hector Martin     2021-11-26  1704  			usb-role-switch;
948ea8a7b2bd56 Hector Martin     2021-11-26  1705  			role-switch-default-mode = "host";
948ea8a7b2bd56 Hector Martin     2021-11-26  1706  			iommus = <&dwc3_1_dart_0 0>, <&dwc3_1_dart_1 1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1707  			power-domains = <&ps_atc1_usb>;
3f47162ee42783 Sven Peter        2022-11-30  1708  			resets = <&atcphy1>;
3f47162ee42783 Sven Peter        2022-11-30  1709  			phys = <&atcphy1 PHY_TYPE_USB2>, <&atcphy1 PHY_TYPE_USB3>;
3f47162ee42783 Sven Peter        2022-11-30  1710  			phy-names = "usb2-phy", "usb3-phy";
948ea8a7b2bd56 Hector Martin     2021-11-26  1711  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1712  
948ea8a7b2bd56 Hector Martin     2021-11-26  1713  		dwc3_1_dart_0: iommu@502f00000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1714  			compatible = "apple,t8103-dart";
948ea8a7b2bd56 Hector Martin     2021-11-26  1715  			reg = <0x5 0x02f00000 0x0 0x4000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1716  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1717  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1718  			#iommu-cells = <1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1719  			power-domains = <&ps_atc1_usb>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1720  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1721  
948ea8a7b2bd56 Hector Martin     2021-11-26  1722  		dwc3_1_dart_1: iommu@502f80000 {
948ea8a7b2bd56 Hector Martin     2021-11-26  1723  			compatible = "apple,t8103-dart";
948ea8a7b2bd56 Hector Martin     2021-11-26  1724  			reg = <0x5 0x02f80000 0x0 0x4000>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1725  			interrupt-parent = <&aic>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1726  			interrupts = <AIC_IRQ 861 IRQ_TYPE_LEVEL_HIGH>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1727  			#iommu-cells = <1>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1728  			power-domains = <&ps_atc1_usb>;
948ea8a7b2bd56 Hector Martin     2021-11-26  1729  		};
948ea8a7b2bd56 Hector Martin     2021-11-26  1730  
3f47162ee42783 Sven Peter        2022-11-30  1731  		atcphy1: phy@503000000 {
3f47162ee42783 Sven Peter        2022-11-30  1732  			compatible = "apple,t8103-atcphy";
3f47162ee42783 Sven Peter        2022-11-30  1733  			reg = <0x5 0x03000000 0x0 0x4c000>,
3f47162ee42783 Sven Peter        2022-11-30  1734  				<0x5 0x03050000 0x0 0x8000>,
3f47162ee42783 Sven Peter        2022-11-30  1735  				<0x5 0x0 0x0 0x4000>,
3f47162ee42783 Sven Peter        2022-11-30  1736  				<0x5 0x02a90000 0x0 0x4000>,
3f47162ee42783 Sven Peter        2022-11-30  1737  				<0x5 0x02a84000 0x0 0x4000>;
3f47162ee42783 Sven Peter        2022-11-30  1738  			reg-names = "core", "lpdptx", "axi2af", "usb2phy",
3f47162ee42783 Sven Peter        2022-11-30  1739  				"pipehandler";
3f47162ee42783 Sven Peter        2022-11-30  1740  
3f47162ee42783 Sven Peter        2022-11-30  1741  			nvmem-cells = <&atcphy1_aus_cmn_shm_vreg_trim>,
3f47162ee42783 Sven Peter        2022-11-30  1742  				<&atcphy1_auspll_rodco_encap>,
3f47162ee42783 Sven Peter        2022-11-30  1743  				<&atcphy1_auspll_rodco_bias_adjust>,
3f47162ee42783 Sven Peter        2022-11-30  1744  				<&atcphy1_auspll_fracn_dll_start_capcode>,
3f47162ee42783 Sven Peter        2022-11-30  1745  				<&atcphy1_auspll_dtc_vreg_adjust>,
3f47162ee42783 Sven Peter        2022-11-30  1746  				<&atcphy1_cio3pll_dco_coarsebin0>,
3f47162ee42783 Sven Peter        2022-11-30  1747  				<&atcphy1_cio3pll_dco_coarsebin1>,
3f47162ee42783 Sven Peter        2022-11-30  1748  				<&atcphy1_cio3pll_dll_start_capcode>,
3f47162ee42783 Sven Peter        2022-11-30  1749  				<&atcphy1_cio3pll_dtc_vreg_adjust>,
3f47162ee42783 Sven Peter        2022-11-30  1750  				<&atcphy1_cio3pll_dll_start_capcode_workaround>;
3f47162ee42783 Sven Peter        2022-11-30  1751  			nvmem-cell-names =  "aus_cmn_shm_vreg_trim",
3f47162ee42783 Sven Peter        2022-11-30  1752  				"auspll_rodco_encap",
3f47162ee42783 Sven Peter        2022-11-30  1753  				"auspll_rodco_bias_adjust",
3f47162ee42783 Sven Peter        2022-11-30  1754  				"auspll_fracn_dll_start_capcode",
3f47162ee42783 Sven Peter        2022-11-30  1755  				"auspll_dtc_vreg_adjust",
3f47162ee42783 Sven Peter        2022-11-30  1756  				"cio3pll_dco_coarsebin0",
3f47162ee42783 Sven Peter        2022-11-30  1757  				"cio3pll_dco_coarsebin1",
3f47162ee42783 Sven Peter        2022-11-30  1758  				"cio3pll_dll_start_capcode",
3f47162ee42783 Sven Peter        2022-11-30  1759  				"cio3pll_dtc_vreg_adjust",
3f47162ee42783 Sven Peter        2022-11-30  1760  				"cio3pll_dll_start_capcode_workaround";
3f47162ee42783 Sven Peter        2022-11-30  1761  
3f47162ee42783 Sven Peter        2022-11-30  1762  			#phy-cells = <1>;
3f47162ee42783 Sven Peter        2022-11-30  1763  			#reset-cells = <0>;
3f47162ee42783 Sven Peter        2022-11-30  1764  
3f47162ee42783 Sven Peter        2022-11-30  1765  			orientation-switch;
3f47162ee42783 Sven Peter        2022-11-30  1766  			mode-switch;
3f47162ee42783 Sven Peter        2022-11-30  1767  			svid = <0xff01>, <0x8087>;
3f47162ee42783 Sven Peter        2022-11-30  1768  			power-domains = <&ps_atc1_usb>;
3f47162ee42783 Sven Peter        2022-11-30  1769  		};
3f47162ee42783 Sven Peter        2022-11-30  1770  
56d32c51dffac8 Janne Grunau      2022-12-06  1771  		pcie0_dart_0: iommu@681008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  1772  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  1773  			reg = <0x6 0x81008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  1774  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  1775  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  1776  			interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  1777  			power-domains = <&ps_apcie_gp>;
3c866bb79577ed Marc Zyngier      2021-10-25  1778  		};
3c866bb79577ed Marc Zyngier      2021-10-25  1779  
56d32c51dffac8 Janne Grunau      2022-12-06  1780  		pcie0_dart_1: iommu@682008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  1781  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  1782  			reg = <0x6 0x82008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  1783  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  1784  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  1785  			interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  1786  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14  1787  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25  1788  		};
3c866bb79577ed Marc Zyngier      2021-10-25  1789  
56d32c51dffac8 Janne Grunau      2022-12-06  1790  		pcie0_dart_2: iommu@683008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  1791  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  1792  			reg = <0x6 0x83008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  1793  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  1794  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  1795  			interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  1796  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14  1797  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25  1798  		};
3c866bb79577ed Marc Zyngier      2021-10-25  1799  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1800  		pcie0: pcie@690000000 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1801  			compatible = "apple,t8103-pcie", "apple,pcie";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1802  			device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1803  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1804  			reg = <0x6 0x90000000 0x0 0x1000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1805  			      <0x6 0x80000000 0x0 0x100000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1806  			      <0x6 0x81000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1807  			      <0x6 0x82000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1808  			      <0x6 0x83000000 0x0 0x4000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1809  			reg-names = "config", "rc", "port0", "port1", "port2";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1810  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1811  			interrupt-parent = <&aic>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1812  			interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1813  				     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1814  				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1815  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1816  			msi-controller;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1817  			msi-parent = <&pcie0>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1818  			msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1819  
3c866bb79577ed Marc Zyngier      2021-10-25  1820  
3c866bb79577ed Marc Zyngier      2021-10-25  1821  			iommu-map = <0x100 &pcie0_dart_0 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25  1822  				    <0x200 &pcie0_dart_1 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25  1823  				    <0x300 &pcie0_dart_2 1 1>;
3c866bb79577ed Marc Zyngier      2021-10-25  1824  			iommu-map-mask = <0xff00>;
3c866bb79577ed Marc Zyngier      2021-10-25  1825  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1826  			bus-range = <0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1827  			#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1828  			#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1829  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1830  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1831  
106ba3b48a35dd Hector Martin     2021-11-24  1832  			power-domains = <&ps_apcie_gp>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1833  			pinctrl-0 = <&pcie_pins>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1834  			pinctrl-names = "default";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1835  
128888a6fdb695 Marc Zyngier      2021-10-25  1836  			port00: pci@0,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1837  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1838  				reg = <0x0 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  1839  				reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1840  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1841  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1842  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1843  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  1844  
128888a6fdb695 Marc Zyngier      2021-10-25  1845  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  1846  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  1847  
128888a6fdb695 Marc Zyngier      2021-10-25  1848  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1849  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1850  						<0 0 0 2 &port00 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1851  						<0 0 0 3 &port00 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1852  						<0 0 0 4 &port00 0 0 0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1853  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1854  
128888a6fdb695 Marc Zyngier      2021-10-25  1855  			port01: pci@1,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1856  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1857  				reg = <0x800 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  1858  				reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1859  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1860  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1861  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1862  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  1863  
128888a6fdb695 Marc Zyngier      2021-10-25  1864  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  1865  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  1866  
128888a6fdb695 Marc Zyngier      2021-10-25  1867  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1868  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1869  						<0 0 0 2 &port01 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1870  						<0 0 0 3 &port01 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1871  						<0 0 0 4 &port01 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  1872  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1873  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1874  
128888a6fdb695 Marc Zyngier      2021-10-25  1875  			port02: pci@2,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1876  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1877  				reg = <0x1000 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  1878  				reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1879  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1880  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1881  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1882  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  1883  
128888a6fdb695 Marc Zyngier      2021-10-25  1884  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  1885  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  1886  
128888a6fdb695 Marc Zyngier      2021-10-25  1887  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  1888  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  1889  						<0 0 0 2 &port02 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  1890  						<0 0 0 3 &port02 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  1891  						<0 0 0 4 &port02 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  1892  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1893  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  1894  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  1895  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  1896  };
106ba3b48a35dd Hector Martin     2021-11-24  1897  

:::::: The code at line 1450 was first introduced by commit
:::::: 0ec238bb9b4d88bad0250a98e9f263cf9f22bea7 arm64: dts: apple: t8103: Add dcpext/dispext0 nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
