Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8123E32D
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542965; cv=none; b=GzEzfa3c6uiKQWUT/vk4gKdEbOiwjsmNPzx56kIU4cIUpED3YkgDyD3zlq3nM6D2ATAdYscUpQ8ZgV0F6Fx9e2GAowhOCJGnZAtZj85bujoJoVK9xMk70Y/cAoOQUoFVhMoQviCNNIJMOin5U6R8DZOF7kuC93HNHTJ018gD64E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542965; c=relaxed/simple;
	bh=MKgQ+tu50/fZjUNZTM3mBKIKDqZEvMutWUj53CwlaAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZQSu6AyAKkYM0ZsWgl+QC8haxpWd99Ap/31EjeH2tRFjtndN6XYse62UJ3oF1Z9udpx45QZ0Gd2qZbVQocvW3tadD5c5sST9YdMzX4u+rZufSQz84WPULrQX69QXu1DP1SldDTAkaZfx/lIX+iKhwjbfQcAmL43pa2iXPMolC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfd+RPK5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfd+RPK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758542964; x=1790078964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKgQ+tu50/fZjUNZTM3mBKIKDqZEvMutWUj53CwlaAs=;
  b=Qfd+RPK5R0XI9d+gopFAa+PVVV/qbTfDY2K/j8+XfLy02eMkgDVsey8t
   i5cD6EnY2ZOjjqpHCDf+MaQc0wgE2XqSr+Ijvmv7RPTaVFHcxA+wTbfcj
   V9DuF/FdQ7MhvOvZaD1m+vghBO9Qcvp/lh8N9vhYPqEgMv71Q/HXWLVnh
   uBxoL7Y/b4EIq4yRReqCzOjf9tQaY9P7dnfX+oRf0Dv43n/UgyChViDvc
   eHC5fpLTQWVVuga7KA7X8V/ltG4LySDBUWUTM7KedkwbSOLQdi+ilxXr9
   7BrHGvV6RPKPyYIevJ83lJwPpSssxszAFeBNbH821kbmj7Z20ILUr+6Ti
   w==;
X-CSE-ConnectionGUID: 6qZInhklTMqLDTrcPdQNxg==
X-CSE-MsgGUID: M2CBZ6z9S8OtJC6DfbjgSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71906412"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="71906412"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 05:09:23 -0700
X-CSE-ConnectionGUID: f9HZKci1SxqIK5zZsZXnvQ==
X-CSE-MsgGUID: ktDUQNVoRyyHinQGbYZ2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="180717277"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2025 05:09:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0fM8-0001dp-0O;
	Mon, 22 Sep 2025 12:09:20 +0000
Date: Mon, 22 Sep 2025 20:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Message-ID: <202509221943.VXrBqhlr-lkp@intel.com>
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
In-Reply-To: <20250919185621.6647-3-tan@siewert.io>
References: <20250919185621.6647-3-tan@siewert.io>
TO: Tan Siewert <tan@siewert.io>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
CC: Tan Siewert <tan@siewert.io>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org

Hi Tan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.17-rc7 next-20250919]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tan-Siewert/dt-bindings-arm-aspeed-add-ASRock-X470D4U-BMC/20250920-025905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250919185621.6647-3-tan%40siewert.io
patch subject: [PATCH 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20250921 (https://download.01.org/0day-ci/archive/20250922/202509221943.VXrBqhlr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221943.VXrBqhlr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509221943.VXrBqhlr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/memory-controller@1e6e0000: failed to match any schema with compatible: ['aspeed,ast2500-sdram-edac']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/syscon@1e6e2000/p2a-control@2c: failed to match any schema with compatible: ['aspeed,ast2500-p2a-ctrl']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: display@1e6e6000 (aspeed,ast2500-gfx): 'reg-io-width' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: display@1e6e6000 (aspeed,ast2500-gfx): 'memory-region' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/aspeed,ast2400-gfx.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/timer@1e782000: failed to match any schema with compatible: ['aspeed,ast2400-timer']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: /ahb/apb/pwm-tacho-controller@1e786000: failed to match any schema with compatible: ['aspeed,ast2500-pwm-tacho']
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@1: aspeed,fan-tach-ch: b'\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dtb: fan@2: aspeed,fan-tach-ch: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
