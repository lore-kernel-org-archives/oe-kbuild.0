Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C263955F5
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 04:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238606; cv=none; b=eXOpspizB3CtjglyDOCl8hKAQvqzHN7/n83eXYkFBnI3wvvSS1CPoyi2FqZINbjBcyMjWrwZ+rEnt8jxykZfUlgz5n3AZVzoVA0JtIlFApXLl1nHEAT4KKCt0aoZvz6KqQK11Wah0omq1q23eqsmZB/rNQVnUT3JXUY1i30Qo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238606; c=relaxed/simple;
	bh=09Uvm4dP57UFFPP66VjxIfxvW/fYqnceM/gipYTqdMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ho+imSHE3A+UlMkFQo6YBLrORR5QcWb05OGkcmMhA38aA9LLk51610BiEi/VUMk2JitU/y6UzYRuB3uAyAT7ATeWcaGEofQbF1sHxXIaHLDdaLP6Ut3XhFWBGmWR8LhvGOEGuPe0WhJb6sWQMsFwzQW6PtZD0sDtXhIYGe1LA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOLbpg7p; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOLbpg7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781238604; x=1812774604;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=09Uvm4dP57UFFPP66VjxIfxvW/fYqnceM/gipYTqdMU=;
  b=LOLbpg7pnswm5DHJ522n91krG69RJ60DfRBWkRsEuVnUyl7SP0VraxaG
   H3yLvEwJVeDeHDOTknilFeMAjHJqlwaQRHXjMoaIO7BxmKfCzDU7zp3eG
   oE/vqmOWVQhCwd4lHdd1MGN+nGB/XLGGsQbtP9KVNrTUFTokuEEcIJb/V
   61C//9pUZFJafuQQt7jXQvkB4CjucgQfLXt/Lo+IKrNmyzizygCULSEz/
   egs4EWE0xHcxOlKNVanszXxwTu5yW3XR+7pasP17PfKBObQEymWQxlyfo
   jvYOi/ihyWryTf4pweWyk2qqS9sYF2Jr26QKhAW95wZCC1PWRrZfpqEaF
   A==;
X-CSE-ConnectionGUID: ON18vca3TEWeSckhCKLyVQ==
X-CSE-MsgGUID: gFcCC3PwTR+hrhVxXG9u/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82072462"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82072462"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:30:04 -0700
X-CSE-ConnectionGUID: rwVGUYKQT/aBZcUlv394lg==
X-CSE-MsgGUID: TaWSp3EKTEqCQEFXgqqxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251007125"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Jun 2026 21:30:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtWq-000000004Cr-2BRF;
	Fri, 12 Jun 2026 04:30:00 +0000
Date: Fri, 12 Jun 2026 06:29:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/ac14xx.dtb:
 /soc@80000000/watchdog@900: failed to match any schema with compatible:
 ['fsl,mpc5121-wdt']
Message-ID: <202606120633.zHN2Cbi1-lkp@intel.com>
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
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 0070b2cbfe7389159669c3a5bb23d2ef89043055 powerpc: 512x: Rename wdt@=
 node to watchdog@
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-2051-20260611 (https://download.01.org/0day-ci/a=
rchive/20260612/202606120633.zHN2Cbi1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606120633.zHN2Cbi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 0070b2cbfe73 ("powerpc: 512x: Rename wdt@ node to watchdog@")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606120633.zHN2Cbi1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ac14xx.dtb: /nfc@40000000: failed to match any sch=
ema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020: failed to match an=
y schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/fram@1,0: failed to=
 match any schema with compatible: ['ifm,ac14xx-fram', 'linux,uio-pdrv-geni=
rq']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/fram@1,0: failed to=
 match any schema with compatible: ['ifm,ac14xx-fram', 'linux,uio-pdrv-geni=
rq']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/asi@2,0: failed to =
match any schema with compatible: ['ifm,ac14xx-asi-fpga']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/netx@3,0: failed to=
 match any schema with compatible: ['ifm,netx']
   arch/powerpc/boot/dts/ac14xx.dtb: /localbus@80000020/safety@5,0: failed =
to match any schema with compatible: ['ifm,safety']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000: failed to match any sch=
ema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/interrupt-controller@c00=
: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipi=
c']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/interrupt-controller@c00=
: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,ipi=
c']
>> arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/watchdog@900: failed to =
match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/rtc@a00: failed to match=
 any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/reset@e00: failed to mat=
ch any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/clock@f00: failed to mat=
ch any schema with compatible: ['fsl,mpc5121rev2-clock', 'fsl,mpc5121-clock=
']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/clock@f00: failed to mat=
ch any schema with compatible: ['fsl,mpc5121rev2-clock', 'fsl,mpc5121-clock=
']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/pmc@1000: failed to matc=
h any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/can@1300: failed to matc=
h any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/can@1380: failed to matc=
h any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/sdhc@1500: failed to mat=
ch any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/ac14xx.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevaluate=
d properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml
--
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/mpc5121ads.dtb: /mbx@20000000: failed to match any=
 schema with compatible: ['fsl,mpc5121-mbx']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /sram@30000000: failed to match an=
y schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /nfc@40000000: failed to match any=
 schema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020: failed to matc=
h any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/board-control@2=
,0: failed to match any schema with compatible: ['fsl,mpc5121ads-cpld']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /localbus@80000020/pic@2,a: failed=
 to match any schema with compatible: ['fsl,mpc5121ads-cpld-pic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000: failed to match any=
 schema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller=
@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl=
,ipic']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/interrupt-controller=
@c00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl=
,ipic']
>> arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/watchdog@900: failed=
 to match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/rtc@a00: failed to m=
atch any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/reset@e00: failed to=
 match any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/clock@f00: failed to=
 match any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/pmc@1000: failed to =
match any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: gpio@1100 (fsl,mpc5121-gpio): '#gp=
io-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1300: failed to =
match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/can@1380: failed to =
match any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/mpc5121ads.dtb: /soc@80000000/sdhc@1500: failed to=
 match any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/mpc5121ads.dtb: i2c@1700 (fsl,mpc5121-i2c): Uneval=
uated properties are not allowed ('clock-names', 'clocks' were unexpected)
--
   arch/powerpc/boot/dts/pdm360ng.dtb: /sram@30000000: failed to match any =
schema with compatible: ['fsl,mpc5121-sram']
   arch/powerpc/boot/dts/pdm360ng.dtb: /nfc@40000000: failed to match any s=
chema with compatible: ['fsl,mpc5121-nfc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /localbus@80000020: failed to match =
any schema with compatible: ['fsl,mpc5121-localbus']
   arch/powerpc/boot/dts/pdm360ng.dtb: mram0@2,0 (mtd-ram): $nodename:0: 'm=
ram0@2,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: mram1@2,10000 (mtd-ram): $nodename:0=
: 'mram1@2,10000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000: failed to match any s=
chema with compatible: ['fsl,mpc5121-immr']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c=
00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,i=
pic']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/interrupt-controller@c=
00: failed to match any schema with compatible: ['fsl,mpc5121-ipic', 'fsl,i=
pic']
>> arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/watchdog@900: failed t=
o match any schema with compatible: ['fsl,mpc5121-wdt']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/rtc@a00: failed to mat=
ch any schema with compatible: ['fsl,mpc5121-rtc']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/reset@e00: failed to m=
atch any schema with compatible: ['fsl,mpc5121-reset']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/clock@f00: failed to m=
atch any schema with compatible: ['fsl,mpc5121-clock']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/pmc@1000: failed to ma=
tch any schema with compatible: ['fsl,mpc5121-pmc']
   arch/powerpc/boot/dts/pdm360ng.dtb: gpio@1100 (fsl,mpc5121-gpio): '#gpio=
-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1300: failed to ma=
tch any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/can@1380: failed to ma=
tch any schema with compatible: ['fsl,mpc5121-mscan']
   arch/powerpc/boot/dts/pdm360ng.dtb: /soc@80000000/sdhc@1500: failed to m=
atch any schema with compatible: ['fsl,mpc5121-sdhc']
   arch/powerpc/boot/dts/pdm360ng.dtb: i2c@1700 (fsl,mpc5121-i2c): Unevalua=
ted properties are not allowed ('clock-names', 'clocks' were unexpected)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
