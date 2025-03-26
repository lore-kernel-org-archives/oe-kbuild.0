Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B51B78F3
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Mar 2025 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742985813; cv=none; b=bz1R4+yEVC6i0EQ7P+1hpiJZNJSgYw/u7U5qc+lt42UZZqxl4mrvPhT7Tr1RVRJAlO3Qk3ZDxdUWQbun43qIK8n079CUzwXc+Ok8/AHwVWDA0ol7007ox/C7MrJarGVmpsf0J0EcwszWml34m2jydFxsbsvAfh86w6yGn8QMoWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742985813; c=relaxed/simple;
	bh=MkMw0oeiF1DOA+bCGmnetFntibFvf3rAw0ZI1RL7BOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q629NUrSwtVP5yOXO483yPkPoQ7SjPW+5FgNcFxZ3ZMHOCRmVVeNz9XomDf1oZwEut0wabxIcsMueNSaPvS43WTT0GsvDap+yddyr5YIQRsZkAQP+LMPRvMTYPKcivney5CAgl6QmzcZCWJKh8BQQmrvQfOG0sIjvkgLHHLs+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB/XFF44; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB/XFF44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742985810; x=1774521810;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MkMw0oeiF1DOA+bCGmnetFntibFvf3rAw0ZI1RL7BOQ=;
  b=CB/XFF44k4ECQhlJysUADoqqRrnhsYXmJSqcREmTd/pQIcOYYMJ06eOi
   F18ZwS2P1S3PyHwsPx5k4WK+GdUbum17STIQeT0nky3IU1uVMZyVc0Mtu
   cv0JlbMaXQbUQ7hVYe0sYZQXs1DQZvTuLR0J19O7K5C+3gYsetB9HlOvK
   eifztpYLcNngZWxxGAxnLc12XeRrdBnwlUJRyYkZtkqZTZpFzbChsQ5W6
   Z0pFnzLPVOpb/viHYIO17eOmYH+tA3mnVV7TRBqFAv8TofAWs/3t+8fE0
   SBJDgtGx1RAQDIH63BO1yNhmctnB16FjBpA2zhivq+5bqMnTBl3e4lvbL
   g==;
X-CSE-ConnectionGUID: ZFCaU3oyQGCeP0zrG8XCfQ==
X-CSE-MsgGUID: AQlYohK3Rfa/urCvlv2l8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43992485"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="43992485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 03:43:30 -0700
X-CSE-ConnectionGUID: NDrm/XoMQomg2CxPJPY0mA==
X-CSE-MsgGUID: 9AoJxJKZSLOhttHGYZK+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="128867665"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2025 03:43:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txOEI-0005f1-1Y;
	Wed, 26 Mar 2025 10:43:26 +0000
Date: Wed, 26 Mar 2025 18:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
Message-ID: <202503261822.6TZMrT2b-lkp@intel.com>
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
In-Reply-To: <20250312045802.4115029-1-wthai@nvidia.com>
References: <20250312045802.4115029-1-wthai@nvidia.com>
TO: Willie Thai <wthai@nvidia.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: joel@jms.id.au
TO: andrew@codeconstruct.com.au
TO: kees@kernel.org
TO: tony.luck@intel.com
TO: gpiccoli@igalia.com
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: linux-hardening@vger.kernel.org
TO: openbmc@lists.ozlabs.org
CC: wthai@nvidia.com
CC: leohu@nvidia.com
CC: tingkaic@nvidia.com
CC: dkodihalli@nvidia.com
CC: maryang@nvidia.com
CC: pmenzel@molgen.mpg.de
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

Hi Willie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc7 next-20250321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Willie-Thai/ARM-dts-=
aspeed-Add-device-tree-for-Nvidia-s-GB200NVL-BMC/20250312-125950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20250312045802.4115029-1-wthai%40n=
vidia.com
patch subject: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's GB=
200NVL BMC
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-052-20250313 (https://download.01.org/0day-ci/archiv=
e/20250326/202503261822.6TZMrT2b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250326/202503261822.6TZMrT2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503261822.6TZMrT2b-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi:634.36-638.7: Warning (unique_un=
it_address_if_enabled): /ahb/apb/lpc@1e789000/reset-controller@98: duplicat=
e unit-address (also used in node /ahb/apb/lpc@1e789000/uart-routing@98)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /: compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	'nvidia,gb200nvl-bmc' is not one of ['delta,ahe50dc-bmc', 'facebook,gal=
axy100-bmc', 'facebook,wedge100-bmc', 'facebook,wedge40-bmc', 'microsoft,ol=
ympus-bmc', 'quanta,q71l-bmc', 'tyan,palmetto-bmc', 'yadro,vesnin-bmc']
   	'nvidia,gb200nvl-bmc' is not one of ['amd,daytonax-bmc', 'amd,ethanolx-=
bmc', 'ampere,mtjade-bmc', 'aspeed,ast2500-evb', 'asrock,e3c246d4i-bmc', 'a=
srock,e3c256d4i-bmc', 'asrock,romed8hm3-bmc', 'asrock,spc621d8hm3-bmc', 'as=
rock,x570d4u-bmc', 'bytedance,g220a-bmc', 'facebook,cmm-bmc', 'facebook,min=
ipack-bmc', 'facebook,tiogapass-bmc', 'facebook,yamp-bmc', 'facebook,yosemi=
tev2-bmc', 'facebook,wedge400-bmc', 'hxt,stardragon4800-rep2-bmc', 'ibm,mih=
awk-bmc', 'ibm,mowgli-bmc', 'ibm,romulus-bmc', 'ibm,swift-bmc', 'ibm,wither=
spoon-bmc', 'ingrasys,zaius-bmc', 'inspur,fp5280g2-bmc', 'inspur,nf5280m6-b=
mc', 'inspur,on5263m5-bmc', 'intel,s2600wf-bmc', 'inventec,lanyang-bmc', 'l=
enovo,hr630-bmc', 'lenovo,hr855xg2-bmc', 'portwell,neptune-bmc', 'qcom,cent=
riq2400-rep-bmc', 'supermicro,x11spi-bmc', 'tyan,s7106-bmc', 'tyan,s8036-bm=
c', 'yadro,nicole-bmc', 'yadro,vegman-n110-bmc', 'yadro,vegman-rx20-bmc', '=
yadro,vegman-sx20-bmc']
   	'nvidia,gb200nvl-bmc' is not one of ['ampere,mtjefferson-bmc', 'ampere,=
mtmitchell-bmc', 'aspeed,ast2600-evb', 'aspeed,ast2600-evb-a1', 'asus,x4tf-=
bmc', 'facebook,bletchley-bmc', 'facebook,catalina-bmc', 'facebook,cloudrip=
per-bmc', 'facebook,elbert-bmc', 'facebook,fuji-bmc', 'facebook,greatlakes-=
bmc', 'facebook,harma-bmc', 'facebook,minerva-cmc', 'facebook,yosemite4-bmc=
', 'ibm,blueridge-bmc', 'ibm,everest-bmc', 'ibm,fuji-bmc', 'ibm,rainier-bmc=
', 'ibm,sbp1-bmc', 'ibm,system1-bmc', 'ibm,tacoma-bmc', 'inventec,starscrea=
m-bmc', 'inventec,transformer-bmc', 'jabil,rbp-bmc', 'qcom,dc-scm-v1-bmc', =
'quanta,s6q-bmc', 'ufispace,ncplite-bmc']
   	'aspeed,ast2400' was expected
   	'aspeed,ast2500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/aspeed/aspeed.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /: failed t=
o match any schema with compatible: ['nvidia,gb200nvl-bmc', 'aspeed,ast2600=
']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: timer: 'clo=
cks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer.yam=
l#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /sdram@1e6e=
0000: failed to match any schema with compatible: ['aspeed,ast2600-sdram-ed=
ac', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: bus@1e60000=
0: compatible: ['aspeed,ast2600-ahbc', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/bus/aspeed,ast2600-ahbc.=
yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: syscon@1e6e=
2000: 'smp-memram@180' does not match any of the regexes: '^interrupt-contr=
oller@[0-9a-f]+$', '^p2a-control@[0-9a-f]+$', '^pinctrl(@[0-9a-f]+)?$', '^s=
ilicon-id@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.y=
aml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pinctrl: em=
mcg5_default:groups:0: 'EMMCG5' is not one of ['ADC0', 'ADC1', 'ADC10', 'AD=
C11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', '=
ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMCG1', 'EMMCG4', 'EMMCG8', 'ESP=
I', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', '=
GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPI=
U0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'HVI3C3=
', 'HVI3C4', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', =
'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I=
3C1', 'I3C2', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'L=
PC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2',=
 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCSI3', 'NCSI=
4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4',=
 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'N=
RI1', 'NRI2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK',=
 'PEWAKE', 'PWM0', 'PWM1', 'PWM10G0', 'PWM10G1', 'PWM11G0', 'PWM11G1', 'PWM=
12G0', 'PWM12G1', 'PWM13G0', 'PWM13G1', 'PWM14G0', 'PWM14G1', 'PWM15G0', 'P=
WM15G1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8G0', 'PWM8G1'=
, 'PWM9G0', 'PWM9G1', 'QSPI1', 'QSPI2', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMI=
I4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'S=
ALT1', 'SALT10G0', 'SALT10G1', 'SALT11G0', 'SALT11G1', 'SALT12G0', 'SALT12G=
1', 'SALT13G0', 'SALT13G1', 'SALT14G0', 'SALT14G1', 'SALT15G0', 'SALT15G1',=
 'SALT16G0', 'SALT16G1', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT=
7', 'SALT8', 'SALT9G0', 'SALT9G1', 'SD1', 'SD2', 'SD3', 'SGPM1', 'SGPM2', '=
SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', '=
SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', =
'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH=
13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH=
7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', '=
TXD3', 'TXD4', 'UART10', 'UART11', 'UART12G0', 'UART12G1', 'UART13G0', 'UAR=
T13G1', 'UART6', 'UART7', 'UART8', 'UART9', 'USBA', 'USBB', 'VB', 'VGAHS', =
'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	from schema $id: http://devicetree.org/schemas/pinctrl/aspeed,ast2600-p=
inctrl.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sy=
scon@1e6e2000/smp-memram@180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sy=
scon@1e6e2000/interrupt-controller@560: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic0']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sy=
scon@1e6e2000/interrupt-controller@570: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic1']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/di=
splay@1e6e6000: failed to match any schema with compatible: ['aspeed,ast260=
0-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e900=
0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: adc@1e6e910=
0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-a=
dc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: crypto@1e6f=
a000: 'aspeed,ahbc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-ac=
ry.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/vi=
deo@1e700000: failed to match any schema with compatible: ['aspeed,ast2600-=
video-engine']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/ti=
mer@1e782000: failed to match any schema with compatible: ['aspeed,ast2600-=
timer']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e78900=
0: lpc-snoop@80: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]=
+'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: lpc@1e78900=
0: reg-io-width: 4 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed-lpc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@24: 'cl=
ocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@28: 'cl=
ocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@2c: 'cl=
ocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: kcs@114: 'c=
locks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/ipmi/aspeed,ast2400-kcs-=
bmc.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lp=
c@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast=
2600-lhc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/lp=
c@1e789000/ibt@140: failed to match any schema with compatible: ['aspeed,as=
t2600-ibt-bmc']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e74000=
0: sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: sdc@1e74000=
0: sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sd=
c@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['as=
peed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/sd=
c@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['as=
peed,ast2600-sdhci', 'sdhci']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c@80: Une=
valuated properties are not allowed ('disable-master' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
71: $nodename:0: 'i2c-switch@71' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
71: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
74: $nodename:0: 'i2c-switch@74' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
74: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
72: $nodename:0: 'i2c-switch@72' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
72: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
73: $nodename:0: 'i2c-switch@73' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
73: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
70: $nodename:0: 'i2c-switch@70' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
70: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
75: $nodename:0: 'i2c-switch@75' does not match '^(i2c-?)?mux'
--
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
75: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
74: $nodename:0: 'i2c-switch@74' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
74: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
76: $nodename:0: 'i2c-switch@76' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
76: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@20=
: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0=
-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@23=
: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0=
-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yam=
l#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@2c=
: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0=
-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yam=
l#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: max31790@2f=
: '#address-cells', '#size-cells' do not match any of the regexes: '^fan-[0=
-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/maxim,max31790.yam=
l#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@20:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@21:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@27:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: pca9555@74:=
 '#address-cells', '#size-cells' do not match any of the regexes: '^(hog-[0=
-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: $nodename:0: 'i2c-switch@77' does not match '^(i2c-?)?mux'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: i2c-switch@=
77: Unevaluated properties are not allowed ('#address-cells', '#size-cells'=
, 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b00=
0: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-m=
aster.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fs=
i@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fs=
i-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: fsi@1e79b10=
0: compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-m=
aster.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/fs=
i@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fs=
i-master', 'fsi-master']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-gb200nvl-bmc.dtb: /ahb/apb/dm=
a-controller@1e79e000: failed to match any schema with compatible: ['aspeed=
,ast2600-udma']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
