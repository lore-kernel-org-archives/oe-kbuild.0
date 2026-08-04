Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D953515C7
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Aug 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785841694; cv=none; b=TP3lTOhDLEjEMgioc5AnateAxkbV8HXWSokgoljfb4c+ROqzaHCIG0V9JslxuSvt2Kr79BysppREQye1MbLIMraGFDC7usGLh29t6P3EXmhqhZsoCwYBZk11/NAmhBi/ybYmPx4+YbpyB5iFlQUVdjw0cO5LhzKM8DTO30R8zj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785841694; c=relaxed/simple;
	bh=GZ+7QbGW5bdWKaEALrlkL949VkCn8pmB5pt4pEDX9gw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hj6TV3P8robJIBtBV5xr35AXznvXHMvHIgCWYb5tG4zNy19W7Kx5/KzmTr39B9Bqcmt8SfYhnHGaJUAVGnBSwKe737HhdNrHrLe6clMmfGwJ3Sx3FexG5EUpOBNAZT79Ngofcrfn+uPMOczRndMVxviB9OYLoYmxadapPSF2MLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KX1uj2iy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KX1uj2iy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785841691; x=1817377691;
  h=date:from:to:cc:subject:message-id;
  bh=GZ+7QbGW5bdWKaEALrlkL949VkCn8pmB5pt4pEDX9gw=;
  b=KX1uj2iyoBeSZSe8tGlyoHkhs3XPHJNKKQHC0Ld+9dfcBv0nDaK5NvNZ
   oavsbp+l8AY6XDKDlmWe5mRJeX8cfMFNg4XUreel4sErs3NajBgHwAwVD
   h/b5iacBwPNxP/RRbFHyWiqXSSxBtW8wPI/6c+k9TkXnRmgTIa/cHbzAi
   uL4Ri+K+Tgi+SQFzJEw6DKEAJpksTbiTVOdJTiYD3ezCcQdtJBrdD3YED
   3s9WcYK2e288S1osz5T44j+vQfCQQFlyChrF67QQYJyLbzqyvGnIuBz8T
   E43lW7Qpm7bBtu3rL9DRyBYVD5aiD6Nc9R+TrHz1d7GlVdgEglmW6VjEZ
   Q==;
X-CSE-ConnectionGUID: F7um1UJ5RLSfk9AwgQOT8w==
X-CSE-MsgGUID: wIHYWqCvQ62RW5pPXEZfZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97759167"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97759167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 04:08:09 -0700
X-CSE-ConnectionGUID: zcqQfOAETfiyuOY+PwWwRA==
X-CSE-MsgGUID: rH8I6SktSTCgo97YjWQrkA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Aug 2026 04:08:06 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrD08-0000000049q-2dzC;
	Tue, 04 Aug 2026 11:08:04 +0000
Date: Tue, 04 Aug 2026 13:07:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chleroy:soc_fsl 10/31] arch/powerpc/boot/dts/kmeter1.dtb:
 gpio-controller@30 (fsl,mpc8360-qe-pario-bank): reg: [[5168], [24]] is too
 long
Message-ID: <202608041307.2xeldEmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: Paul Louvel <paul.louvel@bootlin.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/chleroy/linux soc_fsl
head:   ab71a25d6658d2412c74bdd1158cc5fb805cab9e
commit: b6a375b38c279a22149b08426e80a0947baa2eb2 [10/31] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: powerpc-randconfig-2051-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041307.2xeldEmV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041307.2xeldEmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608041307.2xeldEmV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: soc8360@e0000000 (fsl,mpc8360-immr): $nodename:0: 'soc8360@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: i2c@3000 (fsl,mpc8313-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8360-par_io']
>> arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pario-bank): reg: [[5168], [24]] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,mpc8323-qe-pario-bank.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-controller@80:interrupts: [[32, 8], [33, 8], [34, 8], [35, 8], [40, 8], [41, 8], [42, 8], [43, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl,qe'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
