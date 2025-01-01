Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9B383
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Jan 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735725995; cv=none; b=PGh2lm+eX4ZI5teJik/uQKFwAWGnO/2/qYn8YHQXopM3KHaVTqMQ7Sci5lp6kyjTfwoUDfTFrPhxjAYs5KUS+YtPSlVaPgOlkfJGeu5U35SIusm1mnsAoacnLcwlvvAXAnl3Ng41cYEgu36kSXYG/Aw+rkPKemXc4be4dTHQ1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735725995; c=relaxed/simple;
	bh=wxeh0uMXeC2hRsTmAHM/lbYyL8/n56/Pw4txM6A4AvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LompLmwiXsjwScSPiVa4ScMpK9kyCCHEr5Mo4Mo/Fso6wSpdSRGL0qUC5pgm8i3c7MjN/qFTibs3Je17XcmsJlKy/+tuCk7bslPlrtbIysy7oVy+hJJSQ3RVFf1T1+GhC4dliXTFN/shBONdGc3cnc81y7Tq1+w5s0sPcZA2Pp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YldJA5dS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YldJA5dS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735725993; x=1767261993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wxeh0uMXeC2hRsTmAHM/lbYyL8/n56/Pw4txM6A4AvA=;
  b=YldJA5dSHsSEZQaE0QBVnin0ls1a/xb5ezMyS3KyID11cbR4yyHkEqOP
   9MlL7Zr2UGaLs7LCpHXkYrFLSeHoiUi5/RHz6RdrZK4teIC75NcVxZ8w8
   MI3oGqeuB3Arb5Rexpnb9AoslDXdwIc8QeX2+MqO/MeZp9w5TaFu1wvoG
   +tt9HTTHnYxnYwvQ4VaZKRQ9p/69EAjYGsZMfSDhIaGeZhSRzy0Xhfo+j
   jkhLxN407DgditB9/4jj/95SzM15D3ESse2c80N39CgIJQ4VVeKU7fAp4
   V5pI6NwMJwx9br+Pno4LBc8qvV9COLOZYy4Tf42j11A0ygL03f9drZ68D
   A==;
X-CSE-ConnectionGUID: NR21qsb5RLu8HBcSbjGFbg==
X-CSE-MsgGUID: FgOHPyDVTJ6H/1eR5SlQfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46658607"
X-IronPort-AV: E=Sophos;i="6.12,281,1728975600"; 
   d="scan'208";a="46658607"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 02:06:32 -0800
X-CSE-ConnectionGUID: DhgIdri/TPSpM/4BAjh7dg==
X-CSE-MsgGUID: CUb9yPTYS9+33LyRbFIe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106286166"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Jan 2025 02:06:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSvcT-0007kx-12;
	Wed, 01 Jan 2025 10:06:29 +0000
Date: Wed, 1 Jan 2025 18:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/3] arm64: dts: rockchip: Add hdmi for rk3576
Message-ID: <202501011758.J1syklqd-lkp@intel.com>
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
In-Reply-To: <20241231095728.253943-3-andyshrk@163.com>
References: <20241231095728.253943-3-andyshrk@163.com>
TO: Andy Yan <andyshrk@163.com>
TO: heiko@sntech.de
CC: detlev.casanova@collabora.com
CC: krzk+dt@kernel.org
CC: robh@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-rockchip@lists.infradead.org
CC: Andy Yan <andy.yan@rock-chips.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Yan/arm64-dts-rockchip-Add-vop-for-rk3576/20241231-180455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241231095728.253943-3-andyshrk%40163.com
patch subject: [PATCH v3 2/3] arm64: dts: rockchip: Add hdmi for rk3576
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-053-20250101 (https://download.01.org/0day-ci/archive/20250101/202501011758.J1syklqd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501011758.J1syklqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501011758.J1syklqd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/syscon@26032000: failed to match any schema with compatible: ['rockchip,rk3576-hdptxphy-grf', 'syscon']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/vop@27d00000: failed to match any schema with compatible: ['rockchip,rk3576-vop']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: iommu@27d07e00: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu'] is too long
   	'rockchip,rk3576-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
   	'rockchip,rk3576-iommu' is not one of ['rockchip,rk3588-iommu']
   	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/iommu@27d07e00: failed to match any schema with compatible: ['rockchip,rk3576-iommu', 'rockchip,rk3568-iommu']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/hdmi@27da0000: failed to match any schema with compatible: ['rockchip,rk3576-dw-hdmi-qp']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible:0: 'rockchip,rk3576-hdptx-phy' is not one of ['rockchip,rk3588-hdptx-phy']
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: compatible: ['rockchip,rk3576-hdptx-phy', 'rockchip,rk3588-hdptx-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: resets: [[17, 428], [17, 450], [17, 451], [17, 452]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:0: 'phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: hdmiphy@2b000000: reset-names:1: 'apb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,rk3588-hdptx-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
