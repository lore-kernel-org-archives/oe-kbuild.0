Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DE1DF73A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 05:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754543470; cv=none; b=ikRQ28MoGnIPkZsFPJcpPrM/1+3e+yBjXZsFeHigQSxUe/J4hSWpAFyMeU0C0iMUD6xW7BjE/v5eWBQGnXfO3Cf+2zlkKj+WqYOgrLZ1Rul7gO6BtynjYKXfxEQNf+bthEbdPo1QNo6Y5bHGQTaMCNFtsVNwTe+G5xuPPGCdnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754543470; c=relaxed/simple;
	bh=Q7TC8Jp/mu9dPXF9RcWsrBGTj1dQcugQUsuvHHIkgLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pV4sbdW9YUwyCbT/dwKkHcNiMRCYw2uApSj1wvEX3pRmS/J+yQHjZIsa05jURSOEtYnUGhCFMWO/pfUbeAncgX/uyLdyXXk/fIyJXiU6GYE6E1wd8h0/xAcnf08ocYOWH4svCdlHdVBoWymOOck+5EOgXaF0UDpxPU/60OQMIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nO6YlaN5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nO6YlaN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754543469; x=1786079469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q7TC8Jp/mu9dPXF9RcWsrBGTj1dQcugQUsuvHHIkgLU=;
  b=nO6YlaN5PhIXGiVS6aADhfXzYROlhEWfCNpv3AS77CCfq9sU48esGE0I
   y7B6Igu79bHrEJGlwu+sB9GiKeTSUGnh/yZp81dWFoXg28WdsIdjAc7qf
   9CdqhMa5tRx13jBllNa4IVy73rbl3l69uC+VRcJUrxP6sobENkZMshc7X
   6PoCc1fjZGj8zUGUPFkhOsfeJIeyeQkY0P8ss+TE/qImfarpvc0+2A2EP
   VfuMKRjxvp4XzbluJNcg2b2jSpx6zCBOxqATYLW0We+e3EiUjZSPJjTBf
   YjHr+272vnMKFc9f7JVlEoGb2BtpAGqEwGPSm6YCtAlJL/cHUMEBki1dm
   Q==;
X-CSE-ConnectionGUID: UQ2O/0FAQaq38iLjqxDqsw==
X-CSE-MsgGUID: znMargwQSsaxYa+APPeRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60679759"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60679759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:11:08 -0700
X-CSE-ConnectionGUID: Rq0pxPTFSYWGKqgCe9aPPg==
X-CSE-MsgGUID: loxs0JvKTv2o6A/xsyCwDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="170224118"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2025 22:11:07 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsrP-0002OY-1X;
	Thu, 07 Aug 2025 05:09:46 +0000
Date: Thu, 7 Aug 2025 13:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 442/801] arch/nios2/boot/dts/3c120_devboard.dtb:
 cpu@0 (altr,nios2-1.0): altr,has-initda: 1 was expected
Message-ID: <202508071353.q1BBe330-lkp@intel.com>
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
commit: 369b5f54ba29f27e52fd20b3676bfef9ee0fcea0 [442/801] dt-bindings: nios2: Convert altr,nios2-1.0 to DT schema
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: nios2-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071353.q1BBe330-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071353.q1BBe330-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071353.q1BBe330-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/3c120_devboard.dts:52.9-147.4: Warning (unit_address_vs_reg): /sopc@0: node has a unit name, but no reg or ranges property
   arch/nios2/boot/dts/3c120_devboard.dts:46.11-50.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /sopc@0)
   arch/nios2/boot/dts/3c120_devboard.dtb: /: failed to match any schema with compatible: ['altr,qsys_ghrd_3c120']
>> arch/nios2/boot/dts/3c120_devboard.dtb: cpu@0 (altr,nios2-1.0): altr,has-initda: 1 was expected
   	from schema $id: http://devicetree.org/schemas/altr,nios2-1.0.yaml#
>> arch/nios2/boot/dts/3c120_devboard.dtb: cpu@0 (altr,nios2-1.0): altr,has-mmu: 1 was expected
   	from schema $id: http://devicetree.org/schemas/altr,nios2-1.0.yaml#
>> arch/nios2/boot/dts/3c120_devboard.dtb: cpu@0 (altr,nios2-1.0): altr,has-mul: 1 was expected
   	from schema $id: http://devicetree.org/schemas/altr,nios2-1.0.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: serial@4d50 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml#
   arch/nios2/boot/dts/3c120_devboard.dtb: serial@4c80 (altr,uart-1.0): Unevaluated properties are not allowed ('current-speed', 'interrupt-parent', 'interrupts', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/altr,uart-1.0.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
