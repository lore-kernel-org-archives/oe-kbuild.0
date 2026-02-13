Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC11C5D72
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Feb 2026 17:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771004395; cv=none; b=WjkBlGBSCicFzl0WJI8CBe5FSE8Ta+nVQ0IkRrb0IehGPXTLypSIrT0YhiAOWbfSerQFvXXvxcip1Og0OmNk3BFORarxbQxObX5mHJC64cQWlS5fOZuO9K9nKlOBv1g5OeSALwYzPU7Y/yKmn8DoBzNgtdlmE5cT3UNygdMoUhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771004395; c=relaxed/simple;
	bh=hOKtO5c0jPPUNmRo1enQ4bOhqoF4UOVLUM5Tobc79iE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r23rjQJM4zhbhcHPSkzQ8hxOeGcux/vtu77Hetxmbdc9DzibL4UBbxsNnMVmop5vewonOdFh1MQ8hxtYpPnkSdu7+shj+lAqF22mHVcHBO27+sz1npnHjvzuEx9LKIRWyYqsjudKoGTSeo8w2mxLwPA16pzuvg1MbuSjfj+fIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrX04wvC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrX04wvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771004394; x=1802540394;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hOKtO5c0jPPUNmRo1enQ4bOhqoF4UOVLUM5Tobc79iE=;
  b=RrX04wvCdbzL8BOjDu5KBaOpH5xhfchaJGGhFDZS0kGqz1kTLC9uPaR4
   hp8hQaHseCn2cKXWWU3B7ed+cPh0U+VG1wVMIJWdzA4orUfBZv+QmaN+H
   txqzy24oY6xgYNSZbtDUed7cbFefiOXhYmW8K3/guX1Sjbb25lQI78u5j
   uj/s6xT0VngKex9kT6tqyKH8vkS+3gPY6P19GwOGeeX/92yqQ6D9iA9al
   YcnT4dFAQdptYgjLY8JKDhUjDc65elrKjZf2wk+zPM3rErqrV9MQ1noDt
   DrGIQ71uEEL0q91Gk2GLdvdNDXbfCp2g6gEtQkst/uWnFaeNtdGhzws4J
   Q==;
X-CSE-ConnectionGUID: OKJeifJuQjaZ8LNaRUo3OA==
X-CSE-MsgGUID: tVrgQtrCQ7GNSiXs1BYMlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83559154"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83559154"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 09:39:52 -0800
X-CSE-ConnectionGUID: IE6gmUcLQKSI6UgwSo0VUw==
X-CSE-MsgGUID: xajYlL2HRuWG7FJ3A1vq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="250637452"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 13 Feb 2026 09:39:51 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqx8t-000000001dZ-1oRx;
	Fri, 13 Feb 2026 17:39:47 +0000
Date: Fri, 13 Feb 2026 18:38:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0
 (fsl,mpc8569-qe-spi): compatible:0: 'fsl,mpc8569-qe-spi' is not one of
 ['fsl,spi', 'aeroflexgaisler,spictrl']
Message-ID: <202602131807.xwXtsInA-lkp@intel.com>
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
rchive/20260213/202602131807.xwXtsInA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260213/202602131807.xwXtsInA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602131807.xwXtsInA-lkp@intel.com/

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
