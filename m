Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B759264628
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 11:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045882; cv=none; b=Npz12TwAUjDpc2DV4BYG3F8NmEHim8I5kmuhjZHEWsJ4KLrzhoCxdIP6NFQuiliLiqHwde/MEGdxnGvzoD+KQlIhbmA1o9REqzJK6WWuSZZs8J3MU5uDD8tvwbSXsTFqbecf4216+vIpdkGhqJmfKQqwKnXPGJxaaudBdID/s6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045882; c=relaxed/simple;
	bh=qJWKll7lnF44IX8dXzdZiVouCDVQQt5oeITeH/QILLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tpGZ3womOSr5yKT+y8WFXfKxZ/Cmf4nhSRThnk5HDZiwEvcdVV2wMi6A47x/MPRo4boo+xWuscOhEnrRlGBXaWUhqALpF9NO7OkVCB2Xd9er/KoiGjQcIFU8YPVnMuBH/vp2uFLZeUUuvIS7dp7DRn5kBs85HEEppgmcmUEFKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aX+sC5Cf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aX+sC5Cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761045881; x=1792581881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qJWKll7lnF44IX8dXzdZiVouCDVQQt5oeITeH/QILLg=;
  b=aX+sC5CfQZr4CXIBG9+54fO1Xtcbp2/7XGuPSKiRksmkoQqNsbFI3pY2
   rIikUUIDUEUSf0QVGzDfW+oOEVg2Jp+gp7FAzjRAzpvsXG7R7xt1+mkW6
   tU/+FwooLDl3dgUOh7rjzb0xzIyvT//iQ0V0VbFu+pDcYVzSORWTN3nnf
   fK5qDsDvxo4745AGUzPhhR+jJxhvYeoG2XiovJJ4N088J+gEnZ/KiiBbH
   0NRgY4rZVIoDwps6OzQgJ8ycWB04JICdw6J9KBmZUfi7UNi0hy4RF+KPU
   y0bQDSubfagStiFNo3xRh+lWwB7uUFig2nxfdteuTplvX+TknoohjdS+2
   g==;
X-CSE-ConnectionGUID: h48jsbJNQbGz9AwuskCexA==
X-CSE-MsgGUID: tNr03zgNSNCcidDhWelTwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80607618"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="80607618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 04:24:40 -0700
X-CSE-ConnectionGUID: ghH5eEgkRVWYArXk8QXFYA==
X-CSE-MsgGUID: Y4USMatRT5Gg/XCAhboTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="220737773"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2025 04:24:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBATY-000AmL-14;
	Tue, 21 Oct 2025 11:24:27 +0000
Date: Tue, 21 Oct 2025 19:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and
 S5K3M5 camera sensor
Message-ID: <202510211928.d8co5NHV-lkp@intel.com>
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
In-Reply-To: <20251013235500.1883847-3-vladimir.zapolskiy@linaro.org>
References: <20251013235500.1883847-3-vladimir.zapolskiy@linaro.org>
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.18-rc1]
[also build test WARNING on linus/master next-20251021]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/arm64-dts-qcom-sm8550-Add-description-of-MCLK-pins/20251014-075814
base:   v6.18-rc1
patch link:    https://lore.kernel.org/r/20251013235500.1883847-3-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH 2/3] arm64: dts: qcom: sm8550-qrd: Enable CAMSS and S5K3M5 camera sensor
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-052-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211928.d8co5NHV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211928.d8co5NHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510211928.d8co5NHV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3928.27-3983.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:4097.22-4187.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: /soc@0/cci@ac16000/i2c-bus@0/sensor@10: failed to match any schema with compatible: ['samsung,s5k3m5']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
