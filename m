Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE81A254E
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 00:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770685026; cv=none; b=tqOQS/QfbemO+CMwemEeGfUgl6fCGZuBPQXrkbeF9uIsTNeCheDjKYNn5xKUyFllhiWBMoHopJbty886qjaMzzJtkN/6L6chvhWfcIsrpa/os4rwgUr8L/MTZ3y/4W6XaTX590xvSh+FGslRNWEL/nr/n/hwCaOw9n2r4SAGq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770685026; c=relaxed/simple;
	bh=/mHeuuaXz2BXMKO/XqFR8Kb4WXLnh8Y+MzNgh3Lg8qs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BkHnnvbOug7LwMG9r/jPPAmsKlUNinA2cXnqsgHL5mfgETIzitTAWPocAMl8/tW3Fmk/tgjOG8GXeF6PqcyuZEFjN7vo5QuGK7+C/94MdL7rgVsJu0M9vqfe39WFgi84+mnMXNLDFO955buUnEBqTNpiM4KeZDwQukTZAWWYJJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cle1yJtM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cle1yJtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770685024; x=1802221024;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/mHeuuaXz2BXMKO/XqFR8Kb4WXLnh8Y+MzNgh3Lg8qs=;
  b=cle1yJtMHZp4qt25BWkK58N4cEmoyU1yo4K/CumBnjivyoNyFJX18Atx
   4SCU4/xxnzbd2oNMe6rNF98MMc7iMiuLmPlfCGBjjmKgNTi7j+RTJLwnH
   IyP/GTugtfvYkIVE7CzgH9V/WWGDdKRRRBBGFuRc/hUaUP0rgGlBFatp7
   vLmAtRDcU4/PL6wR/jdc7RKGbeEhHpNcidVzB3PMMBNKu2nZUidraCquA
   SRfWLpJH73My+gda5Pa1vHgkLwuvKcfDxLb4du0TXp+v7Q0IEKrEIlf8K
   fxqNO57BDHo8gtWf7QGTsrvJ6ZXSTYlUtyzz8+sv/WJHDqVFiu4nyAzeS
   g==;
X-CSE-ConnectionGUID: qCJqRF9SSBSRTJrxCls6wA==
X-CSE-MsgGUID: 1BPH4c++TbyqTuf4f5UVYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97266220"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97266220"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:57:04 -0800
X-CSE-ConnectionGUID: BtKoOgfYR0elKPTO2Jvzvw==
X-CSE-MsgGUID: FQGj5txJQ5eAtsDssbYI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216730366"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 16:57:03 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpc3p-000000000XD-0Kcf;
	Tue, 10 Feb 2026 00:57:01 +0000
Date: Tue, 10 Feb 2026 01:56:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0
 (fsl,mpc8569-qe-spi): compatible:0: 'fsl,mpc8569-qe-spi' is not one of
 ['fsl,spi', 'aeroflexgaisler,spictrl']
Message-ID: <202602100132.Sk1xK6Lo-lkp@intel.com>
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
rchive/20260210/202602100132.Sk1xK6Lo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260210/202602100132.Sk1xK6Lo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602100132.Sk1xK6Lo-lkp@intel.com/

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
