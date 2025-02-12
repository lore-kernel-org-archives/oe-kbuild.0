Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C7202F9D
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 22:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739397834; cv=none; b=aq9ZaFehgdJCOXnM05PRRp87Iduyzflwwj+CzJKqe3J8gOedtVh4MW3NWntxJcVzNfiP2Pb1heTo5ZKkygaUkkw6r2EK0nnHGoYXo4afkzlqoLjQSqEf7bao4CjlSTbCYgK+vtZ3avmQvaBOytg2Xe4kfMPykRD8Hov2QgRRobM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739397834; c=relaxed/simple;
	bh=mySgrLJbfnkCywnqfqCJwfiNzf+xlb5LNG9VDmNUMlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n9xWax6LefihOrCmh7djdxJyaJpaCeJdis+rkh3RAB/i8r/vho0Oxp67IDTsgSY0XmqnntP8LmWFRySomBQLMNIN2Y6vGwmvMwi2+L7TCZaGUi475qEC9voP4eu2pE1imPm7rrsNwosOyjBWpzxv+HKXnjq7z3G6lzAr0aiY22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReU3lrrx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReU3lrrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739397831; x=1770933831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mySgrLJbfnkCywnqfqCJwfiNzf+xlb5LNG9VDmNUMlk=;
  b=ReU3lrrxz7hmxxyB1rUyVDlUISrrudJ4ZwsssgtFbYszerzwuu5hrK1Z
   5LuUglG26TxTtz68JJLWcbJJ0n0KWTLiMu0kG0kcDAsH0YsTK0FaRHv/8
   5P31fEbO0t54fhKokwpJkPUsyreic4tLIjxezoLYNzDJy4dxSFkEozIf5
   2EoBq7VyS7ZW99+OQ2C5ZYyVNVJmmmJHSZGNDN0Q563QM2/V9TIVyGv6L
   JM6gzB7JQgxA3CrxHANNpkcMUp1MZ6THhjifG2PKvlFtlGBYQKcNWLlFx
   UbwXLYNh5NjDZJXXKNBNDtPdwUR237AKxXSo/rdKIHayKXF8R8/Gj0y51
   Q==;
X-CSE-ConnectionGUID: R5zwhwb0Ql2++H/UEZqrow==
X-CSE-MsgGUID: 8pIIERdtTs+vd/JN3DpZig==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39263993"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; 
   d="scan'208";a="39263993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 14:03:50 -0800
X-CSE-ConnectionGUID: IAqUY79xTuOcudfqD+q6aw==
X-CSE-MsgGUID: Nobv3ZKlQzKgn8thiY9fMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136206699"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Feb 2025 14:03:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiKpe-0016BP-2W;
	Wed, 12 Feb 2025 22:03:46 +0000
Date: Thu, 13 Feb 2025 06:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 191/191]
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning
 (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202502130517.DvWRRew1-lkp@intel.com>
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
commit: 058e9844046713928f5f78593e66e92da1b0c0c2 [191/191] fixup! arm64: dts: apple: t602x: Add t6020 dispext device nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250210 (https://download.01.org/0day-ci/archive/20250213/202502130517.DvWRRew1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502130517.DvWRRew1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502130517.DvWRRew1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:247.9-256.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:329.9-338.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:320.39-339.4: Warning (simple_bus_reg): /soc/audio-controller@39b504000: simple-bus unit address format error, expected "39b540000"
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:341.39-360.4: Warning (simple_bus_reg): /soc/audio-controller@39b508000: simple-bus unit address format error, expected "39b580000"
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:449.21-485.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@389c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:65.25-102.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@289c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t602x-dieX.dtsi:220.25-257.4: Warning (avoid_unnecessary_addr_size): /soc/dcp@315c00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:475.9-484.5: Warning (graph_child_address): /soc/dcp@389c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:741.9-750.5: Warning (graph_child_address): /soc/audio-controller@39b500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:92.9-101.5: Warning (graph_child_address): /soc/dcp@289c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:247.9-256.5: Warning (graph_child_address): /soc/dcp@315c00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t602x-dieX.dtsi:329.9-338.5: Warning (graph_child_address): /soc/audio-controller@39b504000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +220 arch/arm64/boot/dts/apple/t602x-dieX.dtsi

87dbc354acab49 Janne Grunau  2023-08-17 @220  	DIE_NODE(dcpext1):  dcp@315c00000 {
87dbc354acab49 Janne Grunau  2023-08-17  221  		compatible = "apple,t6020-dcpext", "apple,dcpext";
87dbc354acab49 Janne Grunau  2023-08-17  222  		mboxes = <&DIE_NODE(dcpext1_mbox)>;
87dbc354acab49 Janne Grunau  2023-08-17  223  		mbox-names = "mbox";
87dbc354acab49 Janne Grunau  2023-08-17  224  		iommus = <&DIE_NODE(dcpext1_dart) 5>;
87dbc354acab49 Janne Grunau  2023-08-17  225  
87dbc354acab49 Janne Grunau  2023-08-17  226  		reg-names = "coproc", "disp-0", "disp-1", "disp-2", "disp-3";
87dbc354acab49 Janne Grunau  2023-08-17  227  		reg = <0x3 0x15c00000 0x0 0x4000>,
87dbc354acab49 Janne Grunau  2023-08-17  228  			<0x3 0x14000000 0x0 0x4000000>,
87dbc354acab49 Janne Grunau  2023-08-17  229  			<0x3 0x15320000 0x0 0x4000>,
87dbc354acab49 Janne Grunau  2023-08-17  230  			<0x3 0x15344000 0x0 0x4000>,
87dbc354acab49 Janne Grunau  2023-08-17  231  			<0x3 0x15800000 0x0 0x800000>;
87dbc354acab49 Janne Grunau  2023-08-17  232  		apple,bw-scratch = <&pmgr_dcp 0 4 0x1218>;
87dbc354acab49 Janne Grunau  2023-08-17  233  		power-domains = <&DIE_NODE(ps_dispext1_cpu0)>;
87dbc354acab49 Janne Grunau  2023-08-17  234  		resets = <&DIE_NODE(ps_dispext1_cpu0)>;
87dbc354acab49 Janne Grunau  2023-08-17  235  		clocks = <&DIE_NODE(clk_dispext1)>;
87dbc354acab49 Janne Grunau  2023-08-17  236  		phandle = <&DIE_NODE(dcpext1)>;
87dbc354acab49 Janne Grunau  2023-08-17  237  		apple,dcp-index = <2>;
87dbc354acab49 Janne Grunau  2023-08-17  238  		status = "disabled";
058e9844046713 Janne Grunau  2025-02-09  239  		// required bus properties for 'piodma' subdevice
058e9844046713 Janne Grunau  2025-02-09  240  		#address-cells = <2>;
058e9844046713 Janne Grunau  2025-02-09  241  		#size-cells = <2>;
87dbc354acab49 Janne Grunau  2023-08-17  242  
87dbc354acab49 Janne Grunau  2023-08-17  243  		piodma {
87dbc354acab49 Janne Grunau  2023-08-17  244  			iommus = <&DIE_NODE(dispext1_dart) 4>;
87dbc354acab49 Janne Grunau  2023-08-17  245  		};
b29d8ebae9630c Janne Grunau  2024-01-21  246  
b29d8ebae9630c Janne Grunau  2024-01-21  247  		ports {
b29d8ebae9630c Janne Grunau  2024-01-21  248  			#address-cells = <1>;
b29d8ebae9630c Janne Grunau  2024-01-21  249  			#size-cells = <0>;
b29d8ebae9630c Janne Grunau  2024-01-21  250  			port@0 {
b29d8ebae9630c Janne Grunau  2024-01-21  251  				reg = <0>;
b29d8ebae9630c Janne Grunau  2024-01-21  252  				DIE_NODE(dcpext1_audio): endpoint {
b29d8ebae9630c Janne Grunau  2024-01-21  253  					remote-endpoint = <&DIE_NODE(dpaudio2_dcp)>;
b29d8ebae9630c Janne Grunau  2024-01-21  254  				};
b29d8ebae9630c Janne Grunau  2024-01-21  255  			};
b29d8ebae9630c Janne Grunau  2024-01-21  256  		};
b29d8ebae9630c Janne Grunau  2024-01-21  257  	};
b29d8ebae9630c Janne Grunau  2024-01-21  258  
b29d8ebae9630c Janne Grunau  2024-01-21  259  	DIE_NODE(sio_dart): iommu@39b008000 {
b29d8ebae9630c Janne Grunau  2024-01-21  260  		compatible = "apple,t6020-dart", "apple,t8110-dart";
b29d8ebae9630c Janne Grunau  2024-01-21  261  		reg = <0x3 0x9b008000 0x0 0x4000>;
b29d8ebae9630c Janne Grunau  2024-01-21  262  		interrupt-parent = <&aic>;
b29d8ebae9630c Janne Grunau  2024-01-21  263  		interrupts = <AIC_IRQ DIE_NO 1231 IRQ_TYPE_LEVEL_HIGH>;
b29d8ebae9630c Janne Grunau  2024-01-21  264  		#iommu-cells = <1>;
b29d8ebae9630c Janne Grunau  2024-01-21  265  		power-domains = <&DIE_NODE(ps_sio)>;
b29d8ebae9630c Janne Grunau  2024-01-21  266  		//apple,dma-range = <0x100 0x0001c000 0x2ff 0xfffe4000>;
87dbc354acab49 Janne Grunau  2023-08-17  267  	};
87dbc354acab49 Janne Grunau  2023-08-17  268  
56af6878f9d6c0 Hector Martin 2023-04-09  269  	DIE_NODE(pinctrl_ap): pinctrl@39b028000 {
56af6878f9d6c0 Hector Martin 2023-04-09  270  		compatible = "apple,t6020-pinctrl", "apple,pinctrl";
56af6878f9d6c0 Hector Martin 2023-04-09  271  		reg = <0x3 0x9b028000 0x0 0x4000>;
56af6878f9d6c0 Hector Martin 2023-04-09  272  
56af6878f9d6c0 Hector Martin 2023-04-09  273  		interrupt-parent = <&aic>;
56af6878f9d6c0 Hector Martin 2023-04-09  274  		interrupts = <AIC_IRQ DIE_NO 458 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  275  				<AIC_IRQ DIE_NO 459 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  276  				<AIC_IRQ DIE_NO 460 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  277  				<AIC_IRQ DIE_NO 461 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  278  				<AIC_IRQ DIE_NO 462 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  279  				<AIC_IRQ DIE_NO 463 IRQ_TYPE_LEVEL_HIGH>,
56af6878f9d6c0 Hector Martin 2023-04-09  280  				<AIC_IRQ DIE_NO 464 IRQ_TYPE_LEVEL_HIGH>;
56af6878f9d6c0 Hector Martin 2023-04-09  281  
56af6878f9d6c0 Hector Martin 2023-04-09  282  		clocks = <&clkref>;
56af6878f9d6c0 Hector Martin 2023-04-09  283  		power-domains = <&DIE_NODE(ps_gpio)>;
56af6878f9d6c0 Hector Martin 2023-04-09  284  
56af6878f9d6c0 Hector Martin 2023-04-09  285  		gpio-controller;
56af6878f9d6c0 Hector Martin 2023-04-09  286  		#gpio-cells = <2>;
56af6878f9d6c0 Hector Martin 2023-04-09  287  		gpio-ranges = <&DIE_NODE(pinctrl_ap) 0 0 255>;
56af6878f9d6c0 Hector Martin 2023-04-09  288  		apple,npins = <255>;
56af6878f9d6c0 Hector Martin 2023-04-09  289  
56af6878f9d6c0 Hector Martin 2023-04-09  290  		interrupt-controller;
56af6878f9d6c0 Hector Martin 2023-04-09  291  		#interrupt-cells = <2>;
56af6878f9d6c0 Hector Martin 2023-04-09  292  	};
56af6878f9d6c0 Hector Martin 2023-04-09  293  
b29d8ebae9630c Janne Grunau  2024-01-21  294  	DIE_NODE(sio_mbox): mbox@39bc08000 {
b29d8ebae9630c Janne Grunau  2024-01-21  295  		compatible = "apple,t6020-asc-mailbox", "apple,asc-mailbox-v4";
b29d8ebae9630c Janne Grunau  2024-01-21  296  		reg = <0x3 0x9bc08000 0x0 0x4000>;
b29d8ebae9630c Janne Grunau  2024-01-21  297  		interrupt-parent = <&aic>;
b29d8ebae9630c Janne Grunau  2024-01-21  298  		interrupts = <AIC_IRQ DIE_NO 1248 IRQ_TYPE_LEVEL_HIGH>,
b29d8ebae9630c Janne Grunau  2024-01-21  299  			<AIC_IRQ DIE_NO 1249 IRQ_TYPE_LEVEL_HIGH>,
b29d8ebae9630c Janne Grunau  2024-01-21  300  			<AIC_IRQ DIE_NO 1250 IRQ_TYPE_LEVEL_HIGH>,
b29d8ebae9630c Janne Grunau  2024-01-21  301  			<AIC_IRQ DIE_NO 1251 IRQ_TYPE_LEVEL_HIGH>;
b29d8ebae9630c Janne Grunau  2024-01-21  302  		interrupt-names = "send-empty", "send-not-empty",
b29d8ebae9630c Janne Grunau  2024-01-21  303  			"recv-empty", "recv-not-empty";
b29d8ebae9630c Janne Grunau  2024-01-21  304  		#mbox-cells = <0>;
b29d8ebae9630c Janne Grunau  2024-01-21  305  		power-domains = <&DIE_NODE(ps_sio_cpu)>;
b29d8ebae9630c Janne Grunau  2024-01-21  306  	};
b29d8ebae9630c Janne Grunau  2024-01-21  307  
b29d8ebae9630c Janne Grunau  2024-01-21  308  	DIE_NODE(sio): sio@39bc00000 {
b29d8ebae9630c Janne Grunau  2024-01-21  309  		compatible = "apple,t6020-sio", "apple,sio";
b29d8ebae9630c Janne Grunau  2024-01-21  310  		reg = <0x3 0x9bc00000 0x0 0x8000>;
b29d8ebae9630c Janne Grunau  2024-01-21  311  		dma-channels = <128>;
b29d8ebae9630c Janne Grunau  2024-01-21  312  		#dma-cells = <1>;
b29d8ebae9630c Janne Grunau  2024-01-21  313  		mboxes = <&DIE_NODE(sio_mbox)>;
b29d8ebae9630c Janne Grunau  2024-01-21  314  		iommus = <&DIE_NODE(sio_dart) 0>;
b29d8ebae9630c Janne Grunau  2024-01-21  315  		power-domains = <&DIE_NODE(ps_sio_cpu)>;
b29d8ebae9630c Janne Grunau  2024-01-21  316  		resets = <&DIE_NODE(ps_sio_cpu)>;
b29d8ebae9630c Janne Grunau  2024-01-21  317  		status = "disabled";
b29d8ebae9630c Janne Grunau  2024-01-21  318  	};
b29d8ebae9630c Janne Grunau  2024-01-21  319  
b29d8ebae9630c Janne Grunau  2024-01-21 @320  	DIE_NODE(dpaudio1): audio-controller@39b504000 {

:::::: The code at line 220 was first introduced by commit
:::::: 87dbc354acab49a5282c76dc00f084d734ce389b arm64: dts: apple: t602x: Add t6020 dispext device nodes

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
