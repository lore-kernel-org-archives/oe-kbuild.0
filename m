Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14BC1862A
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Mar 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772377738; cv=none; b=IASNbAxMPUKrnTkjPE6+kFzTBX2H3ddn9FbeNYr3rZ5sP5TfIqM3ERfmXXtAvcJ05NU150JOYcIPSm/hRhsZTDyw18lcDNbm5dPnf5HnV+dents4sisuDE8yRf5RRdKjY+7H/J3ThvGVir/++yYB/oV/Zmr4GYUN0hbsNXqhFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772377738; c=relaxed/simple;
	bh=v/QI3nPkqlNTuBHnvhAFrxGpdhsFQTeDS4UGtwreVew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oI6EnkpUsuFieEhp9bZdnt5lhmWgxOAfVfQI0aIt7lxHlfIez+tRCKH9phFwQnGgyqzY50GZdf86ixOIKdRVO0RTpJGxM6P6FKUM8ikjLRp5ICI5ThkVZMKGnLBkE0znIuumPyC2uJis5cqCZK5FTGhRwLjtvAYlprF/GpEgzXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=amNYF+Bf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="amNYF+Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772377737; x=1803913737;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=v/QI3nPkqlNTuBHnvhAFrxGpdhsFQTeDS4UGtwreVew=;
  b=amNYF+BfAyicq55Hw6TYtDkeuRVBLq+4Dnv3iAA2M4WM9BoC4InTLhcL
   2S5xjECY8NJbKr5FbgChLAgzHQrgYrulb5+AOVHWhscR88kz7fl5xNkg+
   Y4OXfSUvf/IaB9XR3Zf7ALxRSlr1dMu/SXTRvenBpAnJ7R3/pNrEGCsn/
   EF7qW4lRQxAmxDVTUyn/DLVIxEInnVw3cyDW09DVUZbTtEWos45at/oCL
   F+veVcfEjmgprbmPTkE53Y1f6iMC5RzpNvkQalRJChvLm5hBx+OC2DtWA
   o3XICEXSjRYquUKoJulzvhMf985nN8xYxp7DTxmDPRwqnaUag85HcXaZs
   g==;
X-CSE-ConnectionGUID: GUKri2v6QkqE5cTf9KaW1g==
X-CSE-MsgGUID: En5NFSioQRW2R5TRm/r69w==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="77007682"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="77007682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 07:08:56 -0800
X-CSE-ConnectionGUID: N1qrdakkQYOQArA3lDfIRA==
X-CSE-MsgGUID: TAD4z5bUROWRYNggwbDYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="215447886"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Mar 2026 07:08:55 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwiPc-0000000011B-3nHS;
	Sun, 01 Mar 2026 15:08:52 +0000
Date: Sun, 01 Mar 2026 16:08:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6444/14265]
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2000:
 failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt',
 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
Message-ID: <202603011657.GMaQFhSj-lkp@intel.com>
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

Hi Neusch=C3=A4fer,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3fa5e5702a82d259897bd7e209469bc06368bf31
commit: 39fe29e7f2fd38b0fee9bf987d180dee976dd2c7 [6444/14265] powerpc: 86xx=
: Rename wdt@ nodes to watchdog@
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: powerpc-randconfig-2051-20260301 (https://download.01.org/0day-ci/a=
rchive/20260301/202603011657.GMaQFhSj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260301/202603011657.GMaQFhSj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603011657.GMaQFhSj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dts:211.22-213.4: Warning (interrupt=
_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an in=
terrupt provider
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: Warning (interrupt_map): Failed=
 prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /: failed to match any schema w=
ith compatible: ['gef,ppc9a']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: / (gef,ppc9a): False schema doe=
s not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000: failed to m=
atch any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/nvram@3,0: f=
ailed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/fpga@4,0: fa=
iled to match any schema with compatible: ['gef,ppc9a-fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2=
000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'ge=
f,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2=
000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'ge=
f,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/watchdog@4,2=
000: failed to match any schema with compatible: ['gef,ppc9a-fpga-wdt', 'ge=
f,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpg=
a-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/pic@4,4000: =
failed to match any schema with compatible: ['gef,ppc9a-fpga-pic', 'gef,fpg=
a-pic-1.00']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000=
: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc61=
0-gpio']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: /localbus@fef05000/gpio@7,14000=
: failed to match any schema with compatible: ['gef,ppc9a-gpio', 'gef,sbc61=
0-gpio']
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc):=
 dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb: soc@fef00000 (fsl,mpc8641-soc):=
 dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
--
   arch/powerpc/boot/dts/fsl/mpc8641si-post.dtsi:22.12-26.4: Warning (uniqu=
e_unit_address_if_enabled): /soc@fef00000/mcm-law@0: duplicate unit-address=
 (also used in node /soc@fef00000/dma-channel@0)
   arch/powerpc/boot/dts/fsl/gef_sbc310.dts:217.22-231.4: Warning (interrup=
t_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an i=
nterrupt provider
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: Warning (interrupt_map): Faile=
d prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /: failed to match any schema =
with compatible: ['gef,sbc310']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: / (gef,sbc310): False schema d=
oes not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000: failed to =
match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/nvram@3,0: =
failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/fpga@4,0: f=
ailed to match any schema with compatible: ['gef,fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,=
2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', '=
gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,=
2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', '=
gef,fpga-wdt-1.00', 'gef,fpga-wdt']
>> arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/watchdog@4,=
2000: failed to match any schema with compatible: ['gef,sbc310-fpga-wdt', '=
gef,fpga-wdt-1.00', 'gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,f=
pga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,sbc310-fpga-pic', 'gef,f=
pga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: /localbus@fef05000/gpio@4,8000=
: failed to match any schema with compatible: ['gef,sbc310-gpio']
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc310.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
--
   arch/powerpc/boot/dts/fsl/gef_sbc610.dts:209.22-211.4: Warning (interrup=
t_provider): /pcie@fef09000: '#interrupt-cells' found, but node is not an i=
nterrupt provider
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: Warning (interrupt_map): Faile=
d prerequisite 'interrupt_provider'
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /: failed to match any schema =
with compatible: ['gef,sbc610']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: / (gef,sbc610): False schema d=
oes not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000: failed to =
match any schema with compatible: ['fsl,mpc8641-localbus', 'simple-bus']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/nvram@3,0: =
failed to match any schema with compatible: ['simtek,stk14ca8']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/fpga@4,0: f=
ailed to match any schema with compatible: ['gef,fpga-regs']
>> arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/watchdog@4,=
2000: failed to match any schema with compatible: ['gef,fpga-wdt']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/pic@4,4000:=
 failed to match any schema with compatible: ['gef,fpga-pic']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: /localbus@fef05000/gpio@7,1400=
0: failed to match any schema with compatible: ['gef,sbc610-gpio']
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/powerpc/boot/dts/fsl/gef_sbc610.dtb: soc@fef00000 (fsl,mpc8641-soc)=
: dma-channel@80: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
