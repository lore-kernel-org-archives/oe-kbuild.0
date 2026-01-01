Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45292EDD6D
	for <oe-kbuild@lists.linux.dev>; Thu,  1 Jan 2026 16:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767285367; cv=none; b=lIOdtL7t9cS7tNpVIAgUWFv6xwFKsS80Yn/Jv0W4wF9aNqlwV6JC7BaYAyCINX0TLI6YLFH2lBxPZ+LKHnr1iq2dY12ooxLsEZkJ07Zr6dU2w8ibsDMxhjk+C46nY3z6Ue+IFUz5sXw4UyqVkNwkLfPZb9laI3xkp+SWFL5Vp28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767285367; c=relaxed/simple;
	bh=rJ/CqFi7PVN2NWiLTM6+UdB9/iOJNw2qn4lcR/zU+2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fc0i8dO94/KjUSplBl9/9+HwMOMHJc6ljlOpVzDUW1+LaT45XDLai5VLqVYNZd/+EHIaNWX7v8jD8o5wZwQBjyaEijE6+aVScoJs3Er1MhPIt42wXP6F4TWTSz3XQJnTdr1pYO4y7JEzgKm6iW5q2BaULT3on+cAV2fSQ0ltYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1XvPGUL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1XvPGUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767285366; x=1798821366;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rJ/CqFi7PVN2NWiLTM6+UdB9/iOJNw2qn4lcR/zU+2I=;
  b=n1XvPGULi20TbgIV8fJWRItYuV070xMT8jBOB+Cr7W7lFh1/Ihx7I6Og
   joQiW2z9fbYqRd54unWak2sm90ugBAlGJSB+7mw89KxycJjLd23s70ypy
   vOeoWwwxtq9vbPYqEDSMUQdhC2RzGDq0kHzig/sac54+zENwdcxzqddIi
   21gqd5u3iaSZw4v6rpSSbGKDrTzQHEZuHHCceX8XfmYc58pNCHckOker2
   PITzprV5FyIgHVhheOq2ptNZ5iERCYHJIc0VaejtItmATPHiwQHzStlZF
   OocJVchZzk2ld9WpKHxUnmDuxcGNeuOtmynS5OIUvQJ/DJXtMMQ47AlZZ
   Q==;
X-CSE-ConnectionGUID: 2dU/3B0ZT9+AngHcGSlvwQ==
X-CSE-MsgGUID: Ez5WjqsLTTO0VhLL8Ac/Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67824192"
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="67824192"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 08:36:01 -0800
X-CSE-ConnectionGUID: FkJDLpu9RS2aQ8voRvJ9cw==
X-CSE-MsgGUID: vjjx8sppSUi2RHy4vtfJng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,194,1763452800"; 
   d="scan'208";a="225149726"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jan 2026 08:36:00 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbLeY-000000000Ip-00hk;
	Thu, 01 Jan 2026 16:35:58 +0000
Date: Thu, 01 Jan 2026 17:35:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated
 properties are not allowed ('ti,sdout-zero-fill' was unexpected)
Message-ID: <202601011717.Udhkh2Eh-lkp@intel.com>
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

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: ffa9a2cdd88ecf105f265f98776f925b24f016ec [26/128] arm64: dts: apple=
: t8103*: Put in audio nodes
:::::: branch date: 10 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/arc=
hive/20260101/202601011717.Udhkh2Eh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260101/202601011717.Udhkh2Eh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601011717.Udhkh2Eh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:105.14-114.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j274.dts:116.14-125.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:237.14-247.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j293.dts:249.14-258.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@1: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout=
-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VD=
_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VL=
-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_ad=
dress_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but n=
o reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103-j313.dts:144.14-153.5: Warning (unit_add=
ress_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges=
 property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_=
address): /soc/dsi@228600000/ports/port@0: graph node has single child node=
 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compat=
ible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Uneval=
uated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#s=
ound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP=
-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VC=
P-supply' is a required property

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
