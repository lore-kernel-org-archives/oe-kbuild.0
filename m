Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71224886A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 18:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267707; cv=none; b=ZWeBRNptv0rxNn4UC2ZPrWfrne3J4IppVNrl0HIEk5/ECMKGnCbWMrH7br9t8AtNAtsziEuEosSxYugXX1lxEJBEKI4451MwvLHnrzXeKpECRDk1lIf//sqjuTBwQScg64tBHSAarCVm72v0/z58kBet6UAeoNI1RwxGiObypJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267707; c=relaxed/simple;
	bh=T584U8SpSjs0MT5ay6rjnIYTYLg6oeK8tp5lD8xjioU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HevhDaQvZCO2gsb9auv6nyIIxPFSEEYolFsn0owkUwsxrQV15QB3+MjWrFuSp4EDwN3GIvzLPLxAusaKX62hG2AR3KecgKeGf5zbZKuJDuIytAEE8qRNWOPtA41Y8+0tYR4aN+RmmIlBqbP8UfKrwFEx5kVSQk7xCRQDYO0DQqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfmOZgon; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfmOZgon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764267705; x=1795803705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T584U8SpSjs0MT5ay6rjnIYTYLg6oeK8tp5lD8xjioU=;
  b=BfmOZgonsRXN0/y01GL2ti/ita4IoV7nq8n32eQPLTySsQ64SUFsXO4w
   Ukz35EJt8lPVqWzUrCCYdp5iqwJ3DnCX56ORU90MsDyZDbnte3V7+UhpH
   JumdPRS6taT+FBDH+8Xqig1yxXMVXGBstf2nhYaIJrUkZ9x4a1w8RfOl8
   ZlafsdtcI+o6AuoTg/w75IH/kHmzdbauOPVk41bzN1yGFXKfY0RyIZlRV
   MxvL0nKd7pvibszyUytyh0YHT7Gt2p/2s0X2i1g25A+w5kFl0/aKGwiQ7
   4i0FDc/fOwOWjlwcgP50Tc/z1cze+MEbbkIREJdJiktc9YDlTP/bkfnyP
   A==;
X-CSE-ConnectionGUID: t1JFIU/mQ1GzYG+U3WcFkA==
X-CSE-MsgGUID: 70LGwk37RgiRq/5CSELpEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76946205"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="76946205"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:21:45 -0800
X-CSE-ConnectionGUID: dXjDn6BGS8OQMoB5Dm90yg==
X-CSE-MsgGUID: qXnrDuVsQ+2GDnAtxl60mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="197597530"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2025 10:21:44 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOgcf-000000001oL-2dU3;
	Thu, 27 Nov 2025 18:21:41 +0000
Date: Thu, 27 Nov 2025 19:20:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <202511271939.ChI2FFnH-lkp@intel.com>
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
In-Reply-To: <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
References: <20251125-google-manta-v2-2-0f097cfff39c@timmermann.space>
TO: Lukas Timmermann <linux@timmermann.space>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Russell King <linux@armlinux.org.uk>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Lukas Timmermann <linux@timmermann.space>
CC: Alexandre Marquet <tb@a-marquet.fr>

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a23ae0a96a600d1d12557add110e0bb6e32730c]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Timmermann/dt-bindings-ARM-samsung-Add-Google-Manta-Nexus-10/20251125-232335
base:   6a23ae0a96a600d1d12557add110e0bb6e32730c
patch link:    https://lore.kernel.org/r/20251125-google-manta-v2-2-0f097cfff39c%40timmermann.space
patch subject: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20251126 (https://download.01.org/0day-ci/archive/20251127/202511271939.ChI2FFnH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511271939.ChI2FFnH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511271939.ChI2FFnH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/samsung/exynos5250-manta.dtb: /soc/i2c@12c70000/led-controller@42: failed to match any schema with compatible: ['ams,as3668']
>> arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clock-names: ['rtc'] is too short
   	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml
>> arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clocks: [[2, 337]] is too short
   	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
