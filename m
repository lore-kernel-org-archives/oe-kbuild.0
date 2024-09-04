Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE42E1CC886
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Sep 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440963; cv=none; b=Xd7/e+Ix5GvgGAh8SbwjcpLHjda5CtSvRuTE96Qae2c9BPjpLABU3eB5xgZbR01NbF0pBr499Vrc6amSg2Fc+rZGIcpz3Gkmw5sZaIIMe0PvWt0XsyDhMGHP79R6d03cmFG7Zd9RN7Ufwor9Lrqo9ndNJatc0QMZ6IUj/iPO0Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440963; c=relaxed/simple;
	bh=riEx/b8bocvmYsC7Lw2BdxWL6sET35KVe1CM9YrnfBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XviXfFuoYpzo6weCCda7cRnjYVgywrWd/o5lFWvU7IgD1Lu8l87J20r1LCCnL4emQCjKRm68nDETAHU5KmqCaTatGzFJ+n2XVIp1bw6KY/lkmPLC6J6lEoqpwpfsfc2VbMRn8Sfh4dNW9KZt/TEUNpsby7VzcmSdUQyW87zEvd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqziMeOQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqziMeOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725440961; x=1756976961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=riEx/b8bocvmYsC7Lw2BdxWL6sET35KVe1CM9YrnfBk=;
  b=lqziMeOQt0uziHJSGZZcyu3vNWehfrGZXw51+1VX1BRA37YjiSU55D++
   ymkGjCI5jMAhUU6dVdsmXgH+RAUbQpggWjDK7Nu4FgB0hud6XUQhITZCf
   9BTd5XpU6v/jP2jksLCImLaSHjbxUUrJkL97hKk6rEtp8THD604NI5l2b
   sr8e18BjDlq9WFtoZe5G5egxDFixgCjFD1gr6MDL9K9/GGCmsjY8QC40h
   mWdjZkn/GCPEPDufuzO7nWmB8pXBpOeXrGBejRmY1ZDqwusyh8hD0weec
   x7ad26BX9De+IEn2/o91NK2JfRycvieOBRpyw1z0xQyQiE3j+0BC1Xbjm
   Q==;
X-CSE-ConnectionGUID: yjWcK6NLQRKd1vckmMpDZA==
X-CSE-MsgGUID: zwhNq2+pQiqYj3FOSdZ3XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27849683"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="27849683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 02:06:04 -0700
X-CSE-ConnectionGUID: 6HVYFKoiTPWImzuID8Y6wQ==
X-CSE-MsgGUID: 7d/wHEUMSN+EIOFHbUjQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="70011679"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Sep 2024 02:06:03 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sllxh-0007mm-1P;
	Wed, 04 Sep 2024 09:06:01 +0000
Date: Wed, 4 Sep 2024 17:05:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Add MT8186 Ponyta
 Chromebooks
Message-ID: <202409041611.hKfIKxu4-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240903061603.3007289-3-cengjianeng@huaqin.corp-partner.google.com>
References: <20240903061603.3007289-3-cengjianeng@huaqin.corp-partner.google.com>
TO: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
TO: angelogioacchino.delregno@collabora.com
TO: matthias.bgg@gmail.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: knoxchiou@google.com
TO: hsinyi@google.com
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>

Hi Jianeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianeng-Ceng/dt-bindings-arm-mediatek-Add-MT8186-Ponyta-Chromebook/20240903-141800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240903061603.3007289-3-cengjianeng%40huaqin.corp-partner.google.com
patch subject: [PATCH v2 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-001-20240903 (https://download.01.org/0day-ci/archive/20240904/202409041611.hKfIKxu4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041611.hKfIKxu4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409041611.hKfIKxu4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi:121.14-128.4: Warning (unique_unit_address_if_enabled): /soc/i2c@11009000/trackpad@2c: duplicate unit-address (also used in node /soc/i2c@11009000/touchpad@2c)
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:401.14-407.4: Warning (unique_unit_address_if_enabled): /soc/i2c@11009000/trackpad@15: duplicate unit-address (also used in node /soc/i2c@11009000/touchpad@15)

vim +121 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi

09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  116  
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  117  &i2c2 {
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  118  	i2c-scl-internal-delay-ns = <22000>;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  119  
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  120  	/* second source component */
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26 @121  	trackpad@2c {
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  122  		compatible = "hid-over-i2c";
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  123  		reg = <0x2c>;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  124  		hid-descr-addr = <0x20>;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  125  		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  126  		vdd-supply = <&pp3300_s3>;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  127  		wakeup-source;
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  128  	};
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  129  };
09828b16d0b50d4 Chen-Yu Tsai 2024-01-26  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
