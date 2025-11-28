Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85002231858
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764324776; cv=none; b=n9vvAlljWAEYuTaVpnA862vKCyO8J5pcZzF6gz2ZOQSZluI9Un3c36IQF4TspCazqukF/xrdVLF0gkIKIrY4wlIajqLBLxpq8Gyt1IRX/8V9F3nQNNhUrHmMmE7NYdNmPacgbjNpY/5a6Hd6p3f0uEKCvfNe+hxK1Bx/xPwcCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764324776; c=relaxed/simple;
	bh=8jg5nJUGKHlZEL02litYOxbwOfNijoFdo6VtAqLk5zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L24RVRyRrgJbS4B8Tv7J9tXlb7h7rOA7dqcpf/BUNYY/lJ8ruvhCDw9/T9BFKlz9CINnREzPTXuJXi+AMOX40Pe7Xkn5QSa4vsvYNGql8+AOGPUsVGRh6UBD/Y+gGAA4O3vZh3mG1gNizcZTpHSNcvcAjpkwNUzTQhBhcxhaNLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df62VZ5o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df62VZ5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764324775; x=1795860775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jg5nJUGKHlZEL02litYOxbwOfNijoFdo6VtAqLk5zg=;
  b=df62VZ5oA18zmKsB1GUBiGnqgIAljr9a44uyLHP6tlQALf0ZZNUwvEYU
   HI4GsVsb5pGf8I81OnntMOji18xxSE/vO/wyS0UfY24lRhkaWPEGsaXtY
   b+qJIkKigTEkF6SI0Hm7s0Z05ep126VjQvFZ8slNZ+Fw2pWKTQuGJ4LQ6
   IZ9K0F9JJ4deIh4NFlOmNO8WHbBxhKxNm02td4ej2Wz8M4b/4d9FKrAAl
   moAfrIDjgPk5xSb+o4AI3SUol7WbQGmBQakgU6mMDp2bjzEiKXspZdrgV
   fcrQv/X6SV7DQmdNJFz+00krgZCZIBJP3+ieDAAGJF55fClIJRk7hdpWK
   g==;
X-CSE-ConnectionGUID: KW+/c5pTSy+9ZvxngRlM1g==
X-CSE-MsgGUID: /hrEqrtcTAaING/IEhF7oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83967251"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83967251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:12:54 -0800
X-CSE-ConnectionGUID: xRHcxVyaQ7aC/4nTcpreNw==
X-CSE-MsgGUID: vdWmLDeASo2NfnnsSHYb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197760185"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 02:12:53 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOvT9-0000000020D-0bPp;
	Fri, 28 Nov 2025 10:12:51 +0000
Date: Fri, 28 Nov 2025 11:12:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] ARM: dts: exynos: Add Google Manta (Nexus 10)
Message-ID: <202511281150.2nH9PB7F-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-2052-20251127 (https://download.01.org/0day-ci/archive/20251128/202511281150.2nH9PB7F-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281150.2nH9PB7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511281150.2nH9PB7F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/samsung/exynos5250-manta.dtb: /soc/i2c@12c70000/led-controller@42: failed to match any schema with compatible: ['ams,as3668']
   arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clock-names: ['rtc'] is too short
   	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml
   arch/arm/boot/dts/samsung/exynos5250-manta.dtb: rtc@101e0000 (samsung,s3c6410-rtc): clocks: [[2, 337]] is too short
   	from schema $id: http://devicetree.org/schemas/rtc/s3c-rtc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
