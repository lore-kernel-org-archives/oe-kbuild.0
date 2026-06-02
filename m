Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8713BE16A
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394190; cv=none; b=kJ2Zm2party+O65F7+gNOJdqHcVCOZZNSF0xLRwdVj7Uj9v1GBGA5vISTlw9/zxxNl12gNJr7iqhLUywalX9KDRcb6wItIHNFx+OHlPS0yOKsQ3s1MzWwo1ZNS/yUV6PRUkcfkf5RUPfpIFuqNCXRdlQd6L6HMBnBvM5jzuFqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394190; c=relaxed/simple;
	bh=X97tGqr83t5p/YNcCouN8jA0gTibyk1gzYGrKQM38Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNmVRMyYwfOE4EJweCN0Yv5n/na45FkAkROGOPYlmC4JvNsmJIuMy72/CcNhUBWx/yJfg4uCIBp2630sa4yOROYqmhoQA9/3fY6A4K053qAuI+IN6DkEZeCBADkI5tmwA2E7ab+Gz+PCngxvDifkQbMiURLIvuhxXYnOO4jOuqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVBJjpsg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVBJjpsg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780394188; x=1811930188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X97tGqr83t5p/YNcCouN8jA0gTibyk1gzYGrKQM38Wo=;
  b=nVBJjpsggHViD/dUxGlM8uGYOxcXninzNl5Lz1npDBWueqaGtUw16++e
   +t1Yn/rX6fXcsZdrwfEgj5/B1nNRCWBbco8mMOrPEooGpUPttqgib8hsQ
   AcBXjPdXzSLz9CxHzEsupdd00UvsAAUSe+0/zBRiMYys+vG6i24HZsXNu
   pmQqrD3qL2dEIwoYVBf1FkGudW9LIWiU82Y0DelrcNwje46ksm8hLNqf1
   7jpl/z5zqbWpKitMlH4owHMZUlaXpph4cEKof7J0TGZpOfOC5kscYe36S
   hbF5Z+/+Kpwabg+aV2n+C458LkKZu3OKbk409wazbtHzEiCjnoSsR010G
   w==;
X-CSE-ConnectionGUID: 7ZqzCcL7SC2KDLyEFEK/oQ==
X-CSE-MsgGUID: jEle+dhbSxW3TOPDafMJgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80204864"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80204864"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:56:27 -0700
X-CSE-ConnectionGUID: dpn+YGA5TUGA7+jriK7q6Q==
X-CSE-MsgGUID: mTn675rYQkmVSB9UIyuXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="240858798"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2026 02:56:26 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wULrE-000000001mr-1E8l;
	Tue, 02 Jun 2026 09:56:24 +0000
Date: Tue, 2 Jun 2026 11:55:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon
 board
Message-ID: <202606021103.haAqiHuz-lkp@intel.com>
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
In-Reply-To: <20260601132529.139172-3-hrushirajg23@gmail.com>
References: <20260601132529.139172-3-hrushirajg23@gmail.com>
TO: Hrushiraj Gandhi <hrushirajg23@gmail.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Hrushiraj Gandhi <hrushirajg23@gmail.com>

Hi Hrushiraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc1 next-20260601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hrushiraj-Gandhi/arm64-dts-rockchip-add-Vicharak-Axon-board/20260601-213319
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260601132529.139172-3-hrushirajg23%40gmail.com
patch subject: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon board
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2052-20260601 (https://download.01.org/0day-ci/archive/20260602/202606021103.haAqiHuz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021103.haAqiHuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606021103.haAqiHuz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,rk3562' was expected
   	'rockchip,rk3588' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
   	'tsd,px30-cobra' was expected
   	'tsd,px30-pp1516' was expected
   	'tsd,rk3588-tiger' was expected
   	'xunlong,orangepi-3b' was expected
   	'xunlong,orangepi-cm5' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml
   arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: /: failed to match any schema with compatible: ['vicharak,axon', 'rockchip,rk3588']
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: hdmi@fde80000 (rockchip,rk3588-dw-hdmi-qp): Unevaluated properties are not allowed ('enable-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: pmic@0 (rockchip,rk806): Unevaluated properties are not allowed ('rk806_dvs1_null', 'rk806_dvs1_pwrdn', 'rk806_dvs1_rst', 'rk806_dvs1_slp', 'rk806_dvs2_dvs', 'rk806_dvs2_gpio', 'rk806_dvs2_null', 'rk806_dvs2_pwrdn', 'rk806_dvs2_rst', 'rk806_dvs2_slp', 'rk806_dvs3_dvs', 'rk806_dvs3_gpio', 'rk806_dvs3_null', 'rk806_dvs3_pwrdn', 'rk806_dvs3_rst', 'rk806_dvs3_slp' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk806.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dtb: hdmi@fdea0000 (rockchip,rk3588-dw-hdmi-qp): Unevaluated properties are not allowed ('enable-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
