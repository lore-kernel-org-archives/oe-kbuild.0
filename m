Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA8275860
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 03:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756524127; cv=none; b=S3+7Dt8uWVw03oAZjWWXAzgJckley3X/8CdNv2VuwETUHB0+5z9+b3WzEEJ8yKo575Sx3DitOdajsfxlpPg7VfzRhZS1pXarO+4pg5X/xwUx/bbkCqPVf7Ad3pzgxhYYnPFd6wSsHCShMMKonOqCq20mDWttw3l79T+W33MuvOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756524127; c=relaxed/simple;
	bh=4+7OpeR3ZxpHYTf9vkaAm0vg7DtATETgwgecrzHguLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfAP7nqTjK6HZd2ANQEqciJQp+r43lYztET0gVPZ/CopLFX7DUmC6MQnr6SDymGW31CLtEN/nyKbvLJXzEo/VG9ZdyzWgpCmpAUpW+8kHIx0BG1Jz6bW9eis2benhM5ssI9Y4dncoGP4OgTGHaMFjn3Cp4mX6sSqdMXzbftWWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YB9QoYsS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YB9QoYsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756524126; x=1788060126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4+7OpeR3ZxpHYTf9vkaAm0vg7DtATETgwgecrzHguLg=;
  b=YB9QoYsSFQvC6i9uReJZ14A4ENziAqkhV4jRyDiPNF58NQE4c7UgwK6V
   AKdXTjSBBcESh+ltRNznQxnojkVwx7bievs3IL5M9Xxhk1TUcBPXTSrN0
   j3tdNnLmawQSeoAer1Z+HvhhVBYx2hL4xCcjTxkXL7sewqnD6PiyNCBtE
   J++ViOUGvtfZJ1DI7QITaJX285p68wEaN4ESvckM2SZeorNOrvwbY2tET
   X1aRp/tWGT3UA2InJXKVwm8O4s/cq9ei9gUXd6D4BoVnrKNtj8PWpIeVe
   lVMjK3vFpmQ71eosE9Xa6IjxZAt2sBLYWeAolirCgwb+CWzQm+VlxS0G0
   Q==;
X-CSE-ConnectionGUID: AiwOGlb5QHC/Zha/BAJBVQ==
X-CSE-MsgGUID: Gj9uWWD4S8CVtImDBuW+Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46382249"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="46382249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 20:22:05 -0700
X-CSE-ConnectionGUID: qIG/8R1vQ7+X2ATIO/YOIA==
X-CSE-MsgGUID: uHwhy4TTTz2tunJ+w9AXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="175798767"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 Aug 2025 20:22:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usC9s-000V9C-1S;
	Sat, 30 Aug 2025 03:21:47 +0000
Date: Sat, 30 Aug 2025 11:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:ux500-dts 1/2]
 arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000 (st,nomadik-gpio):
 Unevaluated properties are not allowed ('mmcsd-hog', 'ngpio' were
 unexpected)
Message-ID: <202508301115.Hl7RrwlX-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-dts
head:   9c66753641765cc2f5ee1528a23f3fd2fd77cb93
commit: 4ce3d8526d95f414228908048a1313fe322f0d9b [1/2] ARM: dts: st: ste-no=
madik: Align GPIO hog name with bindings
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm-randconfig-052-20250829 (https://download.01.org/0day-ci/archiv=
e/20250830/202508301115.Hl7RrwlX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac2=
3f7465eedd0dd565ffb201f573e7a69695fa3)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250830/202508301115.Hl7RrwlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508301115.Hl7RrwlX-lkp@intel.com/

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
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /: failed to match any schem=
a with compatible: ['calaosystems,usb-s8815']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: / (calaosystems,usb-s8815): =
memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0,=
 67108864], [134217728, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000 (st,nomadik-gp=
io): Unevaluated properties are not allowed ('mmcsd-hog', 'ngpio' were unex=
pected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yam=
l#
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /pinctrl: failed to match an=
y schema with compatible: ['stericsson,stn8815-pinctrl']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /src@101e0000: failed to mat=
ch any schema with compatible: ['stericsson,nomadik-src']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: src@101e0000 (stericsson,nom=
adik-src): 'clk108@108M', 'clk216@216M', 'clk27@27M', 'clk48@48M', 'clk72@7=
2M', 'difclk@72M', 'hclk3d@48M', 'hclkclcd@48M', 'hclkcryp@48M', 'hclkdif@4=
8M', 'hclkdma0@48M', 'hclkdma1@48M', 'hclkhash@48M', 'hclkhpi@48M', 'hclkrn=
g@48M', 'hclksaa@48M', 'hclksdram@48M', 'hclksmc@48M', 'hclksva@48M', 'hclk=
usb@48M', 'hclkusbm@48M', 'hsiclkrx@216M', 'hsiclktx@108M', 'i2c0clk@48M', =
'i2c1clk@48M', 'ipbmcclk@48M', 'ipi2cclk@48M', 'irdaclk@48M', 'mshcclk@48M'=
, 'mspclk0@48M', 'mspclk1@48M', 'mspclk2@48M', 'mspclk3@48M', 'mxtal@19.2M'=
, 'owmclk@48M', 'pclkhsem@48M', 'pclkhsi@48M', 'pclki2c0@48M', 'pclki2c1@48=
M', 'pclkirda@48M', 'pclkmshc@48M', 'pclkmsp0@48M', 'pclkmsp1@48M', 'pclkms=
p2@48M', 'pclkmsp3@48M', 'pclkowm@48M', 'pclksdi@48M', 'pclkske@48M', 'pclk=
ssp@48M', 'pclkuart0@48M', 'pclkuart1@48M', 'pclkuart2@48M', 'pclkxti@48M',=
 'rngcclk@48M', 'sdiclk@48M', 'skeclk@48M', 'sspiclk@48M', 'timclk@2.4M', '=
uart0clk@48M', 'uart1clk@48M', 'uart2clk@48M', 'ulpiclk@60M', 'usbclk@48M',=
 'usbmclk@48M', 'x3dclk@48M' do not match any of the regexes: '.*-names$', =
'.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a=
-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F=
]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
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
