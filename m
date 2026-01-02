Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673128DC4
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767313686; cv=none; b=Usskp7DrydJFF2RYeeYJcAfOiqDFmav53L2mLNsJ59gS0r5aUgrlV9k1vJRdNy7h22QLfZ2R72xwWK1pkXjMbVVUYm31WHVgm8b9Bcx1wZrxXIvxRD/PxIyiYihPoRduyzjnB/58Uova2khjajuL7eRLsuirwZYQnjokTR/iLNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767313686; c=relaxed/simple;
	bh=rn/59PK5yEoSO1Zl7d82Ow3A1jUCjWTyIPEWURCIzX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U1DfhgCjAU63CVOPQyLS22hVNNS14bgVI6gNFEuwgWP816DmrpnJcauPTjVpHVd5e/SGi5Y62zdBaI/vx+q0PBKK6X4/5IllQzotPv13zahM7b4qA52rC4HB9Q7Szn7xuTbS4zf2qdEwpXZPd3dYqoSYeB8+XK3ZnnPzq2ZJKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ierQH0Q0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ierQH0Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767313684; x=1798849684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rn/59PK5yEoSO1Zl7d82Ow3A1jUCjWTyIPEWURCIzX4=;
  b=ierQH0Q0ZtXnoRBrZ9AraRwgN0bllZxX3YXEmXUV9Ye5nYZ6F/PHExn6
   lEWt4BKzLn1UHHcltyw3dxVdvWP7/iFv/dnn59K1b+QpEVr35rq6ZuQ9s
   JyWBhwyIFPSd2kTr4P9ffxmpTSoar0RBZCm6o03bXivACqZSU0bUl7Ztx
   13ixluFGm+pBG83e+J7WNIirBIp73sUee9yVltTAqYXywRI2nchOdbz95
   KjVdD5CnGDruDT9nODw1ph0sXF1CIA1WEjq4qrOnvFSyX9pvcDP2mYTRo
   YqgGsqtRfw5PZ1vERa4DwOpAxrHb4PxQLzAdrqyVCy0mA2Tow/4dWbAHb
   w==;
X-CSE-ConnectionGUID: xIRNtYQzTGK/LDiy/yHTHg==
X-CSE-MsgGUID: LzliqChKRCqSoAlaPEltPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67835749"
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="67835749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 16:28:03 -0800
X-CSE-ConnectionGUID: xPLVKGJeTGKl8l7/wI+ZGA==
X-CSE-MsgGUID: WnX+RoYbRwmI885aPNDffQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,195,1763452800"; 
   d="scan'208";a="200852142"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Jan 2026 16:28:02 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbT1L-000000000Kz-2eu6;
	Fri, 02 Jan 2026 00:27:59 +0000
Date: Fri, 02 Jan 2026 01:27:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 27/128]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776):
 Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
Message-ID: <202601020152.ydELo4Qb-lkp@intel.com>
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
commit: 12aa35de5a6694fbd8c2ff2597ae4758df8e3a52 [27/128] arm64: dts: apple=
: t600x-jxxx: Put in audio nodes
:::::: branch date: 10 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/arc=
hive/20260102/202601020152.ydELo4Qb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260102/202601020152.ydELo4Qb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601020152.ydELo4Qb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: smc@290400000 (apple,t6000-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: smc@290400000 (apple,t6000-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: smc@290400000 (apple,t6000-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
--
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:490.14-504.5: Warning (un=
it_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:506.14-515.5: Warning (un=
it_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or =
ranges property
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: smc@290400000 (apple,t6000-sm=
c): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000/rtc: faile=
d to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3a (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@38 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply', 'ti,sdout-force-zero-mask'=
 were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@288: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@290: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@298: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e580000 (a=
pple,t6000-pmgr): power-controller@2a0: 'apple,externally-clocked' does not=
 match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
