Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EBB1367
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 06:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757141769; cv=none; b=ZM+1dLtlNhTWF94LH2h9J4nyRjzyJRsoXciVQASF0l9z1b7r2IWHR3UQ8JP1coLCs6wqhYgj40jQWRGqEXSJmElYM3fuLPxEZVf3JpsrF+d1w39COXx2fSZlwGI5iU245U+3Qhuv3/zb92bnsCG2sME/eTImS+YaQfgziWQ3Spc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757141769; c=relaxed/simple;
	bh=keTRMjpG15CgkiTHRzzg7/24yHa4SoZyQvEfN9PzP90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SzHiD1F69htbLqlR67qmq3DHp2GRBZvgm8dEzLKnEp+ExF5oH9sxPGukzblaHpfjWa6JpYATrrTp2AFDGREESKHQzqqcWt+AxZsrG0fBWvKbRI7lH+KgvBHUWAVlobKkOLDhoNOP32PYQ5FPGDfEHC/xG51k7oqOqOLT10+BJ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2giwaPT; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2giwaPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757141767; x=1788677767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=keTRMjpG15CgkiTHRzzg7/24yHa4SoZyQvEfN9PzP90=;
  b=d2giwaPTGpkPMkgX21AVi51fnRh9wzP9ZwJUnrBfOHDrOPt7vPb5LDUF
   KmtL/6O0xwkIF30ll0gtmBVrbBKJfJo0v+IYotrysi4a8oAkAL4jiHBFY
   G73rJuiTyTocrIJJcl15x6FcozDM+c414/rCD6T1VpH+2QFt1cmZXfDkq
   073l7fjf280xHVjfueugJHSszZ+JXKB1LYzyt1qd05hAqp7zeovWcv4XB
   sknlACMSooc9heJbnX6fyIdft/B6WjFMCzgvkV/DOL3jXI5OJcH5MsGmQ
   r+W8GGtZgQptkR1cs6UhHcsjTUSt50TKOEe7d3DAGJlQmOafXqPNkbqy5
   g==;
X-CSE-ConnectionGUID: T8iEcV9mRxe9CbPnsTaSyQ==
X-CSE-MsgGUID: SvT7+emYR6iZ3vGsrF8IKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70911990"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="70911990"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 23:56:06 -0700
X-CSE-ConnectionGUID: XKV2lgwSQcmBMvx9gp1oUQ==
X-CSE-MsgGUID: Cb7whxdORvCdbBW1kNrAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="172263346"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2025 23:56:04 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uumqA-0001Gh-1L;
	Sat, 06 Sep 2025 06:56:02 +0000
Date: Sat, 6 Sep 2025 14:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <202509061432.akteO086-lkp@intel.com>
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
In-Reply-To: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
TO: linux-arm-kernel@lists.infradead.org
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.17-rc4 next-20250905]
[cannot apply to arm/for-next arm/fixes arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/arm64-dts-renesas-r8a779g3-Add-Argon40-fan-HAT-DTO-to-Retronix-R-Car-V4H-Sparrow-Hawk/20250905-100249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250905020149.257459-1-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-052-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061432.akteO086-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061432.akteO086-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509061432.akteO086-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtb: pwm-fan-ext (pwm-fan): 'fan-shutdown-percent' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
