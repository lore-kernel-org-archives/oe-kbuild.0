Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF5E4315F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jan 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737299396; cv=none; b=gI6VsBs8lizYRXOQ9NeaXHxJ+AL0LReHSXGLxwfGA7HJxENIMtO1JSBMc+fdCgk3bkQb4aBs/LmRzoXJR5GYgrAfjy/MnUTjXzzPxfGcRV+jJ0V+B0RZWapQMwA7/ZiZpm22tkmzegEoGBkJGt5lT2cbAbtwcuPxhQoS8DhXBYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737299396; c=relaxed/simple;
	bh=hYVy9a0DaEiZVZRRyxTzEVPOfPkXzOXgUAZjrWgtICU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7yue5g8/JGKzeobhZgp5JSA7r72+nxPk4NnM8KTwGlJi7veqxJ8OaX7HjAa8MfP7j/NlsPkYS1keic5vkvF9woglZ3u0P7KyFX+jOwP6hQbma3bfC7gMG0yBh18hBINgkD/5cFEclotk0eSvdg8wo7CB6v3NQgOw0xU82GezHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/OdCq42; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/OdCq42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737299395; x=1768835395;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hYVy9a0DaEiZVZRRyxTzEVPOfPkXzOXgUAZjrWgtICU=;
  b=I/OdCq42tCigFfRLGcZR7V3vYBmK96aWzPcOIqGeL38DDAQugb9Swuy/
   8YGF/c4dv4Gke9gYlakUha6YOMdN49lBVuJcFSjajvA0rajWeF7cpa+Zp
   PYpn07sP1jB7rYElF5aAkhMsbRkY+7iDtmaosVMeZuamouPmg1KsSEb2k
   RqmlXLLeKTJt/BnSOmOMFyxQJ15oxZFZ/mRYkfZquIJ8TfRg3cNGJEUXX
   MtYIiFD3bn/qIdr/7rspfmYOXMww0GEFqqZp0ECGfptbXdVvlFUnawC/3
   c/iBNL0rWm939dACHiKZ67Aii/DX8NmMpDhawmnJtQbL6itzLbzymwVGW
   A==;
X-CSE-ConnectionGUID: IlpY9SKMSy+2XXV7lsd5Pw==
X-CSE-MsgGUID: OotCiXj/SmG32eC/HcXiIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="49065055"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="49065055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 07:09:54 -0800
X-CSE-ConnectionGUID: 9DLl6k9ETOeW/Mlsq2O8WA==
X-CSE-MsgGUID: FvKNYoaGQqGg9iMAg7eclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143526982"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jan 2025 07:09:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZWvu-000VXb-2D;
	Sun, 19 Jan 2025 15:09:50 +0000
Date: Sun, 19 Jan 2025 23:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/str-enable-disable 55/60]
 arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000: Unevaluated
 properties are not allowed ('mmcsd-hog', 'ngpio' were unexpected)
Message-ID: <202501192230.tfTxoR1C-lkp@intel.com>
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

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   412b7f81f2b508ae42fb823cfb1a4ecb017dd4b0
commit: bc3453777ad908429d6c7c909ddf2182b19edfc9 [55/60] ARM: dts: st: ste-=
nomadik: Align GPIO hog name with bindings
:::::: branch date: 29 hours ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250117 (https://download.01.org/0day-ci/archiv=
e/20250119/202501192230.tfTxoR1C-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23=
f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250119/202501192230.tfTxoR1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501192230.tfTxoR1C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:625.24-630.5: Warning (uni=
t_address_vs_reg): /src@101e0000/mspclk3@48M: node has a unit name, but no =
reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:631.24-636.5: Warning (uni=
t_address_vs_reg): /src@101e0000/mshcclk@48M: node has a unit name, but no =
reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:637.24-643.5: Warning (uni=
t_address_vs_reg): /src@101e0000/usbmclk@48M: node has a unit name, but no =
reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:644.24-649.5: Warning (uni=
t_address_vs_reg): /src@101e0000/rngcclk@48M: node has a unit name, but no =
reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:692.7-715.4: Warning (unit=
_address_vs_reg): /i2c0: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:718.7-739.4: Warning (unit=
_address_vs_reg): /i2c1: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /: memory: False schema does=
 not allow {'device_type': ['memory'], 'reg': [[0, 67108864], [134217728, 6=
7108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /: failed to match any schem=
a with compatible: ['calaosystems,usb-s8815']
>> arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000: Unevaluated p=
roperties are not allowed ('mmcsd-hog', 'ngpio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yam=
l#
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /pinctrl: failed to match an=
y schema with compatible: ['stericsson,stn8815-pinctrl']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: src@101e0000: 'clk108@108M',=
 'clk216@216M', 'clk27@27M', 'clk48@48M', 'clk72@72M', 'difclk@72M', 'hclk3=
d@48M', 'hclkclcd@48M', 'hclkcryp@48M', 'hclkdif@48M', 'hclkdma0@48M', 'hcl=
kdma1@48M', 'hclkhash@48M', 'hclkhpi@48M', 'hclkrng@48M', 'hclksaa@48M', 'h=
clksdram@48M', 'hclksmc@48M', 'hclksva@48M', 'hclkusb@48M', 'hclkusbm@48M',=
 'hsiclkrx@216M', 'hsiclktx@108M', 'i2c0clk@48M', 'i2c1clk@48M', 'ipbmcclk@=
48M', 'ipi2cclk@48M', 'irdaclk@48M', 'mshcclk@48M', 'mspclk0@48M', 'mspclk1=
@48M', 'mspclk2@48M', 'mspclk3@48M', 'mxtal@19.2M', 'owmclk@48M', 'pclkhsem=
@48M', 'pclkhsi@48M', 'pclki2c0@48M', 'pclki2c1@48M', 'pclkirda@48M', 'pclk=
mshc@48M', 'pclkmsp0@48M', 'pclkmsp1@48M', 'pclkmsp2@48M', 'pclkmsp3@48M', =
'pclkowm@48M', 'pclksdi@48M', 'pclkske@48M', 'pclkssp@48M', 'pclkuart0@48M'=
, 'pclkuart1@48M', 'pclkuart2@48M', 'pclkxti@48M', 'rngcclk@48M', 'sdiclk@4=
8M', 'skeclk@48M', 'sspiclk@48M', 'timclk@2.4M', 'uart0clk@48M', 'uart1clk@=
48M', 'uart2clk@48M', 'ulpiclk@60M', 'usbclk@48M', 'usbmclk@48M', 'x3dclk@4=
8M' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells=
$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$'=
, '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^_=
_.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000: failed to mat=
ch any schema with compatible: ['stericsson,nomadik-src']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000/pll1@0: failed=
 to match any schema with compatible: ['st,nomadik-pll-clock']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000/hclk@0: failed=
 to match any schema with compatible: ['st,nomadik-hclk-clock']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000/pll2@0: failed=
 to match any schema with compatible: ['st,nomadik-pll-clock']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000/hclkdma0@48M: =
failed to match any schema with compatible: ['st,nomadik-src-clock']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000/hclksmc@48M: f=
ailed to match any schema with compatible: ['st,nomadik-src-clock']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
