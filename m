Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F262836F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760220462; cv=none; b=E4Nv/6/4wGNGnmxIIAYMZASX3lxTztedaWj+uSKtwgZbpg3Rw6kVo6ckT8xp09uIFbQlW9UsUjLAuTDn0NJjzJqABFrUAPt8g50Ev2phYfaBI/2/PGRtL3QaO6hhgNtNovdod5KUfFUDJOlijZkzAfnhplvZDhfwaKW5GjbOjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760220462; c=relaxed/simple;
	bh=h4BuaJpWPIrI8Jy4SnUvT7d6SldiBCzIH95uEQUTZqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GsH4sogk4NWEHbmLuaorWaT/ax1/zzsdtEZNHpDdisy3mSHsFxrdfnlU4z/X1IQds8Hi74HSnp088no87DvBK5UZWvSSB0oMyLEVyTNuBX47hPqwuEsby6P9Sf4yRv+nKRWvG2+nV/AjN4yH1sAP/1bA/tLr5Vg8SpOvSq1f6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMkTlAPC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMkTlAPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760220459; x=1791756459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4BuaJpWPIrI8Jy4SnUvT7d6SldiBCzIH95uEQUTZqc=;
  b=dMkTlAPCqShkXggmrM/8qYsqJnKGhSW0XHwC1eg39OvmVUeA+3Rni0Ax
   OeGyGb9xvIC1oqoi+/aS5B9cxFO8yCFLVgmAq2iVn5Kqq4o3K8AjPPg0r
   BD4pALAKFRQqI6UwKoXjnSfVJcm/Luii8Vus5IIATgMpsdpV7D+MlDIbA
   GmsyUjzbJteZmCBmG2NR88faa08lN3x/bYSMntjkGzogJemAQ4+9vEed0
   2tmbmE10wwSv+QGXyhER9WQZ4zIWqLHIdn+i1G3gKudqOJuQuwR/L9UgD
   uHJ5fQOQWy5esKcpAkv5ocqOAzTj5jbjuTxUOUXYsI6rke8u6AtBiBK/W
   A==;
X-CSE-ConnectionGUID: /nchStWxS6SXvB+vweRsoQ==
X-CSE-MsgGUID: vHNuHaIjTdaqv/Ea3VoNeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62345853"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62345853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 15:07:39 -0700
X-CSE-ConnectionGUID: J3FQ7M1IQwmdW8lb3YnEPQ==
X-CSE-MsgGUID: Pkr6P1OBTEK/jg9m0oltPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="218363436"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Oct 2025 15:07:38 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7hkV-00040h-2X;
	Sat, 11 Oct 2025 22:07:35 +0000
Date: Sun, 12 Oct 2025 06:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8450-hdk: Enable I2S for
 HDMI
Message-ID: <202510120513.Z01d6R7A-lkp@intel.com>
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
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e@linaro.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 7c3ba4249a3604477ea9c077e10089ba7ddcaa03]

url:    https://github.com/intel-lab-lkp/linux/commits/Neil-Armstrong/ASoC-qcom-qdsp6-q6prm-add-the-missing-MCLK-clock-IDs/20251010-040100
base:   7c3ba4249a3604477ea9c077e10089ba7ddcaa03
patch link:    https://lore.kernel.org/r/20251008-topic-sm8x50-next-hdk-i2s-v2-4-6b7d38d4ad5e%40linaro.org
patch subject: [PATCH RFC v2 4/6] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20251011 (https://download.01.org/0day-ci/archive/20251012/202510120513.Z01d6R7A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120513.Z01d6R7A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510120513.Z01d6R7A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3508.27-3581.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3602.27-3656.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: sound (qcom,sm8450-sndcard): clock-names:0: 'primary-mi2s' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
