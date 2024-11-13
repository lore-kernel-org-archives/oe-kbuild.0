Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C7018C02F
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Nov 2024 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731535064; cv=none; b=TxA3c8Q9WQ0a81ZqqzhFBM7ZU+wtTuK6Xmg9Ol+mIC4WrLnYdvK3yIe+Gtya+oufYhc8bKix72THciCNgo4MsGrFXxW8L6grT+eXg5gnNbuc62MlBIb2jZ6y22tOOwi0eT/gs/cVz+dhAGfQpq2VREuPZHjzGek9Dbc2dD72T+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731535064; c=relaxed/simple;
	bh=yJuFCfAx6AOlJ/DCLaLtzwLhoFub/dCRZGaGZ5XLhEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tx9zedkzqcxW8dspjdIElKgLsAEjDaHFAztIdWXPLJWjXochvus3jn+Mjxst5MQA8PT38BA6FUN0ROVFxOFU9mBhdCQhrZyEEWEa4+o+jSpRiVdrfKNInMA2wiAoZeg2KsBnh+hW7B4IyMMb8vGi6VpTfYs2HT7ZVmLRTP6cLF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BB5plbif; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BB5plbif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731535062; x=1763071062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJuFCfAx6AOlJ/DCLaLtzwLhoFub/dCRZGaGZ5XLhEM=;
  b=BB5plbifRB7uiIcPFHgubrqAU3x1IQQQ6wJYf3blfOJLvDbZ7Z7zxUNk
   4noo+zxf2ivTfOQElD4ah1Wzt18qWvIwnwC7x35la8U/n3OTQjLpPMaXf
   ztDQGo2/81WtK9rG0YS/+zn8u0wMA/d6/2FLA/cv26YuwxgUDvOmepxLB
   GQrHhMEQvFNopDZl06KwwjLulsEb0Hqwe+BrCGsTh3NoQRlnGF75vCj89
   UrFL1nocakBYMMGksUsJkeRVH5mSSAKfAvU4zUVWYFS0IeoYl/n1ZEZQM
   T5v1x8k6j0bN/jtSh5eYgpsTuczqy3VLekGMVxKd+SfhbrH8900SIHTvb
   A==;
X-CSE-ConnectionGUID: dASFsDJjS5eLolK9E+yikw==
X-CSE-MsgGUID: IPc9YkkwSg+p5DCww3dn1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53993937"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53993937"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:57:42 -0800
X-CSE-ConnectionGUID: GH1HwLQCRyiw+XH7qq7CJQ==
X-CSE-MsgGUID: oDdXsBwpSe+mRuiFTgkFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88393819"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2024 13:57:40 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBLMo-0000l7-1a;
	Wed, 13 Nov 2024 21:57:38 +0000
Date: Thu, 14 Nov 2024 05:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <202411140525.dYYgvFkC-lkp@intel.com>
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
In-Reply-To: <20241113051857.12732-3-a0987203069@gmail.com>
References: <20241113051857.12732-3-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on net-next/main net/main linus/master v6.12-rc7 next-20241113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-MA35-family-GMAC/20241113-132300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113051857.12732-3-a0987203069%40gmail.com
patch subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-051-20241113 (https://download.01.org/0day-ci/archive/20241114/202411140525.dYYgvFkC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.11
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140525.dYYgvFkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411140525.dYYgvFkC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: /soc/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
   arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dtb: /soc/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
