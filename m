Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A741364059
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262308; cv=none; b=uVkzT/iMhaYd2RYwrBrUt6oNxHmcjOuvrG64iZCSjS1d+ZtkVZaptxcWHLoc2so+uB1zmAk8KVq+//flvs9xzywXyhe1gbZZX1uWBpWB1O0AOTTtO3q9v7dx7HTMyqJUUH6XkficOHjyE3p2FIdnG9zpc9pb2FUgVzHFXFiJZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262308; c=relaxed/simple;
	bh=blavlihAeoGhIpj+a4l6kkZTIO/CmlQHeEEtyO0/x4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AP/lxlc73EO+sb3K2XpnMPUCqsvXAUXkGf4EAWbFeIfdWDDdQ3oLtRUIwjvZ/8UOhsIUWeQjo2zOnyL4YiHbNBbnCysM7edNBL90pb/kR0cBO0K4cnSHHMPnf+HC0uOdNh4whMbeq6YL3LY1Au1Qdd6djZfsPsMvZhBzWj65c9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIR2l4i3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIR2l4i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781262307; x=1812798307;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=blavlihAeoGhIpj+a4l6kkZTIO/CmlQHeEEtyO0/x4Q=;
  b=aIR2l4i3XsyI1wIbRbxO+pzjaUbf+6au1rqj3L5n7lZhrv3a7l+D4Ed9
   H0Tln3DmPuGYIZXIZ4fstgFl3yn+W3wq95BdmqT87axJYoaYcjDWG+qI4
   8oTJtBJSx+DxxkhNB3DofyeuMjWDWcObEEe3scKCVt/ZcPO5mlK40lMgR
   4kd4BXxHpyTICO8eWnjVtCDK3bJMOvjaHY6v8NRiB5dmi+wSLlZK2K8R2
   aAwP6oamKUIJQnDcsSOKStZRn1p5dyLYJiZvK6CtTsJICVWLeIRQmpSP4
   kvwu8ffY7rn15r0xqMufG51uFjwtxRYJ1pocQThl8ucsg3gY4FOzTXcMq
   Q==;
X-CSE-ConnectionGUID: a3+Hjm5QSOGx+48Py0DfhA==
X-CSE-MsgGUID: VefX8bLxQhiB8c+o+YDNHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104761718"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="104761718"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 04:05:07 -0700
X-CSE-ConnectionGUID: EeJC4vQ6RuKpqstGRPWy2A==
X-CSE-MsgGUID: TR1TCbZUTxacV68RedwvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242659323"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2026 04:05:05 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXzh8-000000004Ez-2xMv;
	Fri, 12 Jun 2026 11:05:02 +0000
Date: Fri, 12 Jun 2026 13:04:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/gef_ppc9a.dtb:
 /localbus@fef05000/watchdog@4,2000: failed to match any schema with
 compatible: ['gef,ppc9a-fpga-wdt', 'gef,fpga-wdt-1.00', 'gef,fpga-wdt']
Message-ID: <202606121200.Kx5GREBd-lkp@intel.com>
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

Hi Neusch=C3=A4fer,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
commit: 39fe29e7f2fd38b0fee9bf987d180dee976dd2c7 powerpc: 86xx: Rename wdt@=
 nodes to watchdog@
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-2051-20260611 (https://download.01.org/0day-ci/a=
rchive/20260612/202606121200.Kx5GREBd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260612/202606121200.Kx5GREBd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 39fe29e7f2fd ("powerpc: 86xx: Rename wdt@ nodes to watchdog@")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606121200.Kx5GREBd-lkp@intel.com/

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

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
