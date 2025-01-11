Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C491124B253
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jan 2025 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736582958; cv=none; b=KFhzXv8ki71c/yrZmhyyB5Na1n1/bKfJf9Kt4UHyjnsOVZPwBx0dd7Ag3tFuLZHTnPez51wmZtt1i9BJULOUG5qQpz4OiTwCfjo48gJbl16OKOlpBJgSuwTuOsqpG15bBH0KZ40d5zR8K8igHWnLOwGNsV4tBLvcw3kJU+K60Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736582958; c=relaxed/simple;
	bh=bVaDHQXtpPhRZipqa4Pu4z7jNjl6cboqxwh+VUDb2bM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=npwlEg0bInEyn3/phuYpGX8VLtPzSl8czm7myw8nXNFXQVvDqv2iO93tWLI0vGMNhNRS/qBK+54koHaRmXEhJBVfxoHesHuMWt+yQdV8frtMxpk/QlCK6ZpjVYltLAqLYMr42Iiyo5Ihg3Nu2tv+MkbDqAO5SJdla+aSSQl0lpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxQeNgau; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxQeNgau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736582956; x=1768118956;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bVaDHQXtpPhRZipqa4Pu4z7jNjl6cboqxwh+VUDb2bM=;
  b=cxQeNgauNSOs9dErC89+Y5Jd/lDm+W0XlbKhqUYx18mWXYo0P6O/6F/u
   C79sVDz3HSt1eb27wp7e4ClIDhGatYhMfV2FLKqB/Wc0usz1dwIbOjqXw
   rlyY9n8vxUgNRh7QtZUfseZPqdw4lFDyUSoCarwHF87kucfIpbcEF3yJh
   Jm6Kx2jhuz6mgkoJiZA3w6FuZfv2YGS3JdLh11ugoaJormUonkD8J1cnJ
   AdfrdQ7b5Lmai+JUEQM6dGETXYM39Hw14Of9yTIDK+cpXz4T/4fDvoCVI
   6Zp9dqSORRsN9x8qnf9e/DcgrbZ/ru/uFDYrJaruUuSm0DKEv7vif1dMF
   w==;
X-CSE-ConnectionGUID: HKMTld7pRa+foM8TkGWKvA==
X-CSE-MsgGUID: uVLzjzJVR7SFIQPEwCp3bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54425667"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54425667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 00:09:15 -0800
X-CSE-ConnectionGUID: uGItPZbUQcCPQ4X35slEEA==
X-CSE-MsgGUID: WRXuHjOTRUeg1BZEcO+qbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="104125531"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 00:09:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWWYS-000KMl-0R;
	Sat, 11 Jan 2025 08:09:12 +0000
Date: Sat, 11 Jan 2025 16:08:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 10/12] dt-bindings: phy: allwinner: add v853 usb phy
Message-ID: <202501111519.z8AoNkxO-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250110123923.270626-11-szemzo.andras@gmail.com>
References: <20250110123923.270626-11-szemzo.andras@gmail.com>
TO: Andras Szemzo <szemzo.andras@gmail.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maxime Ripard <mripard@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Hi Andras,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on clk/clk-next robh/for-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andras-Szemzo/clk-sunxi-ng-allow-key-feature-in-ccu-reset/20250110-204630
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250110123923.270626-11-szemzo.andras%40gmail.com
patch subject: [PATCH 10/12] dt-bindings: phy: allwinner: add v853 usb phy
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: csky-randconfig-051-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111519.z8AoNkxO-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111519.z8AoNkxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501111519.z8AoNkxO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/allwinner,sun8i-v853-usb-phy.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
