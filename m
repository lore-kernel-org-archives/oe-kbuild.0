Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1231A2E8DF1
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756809663; cv=none; b=YevXcJlTtDv3z9lllAx7TJakPDAjK2FJlwXWybRtrCK0MMOb/UJ2ZIMWK7TZwXeNuPUWS47PVMQS5+GJD+J3ux/B3l8qKC8Ccfxcr1a8OWYvwUHXeUz8auJT7ObZ9D44i2wYhAvT4MKAlaDtvZgWeig2lI889xnQx2PWdC47qeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756809663; c=relaxed/simple;
	bh=OeXXkfZKY4is8FLiGAvAoFMEpIpDc7P3T3AzLx8Fsq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hG7m3GFjU9jF5F/rFlMJUL11SMcCUm9PoCJlnba2h9+UgI4/PvOw7lXiygSNbzS9sR6RS0d1om5ptjDv++YCWhDr9RxI9Cw6Zw4A4NUvGBEXDoJurPcB8j08htzgz2GujWijQkm829hSpm/kxBugWn5SndXg+E5YWkmnDU9c/WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rilj/Gfp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rilj/Gfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756809662; x=1788345662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OeXXkfZKY4is8FLiGAvAoFMEpIpDc7P3T3AzLx8Fsq0=;
  b=Rilj/GfpHXBUcCY0O4rfHwBUp8ANqedm9JtAFOqiBwkJyJA1TSn64hXI
   CbP+4lVq4AOt5jwHqQxFdq9lkNSHHiRySAUdj0uCRZ6copjM4rA+2EHN3
   IcdHcYDcm4aDeBv9+EyjyTiVxVFDvtvWaoN0n4yWLLzkHu59R7vvlC8GD
   0/RP82Ny04H7OMpMRUiCUkTXpRKjC8wWNfXHBaQOuNEOETDJB+ifHB7XW
   Pn+37ThEeuP+hbNBLX4u0n0Lgse8SoYOYphXFBR+a9UZ/+/JhPpYEjELI
   bZYynHX5utNUtFkmNWx867z3PmvsdqGB9V4/B3gP8A945VYhDMJRl/a0S
   A==;
X-CSE-ConnectionGUID: SOxFOvO0RxGDp4xuCfJqOw==
X-CSE-MsgGUID: uEGg8qMPQ3+ORnOnGP8sVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58993626"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58993626"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 03:41:02 -0700
X-CSE-ConnectionGUID: 7nmycEZ9TAmsNnQQo0H1/w==
X-CSE-MsgGUID: DOEOdu10SvOjpC9NrMtw0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="176561942"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 02 Sep 2025 03:40:58 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utOQh-0001qb-1h;
	Tue, 02 Sep 2025 10:40:15 +0000
Date: Tue, 2 Sep 2025 18:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
Message-ID: <202509021831.uriGVFSf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
References: <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Qiang Zhao <qiang.zhao@nxp.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on powerpc/next powerpc/fixes linus/master v6.17-rc4]
[cannot apply to next-20250902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250901-202447
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: powerpc-randconfig-051-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021831.uriGVFSf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021831.uriGVFSf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509021831.uriGVFSf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000: failed to match any schema with compatible: ['fsl,mpc8360-immr', 'simple-bus']
   arch/powerpc/boot/dts/kmeter1.dtb: i2c@3000 (fsl,mpc8313-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8360-par_io']
   arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pario-bank): compatible:0: 'fsl,mpc8360-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
>> arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pario-bank): reg: [[5168], [24]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-controller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-controller@80:interrupts: [[32, 8], [33, 8], [34, 8], [35, 8], [40, 8], [41, 8], [42, 8], [43, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: crypto@30000 (fsl,sec2.2): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario']
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: gpio-controller@1448 (fsl,mpc8323-qe-pario-bank): compatible:0: 'fsl,mpc8323-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: gpio-controller@1448 (fsl,mpc8323-qe-pario-bank): compatible: ['fsl,mpc8323-qe-pario-bank'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): $nodename:0: 'qe@e0100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'mdio@3120', 'spi@4c0', 'spi@500', 'ucc@2200', 'ucc@3000' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
