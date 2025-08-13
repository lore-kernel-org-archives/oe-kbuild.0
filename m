Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97612EA743
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755122992; cv=none; b=PrbCYzWUJ7OjVL1nfrYdRGvD305GOIHqwaT4j2JYIuyPpgnhXmM6HJeXhpfj/edf5dfKJEMgbZrNA73kG/4BaZpMZ9BiD8YZW/yFvI9X8t/Sw1IbEQLd/AqZc2MlELqMDoFcowC+p9+RsJiCaq+SMO+v/aEPBXWZpArM+ADWuJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755122992; c=relaxed/simple;
	bh=2NEQE5odRht6l+k1t7EgcvV45iIaqHN0nSItCmxFcVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QjJgI0VH+M7wYPEzwklv/K5AU53fsMZEqlziZWueZzELUdauWcChfgv+dqb2WfRH5VGkjXbOkg31gBQXCUrwcJpe01qEHiVWk6CWtZ8LFCvXya6zqARkIOsSj9FUqxua3GzwMDWK+RbSIzVBnrtzsSfv8XaPWAyexEtaroFdmcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3ln4lH5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3ln4lH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755122990; x=1786658990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NEQE5odRht6l+k1t7EgcvV45iIaqHN0nSItCmxFcVE=;
  b=H3ln4lH5Cjq3i4Y454PvmTmjVWtKAMaFRFIBe2YbctO5KK41QXOv8zxg
   EI22fsofevmjVoyXqO0IMfsnulpWXVsD+nuvWCU/qDFbfmlrkve6E17IK
   bcKKy1cT5Eu8c06EP1lMyc03v87WMB78mSestOwZieK72CTFG4tnqk3y1
   uE9Q7Pn6KU42ywgmGd7mSlpSVkx5HPTi6tJ6QQtn4p2xJxglkkaWekzNX
   A5h9yr1vfbe5XN+4SMNf1rLtxZk+s3T6Ij1yhNAUxZcPZqac440edgQBR
   RyGghWQO7BGBHef5d4ro+a/eG9fRIkYi0/4kWgdwDRh7p3HDMUougN24u
   A==;
X-CSE-ConnectionGUID: q7J6cAvHQsy8voZ7+66Aqw==
X-CSE-MsgGUID: jRLAjF4bQuqJmPLFouoiyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57150189"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57150189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 15:09:48 -0700
X-CSE-ConnectionGUID: oaxY+51CSoK+jw7CBlizBQ==
X-CSE-MsgGUID: yZMU/7pjRG2ZVVeWYWASkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="171926675"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2025 15:09:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umJfE-000AMW-1X;
	Wed, 13 Aug 2025 22:09:44 +0000
Date: Thu, 14 Aug 2025 06:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 523/801] arch/powerpc/boot/dts/fsl/p5020ds.dtb:
 raideng@320000 (fsl,raideng-v1.0): compatible: 'anyOf' conditional failed,
 one must be fixed:
Message-ID: <202508140629.RtJIESvP-lkp@intel.com>
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
commit: 9a8caa74a295cde63c203c21fe01023f55e19ffe [523/801] dt-bindings: powerpc: Convert fsl/fsl,raideng-v1.0 to DT schema
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250814/202508140629.RtJIESvP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140629.RtJIESvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508140629.RtJIESvP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: sec_mon@314000 (fsl,sec-v4.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v4.2-mon', 'fsl,sec-v4.0-mon']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): compatible: 'anyOf' conditional failed, one must be fixed:
   	['fsl,raideng-v1.0'] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): #address-cells: 'anyOf' conditional failed, one must be fixed:
   	1 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): #size-cells: 'anyOf' conditional failed, one must be fixed:
   	1 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): reg: 'anyOf' conditional failed, one must be fixed:
   	[[3276800, 65536]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): ranges: 'anyOf' conditional failed, one must be fixed:
   	[[0, 3276800, 65536]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): fsl,iommu-parent: 'anyOf' conditional failed, one must be fixed:
   	[[36]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): raideng_jq0@1000: 'anyOf' conditional failed, one must be fixed:
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400' were unexpected)
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400', 'ranges' were unexpected)
   	'interrupts' is a required property
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-queue']
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring', 'fsl,raideng-v1.0-lp-ring']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): raideng_jq1@2000: 'anyOf' conditional failed, one must be fixed:
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400' were unexpected)
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400', 'ranges' were unexpected)
   	'interrupts' is a required property
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-queue']
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring', 'fsl,raideng-v1.0-lp-ring']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): $nodename: 'anyOf' conditional failed, one must be fixed:
   	['raideng@320000'] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): ranges: [[0, 3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: raideng@320000 (fsl,raideng-v1.0): reg: [[3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /rapidio@ffe0c0000: failed to match any schema with compatible: ['fsl,srio']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): board-control@3,0:ranges: [[0, 3, 0, 48]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: localbus@ffe124000 (fsl,p5020-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5020-elbc', 'fsl,elbc', 'simple-bus']
--
   	['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon'] is too long
   	'fsl,sec-v4.0-mon' was expected
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v5.2-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: sec_mon@314000 (fsl,sec-v5.2-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sec_mon@314000: failed to match any schema with compatible: ['fsl,sec-v5.2-mon', 'fsl,sec-v5.0-mon', 'fsl,sec-v4.0-mon']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): compatible: 'anyOf' conditional failed, one must be fixed:
   	['fsl,raideng-v1.0'] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): #address-cells: 'anyOf' conditional failed, one must be fixed:
   	1 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): #size-cells: 'anyOf' conditional failed, one must be fixed:
   	1 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): reg: 'anyOf' conditional failed, one must be fixed:
   	[[3276800, 65536]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): ranges: 'anyOf' conditional failed, one must be fixed:
   	[[0, 3276800, 65536]] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): raideng_jq0@1000: 'anyOf' conditional failed, one must be fixed:
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400' were unexpected)
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400', 'ranges' were unexpected)
   	'interrupts' is a required property
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-queue']
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring', 'fsl,raideng-v1.0-lp-ring']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): raideng_jq1@2000: 'anyOf' conditional failed, one must be fixed:
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400' were unexpected)
   	Additional properties are not allowed ('#address-cells', '#size-cells', 'jr@0', 'jr@400', 'ranges' were unexpected)
   	'interrupts' is a required property
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-queue']
   	['fsl,raideng-v1.0-job-queue'] is not one of ['fsl,raideng-v1.0-job-ring', 'fsl,raideng-v1.0-hp-ring', 'fsl,raideng-v1.0-lp-ring']
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): $nodename: 'anyOf' conditional failed, one must be fixed:
   	['raideng@320000'] is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): ranges: [[0, 3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: raideng@320000 (fsl,raideng-v1.0): reg: [[3276800, 65536]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,raideng-v1.0.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000 (fsl,p5040-elbc): nand@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000 (fsl,p5040-elbc): board-control@3,0:ranges: [[0, 3, 0, 64]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: localbus@ffe124000 (fsl,p5040-elbc): flash@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000: failed to match any schema with compatible: ['fsl,p5040-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /localbus@ffe124000/nand@2,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
