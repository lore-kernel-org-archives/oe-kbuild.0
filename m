Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410C1E4BE
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755191012; cv=none; b=vDxEvgoXC3v4fmGzfYjvVU1oqH06Qan1FhgwLIeuZioumEb2dKj0jb4K8YAqozGS6wKKzGgBGgb/fyrMDt+Xry+svYD11Y+rRqBI0t0wXojaJT7UQkuONnG3r398PhqdWndjG09M6rA++0nYFTw8aq1kcaylx/LM+bsZDLWkEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755191012; c=relaxed/simple;
	bh=PBrxMOWjyktxiKREbLnSpxmGdsaAtmSC0nK68fBhzzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sRDpxGLBjx4F87L+wmMgL0QeZ/Vjuhh/+oQ2XNffjxM2IFrB45Ne2r07nCoBBmpfa71H42TkrXW2xPGdAMzHKSRGLrmMZWjT7ErG100NazOOy8RNzix+Vjeo4h8NxoZrSd33t/XAqm7esCPAT/lSj1Uv/tZXBvexd37jVjkl5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9MfyRhN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9MfyRhN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755191011; x=1786727011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PBrxMOWjyktxiKREbLnSpxmGdsaAtmSC0nK68fBhzzs=;
  b=Q9MfyRhN04aV6a49uSOWxksWxsSmd0C+Y2Er7V9sObDkqBYCyF/T11gv
   73+Oc4h/djEo/chfrxMk1D+VN6IXYlOmKkOVUK6b2nMu4JoK6g8PKdyDh
   +Ocet/uIrEqd+HFNiLaOMhQJCEPqVgOCvAN64ScKUljV7XKPnr+KFYu8R
   HXjMmolXkJnyueoPrjOnJbNHAb87aKTeiIpGNLsRaHMO7Bwgm0+jAHbYH
   TZJyuO9OEq5PW0HyqVUfvqNeWlG6gA1UwK7E0Mhzk1WUpNxd5dKstBEzI
   Ib2gsNCnssoLFd85OpD1WVxyYiCL877OcCr4LPDEljGX3Ju15UHUe51Wk
   w==;
X-CSE-ConnectionGUID: Zx+vijIiS1CXGk0HbBNsfw==
X-CSE-MsgGUID: X7wTCWrzQv2iDNiZlzejbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57660861"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57660861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:03:27 -0700
X-CSE-ConnectionGUID: T7FCEeI1SGGrd3NUZr54+g==
X-CSE-MsgGUID: 4V5JVBSFRTamyuRxLJqySQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172036554"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 14 Aug 2025 10:03:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbMC-000BBG-2R;
	Thu, 14 Aug 2025 17:03:16 +0000
Date: Fri, 15 Aug 2025 01:02:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 526/801] arch/powerpc/boot/dts/fsl/p2041rdb.dtb:
 rapidio@ffe0c0000 (fsl,srio): 'fsl,iommu-parent' does not match any of the
 regexes: '^pinctrl-[0-9]+$', '^port[0-9]+$'
Message-ID: <202508150054.lo6uZ94a-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: efb892d843fff0680cb1cd6e7886c45432758796 [526/801] dt-bindings: powerpc: Convert fsl/fsl,srio to DT schema
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250815/202508150054.lo6uZ94a-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150054.lo6uZ94a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508150054.lo6uZ94a-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: rapidio@ffe0c0000 (fsl,srio): 'fsl,iommu-parent' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: rapidio@ffe0c0000 (fsl,srio): port1: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: rapidio@ffe0c0000 (fsl,srio): port2: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: localbus@ffe124000 (fsl,p2041-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: localbus@ffe124000 (fsl,p2041-elbc): nand@1,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p2041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /localbus@ffe124000/nand@1,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /pcie@ffe200000: failed to match any schema with compatible: ['fsl,p2041-pcie', 'fsl,qoriq-pcie-v2.2']
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: rapidio@ffe0c0000 (fsl,srio): 'fsl,iommu-parent' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: rapidio@ffe0c0000 (fsl,srio): port1: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: rapidio@ffe0c0000 (fsl,srio): port2: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000 (fsl,p3041-elbc): board-control@3,0:ranges: [[0, 3, 0, 48]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000 (fsl,p3041-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: localbus@ffe124000 (fsl,p3041-elbc): nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p3041-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
--
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-queue']
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring', 'fsl,raideng-v1.0-lp-ring']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): $nodename: 'anyOf' conditional failed, one must be fixed:
   	['raideng@320000'] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): ranges: [[0, 3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): reg: [[3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: rapidio@ffe0c0000 (fsl,srio): 'fsl,iommu-parent' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: rapidio@ffe0c0000 (fsl,srio): port1: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: rapidio@ffe0c0000 (fsl,srio): port2: 'fsl,liodn-reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): board-control@3,0:ranges: [[0, 3, 0, 48]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
