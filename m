Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA06E430BBE
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359556; cv=none; b=o2yLnUvESrA810XOsErWV+XgneGo1KvTukg1gCt990BmiEptUQuPUWL130Mnf0r+uONDUkgUXFcA1ptwhhqjAFd9nNGzQNn9/hDjoxtaB1PiRchbZBSYyRbOV86xH5fADMM/eki++ajc3QZQgjm5HRsk7GbfdB85mWSTnavhiiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359556; c=relaxed/simple;
	bh=BREXwNI0j+kgPJBRnX4SSEjj/3ymjeG7eSP3SLq8fMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IMI0sjUNywgxtrnBy3DIRy7qxK+ghszFV9cdH7wiLbZcF5K4b7R3OHeqKGr1LxPD/9KqG6B96lSONmsySfeB2kv98usk1hKxgSRivTaGhLpzta6t/Pwpbzji2CC0TNN/suQcSdSncCdghUhp3WFZUFy/nfCagRzUhDb8hWcST9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cF5Yr73v; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cF5Yr73v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772359554; x=1803895554;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BREXwNI0j+kgPJBRnX4SSEjj/3ymjeG7eSP3SLq8fMo=;
  b=cF5Yr73v7gcXtKL2Yr11sb0AOmMrgLEUY0k9nj+ubxGtj4CmFi9rUEJ0
   /ND6kPMOlUT3jFn4YkO1jGywNCP3ImTU5P0hMDgPXwERtWs70l2yB3GkJ
   xdYrAhgRbJ6kv3PoyVWhATfqWe/fA2VRb0IWrKyaCdVnm/BQ/fwGRw1me
   xu5F+Y7mfsiIptj9XFr0Pf7/8TqOwPCy/5aW4yUUInhJd8h/APQtXYaVS
   S3mo/jUAadX0KrHgcHdkpI+xjkZaecsKcL/1z01GNUls3MuBMsafn4fZp
   dNdYIKnV9Aw8wJqfKBqMkbjiPJ19vwKTn1FUVc/hwAnF365cci/VPCQHJ
   w==;
X-CSE-ConnectionGUID: iBY0LqbrQcGwx1JxUS4qFg==
X-CSE-MsgGUID: Y14o/gbjTn+mhKlYnVqjag==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73499322"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="73499322"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 02:05:54 -0800
X-CSE-ConnectionGUID: lv2WEFG6S5eotbF5l+XVGA==
X-CSE-MsgGUID: Kh+UI+vOS+qnm5f2If7Qaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="247847113"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2026 02:05:53 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwdgM-000000000yb-2riz;
	Sun, 01 Mar 2026 10:05:50 +0000
Date: Sun, 01 Mar 2026 11:05:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6442/14265]
 arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/watchdog@900: failed to match
 any schema with compatible: ['fsl,mpc5121-wdt']
Message-ID: <202603011054.x0N0XKcH-lkp@intel.com>
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
commit: 0070b2cbfe7389159669c3a5bb23d2ef89043055 [6442/14265] powerpc: 512x=
: Rename wdt@ node to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-2051-20260301 (https://download.01.org/0day-ci/a=
rchive/20260301/202603011054.x0N0XKcH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260301/202603011054.x0N0XKcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603011054.x0N0XKcH-lkp@intel.com/

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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
