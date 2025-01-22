Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BD3149E17
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584920; cv=none; b=agm1i/BspZQlJuJdqMr06jRgw807Peo5WTZhYAdrIC2/JVvr9NvzdscwhzW8+/B/7wSXNPZYVcWoXu5hoZkzu+22cgjaV5cGKKkbRKRnLaouAc5d3ayliOp3MKd1bSHQ0kN8Wt4i/dyDMqasRHd6ZVCjGM+UqImS3QpePFzJh+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584920; c=relaxed/simple;
	bh=ctGonG8McP0KBw37OLU5la5HfYQu6Mr4IhmN6dnh0fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSlRolBwgEUCvKlz91mTszW1QUF4usA4hQFcEwFQcAkNYjs1L/Vlf9qqLncFR/CAU+Eru5NZpGsruhCfZQG/OE1HnnC1AQipjyK92/0cixvmIJCMXoIFsZ9GkzqFdk8Kl2wshuJttN4LGuxogxEU1FzIMEVEsCdhoHQ/8mhiQaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyCuEmYj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyCuEmYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737584917; x=1769120917;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ctGonG8McP0KBw37OLU5la5HfYQu6Mr4IhmN6dnh0fg=;
  b=AyCuEmYj4qbC34KDTpA672EyJc/cUZ3wkpMx9JDRSVSGm6QPq+gJYrtQ
   Qfw/M3jJU1XSmLBKjNQks/eOEnoiUyci1HafVRvEMkd9EUNhLDkpEAR9b
   vCqxmrd9iuTeijb5ebeDFMu/W7gSu0GMnsypjjiz5DRJ7oBXTdG/Y498F
   +aNUYjJ0Ezov1AzrDY1h6YoGB6C8xxwfBzc5f89+qZr5PpIB5O0UFPWwt
   O8vQamxjocF8UFddP95caKS4sDndnAtE94zhZoRRKJVel5Sfqig4NxCOP
   pxOCPDO+QXfFqBgHyZjg8V7Y+ZYTcJe8pf2Y82/lUXpCsm94p8FC73auG
   A==;
X-CSE-ConnectionGUID: et8sLg9vTXqdpEUR7A9K5Q==
X-CSE-MsgGUID: 7otfVRcYTDS0+bGZs5vvsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41823010"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="41823010"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 14:28:37 -0800
X-CSE-ConnectionGUID: qoJl4UyvTpul+8SJ7JSYvA==
X-CSE-MsgGUID: qNNtBSLnQCCKDj0UiGXKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107133022"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2025 14:28:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tajD7-000aN9-03;
	Wed, 22 Jan 2025 22:28:33 +0000
Date: Thu, 23 Jan 2025 06:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 58/60]
 arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: gpio@1e780000:
 'bmc-ready-hog', 'i2c4-o-en-hog', 'ocp-aux-pwren-hog' do not match any of
 the regexes: 'pinctrl-[0-9]+'
Message-ID: <202501230635.01qC2fSs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   412b7f81f2b508ae42fb823cfb1a4ecb017dd4b0
commit: fc8deed79a3bd29b92802e7e83029ca48a59d965 [58/60] ARM: dts: aspeed: =
Align GPIO hog name with bindings
:::::: branch date: 5 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-051-20250117 (https://download.01.org/0day-ci/archiv=
e/20250123/202501230635.01qC2fSs-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23=
f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250123/202501230635.01qC2fSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501230635.01qC2fSs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e6e0000=
/memory-controller@1e6e0000: failed to match any schema with compatible: ['=
aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e6e0000=
/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with c=
ompatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e6e0000=
/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible=
: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e6e0000=
/display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast=
2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/video@1e7000=
00: failed to match any schema with compatible: ['aspeed,ast2500-video-engi=
ne']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: gpio@1e780000: 'b=
mc-ready-hog', 'i2c4-o-en-hog', 'ocp-aux-pwren-hog' do not match any of the=
 regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e780000=
/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast24=
00-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb@1e780000=
/pwm-tacho-controller@1e786000: failed to match any schema with compatible:=
 ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@0: aspeed,fan=
-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@1: aspeed,fan=
-tach-ch: b'\x05' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@2: aspeed,fan=
-tach-ch: b'\x06' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@3: aspeed,fan=
-tach-ch: b'\x07' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e6e0000/memory-controller@1e6e0000: failed to match any schema with comp=
atible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e6e0000/syscon@1e6e2000/interrupt-controller@18: failed to match any sch=
ema with compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e6e0000/syscon@1e6e2000/p2a-control@2c: failed to match any schema with =
compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e6e0000/display@1e6e6000: failed to match any schema with compatible: ['=
aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/vi=
deo@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-=
video-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: gpio@1e=
780000: 'pin-gpio-c7-hog', 'pin-gpio-d1-hog' do not match any of the regexe=
s: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e780000/timer@1e782000: failed to match any schema with compatible: ['as=
peed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b@1e780000/pwm-tacho-controller@1e786000: failed to match any schema with c=
ompatible: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000: lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: kcs@24:=
 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: kcs@28:=
 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e6e0=
000/memory-controller@1e6e0000: failed to match any schema with compatible:=
 ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e6e0=
000/syscon@1e6e2000/interrupt-controller@18: failed to match any schema wit=
h compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e6e0=
000/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compati=
ble: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e6e0=
000/display@1e6e6000: failed to match any schema with compatible: ['aspeed,=
ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/video@1e7=
00000: failed to match any schema with compatible: ['aspeed,ast2500-video-e=
ngine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: gpio@1e780000:=
 'bmc-ready-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e780=
000/timer@1e782000: failed to match any schema with compatible: ['aspeed,as=
t2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb@1e780=
000/pwm-tacho-controller@1e786000: failed to match any schema with compatib=
le: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000: =
lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000: =
reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@24: 'clock=
s' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@28: 'clock=
s' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e6e00=
00/memory-controller@1e6e0000: failed to match any schema with compatible: =
['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e6e00=
00/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with=
 compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e6e00=
00/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatib=
le: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e6e00=
00/display@1e6e6000: failed to match any schema with compatible: ['aspeed,a=
st2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2500-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: gpio@1e780000: =
'pin-gpio-b6-hog', 'pin-gpio-i3-hog' do not match any of the regexes: 'pinc=
trl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e7800=
00/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast=
2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb@1e7800=
00/pwm-tacho-controller@1e786000: failed to match any schema with compatibl=
e: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e6e0000=
/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible=
: ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/video@1e7000=
00: failed to match any schema with compatible: ['aspeed,ast2400-video-engi=
ne']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: gpio@1e780000: gp=
io-line-names: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', 'RESET_PEER_N', 'HEARTBEAT_OUT', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', 'DOOM_N', '', '', '', '', 'LED_PWR_BLUE', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', 'BMC_ID', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', 'LED_GREEN', '', 'LED_RED', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', 'HEARTBEAT_IN', 'BOARDREV0', 'BOARDREV1', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] =
is too short
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: gpio@1e780000: 'd=
oom-guardrail-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e780000=
/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast24=
00-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e780000=
/pwm-tacho-controller@1e786000: failed to match any schema with compatible:=
 ['aspeed,ast2400-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: lpc@1e789000: lpc=
-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: lpc@1e789000: reg=
-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e780000=
/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,=
ast2400-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e780000=
/lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed=
,ast2400-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb@1e780000=
/bus@1e78a000/interrupt-controller@0: failed to match any schema with compa=
tible: ['aspeed,ast2400-i2c-ic']
--
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/video@1e700000=
: failed to match any schema with compatible: ['aspeed,ast2600-video-engine=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000: sdhci=
@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: sdc@1e740000: sdhci=
@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/sdc@1e740000/s=
dhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/sdc@1e740000/s=
dhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: gpio@1e780000: 'usb=
-power-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb@1e780000/t=
imer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600=
-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: lpc@1e789000: lpc-s=
noop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: lpc@1e789000: reg-i=
o-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: kcs@24: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: kcs@28: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/video@1e700000=
: failed to match any schema with compatible: ['aspeed,ast2600-video-engine=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sdc@1e740000: sdhci=
@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: sdc@1e740000: sdhci=
@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/sdc@1e740000/s=
dhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/sdc@1e740000/s=
dhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: gpio@1e780000: 'usb=
-power-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb@1e780000/t=
imer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600=
-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: lpc@1e789000: lpc-s=
noop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: lpc@1e789000: reg-i=
o-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: kcs@24: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: kcs@28: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/video@1e700000=
: failed to match any schema with compatible: ['aspeed,ast2600-video-engine=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci=
@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: sdc@1e740000: sdhci=
@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/sdc@1e740000/s=
dhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/sdc@1e740000/s=
dhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600=
-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: gpio@1e780000: 'i2c=
3-mux-oe-n-hog', 'usb-power-hog' do not match any of the regexes: 'pinctrl-=
[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb@1e780000/t=
imer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600=
-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc@1e789000: lpc-s=
noop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc@1e789000: reg-i=
o-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: kcs@24: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: kcs@28: 'clocks' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: crypto@1e6fa00=
0: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/video@1e7=
00000: failed to match any schema with compatible: ['aspeed,ast2600-video-e=
ngine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: =
sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: sdc@1e740000: =
sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/sdc@1e740=
000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,as=
t2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/sdc@1e740=
000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,as=
t2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: gpio@1e780000:=
 'i2c3-mux-oe-n-hog', 'usb-power-hog' do not match any of the regexes: 'pin=
ctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb@1e780=
000/timer@1e782000: failed to match any schema with compatible: ['aspeed,as=
t2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc@1e789000: =
lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc@1e789000: =
reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: kcs@24: 'clock=
s' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: kcs@28: 'clock=
s' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: crypto@1e6fa000:=
 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/video@1e700=
000: failed to match any schema with compatible: ['aspeed,ast2600-video-eng=
ine']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sd=
hci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: sdc@1e740000: sd=
hci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/sdc@1e74000=
0/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2=
600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/sdc@1e74000=
0/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2=
600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: gpio@1e780000: '=
i2c3-mux-oe-n-hog', 'usb-power-hog' do not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb@1e78000=
0/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2=
600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc@1e789000: lp=
c-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc@1e789000: re=
g-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: kcs@24: 'clocks'=
 does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: kcs@28: 'clocks'=
 does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e6e0000/=
memory-controller@1e6e0000: failed to match any schema with compatible: ['a=
speed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e6e0000/=
syscon@1e6e2000/interrupt-controller@18: failed to match any schema with co=
mpatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e6e0000/=
syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible:=
 ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e6e0000/=
display@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2=
500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/video@1e70000=
0: failed to match any schema with compatible: ['aspeed,ast2500-video-engin=
e']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: gpio@1e780000: 'pi=
n-gpio-aa0-hog', 'pin-gpio-aa5-hog', 'pin-gpio-b5-hog', 'pin-gpio-f0-hog', =
'pin-gpio-f3-hog', 'pin-gpio-f4-hog', 'pin-gpio-f5-hog', 'pin-gpio-g4-hog',=
 'pin-gpio-g7-hog', 'pin-gpio-h2-hog', 'pin-gpio-h3-hog', 'pin-gpio-i3-hog'=
, 'pin-gpio-j2-hog', 'pin-gpio-j3-hog', 'pin-gpio-s2-hog', 'pin-gpio-s4-hog=
', 'pin-gpio-s6-hog', 'pin-gpio-y0-hog', 'pin-gpio-y1-hog', 'pin-gpio-z0-ho=
g', 'pin-gpio-z2-hog', 'pin-gpio-z3-hog', 'pin-gpio-z7-hog' do not match an=
y of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
output' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e780000/=
timer@1e782000: failed to match any schema with compatible: ['aspeed,ast240=
0-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb@1e780000/=
pwm-tacho-controller@1e786000: failed to match any schema with compatible: =
['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: fan@1: aspeed,fan-=
tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: fan@2: aspeed,fan-=
tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: fan@3: aspeed,fan-=
tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: fan@4: aspeed,fan-=
tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e6e00=
00/memory-controller@1e6e0000: failed to match any schema with compatible: =
['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e6e00=
00/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with=
 compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e6e00=
00/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatib=
le: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e6e00=
00/display@1e6e6000: failed to match any schema with compatible: ['aspeed,a=
st2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2500-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: gpio@1e780000: =
'pin-gpio-a1-hog', 'pin-gpio-a3-hog', 'pin-gpio-aa0-hog', 'pin-gpio-aa4-hog=
', 'pin-gpio-ab3-hog', 'pin-gpio-ac6-hog', 'pin-gpio-b5-hog', 'pin-gpio-b7-=
hog', 'pin-gpio-e0-hog', 'pin-gpio-e2-hog', 'pin-gpio-e5-hog', 'pin-gpio-e6=
-hog', 'pin-gpio-f0-hog', 'pin-gpio-f1-hog', 'pin-gpio-f2-hog', 'pin-gpio-f=
3-hog', 'pin-gpio-f4-hog', 'pin-gpio-f6-hog', 'pin-gpio-g7-hog', 'pin-gpio-=
h6-hog', 'pin-gpio-i3-hog', 'pin-gpio-j1-hog', 'pin-gpio-j2-hog', 'pin-gpio=
-j3-hog', 'pin-gpio-l0-hog', 'pin-gpio-l1-hog', 'pin-gpio-l4-hog', 'pin-gpi=
o-l5-hog', 'pin-gpio-r6-hog', 'pin-gpio-r7-hog', 'pin-gpio-s1-hog', 'pin-gp=
io-s2-hog', 'pin-gpio-s6-hog', 'pin-gpio-z3-hog' do not match any of the re=
gexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e7800=
00/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast=
2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb@1e7800=
00/pwm-tacho-controller@1e786000: failed to match any schema with compatibl=
e: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: fan@4: aspeed,f=
an-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e6e0000/m=
emory-controller@1e6e0000: failed to match any schema with compatible: ['as=
peed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e6e0000/s=
yscon@1e6e2000/interrupt-controller@18: failed to match any schema with com=
patible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e6e0000/s=
yscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: =
['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e6e0000/d=
isplay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast25=
00-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/video@1e700000=
: failed to match any schema with compatible: ['aspeed,ast2500-video-engine=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: gpio@1e780000: 'pin=
-gpio-aa6-hog', 'pin-gpio-aa7-hog', 'pin-gpio-ab0-hog', 'pin-gpio-b0-hog', =
'pin-gpio-b5-hog', 'pin-gpio-h5-hog', 'pin-gpio-z2-hog' do not match any of=
 the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e780000/t=
imer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400=
-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb@1e780000/p=
wm-tacho-controller@1e786000: failed to match any schema with compatible: [=
'aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: lpc@1e789000: lpc-s=
noop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e6e0000/me=
mory-controller@1e6e0000: failed to match any schema with compatible: ['asp=
eed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e6e0000/sy=
scon@1e6e2000/interrupt-controller@18: failed to match any schema with comp=
atible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e6e0000/sy=
scon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: [=
'aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e6e0000/di=
splay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast250=
0-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/video@1e700000:=
 failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: gpio@1e780000: 'func=
-mode0-hog', 'func-mode1-hog', 'func-mode2-hog', 'ncsi-cfg-hog', 'seq-cont-=
hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e780000/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-=
timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb@1e780000/pw=
m-tacho-controller@1e786000: failed to match any schema with compatible: ['=
aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000: lpc-sn=
oop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000: reg-io=
-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@24: 'clocks' doe=
s not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@28: 'clocks' doe=
s not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e6e0000/=
syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible:=
 ['aspeed,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/video@1e70000=
0: failed to match any schema with compatible: ['aspeed,ast2400-video-engin=
e']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: gpio@1e780000: 'pi=
n-func-mode0-hog', 'pin-func-mode1-hog', 'pin-func-mode2-hog', 'pin-gpio-a0=
-hog', 'pin-gpio-a1-hog', 'pin-gpio-b1-hog', 'pin-gpio-b2-hog', 'pin-gpio-b=
7-hog', 'pin-gpio-d1-hog', 'pin-gpio-f1-hog', 'pin-gpio-f4-hog', 'pin-gpio-=
f5-hog', 'pin-gpio-f7-hog', 'pin-gpio-g3-hog', 'pin-gpio-g4-hog', 'pin-gpio=
-g5-hog', 'pin-gpio-h0-hog', 'pin-gpio-h1-hog', 'pin-gpio-h2-hog', 'pin-gpi=
o-h7-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e780000/=
timer@1e782000: failed to match any schema with compatible: ['aspeed,ast240=
0-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e780000/=
pwm-tacho-controller@1e786000: failed to match any schema with compatible: =
['aspeed,ast2400-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: lpc@1e789000: lpc-=
snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: lpc@1e789000: reg-=
io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e780000/=
lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,a=
st2400-lhc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e780000/=
lpc@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,=
ast2400-ibt-bmc']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-palmetto.dtb: /ahb/apb@1e780000/=
bus@1e78a000/interrupt-controller@0: failed to match any schema with compat=
ible: ['aspeed,ast2400-i2c-ic']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e6e0000/m=
emory-controller@1e6e0000: failed to match any schema with compatible: ['as=
peed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e6e0000/s=
yscon@1e6e2000/interrupt-controller@18: failed to match any schema with com=
patible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e6e0000/s=
yscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: =
['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e6e0000/d=
isplay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast25=
00-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/video@1e700000=
: failed to match any schema with compatible: ['aspeed,ast2500-video-engine=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: gpio@1e780000: 'nic=
-func-mode0-hog', 'nic-func-mode1-hog', 'seq-cont-hog' do not match any of =
the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e780000/t=
imer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400=
-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb@1e780000/p=
wm-tacho-controller@1e786000: failed to match any schema with compatible: [=
'aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x08' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\t' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\n' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x0b' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e6e0000/mem=
ory-controller@1e6e0000: failed to match any schema with compatible: ['aspe=
ed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e6e0000/sys=
con@1e6e2000/interrupt-controller@18: failed to match any schema with compa=
tible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e6e0000/sys=
con@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['=
aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e6e0000/dis=
play@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500=
-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/video@1e700000: =
failed to match any schema with compatible: ['aspeed,ast2500-video-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: gpio@1e780000: 'line-=
bmc-i2c2-sw-rst-n-hog', 'line-bmc-i2c5-sw-rst-n-hog', 'line-iso-u146-en-hog=
', 'ncsi-mux-en-n-hog' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e780000/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb@1e780000/pwm=
-tacho-controller@1e786000: failed to match any schema with compatible: ['a=
speed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@1: aspeed,fan-tac=
h-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@2: aspeed,fan-tac=
h-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@3: aspeed,fan-tac=
h-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: lpc@1e789000: lpc-sno=
op@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
