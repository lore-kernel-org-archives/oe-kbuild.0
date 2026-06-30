Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F531A683E
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 02:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782785954; cv=none; b=EZ0fRIBr36XjyYoEoMnWF98VIiqeP9lYcA4YaTmRxCENDX1soKvl/kgfYuF27tFEmoZ3dqRiRTWrWvOxc43Yxeu6EKl27JUXMMxULHFOSIeydErZ+aXZv5MZVW9FzrIHYbEiIM5Am9mgiQBgtgt2V9eXFtng0Rb8fzilXdxMsMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782785954; c=relaxed/simple;
	bh=RdFL1uZCvWglk5DZQyCPpKnDAnxFQy6k2pGMCW3CMi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YlYsyiijPcn0N/fmt4F1BToF6gfPX5ECQFOHLbCUtGeONjncPOEFS/vHCjL6TdnzW5Kwelxtj1CrYwSnepcF27rvv8wizZwSkl/xvU8lnLghtqEqCsKa1c+u0T4nz7F8w4Hl8bQr0btEg5eeExwppmOoHz7c4FKqp7CL0DotjpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/YYiPKg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/YYiPKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782785952; x=1814321952;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RdFL1uZCvWglk5DZQyCPpKnDAnxFQy6k2pGMCW3CMi4=;
  b=l/YYiPKgRnayVBHKgk4JmyHc27q0xTWUA0VbzYDvVvGATO0ardN8ibn+
   vrpKHpNz1vePO9IvGBKYkRcStgPOjX25sh8Tx13xBR4GzCrac88X6oxml
   ZYUcUY6VWjAqmljMNF6MHU1F8adEE6vCaWwowrNnfUrLDbeD9+kjDKZ2n
   xNFQpxbtTfLY+aXcbWBjfBXUkFvXJJwTZS4uSJI2/++isdD6eLpeDuN4J
   +45oelongDlXdhR+23vBB/TfZqgQWYnZuPFPFF5ZyIPFXCxtX/fgnU0/v
   oYEvfnaJeUQU5bRrnL60qv9ZfebCoZKicDu6ZEVwr2lOKks24cehYWT/N
   A==;
X-CSE-ConnectionGUID: NZflusgqT8CRT7v5yTpuxA==
X-CSE-MsgGUID: NyVmH+EXRhKtz/HvSnI1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83368801"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83368801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 19:19:12 -0700
X-CSE-ConnectionGUID: CGvRIjuCRuO2wwH7W+cl7Q==
X-CSE-MsgGUID: ZBRoMKTVQpeP9tgrclOguw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="250437794"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Jun 2026 19:19:11 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weO44-000000000Jx-2Q7H;
	Tue, 30 Jun 2026 02:19:08 +0000
Date: Tue, 30 Jun 2026 04:18:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 115/117]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776):
 Unevaluated properties are not allowed ('SDZ-supply' was unexpected)
Message-ID: <202606300404.EUJ2VXpm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: James Calligeros <jcalligeros99@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   99c4b512cb31202c213d72e2422577adbe1324d6
commit: 9cb63b7159141684d64ec496f4d2589867188ae4 [115/117] arm64: dts: appl=
e: t600x: Use new codec bus keeper configuration
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-2051-20260629 (https://download.01.org/0day-ci/arc=
hive/20260630/202606300404.EUJ2VXpm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260630/202606300404.EUJ2VXpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606300404.EUJ2VXpm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/isp@384000000: failed to=
 match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/isp@384000000: failed to=
 match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: gpu@406400000 (apple,agx-t600=
1): 'apple,avg-power-filter-tc-ms', 'apple,avg-power-ki-only', 'apple,avg-p=
ower-kp', 'apple,avg-power-min-duty-cycle', 'apple,avg-power-target-filter-=
tc', 'apple,core-leak-coef', 'apple,fast-die0-integral-gain', 'apple,fast-d=
ie0-proportional-gain', 'apple,firmware-compat', 'apple,firmware-version', =
'apple,min-sram-microvolt', 'apple,perf-base-pstate', 'apple,perf-boost-ce-=
step', 'apple,perf-boost-min-util', 'apple,perf-filter-drop-threshold', 'ap=
ple,perf-filter-time-constant', 'apple,perf-filter-time-constant2', 'apple,=
perf-integral-gain', 'apple,perf-integral-gain2', 'apple,perf-integral-min-=
clamp', 'apple,perf-proportional-gain', 'apple,perf-proportional-gain2', 'a=
pple,perf-tgt-utilization', 'apple,power-sample-period', 'apple,ppm-filter-=
time-constant-ms', 'apple,ppm-ki', 'apple,ppm-kp', 'apple,pwr-filter-time-c=
onstant', 'apple,pwr-integral-gain', 'apple,pwr-integral-min-clamp', 'apple=
,pwr-min-duty-cycle', 'apple,pwr-proportional-gain', 'apple,sram-leak-coef'=
, 'operating-points-v2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: gpu@406400000 (apple,agx-t600=
1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6001', 'apple,agx-g13c', 'apple,agx-g13s'] is too long
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/gpu@406400000: failed to=
 match any schema with compatible: ['apple,agx-t6000', 'apple,agx-g13x']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/isp@384000000: failed to=
 match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/isp@384000000: failed to=
 match any schema with compatible: ['apple,t6000-isp', 'apple,isp']
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@39 (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@4b (cirrus,cs42l84): 's=
ound-name-prefix' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l84.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transp=
ort@0: failed to match any schema with compatible: ['apple,spi-hid-transpor=
t']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: gpu@406400000 (apple,agx-t600=
1): 'apple,avg-power-filter-tc-ms', 'apple,avg-power-ki-only', 'apple,avg-p=
ower-kp', 'apple,avg-power-min-duty-cycle', 'apple,avg-power-target-filter-=
tc', 'apple,core-leak-coef', 'apple,fast-die0-integral-gain', 'apple,fast-d=
ie0-proportional-gain', 'apple,firmware-compat', 'apple,firmware-version', =
'apple,min-sram-microvolt', 'apple,perf-base-pstate', 'apple,perf-boost-ce-=
step', 'apple,perf-boost-min-util', 'apple,perf-filter-drop-threshold', 'ap=
ple,perf-filter-time-constant', 'apple,perf-filter-time-constant2', 'apple,=
perf-integral-gain', 'apple,perf-integral-gain2', 'apple,perf-integral-min-=
clamp', 'apple,perf-proportional-gain', 'apple,perf-proportional-gain2', 'a=
pple,perf-tgt-utilization', 'apple,power-sample-period', 'apple,ppm-filter-=
time-constant-ms', 'apple,ppm-ki', 'apple,ppm-kp', 'apple,pwr-filter-time-c=
onstant', 'apple,pwr-integral-gain', 'apple,pwr-integral-min-clamp', 'apple=
,pwr-min-duty-cycle', 'apple,pwr-proportional-gain', 'apple,sram-leak-coef'=
, 'operating-points-v2' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/apple,agx.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: gpu@406400000 (apple,agx-t600=
1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,agx-t6001', 'apple,agx-g13c', 'apple,agx-g13s'] is too long
--
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b050000 (apple,t6020-i2=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
--
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b050000 (apple,t6020-i2=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
--
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b050000 (apple,t6020-i2=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
--
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3d (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3b (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3b (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3c (ti,sn012776): compa=
tible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: codec@3c (ti,sn012776): Uneva=
luated properties are not allowed ('SDZ-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b050000 (apple,t6020-i2=
c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-i2c', 'apple,t8103-i2c', 'apple,i2c'] is too long
   	'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c=
', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2=
c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
