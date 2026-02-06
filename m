Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4123C8A0
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 23:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421015; cv=none; b=MqvdRUe1WCvP4iJ3NmGN9pSekMO9P5dHyMyhl6gm56Ylho/vfl10YxtUqucdqOwOKOOLok28pcA7sBW3qw+fyvJbTS7j43Sk/NU85T8WrUZnuoPQi5plOeeV3A5scz2jTSbxzRefhY/4JmOPMlzBqXXILcHPkEFLuUkPwV1FNUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421015; c=relaxed/simple;
	bh=rDY6GeCnjPHA59DwAioPUciqWK2Nl6wWJdrRdKSM0mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dNi8rZMRTlSBuPYcdqRNBj+hn8L3f9w5VOakTTrEM5RCvlhsF+42LGIry770eY+DU4dFNKh2h29RN1Rbs179pDVaUgUgU05mSM9XnjYKgQ9F2xuTw2RuCGMspjIfEdcPrvChzxXQ/IwLiHm1qXX1cO60F5k1LObtuWEuQVx3aPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlXxlQfV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlXxlQfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770421014; x=1801957014;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rDY6GeCnjPHA59DwAioPUciqWK2Nl6wWJdrRdKSM0mE=;
  b=LlXxlQfVNEzOyPMok0InkXKKbjCQ9zxBj56HCX2MqRXdj75s07Z9vWXR
   K/M9YSbY9Qci5DGYa9L+ZeFOIrzh4maDRiYfeeWL4LJFXBaiYWtCKftHf
   rgiL6MB65gWkBDOgwZN2FyJpn+VpZiA3ZjXhnjtePjUAfE3ex4Lk7nj3X
   wHfaa0Gl2iS1Af5FkI7YckZYnkBDvvdcSVQ6/0vOua6Fg/zlvaZ+WKwBD
   hylVcjMGpIbMfK19nAtcpTAGSXl3u+d2cEtBw3b8hlvWeKtvByyfq8CEv
   fUU4hDLz+2u8/14lmyXhxYl/2CpPeinW6sEaQ0HKqtM/F1vUMvRpdQZs4
   A==;
X-CSE-ConnectionGUID: 0omWwTJCScudSTytL98ubQ==
X-CSE-MsgGUID: 64pU3/YWQV6H/9ZM6Rxvkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71534966"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71534966"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 15:36:53 -0800
X-CSE-ConnectionGUID: pR5ZBCBRSQaIQuEbYBjt0Q==
X-CSE-MsgGUID: sHHx72bGRzWXrPUM3DlmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210298369"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2026 15:36:52 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voVNa-000000004k9-0p5R;
	Fri, 06 Feb 2026 23:36:50 +0000
Date: Sat, 07 Feb 2026 00:36:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0
 (fsl,mpc8569-qe-spi): compatible:0: 'fsl,mpc8569-qe-spi' is not one of
 ['fsl,spi', 'aeroflexgaisler,spictrl']
Message-ID: <202602070031.vmrA32Fq-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Mark Brown <broonie@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: f3bfa0f07976a7996b6dedba21d2e0d164f08ce8 spi: dt-bindings: Convert =
Freescale SPI bindings to YAML
date:   12 months ago
:::::: branch date: 8 months ago
:::::: commit date: 12 months ago
config: powerpc-randconfig-2051-20260206 (https://download.01.org/0day-ci/a=
rchive/20260207/202602070031.vmrA32Fq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260207/202602070031.vmrA32Fq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602070031.vmrA32Fq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000 (fsl,qe): $nodenam=
e:0: 'qe@e0080000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc=
|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000 (fsl,qe): compatib=
le: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000 (fsl,qe): interrup=
t-controller@80: '#address-cells' does not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000 (fsl,qe): compatib=
le: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: qe@e0080000 (fsl,qe): Unevalua=
ted properties are not allowed ('#address-cells', '#size-cells', 'device_ty=
pe', 'mdio@2120', 'mdio@2320', 'mdio@3120', 'mdio@3320', 'mdio@3520', 'mdio=
@3720', 'sleep', 'spi@4c0', 'spi@500', 'timer@440', 'ucc@2000', 'ucc@2200',=
 'ucc@3000', 'ucc@3200', 'ucc@3400', 'ucc@3600', 'usb@6c0' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.ya=
ml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0 (fsl,mpc8569-qe-spi): =
compatible:0: 'fsl,mpc8569-qe-spi' is not one of ['fsl,spi', 'aeroflexgaisl=
er,spictrl']
   	from schema $id: http://devicetree.org/schemas/spi/fsl,spi.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0 (fsl,mpc8569-qe-spi): =
compatible: ['fsl,mpc8569-qe-spi', 'fsl,spi'] is too long
   	from schema $id: http://devicetree.org/schemas/spi/fsl,spi.yaml
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0 (fsl,mpc8569-qe-spi): =
Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/fsl,spi.yaml
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/spi@4c0: failed t=
o match any schema with compatible: ['fsl,mpc8569-qe-spi', 'fsl,spi']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/usb@6c0: failed t=
o match any schema with compatible: ['fsl,mpc8569-qe-usb', 'fsl,mpc8323-qe-=
usb']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/usb@6c0: failed t=
o match any schema with compatible: ['fsl,mpc8569-qe-usb', 'fsl,mpc8323-qe-=
usb']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@2000: failed =
to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@2120: failed=
 to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3520: failed=
 to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@3720: failed=
 to match any schema with compatible: ['fsl,ucc-mdio']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/ucc@2200: failed =
to match any schema with compatible: ['ucc_geth']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /qe@e0080000/mdio@2320: failed=
 to match any schema with compatible: ['fsl,ucc-mdio']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
