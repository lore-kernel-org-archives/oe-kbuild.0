Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801DB126C13
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 23:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725406123; cv=none; b=iQ+z6gcJZyFPWOxPTHYMNSAUJYXY2cFXW/P7iTYcAeBKgKcsY242Fg54pN8loie7ETUxk8dyozPILx+mVe1FOObUdvYPgYydrpRMLlhgM1qA/sOuyWnNculCx1qT/dV6bNR1CiTQeTkbu7xMlqFmu2l/gGxUYw/NTivNKWiIlqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725406123; c=relaxed/simple;
	bh=5jFi3hSrlL7kF3NF9xji6niIhNuewSy+OdpkagM14Co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qLxYwWte/sq2v9bEe2Ufb6qBetAzNOImBiUAjrUmPHQuT26wfgdfAhfSI+TTsFCiSZ+sOnAQPxNk81BA1SZoMJD+wn7hWt6Vr61kPWaQT64jiGc7iyLr+kcRh+SRDDBLGyrmzCU0anshMfYbnstTpHIuY/2tLKGX+PTqSIKJTKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUEKDDvU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUEKDDvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725406122; x=1756942122;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5jFi3hSrlL7kF3NF9xji6niIhNuewSy+OdpkagM14Co=;
  b=RUEKDDvUtb9eyRRWrph9dgMViCKMmrq8Z5mz16AM/Xbckkh2CV+6dZXK
   iCNf83uI7EmmPYhyNPih/QyKgJz2T8T1wZSnbn3qS9eyscJjdzL9nF2ne
   qsa6EhaGaFpt2pGpYQ7cDCtsi47puhOYj6D+EjYiFRccoQ7RA8H6hOwI+
   a2hxZm2dcioTyXocKBMIqc3uwdrlnVzZXb6QjCpJWMsdZrxBDuafTa6Ke
   d9kdg8gvp+f/a5/pFqTS4Q2c/eJ7gAWWaQ4HIF6CrgCgq6T9JEKEnMx4T
   anlAHkQZ2CZE5U6wf5cqZMJ0y61TKg7XpSzK0wxpMxdaFtJ11JTjGg4Nl
   w==;
X-CSE-ConnectionGUID: uWwMw1jaSmy4lQCyUC+GOA==
X-CSE-MsgGUID: f46/ysPIQQah4pbru/ECZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41510601"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="41510601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 16:28:41 -0700
X-CSE-ConnectionGUID: spH9XyffTM6wfm+27F1BiQ==
X-CSE-MsgGUID: PKiXxehySEmM4gJLHEI2MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65102014"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Sep 2024 16:28:39 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slcwv-0007LQ-1z;
	Tue, 03 Sep 2024 23:28:37 +0000
Date: Wed, 4 Sep 2024 07:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-sound:for-6.12 75/81]
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: saif@80042000: fsl,saif-master:
 True is not of type 'array'
Message-ID: <202409040759.zjEzRbtu-lkp@intel.com>
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
TO: Lukasz Majewski <lukma@denx.de>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git f=
or-6.12
head:   dc70fd02404398388f3471a57b9f4e26c0eeba5e
commit: 125b749221aa54db069a7805f08d99b55c74c88c [75/81] ASoC: dt-bindings:=
 Convert mxs-saif.txt to fsl,saif.yaml (imx28 saif)
:::::: branch date: 33 hours ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20240902 (https://download.01.org/0day-ci/archiv=
e/20240904/202409040759.zjEzRbtu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240904/202409040759.zjEzRbtu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409040759.zjEzRbtu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: pinctrl@80018000: 'auart0-2pin=
s@0', 'auart0@0', 'auart1-2pins@0', 'auart1@0', 'auart2-2pins@0', 'auart2-2=
pins@1', 'auart2-pins@0', 'auart3-2pins@0', 'auart3-2pins@1', 'auart3@0', '=
auart4@0', 'auart4@1', 'can0@0', 'can1@0', 'duart-4pins@0', 'duart@0', 'dua=
rt@1', 'gpmi-nand@0', 'gpmi-status-cfg@0', 'hog@0', 'i2c0@0', 'i2c0@1', 'i2=
c1@0', 'i2c1@1', 'lcdif-16bit@0', 'lcdif-18bit@0', 'lcdif-24bit@0', 'lcdif-=
sync@0', 'mac0@0', 'mac0@1', 'mac1@0', 'mmc0-4bit@0', 'mmc0-8bit@0', 'mmc0-=
cd-cfg@0', 'mmc0-sck-cfg@0', 'mmc1-4bit@0', 'mmc1-cd-cfg@0', 'mmc1-sck-cfg@=
0', 'mmc2-4bit@0', 'mmc2-4bit@1', 'mmc2-cd-cfg@0', 'mmc2-sck-cfg@0', 'mmc2-=
sck-cfg@1', 'pwm0@0', 'pwm2@0', 'pwm3@0', 'pwm3@1', 'pwm4@0', 'saif0@0', 's=
aif0@1', 'saif1@0', 'spi-gpiogrp@0', 'spi2@0', 'spi3@0', 'spi3@1', 'tx28-ed=
t-ft5x06-pins@0', 'tx28-flexcan-xcvr-pins@0', 'tx28-lcdif-23bit@0', 'tx28-l=
cdif-ctrl@0', 'tx28-mac0-gpio-pins@0', 'tx28-pca9554-pins@0', 'tx28-tsc2007=
-pins@0', 'tx28-usbphy0-pins@0', 'tx28-usbphy1-pins@0', 'usb0@0', 'usb0@1',=
 'usb0id1@0', 'usb0id@0', 'usb1@0', 'usb1@1' do not match any of the regexe=
s: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-mxs.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbh@80000000/di=
gctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digc=
tl', 'fsl,imx23-digctl']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbh@80000000/di=
gctl@8001c000: failed to match any schema with compatible: ['fsl,imx28-digc=
tl', 'fsl,imx23-digctl']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: lcdif@80030000: 'port' is a re=
quired property
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: lcdif@80030000: 'display', 'di=
splay0', 'dma-names', 'dmas', 'lcd-supply' do not match any of the regexes:=
 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: apbx@80040000: $nodename:0: 'a=
pbx@80040000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|=
ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: saif@80042000: fsl,saif-master=
: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/sound/fsl,saif.yaml#
>> arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: saif@80042000: Unevaluated pro=
perties are not allowed ('fsl,saif-master' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,saif.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx@80040000/lr=
adc@80050000: failed to match any schema with compatible: ['fsl,imx28-lradc=
']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx@80040000/i2=
c@80058000/edt-ft5x06@38: failed to match any schema with compatible: ['edt=
,edt-ft5x06']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: tsc2007@48: ti,x-plate-ohms: b=
'\x02\x94' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx@80040000/i2=
c@80058000/tsc2007@48: failed to match any schema with compatible: ['ti,tsc=
2007']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx@80040000/ti=
mrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timr=
ot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /apb@80000000/apbx@80040000/ti=
mrot@80068000: failed to match any schema with compatible: ['fsl,imx28-timr=
ot', 'fsl,timrot']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /sound: failed to match any sc=
hema with compatible: ['fsl,imx28-tx28-sgtl5000', 'fsl,mxs-audio-sgtl5000']
   arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: /sound: failed to match any sc=
hema with compatible: ['fsl,imx28-tx28-sgtl5000', 'fsl,mxs-audio-sgtl5000']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
