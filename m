Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F02D3191D3
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770722956; cv=none; b=Xf0JVmy6h/BVJxYxQEcZbY8u9IdxqGH9s6Ak09VChIclOIVBnljrakw46qHbWPe0tL6YMANRVynNZs8U+0QttWK6UOyHecjxOBJvXSu4u/YGFzxWYCgIZ5X5OL/4tocn+lUFDQdqYIKChi2rOya9I+n5KJGroP4rre/vZ1ctioc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770722956; c=relaxed/simple;
	bh=jrv+yIMYHBuSlI/7LPn6ZsTazOxX7y0EQb8oCfOM/Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JE8tkmy4c3DlPBlyamx9kboBw/PSNSyK4KQGKmp/CxVNnwvrZQVnFcDrcI42jZQotMwAmGMgBe0EdKsz77mPBdZTdU8SBbvZmro3cR7qQsKZF4hCzysWk+qe1Xck5o+I0BstQbZhKz92t84kcbz6Orf1VnfyIu1OzBWBHZf7m1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeK6C93F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeK6C93F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770722956; x=1802258956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jrv+yIMYHBuSlI/7LPn6ZsTazOxX7y0EQb8oCfOM/Zs=;
  b=TeK6C93FLoS8Juiz7curxZMwOkok5OBy7+Xan7SC8TkkOnZrGxBH4UVR
   xQIAfP7ZfYAyhBJsm6aHXpMIdEWVnM7hR3RLhdORVVTNkwEIPvD1oOPP0
   GTapaMJV40wGN7kKVeQE1yqTvMZ6wf12rkUyOKkzMYvJqOtt70bixhgzf
   KaLZI2TtVQN5yjJ3dmg2kZmTeW7VQaeSj/1jrwGSQnUlFexe1gnrHm/VB
   eRd+TFbm0JR39btLzly92wIqQqaXq+2KG3J9qinuAUSLZD8fg6l1Aa5VZ
   KXOTNBsZXj2PXykVK4XGCB15LkV3HaM2G2dGh5TO9sSjna7Um3o54lc4q
   Q==;
X-CSE-ConnectionGUID: vRr8bzBIRe6PHKaWvA5URQ==
X-CSE-MsgGUID: YbDOj3MdSjarnmOh0EYBEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94489732"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="94489732"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 03:29:15 -0800
X-CSE-ConnectionGUID: rdwQJCjuTfaHF6ntd2UfcQ==
X-CSE-MsgGUID: Ud7r4EWbRUSabMaxjnHoLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211928950"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Feb 2026 03:29:14 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vplvb-000000000nN-2NzA;
	Tue, 10 Feb 2026 11:29:11 +0000
Date: Tue, 10 Feb 2026 12:28:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: spi@4c0
 (fsl,mpc8569-qe-spi): compatible:0: 'fsl,mpc8569-qe-spi' is not one of
 ['fsl,spi', 'aeroflexgaisler,spictrl']
Message-ID: <202602101207.qdkgMBjS-lkp@intel.com>
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
rchive/20260210/202602101207.qdkgMBjS-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260210/202602101207.qdkgMBjS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101207.qdkgMBjS-lkp@intel.com/

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
