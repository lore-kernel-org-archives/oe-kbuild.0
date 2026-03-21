Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2140DFB2
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Mar 2026 01:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774055028; cv=none; b=m3ki7EYqrPjAucJekWEssVqW9cqWFkt6/+XV2va/QDleyUlGqDT64IzifPF4ImmOcMpD3Be9gz+U+vRwA/5IX/2sYgLrQOxg5XGs0Ltulym0vrfavBlMLlF3hAoN/F8mJx7oYbuxVRk2oVjZWV7YVHvTc+2a0TC31lH2aEen9rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774055028; c=relaxed/simple;
	bh=Zph3b/a8wUaOe2iOCc55A/A2OnhMXsrvLGy43bJ/Liw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ah8LnU38CgvShKCUJt7/Zhd1Bo5wadZyZx/wF0q2wOBcIQwZWCpxSq5duPW2CpywXIGNs/GShGXlciGPojYAaJwgfZq2AdPxeFy8WUKjCffu/CioTr4NHL0YfxLHPdpWv8MzJt3obU2UDezLTVMGxTDlXpm8HIvGQnjbz/2bms0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gza1gdXp; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gza1gdXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774055026; x=1805591026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zph3b/a8wUaOe2iOCc55A/A2OnhMXsrvLGy43bJ/Liw=;
  b=gza1gdXpE7uUb4tBpHTvZKRFLft/XliQ8b8ya5eFC2PEkBfMVsqDi/0U
   4z7e+gUCmITleUIuMAmlT9hQ7tL+Dj2iFquonuH166Irxqpfa9brnMkNM
   WNH2t+3T227F/MTSyWpU5QNPB1lXptbRWZhfQXXL50jcaGwyfpkBx+l5j
   P5l2kv4OBhOLvMv9/gY2nAQ81F35YtufEKTejcFf4GkLw85F78LF7mq0b
   BWpDpICgbWGNCJNY7zApDUT9nj1gfMQYZej/dLPGAOQCstmeYwfBUcYtV
   ysItLD36j3L15q/DxrOf78qzw0ab8MSWBUacyw98ujOBeyCv6WTh2Pnrm
   w==;
X-CSE-ConnectionGUID: fzoanJX4QrSW5yU1H+Tqsg==
X-CSE-MsgGUID: 3v56zuhUQLG9YkbPxVtLNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86510445"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86510445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 18:03:45 -0700
X-CSE-ConnectionGUID: RDULRqXKST+ZTn/CRoOAOg==
X-CSE-MsgGUID: r44xcLj0Tc2kiBudWtWGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="222668821"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Mar 2026 18:03:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3kkg-000000005FV-1Fc7;
	Sat, 21 Mar 2026 01:03:42 +0000
Date: Sat, 21 Mar 2026 02:03:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: sound: Convert Hisilicon hi6210 I2S to
 dt-schema
Message-ID: <202603210112.cGdwd3kr-lkp@intel.com>
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
In-Reply-To: <20260318181303.5262-1-chaitanya.msabnis@gmail.com>
References: <20260318181303.5262-1-chaitanya.msabnis@gmail.com>
TO: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

Hi Chaitanya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaitanya-Sabnis/dt-bindings-sound-Convert-Hisilicon-hi6210-I2S-to-dt-schema/20260320-024434
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260318181303.5262-1-chaitanya.msabnis%40gmail.com
patch subject: [PATCH] dt-bindings: sound: Convert Hisilicon hi6210 I2S to dt-schema
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2051-20260320 (https://download.01.org/0day-ci/archive/20260321/202603210112.cGdwd3kr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603210112.cGdwd3kr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603210112.cGdwd3kr-lkp@intel.com/

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
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: i2s@f7118000 (hisilicon,hi6210-i2s): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
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
