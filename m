Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD221156237
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 04:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753589644; cv=none; b=XC53BKsXu5bQuwU5XJF4nUAynSwsvOSy9/2c+P7vdKKseOOKxd1KYhTpgXfM4ieY2ivTaCzs4grh7dpnJXSdSIGIdftLqspQSd1GFGBdHIPBg3Ml8yryOchI5VlAPua1MEIT2INfyO4wZJiX4TZ1qKglv1EAZ43Dfjf88416btc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753589644; c=relaxed/simple;
	bh=OM+uG20E8AVKy4ioTXwgWUNxCLO/sTLxjVQv7iwUbrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DY0y30JHhP4exDturCvn24WJfvHvYVnjqwnE6AURb/7EZhVdZCrHiH7hm/8mowro5xvycDB/XUifIdQ0cycriBKmdm05O6Gzb7+yQxVV6Vm904XvyBwPLvRmbaGGlcQSJEqd6la+Csw1Y7Q22o7X28hH5ORIFCDk9IAOtZljzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ih3w7nN7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ih3w7nN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753589639; x=1785125639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OM+uG20E8AVKy4ioTXwgWUNxCLO/sTLxjVQv7iwUbrc=;
  b=ih3w7nN7eNDooTfik05cp/16vump0X9yM83/UuJDUThZwB2JZuyj6IEY
   3T1GYvVAdz6bU4r+FP4Yv43mnS5qphJ5GQAQDyxXcS9oBFfYAYznbm4c+
   XgdSRlcNiKoY9TJcULh20mnbFTcA8BC7XoVXwI0qk+XYT8PE/euYMmqnV
   3yOmPGsNC+Z5vbFtsLn88a4kGfhbl4OcaBMua0472qWMujYLN40GeWcDW
   +IHizxEGlRk3Nsqhm8YmxCZDDIm3M66/Jx6uqAanwogKMfEGxphmh2/TF
   NERhqoTE914HGUGn5tmU8lhL9h2+cA7rLzg8pwPudBVE6ISj9XYhc2iHO
   A==;
X-CSE-ConnectionGUID: fvPjx9G9QUiQzBMjA+zXeg==
X-CSE-MsgGUID: zzSbwMwLSIGbYrpN9N5pKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="66572911"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="66572911"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 21:13:58 -0700
X-CSE-ConnectionGUID: y/s7feZbTdiomOWm7CDMGw==
X-CSE-MsgGUID: 3L43xzRXTY6FzRHVv8MlfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161238563"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jul 2025 21:13:57 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufsln-000MSR-0A;
	Sun, 27 Jul 2025 04:13:55 +0000
Date: Sun, 27 Jul 2025 12:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
Message-ID: <202507271128.uYFcKFXI-lkp@intel.com>
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
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
TO: Alexander Stein <alexander.stein@ew.tq-group.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Frank Li <Frank.Li@nxp.com>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/dt-bindings-fsl-fsl-rcpm-reference-power-domains-yaml/20250725-140232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250725055835.260930-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference power-domains.yaml
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250727/202507271128.uYFcKFXI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271128.uYFcKFXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507271128.uYFcKFXI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4420-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e1000 (fsl,b4420-clockgen): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4420-clockgen', 'fsl,b4-clockgen', 'fsl,qoriq-clockgen-2.0'] is too long
   	'fsl,b4420-clockgen' is not one of ['fsl,p2041-clockgen', 'fsl,p3041-clockgen', 'fsl,p4080-clockgen', 'fsl,p5020-clockgen', 'fsl,p5040-clockgen']
   	'fsl,b4420-clockgen' is not one of ['fsl,t1023-clockgen', 'fsl,t1024-clockgen', 'fsl,t1040-clockgen', 'fsl,t1042-clockgen', 'fsl,t2080-clockgen', 'fsl,t2081-clockgen', 'fsl,t4240-clockgen']
   	'fsl,b4420-clockgen' is not one of ['fsl,ls1012a-clockgen', 'fsl,ls1021a-clockgen', 'fsl,ls1028a-clockgen', 'fsl,ls1043a-clockgen', 'fsl,ls1046a-clockgen', 'fsl,ls1088a-clockgen', 'fsl,ls2080a-clockgen', 'fsl,lx2160a-clockgen']
   	'fsl,qoriq-clockgen-1.0' was expected
   	'fsl,qoriq-clockgen-2.0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fsl,qoriq-clock.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e2000 (fsl,b4420-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: global-utilities@e2000 (fsl,b4420-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: dma@100300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: dma@101300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,b4860-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: global-utilities@e1000 (fsl,b4860-clockgen): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,b4860-clockgen', 'fsl,b4-clockgen', 'fsl,qoriq-clockgen-2.0'] is too long
   	'fsl,b4860-clockgen' is not one of ['fsl,p2041-clockgen', 'fsl,p3041-clockgen', 'fsl,p4080-clockgen', 'fsl,p5020-clockgen', 'fsl,p5040-clockgen']
   	'fsl,b4860-clockgen' is not one of ['fsl,t1023-clockgen', 'fsl,t1024-clockgen', 'fsl,t1040-clockgen', 'fsl,t1042-clockgen', 'fsl,t2080-clockgen', 'fsl,t2081-clockgen', 'fsl,t4240-clockgen']
   	'fsl,b4860-clockgen' is not one of ['fsl,ls1012a-clockgen', 'fsl,ls1021a-clockgen', 'fsl,ls1028a-clockgen', 'fsl,ls1043a-clockgen', 'fsl,ls1046a-clockgen', 'fsl,ls1088a-clockgen', 'fsl,ls2080a-clockgen', 'fsl,lx2160a-clockgen']
   	'fsl,qoriq-clockgen-1.0' was expected
   	'fsl,qoriq-clockgen-2.0' was expected
   	from schema $id: http://devicetree.org/schemas/clock/fsl,qoriq-clock.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: global-utilities@e2000 (fsl,b4860-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: global-utilities@e2000 (fsl,b4860-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: dma@100300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: dma@101300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5020-serdes']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: serial@11c500 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: serial@11c600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: gpio@130000 (fsl,qoriq-gpio): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-gpio'] is too short
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p2041-serdes']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p4080-serdes']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p2041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p2041-serdes']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p3041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p3041-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p3041-serdes']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p4080-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p4080-serdes']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,qoriq-rcpm-1.0'] is too short
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,t1040-rcpm']
   	'fsl,qoriq-rcpm-1.0' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: global-utilities@e2000 (fsl,qoriq-rcpm-1.0): Unevaluated properties are not allowed ('#sleep-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5020-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5020-serdes']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p5040-device-config', 'fsl,qoriq-device-config-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/global-utilities@e0e00: failed to match any schema with compatible: ['fsl,p5040-pin-control', 'fsl,qoriq-pin-control-1.0']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000 (fsl,p5040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000 (fsl,p5040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: global-utilities@e2000 (fsl,p5040-rcpm): Unevaluated properties are not allowed ('#sleep-cells' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,p5040-sfp', 'fsl,qoriq-sfp-1.0']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,p5040-serdes']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: dma@100300 (fsl,eloplus-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: dma@100300 (fsl,eloplus-dma): dma-channel@0:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
--
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: global-utilities@e2000 (fsl,t1023-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
--
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1023-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t1023-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t1023-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.0' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: global-utilities@e2000 (fsl,t1023-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t1023-rcpm', 'fsl,qoriq-rcpm-2.1']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1023-serdes']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1023-scfg']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): compatible:0: 'fsl,t1023-esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1021a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: sdhc@114000 (fsl,t1023-esdhc): Unevaluated properties are not allowed ('compatible', 'fsl,iommu-parent', 'fsl,liodn-reg', 'no-1-8-v' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t1040-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: global-utilities@e2000 (fsl,t1040-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: global-utilities@e2000 (fsl,t1040-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t1040-sfp']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t1040-serdes']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/global-utilities@fc000: failed to match any schema with compatible: ['fsl,t1040-scfg']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sdhc@114000 (fsl,t1040-esdhc): $nodename:0: 'sdhc@114000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: sdhc@114000 (fsl,t1040-esdhc): Unevaluated properties are not allowed ('fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: i2c@119000 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t2080-serdes']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: dma@100300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: dma@101300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: dma@102300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
--
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: global-utilities@e2000 (fsl,t2080-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t2080-serdes']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dma@100300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dma@101300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: dma@102300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
--
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t2080-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): compatible: 'oneOf' conditional failed, one must be fixed:
   	'fsl,t2080-rcpm' is not one of ['fsl,p2041-rcpm', 'fsl,p3041-rcpm', 'fsl,p4080-rcpm', 'fsl,p5020-rcpm', 'fsl,p5040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,b4420-rcpm', 'fsl,b4860-rcpm', 'fsl,t4240-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,t1040-rcpm']
   	'fsl,t2080-rcpm' is not one of ['fsl,ls1012a-rcpm', 'fsl,ls1021a-rcpm', 'fsl,ls1028a-rcpm', 'fsl,ls1043a-rcpm', 'fsl,ls1046a-rcpm', 'fsl,ls1088a-rcpm', 'fsl,ls208xa-rcpm', 'fsl,lx2160a-rcpm']
   	'fsl,qoriq-rcpm-1.0' was expected
   	'fsl,qoriq-rcpm-2.1' was expected
   	'fsl,qoriq-rcpm-2.1+' was expected
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: global-utilities@e2000 (fsl,t2080-rcpm): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/global-utilities@e2000: failed to match any schema with compatible: ['fsl,t2080-rcpm', 'fsl,qoriq-rcpm-2.0']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t2080-sfp']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t2080-serdes']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: dma@100300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: dma@101300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: dma@102300 (fsl,elo3-dma): 'fsl,iommu-parent', 'fsl,liodn-reg' do not match any of the regexes: '^dma-channel@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,elo3-dma.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: global-utilities@e2000 (fsl,t4240-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: global-utilities@e2000 (fsl,t4240-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpic'] is too short
   	'chrp,open-pic' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: pic@40000 (fsl,mpic): device_type:0: 'open-pci' was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/chrp,open-pic.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,t4240-device-config', 'fsl,qoriq-device-config-2.0']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: global-utilities@e2000 (fsl,t4240-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: global-utilities@e2000 (fsl,t4240-rcpm): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sfp@e8000: failed to match any schema with compatible: ['fsl,t4240-sfp']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/serdes@ea000: failed to match any schema with compatible: ['fsl,t4240-serdes']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118100 (fsl-i2c): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: i2c@118100 (fsl-i2c): Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
