Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7118B467
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737237432; cv=none; b=Cc/yL2Ttn/6X0mHJQ6olJyBeQUqY3qgq3LJurpThqEd3mtFbhyHsItP2XDK0ffGo13CKTzzV1X9AgU7QRJEEQ671uLNKBESKzcuAIPVsRcuIW4dJmM3jUaeFWPoMHRGCw1JU/Y+ZLd/4IEEkLEFIjgFHRjTpQhGXSkztXoqcc/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737237432; c=relaxed/simple;
	bh=EHbOwsTTU/Z9F2KZGDH/DghCtdehgNCQ5qV2ygc5lmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJACNyiIprcZPQypENxVUvCM1J9u0k9quhtr8l3ecv0Mf5gYMgEPA8abWDJ8VFQh9iWK59Vk0AykT9GHMxW5SKRjOUjhIl3Aj5st7QKO9xGZZcSvJ7+x5CfA+ieG6D+frhqI25/myH8WoZl4Is+FF4fiOJgMiI54HuXHHUUzfW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0BuqVRf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0BuqVRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737237429; x=1768773429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EHbOwsTTU/Z9F2KZGDH/DghCtdehgNCQ5qV2ygc5lmY=;
  b=U0BuqVRfpibNYPUXofvcqgroKA5TkbLbGmp1xcofuB2mrsfFQ02BuY8v
   HyKOnrScp5K90BUy+HfcUqlUkKwpEXMJVw+PTfj5X9+H4LpRxD3epHhFT
   XUoqlfzwIBJZGk+8frguucjEUQbGScDpeSwaCBWEblyF1Qk1xYoxACDc0
   A0jze7PV5rufJUmgz1X8UHH82kXRiS0pXhhXCcq+pIXzOrzhWRBoVcIoh
   SHNKZyRFM3M9mhn8RTBYH1wc+Hy4+096aewJagw4KlZFs45AzJMv35aO0
   /S/lzUZWp8SFcSQGdOUXTE+A/7CWmRibdbZfYlFT4NZKrVNG5AEufHE+w
   g==;
X-CSE-ConnectionGUID: x5YPdqF8S9qD88Zi5jtUEw==
X-CSE-MsgGUID: SimGeODWTV6/shl25KBxKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="49039710"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="49039710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 13:57:08 -0800
X-CSE-ConnectionGUID: sZ0mzTWAQD6PlqbaZEyh1g==
X-CSE-MsgGUID: 5faiDRFkRDChgECsP6cowQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106714455"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Jan 2025 13:57:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZGoS-000UqV-2b;
	Sat, 18 Jan 2025 21:57:04 +0000
Date: Sun, 19 Jan 2025 05:57:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-next 11/20]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: Unevaluated
 properties are not allowed ('dr_mode', 'maximum-speed', 'phy-names',
 'phy_type', 'phys', 'port', 'resets', 'role-switch-default-mode',
 'snps,dis-del-phy-power-chg-quirk', 'snps,d...
Message-ID: <202501190507.wGr1ugzT-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Bjorn Andersson <andersson@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   70cd0576aa39c55aabd227851cba0c601e811fb6
commit: 6d7965fb5cde90a6ef7bbbf0b3debb33a196cf9d [11/20] dt-bindings: usb: snps,dwc3: Split core description
:::::: branch date: 31 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-051-20250118 (https://download.01.org/0day-ci/archive/20250119/202501190507.wGr1ugzT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190507.wGr1ugzT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501190507.wGr1ugzT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/dwmmc1@ff37f000: failed to match any schema with compatible: ['hisilicon,hi3660-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /soc/dwmmc2@ff3ff000: failed to match any schema with compatible: ['hisilicon,hi3660-dw-mshc']
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: snps,tx_de_emphasis: [0, 0, 0, 1] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: snps,tx_de_emphasis: size is 32, expected 8
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: snps,tx_de_emphasis: [0, 0, 0, 1] is not one of [0, 1, 2]
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: resets: [[31, 144, 8], [31, 144, 7], [31, 144, 6], [31, 144, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000: Unevaluated properties are not allowed ('dr_mode', 'maximum-speed', 'phy-names', 'phy_type', 'phys', 'port', 'resets', 'role-switch-default-mode', 'snps,dis-del-phy-power-chg-quirk', 'snps,dis_enblslpm_quirk', 'snps,dis_u2_susphy_quirk', 'snps,dis_u3_susphy_quirk', 'snps,gctl-reset-quirk', 'snps,lfps_filter_quirk', 'snps,tx_de_emphasis', 'snps,tx_de_emphasis_quirk', 'usb-role-switch' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: funnel: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: reboot-mode-syscon@32100000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: /pmic@fff34000: failed to match any schema with compatible: ['hisilicon,hi6421v530-pmic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
