Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B0C2FB
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754706176; cv=none; b=G3wZY+XxCCp27E8lwrYqK6eEJSsAcaT5HRDrZAwKvcROKwXDuwq7fN5WPBDS+OQ4pXOafCOLVYHTbPDTLsl+cxRtcQRw4tNKVA8rGxDDPqWwC9CDkM1H8pskTEbxtn6id2NMbcbNpwUvEzlfKoRKwlP5gMrdP1XSx2FqUuG7IvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754706176; c=relaxed/simple;
	bh=FOvEINHov8F/w3km5xDB9uKfYXAiovJ+QHVtNcIg1X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZK3e2aAdVk3mLhoMA/bTnxg6mtY02nHnkHW/wthKhv9byKbjWhPdGcebrXugmxtcpeHDTzv+xnamDInRJDDcSdygWvF6ceyX8XZaiU2FP2Fq7p1iU1XjGA4bii929jzbBgv9RjRa1/OkM9NDC7HKRlbSfCYA0e4TVR5lQKI2Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkM2V5EC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkM2V5EC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754706173; x=1786242173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FOvEINHov8F/w3km5xDB9uKfYXAiovJ+QHVtNcIg1X8=;
  b=gkM2V5ECZwREjHY2NToOzGY/j+uWWpFPkHtU4xStCyqS57Bnmg8Ovaxm
   GC+Wvy06XCoFUytIn7nOKsm3K/sRv/msB+OoF9ybOc8j7CJIzklG5AYd3
   NMg7ZMHNARC57XmXEKI206P3x+HsKMSsnWVgMPVGrnCQI4TdrUuf0bA1z
   jGfacV+kgUFUzc2JFwN2Clf4dUHMz6USi2Pp0/G2XbgXQ4VfxefHGLbB7
   +RmYlw3TfKuqj54/QQThQh44OUhNOnh8D00MDPhSXKz++XIH5gPVcXRU9
   PqolEquapo0llPCoiFQSgPxicZM9N0Ygp6oM3qyBGkklEmM6jnoY6KPuY
   w==;
X-CSE-ConnectionGUID: YxBrYkALQ7mnGxkREYnM4A==
X-CSE-MsgGUID: uutUYF+0T+SIyJ1BB6SRKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="57117902"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57117902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 19:22:53 -0700
X-CSE-ConnectionGUID: tryU6W37TQmECAU5AiU1HQ==
X-CSE-MsgGUID: wQoq2lTJSFSbfiQub2EZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="189160567"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Aug 2025 19:22:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukZDx-0004Se-2B;
	Sat, 09 Aug 2025 02:22:36 +0000
Date: Sat, 9 Aug 2025 10:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 509/801] arch/powerpc/boot/dts/fsl/t1023rdb.dtb:
 corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required
 property
Message-ID: <202508091032.rYwzywcl-lkp@intel.com>
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
commit: 2eecb048cbea76ab3661acc18be6496fd710c3f1 [509/801] dt-bindings: powerpc: Convert fsl/fsl,corenet-cf to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250809/202508091032.rYwzywcl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091032.rYwzywcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508091032.rYwzywcl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: i2c@118000 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
--
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e5000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): compatible: ['fsl,fman-memac-mdio', 'fsl,fman-xmdio'] is too long
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: mdio@e7000 (fsl,fman-memac-mdio): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-mdio.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/soc-sram-error: failed to match any schema with compatible: ['fsl,soc-sram-error']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/corenet-law@0: failed to match any schema with compatible: ['fsl,corenet-law']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/l3-cache-controller@10000: failed to match any schema with compatible: ['fsl,t1023-l3-cache-controller', 'cache']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-csdids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: corenet-cf@18000 (fsl,corenet2-cf): 'fsl,ccf-num-snoopids' is a required property
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,corenet-cf.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/iommu@20000: failed to match any schema with compatible: ['fsl,pamu-v1.0', 'fsl,pamu']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
