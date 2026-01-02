Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258917B418
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767338891; cv=none; b=jwKsNc2t2raIH0uRcNWeRXIOfD7g4hAsceXhHBbfe/PxktrlvciYZkHoiNK6/LtAjmOazp3q1NKIyio66nSCz7o2ET+rVv8Rf2pzshZ6eraF7JvavgbQW9FG5GhuFziIlYnpQ9FqBAM+gya0dguds95B2PVeJRkdVrgJhErLkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767338891; c=relaxed/simple;
	bh=1T4ECwBH/H1VbrwEKz3qUFP/nrRQqLJLzK77XYXhXnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gAdje9yigC3acZpqUnz6Bli62FBeGYxqQjv7V+8tqgIbt0kJGQy6cFqjKoWVHXWbFgB1prfpNVgLRsuEJ0Gxro9PgY5Qu5kwImlg86bCxHiv95YgPjz0eRPK6a+o036I3wMRKjV7610EtDyI/ipJqkCwrTO1ZC9bunAkurSem+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSvVq3zG; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSvVq3zG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767338888; x=1798874888;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1T4ECwBH/H1VbrwEKz3qUFP/nrRQqLJLzK77XYXhXnk=;
  b=fSvVq3zGs0RqbhrdvHan6swDhEINj+cQcG5U1z7PZz5Xm92sdH7pkhfA
   hqtC00N1qsEWTDXMw+tn7dIY5EwmGgrpWSzMzEwC9nqIh/w005/kY8cky
   ao2Ox/e8kQCGcb5LPRnQaRudqKfXTSkFBOb6WLfDaPx9jBzQmkoc5nART
   lJXC0nG+b4kd8DeDOja1iKEGcrI+oDSEby7OGB2HdbA7JohwprFZG4w+e
   ytAhObZi18XBxvPswbDfysWeWKSyJBQzzUHLH3s1BpRBNs8rnGP1/KP29
   sJFCzc03p/p5g8Tc4i/r4aYP0+WENJF2N7npZ4sVk/cOAE6AicuutMBQ7
   w==;
X-CSE-ConnectionGUID: OCYzepAGQ8W/+qd8bCZaaA==
X-CSE-MsgGUID: pu4mtolqS1+PZLFU6e6pNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68876833"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="68876833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 23:28:05 -0800
X-CSE-ConnectionGUID: dM29o2n2SD6Qpqn5c6IJTQ==
X-CSE-MsgGUID: 7yX9raItT/GgUddGyez+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; 
   d="scan'208";a="232864277"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jan 2026 23:28:04 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbZZq-000000000PB-2z9s;
	Fri, 02 Jan 2026 07:28:02 +0000
Date: Fri, 02 Jan 2026 08:27:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 28/128]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Unevaluated
 properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' were
 unexpected)
Message-ID: <202601020811.ft1gHKbD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povi=C5=A1er" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>
CC: James Calligeros <jcalligeros99@gmail.com>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: f72a75efa62b92dba271ea788afd830ad1b20404 [28/128] arm64: dts: apple=
: t8112: Put in audio nodes
:::::: branch date: 10 days ago
:::::: commit date: 12 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/arc=
hive/20260102/202601020811.ft1gHKbD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260102/202601020811.ft1gHKbD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601020811.ft1gHKbD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:171.14-181.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j413.dts:183.14-192.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'so=
und-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j415.dts:193.14-207.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j415.dts:209.14-218.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@39 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@4b (cirrus,cs42l84): 'so=
und-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:226.14-236.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j493.dts:238.14-247.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112.dtsi:492.25-501.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:503.26-507.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@1: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39 (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@4b (cirrus,cs42l84): 'so=
und-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
