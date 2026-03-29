Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0667237F755
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 17:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807043; cv=none; b=Vl/2eQKho7cZP7kJTclR+fQG8IqxghZWBnlwYL+bv2p6/UPtXE9UuChtCDrdVkXmVb4Cu7++3c2AZ/Em3m+pdGN448wmhmxRLnc+d2AenDVm7/yyEe/1cxRpPSUhSd1ZQSzsBgksO/GrQ9kE4IdsPN6tr7g1qN+Sz+JqqYaMFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807043; c=relaxed/simple;
	bh=GKrZfZlAMDnGrlXHGv21SY3WV3C8b2tMUUg92evfLHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdhrtD9pdMpK+fxJLhIheGcb1b744SsKecAjWqQ/9Om3tLBW2kM23wBgaZeTO97MN8YQ6ZBMCYiPcgV3VCLzKJXHmY6yLAYOWqHvpNPzvzxJRdDh4jRQkBHRulbBef7oqMjtvIHbL9X5bCpIpJsMj3HZG+y2aYp4NLbjvFKQ+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2fWq/Wg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2fWq/Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774807040; x=1806343040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GKrZfZlAMDnGrlXHGv21SY3WV3C8b2tMUUg92evfLHo=;
  b=Q2fWq/Wg36zrRlnLymZcEF3tG5x9GOyUgr0jQa/8RVwbcEQuoRDwjtFq
   64KmV5m7KnZU2BmpMuvuVfUp9t2CcIpG9VYWykatOy/P+ZfKd5DzFJeMY
   Cyn99AJjeYIMNe66vajXb5soVJW+iyleQ/F1Kd63u8Z7oNJ/2h1oMME5E
   vJZNa91FjDcjPpyhlgZbnQ18HJufxi/a2mMbshUrUdAhTu3WU+g+aPG/+
   GuJdYEUqFKELEjlCHjXu66RZa8Torlrf/SfaMNOnlphyyEa5j1P0zDL6q
   mU2J8Pz8g009RjKco1k1KDkcijswhdtZwsbFiOZf9IfLqDWHrXm/9YC9T
   Q==;
X-CSE-ConnectionGUID: hZcDQqq7TiCHiFeq2lcNvQ==
X-CSE-MsgGUID: bmNqtoG9TB6iO/jBspa/mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="98420138"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="98420138"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 10:57:19 -0700
X-CSE-ConnectionGUID: kmicYoAaSHapWVuys2Wtrg==
X-CSE-MsgGUID: HiJMJDLEQXSJS+wFZKZAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="248888469"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Mar 2026 10:57:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6uNw-000000007wv-3iBd;
	Sun, 29 Mar 2026 17:57:16 +0000
Date: Sun, 29 Mar 2026 19:56:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to
 dt-schema
Message-ID: <202603291934.lR5j1nZH-lkp@intel.com>
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
In-Reply-To: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
References: <20260327092106.4233-1-chaitanya.msabnis@gmail.com>
TO: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: john.stultz@linaro.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

Hi Chaitanya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Sabnis/ASoC-dt-bindings-hisilicon-Convert-hi6210-I2S-to-dt-schema/20260329-002801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260327092106.4233-1-chaitanya.msabnis%40gmail.com
patch subject: [PATCH v3] ASoC: dt-bindings: hisilicon: Convert hi6210 I2S to dt-schema
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-2051-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291934.lR5j1nZH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291934.lR5j1nZH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603291934.lR5j1nZH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/mailbox@f7510000: failed to match any schema with compatible: ['hisilicon,hi6220-mbox']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc0@f723d000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc1@f723e000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dwmmc2@f723f000: failed to match any schema with compatible: ['hisilicon,hi6220-dw-mshc']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:0: 'tx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): dma-names:1: 'rx' was expected
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/hisilicon,hi6210-i2s.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/ade@f4100000: failed to match any schema with compatible: ['hisilicon,hi6220-ade']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dsi@f4107800: failed to match any schema with compatible: ['hisilicon,hi6220-dsi']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): 'reset-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: gpu@f4080000 (hisilicon,hi6220-mali): resets: [[18, 1], [84, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: reboot-mode-syscon@5f01000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /pmic@f8000000: failed to match any schema with compatible: ['hisilicon,hi655x-pmic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
