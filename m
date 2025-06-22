Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590019AD8C
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584812; cv=none; b=jgEaAok3wiDKMv17yTbIit5vjx/c80wiwcrMwUdZvzJu5hi7x5f0z+3VSBRVKImzorz+5UPO53lwm+/TCPB15qpK6wmNwjKscN9wPXoFr8yrFWGrSCMLILSJ7ispFVtKcaysj5pjrbCYk4SY2v+A95WU564LDAy9VJOlQYRBOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584812; c=relaxed/simple;
	bh=wcRaO8ZLhyXUfx8/QydRN650d19hFAsStOB7ZD8sgLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMJ3j/n0aPu9+9Cq9Qkg91OVTTEDIjmK2CJhQSPe/EeiXDwA3V9nw5A5T2a8QqzXUT8lAQ25zxcerT8norqeYN9OThnuhnVyqIFtP/7GBWhciVQuQXTaNDZUinRW5ZTFgyhitrjHssgoC+5JO5hkP9ZMAUZ64KklWZ/nok0XeEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuKNk7/0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuKNk7/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750584811; x=1782120811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcRaO8ZLhyXUfx8/QydRN650d19hFAsStOB7ZD8sgLM=;
  b=IuKNk7/0z59dww4n2pBSalB3GBVP37K1nhQPymUmuF7Coddw0Rf4D1O1
   1D9AMyzfLXfDuevSFYbTnbZwY4D5VwKyrXAtoN0axZbkXH+1ToPxhgQcI
   b+POlTKdy+HfYRWVuEFhPv55xbDybmYo5olonT6t3979ATUfUJDJtc+2o
   7AL6gyL4fw2LO1XuvDptd2Nm16bNhywXqxfRLV9+mFyENzTOIMk2Y/uB9
   PUUKQqDAijGkcylv6St41kor2aUYQJRH/k4TBu9cFT+TJbPWd+vyOw496
   mpuf4fzJFrRmR7211GkRwXYbNQxBmmtXlAoKZGYxk7pJHdVaRUKGePjUr
   w==;
X-CSE-ConnectionGUID: CbTxmAkzRuiAswAK/3gRPQ==
X-CSE-MsgGUID: wGCMwyuYRjW3AWK1Sp45Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52671231"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52671231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 02:33:28 -0700
X-CSE-ConnectionGUID: +s7cNXP4QzuH4KdpPxyc4g==
X-CSE-MsgGUID: rOtb0qImRzqPgnMTndrPMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="156810990"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2025 02:33:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTH4n-000NBG-0C;
	Sun, 22 Jun 2025 09:33:25 +0000
Date: Sun, 22 Jun 2025 17:32:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 5/5] arm64: dts: rockchip: Add USB and charger to
 Gameforce Ace
Message-ID: <202506221723.IkyezPLC-lkp@intel.com>
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
In-Reply-To: <20250621180119.163423-6-macroalpha82@gmail.com>
References: <20250621180119.163423-6-macroalpha82@gmail.com>
TO: Chris Morgan <macroalpha82@gmail.com>
TO: linux-pm@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: broonie@kernel.org
CC: lgirdwood@gmail.com
CC: sre@kernel.org
CC: heiko@sntech.de
CC: conor+dt@kernel.org
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: lee@kernel.org
CC: Chris Morgan <macromorgan@hotmail.com>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-regulator/for-next sre-power-supply/for-next linus/master v6.16-rc2]
[cannot apply to next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250622-020443
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250621180119.163423-6-macroalpha82%40gmail.com
patch subject: [PATCH V2 5/5] arm64: dts: rockchip: Add USB and charger to Gameforce Ace
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-001-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221723.IkyezPLC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221723.IkyezPLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506221723.IkyezPLC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts:1329.7-1336.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1329 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts

3b1465b25894b6 Chris Morgan 2025-06-21  1324  
3b1465b25894b6 Chris Morgan 2025-06-21  1325  &usb_host0_xhci {
3b1465b25894b6 Chris Morgan 2025-06-21  1326  	usb-role-switch;
3b1465b25894b6 Chris Morgan 2025-06-21  1327  	status = "okay";
3b1465b25894b6 Chris Morgan 2025-06-21  1328  
3b1465b25894b6 Chris Morgan 2025-06-21 @1329  	port {
3b1465b25894b6 Chris Morgan 2025-06-21  1330  		#address-cells = <1>;
3b1465b25894b6 Chris Morgan 2025-06-21  1331  		#size-cells = <0>;
3b1465b25894b6 Chris Morgan 2025-06-21  1332  		dwc3_0_role_switch: endpoint@0 {
3b1465b25894b6 Chris Morgan 2025-06-21  1333  			reg = <0>;
3b1465b25894b6 Chris Morgan 2025-06-21  1334  			remote-endpoint = <&usbc0_role_sw>;
3b1465b25894b6 Chris Morgan 2025-06-21  1335  		};
3b1465b25894b6 Chris Morgan 2025-06-21  1336  	};
3b1465b25894b6 Chris Morgan 2025-06-21  1337  };
3b1465b25894b6 Chris Morgan 2025-06-21  1338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
