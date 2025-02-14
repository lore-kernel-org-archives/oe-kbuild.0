Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6401519BF
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 16:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551907; cv=none; b=WWtz0xc8Fa0F6EXdTFvYnYSgx6T4cBUugZZLVGK7cjDP+PdVNyONazXFPTiX/Kt5/YJfq1ye2yYM9bYE68JjLb4sb2LXZn8qIDChT35Cn8Py/WOdqs/kTPKbeV2GRZ266We4RQWl7VCUSPHNUtgxhY+A7hc8zWK6XY6pFdaG6Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551907; c=relaxed/simple;
	bh=+XdGRpyr0Lnyr5Iac7f+Aw4VKiG8nF+zX78OLUuOo38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0YRJVjKEsz0E5QNHzsehcnbXlwJfHk5V57HDVPAexGNHVqL0guLHFJBPF7KFRL8zy0/VZ+Urtci7WpCCGoL6PXFcaYA2vmY2njJT6u8fMom/Wgjjb/iDXbo7C2szG7gON509IQObxxlozQ2wQzLtZwYa8BuPQketWrMiG1oWc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlhTlAgK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlhTlAgK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739551906; x=1771087906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XdGRpyr0Lnyr5Iac7f+Aw4VKiG8nF+zX78OLUuOo38=;
  b=VlhTlAgKD+UbzGqhvBz/DC9hnUNuWkvovXY2C6g2P3H1QTwbLxYiv23k
   P/DAIzc8RpUs4LFI8tJPPr2/pSAj+26hqDfaAhC4Vx1yH37BNCr6Vbv4D
   rgVM+O/sFopW9COGEy4NSt1H87iq871YosqgWAo9LBqSptMa1qUCA4A/J
   srHI6ly3hGcVZbSPMVxkNbyMO6xFP7JvqxuZX7Rz+ngbhifFMBgh3SdCz
   ISc0b0yQnMO5E31Op4haGNGvxsXYpEKUa9lHYN5z87wpT3r/U9m7Tt3Wj
   ct+Idasl/cy1LYayeiV9LEmEfr1woCka+JNdbEbjyEU9JEXS6Il+KDEkY
   Q==;
X-CSE-ConnectionGUID: zcTyrhryQtiMD8g5yL0lQA==
X-CSE-MsgGUID: WrJWcp7OS4CBvBoL8H4Isw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40427033"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40427033"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 08:51:45 -0800
X-CSE-ConnectionGUID: 4X5P9gtCQgq3N/EkkeEpVw==
X-CSE-MsgGUID: zPCceUhkSw+bpH4b7MQ/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113370772"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 08:51:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiyuj-0019tr-2p;
	Fri, 14 Feb 2025 16:51:41 +0000
Date: Sat, 15 Feb 2025 00:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/3] arm64: mediatek: mt8195-cherry: Add graph for eDP
 and DP displays
Message-ID: <202502150003.bIkvfoi2-lkp@intel.com>
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
In-Reply-To: <20250213112008.56394-3-angelogioacchino.delregno@collabora.com>
References: <20250213112008.56394-3-angelogioacchino.delregno@collabora.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: matthias.bgg@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: angelogioacchino.delregno@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: kernel@collabora.com
CC: pablo.sun@mediatek.com

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/arm64-dts-mediatek-mt8195-Add-base-display-controller-graph/20250213-192515
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250213112008.56394-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v1 2/3] arm64: mediatek: mt8195-cherry: Add graph for eDP and DP displays
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-r072-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150003.bIkvfoi2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502150003.bIkvfoi2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3013.17-3070.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3087.17-3123.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1513.7-1521.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1513 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi

b6267a396e1cc5 AngeloGioacchino Del Regno 2022-07-04  1511  
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1512  &vdosys0 {
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13 @1513  	port {
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1514  		#address-cells = <1>;
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1515  		#size-cells = <0>;
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1516  
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1517  		vdosys0_ep_main: endpoint@0 {
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1518  			reg = <0>;
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1519  			remote-endpoint = <&ovl0_in>;
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1520  		};
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1521  	};
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1522  };
d0a8dcba3ea409 AngeloGioacchino Del Regno 2025-02-13  1523  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
