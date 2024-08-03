Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E44C6D
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 04:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722660910; cv=none; b=jyKxafKeb664jEMsr2lw6mHE1p/mlMNETzMCgPn5ZGMQ/EyLru2/3ZMUd0/pbk8+e3ieB94eDv7eV/MLoV+0qNjtn6P3k7e4fmkwlR4BqHt57Ddyo0Igx6rOCzM8k/N16t4e73UZBIn5WUHTD+T+PQg1c072tk7bcdvg+rzQHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722660910; c=relaxed/simple;
	bh=ryBBkwz8J4a8yT9VI1KM8pa6h8iQxmbs6xtYAFtiEA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=khMewWzYiiRlXBsKiwLfBT9o5pS/ljqwkNMTunE3TIVVGgoG1sceMdGF0W0tvY7jTirsKGm+nLzloERKMzi/IlYUDViqvqiTdiO1LrWOgYYv3TLOY7H8eILxpxue9S0BuOYH6UmwrcyDWe24JOcY+ESMHSTv3wCaCI2YiCukwAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imW1Io16; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imW1Io16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722660909; x=1754196909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ryBBkwz8J4a8yT9VI1KM8pa6h8iQxmbs6xtYAFtiEA0=;
  b=imW1Io162GpvbDXHIX+I97NmTKHOixSO/QyNRdhtjHMNxpqAqwYiUz3E
   CRiyG2G0iNGVORtGFQsIPMqLcway3mYLGHvWPIoaRA9RK5e9zqv3iz4rf
   eyGjyiyw9iqtgpRxpCUZlNSAqQDX4/5Q4NYLt8muJsBK2PWwEM/3QXlVu
   lPf1JbLJqYxjCUVebTmhMSk1/LxVE6lxp6EoG/h4xH/KoESQo8lkQhYtK
   h2d+M+o3F/CE6td/JQNaWp7Gliq8zztEB2FFq2B/Yiy20DNY9WUB+W3IM
   JlBZPTHnNsBUjPh1gcWIHnWdkRo7uF53zDMHxHlXu3o2fhrBtXCMBrLVU
   Q==;
X-CSE-ConnectionGUID: nzTG3xKqTi2LXpY/zmM7SA==
X-CSE-MsgGUID: L2EiSsQnRVKFhHqbzsUzQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31339905"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31339905"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 21:55:08 -0700
X-CSE-ConnectionGUID: 3JrnbzKbSC6fwisQ00PBpA==
X-CSE-MsgGUID: 7ChBlugnSuuD3aG5CrBjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="59764193"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Aug 2024 21:55:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa6n4-00005o-09;
	Sat, 03 Aug 2024 04:54:57 +0000
Date: Sat, 3 Aug 2024 12:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 1/2 RESEND] arm64: dts: rockchip: Add DTS for
 FriendlyARM NanoPi R2S Plus
Message-ID: <202408031252.KrHshVrx-lkp@intel.com>
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
In-Reply-To: <20240801175736.16591-2-jin@mediatomb.cc>
References: <20240801175736.16591-2-jin@mediatomb.cc>
TO: Sergey Bostandzhyan <jin@mediatomb.cc>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: heiko@sntech.de
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Sergey Bostandzhyan <jin@mediatomb.cc>

Hi Sergey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sergey-Bostandzhyan/arm64-dts-rockchip-Add-DTS-for-FriendlyARM-NanoPi-R2S-Plus/20240803-025302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240801175736.16591-2-jin%40mediatomb.cc
patch subject: [PATCH V2 1/2 RESEND] arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-051-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031252.KrHshVrx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031252.KrHshVrx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408031252.KrHshVrx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3228' was expected
   	'tsd,rk3588-tiger' was expected
   	'xunlong,orangepi-3b' was expected
   	'rockchip,rk3318' was expected
   	'rockchip,rk3328' is not one of ['rockchip,rv1126', 'rockchip,rv1109']
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /: failed to match any schema with compatible: ['friendlyarm,nanopi-r2s-plus', 'rockchip,rk3328']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: hdmi@ff3c0000: interrupts: [[0, 35, 4], [0, 71, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /phy@ff430000: failed to match any schema with compatible: ['rockchip,rk3328-hdmi-phy']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: /clock-controller@ff440000: failed to match any schema with compatible: ['rockchip,rk3328-cru', 'rockchip,cru', 'syscon']
>> arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dtb: mmc@ff520000: Unevaluated properties are not allowed ('num-slots', 'supports-emmc' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
