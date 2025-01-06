Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31CA84D29
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736153659; cv=none; b=n2uqZ08UBF1lDhHxWWeczQ+qagaIkJh1eZvbqTQCYeEXMZQsn2Sgf03QZ65MIxXPb/8RDYR01u97bRkeY2Y94V25ueYYKEV+CSXZxKy11h7nPKd3J9nn6lvhBBbAxM632Qe0tp0y1Yl+Qj45DjJ/JKV1uq/uoEIOVK9rw36I5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736153659; c=relaxed/simple;
	bh=DkUpLfoxzFv8DbBI11FP3LILIdfu2GPZoKX5BryZXxA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iW89UuhkiaB9Hf8A2xFRGGPrVJ4ltsQ9qEpUTVkjbwRsqFAKNh/5xIt/TVCbEkfH0X+2fjUrnSwxptWfxys18BxPonGbcd1EkR8w87VsccgATwLfCIkpp8ZYKi3bfhRkhakz52ZHoLfkOvqZJzKf5HVcaqwTXL0lAZHgSM5aQpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A83V40yj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A83V40yj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736153658; x=1767689658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkUpLfoxzFv8DbBI11FP3LILIdfu2GPZoKX5BryZXxA=;
  b=A83V40yjVLOjhyWCetigQQPup0IH04akcjwdlVGTvFb2bsZIXca+AUHp
   M5Hr7rzJdyFnMfMb7czrEeuCXRoc3MnemY2oIocYYrVJN5wWsd4YYWXaP
   eCwBhyjn+DEgv8DkXYfz0LupasL8fqpXptqSFjfOE+3/yDBxDja9k2yWT
   SvR3fTc4tC+yGJUHkAMEpOMoZTEo3XciVv10lWRmbGHUtJpqA/xN3YjOt
   vo4l79GdBE4qZSbIIZO2f61FTwqTMBsClYoN2IAo+UJ4LeQHbRj/3qGoL
   LLCvnxRhQ8KF96H5l6Lggkvp9NI0nOCzpuD7M6HFsp/VbmxWT+PV4/Iez
   Q==;
X-CSE-ConnectionGUID: 8G0txtiwQ5G2+BTwKU2Riw==
X-CSE-MsgGUID: uuvV/7YuThqZ084N9W5bZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36314767"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36314767"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 00:54:18 -0800
X-CSE-ConnectionGUID: c85FhR2tTBivs2S/y63E9Q==
X-CSE-MsgGUID: 0nuTVHfpSRa9diN7tS+QQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="107445126"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jan 2025 00:54:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUisH-000CQ3-2F;
	Mon, 06 Jan 2025 08:54:13 +0000
Date: Mon, 6 Jan 2025 16:53:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Message-ID: <202501061628.ud6AZ7au-lkp@intel.com>
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
In-Reply-To: <20250105-bigtreetech-cb2-v6-2-ee7bc9c4df46@gmail.com>
References: <20250105-bigtreetech-cb2-v6-2-ee7bc9c4df46@gmail.com>
TO: Ivan Sergeev <ivan8215145640@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Ivan Sergeev <ivan8215145640@gmail.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 63676eefb7a026d04b51dcb7aaf54f358517a2ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Sergeev/dt-bindings-arm-rockchip-Add-BigTreeTech-CB2-and-Pi2/20250105-184257
base:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
patch link:    https://lore.kernel.org/r/20250105-bigtreetech-cb2-v6-2-ee7bc9c4df46%40gmail.com
patch subject: [PATCH v6 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-053-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061628.ud6AZ7au-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061628.ud6AZ7au-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501061628.ud6AZ7au-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 196]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /i2c@fe5c0000/touchscreen@48: failed to match any schema with compatible: ['ti,tsc2007']
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: pmic: soc-slppin-gpio: {'rockchip,pins': [[0, 2, 0, 196]]} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
