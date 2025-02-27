Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351013AA5D
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670279; cv=none; b=nlVIlg7C3qgxO8UulARnocd1qJ1HcmPV4Yic+5K8Qc0UquNkD9Fy7ZvTklYjk5VhY2xo2W2mpxngAwe5CYWotGCQ9RbuJ49VNLNseaE7MVrWbBIiJW6XVUxicgfZ8kYe1skvkRp8oyv0vqOzY23UNFyz40C6NgsnVtM3lNBetMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670279; c=relaxed/simple;
	bh=W6Vrgb75WPrr3J592Ln8tkG7lmG/2l/BQX7au685yMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HyBXp/pYzVK0scKWfPyTv9VHBXGQKpRl2ZE23d6JM7miyfAHRxbfTyhmzzSxlIXQmKS6v+EbhrM1A/4nTSc2KH2psqdOzsaRUKerF+oyk+70fA+zG4Tf81hYcoZ5mIu5TqyrlhJZXOUDwz93dOSU4cmBOfxOpWiRSGEmpQYiDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wx7W8rB7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wx7W8rB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740670278; x=1772206278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6Vrgb75WPrr3J592Ln8tkG7lmG/2l/BQX7au685yMk=;
  b=Wx7W8rB7y0xzdhWYuVEVOwPza2+HbjilRWrswJGLXR2YB3aD9qo6l1ac
   75UynUavlzaCHzua3sZ26FtVfm9MyqPXVXPEs9CxkRHlDmnZVSSIj3xdo
   9UJ764ET1I8z7fWA4tjSHUymL//32thDhUqNAgFMsQIMPTnLP+x+SC1CB
   XF+P9DfB+0QM1ab3OmZW04fZnymfQr27e/mdS6SGCYYKmtJN37QWgrp7s
   m1kiXotGwVwO6puvx83Q9aIlvtXtsaZln+lFeMg7MvwdZV7GhGJIcegUY
   LJw80zOtV2+u9o3RARCtVysAgAKBQrnbzQZd+Obsm6m5CRWi4naKu7+rJ
   A==;
X-CSE-ConnectionGUID: 265vCZ0JR+2KRhSajCwodQ==
X-CSE-MsgGUID: Z3/C/nv9RJ+s414B2D0FJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40743251"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="40743251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 07:31:16 -0800
X-CSE-ConnectionGUID: KlHWw40LSjWOF0ad/OVuyQ==
X-CSE-MsgGUID: T/zRSAWgRiqTyqPQPXwu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117570452"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Feb 2025 07:31:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnfqy-000DaU-2M;
	Thu, 27 Feb 2025 15:31:12 +0000
Date: Thu, 27 Feb 2025 23:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI
 DSI port
Message-ID: <202502272357.yYp6xeAB-lkp@intel.com>
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
In-Reply-To: <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
References: <20250226-radxa-panel-overlay-v1-1-9e8938dfbead@collabora.com>
TO: Julien Massot <julien.massot@collabora.com>
TO: kernel@collabora.com
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: Julien Massot <julien.massot@collabora.com>

Hi Julien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad]

url:    https://github.com/intel-lab-lkp/linux/commits/Julien-Massot/arm64-dts-mediatek-mt8395-nio-12l-Prepare-MIPI-DSI-port/20250226-223820
base:   8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
patch link:    https://lore.kernel.org/r/20250226-radxa-panel-overlay-v1-1-9e8938dfbead%40collabora.com
patch subject: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272357.yYp6xeAB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272357.yYp6xeAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502272357.yYp6xeAB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3331.22-3343.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts:964.7-972.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +964 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

96564b1e2ea4d2 AngeloGioacchino Del Regno 2024-02-02  962  
269e2352ca44fa Julien Massot              2025-02-26  963  &vdosys0 {
269e2352ca44fa Julien Massot              2025-02-26 @964  	port {
269e2352ca44fa Julien Massot              2025-02-26  965  		#address-cells = <1>;
269e2352ca44fa Julien Massot              2025-02-26  966  		#size-cells = <0>;
269e2352ca44fa Julien Massot              2025-02-26  967  
269e2352ca44fa Julien Massot              2025-02-26  968  		vdosys0_ep_main: endpoint@0 {
269e2352ca44fa Julien Massot              2025-02-26  969  			reg = <0>;
269e2352ca44fa Julien Massot              2025-02-26  970  			remote-endpoint = <&ovl0_in>;
269e2352ca44fa Julien Massot              2025-02-26  971  		};
269e2352ca44fa Julien Massot              2025-02-26  972  	};
269e2352ca44fa Julien Massot              2025-02-26  973  };
269e2352ca44fa Julien Massot              2025-02-26  974  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
