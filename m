Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F339446D
	for <oe-kbuild@lists.linux.dev>; Tue, 19 May 2026 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189799; cv=none; b=ZiFs1Zd3I2kR/EDMJVQcO/ijumXUADx+TmvzgEZcZ4EjP0BqavMmZZrROT1Dt7IDH2n//xP3ux6CtTiMty2ZevABrQMi2J3lWJkIvI6W2d8/av8qMyP19yVvewlKMy+TU83GD13Z6d2zBt4Tsh5hm7Ea0lknGYRHJ+prbCqKbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189799; c=relaxed/simple;
	bh=IkC04+xKXeyXSPMABBe7AicLO98indGxV/gSiF+qgvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fvU1z63RvHiRvDrZtizGuXG608uHXODrjxWakUkDy8WjC0iwFRT/+z8Om8cnwgAvj/cNsnShoe8YbU71HRm5nHLknLQi8tUO7cAZDtMxHCab1ZjbAGds5ecTZiBsJBYkLY11Zav7/xx8X0EDjF5vokFAzJYRHW2Ole5e1ndDZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDx3tkg2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDx3tkg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779189797; x=1810725797;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IkC04+xKXeyXSPMABBe7AicLO98indGxV/gSiF+qgvI=;
  b=FDx3tkg21xGn4Vmm/olJUuA9n4Oo85BLLQkEgpT8FRFcJEPFSoUqnvzW
   JxdmAAViie+x/pT3fR/IE7C2RW7NW9D/zFm7tWoxBdI9+a1OQthhtq4f9
   /Dw/X5P21+B9Z38Xv4pWKUt+RGIV4xqC7EqARIWH4YhDhbvuSHrGaaHo4
   DxTQfWs0cT6ItQzaCk3yXurWFtmnX6KQ7yRCHP9D2IXr+dNXJg8a0zfvo
   T3/lHYrrHsQ6fb9VtO+uNJKXEdVhhjR1lTuSwlM0M5SeSzZQx3fEJO+BA
   3SIe77ezkilkuAhzEQZ3w1HU4QYlVA58rGNlbD01XEkdVZFJWcCKuxPFr
   A==;
X-CSE-ConnectionGUID: VzDqS1AkTciddk+vRfgmjw==
X-CSE-MsgGUID: r4snML4cQyCv8DJu+ZdFSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79965426"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79965426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:23:16 -0700
X-CSE-ConnectionGUID: PXM+NOlRRZCvfwaQvoog3g==
X-CSE-MsgGUID: xyrBKCuMTwa0rsy2W1JPjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263524443"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 May 2026 04:23:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPIXY-00000000AAr-48rY;
	Tue, 19 May 2026 11:23:12 +0000
Date: Tue, 19 May 2026 13:23:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 17/114]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compatible:
 ['ti,sn012776', 'ti,tas2764'] is too long
Message-ID: <202605191359.DkHH9RRi-lkp@intel.com>
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
head:   2d563843e07af55de0249a409021af705f586961
commit: c5da7538f1560f7303e193e2341376ca75190ba0 [17/114] arm64: dts: apple=
: t8112: Put in audio nodes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/arc=
hive/20260519/202605191359.DkHH9RRi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260519/202605191359.DkHH9RRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605191359.DkHH9RRi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:172.14-182.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j413.dts:184.14-193.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38 (ti,sn012776): compat=
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
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@4b (cirrus,cs42l84): 'so=
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
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to =
match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-help=
er-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000 (apple,t8112-d=
art): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4=
-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed t=
o match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/fifo@24eb14000/input@8000=
: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j415.dts:194.14-208.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j415.dts:210.14-219.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@38 (ti,sn012776): compat=
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
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3a (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@3d (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: codec@4b (cirrus,cs42l84): 'so=
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
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to =
match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-help=
er-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000 (apple,t8112-d=
art): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4=
-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed t=
o match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/fifo@24eb14000/input@8000=
: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j415-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:137.14-146.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j473.dts:148.14-157.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38 (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@4b (cirrus,cs42l84): 'ci=
rrus,ts-inv', 'sound-name-prefix' do not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2c8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2d8: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to =
match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-help=
er-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000 (apple,t8112-d=
art): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4=
-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed t=
o match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/fifo@24eb14000/input@8000=
: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:227.14-237.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8112-j493.dts:239.14-248.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38 (ti,sn012776): compat=
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
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): compat=
ible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c (ti,sn012776): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@4b (cirrus,cs42l84): 'so=
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
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: power-management@23b700000 (ap=
ple,t8112-pmgr): power-controller@2e0: 'apple,externally-clocked' does not =
match any of the regexes: '^pinctrl-[0-9]+$'
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to =
match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-help=
er-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000 (apple,t8112-d=
art): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4=
-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	'apple,t6020-dart' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed t=
o match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000: failed to=
 match any schema with compatible: ['apple,t8112-dockchannel', 'apple,dockc=
hannel']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/fifo@24eb14000/input@8000=
: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any sc=
hema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
