Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E1925D1E6
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765950317; cv=none; b=diS44UtW+ZawAluoAxp22R4ySPeX19PQ+v9fDoxQ9yIwDWH8N7H0bGlsWTXxOuXxWOI6XdBKw5ZQM43KNC8IbfFVmFbhX1kqsP+RLljxwg/BKTYFnc3mM3KfllNfc4vGLG7iusjjJF85vT74G2lOSvMqPgUxMT21U3z3CDX6wUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765950317; c=relaxed/simple;
	bh=s58gvWEkZdWdp8sqrtaKyB+eykRHrMMjFT5k+euVino=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSNwGHbJOjXs7LWulHM8UHwVpd9wYwh9Q+Rh5e//NDhpO0QTrI0dz0tlm+Cg/HdLAvMXY+5RFEZDCSg9urXQj7aA9iRZ35Cfq8dc+n1TFeiPjii6o7aT6v3sl1h0/ZmybqqcF4CWSuUor+UkMyP2xw/VJF1p2AgaSVHNu0SBTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkSA6kbN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkSA6kbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765950315; x=1797486315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=s58gvWEkZdWdp8sqrtaKyB+eykRHrMMjFT5k+euVino=;
  b=JkSA6kbNwBCWBoj4C0U/TtHCCY73sDawni/o7dNzPm56XzVQFlSKSxvr
   ixmxfkouXy6YCjlt6ndoHGW4N+XoAii1ezX6Nsfk96AcClbRGLpeDchVH
   fiy2nLZOEbYAl2zoOgwu88UYdDHo1GAfMI8N9RFSHjq+hFBWIvrSVMx6z
   4sH7EwbHugxRVRV4rMkR32DsM2imLCdDsNXWc0wHaLQaNMFUC67T5wh2n
   HMafztjy8K0i0nk4WvYMHKJ34lF1g5n73dDV9MRd5gNLcPkdaboLjdrt+
   V+B6Ciza30P0Nj//EZx5+nKsTnnRwoS+sSAzXjCahyoRpvQwaB5DdJLN/
   Q==;
X-CSE-ConnectionGUID: pf6qAy+ST8OZnrSKGskjlA==
X-CSE-MsgGUID: 68DAeQyhSvWsg9RIpR5org==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78592137"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78592137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:45:12 -0800
X-CSE-ConnectionGUID: FQYDCtxwR3mSdB2pxzH4tg==
X-CSE-MsgGUID: aFz5C1cFQli8mFLEGOYqJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198212204"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 21:45:11 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVkLV-0000000003V-13Vh;
	Wed, 17 Dec 2025 05:45:09 +0000
Date: Wed, 17 Dec 2025 13:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Message-ID: <202512171317.fS7XhFAb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/phy/phy-eyeq5-eth.c:247:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com>
References: <20251215-macb-phy-v5-2-a9dfea39da34@bootlin.com>
TO: "Théo Lebrun" <theo.lebrun@bootlin.com>
TO: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
TO: "Grégory Clement" <gregory.clement@bootlin.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
TO: Neil Armstrong <neil.armstrong@linaro.org>
CC: linux-mips@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: "Benoît Monin" <benoit.monin@bootlin.com>
CC: Tawfik Bayouk <tawfik.bayouk@mobileye.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "Théo Lebrun" <theo.lebrun@bootlin.com>

Hi Théo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/dt-bindings-soc-mobileye-OLB-is-an-Ethernet-PHY-provider-on-EyeQ5/20251216-003346
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215-macb-phy-v5-2-a9dfea39da34%40bootlin.com
patch subject: [PATCH v5 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r123-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171317.fS7XhFAb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171317.fS7XhFAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512171317.fS7XhFAb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/phy-eyeq5-eth.c:247:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-eyeq5-eth.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/phy/phy-eyeq5-eth.c:248:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-eyeq5-eth.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/phy/phy-eyeq5-eth.c:249:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-eyeq5-eth.c:249:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/phy/phy-eyeq5-eth.c:249:1: sparse: sparse: bad integer constant expression
   drivers/phy/phy-eyeq5-eth.c:249:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +247 drivers/phy/phy-eyeq5-eth.c

15445336486369 Théo Lebrun 2025-12-15  246  
15445336486369 Théo Lebrun 2025-12-15 @247  MODULE_DESCRIPTION("EyeQ5 Ethernet PHY driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
