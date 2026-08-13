Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF83955EB
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621946; cv=none; b=AtxyJXFS236+gSw6+0iNh9PP4zxP70VKUQGW5pfVfAxTjYx/Efa+nzgK5FW/yROfy/WvlCCFiZG/TnQVxP09t7QarSdY1PAUm7PCNv67KpY7C/uTGZ/8XG4Te/Qhqf6HNz+9HH26FybQcjE1PFpj7kDJsycxWfPFhzXxddIE3X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621946; c=relaxed/simple;
	bh=vIWE9jasdAwVnK0ftCdnLirays3qX3xd8tZBccE3N88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nh8Fy8dobQafVE+bJzIIYcDisCjl42la140523KGnSzTWqPn3tcjET922PdwUAd/ZTyg9Z29D9FNknb0fG3sHk7K8Kb2In2bR/GcIG1Nl4K1AQ3tHn3V4KVvRzNiaJQjWSvpHCfe5LD1Q4M0A0OPDGQsaqP6DuwtT/NV8MMkNPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMkSu9Ix; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMkSu9Ix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786621940; x=1818157940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIWE9jasdAwVnK0ftCdnLirays3qX3xd8tZBccE3N88=;
  b=EMkSu9Ixb1cAxGjK2E6Xk9MLeALm/XR8oQmvsiNcGr/GPVOypYaR2Yzx
   gqfjmCVZMwsFZRS0sNL83D71NZGPatWMXIp3NyqNQFRjvQjSLn/RxsUnV
   EecA4Xi0FMfCYJZ1Xy8WoPSwaagdaOKDCBEw3dMfJRnHWAu/RNP572KV2
   jMNRN2NbkECRDbJe6G3d5h8Vgue0pIMgYSkTcpQgRKPwPEyEHPOBvP8J6
   ddStsXquspVo6dJ/c0bk5RPilzGWO0ZVwqsnw56yM79edxUTNwTOvOMrP
   TFe6S0a5FRyz44qI6H6gkrF6lJDI6ZYsy3eKL3QDdHb7l2w/uqqlkbJV/
   w==;
X-CSE-ConnectionGUID: C96aQN9hT56drbHlKQo8dw==
X-CSE-MsgGUID: YwQCxSfFQbSxOGKvmg6zSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87116839"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87116839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:52:20 -0700
X-CSE-ConnectionGUID: JIfxCSnGRZ+ACeZzCE06Kg==
X-CSE-MsgGUID: QK3DyqnpRIyHgYtOUyx9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="288707973"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2026 04:52:18 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTyp-0000000061i-3QJJ;
	Thu, 13 Aug 2026 11:52:15 +0000
Date: Thu, 13 Aug 2026 13:51:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb:
 ethernet-phy@0 (marvell,88e1118): marvell,reg-init:
 =?us-ascii?Q?b'\x00\x00\x00\x02\x00\x00\x00\x15\x00\x00\xff\xcf\x00\x00\x?=
 =?us-ascii?Q?00\x00\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x?=
 =?us-ascii?Q?00D*\x00\x00\x00\x03\x00\x00\x00\...?=
Message-ID: <202608131329.GB3vjdne-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-2051-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131329.GB3vjdne-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131329.GB3vjdne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4f0b3cd7b664 ("MIPS: dts: Always descend vendor subdirectories")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608131329.GB3vjdne-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:128.23-144.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:145.23-161.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@4: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:162.23-178.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@5: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtsi:179.23-196.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@6: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /: failed to match any schema with compatible: ['cavium,octeon-3860']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: / (cavium,octeon-3860): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/interrupt-controller@1070000000000: failed to match any schema with compatible: ['cavium,octeon-3860-ciu']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001800: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001800/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88e1118']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@0 (marvell,88e1118): marvell,reg-init: b'\x00\x00\x00\x02\x00\x00\x00\x15\x00\x00\xff\xcf\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D*\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x02B' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@0 (marvell,88e1118): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1118'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1118' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001800/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1118']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@1 (marvell,88e1118): marvell,reg-init: b'\x00\x00\x00\x02\x00\x00\x00\x15\x00\x00\xff\xcf\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D*\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x02B' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@1 (marvell,88e1118): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1118'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1118' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001800/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@2 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@2 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001800/ethernet-phy@3: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@3 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@9 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000: failed to match any schema with compatible: ['cavium,octeon-3860-pip']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0: failed to match any schema with compatible: ['cavium,octeon-3860-pip-interface']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@0: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet@0 (cavium,octeon-3860-pip-port): cavium,alt-phy-handle: b'\x00\x00\x00\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@1: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet@1 (cavium,octeon-3860-pip-port): cavium,alt-phy-handle: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@2: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet@2 (cavium,octeon-3860-pip-port): cavium,alt-phy-handle: b'\x00\x00\x00\x07' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@3: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet@3 (cavium,octeon-3860-pip-port): cavium,alt-phy-handle: b'\x00\x00\x00\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@4: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@5: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@6: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@7: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@8: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@9: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@a: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@b: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@c: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
--
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@1: failed to match any schema with compatible: ['cavium,octeon-3860-pip-interface']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@1/ethernet@0: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@1/ethernet@1: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@1/ethernet@2: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/pip@11800a0000000/interface@1/ethernet@3: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/i2c@1180000001000: failed to match any schema with compatible: ['cavium,octeon-3860-twsi']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: serial@1180000000800 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@0: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x14' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x00<' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00<' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00-' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00-' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@4: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@5: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00}' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@6: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x01\x0e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00F' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/bootbus@1180000000000/led-display@4,0: failed to match any schema with compatible: ['avago,hdsp-253x']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/dma-engine@1180000000100: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/dma-engine@1180000000108: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/usbn@1180068000000: failed to match any schema with compatible: ['cavium,octeon-5750-usbn']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: usbn@1180068000000 (cavium,octeon-5750-usbn): refclk-type: b'crystal\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/usbn@1180068000000/usbc@16f0010000000: failed to match any schema with compatible: ['cavium,octeon-5750-usbc']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001900: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001900/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@1 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@1 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001900/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@2 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@2 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/mdio@1180000001900/ethernet-phy@3: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ethernet-phy@3 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/ethernet@1070000100000: failed to match any schema with compatible: ['cavium,octeon-5750-mix']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/ethernet@1070000100800: failed to match any schema with compatible: ['cavium,octeon-5750-mix']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/i2c@1180000001200: failed to match any schema with compatible: ['cavium,octeon-3860-twsi']
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: serial@1180000000c00 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: serial@1180000000400 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: /soc@0/uctl@118006f000000: failed to match any schema with compatible: ['cavium,octeon-6335-uctl']
>> arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: uctl@118006f000000 (cavium,octeon-6335-uctl): refclk-type: b'crystal\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ehci@16f0000000000 (cavium,octeon-6335-ehci): $nodename:0: 'ehci@16f0000000000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_3xxx.dtb: ohci@16f0000000400 (cavium,octeon-6335-ohci): $nodename:0: 'ohci@16f0000000400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
--
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts:464.23-480.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts:481.23-497.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@4: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts:498.23-514.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@5: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dts:515.23-532.6: Warning (unit_address_vs_reg): /soc@0/bootbus@1180000000000/cavium,cs-config@6: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /: failed to match any schema with compatible: ['cavium,octeon-6880']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: / (cavium,octeon-6880): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/interrupt-controller@1070100000000: failed to match any schema with compatible: ['cavium,octeon-6880-ciu2']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003800: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003800/ethernet-phy@6: failed to match any schema with compatible: ['marvell,88e1118']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@6 (marvell,88e1118): marvell,reg-init: b'\x00\x00\x00\x02\x00\x00\x00\x15\x00\x00\xff\xcf\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D*\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x02B' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@6 (marvell,88e1118): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1118'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1118' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003800/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1149r']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): cavium,qlm-trim: b'4,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003800/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@2 (marvell,88e1149r): cavium,qlm-trim: b'4,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@4 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003880: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003880/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): cavium,qlm-trim: b'0,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003880/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@2 (marvell,88e1149r): cavium,qlm-trim: b'0,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@4 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003900: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003900/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): cavium,qlm-trim: b'2,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003900/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@2 (marvell,88e1149r): cavium,qlm-trim: b'2,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@4 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003980: failed to match any schema with compatible: ['cavium,octeon-3860-mdio']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003980/ethernet-phy@1: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): cavium,qlm-trim: b'3,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00Ww\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x03\x00\x00\x00\x12\x00\x00\x00\x00\x00\x00A\x05\x00\x00\x00\x03\x00\x00\x00\x13\x00\x00\x00\x00\x00\x00\n`' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@1 (marvell,88e1149r): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,88e1149r'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'marvell,88e1149r' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/mdio@1180000003980/ethernet-phy@2: failed to match any schema with compatible: ['marvell,88e1149r']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ethernet-phy@2 (marvell,88e1149r): cavium,qlm-trim: b'3,sgmii\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@2: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/pip@11800a0000000/interface@0/ethernet@3: failed to match any schema with compatible: ['cavium,octeon-3860-pip-port']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/i2c@1180000001000: failed to match any schema with compatible: ['cavium,octeon-3860-twsi']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/i2c@1180000001200: failed to match any schema with compatible: ['cavium,octeon-3860-twsi']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: serial@1180000000800 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: serial@1180000000c00 (cavium,octeon-3860-uart): reg-shift: 3 is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/reg.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@0: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\n' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x002' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00\x19' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00#' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x00\x19' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@0 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@4: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x01@' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@4 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@5: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x05' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00}' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x01,' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x016' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@5 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/cavium,cs-config@6: failed to match any schema with compatible: ['cavium,octeon-3860-bootbus-config']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,cs-index: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-adr: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-ce: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-oe: b'\x00\x00\x00}' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-we: b'\x00\x00\x00\x96' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-hld: b'\x00\x00\x00d' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wr-hld: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-pause: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-wait: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-page: b'\x00\x00\x016' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,t-rd-dly: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: cavium,cs-config@6 (cavium,octeon-3860-bootbus-config): cavium,pages: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@200000', 'partition@400000', 'partition@7fe000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/bootbus@1180000000000/led-display@4,0: failed to match any schema with compatible: ['avago,hdsp-253x']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000100: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/dma-engine@1180000000108: failed to match any schema with compatible: ['cavium,octeon-5750-bootbus-dma']
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: /soc@0/uctl@118006f000000: failed to match any schema with compatible: ['cavium,octeon-6335-uctl']
>> arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: uctl@118006f000000 (cavium,octeon-6335-uctl): refclk-type: b'crystal\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ehci@16f0000000000 (cavium,octeon-6335-ehci): $nodename:0: 'ehci@16f0000000000' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/mips/boot/dts/cavium-octeon/octeon_68xx.dtb: ohci@16f0000000400 (cavium,octeon-6335-ohci): $nodename:0: 'ohci@16f0000000400' does not match '^usb(@.*)?'
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml
--
   arch/mips/boot/dts/img/boston.dts:128.17-178.5: Warning (interrupt_provider): /pci@14000000/pci2_root@0,0: '#interrupt-cells' found, but node is not an interrupt provider
   arch/mips/boot/dts/img/boston.dts:136.23-177.6: Warning (interrupt_provider): /pci@14000000/pci2_root@0,0/eg20t_bridge@1,0,0: '#interrupt-cells' found, but node is not an interrupt provider
   arch/mips/boot/dts/img/boston.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
   arch/mips/boot/dts/img/boston.dtb: /: failed to match any schema with compatible: ['img,boston']
   arch/mips/boot/dts/img/boston.dtb: / (img,boston): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/img/boston.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['img,mips']
>> arch/mips/boot/dts/img/boston.dtb: eg20t_phub@2,0,0 (pci8086,8801): intel,eg20t-prefetch: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000: failed to match any schema with compatible: ['img,boston-platform-regs', 'syscon']
   arch/mips/boot/dts/img/boston.dtb: /system-controller@17ffd000/clock: failed to match any schema with compatible: ['img,boston-clock']
   arch/mips/boot/dts/img/boston.dtb: uart@17ffe000 (ns16550a): $nodename:0: 'uart@17ffe000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
--
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /: failed to match any schema with compatible: ['img,pistachio-marduk', 'img,pistachio']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: / (img,pistachio-marduk): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: cpu@0 (mti,interaptiv): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100000: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100200: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100400: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2c@18100600: failed to match any schema with compatible: ['img,scb-i2c']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-in@18100800: failed to match any schema with compatible: ['img,i2s-in']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: i2s-in@18100800 (img,i2s-in): img,i2s-channels: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /i2s-out@18100a00: failed to match any schema with compatible: ['img,i2s-out']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: i2s-out@18100a00 (img,i2s-out): img,i2s-channels: b'\x00\x00\x00\x06' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /parallel-audio-out@18100c00: failed to match any schema with compatible: ['img,parallel-out']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-out@18100d00: failed to match any schema with compatible: ['img,spdif-out']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spdif-in@18100e00: failed to match any schema with compatible: ['img,spdif-in']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /internal-dac: failed to match any schema with compatible: ['img,pistachio-internal-dac']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: internal-dac (img,pistachio-internal-dac): img,voltage-select: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18100f00: failed to match any schema with compatible: ['img,spfi']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: spi@18100f00 (img,spfi): spfi-max-frequency: b'\x02\xfa\xf0\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18101000: failed to match any schema with compatible: ['img,spfi']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: spi@18101000 (img,spfi): spfi-max-frequency: b'\x02\xfa\xf0\x80' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: flash@0 (spansion,s25fl016k): compatible: 'oneOf' conditional failed, one must be fixed:
   	['spansion,s25fl016k', 'jedec,spi-nor'] is too long
   	'spansion,s25fl016k' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'spansion,s25fl016k' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /spi@18101000/flash@0: failed to match any schema with compatible: ['spansion,s25fl016k', 'jedec,spi-nor']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /pwm@18101300: failed to match any schema with compatible: ['img,pistachio-pwm']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: uart@18101400 (snps,dw-apb-uart): $nodename:0: 'uart@18101400' does not match '^serial(@.*)?$'
--
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: mmc@18142000 (img,pistachio-dw-mshc): clock-names:1: 'ciu' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/synopsys-dw-mshc.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: sram@1b000000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /dma-controller@18143000: failed to match any schema with compatible: ['img,pistachio-mdc-dma']
>> arch/mips/boot/dts/img/pistachio_marduk.dtb: dma-controller@18143000 (img,pistachio-mdc-dma): img,max-burst-multiplier: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18144000 (img,pistachio-clk): compatible: ['img,pistachio-clk', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): 'reset-controller' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18148000 (img,pistachio-cr-periph): compatible: ['img,pistachio-cr-periph', 'syscon', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml
   arch/mips/boot/dts/img/pistachio_marduk.dtb: /clk@18148000/reset-controller: failed to match any schema with compatible: ['img,pistachio-reset']
   arch/mips/boot/dts/img/pistachio_marduk.dtb: clk@18149000 (img,pistachio-cr-top): compatible: ['img,pistachio-cr-top', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/img,pistachio-clk.yaml
--
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000: failed to match any schema with compatible: ['lantiq,sram']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/eiu@101000: failed to match any schema with compatible: ['lantiq,eiu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: cgu@103000 (lantiq,cgu-xway): '#clock-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mips/lantiq/lantiq,cgu.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /sram@1f000000/rcu@203000: failed to match any schema with compatible: ['lantiq,rcu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: fpi@10000000 (lantiq,fpi): $nodename:0: 'fpi@10000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000: failed to match any schema with compatible: ['lantiq,fpi', 'simple-bus']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/gptu@e100a00: failed to match any schema with compatible: ['lantiq,gptu-xway']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pci@e105400: failed to match any schema with compatible: ['lantiq,pci-xway']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): lantiq,bus-clock: b'\x01\xfc\xa0U' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): gpios-reset: b'\x00\x00\x00\x02\x00\x00\x00\x15\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci@e105400 (lantiq,pci-xway): req-mask: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0: failed to match any schema with compatible: ['lantiq,localbus', 'simple-bus']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/localbus@0/nor-boot@0: failed to match any schema with compatible: ['lantiq,nor']
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: /fpi@10000000/pinmux@e100b10: failed to match any schema with compatible: ['lantiq,danube-pinctrl']
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: stp: lantiq,function: b'stp\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: exin: lantiq,groups: b'exin1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: exin: lantiq,function: b'exin\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci: lantiq,groups: b'gnt1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: pci: lantiq,function: b'pci\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: conf_out: lantiq,pins: b'io4\x00io5\x00io6\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/lantiq/danube_easy50712.dtb: conf_out: lantiq,pull: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/lantiq/danube_easy50712.dtb: ethernet@e180000 (lantiq,etop-xway): 'mac-address' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/lantiq,etop-xway.yaml
--
   	'ralink,rt2880-soc' was expected
   	'ralink,rt3052-soc' was expected
   	'ralink,rt3383-soc' was expected
   	'ralink,mt7620a-soc' was expected
   	'ralink,mt7628a-soc' was expected
   	'mediatek,mt7621-soc' was expected
   	from schema $id: http://devicetree.org/schemas/mips/ralink.yaml
   arch/mips/boot/dts/ralink/omega2p.dtb: /: failed to match any schema with compatible: ['onion,omega2+', 'ralink,mt7688a-soc', 'ralink,mt7628a-soc']
   arch/mips/boot/dts/ralink/omega2p.dtb: interrupt-controller@200 (ralink,rt2880-intc): 'ralink,intc-registers', 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml
>> arch/mips/boot/dts/ralink/omega2p.dtb: interrupt-controller@200 (ralink,rt2880-intc): ralink,intc-registers: b'\x00\x00\x00\x9c\x00\x00\x00\xa0\x00\x00\x00l\x00\x00\x00\xa4\x00\x00\x00\x80\x00\x00\x00x' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
   arch/mips/boot/dts/ralink/omega2p.dtb: gpio@600 (mediatek,mt7621-gpio): 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00 (ns16550a): $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/ralink/omega2p.dtb: uart1@d00 (ns16550a): $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
--
   arch/mips/boot/dts/ralink/mt7628a.dtsi:42.21-133.5: Warning (avoid_unnecessary_addr_size): /palmbus@10000000/pinmux@60: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/mips/boot/dts/ralink/vocore2.dtb: interrupt-controller@200 (ralink,rt2880-intc): 'ralink,intc-registers', 'reset-names', 'resets' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/ralink,rt2880-intc.yaml
>> arch/mips/boot/dts/ralink/vocore2.dtb: interrupt-controller@200 (ralink,rt2880-intc): ralink,intc-registers: b'\x00\x00\x00\x9c\x00\x00\x00\xa0\x00\x00\x00l\x00\x00\x00\xa4\x00\x00\x00\x80\x00\x00\x00x' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
   arch/mips/boot/dts/ralink/vocore2.dtb: gpio@600 (mediatek,mt7621-gpio): 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00 (ns16550a): $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00 (ns16550a): Unevaluated properties are not allowed ('reset-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/mips/boot/dts/ralink/vocore2.dtb: uart1@d00 (ns16550a): $nodename:0: 'uart1@d00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
--
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: gpio@10600000 (xlnx,xps-gpio-1.00.a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'device_type', 'mdio', 'xlnx,duplex', 'xlnx,include-global-buffers', 'xlnx,include-internal-loopback', 'xlnx,include-mdio', 'xlnx,instance', 'xlnx,s-axi-id-width', 'xlnx,use-internal' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,rx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,tx-ping-pong: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/net/xlnx,emaclite.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,duplex: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,include-global-buffers: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,include-internal-loopback: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,include-mdio: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,instance: b'axi_ethernetlite_inst\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,s-axi-id-width: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: ethernet@10e00000 (xlnx,xps-ethernetlite-3.00.a): xlnx,use-internal: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'xlnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inertial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,clk-freq: b'\x05\xf5\xe1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,family: b'Artix7\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,gpo-width: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,iic-freq: b'\x00\x01\x86\xa0' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,scl-inertial-delay: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,sda-inertial-delay: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: i2c@10a00000 (xlnx,xps-iic-2.00.a): xlnx,ten-bit-adr: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/mips/boot/dts/xilfpga/nexys4ddr.dtb: /i2c@10a00000/ad7420@4b: failed to match any schema with compatible: ['adi,adt7420']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
