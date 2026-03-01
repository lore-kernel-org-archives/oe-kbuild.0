Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C71DD9AC
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772394179; cv=none; b=FGvzNnjeOeuOeRzUIEKo10hoGpukG5eRNcilE2faRvwN6ZW8OFv/9Uigxd+IjJrnmJQuzttgNwBtvSntDeu946up3MBNinaOzGq6UMk3AMmxLbnhHhAZZIJHy672uR7P13jJuHgQEDSN2x8BBz9sWgVP/5Jh5coALHJPTuc5tas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772394179; c=relaxed/simple;
	bh=3hLTFeT9hjlTI74TwcSh5jqDE59nckoOk6wrdpHNkp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UceHQuflFELid/HJiidLc/ex82sn8BbyS1owc8axKFt799VY9zz69MaNAeo3MTc9VStgkGh/7KpCyFMflFVBB9AzZL2MvC4eG3hqPGrO751lzp8OxzqdDudjNP2dO8ScHQX2UjabglaQD1FjmAa0DZ8GgbkCt8zeVbgekr8oK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgJHaoNc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgJHaoNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772394177; x=1803930177;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3hLTFeT9hjlTI74TwcSh5jqDE59nckoOk6wrdpHNkp0=;
  b=OgJHaoNc7kxt87HhW1ZkV15T6HqDk53w1Wqn8TV+cK2naus/FejuIOKJ
   5VbYN0O29p0pnjGW5sR+KlLHwItcWPY3YTWcCUdF4YQQpEL3EveQu3gPE
   s6+yAg+c7wCfX/P2Sz5CjFrlQ/naBYhlZsqEJz04E63wtGGDirf6l+xpo
   rpH/Q2hwqf4WbjoQQ/qwys1Q0UZC1zJe7R1c3eTlGzT7maR3JEbV/f71a
   sZCuO3AWqtbov9+GjjfiKFyyMVBysPbz5CznmMDAXDUE0WkU6/Ye/mI5h
   KAPYBO6nqAB5ASB4gHj87LaCemN+9poxhUmk1RFRvmqM5m18uotbPFYdK
   g==;
X-CSE-ConnectionGUID: OfXMC/v4TXilIPEpoaIXbw==
X-CSE-MsgGUID: AClG2SKgQGi9G4ltLbgGiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96026461"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="96026461"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 11:42:57 -0800
X-CSE-ConnectionGUID: E2H+cKUsQjGPBmhjRw5snA==
X-CSE-MsgGUID: m4x1dQy5RkaoOEthii3hrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="217542838"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2026 11:42:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwmgo-0000000012v-1fI1;
	Sun, 01 Mar 2026 19:42:54 +0000
Date: Sun, 01 Mar 2026 20:42:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6445/14265]
 arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,800:
 failed to match any schema with compatible: ['ge,imp3a-fpga-wdt',
 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
Message-ID: <202603012027.kAi7Sv3h-lkp@intel.com>
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
TO: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: af6850ac9ef3c98e6e8f2929e24ed6fd154fa39e [6445/14265] powerpc: p202=
0: Rename wdt@ nodes to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-2051-20260301 (https://download.01.org/0day-ci/a=
rchive/20260301/202603012027.kAi7Sv3h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260301/202603012027.kAi7Sv3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603012027.kAi7Sv3h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000: failed to ma=
tch any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
$nodename:0: 'nor@1,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: nor@1,0 (ge,imp3a-paged-flash): =
Unevaluated properties are not allowed ('partition@0', 'partition@7800000' =
were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nvram@3,0: fa=
iled to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/fpga@4,0: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-regs']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/pic@4,20: fai=
led to match any schema with compatible: ['ge,imp3a-fpga-pic', 'gef,fpga-pi=
c-1.00']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/gpio@4,400: f=
ailed to match any schema with compatible: ['ge,imp3a-gpio']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/watchdog@4,80=
0: failed to match any schema with compatible: ['ge,imp3a-fpga-wdt', 'gef,f=
pga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@7,0: fai=
led to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000: failed to match a=
ny schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): compatible: =
'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121=
-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000 (fsl-i2c): Unevaluated =
properties are not allowed ('cell-index', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
