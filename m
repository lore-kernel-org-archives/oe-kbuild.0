Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B3B42B75A
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010749; cv=none; b=Qk5krd2aKTdmwLoD2eHRNH4aAk9cejrnAsFZaunlTO/3t5UL/cnEgr9ZIOp50WAFUHRflxOhkG2VG8BTNGntVQI5wpgUbjavMDRSNXqCUP/j0SM+9XXtnyEEp+K+GiTG/0ftKSjbr7InA1fybotgiGjdYDN3XFt7iPQ8pJvKL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010749; c=relaxed/simple;
	bh=hhEWWZMP1i3IpVN72McWAUOjheBSIowfdCYDH8OX+70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HPfVJck4tgRRCv3StUrBL31z9NoKqtaRM0aM33zhSi6pu3KCAxnITmI8SlGIBg++nY1Ipco9e5gu9zd0K778i7BFnNNpL6knnHkYi3SSfoabB7RJdRJYSEoHiU+CviHUTRZdlWDe8gnuRBoP4mk1MHbG8Q14PIyeVoSx/pymudI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq7aPfRF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq7aPfRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786010748; x=1817546748;
  h=date:from:to:cc:subject:message-id;
  bh=hhEWWZMP1i3IpVN72McWAUOjheBSIowfdCYDH8OX+70=;
  b=Oq7aPfRFwTMnRO3UOmhWJUDcdaDUX63pKPUqVWUeZ0bhv2T6i3o+MbwH
   quiyNqdPlq6OCe2vkCGDb07HpwuWW5PDfKYVIL4/n5O42lF17I6M5oLwF
   FHBA0vPBG4+RXddA8iuUmcqIl196TS5FmzJDtUoyUeunn7KKVW2JjyxbJ
   4/U4juTHEbRLQa8QPQH02DmKOoem47HS7OmoEvJGbULuLSB8pR2GYZsoR
   odTnX4TdR45VofhUFoJo42hKrcQ3myaVz20ksiahEdwiAXoS7l8N7uZ4X
   pgTYrvXUgvRmGIAnWLc0l5CgSQGpWb4jIDEJx3eygcOr8U0JAAkCaw5x6
   g==;
X-CSE-ConnectionGUID: zhUZ1HTmTjeoi4orTCqEaQ==
X-CSE-MsgGUID: +HDvr3pYT4KsYAojJgbMJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="74135079"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74135079"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:05:45 -0700
X-CSE-ConnectionGUID: I7OtghJvTRmthUA+8DpaqA==
X-CSE-MsgGUID: NzYG2ssMTCOBZncNpWyDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285440425"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Aug 2026 03:05:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wruyr-000000004c4-1Fle;
	Thu, 06 Aug 2026 10:05:41 +0000
Date: Thu, 06 Aug 2026 12:04:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/p3041ds.dtb: board-control@3,0
 (fsl,p3041ds-fpga): 'mdio-mux-emi1' does not match any of the regexes:
 '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
Message-ID: <202608061207.HdDZaadS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ioana Ciornei <ioana.ciornei@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 2346a408b4f2b8f9ea3778deb40a91c774e463b6 dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: powerpc-randconfig-2051-20260805 (https://download.01.org/0day-ci/archive/20260806/202608061207.HdDZaadS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project ade128740327db281859708ddcb3b072903b3414)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061207.HdDZaadS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2346a408b4f2 ("dt-bindings: fsl,fpga-qixis: describe the gpio child node found on LS1046AQDS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608061207.HdDZaadS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,sec-v4.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: board-control@3,0 (fsl,p3041ds-fpga): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: board-control@3,0 (fsl,p3041ds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p3041ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p3041ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p3041ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq0@1000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-queue']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@0: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@0: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: board-control@3,0 (fsl,p5020ds-fpga): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: board-control@3,0 (fsl,p5020ds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p5020ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p5020ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p5020ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq0@1000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq0@1000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-queue']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@0: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@0: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/raideng@320000/raideng_jq1@2000/jr@400: failed to match any schema with compatible: ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-lp-ring']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: board-control@3,0 (fsl,p5040ds-fpga): 'mdio-mux-emi1', 'mdio-mux-emi2' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: board-control@3,0 (fsl,p5040ds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis'] is too short
   	['fsl,p5040ds-fpga', 'fsl,fpga-ngpixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,p5040ds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-qixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
--
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-npc: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   		'fsl,fpga-qixis' is not one of ['amd,s29gl01gp', 'amd,s29gl032a', 'amd,s29gl256n', 'amd,s29gl512n', 'arm,versatile-flash', 'arm,vexpress-flash', 'cortina,gemini-flash', 'cypress,hyperflash', 'ge,imp3a-firmware-mirror', 'ge,imp3a-paged-flash', 'gef,ppc9a-firmware-mirror', 'gef,ppc9a-paged-flash', 'gef,sbc310-firmware-mirror', 'gef,sbc310-paged-flash', 'gef,sbc610-firmware-mirror', 'gef,sbc610-paged-flash', 'intel,28f128j3', 'intel,dt28f160', 'intel,ixp4xx-flash', 'intel,JS28F128', 'intel,JS28F640', 'intel,PC28F640P30T85', 'numonyx,js28f00a', 'numonyx,js28f128', 'sst,sst39vf320', 'xlnx,xps-mch-emc-2.00.a']
   		'fsl,fpga-qixis' is not one of ['cypress,cy7c1019dv33-10zsxi', 'arm,vexpress-psram']
   		'fsl,fpga-qixis' is not one of ['cfi-flash', 'jedec-flash', 'mtd-ram', 'mtd-rom']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: board-control@3,0 (fsl,fpga-qixis): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,fpga-qixis'] is too short
   	'fsl,p1022ds-fpga' was expected
   	'fsl,fpga-qixis' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,fpga-qixis' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: dcsr@f00000000 (fsl,dcsr): dcsr-corenet: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   		'mtd-ram' was expected
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): board-control@3,0: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'mdio-mux-emi1', 'ranges', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): nand@2,0: 'partition@C00000' does not match any of the regexes: '^partition@[0-9a-f]+', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: localbus@ffe124000 (fsl,ifc): $nodename:0: 'localbus@ffe124000' does not match '^memory-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,ifc.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0 (fsl,t4240qds-fpga): 'mdio-mux-emi1' does not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: board-control@3,0 (fsl,t4240qds-fpga): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too short
   	['fsl,t4240qds-fpga', 'fsl,fpga-qixis'] is too long
   	'fsl,p1022ds-fpga' was expected
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1088aqds-fpga', 'fsl,ls1088ardb-fpga', 'fsl,ls2080aqds-fpga', 'fsl,ls2080ardb-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043aqds-fpga', 'fsl,ls1043ardb-fpga', 'fsl,ls1046aqds-fpga', 'fsl,ls1046ardb-fpga', 'fsl,ls208xaqds-fpga']
   	'fsl,t4240qds-fpga' is not one of ['fsl,ls1043ardb-cpld', 'fsl,ls1046ardb-cpld', 'fsl,t1040rdb-cpld', 'fsl,t1042rdb-cpld', 'fsl,t1042rdb_pi-cpld']
   	'fsl,fpga-ngpixis' was expected
   	from schema $id: http://devicetree.org/schemas/board/fsl,fpga-qixis.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
