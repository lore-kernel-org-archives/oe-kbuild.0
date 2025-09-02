Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7713311C13
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824157; cv=none; b=cT1EqoTX05D5ZzrFMZ0gXIgi5BEipFvYs9lKJ3HEhmaKEke1C+bfAt24zVnZ5e+1+A0ds6V/HOkiFNcMOj2cZWyoCDLq1vP3uT/WV2dkHQgiW0pARmC9rRGk7dtFVG/rT9pRwBVFLjL8acMGVAjq1eSiMu8DfulZ3ZdOczIshFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824157; c=relaxed/simple;
	bh=dWBUxT7AlhI4k+F+W4wFe54cXZl4QtyS+e7tBoLJRDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cPdcOt0k1/dI4n5gGegw481j2LsymsxW8WM8hBNHUJfuh53vf87liRU1DllCjV5l0oyHsojCpwhtnQPWx/kCXH3I2SBfM9755iEEhQQ++wb8XfDPgIAGnxUyv/XiJMQ9ZupaGz863N6Mt8cQCumQmqxAjUrsotpaF9DEzxMXbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQD014HX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQD014HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756824154; x=1788360154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWBUxT7AlhI4k+F+W4wFe54cXZl4QtyS+e7tBoLJRDU=;
  b=WQD014HXlC26X1nnVC3nBe8le+fmes4QCXYUmnGvNl0TkmIcle+f/O8z
   yY9umhPyiMD2mSUg7k15Gio+mKxqgKYObbPKVHEu7SP1vVaLPShNFF5cm
   3XLJ3JJ3hp+tCJ4YI+DloFSaXNyOqeSmGI4Jg+QHJ6c94qsVLFw9HBIBC
   PcIv57qnjNJ6/FahxGac79E9tI5N2g8FRA3k4U00DkQhNOD4uJPXA3CfI
   DFFi41EY6OxrnDov399u9qHzptuaCtPBqkVL5Zt4vMw0dOGVneSudjQoV
   f9oE/TtftK0yt/ZL/LP1S4bP8PuqbLtHvxNCo8gCyEcYfeWmW6T+Og3wk
   A==;
X-CSE-ConnectionGUID: hC46uW1DS4uq0kGwbuodpQ==
X-CSE-MsgGUID: 91Xz3DKwRiiAtlELvl5GjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="59238549"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59238549"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 07:42:34 -0700
X-CSE-ConnectionGUID: sRC8v7ASQZuASkLKEZaVRg==
X-CSE-MsgGUID: LY7VYXLDSMisJpAMwffWDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170589704"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 07:42:33 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utSD1-0002cr-0D;
	Tue, 02 Sep 2025 14:42:15 +0000
Date: Tue, 2 Sep 2025 22:41:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <202509022207.l11ACQTl-lkp@intel.com>
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
In-Reply-To: <4d7560f77dbd60f6297958acbc0cf412d8921856.1756727747.git.christophe.leroy@csgroup.eu>
References: <4d7560f77dbd60f6297958acbc0cf412d8921856.1756727747.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>

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
patch link:    https://lore.kernel.org/r/4d7560f77dbd60f6297958acbc0cf412d8921856.1756727747.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH v5 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: powerpc-randconfig-051-20250902 (https://download.01.org/0day-ci/archive/20250902/202509022207.l11ACQTl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509022207.l11ACQTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509022207.l11ACQTl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/kmeter1.dtb: soc8360@e0000000 (fsl,mpc8360-immr): $nodename:0: 'soc8360@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000: failed to match any schema with compatible: ['fsl,mpc8360-immr', 'simple-bus']
   arch/powerpc/boot/dts/kmeter1.dtb: i2c@3000 (fsl,mpc8313-i2c): Unevaluated properties are not allowed ('cell-index' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/pic@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8360-par_io']
>> arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pario-bank): compatible:0: 'fsl,mpc8360-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: gpio-controller@30 (fsl,mpc8360-qe-pario-bank): reg: [[5168], [24]] is too long
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: /soc8360@e0000000/par_io@1400/gpio-controller@30: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/kmeter1.dtb: qe@100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: i2c@3000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: crypto@30000 (fsl,sec2.2): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: /soc8323@e0000000/par_io@1400: failed to match any schema with compatible: ['fsl,mpc8323-qe-pario']
>> arch/powerpc/boot/dts/mpc832x_rdb.dtb: gpio-controller@1448 (fsl,mpc8323-qe-pario-bank): compatible:0: 'fsl,mpc8323-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: gpio-controller@1448 (fsl,mpc8323-qe-pario-bank): compatible: ['fsl,mpc8323-qe-pario-bank'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): $nodename:0: 'qe@e0100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc832x_rdb.dtb: qe@e0100000 (fsl,qe): compatible: ['fsl,qe'] is too short
--
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: crypto@30000 (fsl,sec2.0): Unevaluated properties are not allowed ('sleep' was unexpected)
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/interrupt-controller@700: failed to match any schema with compatible: ['fsl,pq2pro-pic', 'fsl,ipic']
>> arch/powerpc/boot/dts/mpc836x_rdk.dtb: gpio-controller@1418 (fsl,mpc8360-qe-pario-bank): compatible:0: 'fsl,mpc8360-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1418: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: gpio-controller@1460 (fsl,mpc8360-qe-pario-bank): compatible:0: 'fsl,mpc8360-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: /soc@e0000000/gpio-controller@1460: failed to match any schema with compatible: ['fsl,mpc8360-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000 (fsl,qe): $nodename:0: 'qe@100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000 (fsl,qe): interrupt-controller@80: '#address-cells', 'big-endian' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/mpc836x_rdk.dtb: qe@100000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-frequency', 'device_type', 'mdio@2120', 'spi@4c0', 'spi@500', 'timer@440', 'ucc@2000', 'ucc@2400', 'ucc@2600', 'ucc@3000', 'ucc@3200', 'ucc@3400', 'usb@6c0' were unexpected)
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: i2c@3100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: sdhc@2e000 (fsl,esdhc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: sdhc@2e000 (fsl,esdhc): compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: sdhc@2e000 (fsl,esdhc): compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: gpio-controller@80 (fsl,mpc8569-qe-pario-bank): compatible:0: 'fsl,mpc8569-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/par_io@e0100/gpio-controller@80: failed to match any schema with compatible: ['fsl,mpc8569-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
>> arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: gpio-controller@a0 (fsl,mpc8569-qe-pario-bank): compatible:0: 'fsl,mpc8569-qe-pario-bank' is not one of ['fsl,chip-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank-a', 'fsl,mpc8323-qe-pario-bank-b', 'fsl,mpc8323-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-a', 'fsl,mpc8360-qe-pario-bank-b', 'fsl,mpc8360-qe-pario-bank-c', 'fsl,mpc8360-qe-pario-bank-d', 'fsl,mpc8360-qe-pario-bank-e', 'fsl,mpc8360-qe-pario-bank-f', 'fsl,mpc8360-qe-pario-bank-g', 'fsl,mpc8568-qe-pario-bank-a', 'fsl,mpc8568-qe-pario-bank-b', 'fsl,mpc8568-qe-pario-bank-c', 'fsl,mpc8568-qe-pario-bank-d', 'fsl,mpc8568-qe-pario-bank-e', 'fsl,mpc8568-qe-pario-bank-f']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,mpc8323-qe-pario-bank.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/par_io@e0100/gpio-controller@a0: failed to match any schema with compatible: ['fsl,mpc8569-qe-pario-bank', 'fsl,mpc8323-qe-pario-bank']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8569-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: /soc@e0000000/ecm@1000: failed to match any schema with compatible: ['fsl,mpc8569-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: duart-sleep-nexus (simple-bus): $nodename:0: 'duart-sleep-nexus' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: serial@4500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/mpc8569mds.dtb: serial@4600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
