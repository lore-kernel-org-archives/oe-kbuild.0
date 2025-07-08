Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910DC21A428
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Jul 2025 03:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751944687; cv=none; b=FpmHpMaRZdRtkCIbue0H5a/b5qejnOhIKe5ENGAhpKAO36oxbnWml+1PAcgQ6BK6ugHgLvYtYw1donnJbqwXxKjb+Cmq8Ex0VbZf2KiQYHn/7ZapkRURkE1xMAjtz0c87ZUQtxp+2WI0CcOy8EPrTCTRh8jnuusUOsxSWmVb9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751944687; c=relaxed/simple;
	bh=qxIWuj68OeK5vk6DmLsFBpQlwM0K4FVkQseGi/wf3eA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nIWtMQYQHvQNnZVz0fZEYYWeHRn6GIQf4/QeFlSnyPK4LQYsuf9vWKXMjD3Y9HjuIC0QnaEwS5QRkHfse42exeybd4eIDxQGr1oR62cOI3KEHMXWlJIeNbF3V/KWUhTyKWJxBa0SwUlJ5sarB2uFL5c1oALdH2gqo5ea0SUkKA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh179mm/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh179mm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751944686; x=1783480686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxIWuj68OeK5vk6DmLsFBpQlwM0K4FVkQseGi/wf3eA=;
  b=jh179mm/my8biUReGyUagW8gg2O0Haxt2TFm44HAiG4M91EpONk0YEVw
   cSLFVinjn3gxF0Y5Y/AsKnAPvpROib/el29sRZhMAus2t/q+UJmaMrvPI
   1/hZZp2hFRMvonO+W+LG5SR8l+3evUlriMcBZxMYWceeUUQBEOHLQ3gk7
   bYiHfxSxXp0cK38WsljEjHB/7pxmVox5PbRRbliZ1NnkXBZGv2jQQcGaQ
   x0uyTURDL/nvY8aWW+EFxyljcBNpLZTz32d9SnQEX/UnFYLLk47E2+0Zd
   JDKLO5WCIgGpBV4LzkKChvLT6ItEYKFSDC6XhFq/VLbBKKUwqxZtTMqL9
   g==;
X-CSE-ConnectionGUID: jaTnt1KHQEazsWXx5yfttg==
X-CSE-MsgGUID: Myj6m1wQSySFG6ivHou47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65631229"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65631229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 20:18:06 -0700
X-CSE-ConnectionGUID: 8yKLA4f3TTC0PXGqwttdhg==
X-CSE-MsgGUID: jQ4pM6dgRQWmo8AC8h9/Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="160928152"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jul 2025 20:18:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYyqH-0000wx-1w;
	Tue, 08 Jul 2025 03:18:01 +0000
Date: Tue, 8 Jul 2025 11:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 6/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami Basic Carrier
Message-ID: <202507081055.HbWELO82-lkp@intel.com>
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
In-Reply-To: <20250705213900.3614963-7-lukas.schmid@netcube.li>
References: <20250705213900.3614963-7-lukas.schmid@netcube.li>
TO: Lukas Schmid <lukas.schmid@netcube.li>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Maxime Ripard <mripard@kernel.org>
CC: Lukas Schmid <lukas.schmid@netcube.li>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Hi Lukas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.16-rc5 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukas-Schmid/dt-bindings-arm-sunxi-Add-NetCube-Systems-Nagami-SoM/20250706-054253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250705213900.3614963-7-lukas.schmid%40netcube.li
patch subject: [PATCH v1 6/7] ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-054-20250706 (https://download.01.org/0day-ci/archive/20250708/202507081055.HbWELO82-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507081055.HbWELO82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507081055.HbWELO82-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dtb: dcxo-clk (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
