Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7743833A6F2
	for <oe-kbuild@lists.linux.dev>; Fri, 22 May 2026 21:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486580; cv=none; b=B6Y1A50fW1GYBiBI3Gl+ViWAg1MCvfVu4PELQOfNbh0MBGP/dd+yonqSOkXtZPXiHwPMFU3UZY7nPniwMRaWBRVIu7C6f71uvtidZ5c6dZbxX2xS6s2AhCZaIK+nA1iB34yLjQqe6oKk1DvtkiDl6asD/Lr6kFEzIlccuVx454U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486580; c=relaxed/simple;
	bh=xAozgNFZdeXIHfW9HPw4+o6qUqnAI8QPJeu5dldQ2ws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kv5RZkcz2W25OqyVfu6XkodccMMz53RS7x1n+u79ItLjeWQz3BLPY3z6Rf+e9/rDdprQh0vtoEe8aC4ytVGsYeocCNPS+hew7UhOq8WfZ8M3hd4eODod44BhhAQGQYBMpzfOeiQ2hzLZGBgOzV+FNb169FKzjbd/niJRkUd6uRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fcv0pqtn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fcv0pqtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779486575; x=1811022575;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xAozgNFZdeXIHfW9HPw4+o6qUqnAI8QPJeu5dldQ2ws=;
  b=Fcv0pqtnvhOOUQLnG6dDg+k6k8oc0Sjmp6qhIyNlZXftwK03ytaZmbMC
   8OdwnMQwxJNcxU0rmXRYuWOPKXFrQt2l8olTbFpiNiQgV0OlXqTaSQWeA
   Qf1n7nEwnzG5jtg72yK6HNlbSDm9omURkv1wxKVMzJTsBLfHjiFC+Bofm
   ftX2X8sgq6h0Hrkqs3v00glYA+6QofcJfcLYOQfo0VxJHq6F2PeIjdB2V
   cvljahJcaKzSc9vMubixZgEw58fP8gl0YMn85D/IpaekGoSHfWvm9/bDG
   qQipdcU7T2dUSfPp5lLicN1fmIKjiZ1ukVTeCWLneSYYyRz03KwGP/WfZ
   A==;
X-CSE-ConnectionGUID: 8YJNXnVrSjiqBzFAAmhp8Q==
X-CSE-MsgGUID: utInKVdMTBS96WgqV8itVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="67945444"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="67945444"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 14:49:34 -0700
X-CSE-ConnectionGUID: ROqDinW+QzOoBfx0jEMofw==
X-CSE-MsgGUID: 9Nm1FRlXSB+aU7oPcXAwXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; 
   d="scan'208";a="236806681"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 May 2026 14:49:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQXkI-00000000BPn-09MK;
	Fri, 22 May 2026 21:49:30 +0000
Date: Fri, 22 May 2026 23:48:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/turris1x.dtb: power@e0070
 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605222310.dU5xCwll-lkp@intel.com>
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
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6779b50faa562e6cca1aa6a4649a4d764c6c7e28
commit: ba127016c07b17d10cb33803fb0a0aaf24a8b53c dt-bindings: powerpc: Conv=
ert fsl/pmc.txt to YAML
date:   1 year, 1 month ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year, 1 month ago
config: powerpc-randconfig-2051-20260521 (https://download.01.org/0day-ci/a=
rchive/20260522/202605222310.dU5xCwll-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43=
d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260522/202605222310.dU5xCwll-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: ba127016c07b ("dt-bindings: powerpc: Convert fsl/pmc.txt to YAML")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605222310.dU5xCwll-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/turris1x.dtb: crypto@30000 (fsl,sec3.1): interrupt=
s: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/pic@40000: failed to m=
atch any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@41100: failed to=
 match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/message@41400: failed =
to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/msi@41600: failed to m=
atch any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/timer@42100: failed to=
 match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/global-utilities@e0000=
: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/turris1x.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-=
clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinc=
trl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match =
any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000: failed to match =
any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0 (cfi-flash): $nodename:0: 'n=
or@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0 (cfi-flash): Unevaluated pro=
perties are not allowed ('partitions' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed =
to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-n=
and']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed =
to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-n=
and']
   arch/powerpc/boot/dts/turris1x.dtb: cpld@3,0 (cznic,turris1x-cpld): $nod=
ename:0: 'cpld@3,0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|so=
c|axi|ahb|apb)(@.+)?$'
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: sdhc@2e000 (fsl,p2020-esdhc): $n=
odename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: crypto@30000 (fsl,sec3.1): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells', =
'bus-range', 'device_type', 'law_trgt_if', 'pcie@0', 'ranges' were unexpect=
ed)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: pcie@fef08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: sdhc@2e000 (fsl,mpc8536-esdhc):=
 $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: crypto@30000 (fsl,sec3.0): inte=
rrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/pic@40000: failed=
 to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@41100: fail=
ed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/message@41400: fa=
iled to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/msi@41600: failed=
 to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/timer@42100: fail=
ed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/global-utilities@=
e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: power@e0070 (fsl,mpc8536-pmc): =
'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie=
): Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: sdhc@2e000 (fsl,mpc8536-esd=
hc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: crypto@30000 (fsl,sec3.0): =
interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/pic@40000: f=
ailed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@41100:=
 failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/message@4140=
0: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/msi@41600: f=
ailed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/timer@42100:=
 failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/global-utili=
ties@e0000: failed to match any schema with compatible: ['fsl,mpc8536-guts']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: power@e0070 (fsl,mpc8536-pm=
c): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548=
-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-ce=
lls', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: dma@21300 (fsl,eloplus-dma): dm=
a-channel@180:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fs=
l,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel=
', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/pic@40000: fa=
iled to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/timer@41100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/message@41400=
: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/msi@41600: fa=
iled to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: /soc8544@e0000000/global-utilit=
ies@e0000: failed to match any schema with compatible: ['fsl,mpc8544-guts']
>> arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: power@e0070 (fsl,mpc8548-pmc): =
'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie=
): Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8544ds.dtb: pcie@e0009000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [25, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: ptp_clock@24e00 (fsl,etsec-ptp)=
: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, 0]] =
is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: crypto@30000 (fsl,sec3.0): inte=
rrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/pic@40000: fa=
iled to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@41100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/message@41400=
: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/msi@41600: fa=
iled to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/timer@42100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: /soc8572@ffe00000/global-utilit=
ies@e0000: failed to match any schema with compatible: ['fsl,mpc8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: power@e0070 (fsl,mpc8548-pmc): =
'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie=
): Unevaluated properties are not allowed ('#address-cells', '#size-cells',=
 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie=
): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: ptp_clock@24e00 (fsl,etsec-=
ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71, 2, 0, =
0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: crypto@30000 (fsl,sec3.0): =
interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/pic@4000=
0: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@41=
100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/message@=
41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/msi@4160=
0: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/timer@42=
100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: /soc8572@fffe00000/global-u=
tilities@e0000: failed to match any schema with compatible: ['fsl,mpc8572-g=
uts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: power@e0070 (fsl,mpc8548-pm=
c): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexe=
s: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548=
-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-ce=
lls', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_36b.dtb: pcie@fffe08000 (fsl,mpc8548=
-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: ptp_clock@24e00 (fsl=
,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71,=
 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: crypto@30000 (fsl,se=
c3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/pi=
c@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ti=
mer@41100: failed to match any schema with compatible: ['fsl,mpic-global-ti=
mer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/me=
ssage@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-ms=
gr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ms=
i@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/ti=
mer@42100: failed to match any schema with compatible: ['fsl,mpic-global-ti=
mer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: /soc8572@ffe00000/gl=
obal-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc=
8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: power@e0070 (fsl,mpc=
8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): Unevaluated properties are not allowed ('#address-cells', '#s=
ize-cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core0.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: ptp_clock@24e00 (fsl=
,etsec-ptp): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0], [70, 2, 0, 0], [71,=
 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: crypto@30000 (fsl,se=
c3.0): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/pi=
c@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ti=
mer@41100: failed to match any schema with compatible: ['fsl,mpic-global-ti=
mer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/me=
ssage@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-ms=
gr']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ms=
i@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/ti=
mer@42100: failed to match any schema with compatible: ['fsl,mpic-global-ti=
mer']
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /soc8572@ffe00000/gl=
obal-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc=
8572-guts']
>> arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: power@e0070 (fsl,mpc=
8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the=
 regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: pcie@ffe08000 (fsl,m=
pc8548-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/mpc8572ds_camp_core1.dtb: /pcie@ffe08000/pcie@=
0/uli1575@0/isa@1e/interrupt-controller@20: failed to match any schema with=
 compatible: ['chrp,iic']
--
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: sdhc@2e000 (fsl,p2020-esdhc): Un=
evaluated properties are not allowed ('non-removable' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: crypto@30000 (fsl,sec3.1): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to ma=
tch any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /localbus@ffe05000: failed to ma=
tch any schema with compatible: ['fsl,p2020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@1,0 (ns16550): Unevaluate=
d properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@2,0 (ns16550): Unevaluate=
d properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@3,0 (ns16550): Unevaluate=
d properties are not allowed ('device_type' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: serial@4,0 (ns16550): Unevaluate=
d properties are not allowed ('device_type' was unexpected)
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr=
@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr=
@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr=
@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/crypto@30000/jr=
@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/pic@40000: fail=
ed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@41100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/message@41400: =
failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/msi@41600: fail=
ed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/timer@42100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/global-utilitie=
s@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: power@e0070 (fsl,mpc8548-pmc)=
: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe09000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe09000 (fsl,p1010-pcie=
): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe09000 (fsl,p1010-pcie=
): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe0a000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /pcie@ffe0a000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: pcie@ffe0a000 (fsl,p1010-pcie=
): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe09000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe09000 (fsl,p1010=
-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe09000 (fsl,p1010=
-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe0a000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /pcie@fffe0a000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: pcie@fffe0a000 (fsl,p1010=
-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr=
@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr=
@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr=
@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/crypto@30000/jr=
@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-ring'=
, 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/pic@40000: fail=
ed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@41100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/message@41400: =
failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/msi@41600: fail=
ed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/timer@42100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/global-utilitie=
s@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: power@e0070 (fsl,mpc8548-pmc)=
: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe09000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe09000 (fsl,p1010-pcie=
): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe09000 (fsl,p1010-pcie=
): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe0a000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /pcie@ffe0a000: failed to mat=
ch any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: pcie@ffe0a000 (fsl,p1010-pcie=
): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@1000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@2000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@3000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/crypto@300=
00/jr@4000: failed to match any schema with compatible: ['fsl,sec-v4.4-job-=
ring', 'fsl,sec-v4.0-job-ring']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1010-guts']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe09000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe09000 (fsl,p1010=
-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe09000 (fsl,p1010=
-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe0a000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /pcie@fffe0a000: failed t=
o match any schema with compatible: ['fsl,p1010-pcie', 'fsl,qoriq-pcie-v2.3=
']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: pcie@fffe0a000 (fsl,p1010=
-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/sdhc@2e000:=
 failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc=
']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/pic@40000: =
failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@41100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/message@414=
00: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/msi@41600: =
failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/timer@42100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/global-util=
ities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-c=
ells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/sdhc@2e000=
: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdh=
c']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-=
cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000:=
 failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc=
']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: =
failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/message@414=
00: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: =
failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/global-util=
ities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-c=
ells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000=
: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdh=
c']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-=
cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc=
@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fs=
l,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: crypto@30000 (fsl,=
sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/pic@=
40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/time=
r@41100: failed to match any schema with compatible: ['fsl,mpic-global-time=
r']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/mess=
age@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr=
']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/msi@=
41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/time=
r@42100: failed to match any schema with compatible: ['fsl,mpic-global-time=
r']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/glob=
al-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020=
-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: power@e0070 (fsl,m=
pc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): Unevaluated properties are not allowed ('#address-cells', '=
#size-cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc=
@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fs=
l,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: crypto@30000 (fsl,=
sec3.3): interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/pic@=
40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/time=
r@41100: failed to match any schema with compatible: ['fsl,mpic-global-time=
r']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/mess=
age@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr=
']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/msi@=
41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/time=
r@42100: failed to match any schema with compatible: ['fsl,mpic-global-time=
r']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/glob=
al-utilities@e0000: failed to match any schema with compatible: ['fsl,p1020=
-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: power@e0070 (fsl,m=
pc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of t=
he regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe09000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: pcie@ffe0a000 (fsl=
,mpc8548-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: fai=
led to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: crypto@30000 (fsl,sec3.3): in=
terrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/pic@40000: fail=
ed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@41100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/message@41400: =
failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/msi@41600: fail=
ed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/timer@42100: fa=
iled to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/global-utilitie=
s@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: power@e0070 (fsl,mpc8548-pmc)=
: 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes:=
 '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/sdhc@2e000: failed=
 to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: crypto@30000 (fsl,sec3.3): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells', =
'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: f=
ailed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: crypto@30000 (fsl,sec3.3): i=
nterrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/pic@40000: fa=
iled to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@41100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/message@41400=
: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/msi@41600: fa=
iled to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/timer@42100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/global-utilit=
ies@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc=
): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cel=
ls', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/sdhc@2e000:=
 failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc=
']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/pic@40000: =
failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@41100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/message@414=
00: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/msi@41600: =
failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/timer@42100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/global-util=
ities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-c=
ells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/sdhc@2e000=
: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdh=
c']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-=
cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: sdhc@2e000 (fsl,esdhc): compatib=
le: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: crypto@30000 (fsl,sec3.3): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells', =
'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: sdhc@2e000 (fsl,esdhc): c=
ompatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: =
failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@41100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/message@414=
00: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: =
failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/timer@42100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/global-util=
ities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-c=
ells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: sdhc@2e000 (fsl,esdhc): c=
ompatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.3)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): Unevaluated properties are not allowed ('#address-cells', '#size-=
cells', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b5000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/global-utilitie=
s@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: power@e0070 (fsl,p1022-pmc): =
'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): Unevaluated properties are not allowed ('#address-cells', '#size-cells=
', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000 (fsl,mpc8548-pc=
ie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b000=
0', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b1000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
queue-group@b5000: '#address-cells', '#size-cells' do not match any of the =
regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000 (fsl,etsec2): =
Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b100=
0', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/global-utiliti=
es@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: power@e0070 (fsl,p1022-pmc): =
'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '=
^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ptp_clock@b0e00 (fsl,etsec-pt=
p): interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-p=
cie): Unevaluated properties are not allowed ('#address-cells', '#size-cell=
s', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/sdhc@2e000: failed=
 to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: crypto@30000 (fsl,sec3.3): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p1022-guts']
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: power@e0070 (fsl,p1022-pmc): 'so=
c-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pi=
nctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells', =
'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/sdhc@2e000: fa=
iled to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: crypto@30000 (fsl,sec3.3): i=
nterrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/pic@40000: fai=
led to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@41100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/message@41400:=
 failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/msi@41600: fai=
led to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/timer@42100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/global-utiliti=
es@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: power@e0070 (fsl,mpc8548-pmc=
): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): Unevaluated properties are not allowed ('#address-cells', '#size-cell=
s', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/sdhc@2e000: f=
ailed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: crypto@30000 (fsl,sec3.3): i=
nterrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/pic@40000: fa=
iled to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@41100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/message@41400=
: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/msi@41600: fa=
iled to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/timer@42100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/global-utilit=
ies@e0000: failed to match any schema with compatible: ['fsl,p1020-guts']
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc=
): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cel=
ls', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: sdhc@2e000 (fsl,esdhc): comp=
atible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: crypto@30000 (fsl,sec3.3): i=
nterrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/pic@40000: fai=
led to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@41100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/message@41400:=
 failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/msi@41600: fai=
led to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/timer@42100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/global-utiliti=
es@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: power@e0070 (fsl,mpc8548-pmc=
): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): Unevaluated properties are not allowed ('#address-cells', '#size-cell=
s', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: pcie@ffe09000 (fsl,mpc8548-p=
cie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: sdhc@2e000 (fsl,esdhc): comp=
atible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: crypto@30000 (fsl,sec3.3): i=
nterrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/pic@40000: fa=
iled to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@41100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/message@41400=
: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/msi@41600: fa=
iled to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/timer@42100: =
failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/global-utilit=
ies@e0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: power@e0070 (fsl,mpc8548-pmc=
): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): Unevaluated properties are not allowed ('#address-cells', '#size-cel=
ls', 'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: pcie@fffe09000 (fsl,mpc8548-=
pcie): pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: sdhc@2e000 (fsl,esdhc): compatib=
le: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: crypto@30000 (fsl,sec3.3): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p1021-guts']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: Unevaluated properties are not allowed ('#address-cells', '#size-cells', =
'bus-range', 'device_type', 'pcie@0', 'ranges' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: sdhc@2e000 (fsl,p2020-esdhc): $no=
dename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: crypto@30000 (fsl,sec3.1): interr=
upts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/pic@40000: failed t=
o match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@41100: failed=
 to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/message@41400: fail=
ed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/msi@41600: failed t=
o match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/timer@42100: failed=
 to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/global-utilities@e0=
000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: power@e0070 (fsl,mpc8548-pmc): 's=
oc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie):=
 pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie):=
 pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie):=
 Unevaluated properties are not allowed ('#address-cells', '#size-cells', '=
bus-range', 'device_type', 'law_trgt_if', 'pcie@0', 'ranges' were unexpecte=
d)
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie):=
 pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: pcie@ffe08000 (fsl,mpc8548-pcie):=
 pcie@0:interrupts:0: [24, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: sdhc@2e000 (fsl,p2020-esd=
hc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: crypto@30000 (fsl,sec3.1)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/pic@40000: =
failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@41100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/message@414=
00: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/msi@41600: =
failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/timer@42100=
: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/global-util=
ities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe08000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: pcie@ffe09000 (fsl,mpc854=
8-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: sdhc@2e000 (fsl,p2020-esd=
hc): $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: crypto@30000 (fsl,sec3.1)=
: interrupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/pic@40000:=
 failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@4110=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/message@41=
400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/msi@41600:=
 failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/timer@4210=
0: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/global-uti=
lities@e0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: power@e0070 (fsl,mpc8548-=
pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the rege=
xes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe08000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: pcie@fffe09000 (fsl,mpc85=
48-pcie): pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: sdhc@2e000 (fsl,p2020-esdhc): $n=
odename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: crypto@30000 (fsl,sec3.1): inter=
rupts: [[45, 2, 0, 0], [58, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec2.0.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/pic@40000: failed =
to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@41100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/message@41400: fai=
led to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/msi@41600: failed =
to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/timer@42100: faile=
d to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/global-utilities@e=
0000: failed to match any schema with compatible: ['fsl,p2020-guts']
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: power@e0070 (fsl,mpc8548-pmc): '=
soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^=
pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe08000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: pcie@ffe09000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
--
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/pic@40000: fai=
led to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/timer@41100: f=
ailed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/message@41400:=
 failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/msi@41600: fai=
led to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000: fai=
led to match any schema with compatible: ['fsl,srio-rmu']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/mess=
age-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit=
']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/mess=
age-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-un=
it']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/door=
bell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell=
-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port=
-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-por=
t-write-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/global-utiliti=
es@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: power@e0070 (fsl,mpc8548-pmc): 's=
oc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^p=
inctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie)=
: pcie@0:interrupts:0: [26, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /rapidio@fe00c0000: failed to mat=
ch any schema with compatible: ['fsl,srio']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
