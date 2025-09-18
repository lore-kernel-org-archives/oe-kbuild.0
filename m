Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481402222CB
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Sep 2025 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209012; cv=none; b=UsQxQpxXCjElKLVB5GnqVmZv+pmoegjBFnV+7mF7W9CG2dwk/5+hTltssIt8X4fsMdhohbCLvPFd+dk76lS4uR7HYASfVbENYA9rH1HMfeIZXQAgm3JU1YdZdY+VA9JlhLmah7ovvX3uGhZQCDpQJjptoyoH1tYS7bRFYqOv+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209012; c=relaxed/simple;
	bh=gmUjYrLDfc2hykZm4TGpGYjUXf66QwHdpkjxn0b5sc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d84Z1YshMYiYaYnZJZpNDvaXFSh84ZBVt9z26dwy/LlRbY6fyFIw/qYahby9Gh/OHDtuvuOzDWSJ2qC9Tq2utSKxRQrAyQz4sa2fe+00X2pmYb5l4oVt2W4dvx+U3EBcufe69yh+1jJteFK9tvDa4q3fsXPrfr/rovIDc/xYYL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQeRt2X/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQeRt2X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758209003; x=1789745003;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gmUjYrLDfc2hykZm4TGpGYjUXf66QwHdpkjxn0b5sc4=;
  b=bQeRt2X/1lgHxMYE3T+aPrSfrHLAFj9FKmV83pnE1YErbLSlMXXMiIC6
   kcoZNoYp0jZSJuqsyJpXAUxPylhFUXtYCkqGBvLgYlUR03+xdaUypdlsp
   M/XDOY0pDF6smev0c4B2Jk7R+0Ag/tTpyN+S/GXeztyQGDFtPJjfBVdsX
   IrQhmEceMwuFq4rNzNaDx2T6AwI0dIEjbYFsDM4Ydix9RnPHRFnDuKJ6y
   dyBRSDiSCgA/NdDXXaLB6ssFWJiwJLM2a7X0KdtMXV1JBjhKmK5BnerhE
   pbNiO26Ab4Wt7IuuWo5+z1lrnJ0yY8EceyDqp/cSlOIYITF1B6VMur8Uc
   g==;
X-CSE-ConnectionGUID: tyjG2/tYQemIVugCZ24qFQ==
X-CSE-MsgGUID: i9pIvSx+QfiGPiSWVnm5TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64348583"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64348583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 08:23:22 -0700
X-CSE-ConnectionGUID: GBsnYg1xS8K5e3O+8AL67A==
X-CSE-MsgGUID: C/AUx9mfSQenlZRFO5RhBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; 
   d="scan'208";a="180684282"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2025 08:23:20 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzGTd-0003Ol-2R;
	Thu, 18 Sep 2025 15:23:17 +0000
Date: Thu, 18 Sep 2025 23:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 30/47]
 arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: display@1e6e6000
 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509182350.oCzYV9zu-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
head:   df4acfbcf59a35b265a340b6a25cd2feadc0eb97
commit: cce65107897d699c78373b88f3fe94602f194d0e [30/47] dt-bindings: gpu: =
Convert aspeed,ast2400-gfx to DT schema
:::::: branch date: 6 days ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-051-20250905 (https://download.01.org/0day-ci/archiv=
e/20250918/202509182350.oCzYV9zu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250918/202509182350.oCzYV9zu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509182350.oCzYV9zu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/memory-control=
ler@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-=
sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/syscon@1e6e200=
0/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2=
500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: display@1e6e6000 (aspee=
d,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/timer@1e782000=
: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: /ahb/apb/pwm-tacho-cont=
roller@1e786000: failed to match any schema with compatible: ['aspeed,ast25=
00-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: lpc@1e789000 (aspeed,as=
t2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: lpc@1e789000 (aspeed,as=
t2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: kcs@24 (aspeed,ast2500-=
kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: kcs@28 (aspeed,ast2500-=
kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
--
   	'aspeed,ast2600' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: timer (arm,armv7-tim=
er): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /sdram@1e6e0000: fai=
led to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sys=
con']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: bus@1e600000 (aspeed=
,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: syscon@1e6e2000 (asp=
eed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^int=
errupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-=
f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/syscon@1e6e=
2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,a=
st2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: display@1e6e6000 (as=
peed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: adc@1e6e9000 (aspeed=
,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: adc@1e6e9100 (aspeed=
,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: crypto@1e6fa000 (asp=
eed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: serial@1e784000 (snp=
s,dw-apb-uart): Unevaluated properties are not allowed ('no-loopback-test' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.=
yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: timer (arm,armv7-timer)=
: 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /sdram@1e6e0000: failed=
 to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'syscon=
']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: bus@1e600000 (aspeed,as=
t2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: syscon@1e6e2000 (aspeed=
,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^interr=
upt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+=
)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/syscon@1e6e200=
0/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2=
600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: display@1e6e6000 (aspee=
d,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: adc@1e6e9000 (aspeed,as=
t2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: adc@1e6e9100 (aspeed,as=
t2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9=
]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: crypto@1e6fa000 (aspeed=
,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: /ahb/apb/timer@1e782000=
: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: serial@1e784000 (snps,d=
w-apb-uart): Unevaluated properties are not allowed ('no-loopback-test' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.=
yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@1: aspeed,fan-=
tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@2: aspeed,fan-=
tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@3: aspeed,fan-=
tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-daytonax.dtb: fan@4: aspeed,fan-=
tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@1: aspeed,fan-=
tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@2: aspeed,fan-=
tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@3: aspeed,fan-=
tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-amd-ethanolx.dtb: fan@4: aspeed,fan-=
tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'n=
ull'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
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
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dtb: fan@3: aspeed,fan=
-tach-ch: b'\x07' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: timer (arm,a=
rmv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /sdram@1e6e0=
000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-eda=
c', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: bus@1e600000=
 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is to=
o long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: syscon@1e6e2=
000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexe=
s: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl=
(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/sys=
con@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['=
aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: display@1e6e=
6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9000=
 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: adc@1e6e9100=
 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: crypto@1e6fa=
000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: lpc@1e789000=
 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:672.10-692.4: =
Warning (avoid_unnecessary_addr_size): /ahb/apb/bus@1e78a000/i2c@480/gpio@7=
7: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or=
 child "reg" or "ranges" property
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: timer (arm,ar=
mv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /sdram@1e6e00=
00: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac=
', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: bus@1e600000 =
(aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: syscon@1e6e20=
00 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes=
: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(=
@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/sysc=
on@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['a=
speed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: display@1e6e6=
000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: adc@1e6e9000 =
(aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: adc@1e6e9100 =
(aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: crypto@1e6fa0=
00 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: lpc@1e789000 =
(aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/memory-controller@1e6e0000: failed to match any schema with compatible: [=
'aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatibl=
e: ['aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: display=
@1e6e6000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: display=
@1e6e6000 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2=
400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: /ahb/ap=
b/pwm-tacho-controller@1e786000: failed to match any schema with compatible=
: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: lpc@1e7=
89000 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of=
 the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-arm-stardragon4800-rep2.dtb: kcs@24 =
(aspeed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@24 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c246d4i.dtb: kcs@28 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: fan@2: aspeed,=
fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: fan@4: aspeed,=
fan-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@3: aspeed,=
fan-tach-ch: b'\x03\x0b' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@4: aspeed,=
fan-tach-ch: b'\x04\x0c' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@5: aspeed,=
fan-tach-ch: b'\x05\r' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-romed8hm3.dtb: fan@6: aspeed,=
fan-tach-ch: b'\x06\x0e' is not of type 'object', 'integer', 'array', 'bool=
ean', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/mem=
ory-controller@1e6e0000: failed to match any schema with compatible: ['aspe=
ed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/sys=
con@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['=
aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: display@1e6e=
6000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: /ahb/apb/pwm=
-tacho-controller@1e786000: failed to match any schema with compatible: ['a=
speed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@2: aspee=
d,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@3: aspee=
d,fan-tach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: fan@4: aspee=
d,fan-tach-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-spc621d8hm3.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/memory-=
controller@1e6e0000: failed to match any schema with compatible: ['aspeed,a=
st2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/syscon@=
1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspe=
ed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: display@1e6e6000=
 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: display@1e6e6000=
 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: /ahb/apb/pwm-tac=
ho-controller@1e786000: failed to match any schema with compatible: ['aspee=
d,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@1: aspeed,fa=
n-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', =
'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@2: aspeed,fa=
n-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', =
'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x570d4u.dtb: fan@3: aspeed,fa=
n-tach-ch: b'\x04\x0b' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: timer (arm,armv7-time=
r): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /sdram@1e6e0000: fail=
ed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sysc=
on']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: bus@1e600000 (aspeed,=
ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: syscon@1e6e2000 (aspe=
ed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^inte=
rrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f=
]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/syscon@1e6e2=
000/smp-memram@180: failed to match any schema with compatible: ['aspeed,as=
t2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: display@1e6e6000 (asp=
eed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9000 (aspeed,=
ast2600-adc0): 'interrupts', 'vref' do not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: adc@1e6e9100 (aspeed,=
ast2600-adc1): 'interrupts', 'vref' do not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: crypto@1e6fa000 (aspe=
ed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: /ahb/apb/timer@1e7820=
00: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: lpc@1e789000 (aspeed,=
ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
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
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-bytedance-g220a.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: / (facebook,=
bletchley-bmc): spi1-gpio: {'compatible': ['spi-gpio'], '#address-cells': 1=
, '#size-cells': 0, 'gpio-sck': [50, 203, 0], 'gpio-mosi': [50, 204, 0], 'g=
pio-miso': [50, 205, 0], 'num-chipselects': 1, 'cs-gpios': [[50, 200, 1]], =
'tpm@0': {'compatible': ['infineon,slb9670', 'tcg,tpm_tis-spi'], 'spi-max-f=
requency': 33000000, 'reg': [[0]]}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: timer (arm,a=
rmv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /sdram@1e6e0=
000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-eda=
c', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: bus@1e600000=
 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is to=
o long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: syscon@1e6e2=
000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexe=
s: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl=
(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/sys=
con@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['=
aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: display@1e6e=
6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9000=
 (aspeed,ast2600-adc0): 'interrupts', 'vref' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: adc@1e6e9100=
 (aspeed,ast2600-adc1): 'interrupts', 'vref' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: crypto@1e6fa=
000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: lpc@1e789000=
 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: timer (arm,ar=
mv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /sdram@1e6e00=
00: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac=
', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: bus@1e600000 =
(aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too=
 long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: syscon@1e6e20=
00 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes=
: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(=
@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/sysc=
on@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['a=
speed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: display@1e6e6=
000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9000 =
(aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: adc@1e6e9100 =
(aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: crypto@1e6fa0=
00 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: lpc@1e789000 =
(aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warni=
ng (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u=
-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@=
0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: lpc@1e789000 (aspe=
ed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: lpc@1e789000 (aspe=
ed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: kcs@24 (aspeed,ast=
2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-cmm.dtb: kcs@28 (aspeed,ast=
2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: timer (arm,armv=
7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /sdram@1e6e0000=
: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac',=
 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: bus@1e600000 (a=
speed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too l=
ong
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: syscon@1e6e2000=
 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: =
'^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[=
0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/syscon=
@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['asp=
eed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: display@1e6e600=
0 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: adc@1e6e9000 (a=
speed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: adc@1e6e9100 (a=
speed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: crypto@1e6fa000=
 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2600-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: lpc@1e789000 (a=
speed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: timer (arm,armv7-=
timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /sdram@1e6e0000: =
failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', '=
syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: bus@1e600000 (asp=
eed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: syscon@1e6e2000 (=
aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^=
interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-=
9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/syscon@1=
e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspee=
d,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: display@1e6e6000 =
(aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: adc@1e6e9000 (asp=
eed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: adc@1e6e9100 (asp=
eed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: crypto@1e6fa000 (=
aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: lpc@1e789000 (asp=
eed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /sdram@1e6e=
0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-ed=
ac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: bus@1e60000=
0 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mella=
nox,multi-host', 'ncsi-channel', 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl=
,start-redo-probe', 'ncsi-package', 'ncsi-rexmit', 'ncsi-timeout' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: ethernet@1e=
690000 (aspeed,ast2600-mac): 'ncsi-ctrl,no-channel-monitor', 'ncsi-ctrl,sta=
rt-redo-probe' do not match any of the regexes: '^#.*', '^(at25|bm|devbus|d=
macap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*', '^=
(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-single|=
#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5=
m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*', '^100ask=
,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*', '^SUNW=
,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-._]*@[0-9a=
-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*',=
 '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '=
^ad,.*', '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.=
*', '^adieng,.*', '^admatec,.*', '^advantech,.*', '^aeroflexgaisler,.*', '^=
aesop,.*', '^airoha,.*', '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-netwo=
rk,.*', '^allegro,.*', '^allegromicro,.*', '^alliedtelesis,.*', '^alliedvis=
ion,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*', '^alps,.*', '^alt,.=
*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*', '^amedi=
atech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*', '^ams=
,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*', '^anv=
o,.*', '^aoly,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^ar=
asan,.*', '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^argon4=
0,.*', '^ariaboard,.*', '^aries,.*', '^arm,.*', '^armadeus,.*', '^armsom,.*=
', '^arrow,.*', '^artesyn,.*', '^asahi-kasei,.*', '^asc,.*', '^asix,.*', '^=
aspeed,.*', '^asrock,.*', '^asteralabs,.*', '^asus,.*', '^atheros,.*', '^at=
las,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*', '^avago,.*', '^avia,.*', '^=
avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axiado,.*', '^axis,.*=
', '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^beacon,.*', '^b=
eagle,.*', '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^bl=
aize,.*', '^bluegiga,.*', '^blutek,.*', '^boe,.*', '^bosch,.*', '^boundary,=
=2E*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*', '^bticino,.*', '^buffalo,.*'=
, '^buglabs,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*', '^c=
alaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*', '=
^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdn=
s,.*', '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkp=
oint,.*', '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^=
chongzhou,.*', '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^c=
iaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.*', '^clockwork,.*', '^cloos,.*'=
, '^cloudengines,.*', '^cnm,.*', '^cnxt,.*', '^colorfly,.*', '^compal,.*', =
'^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*', '^coreriver,.=
*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',=
 '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^csr,.*', '^ctera,=
=2E*', '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^=
cyx,.*', '^cznic,.*', '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepc=
omputing,.*', '^dell,.*', '^delta,.*', '^densitron,.*', '^denx,.*', '^devan=
tech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*', '^difrnce,.*', '^digi,.*', '^=
digilent,.*', '^dimonoff,.*', '^diodes,.*', '^dioo,.*', '^djn,.*', '^dlc,.*=
', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*', '^dongwoon,.*', '^dp=
technics,.*', '^dragino,.*', '^dream,.*', '^ds,.*', '^dserve,.*', '^dynaima=
ge,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*', '^ebv,.*', '^=
eckelmann,.*', '^econet,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,=
=2E*', '^eeti,.*', '^egnite,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', =
'^element14,.*', '^elgin,.*', '^elida,.*', '^elimo,.*', '^elpida,.*', '^emb=
edfire,.*', '^embest,.*', '^emcraft,.*', '^emlid,.*', '^emmicro,.*', '^empi=
re-electronix,.*', '^emtrion,.*', '^enbw,.*', '^enclustra,.*', '^endian,.*'=
, '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*=
', '^epcos,.*', '^epfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^ettus,.*',=
 '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*',=
 '^excito,.*', '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*',=
 '^fairphone,.*', '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*',=
 '^feixin,.*', '^feiyang,.*', '^fii,.*', '^firefly,.*', '^focaltech,.*', '^=
forlinx,.*', '^foxlink,.*', '^freebox,.*', '^freecom,.*', '^frida,.*', '^fr=
iendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*', '^g=
ameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^g=
e,.*', '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', =
'^genesys,.*', '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.=
*', '^glinet,.*', '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontro=
ll,.*', '^goldelico,.*', '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,=
=2E*', '^grinn,.*', '^grmn,.*', '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^=
haochuangyi,.*', '^haoyu,.*', '^hardkernel,.*', '^hce,.*', '^headacoustics,=
=2E*', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*', '^hisi,=
=2E*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*', '=
^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hp=
e,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^huiling,.*', '^h=
wacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*'=
, '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*',=
 '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*', '^imi,.*', '^inanbo,.*',=
 '^incircuit,.*', '^incostartec,.*', '^indiedroid,.*', '^inet-tek,.*', '^in=
fineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*', '=
^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur=
,.*', '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^=
inversepath,.*', '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^iss=
i,.*', '^ite,.*', '^itead,.*', '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadar=
d,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*', '^jenson,.*', '^jesurun,.*', =
'^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*', '^jty,.*', '^kam,.*', '=
^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*', '^kiebackpeter,.*'=
, '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*', '^kobo,.=
*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.=
*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^=
lckfb,.*', '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.=
*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*=
', '^linaro,.*', '^lincolntech,.*', '^lineartechnology,.*', '^linksprite,.*=
', '^linksys,.*', '^linutronix,.*', '^linux,.*', '^linx,.*', '^liontron,.*'=
, '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*', =
'^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*=
', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack=
,.*', '^macnica,.*', '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marv=
ell,.*', '^maxbotix,.*', '^maxim,.*', '^maxlinear,.*', '^maxtor,.*', '^mbvl=
,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*', '^megachips,.*'=
, '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*', '^memsensing,.*'=
, '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*', '^merrii,.*', '^me=
thode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*', '^micron,.*',=
 '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*', '^mikrotik=
,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*', =
'^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*', '^m=
obileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*', '^motorcomm,=
=2E*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*', '^mqmaker,.*', '^m=
rvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-inno,.*', '=
^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*', '^nati=
onal,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*', '^netc=
ube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*', '^=
netxeon,.*', '^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', =
'^nextthing,.*', '^ni,.*', '^nicera,.*', '^nintendo,.*', '^nlt,.*', '^nokia=
,.*', '^nordic,.*', '^nothing,.*', '^novatech,.*', '^novatek,.*', '^novtech=
,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*', '^nvd,.*', '^nvidia,.*=
', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*', '^oki,.*', =
'^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*', '^onnn,.*=
', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*', '^openem=
bed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*', '^option,.*', '^=
oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*', '^osmc,.*'=
, '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*', '^pa=
nasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pegatron,.*', '^per=
icom,.*', '^pervasive,.*', '^phicomm,.*', '^phontech,.*', '^phytec,.*', '^p=
icochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', '^pineriver,.*', '^pixcir,.*=
', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*', '^ply,.*', '^pni=
,.*', '^pocketbook,.*', '^polaroid,.*', '^polyhex,.*', '^pool[0-3],.*', '^p=
ortwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*', '^powk=
iddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*=
', '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qe=
mu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*=
', '^quanta,.*', '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*',=
 '^raspberrypi,.*', '^raumfeld,.*', '^raydium,.*', '^rda,.*', '^realtek,.*'=
, '^relfor,.*', '^remarkable,.*', '^renesas,.*', '^rervision,.*', '^retroni=
x,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.=
*', '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^=
ronbo,.*', '^ronetix,.*', '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^sa=
ef,.*', '^sakurapi,.*', '^samsung,.*', '^samtec,.*', '^sancloud,.*', '^sand=
isk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*', '^schneider,.*', '^schule=
rcontrol,.*', '^sciosense,.*', '^sdmc,.*', '^seagate,.*', '^seeed,.*', '^se=
irobotics,.*', '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,=
=2E*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sha=
rp,.*', '^shift,.*', '^shimafuji,.*', '^shineworld,.*', '^shiratech,.*', '^=
si-en,.*', '^si-linux,.*', '^sielaff,.*', '^siemens,.*', '^sifive,.*', '^si=
flower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*', '=
^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^silic=
onmitus,.*', '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^=
sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov=
,.*', '^skyworks,.*', '^smartfiber,.*', '^smartlabs,.*', '^smartrg,.*', '^s=
mi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*', '^socionext,.*', '^solidrun,.=
*', '^solomon,.*', '^somfy,.*', '^sony,.*', '^sophgo,.*', '^sourceparts,.*'=
, '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*', '^sprd,.=
*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsso=
n,.*', '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste=
,.*', '^stericsson,.*', '^storlink,.*', '^storm,.*', '^storopack,.*', '^sum=
mit,.*', '^sunchip,.*', '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^=
swir,.*', '^syna,.*', '^synology,.*', '^synopsys,.*', '^taos,.*', '^tbs,.*'=
, '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*', '^tcs,.*', '^tcu,.*', '^tdo,.=
*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*', '^techs=
tar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*', '^tend=
a,.*', '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^th=
ine,.*', '^thingyjp,.*', '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,=
=2E*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^topic,.*', '^topland,.*', '^to=
ppoly,.*', '^topwise,.*', '^toradex,.*', '^toshiba,.*', '^toumaz,.*', '^tpk=
,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^transpeed,.*', '^traverse,.*', '=
^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*', '^turing,.*', '^tyan,=
=2E*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*', '^ucrobotics,.*'=
, '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ultratronik,.*', '^uni-t,.*', =
'^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', =
'^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs,.*', '^variscite,.*', '^vdl,.=
*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*', '^videostrong,.*=
', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*', '^vitesse,.*'=
, '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*',=
 '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand=
,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^w=
exler,.*', '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^wills=
emi,.*', '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winsen,.*', '^wins=
tar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^=
wolfvision,.*', '^x-powers,.*', '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xicor=
,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*', '^xiphera,.*', '^xln=
x,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*', '^yamaha,.*', =
'^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*', '^yna,.*', '=
^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*', '^yuzukihd,.*',=
 '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^ziniti=
x,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: syscon@1e6e=
2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regex=
es: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctr=
l(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: display@1e6=
e6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e900=
0 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: adc@1e6e910=
0 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: crypto@1e6f=
a000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-=
timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: lpc@1e78900=
0 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: timer (arm,armv7=
-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /sdram@1e6e0000:=
 failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: bus@1e600000 (as=
peed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: syscon@1e6e2000 =
(aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '=
^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0=
-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/syscon@=
1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspe=
ed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: display@1e6e6000=
 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: adc@1e6e9000 (as=
peed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: adc@1e6e9100 (as=
peed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: crypto@1e6fa000 =
(aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: timer (arm,arm=
v7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /sdram@1e6e000=
0: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac'=
, 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: bus@1e600000 (=
aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too =
long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: syscon@1e6e200=
0 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes:=
 '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@=
[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/sysco=
n@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: display@1e6e60=
00 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: adc@1e6e9000 (=
aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: adc@1e6e9100 (=
aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: crypto@1e6fa00=
0 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: lpc@1e789000 (=
aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dts:254.12-257.5: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minipack.dtb: kcs@28 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: timer (ar=
m,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /sdram@1e=
6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-=
edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: bus@1e600=
000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: syscon@1e=
6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the reg=
exes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinc=
trl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb/=
syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible:=
 ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: display@1=
e6e6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: adc@1e6e9=
000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: adc@1e6e9=
100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: crypto@1e=
6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: /ahb/apb/=
timer@1e782000: failed to match any schema with compatible: ['aspeed,ast260=
0-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dtb: lpc@1e789=
000 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/mem=
ory-controller@1e6e0000: failed to match any schema with compatible: ['aspe=
ed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/sys=
con@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['=
aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: display@1e6e=
6000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: /ahb/apb/pwm=
-tacho-controller@1e786000: failed to match any schema with compatible: ['a=
speed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: fan@1: aspee=
d,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolea=
n', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: lpc@1e789000=
 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-tiogapass.dtb: kcs@24 (aspe=
ed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi:12.11-15.4: =
Warning (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partiti=
ons/u-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/f=
lash@0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: sd-controller=
@1e740000 (aspeed,ast2500-sd-controller): sdhci@200: Unevaluated properties=
 are not allowed ('sdhci-caps-mask' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout.dtsi:9.11-12.4: Warni=
ng (unique_unit_address_if_enabled): /ahb/spi@1e620000/flash@0/partitions/u=
-boot@0: duplicate unit-address (also used in node /ahb/spi@1e620000/flash@=
0/partitions/flash0@0)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: kcs@24 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yamp.dtb: kcs@28 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: ethernet@1e=
660000 (aspeed,ast2500-mac): Unevaluated properties are not allowed ('mella=
nox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/me=
mory-controller@1e6e0000: failed to match any schema with compatible: ['asp=
eed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/sy=
scon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: [=
'aspeed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: display@1e6=
e6000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-=
timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: /ahb/apb/pw=
m-tacho-controller@1e786000: failed to match any schema with compatible: ['=
aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: fan@1: aspe=
ed,fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: lpc@1e78900=
0 (aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: lpc@1e78900=
0 (aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemitev2.dtb: kcs@24 (asp=
eed,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /sdram@1e6e0=
000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-eda=
c', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: bus@1e600000=
 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is to=
o long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
70000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: ethernet@1e6=
90000 (aspeed,ast2600-mac): Unevaluated properties are not allowed ('mellan=
ox,multi-host' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/faraday,ftgmac100.ya=
ml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: syscon@1e6e2=
000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexe=
s: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl=
(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/sys=
con@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['=
aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: display@1e6e=
6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1e6e9000=
 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1e6e9100=
 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: crypto@1e6fa=
000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/tim=
er@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-t=
imer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: lpc@1e789000=
 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: timer (arm,armv7-=
timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /sdram@1e6e0000: =
failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', '=
syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: bus@1e600000 (asp=
eed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: syscon@1e6e2000 (=
aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^=
interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-=
9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/syscon@1=
e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspee=
d,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: display@1e6e6000 =
(aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: adc@1e6e9000 (asp=
eed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: adc@1e6e9100 (asp=
eed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: crypto@1e6fa000 (=
aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: lpc@1e789000 (asp=
eed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /: failed to match =
any schema with compatible: ['ibm,bonnell-bmc', 'aspeed,ast2600']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: timer (arm,armv7-ti=
mer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /sdram@1e6e0000: fa=
iled to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sy=
scon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: bus@1e600000 (aspee=
d,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: syscon@1e6e2000 (as=
peed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^in=
terrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a=
-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/syscon@1e6=
e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,=
ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: display@1e6e6000 (a=
speed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9000 (aspee=
d,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: adc@1e6e9100 (aspee=
d,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: crypto@1e6fa000 (as=
peed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: lpc@1e789000 (aspee=
d,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dts:4002.18-4009.6: Warn=
ing (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@7,0=
/sbefifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: timer (arm,armv7-ti=
mer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /sdram@1e6e0000: fa=
iled to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sy=
scon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: bus@1e600000 (aspee=
d,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: syscon@1e6e2000 (as=
peed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^in=
terrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a=
-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/syscon@1e6=
e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,=
ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: display@1e6e6000 (a=
speed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9000 (aspee=
d,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: adc@1e6e9100 (aspee=
d,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: crypto@1e6fa000 (as=
peed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: lpc@1e789000 (aspee=
d,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: timer (arm,armv7-timer=
): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /sdram@1e6e0000: faile=
d to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sysco=
n']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: bus@1e600000 (aspeed,a=
st2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: syscon@1e6e2000 (aspee=
d,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^inter=
rupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]=
+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/syscon@1e6e20=
00/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast=
2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: display@1e6e6000 (aspe=
ed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: adc@1e6e9000 (aspeed,a=
st2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: adc@1e6e9100 (aspeed,a=
st2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: crypto@1e6fa000 (aspee=
d,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: /ahb/apb/timer@1e78200=
0: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: lpc@1e789000 (aspeed,a=
st2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: timer (arm,armv7-ti=
mer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /sdram@1e6e0000: fa=
iled to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sy=
scon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: bus@1e600000 (aspee=
d,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: syscon@1e6e2000 (as=
peed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^in=
terrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a=
-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/syscon@1e6=
e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,=
ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: display@1e6e6000 (a=
speed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9000 (aspee=
d,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: adc@1e6e9100 (aspee=
d,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: crypto@1e6fa000 (as=
peed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: lpc@1e789000 (aspee=
d,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: timer (arm,arm=
v7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /sdram@1e6e000=
0: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac'=
, 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: bus@1e600000 (=
aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too =
long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: syscon@1e6e200=
0 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes:=
 '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@=
[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/sysco=
n@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: display@1e6e60=
00 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9000 (=
aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: adc@1e6e9100 (=
aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: crypto@1e6fa00=
0 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: lpc@1e789000 (=
aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/ibm-power10-quad.dtsi:1181.18-1188.6: Warning (=
unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@3,0/sbef=
ifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: timer (arm,armv7=
-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /sdram@1e6e0000:=
 failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: bus@1e600000 (as=
peed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: syscon@1e6e2000 =
(aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '=
^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0=
-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/syscon@=
1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspe=
ed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: display@1e6e6000=
 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9000 (as=
peed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: adc@1e6e9100 (as=
peed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: crypto@1e6fa000 =
(aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: lpc@1e789000 (as=
peed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: timer (arm,armv7-timer=
): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /sdram@1e6e0000: faile=
d to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sysco=
n']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: bus@1e600000 (aspeed,a=
st2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: syscon@1e6e2000 (aspee=
d,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^inter=
rupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]=
+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/syscon@1e6e20=
00/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast=
2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: display@1e6e6000 (aspe=
ed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9000 (aspeed,a=
st2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: adc@1e6e9100 (aspeed,a=
st2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-=
9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: crypto@1e6fa000 (aspee=
d,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: /ahb/apb/timer@1e78200=
0: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: lpc@1e789000 (aspeed,a=
st2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:614.27-619.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/lpc-ctrl@80: duplicate unit-a=
ddress (also used in node /ahb/apb/lpc@1e789000/lpc-snoop@80)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: timer (arm,armv7-ti=
mer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /sdram@1e6e0000: fa=
iled to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sy=
scon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: bus@1e600000 (aspee=
d,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: syscon@1e6e2000 (as=
peed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^in=
terrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a=
-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/syscon@1e6=
e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,=
ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: display@1e6e6000 (a=
speed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: adc@1e6e9000 (aspee=
d,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: adc@1e6e9100 (aspee=
d,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: crypto@1e6fa000 (as=
peed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: lpc@1e789000 (aspee=
d,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/memory-c=
ontroller@1e6e0000: failed to match any schema with compatible: ['aspeed,as=
t2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/syscon@1=
e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspee=
d,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: display@1e6e6000 =
(aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/timer@1e=
782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: /ahb/apb/pwm-tach=
o-controller@1e786000: failed to match any schema with compatible: ['aspeed=
,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: lpc@1e789000 (asp=
eed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-intel-s2600wf.dtb: kcs@24 (aspeed,as=
t2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-fp5280g2.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@2: aspeed,f=
an-tach-ch: b'\x04\x05' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-nf5280m6.dtb: fan@3: aspeed,f=
an-tach-ch: b'\x06\x07' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dts:17.9-19.4: Warni=
ng (unit_address_vs_reg): /memory: node has a reg or ranges property, but n=
o unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: / (inspur,on526=
3m5-bmc): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: / (inspur,on526=
3m5-bmc): memory: False schema does not allow {'reg': [[2147483648, 5368709=
12]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: fan@0: aspeed,f=
an-tach-ch: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: fan@1: aspeed,f=
an-tach-ch: b'\x02\x03' is not of type 'object', 'integer', 'array', 'boole=
an', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inspur-on5263m5.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/memory-co=
ntroller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast=
2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/syscon@1e=
6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed=
,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: display@1e6e6000 (=
aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
output' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: pin-gpio-s4-hog: '=
oneOf' conditional failed, one must be fixed:
   	'input' is a required property
   	'output-high' is a required property
   	'output-low' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/timer@1e7=
82000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr630.dtb: /ahb/apb/pwm-tacho=
-controller@1e786000: failed to match any schema with compatible: ['aspeed,=
ast2500-pwm-tacho']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
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
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer (arm,=
armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /sdram@1e6e=
0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-ed=
ac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: bus@1e60000=
0 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: syscon@1e6e=
2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regex=
es: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctr=
l(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: display@1e6=
e6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e900=
0 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e910=
0 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: crypto@1e6f=
a000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-=
timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e78900=
0 (aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-lanyang.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
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
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@1: aspeed,fan-ta=
ch-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-mowgli.dtb: fan@4: aspeed,fan-ta=
ch-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000 (aspeed=
,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: lpc@1e789000 (aspeed=
,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@24 (aspeed,ast25=
00-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-nicole.dtb: kcs@28 (aspeed,ast25=
00-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-romulus.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
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
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dts:384.18-386.6: Warning=
 (unit_address_vs_reg): /ahb/apb/fsi@1e79b000/cfam@0,0/hub@3400/cfam@1,0/sb=
efifo@2400/occ: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: timer (arm,armv7-tim=
er): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /sdram@1e6e0000: fai=
led to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sys=
con']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: bus@1e600000 (aspeed=
,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: syscon@1e6e2000 (asp=
eed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^int=
errupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-=
f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/syscon@1e6e=
2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,a=
st2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: display@1e6e6000 (as=
peed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: adc@1e6e9000 (aspeed=
,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: adc@1e6e9100 (aspeed=
,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[=
0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: crypto@1e6fa000 (asp=
eed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: serial@1e783000 (snp=
s,dw-apb-uart): Unevaluated properties are not allowed ('no-loopback-test' =
was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.=
yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/memory=
-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,=
ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/syscon=
@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['asp=
eed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: display@1e6e600=
0 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/timer@=
1e782000: failed to match any schema with compatible: ['aspeed,ast2400-time=
r']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: /ahb/apb/pwm-ta=
cho-controller@1e786000: failed to match any schema with compatible: ['aspe=
ed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: lpc@1e789000 (a=
speed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the reg=
exes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: kcs@24 (aspeed,=
ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-witherspoon.dtb: kcs@28 (aspeed,=
ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl-=
[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/memory-contr=
oller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast250=
0-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/syscon@1e6e2=
000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,as=
t2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: display@1e6e6000 (asp=
eed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: display@1e6e6000 (asp=
eed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/timer@1e7820=
00: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: /ahb/apb/pwm-tacho-co=
ntroller@1e786000: failed to match any schema with compatible: ['aspeed,ast=
2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@1: aspeed,fan-tac=
h-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@2: aspeed,fan-tac=
h-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-opp-zaius.dtb: fan@3: aspeed,fan-tac=
h-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/memor=
y-controller@1e6e0000: failed to match any schema with compatible: ['aspeed=
,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/sysco=
n@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['as=
peed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: display@1e6e60=
00 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: /ahb/apb/pwm-t=
acho-controller@1e786000: failed to match any schema with compatible: ['asp=
eed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: fan@1: aspeed,=
fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean'=
, 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: lpc@1e789000 (=
aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the re=
gexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-portwell-neptune.dtb: kcs@24 (aspeed=
,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctrl=
-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: timer (arm,armv7=
-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /sdram@1e6e0000:=
 failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac', =
'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: bus@1e600000 (as=
peed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too lo=
ng
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: syscon@1e6e2000 =
(aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '=
^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0=
-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/syscon@=
1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspe=
ed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: display@1e6e6000=
 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: adc@1e6e9000 (as=
peed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: adc@1e6e9100 (as=
peed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: crypto@1e6fa000 =
(aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: gpio@1e780000 (a=
speed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', 'BMC=
_FLASH_MUX_SEL', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', 'BMC_FWSPI_RST_N', '', 'GPIO_1_BMC_3V3', '', '', '', =
'', '', 'JTAG_MUX_A', 'JTAG_MUX_B', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'SCMFPGA_SPARE_GPIO1_3V3', 'SCMFPGA_=
SPARE_GPIO2_3V3', 'SCMFPGA_SPARE_GPIO3_3V3', 'SCMFPGA_SPARE_GPIO4_3V3', 'SC=
MFPGA_SPARE_GPIO5_3V3', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: /ahb/apb/timer@1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: timer (arm,armv7-tim=
er): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /sdram@1e6e0000: fai=
led to match any schema with compatible: ['aspeed,ast2600-sdram-edac', 'sys=
con']
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: bus@1e600000 (aspeed=
,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: syscon@1e6e2000 (asp=
eed,ast2600-scu): 'smp-memram@180' does not match any of the regexes: '^int=
errupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-=
f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/syscon@1e6e=
2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,a=
st2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: display@1e6e6000 (as=
peed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9000 (aspeed=
,ast2600-adc0): 'interrupts', 'vref' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: adc@1e6e9100 (aspeed=
,ast2600-adc1): 'interrupts', 'vref' do not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: crypto@1e6fa000 (asp=
eed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: gpio@1e780000 (aspee=
d,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'PLTRST_N', '', 'PWR_DEBUG_N',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'PREQ_N', 'TCK_MUX_SEL', '',=
 '', '', '', '', 'PWRGD_SYS_PWROK', '', 'PRDY_N', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', 'SYS_BMC_PWRBTN_R_N', 'SYS_P=
WRBTN_N', 'FM_MB_RST_BTN', 'RST_BMC_RSTBTN_OUT_N', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'FP_ID_=
BTN_SCM_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', 'SMI', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'F=
M_BMC_READY_N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/memo=
ry-controller@1e6e0000: failed to match any schema with compatible: ['aspee=
d,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/sysc=
on@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['a=
speed,ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: display@1e6e6=
000 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/time=
r@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-ti=
mer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: /ahb/apb/pwm-=
tacho-controller@1e786000: failed to match any schema with compatible: ['as=
peed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: lpc@1e789000 =
(aspeed,ast2500-lpc-v2): lpc-snoop@90: 'clocks' does not match any of the r=
egexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb: kcs@24 (aspee=
d,ast2500-kcs-bmc-v2): 'clocks' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: timer (arm,=
armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /sdram@1e6e=
0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-ed=
ac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: bus@1e60000=
0 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is t=
oo long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: syscon@1e6e=
2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regex=
es: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctr=
l(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: display@1e6=
e6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: adc@1e6e900=
0 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: adc@1e6e910=
0 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: crypto@1e6f=
a000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: gpio@1e7800=
00 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '',=
 'alert-psu0-smb-r-n', 'bmc-ready', '', 'assert-cpu0-prochot-r-n', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', 'reset-sgpio-r-n', '', '', '',=
 '', '', 'scm-jtag-mux-select', '', '', '', '', '', '', '', '', '', 'reset-=
out', 'power-out', '', '', '', '', '', '', '', '', 'irq-bmc-cpu0-buf-nmi-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'ncsi-oc=
p-clk-en-n', '', '', '', '', '', '', '', '', '', '', '', 'cpu1-thermal-trip=
-n', '', '', '', '', '', '', '', '', '', 'cpu0-prochot-n', '', 'cpu1-procho=
t-n', '', 'cpu0-pe-rst0', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', 'PCH_SLP_S4_BMC_N', 'cpu0-thermtrip-n', 'alert-psu1-smb-r-n'=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'bios-rec=
overy-buf-n', '', 'assert-cpu1-prochot-r-n', '', 'power-chassis-good', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', 'platform-type', ''=
, '', '', '', '', '', '', '', '', '', '', '', 'cpld-power-break-n', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-=
timer']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: timer (ar=
m,armv7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]=
+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /sdram@1e=
6e0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-=
edac', 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: bus@1e600=
000 (aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is=
 too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: syscon@1e=
6e2000 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the reg=
exes: '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinc=
trl(@[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible:=
 ['aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: display@1=
e6e6000 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: adc@1e6e9=
000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: adc@1e6e9=
100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: crypto@1e=
6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regex=
es: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: gpio@1e78=
0000 (aspeed,ast2600-gpio): gpio-line-names: ['', '', '', '', '', '', '', '=
', 'presence-ps0', 'power-chassis-good', '', '', '', '', 'presence-ps1', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', 'power-chassis-control', '', '', '',=
 '', '', 'jtag-mux', '', '', '', '', '', '', '', '', '', 'reset-button', 'p=
ower-button', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', 'tck-mux', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', 'nmi-button', '', '', '', '', '',=
 '', '', '', '', '', 'power-config-full-load', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', ''] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: /ahb/apb/=
timer@1e782000: failed to match any schema with compatible: ['aspeed,ast260=
0-timer']
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: gpio@1e780000 (aspee=
d,ast2500-gpio): gpio-line-names: ['', '', 'led-identify', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', 'id-button', 'post-comp=
lete', '', '', '', '', 'power-chassis-good', 'platform-reset', '', '', '', =
'', 'power-button', 'power-chassis-control', 'reset-button', 'reset-control=
', 'nmi-button', 'nmi-control', '', 'led-heartbeat', '', 'clear-cmos-contro=
l', '', '', 'led-fault', '', '', '', 'BMC_PE_SMB_EN_1_N', 'BMC_PE_SMB_EN_2_=
N', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', 'BMC_PE_SMB_SW_BIT0', 'BMC_PE_SMB_SW_BIT1',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', 'BMC_SMB3_PCH_IE_SML3_EN', '', '', '', '', '', '', '', '', '', '',=
 '', ''] is too short
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@1: aspeed,fan-ta=
ch-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s7106.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/memory-cont=
roller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast25=
00-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/syscon@1e6e=
2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,a=
st2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: display@1e6e6000 (as=
peed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: gpio@1e780000 (aspee=
d,ast2500-gpio): gpio-line-names: ['', '', 'led-identify', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 'power-chassis-good', 'platform-reset', '', '', '', '', 'power-button', 'p=
ower-chassis-control', 'reset-button', 'reset-control', 'nmi-button', 'nmi-=
control', 'TSI_RESERT', 'led-heartbeat', '', 'clear-cmos-control', '', '', =
'led-fault', 'BMC_SYS_FAULT_LED_L', 'BMC_ASSERT_BIOS_WP_L', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', 'id-button', '', '', '', '', '', '', '', '=
', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', =
'', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '',=
 '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''=
, '', '', '', '', 'post-complete', '', '', '', '', '', '', '', '', '', '', =
'', 'BMC_ASSERT_BMC_READY', 'BMC_SPD_SEL', '', '', '', '', '', '', ''] is t=
oo short
   	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio=
=2Eyaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/timer@1e782=
000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: /ahb/apb/pwm-tacho-c=
ontroller@1e786000: failed to match any schema with compatible: ['aspeed,as=
t2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@2: aspeed,fan-ta=
ch-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@3: aspeed,fan-ta=
ch-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-tyan-s8036.dtb: fan@4: aspeed,fan-ta=
ch-ch: b'\x04' is not of type 'object', 'integer', 'array', 'boolean', 'nul=
l'
--
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: timer (arm,arm=
v7-timer): 'clocks' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /sdram@1e6e000=
0: failed to match any schema with compatible: ['aspeed,ast2600-sdram-edac'=
, 'syscon']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: bus@1e600000 (=
aspeed,ast2600-ahbc): compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too =
long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: syscon@1e6e200=
0 (aspeed,ast2600-scu): 'smp-memram@180' does not match any of the regexes:=
 '^interrupt-controller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@=
[0-9a-f]+)?$', '^pinctrl-[0-9]+$', '^silicon-id@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/sysco=
n@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: display@1e6e60=
00 (aspeed,ast2600-gfx): 'reg-io-width' does not match any of the regexes: =
'^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9000 (=
aspeed,ast2600-adc0): 'interrupts', 'vref' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: adc@1e6e9100 (=
aspeed,ast2600-adc1): 'interrupts', 'vref' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: crypto@1e6fa00=
0 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: /ahb/apb/timer=
@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-tim=
er']
   arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: lpc@1e789000 (=
aspeed,ast2600-lpc-v2): reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x06' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-n110.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@0: aspeed,fan-t=
ach-ch: b'\x00\x07' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01\x08' is not of type 'object', 'integer', 'array', 'boolean',=
 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-rx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02\t' is not of type 'object', 'integer', 'array', 'boolean', '=
null'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/memory-con=
troller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2=
500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/syscon@1e6=
e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,=
ast2500-p2a-ctrl']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: display@1e6e6000 (a=
speed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pin=
ctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.y=
aml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/timer@1e78=
2000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: timer@1e782000 (asp=
eed,ast2400-timer): 'fttmr010,pwm-outputs' does not match any of the regexe=
s: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio-key|gp=
io|gpmc|hdmi|i2c-gpio),.*', '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*=
', '^(pciclass|pinctrl-single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mm=
c|rcar_sound|rotary-encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plg=
pio|st-spics|ts),.*', '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*',=
 '^IBM,.*', '^ORCL,.*', '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}=
$', '^[a-zA-Z0-9+\\-._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abraco=
n,.*', '^abt,.*', '^acbel,.*', '^acelink,.*', '^acer,.*', '^acme,.*', '^act=
ions,.*', '^active-semi,.*', '^ad,.*', '^adafruit,.*', '^adapteva,.*', '^ad=
aptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*', '^admatec,.*', '^advantech,=
=2E*', '^aeroflexgaisler,.*', '^aesop,.*', '^airoha,.*', '^al,.*', '^alcate=
l,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*', '^allegromicro,.*', =
'^alliedtelesis,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alp=
hascale,.*', '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*'=
, '^amcc,.*', '^amd,.*', '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^a=
mphenol,.*', '^ampire,.*', '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbe=
rnic,.*', '^andestech,.*', '^anvo,.*', '^aoly,.*', '^aosong,.*', '^apm,.*',=
 '^apple,.*', '^aptina,.*', '^arasan,.*', '^archermind,.*', '^arcom,.*', '^=
arctic,.*', '^arcx,.*', '^argon40,.*', '^ariaboard,.*', '^aries,.*', '^arm,=
=2E*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-ka=
sei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*=
', '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvide=
a,.*', '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^ax=
entia,.*', '^axiado,.*', '^axis,.*', '^azoteq,.*', '^azw,.*', '^baikal,.*',=
 '^bananapi,.*', '^beacon,.*', '^beagle,.*', '^belling,.*', '^bhf,.*', '^bi=
gtreetech,.*', '^bitmain,.*', '^blaize,.*', '^bluegiga,.*', '^blutek,.*', '=
^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.=
*', '^bticino,.*', '^buffalo,.*', '^buglabs,.*', '^bur,.*', '^bytedance,.*'=
, '^calamp,.*', '^calao,.*', '^calaosystems,.*', '^calxeda,.*', '^cameo,.*'=
, '^canaan,.*', '^caninos,.*', '^capella,.*', '^cascoda,.*', '^catalyst,.*'=
, '^cavium,.*', '^cct,.*', '^cdns,.*', '^cdtech,.*', '^cellwise,.*', '^ceva=
,.*', '^chargebyte,.*', '^checkpoint,.*', '^chefree,.*', '^chipidea,.*', '^=
chipone,.*', '^chipspark,.*', '^chongzhou,.*', '^chrontel,.*', '^chrp,.*', =
'^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*', '^cisco,.*', '^cix,.=
*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*'=
, '^colorfly,.*', '^compal,.*', '^compulab,.*', '^comvetia,.*', '^congatec,=
=2E*', '^coolpi,.*', '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic=
,.*', '^crane,.*', '^creative,.*', '^crystalfontz,.*', '^csky,.*', '^csot,.=
*', '^csq,.*', '^csr,.*', '^ctera,.*', '^ctu,.*', '^cubietech,.*', '^cudy,.=
*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*', '^dallas,.*', '^datai=
mage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*', '^delta,.*', '^de=
nsitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*', '^dh,.*=
', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',=
 '^dioo,.*', '^djn,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^dom=
intech,.*', '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '=
^ds,.*', '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', =
'^ebs-systart,.*', '^ebv,.*', '^eckelmann,.*', '^econet,.*', '^edgeble,.*',=
 '^edimax,.*', '^edt,.*', '^ees,.*', '^eeti,.*', '^egnite,.*', '^einfochips=
,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*', '^elida,.*', '^=
elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*', '^em=
lid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enbw,.*',=
 '^enclustra,.*', '^endian,.*', '^endless,.*', '^ene,.*', '^energymicro,.*'=
, '^engicam,.*', '^engleder,.*', '^epcos,.*', '^epfl,.*', '^epson,.*', '^es=
p,.*', '^est,.*', '^ettus,.*', '^eukrea,.*', '^everest,.*', '^everspin,.*',=
 '^evervision,.*', '^exar,.*', '^excito,.*', '^exegin,.*', '^ezchip,.*', '^=
facebook,.*', '^fairchild,.*', '^fairphone,.*', '^faraday,.*', '^fascontek,=
=2E*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*', '^fii,.*', '^=
firefly,.*', '^focaltech,.*', '^forlinx,.*', '^foxlink,.*', '^freebox,.*', =
'^freecom,.*', '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^=
fxtec,.*', '^galaxycore,.*', '^gameforce,.*', '^gardena,.*', '^gateway,.*',=
 '^gateworks,.*', '^gcw,.*', '^ge,.*', '^geekbuying,.*', '^gef,.*', '^gehc,=
=2E*', '^gemei,.*', '^gemtek,.*', '^genesys,.*', '^genexis,.*', '^geniatech=
,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*', '^globalscale,.*', '^gl=
obaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*', '^goodix,.*', '^=
google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*', '^gumstix,.=
*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*', '^hardkernel,=
=2E*', '^hce,.*', '^headacoustics,.*', '^hechuang,.*', '^hideep,.*', '^hima=
x,.*', '^hirschmann,.*', '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*=
', '^holt,.*', '^holtek,.*', '^honestar,.*', '^honeywell,.*', '^hoperf,.*',=
 '^hoperun,.*', '^hp,.*', '^hpe,.*', '^hsg,.*', '^htc,.*', '^huawei,.*', '^=
hugsun,.*', '^huiling,.*', '^hwacom,.*', '^hxt,.*', '^hycon,.*', '^hydis,.*=
', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*', '^ibm,.*', '^icp=
lus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img=
,.*', '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^incostartec,.*', '^indied=
roid,.*', '^inet-tek,.*', '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^i=
ngrasys,.*', '^injoinic,.*', '^innocomm,.*', '^innolux,.*', '^inside-secure=
,.*', '^insignal,.*', '^inspur,.*', '^intel,.*', '^intercontrol,.*', '^inve=
nsense,.*', '^inventec,.*', '^inversepath,.*', '^iom,.*', '^irondevice,.*',=
 '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*', '^itian,.*', '=
^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',=
 '^jenson,.*', '^jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^jo=
z,.*', '^jty,.*', '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^=
khadas,.*', '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnov=
el,.*', '^kionix,.*', '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^=
kosagi,.*', '^kvg,.*', '^kyo,.*', '^lacie,.*', '^laird,.*', '^lamobo,.*', '=
^lantiq,.*', '^lattice,.*', '^lckfb,.*', '^lctech,.*', '^leadtek,.*', '^lee=
z,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*', '^lg,.*', '^lgphilips,.*', =
'^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*', '^lineart=
echnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.=
*', '^linx,.*', '^liontron,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^lo=
gicpd,.*', '^logictechno,.*', '^longcheer,.*', '^lontium,.*', '^loongmasses=
,.*', '^loongson,.*', '^lsi,.*', '^luckfox,.*', '^lunzn,.*', '^luxul,.*', '=
^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*', '^mantix,.*', '^mapleboa=
rd,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*', '^maxim,.*', '^maxli=
near,.*', '^maxtor,.*', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '=
^mediatek,.*', '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^=
mellanox,.*', '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^=
meraki,.*', '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^m=
icrocrystal,.*', '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips=
,.*', '^mikroe,.*', '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*'=
, '^mips,.*', '^miramems,.*', '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*',=
 '^miyoo,.*', '^mntre,.*', '^mobileye,.*', '^modtronix,.*', '^moortec,.*', =
'^mosaixtech,.*', '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '=
^mps,.*', '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^=
mti,.*', '^multi-inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^m=
xicy,.*', '^myir,.*', '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelit=
y,.*', '^neonode,.*', '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netro=
n-dy,.*', '^netronix,.*', '^netxeon,.*', '^neweast,.*', '^newhaven,.*', '^n=
ewvision,.*', '^nexbox,.*', '^nextthing,.*', '^ni,.*', '^nicera,.*', '^nint=
endo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*', '^novatech,.=
*', '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton=
,.*', '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.=
*', '^okaya,.*', '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie=
,.*', '^onion,.*', '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*=
', '^opencores,.*', '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^o=
penwrt,.*', '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '=
^osddisplays,.*', '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxse=
mi,.*', '^ozzmaker,.*', '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pd=
a,.*', '^pegatron,.*', '^pericom,.*', '^pervasive,.*', '^phicomm,.*', '^pho=
ntech,.*', '^phytec,.*', '^picochip,.*', '^pinctrl-[0-9]+$', '^pine64,.*', =
'^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*',=
 '^plx,.*', '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^polyh=
ex,.*', '^pool[0-3],.*', '^portwell,.*', '^poslab,.*', '^pov,.*', '^powerti=
p,.*', '^powervr,.*', '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,=
=2E*', '^probox2,.*', '^prt,.*', '^pulsedlight,.*', '^purism,.*', '^puya,.*=
', '^qca,.*', '^qcom,.*', '^qemu,.*', '^qi,.*', '^qiaodian,.*', '^qihua,.*'=
, '^qishenglong,.*', '^qnap,.*', '^quanta,.*', '^radxa,.*', '^raidsonic,.*'=
, '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*', '^raumfeld,.*', '^raydium=
,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.=
*', '^rervision,.*', '^retronix,.*', '^revotics,.*', '^rex,.*', '^richtek,.=
*', '^ricoh,.*', '^rikomagic,.*', '^riot,.*', '^riscv,.*', '^rockchip,.*', =
'^rocktech,.*', '^rohm,.*', '^ronbo,.*', '^ronetix,.*', '^roofull,.*', '^ro=
seapplepi,.*', '^rve,.*', '^saef,.*', '^sakurapi,.*', '^samsung,.*', '^samt=
ec,.*', '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,=
=2E*', '^schneider,.*', '^schulercontrol,.*', '^sciosense,.*', '^sdmc,.*', =
'^seagate,.*', '^seeed,.*', '^seirobotics,.*', '^semtech,.*', '^senseair,.*=
', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*', '^sff,.*', '^sgd,.*', '=
^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*', '^shine=
world,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^sielaff,.*', '^s=
iemens,.*', '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*'=
, '^silabs,.*', '^silan,.*', '^silead,.*', '^silergy,.*', '^silex-insight,.=
*', '^siliconfile,.*', '^siliconmitus,.*', '^silvaco,.*', '^simtek,.*', '^s=
inlinx,.*', '^sinovoip,.*', '^sinowealth,.*', '^sipeed,.*', '^sirf,.*', '^s=
is,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*', '^smartfiber,.*', '^sma=
rtlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',=
 '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^somfy,.*', '^sony,.*', '=
^sophgo,.*', '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,=
=2E*', '^spinalhdl,.*', '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^s=
star,.*', '^st,.*', '^st-ericsson,.*', '^starfive,.*', '^starry,.*', '^star=
tek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*', '^storlink,.*', '^s=
torm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*', '^sundance,.*', '^s=
unplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*', '^synology,.*', '^syn=
opsys,.*', '^taos,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*=
', '^tcs,.*', '^tcu,.*', '^tdo,.*', '^team-source-display,.*', '^technexion=
,.*', '^technologic,.*', '^techstar,.*', '^techwell,.*', '^teejet,.*', '^te=
ltonika,.*', '^tempo,.*', '^tenda,.*', '^terasic,.*', '^tesla,.*', '^test,.=
*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*', '^thundercomm,.*',=
 '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*', '^topeet,.*', '^=
topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*', '^to=
shiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*', '^tr=
anspeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^=
tsd,.*', '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', =
'^ubnt,.*', '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^ul=
tratronik,.*', '^uni-t,.*', '^uniwest,.*', '^upisemi,.*', '^urt,.*', '^usi,=
=2E*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^valve,.*', '^vamrs=
,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*',=
 '^vicor,.*', '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*',=
 '^visionox,.*', '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '=
^voipac,.*', '^voltafield,.*', '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.=
*', '^wanchanglong,.*', '^wand,.*', '^waveshare,.*', '^wd,.*', '^we,.*', '^=
welltech,.*', '^wetek,.*', '^wexler,.*', '^whwave,.*', '^wi2wi,.*', '^widor=
a,.*', '^wiligear,.*', '^willsemi,.*', '^winbond,.*', '^wingtech,.*', '^win=
link,.*', '^winsen,.*', '^winstar,.*', '^wirelesstag,.*', '^wits,.*', '^wlf=
,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*', '^xen,.*', '^=
xes,.*', '^xiaomi,.*', '^xicor,.*', '^xillybus,.*', '^xingbangda,.*', '^xin=
peng,.*', '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*=
', '^yadro,.*', '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yimin=
g,.*', '^ylm,.*', '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^=
yuridenki,.*', '^yuzukihd,.*', '^zarlink,.*', '^zealz,.*', '^zeitec,.*', '^=
zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*', '^zyxel,.*'
   	from schema $id: http://devicetree.org/schemas/vendor-prefixes.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: /ahb/apb/pwm-tacho-=
controller@1e786000: failed to match any schema with compatible: ['aspeed,a=
st2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@1: aspeed,fan-t=
ach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@2: aspeed,fan-t=
ach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-vegman-sx20.dtb: fan@3: aspeed,fan-t=
ach-ch: b'\x03' is not of type 'object', 'integer', 'array', 'boolean', 'nu=
ll'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
