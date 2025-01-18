Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CD425A63C
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 01:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737162185; cv=none; b=HZhB/qHOS8cC6ZAaFwNbQetZ4B6xA6gr0MHSzME+Z0vJyTHeDcB9GVxrC/5vm4vcuBEDGLGeg2rXaG+4VZd/MtcmIZMIoekK3u7Chi6eKChyli70Ud61X4pW3avm6lpVQ4ohm8RaHA4PRKFpD8Cu/dhnQpUDPPNNeZC18R+kFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737162185; c=relaxed/simple;
	bh=ZzVlZX0nI0jbxxPVuv1UVxHMlf0puNI5cvUHnj27fnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7LRr5kWe19mt1zkZnSyguVOjXxoCbWwDStIkV0NMkOy8F4AirMf6lwHlzkbjICXXvlJWITtz22TyHnZ38nWbLV/sqqOVnyR82pZ8I+Hu7mc0mathmlAnaFPVjHrWOVSd63MZyq057jDEJ7mzPSMTHMFPiX/31HtjBB4lU4O3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c401wbFy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c401wbFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737162182; x=1768698182;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZzVlZX0nI0jbxxPVuv1UVxHMlf0puNI5cvUHnj27fnQ=;
  b=c401wbFyFYuD59SElFswpecdw92Wv75efLLn4/0/UMnxYQsbkFopzXe8
   PEfDBwvCQw1YT+cEcImrII8DqwpuAREbvocwTZJvq86o0b7S+fWCKdtYR
   SRTDvFvAgYfsfKKSQsjiIKFunaO8fyuuWRtrs2FDL8Zxfj3MTmZDkc/nR
   YcoWhzbd8xXQ80KJ13Bq+/VDu+2v5W5fYug/EoYk5Jrt4cpPQ13GQWSJl
   05LeRVawy2J2aPJODBfiX6VvCdRE6itnBJr4JUfKp5G4jyqVZ+qpYgbSG
   23DW/8tjkNRkqjnm9d85W7VSjD/yNlnycC/GvEF1+GRu1fU3S/TAvrMYo
   A==;
X-CSE-ConnectionGUID: OasOXk6GRJaHowy58/U1YQ==
X-CSE-MsgGUID: sr3XcpLdSE6YDGP/liHHug==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36884560"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="36884560"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:02:59 -0800
X-CSE-ConnectionGUID: eJXwfoYbTiq1wvhyIJDKcw==
X-CSE-MsgGUID: S5FspDFVTJmOjIuX9ZL0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143234246"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jan 2025 17:02:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxEm-000Tu3-0D;
	Sat, 18 Jan 2025 01:02:56 +0000
Date: Sat, 18 Jan 2025 09:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <202501180846.h4t71QDV-lkp@intel.com>
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
In-Reply-To: <20250114220147.757075-4-ninad@linux.ibm.com>
References: <20250114220147.757075-4-ninad@linux.ibm.com>
TO: Ninad Palsule <ninad@linux.ibm.com>
TO: minyard@acm.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: openipmi-developer@lists.sourceforge.net
TO: netdev@vger.kernel.org
TO: joel@jms.id.au
TO: andrew@codeconstruct.com.au
TO: devicetree@vger.kernel.org
TO: eajames@linux.ibm.com
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
CC: Ninad Palsule <ninad@linux.ibm.com>

Hi Ninad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250114]
[also build test WARNING on linus/master v6.13-rc7]
[cannot apply to robh/for-next brgl/gpio/for-next cminyard-ipmi/for-next ne=
t-next/main net/main v6.13-rc7 v6.13-rc6 v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ninad-Palsule/dt-bin=
dings-net-faraday-ftgmac100-Add-phys-mode/20250115-060811
base:   next-20250114
patch link:    https://lore.kernel.org/r/20250114220147.757075-4-ninad%40li=
nux.ibm.com
patch subject: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs p=
arsing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250116 (https://download.01.org/0day-ci/archiv=
e/20250118/202501180846.h4t71QDV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250118/202501180846.h4t71QDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501180846.h4t71QDV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1=
e6e2000/interrupt-controller@18: failed to match any schema with compatible=
: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/display@=
1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx'=
, 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/video@1e=
700000: failed to match any schema with compatible: ['aspeed,ast2500-video-=
engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: gpio@1e780000: 'b=
mc-ready' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: bmc-ready: $noden=
ame:0: 'bmc-ready' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
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
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/memory-controller@1e6e0000: failed to match any schema with compatible: [=
'aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/syscon@1e6e2000/interrupt-controller@18: failed to match any schema with =
compatible: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatibl=
e: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/display@1e6e6000: failed to match any schema with compatible: ['aspeed,as=
t2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/video@1e700000: failed to match any schema with compatible: ['aspeed,ast2=
500-video-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: gpio@1e=
780000: 'pin_gpio_c7', 'pin_gpio_d1' do not match any of the regexes: '^(ho=
g-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: pin_gpi=
o_c7: $nodename:0: 'pin_gpio_c7' does not match '^(hog-[0-9]+|.+-hog(-[0-9]=
+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: pin_gpi=
o_d1: $nodename:0: 'pin_gpio_d1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]=
+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2=
400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/pwm-tacho-controller@1e786000: failed to match any schema with compatible=
: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000: lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000: reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/interrupt-controller@18: failed to match any schema with compati=
ble: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/displ=
ay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-g=
fx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/video=
@1e700000: failed to match any schema with compatible: ['aspeed,ast2500-vid=
eo-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: gpio@1e780000:=
 'bmc-ready' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]=
+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: bmc-ready: $no=
dename:0: 'bmc-ready' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000: =
lpc-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000: =
reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@24: 'clock=
s' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon=
@1e6e2000/interrupt-controller@18: failed to match any schema with compatib=
le: ['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/displa=
y@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gf=
x', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/video@=
1e700000: failed to match any schema with compatible: ['aspeed,ast2500-vide=
o-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: gpio@1e780000: =
'pin_gpio_b6', 'pin_gpio_i3' do not match any of the regexes: '^(hog-[0-9]+=
|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: pin_gpio_i3: $n=
odename:0: 'pin_gpio_i3' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: pin_gpio_b6: $n=
odename:0: 'pin_gpio_b6' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2400-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/video@1e=
700000: failed to match any schema with compatible: ['aspeed,ast2400-video-=
engine']
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
oom-guardrail' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-=
9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: doom-guardrail: $=
nodename:0: 'doom-guardrail' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)=
$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2400-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: lpc@1e789000: lpc=
-snoop@90: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: lpc@1e789000: reg=
-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-delta-ahe50dc.dtb: /ahb/apb/lpc@1e78=
9000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2400-l=
hc']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@560: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@570: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9000: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9100: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2600-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: gpio@1e780000: 'usb=
_power' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: usb_power: $nodenam=
e:0: 'usb_power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
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
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@560: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@570: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9000: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9100: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2600-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: gpio@1e780000: 'usb=
_power' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: usb_power: $nodenam=
e:0: 'usb_power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
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
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@560: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@570: failed to match any schema with compatible:=
 ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9000: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9100: 'inte=
rrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: crypto@1e6fa000: 'a=
speed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2600-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: gpio@1e780000: 'i2c=
3_mux_oe_n', 'usb_power' do not match any of the regexes: '^(hog-[0-9]+|.+-=
hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: i2c3_mux_oe_n: $nod=
ename:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: usb_power: $nodenam=
e:0: 'usb_power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc@1e789000: lpc-s=
noop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc@1e789000: reg-i=
o-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sysco=
n@1e6e2000/interrupt-controller@560: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sysco=
n@1e6e2000/interrupt-controller@570: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/displ=
ay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-g=
fx', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9000: =
'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9100: =
'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: crypto@1e6fa00=
0: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/video=
@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-vid=
eo-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: gpio@1e780000:=
 'i2c3_mux_oe_n', 'usb_power' do not match any of the regexes: '^(hog-[0-9]=
+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: i2c3_mux_oe_n:=
 $nodename:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?=
)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: usb_power: $no=
dename:0: 'usb_power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc@1e789000: =
lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc@1e789000: =
reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@=
1e6e2000/interrupt-controller@560: failed to match any schema with compatib=
le: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@=
1e6e2000/interrupt-controller@570: failed to match any schema with compatib=
le: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/display=
@1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx=
', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9000: 'i=
nterrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9100: 'i=
nterrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: crypto@1e6fa000:=
 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/video@1=
e700000: failed to match any schema with compatible: ['aspeed,ast2600-video=
-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: gpio@1e780000: '=
i2c3_mux_oe_n', 'usb_power' do not match any of the regexes: '^(hog-[0-9]+|=
=2E+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: i2c3_mux_oe_n: $=
nodename:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: usb_power: $node=
name:0: 'usb_power' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc@1e789000: lp=
c-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc@1e789000: re=
g-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@18: failed to match any schema with compatible: =
['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2500-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: gpio@1e780000: 'pin=
_gpio_aa6', 'pin_gpio_aa7', 'pin_gpio_ab0', 'pin_gpio_b0', 'pin_gpio_b5', '=
pin_gpio_h5', 'pin_gpio_z2' do not match any of the regexes: '^(hog-[0-9]+|=
=2E+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: pin_gpio_b0: $noden=
ame:0: 'pin_gpio_b0' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: pin_gpio_b5: $noden=
ame:0: 'pin_gpio_b5' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: pin_gpio_h5: $noden=
ame:0: 'pin_gpio_h5' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: pin_gpio_z2: $noden=
ame:0: 'pin_gpio_z2' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: pin_gpio_aa6: $node=
name:0: 'pin_gpio_aa6' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e=
2000/interrupt-controller@18: failed to match any schema with compatible: [=
'aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/display@1e6=
e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', '=
syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/video@1e700=
000: failed to match any schema with compatible: ['aspeed,ast2500-video-eng=
ine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: gpio@1e780000: 'func=
_mode0', 'func_mode1', 'func_mode2', 'ncsi_cfg', 'seq_cont' do not match an=
y of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: func_mode0: $nodenam=
e:0: 'func_mode0' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: func_mode1: $nodenam=
e:0: 'func_mode1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: func_mode2: $nodenam=
e:0: 'func_mode2' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: seq_cont: $nodename:=
0: 'seq_cont' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: ncsi_cfg: $nodename:=
0: 'ncsi_cfg' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6=
e2000/interrupt-controller@18: failed to match any schema with compatible: =
['aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/display@1e=
6e6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/video@1e70=
0000: failed to match any schema with compatible: ['aspeed,ast2500-video-en=
gine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: gpio@1e780000: 'nic=
_func_mode0', 'nic_func_mode1', 'seq_cont' do not match any of the regexes:=
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: nic_func_mode0: $no=
dename:0: 'nic_func_mode0' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: nic_func_mode1: $no=
dename:0: 'nic_func_mode1' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: seq_cont: $nodename=
:0: 'seq_cont' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x08' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/memory-contr=
oller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast250=
0-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2=
000/interrupt-controller@18: failed to match any schema with compatible: ['=
aspeed,ast2500-scu-ic']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2=
000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,as=
t2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/display@1e6e=
6000: failed to match any schema with compatible: ['aspeed,ast2500-gfx', 's=
yscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/video@1e7000=
00: failed to match any schema with compatible: ['aspeed,ast2500-video-engi=
ne']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: gpio@1e780000: 'line_=
bmc_i2c2_sw_rst_n', 'line_bmc_i2c5_sw_rst_n', 'line_iso_u146_en', 'ncsi_mux=
_en_n' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', =
'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: line_iso_u146_en: $no=
dename:0: 'line_iso_u146_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)=
$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: ncsi_mux_en_n: $noden=
ame:0: 'ncsi_mux_en_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: line_bmc_i2c2_sw_rst_=
n: $nodename:0: 'line_bmc_i2c2_sw_rst_n' does not match '^(hog-[0-9]+|.+-ho=
g(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: line_bmc_i2c5_sw_rst_=
n: $nodename:0: 'line_bmc_i2c5_sw_rst_n' does not match '^(hog-[0-9]+|.+-ho=
g(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/timer@1e7820=
00: failed to match any schema with compatible: ['aspeed,ast2400-timer']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
