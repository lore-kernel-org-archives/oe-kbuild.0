Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3E10785
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Aug 2025 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754813865; cv=none; b=N02nYj2gUeAwpB0twe5hu4P3QXAMbcwnX9R83ucbfjDunNX/S691MCpR8XJbQI++DZxLUkzwFayxcabTGR5W9MGQlMhbGeg1G62A81DVDe1Aq3frU2snltsMCUMJcaxjZgrkmNTF+pP3LNrXGnkAzogjPE8pcF8QB8DsuIjElqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754813865; c=relaxed/simple;
	bh=BSHL3P/2h0ojWK2jKhE1sDXVHeA8kSKGOgEiJnEPKDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrhWvZ09elAw6kER1e1hXlMtcy67GMaSgYxnuc1kTlvfAHGy5wAStyQ0IUvtWvafhZ1JHPLe163jNWhuwQNuS4QSQIvYc3M4EMBXzwWWlv+Cm1OoyFjPoRu9lT0ecQNwI5hFxBF6U+5pmMQarbemBO66nBbqq8j5H0Xr9uCxWfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2kgm58y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2kgm58y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754813856; x=1786349856;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BSHL3P/2h0ojWK2jKhE1sDXVHeA8kSKGOgEiJnEPKDs=;
  b=P2kgm58y+4bz2BK39Ep5Qw2PoeKONJyc+yN+gOb1HOu2XjW89PUF95wU
   cemXCKoVkw/rJOs9kTeYOuBpyREc39gUJNR+kB0vCeXeaSa9tHV0TgTXz
   kGFqlKzz8najLCIRN5NLn857UCApQ9cJTV4IYbBRLvJD89HprVho2wesW
   bjWYjCL/00UjkLL0SPz2O6OgtzLnWmsSW59U2PqYioqF7wqmiaYrgKMO7
   akcUW2WYukY9GzPYlC27wFytJmiskLuxWsROZHKNFlwe3hdjFwkIKevMX
   BGHEjua4441JvbwEzazrLJP7YkWzILTu6mgskn4YgDvijfY6UzVuJyFjV
   w==;
X-CSE-ConnectionGUID: bmk4BhIMRf61WgtVvkJwtw==
X-CSE-MsgGUID: viW7st79SRSvXU8YE+r6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="57019041"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57019041"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2025 01:17:35 -0700
X-CSE-ConnectionGUID: xBz5gOvqTIS5TCjjoqvmxw==
X-CSE-MsgGUID: Vm42XYjQTQ+PjWshKAkDBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="171012147"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Aug 2025 01:17:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ul1FC-0005Ds-1r;
	Sun, 10 Aug 2025 08:17:30 +0000
Date: Sun, 10 Aug 2025 16:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801] arch/powerpc/boot/dts/a3m071.dtb:
 timer@600 (fsl,mpc5200b-gpt): #gpio-cells: [2] is not of type 'integer'
Message-ID: <202508101636.U67kqeqd-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-c=
onvert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux=
: Convert adi,adgs1408 to DT schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-052-20250807 (https://download.01.org/0day-ci/ar=
chive/20250810/202508101636.U67kqeqd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250810/202508101636.U67kqeqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508101636.U67kqeqd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/a3m071.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
   arch/powerpc/boot/dts/a3m071.dtb: /: failed to match any schema with com=
patible: ['anonymous,a3m071']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/a3m071.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a3m071.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a3m071.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a3m071.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/a3m071.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/a3m071.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a3m071.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
>> arch/powerpc/boot/dts/a3m071.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a3m071.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a3m071.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a3m071.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/a3m071.dtb: usb@1000 (fsl,mpc5200b-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/a4m072.dtb: /: failed to match any schema with com=
patible: ['anonymous,a4m072']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/a4m072.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a4m072.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/a4m072.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/a4m072.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/a4m072.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a4m072.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
>> arch/powerpc/boot/dts/a4m072.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/a4m072.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a4m072.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/a4m072.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/a4m072.dtb: usb@1000 (fsl,mpc5200b-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/charon.dts:206.13-210.5: Warning (simple_bus_reg):=
 /localbus/mram0@3,0: simple-bus unit address format error, expected "30000=
0000"
   arch/powerpc/boot/dts/charon.dts:125.17-131.5: Warning (unique_unit_addr=
ess_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (a=
lso used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/charon.dtb: /: failed to match any schema with com=
patible: ['anon,charon']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/charon.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/charon.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/charon.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/charon.dtb: usb@1000 (fsl,mpc5200-ohci): 'interrup=
ts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/charon.dtb: usb@1000 (fsl,mpc5200-ohci): compatibl=
e: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500'=
, 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL,=
PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+', =
'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathro=
w', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', 'K=
2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'keyl=
argo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', '=
MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-me=
dia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', 'P=
owerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,5=
', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerBo=
ok5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'Po=
werBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5'=
, 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac1=
1,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerMa=
c3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerMa=
c4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerMa=
c8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,1=
', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensors=
', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart', =
'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-r=
ng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460e=
x-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypto=
', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic',=
 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,C=
BEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Moment=
um,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc5200=
b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintendo=
,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,hol=
lywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-sr=
nprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682m=
-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,pw=
rficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc', =
'sony,ps3', 'sti,platform-spider-pic']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', 'i=
sa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW,=
bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,=
kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,s=
mbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf=
-mau']
   	'fsl,mpc5200-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,=
uml']
--
   arch/powerpc/boot/dts/cm5200.dtb: Warning (interrupt_map): Failed prereq=
uisite 'interrupt_provider'
   arch/powerpc/boot/dts/cm5200.dtb: /: failed to match any schema with com=
patible: ['schindler,cm5200']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/cm5200.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/cm5200.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/cm5200.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/cm5200.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/cm5200.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/cm5200.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/cm5200.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
>> arch/powerpc/boot/dts/cm5200.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/cm5200.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/cm5200.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/cm5200.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/cm5200.dtb: usb@1000 (fsl,mpc5200b-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/digsy_mtc.dtb: /: failed to match any schema with =
compatible: ['intercontrol,digsy-mtc']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000: failed to match =
any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
>> arch/powerpc/boot/dts/digsy_mtc.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/digsy_mtc.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/digsy_mtc.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/digsy_mtc.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/digsy_mtc.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
>> arch/powerpc/boot/dts/digsy_mtc.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/digsy_mtc.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
>> arch/powerpc/boot/dts/digsy_mtc.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/digsy_mtc.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/digsy_mtc.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/digsy_mtc.dtb: usb@1000 (fsl,mpc5200b-ohci): 'inte=
rrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/digsy_mtc.dtb: usb@1000 (fsl,mpc5200b-ohci): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000: failed to match an=
y schema with compatible: ['fsl,mpc8360-immr', 'simple-bus']
   arch/powerpc/boot/dts/kmeter1.dtb: i2c@3000 (fsl,mpc8313-i2c): Unevaluat=
ed properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: serial@4500 (fsl,ns16550): Unevaluate=
d properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to =
match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to =
match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400: failed=
 to match any schema with compatible: ['fsl,mpc8360-par_io']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-co=
ntroller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-p=
ario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-co=
ntroller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-p=
ario-bank', 'fsl,mpc8323-qe-pario-bank']
>> arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pa=
rio-bank): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pa=
rio-bank): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): $nodename:0: 'qe@=
100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|ap=
b)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl=
,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-control=
ler@80: '#address-cells', 'big-endian' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-control=
ler@80:interrupts: [[32, 8], [33, 8], [34, 8], [35, 8], [40, 8], [41, 8], [=
42, 8], [43, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl=
,qe'] is too short
--
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@620: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@630: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@640: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@650: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@660: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/timer@670: failed =
to match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/rtc@800: failed to=
 match any schema with compatible: ['fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/can@900: failed to=
 match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/can@980: failed to=
 match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/gpio@b00: failed t=
o match any schema with compatible: ['fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/lite5200.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/lite5200.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/gpio@c00: failed t=
o match any schema with compatible: ['fsl,mpc5200-gpio-wkup']
>> arch/powerpc/boot/dts/lite5200.dtb: gpio@c00 (fsl,mpc5200-gpio-wkup): #g=
pio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/lite5200.dtb: gpio@c00 (fsl,mpc5200-gpio-wkup): #g=
pio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/lite5200.dtb: /soc5200@f0000000/spi@f00: failed to=
 match any schema with compatible: ['fsl,mpc5200-spi']
   arch/powerpc/boot/dts/lite5200.dtb: usb@1000 (fsl,mpc5200-ohci): 'interr=
upts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/lite5200.dtb: usb@1000 (fsl,mpc5200-ohci): compati=
ble: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500'=
, 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL,=
PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+', =
'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathro=
w', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', 'K=
2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'keyl=
argo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', '=
MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-me=
dia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', 'P=
owerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,5=
', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerBo=
ok5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'Po=
werBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5'=
, 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac1=
1,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerMa=
c3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerMa=
c4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerMa=
c8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,1=
', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensors=
', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart', =
'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-r=
ng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460e=
x-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypto=
', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic',=
 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,C=
BEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Moment=
um,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc5200=
b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintendo=
,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,hol=
lywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-sr=
nprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682m=
-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,pw=
rficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc', =
'sony,ps3', 'sti,platform-spider-pic']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', 'i=
sa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW,=
bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,=
kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,s=
mbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf=
-mau']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/media5200.dtb: /: failed to match any schema with =
compatible: ['fsl,media5200']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000: failed to match =
any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
>> arch/powerpc/boot/dts/media5200.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/media5200.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/media5200.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/media5200.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/media5200.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
>> arch/powerpc/boot/dts/media5200.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/media5200.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
>> arch/powerpc/boot/dts/media5200.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/media5200.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/media5200.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/media5200.dtb: usb@1000 (fsl,mpc5200b-ohci): 'inte=
rrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/media5200.dtb: usb@1000 (fsl,mpc5200b-ohci): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   	{'isa': [0], 'usable-privilege': [7], 'os-support': [0], 'hwcap-bit-nr'=
: [1]} is not of type 'boolean'
   	{'isa': [0], 'usable-privilege': [7], 'os-support': [0], 'hwcap-bit-nr'=
: [1]} is not of type 'null'
   	from schema $id: http://devicetree.org/schemas/reg.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: /soc@c0000000/interrupt-controller@=
4000: failed to match any schema with compatible: ['openpower,xics-presenta=
tion', 'ibm,ppc-xicp']
   arch/powerpc/boot/dts/microwatt.dtb: /soc@c0000000/interrupt-controller@=
4000: failed to match any schema with compatible: ['openpower,xics-presenta=
tion', 'ibm,ppc-xicp']
   arch/powerpc/boot/dts/microwatt.dtb: /soc@c0000000/interrupt-controller@=
5000: failed to match any schema with compatible: ['openpower,xics-sources']
   arch/powerpc/boot/dts/microwatt.dtb: serial@2000 (ns16550): Unevaluated =
properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: gpio@7000 (faraday,ftgpio010): 'dev=
ice_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.y=
aml#
>> arch/powerpc/boot/dts/microwatt.dtb: gpio@7000 (faraday,ftgpio010): #gpi=
o-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/faraday,ftgpio010.y=
aml#
>> arch/powerpc/boot/dts/microwatt.dtb: gpio@7000 (faraday,ftgpio010): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/microwatt.dtb: gpio@7000 (faraday,ftgpio010): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: ethernet@8020000 (litex,liteeth): r=
eg-names:1: 'mdio' was expected
   	from schema $id: http://devicetree.org/schemas/net/litex,liteeth.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: mmc@8040000 (litex,mmc): 'bus-width=
' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mmc/litex,mmc.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: mmc@8040000 (litex,mmc): 'vmmc-supp=
ly' is a required property
   	from schema $id: http://devicetree.org/schemas/mmc/litex,mmc.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: chosen: 'ibm,architecture-vec-5' do=
es not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/powerpc/boot/dts/microwatt.dtb: chosen: ibm,architecture-vec-5: b'\=
x19\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00=
\x00\x00\x00\x00\x00@\x00@' is not of type 'object', 'integer', 'array', 'b=
oolean', 'null'
--
   arch/powerpc/boot/dts/motionpro.dtb: Warning (interrupt_map): Failed pre=
requisite 'interrupt_provider'
   arch/powerpc/boot/dts/motionpro.dtb: /: failed to match any schema with =
compatible: ['promess,motionpro']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000: failed to match =
any schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/cdm@200: failed t=
o match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/interrupt-control=
ler@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', '=
fsl,mpc5200-pic']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@600: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
>> arch/powerpc/boot/dts/motionpro.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@610: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@620: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
--
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: timer@640 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@650: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@650: failed=
 to match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt=
']
   arch/powerpc/boot/dts/motionpro.dtb: timer@650 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: timer@650 (fsl,mpc5200b-gpt): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@660: failed=
 to match any schema with compatible: ['promess,motionpro-led']
>> arch/powerpc/boot/dts/motionpro.dtb: timer@660 (promess,motionpro-led): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: timer@660 (promess,motionpro-led): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/timer@670: failed=
 to match any schema with compatible: ['promess,motionpro-led']
   arch/powerpc/boot/dts/motionpro.dtb: timer@670 (promess,motionpro-led): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: timer@670 (promess,motionpro-led): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/rtc@800: failed t=
o match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@900: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/can@980: failed t=
o match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-msc=
an']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@b00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpi=
o']
>> arch/powerpc/boot/dts/motionpro.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/gpio@c00: failed =
to match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc520=
0-gpio-wkup']
>> arch/powerpc/boot/dts/motionpro.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/motionpro.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/motionpro.dtb: /soc5200@f0000000/spi@f00: failed t=
o match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/motionpro.dtb: usb@1000 (fsl,mpc5200b-ohci): 'inte=
rrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/motionpro.dtb: usb@1000 (fsl,mpc5200b-ohci): compa=
tible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: i2c@3100 (fsl-i2c): Unevaluated p=
roperties are not allowed ('compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: usb@23000 (fsl-usb2-dr): Unevalua=
ted properties are not allowed ('#address-cells', '#size-cells' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4500 (fsl,ns16550): Uneval=
uated properties are not allowed ('cell-index', 'device_type' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4600 (fsl,ns16550): Uneval=
uated properties are not allowed ('cell-index', 'device_type' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpi=
o-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/interrupt-controll=
er@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): comp=
atible:0: 'fsl,mpc5121-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): comp=
atible: ['fsl,mpc8308-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): inte=
rrupts: [[3, 8], [94, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: dma@2c000 (fsl,mpc8308-dma): '#dm=
a-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
--
   arch/powerpc/boot/dts/mpc8308rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated pr=
operties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: usb@23000 (fsl-usb2-dr): Unevaluat=
ed properties are not allowed ('#address-cells', '#size-cells' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4500 (fsl,ns16550): Unevalu=
ated properties are not allowed ('cell-index', 'device_type' were unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4600 (fsl,ns16550): Unevalu=
ated properties are not allowed ('cell-index', 'device_type' were unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): 'devi=
ce_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpio=
-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: gpio@c00 (fsl,mpc8308-gpio): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/interrupt-controlle=
r@700: failed to match any schema with compatible: ['fsl,ipic']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): compa=
tible:0: 'fsl,mpc5121-dma' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): compa=
tible: ['fsl,mpc8308-dma'] is too short
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): inter=
rupts: [[3, 8], [94, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: dma@2c000 (fsl,mpc8308-dma): '#dma=
-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mpc5121-dma.yaml#
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: / (fsl,mpc8377wlan): 'model' is =
a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: localbus@e0005000 (fsl,mpc8377-e=
lbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to ma=
tch any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bu=
s']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /localbus@e0005000: failed to ma=
tch any schema with compatible: ['fsl,mpc8377-elbc', 'fsl,elbc', 'simple-bu=
s']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: immr@e0000000 (simple-bus): $nod=
ename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localb=
us|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/wdt@200: failed t=
o match any schema with compatible: ['mpc83xx_wdt']
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00 (fsl,mpc8377=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00 (fsl,mpc8377=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@c00 (fsl,mpc8377=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00 (fsl,mpc8377=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00 (fsl,mpc8377=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: gpio-controller@d00 (fsl,mpc8377=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: sleep-nexus (simple-bus): $noden=
ame:0: 'sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|s=
oc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: i2c@3000 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/mucmc52.dtb: /: failed to match any schema with co=
mpatible: ['manroland,mucmc52']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000: failed to match an=
y schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/cdm@200: failed to =
match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/cdm@200: failed to =
match any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/interrupt-controlle=
r@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fs=
l,mpc5200-pic']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/interrupt-controlle=
r@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fs=
l,mpc5200-pic']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@600: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@600: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/mucmc52.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@610: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@610: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@620: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/timer@620: failed t=
o match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/mucmc52.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/mucmc52.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/rtc@800: failed to =
match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/rtc@800: failed to =
match any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@900: failed to =
match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan=
']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@900: failed to =
match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan=
']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@980: failed to =
match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan=
']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/can@980: failed to =
match any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan=
']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@b00: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@b00: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-c=
ells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@c00: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-=
gpio-wkup']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/gpio@c00: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-=
gpio-wkup']
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #g=
pio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #g=
pio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/spi@f00: failed to =
match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/mucmc52.dtb: /soc5200@f0000000/spi@f00: failed to =
match any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/mucmc52.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interr=
upts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: usb@1000 (fsl,mpc5200b-ohci): compati=
ble: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: localbus (fsl,mpc5200b-lpb): gpio-con=
troller-104@3,600104: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: localbus (fsl,mpc5200b-lpb): gpio-con=
troller-20f@3,60020f: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: localbus (fsl,mpc5200b-lpb): gpio-con=
troller-202@3,600202: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus: failed to match any schema=
 with compatible: ['fsl,mpc5200b-lpb', 'fsl,mpc5200-lpb', 'simple-bus']
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus: failed to match any schema=
 with compatible: ['fsl,mpc5200b-lpb', 'fsl,mpc5200-lpb', 'simple-bus']
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus/gpio-controller-100@3,60010=
0: failed to match any schema with compatible: ['manroland,mucmc52-aux-gpio=
']
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-100@3,600100 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-100@3,600100 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus/gpio-controller-104@3,60010=
4: failed to match any schema with compatible: ['manroland,mucmc52-aux-gpio=
']
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-104@3,600104 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-104@3,600104 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus/gpio-controller-200@3,60020=
0: failed to match any schema with compatible: ['manroland,mucmc52-aux-gpio=
']
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-200@3,600200 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-200@3,600200 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-206@3,600206 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-206@3,600206 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus/gpio-controller-207@3,60020=
7: failed to match any schema with compatible: ['manroland,mucmc52-aux-gpio=
']
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-207@3,600207 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-207@3,600207 (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/mucmc52.dtb: /localbus/gpio-controller-20f@3,60020=
f: failed to match any schema with compatible: ['manroland,mucmc52-aux-gpio=
']
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-20f@3,60020f (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/mucmc52.dtb: gpio-controller-20f@3,60020f (manrola=
nd,mucmc52-aux-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/pcm030.dtb: /: failed to match any schema with com=
patible: ['phytec,pcm030']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/pcm030.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm030.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm030.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/pcm030.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/pcm030.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm030.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
>> arch/powerpc/boot/dts/pcm030.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm030.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm030.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm030.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/pcm030.dtb: usb@1000 (fsl,mpc5200b-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/mpc5200b.dtsi:218.23-223.5: Warning (unique_unit_a=
ddress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address=
 (also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/pcm032.dtb: /: failed to match any schema with com=
patible: ['phytec,pcm032']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000: failed to match any=
 schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/cdm@200: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/interrupt-controller=
@500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl=
,mpc5200-pic']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@600: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/pcm032.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm032.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@610: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/timer@620: failed to=
 match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/pcm032.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/pcm032.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/rtc@800: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@900: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/can@980: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@b00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/pcm032.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm032.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/gpio@c00: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-g=
pio-wkup']
>> arch/powerpc/boot/dts/pcm032.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/pcm032.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm032.dtb: /soc5200@f0000000/spi@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/pcm032.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/pcm032.dtb: usb@1000 (fsl,mpc5200b-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/tqm5200.dts:178.13-185.5: Warning (simple_bus_reg)=
: /localbus/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/tqm5200.dts:127.17-133.5: Warning (unique_unit_add=
ress_if_enabled): /soc5200@f0000000/ethernet@3000: duplicate unit-address (=
also used in node /soc5200@f0000000/mdio@3000)
   arch/powerpc/boot/dts/tqm5200.dtb: /: failed to match any schema with co=
mpatible: ['tqc,tqm5200']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000: failed to match an=
y schema with compatible: ['fsl,mpc5200-immr']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/cdm@200: failed to =
match any schema with compatible: ['fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/interrupt-controlle=
r@500: failed to match any schema with compatible: ['fsl,mpc5200-pic']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/timer@600: failed t=
o match any schema with compatible: ['fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@900: failed to =
match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/can@980: failed to =
match any schema with compatible: ['fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/tqm5200.dtb: /soc5200@f0000000/gpio@b00: failed to=
 match any schema with compatible: ['fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/tqm5200.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/tqm5200.dtb: gpio@b00 (fsl,mpc5200-gpio): #gpio-ce=
lls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/tqm5200.dtb: usb@1000 (fsl,mpc5200-ohci): 'interru=
pts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/tqm5200.dtb: usb@1000 (fsl,mpc5200-ohci): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500'=
, 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL,=
PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+', =
'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathro=
w', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', 'K=
2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'keyl=
argo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', '=
MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-me=
dia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', 'P=
owerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,5=
', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerBo=
ok5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'Po=
werBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5'=
, 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac1=
1,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerMa=
c3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerMa=
c4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerMa=
c8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,1=
', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensors=
', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart', =
'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-r=
ng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460e=
x-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypto=
', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic',=
 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,C=
BEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Moment=
um,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc5200=
b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintendo=
,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,hol=
lywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-sr=
nprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682m=
-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,pw=
rficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc', =
'sony,ps3', 'sti,platform-spider-pic']
   	'fsl,mpc5200-ohci' is not one of ['bq4802', 'ds1287', 'i2cpcf,8584', 'i=
sa-m5819p', 'isa-m5823p', 'm5819', 'qcn', 'sab82532', 'su', 'sun4v', 'SUNW,=
bbc-beep', 'SUNW,bbc-i2c', 'SUNW,CS4231', 'SUNW,ebus-pic16f747-env', 'SUNW,=
kt-cwq', 'SUNW,kt-mau', 'SUNW,n2-cwq', 'SUNW,n2-mau', 'SUNW,niusl', 'SUNW,s=
mbus-beep', 'SUNW,sun4v-console', 'SUNW,sun4v-pci', 'SUNW,vf-cwq', 'SUNW,vf=
-mau']
   	'fsl,mpc5200-ohci' is not one of ['electra-cf', 'i2cpcf,8584', 'virtio,=
uml']
--
   arch/powerpc/boot/dts/uc101.dtb: Warning (interrupt_map): Failed prerequ=
isite 'interrupt_provider'
   arch/powerpc/boot/dts/uc101.dtb: /: failed to match any schema with comp=
atible: ['manroland,uc101']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000: failed to match any =
schema with compatible: ['fsl,mpc5200b-immr']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/cdm@200: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/cdm@200: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-cdm', 'fsl,mpc5200-cdm']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/interrupt-controller@=
500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,=
mpc5200-pic']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/interrupt-controller@=
500: failed to match any schema with compatible: ['fsl,mpc5200b-pic', 'fsl,=
mpc5200-pic']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@600: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@600: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
>> arch/powerpc/boot/dts/uc101.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/uc101.dtb: timer@600 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@610: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@610: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/uc101.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: timer@610 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@620: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/timer@620: failed to =
match any schema with compatible: ['fsl,mpc5200b-gpt', 'fsl,mpc5200-gpt']
   arch/powerpc/boot/dts/uc101.dtb: timer@620 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/uc101.dtb: timer@670 (fsl,mpc5200b-gpt): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/rtc@800: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/rtc@800: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-rtc', 'fsl,mpc5200-rtc']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@900: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@900: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@980: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/can@980: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-mscan', 'fsl,mpc5200-mscan']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@b00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@b00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-gpio', 'fsl,mpc5200-gpio']
>> arch/powerpc/boot/dts/uc101.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/uc101.dtb: gpio@b00 (fsl,mpc5200b-gpio): #gpio-cel=
ls: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@c00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gp=
io-wkup']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/gpio@c00: failed to m=
atch any schema with compatible: ['fsl,mpc5200b-gpio-wkup', 'fsl,mpc5200-gp=
io-wkup']
>> arch/powerpc/boot/dts/uc101.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/uc101.dtb: gpio@c00 (fsl,mpc5200b-gpio-wkup): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/spi@f00: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/uc101.dtb: /soc5200@f0000000/spi@f00: failed to ma=
tch any schema with compatible: ['fsl,mpc5200b-spi', 'fsl,mpc5200-spi']
   arch/powerpc/boot/dts/uc101.dtb: usb@1000 (fsl,mpc5200b-ohci): 'interrup=
ts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/incomplete-devices.yaml#
   arch/powerpc/boot/dts/uc101.dtb: usb@1000 (fsl,mpc5200b-ohci): compatibl=
e: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc5200b-ohci', 'fsl,mpc5200-ohci', 'ohci-be'] is too long
   	'fsl,mpc5200b-ohci' is not one of ['broadcom,bcm5241', 'ltr,ltrf216a']
   	'fsl,mpc5200b-ohci' is not one of ['AAPL,3500', 'AAPL,7500', 'AAPL,8500=
', 'AAPL,9500', 'AAPL,accelerometer_1', 'AAPL,e411', 'AAPL,Gossamer', 'AAPL=
,PowerBook1998', 'AAPL,ShinerESB', 'adm1030', 'amd-0137', 'B5221', 'bmac+',=
 'burgundy', 'cobalt', 'cy28508', 'daca', 'fcu', 'gatwick', 'gmac', 'heathr=
ow', 'heathrow-ata', 'heathrow-media-bay', 'i2sbus', 'i2s-modem', 'iMac', '=
K2-GMAC', 'k2-i2c', 'K2-Keylargo', 'K2-UATA', 'kauai-ata', 'Keylargo', 'key=
largo-ata', 'keylargo-media-bay', 'lm87cimt', 'MAC,adm1030', 'MAC,ds1775', =
'MacRISC', 'MacRISC2', 'MacRISC3', 'MacRISC4', 'max6690', 'ohare', 'ohare-m=
edia-bay', 'ohare-swim3', 'PowerBook1,1', 'PowerBook2,1', 'PowerBook2,2', '=
PowerBook3,1', 'PowerBook3,2', 'PowerBook3,3', 'PowerBook3,4', 'PowerBook3,=
5', 'PowerBook4,1', 'PowerBook4,2', 'PowerBook4,3', 'PowerBook5,1', 'PowerB=
ook5,2', 'PowerBook5,3', 'PowerBook5,4', 'PowerBook5,5', 'PowerBook5,6', 'P=
owerBook5,7', 'PowerBook5,8', 'PowerBook5,9', 'PowerBook6,3', 'PowerBook6,5=
', 'PowerBook6,7', 'PowerMac10,1', 'PowerMac10,2', 'PowerMac1,1', 'PowerMac=
11,2', 'PowerMac12,1', 'PowerMac2,1', 'PowerMac2,2', 'PowerMac3,1', 'PowerM=
ac3,4', 'PowerMac3,5', 'PowerMac3,6', 'PowerMac4,1', 'PowerMac4,2', 'PowerM=
ac4,4', 'PowerMac4,5', 'PowerMac7,2', 'PowerMac7,3', 'PowerMac8,1', 'PowerM=
ac8,2', 'PowerMac9,1', 'paddington', 'RackMac1,1', 'RackMac1,2', 'RackMac3,=
1', 'screamer', 'shasta-ata', 'sms', 'smu-rpm-fans', 'smu-sat', 'smu-sensor=
s', 'snapper', 'swim3', 'tumbler', 'u3-agp', 'u3-dart', 'u3-ht', 'u4-dart',=
 'u4-pcie', 'U4-pcie', 'uni-n-i2c', 'uni-north']
   	'fsl,mpc5200b-ohci' is not one of ['1682m-gizmo', '1682m-gpio', '1682m-=
rng', '1682m-sdc', 'amcc,ppc440epx-rng', 'amcc,ppc460ex-bcsr', 'amcc,ppc460=
ex-crypto', 'amcc,ppc460ex-rng', 'amcc,ppc460sx-crypto', 'amcc,ppc4xx-crypt=
o', 'amcc,sata-460ex', 'CBEA,platform-open-pic', 'CBEA,platform-spider-pic'=
, 'direct-mapped', 'display', 'gpio-mdio', 'hawk-bridge', 'hawk-pci', 'IBM,=
CBEA', 'IBM,lhca', 'IBM,lhea', 'IBM,lhea-ethernet', 'ibm,axon-msic', 'Momen=
tum,Apache', 'Momentum,Maple', 'mai-logic,articia-s', 'mpc10x-pci', 'mpc520=
0b-fec-phy', 'mpc5200-serial', 'mpc5200-sram', 'nintendo,flipper', 'nintend=
o,flipper-exi', 'nintendo,flipper-pi', 'nintendo,flipper-pic', 'nintendo,ho=
llywood', 'nintendo,hollywood-pic', 'nintendo,latte-exi', 'nintendo,latte-s=
rnprot', 'ohci-be', 'ohci-bigendian', 'ohci-le', 'PA6T-1682M', 'pasemi,1682=
m-iob', 'pasemi,localbus', 'pasemi,localbus-nand', 'pasemi,nemo', 'pasemi,p=
wrficient', 'pasemi,pwrficient-rng', 'pasemi,rootbus', 'pasemi,sdc', 'soc',=
 'sony,ps3', 'sti,platform-spider-pic']
--
   arch/powerpc/boot/dts/xpedite5200.dtb: /soc@ef000000/l2-cache-controller=
@20000: failed to match any schema with compatible: ['fsl,mpc8548-l2-cache-=
controller']
   arch/powerpc/boot/dts/xpedite5200.dtb: i2c@3000 (fsl-i2c): compatible: '=
oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: i2c@3000 (fsl-i2c): Unevaluated p=
roperties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: gpio@18 (nxp,pca9556): 'polarity'=
 does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/powerpc/boot/dts/xpedite5200.dtb: gpio@18 (nxp,pca9556): #gpio-cell=
s: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/powerpc/boot/dts/xpedite5200.dtb: gpio@18 (nxp,pca9556): #gpio-cell=
s: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/xpedite5200.dtb: gpio@18 (nxp,pca9556): #gpio-cell=
s: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: gpio@19 (nxp,pca9556): 'polarity'=
 does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: gpio@19 (nxp,pca9556): #gpio-cell=
s: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: gpio@19 (nxp,pca9556): #gpio-cell=
s: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: gpio@19 (nxp,pca9556): #gpio-cell=
s: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200.dtb: /soc@ef000000/i2c@3000/eeprom@50:=
 failed to match any schema with compatible: ['atmel,at24c16']
--
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /soc@ef000000/l2-cache-contr=
oller@20000: failed to match any schema with compatible: ['fsl,mpc8548-l2-c=
ache-controller']
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: i2c@3000 (fsl-i2c): compatib=
le: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: i2c@3000 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@18 (nxp,pca9556): 'pola=
rity' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$',=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@18 (nxp,pca9556): #gpio=
-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@18 (nxp,pca9556): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@18 (nxp,pca9556): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@19 (nxp,pca9556): 'pola=
rity' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$',=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@19 (nxp,pca9556): #gpio=
-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@19 (nxp,pca9556): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: gpio@19 (nxp,pca9556): #gpio=
-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/xpedite5200_xmon.dtb: /soc@ef000000/i2c@3000/eepro=
m@50: failed to match any schema with compatible: ['atmel,at24c16']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3000 (fsl-i2c): Unevaluate=
d properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: serial@4500 (fsl,ns16550): Une=
valuated properties are not allowed ('cell-index', 'device_type' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: serial@4600 (fsl,ns16550): Une=
valuated properties are not allowed ('cell-index', 'device_type' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/l2-cache-control=
ler@20000: failed to match any schema with compatible: ['fsl,bsc9131-l2-cac=
he-controller']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: dma@21300 (fsl,eloplus-dma): d=
ma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: dma@21300 (fsl,eloplus-dma): d=
ma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100 (fsl-i2c): Unevaluate=
d properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: serial@4500 (fsl,ns16550): Une=
valuated properties are not allowed ('cell-index', 'device_type' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: serial@4600 (fsl,ns16550): Une=
valuated properties are not allowed ('cell-index', 'device_type' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: gpio-controller@fc00 (fsl,pq3-=
gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/l2-cache-control=
ler@20000: failed to match any schema with compatible: ['fsl,bsc9132-l2-cac=
he-controller']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: dma@21300 (fsl,eloplus-dma): d=
ma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: dma@21300 (fsl,eloplus-dma): d=
ma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: serial@4500 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: serial@4600 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/l2-cache-controll=
er@20000: failed to match any schema with compatible: ['fsl,c293-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: i2c@119000 (fsl-i2c): Unevalu=
ated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11c500 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11c600 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11d500 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11d600 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: gpio@130000 (fsl,qoriq-gpio):=
 #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: gpio@130000 (fsl,qoriq-gpio):=
 compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio',=
 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-g=
pio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio',=
 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-g=
pio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio',=
 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: gpio@130000 (fsl,qoriq-gpio):=
 #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: gpio@130000 (fsl,qoriq-gpio):=
 #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@210000 (fsl-usb2-mph-v1.6=
): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too lo=
ng
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.=
5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@210000 (fsl-usb2-mph-v1.6=
): Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: fa=
iled to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85x=
x-usb2-mph', 'fsl-usb2-mph']
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to ma=
tch any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
$nodename:0: 'nor@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
Unevaluated properties are not allowed ('partition@0', 'partition@7800000' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nvram@3,0: fa=
iled to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/fpga@4,0: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-regs']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/gpio@4,400: f=
ailed to match any schema with compatible: ['ge,imp3a-gpio']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: gpio@4,400 (ge,imp3a-gpio): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: gpio@4,400 (ge,imp3a-gpio): #gpi=
o-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: fa=
iled to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-w=
dt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: fa=
iled to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-w=
dt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/wdt@4,800: fa=
iled to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,fpga-w=
dt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@7,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000: failed to match a=
ny schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000: failed to m=
atch any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/nvram@3,0: f=
ailed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/fpga@4,0: fa=
iled to match any schema with compatible: ['gef,ppc9a-fpga-regs']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/wdt@4,2000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpg=
a-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/wdt@4,2000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpg=
a-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/wdt@4,2000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpg=
a-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpg=
a-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpg=
a-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000=
: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc61=
0-gpio']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000=
: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc61=
0-gpio']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: gpio@7,14000 (gef,ppc9a-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: gpio@7,14000 (gef,ppc9a-gpio): =
#gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc):=
 dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc):=
 dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc):=
 dma-channel@100: 'anyOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000: failed to =
match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/nvram@3,0: =
failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/fpga@4,0: f=
ailed to match any schema with compatible: ['gef,fpga-regs']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/wdt@4,2000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/wdt@4,2000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/wdt@4,2000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,f=
pga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,f=
pga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/gpio@4,8000=
: failed to match any schema with compatible: ['gef,sbc310-gpio']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: gpio@4,8000 (gef,sbc310-gpio):=
 #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: gpio@4,8000 (gef,sbc310-gpio):=
 #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@100: 'anyOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: localbus@fef05000 (fsl,mpc8641=
-localbus): gpio@7,14000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: localbus@fef05000 (fsl,mpc8641=
-localbus): fpga@4,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000: failed to =
match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/nvram@3,0: =
failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/fpga@4,0: f=
ailed to match any schema with compatible: ['gef,fpga-regs']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/wdt@4,2000:=
 failed to match any schema with compatible: ['gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,fpga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/gpio@7,1400=
0: failed to match any schema with compatible: ['gef,sbc610-gpio']
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: gpio@7,14000 (gef,sbc610-gpio)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: gpio@7,14000 (gef,sbc610-gpio)=
: #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@100: 'anyOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,t1040-device-config=
', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,t1040-device-config=
', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/sfp@e8000: failed =
to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/serdes@ea000: fail=
ed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@f=
c000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: serial@11c500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: serial@11c600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000 (fsl,qoriq-gpio): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio',=
 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-g=
pio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio',=
 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-g=
pio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio',=
 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@131000 (fsl,qoriq-gpio): #gp=
io-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@131000 (fsl,qoriq-gpio): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio',=
 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-g=
pio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio',=
 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-g=
pio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio',=
 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@131000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: i2c@118100 (fsl-i2c): Unevaluated=
 properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: serial@11c500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: serial@11c600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: serial@11d500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: serial@11d600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: gpio@130000 (fsl,qoriq-gpio): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio',=
 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-g=
pio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio',=
 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-g=
pio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio',=
 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: crypto@300000 (fsl,sec-v4.2): 'fs=
l,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinc=
trl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: crypto@300000 (fsl,sec-v4.2): jr@=
1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring'] is too short
   	['fsl,sec-v4.2-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v6.0-job-ring' was expected
   	'fsl,sec-v5.4-job-ring' was expected
   	'fsl,sec-v4.2-job-ring' is not one of ['fsl,imx8qm-job-ring', 'fsl,imx8=
qxp-job-ring', 'fsl,sec-v5.0-job-ring']
   	'fsl,sec-v4.0-job-ring' was expected
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: i2c@3100 (fsl-i2c): Unevaluated=
 properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexp=
ected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: serial@4600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): =
Unevaluated properties are not allowed ('partition@kernel', 'partition@u-bo=
ot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: flash@0 (spansion,s25sl12801): =
'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do =
not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#=
[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-=
zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$'=
, '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/l2-cache-controll=
er@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cach=
e-controller']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: i2c@3100 (fsl-i2c): Unevalu=
ated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were u=
nexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4500 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: serial@4600 (fsl,ns16550): =
Unevaluated properties are not allowed ('cell-index', 'device_type' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl1280=
1): Unevaluated properties are not allowed ('partition@kernel', 'partition@=
u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: flash@0 (spansion,s25sl1280=
1): 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot'=
 do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$',=
 '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '=
^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*=
__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/l2-cache-con=
troller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2=
-cache-controller']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: dma@c300 (fsl,eloplus-dma): dma=
-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: dma@c300 (fsl,eloplus-dma): dma=
-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@fc00 (fsl,pq3-g=
pio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: gpio-controller@f000 (fsl,mpc85=
72-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/l2-cache-cont=
roller@20000: failed to match any schema with compatible: ['fsl,mpc8572-l2-=
cache-controller']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: dma@c300 (fsl,eloplus-dma):=
 dma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: dma@c300 (fsl,eloplus-dma):=
 dma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@fc00 (fsl,p=
q3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: gpio-controller@f000 (fsl,m=
pc8572-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/l2-cache=
-controller@20000: failed to match any schema with compatible: ['fsl,mpc857=
2-l2-cache-controller']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: dma@c300 (fsl,eloplu=
s-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: dma@c300 (fsl,eloplu=
s-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000=
 (fsl,mpc8572-gpio): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000=
 (fsl,mpc8572-gpio): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: gpio-controller@f000=
 (fsl,mpc8572-gpio): '#gpio-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/l2=
-cache-controller@20000: failed to match any schema with compatible: ['fsl,=
mpc8572-l2-cache-controller']
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@c300 (fsl,eloplu=
s-dma): dma-channel@100:compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@c300 (fsl,eloplu=
s-dma): dma-channel@180:compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: gpio-controller@fc00=
 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/l2=
-cache-controller@20000: failed to match any schema with compatible: ['fsl,=
mpc8572-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@21300 (fsl,elopl=
us-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be =
fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: dma@21300 (fsl,elopl=
us-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must be=
 fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sdhc@114000 (fsl,p4080-esdhc): Un=
evaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' w=
ere unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11c500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11c600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11d500 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11d600 (fsl,ns16550): Unev=
aluated properties are not allowed ('cell-index', 'device_type' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: gpio@130000 (fsl,qoriq-gpio): com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc5121-gpio', 'fsl,mpc5125-gpio',=
 'fsl,mpc8314-gpio', 'fsl,mpc8349-gpio', 'fsl,mpc8572-gpio', 'fsl,mpc8610-g=
pio', 'fsl,pq3-gpio']
   	'fsl,qoriq-gpio' is not one of ['fsl,ls1021a-gpio', 'fsl,ls1028a-gpio',=
 'fsl,ls1043a-gpio', 'fsl,ls1046a-gpio', 'fsl,ls1088a-gpio', 'fsl,ls2080a-g=
pio']
   	'fsl,qoriq-gpio' is not one of ['fsl,mpc8308-gpio', 'fsl,mpc8377-gpio',=
 'fsl,mpc8378-gpio', 'fsl,mpc8379-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: gpio@130000 (fsl,qoriq-gpio): #gp=
io-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: crypto@300000 (fsl,sec-v4.0): 'fs=
l,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinc=
trl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon=
']
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.=
yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon)=
: interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.=
yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b2000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b200=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm-law@0: fail=
ed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/memory-controll=
er@2000: failed to match any schema with compatible: ['fsl,p1010-memory-con=
troller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: serial@4500 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: serial@4600 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1010-l2-cach=
e-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1010-l2-cach=
e-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/memory-con=
troller@2000: failed to match any schema with compatible: ['fsl,p1010-memor=
y-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1010-l2=
-cache-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1010-l2=
-cache-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b2000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b200=
0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm-law@0: fail=
ed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: faile=
d to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/memory-controll=
er@2000: failed to match any schema with compatible: ['fsl,p1010-memory-con=
troller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: serial@4500 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: serial@4600 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1010-l2-cach=
e-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1010-l2-cach=
e-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b2000 (fsl,etsec=
2): Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@=
b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm-law@0:=
 failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: =
failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/memory-con=
troller@2000: failed to match any schema with compatible: ['fsl,p1010-memor=
y-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1010-l2=
-cache-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1010-l2=
-cache-controller', 'fsl,p1014-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/l2-cache-co=
ntroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-=
cache-controller']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2=
-cache-controller']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/l2-cache-co=
ntroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-=
cache-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2=
-cache-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100 (fsl-i2c)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100 (fsl-i2c)=
: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsr=
r' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: serial@4500 (fsl,n=
s16550): Unevaluated properties are not allowed ('cell-index', 'device_type=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/l2-c=
ache-controller@20000: failed to match any schema with compatible: ['fsl,p1=
020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: dma@21300 (fsl,elo=
plus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must b=
e fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: dma@21300 (fsl,elo=
plus-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm-=
law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@=
1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ec=
m']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: i2c@3100 (fsl-i2c)=
: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: serial@4600 (fsl,n=
s16550): Unevaluated properties are not allowed ('cell-index', 'device_type=
' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: gpio-controller@fc=
00 (fsl,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/l2-c=
ache-controller@20000: failed to match any schema with compatible: ['fsl,p1=
020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: dma@21300 (fsl,elo=
plus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must b=
e fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: dma@21300 (fsl,elo=
plus-dma): dma-channel@80:compatible: 'oneOf' conditional failed, one must =
be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3100 (fsl-i2c): Unevaluat=
ed properties are not allowed ('cell-index', 'compatible', 'dfsrr' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: serial@4500 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: serial@4600 (fsl,ns16550): Un=
evaluated properties are not allowed ('cell-index', 'device_type' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-cach=
e-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: serial@4500 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: serial@4600 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p1020-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: serial@4500 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: serial@4600 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/l2-cache-cont=
roller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-ca=
che-controller']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/l2-cache-co=
ntroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-=
cache-controller']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1020-l2=
-cache-controller']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: serial@4500 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: serial@4600 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p1021-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/l2-cache-co=
ntroller@20000: failed to match any schema with compatible: ['fsl,p1021-l2-=
cache-controller']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100 (fsl-i2c): Uneva=
luated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: serial@4500 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: serial@4600 (fsl,ns16550)=
: Unevaluated properties are not allowed ('cell-index', 'device_type' were =
unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: gpio-controller@fc00 (fsl=
,pq3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/l2-cache-c=
ontroller@20000: failed to match any schema with compatible: ['fsl,p1021-l2=
-cache-controller']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: dma@21300 (fsl,eloplus-dm=
a): dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixe=
d:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: dma@c300 (fsl,eloplus-dma): d=
ma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: dma@c300 (fsl,eloplus-dma): d=
ma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/display@10000: =
failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/display@10000: =
failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/l2-cache-contro=
ller@20000: failed to match any schema with compatible: ['fsl,p1022-l2-cach=
e-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: dma@c300 (fsl,eloplus-dma): d=
ma-channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: dma@c300 (fsl,eloplus-dma): d=
ma-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: gpio-controller@fc00 (fsl,pq3=
-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/display@10000:=
 failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/display@10000:=
 failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/l2-cache-contr=
oller@20000: failed to match any schema with compatible: ['fsl,p1022-l2-cac=
he-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: dma@21300 (fsl,eloplus-dma): =
dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: dma@c300 (fsl,eloplus-dma): dma-=
channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/display@10000: fai=
led to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/display@10000: fai=
led to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p1022-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: serial@4500 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: serial@4600 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p1023-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: serial@4500 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: serial@4600 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/l2-cache-contr=
oller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-cac=
he-controller']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: serial@4500 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: serial@4600 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/l2-cache-cont=
roller@20000: failed to match any schema with compatible: ['fsl,p1020-l2-ca=
che-controller']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: serial@4500 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: serial@4600 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/l2-cache-contr=
oller@20000: failed to match any schema with compatible: ['fsl,p1021-l2-cac=
he-controller']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3100 (fsl-i2c): Unevalua=
ted properties are not allowed ('cell-index', 'compatible', 'dfsrr' were un=
expected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: serial@4500 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: serial@4600 (fsl,ns16550): U=
nevaluated properties are not allowed ('cell-index', 'device_type' were une=
xpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: gpio-controller@fc00 (fsl,pq=
3-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/l2-cache-cont=
roller@20000: failed to match any schema with compatible: ['fsl,p1021-l2-ca=
che-controller']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: dma@21300 (fsl,eloplus-dma):=
 dma-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3100 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpe=
cted)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: serial@4500 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: serial@4600 (fsl,ns16550): Uneva=
luated properties are not allowed ('cell-index', 'device_type' were unexpec=
ted)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: gpio-controller@fc00 (fsl,pq3-gp=
io): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/l2-cache-controlle=
r@20000: failed to match any schema with compatible: ['fsl,p1021-l2-cache-c=
ontroller']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: dma@21300 (fsl,eloplus-dma): dma=
-channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: dma@c300 (fsl,eloplus-dma): dma-c=
hannel@100:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: dma@c300 (fsl,eloplus-dma): dma-c=
hannel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: gpio-controller@fc00 (fsl,pq3-gpi=
o): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: gpio-controller@fc00 (fsl,pq3-gpi=
o): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: gpio-controller@fc00 (fsl,pq3-gpi=
o): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/l2-cache-controller=
@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-co=
ntroller']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: dma@21300 (fsl,eloplus-dma): dma-=
channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: dma@21300 (fsl,eloplus-dma): dma-=
channel@80:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
