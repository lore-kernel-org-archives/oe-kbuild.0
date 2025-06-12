Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B614A8B
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708983; cv=none; b=cBCUPO7l4KltSDmpgKJ4ttkxpLVNjCz/ArEWVihDaYPu3IOoUBHAB5aQER9Gb3hgedZpympKBoe++jSqfn9MRF7peWumQDsbrDGW8pByWmSRikXp9J8ityDym1mVj2DKbnvgayQCOFRUtNFcnB+bFXhPEJhkoDBDT+WcDnvmYdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708983; c=relaxed/simple;
	bh=GIyt+ZTEB4sONmdDS+ZILNMrUtxrVRMjRMr5QRZOM5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjtzoaAg+gDAwvPq8vQOqWjjprKzDTvKVXFrcFWnjD1pnm57icMVVHvjvijTNtfbLqK3dOIGyfwxu8tFHtDR7UL19BZiU3lfkYXZNo1a9Ss0LTzFBYhfnpq3LX7anyuJd3uc+rHQ+gTj0SuwavjjTAGDFcIaMi4kjELIcKAoBVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gz/yupBA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gz/yupBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749708981; x=1781244981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIyt+ZTEB4sONmdDS+ZILNMrUtxrVRMjRMr5QRZOM5I=;
  b=Gz/yupBA8AqusYQZCKOFYGq0pgu4dBQ+hCuLInr8uR+yfmPLCxs99UeI
   Vk35I3PPi5tUj4JH4pjh8lB+zGbU+3hQJKWA5j4UdWosRyhZvQcLqhii8
   yGepPx3ZrAK02rD+MMCKt/lLYv1LXj5dsu+F+i+sNreLv4o85GnPBzO9u
   zJ4JUMD1GDQFC/YzZTgoIpt1wRy66BFZmtfuy//ixa/yYmeeu7zlxZcMk
   0WK/CvWr1I2ET+nk7TaPfyTcJk8DKEAUIdiVWy0gAgpNSn4mPvL1fTkXI
   e1wpQV6v9AbzhDt32vgcXc19crJbam8YUyfhJ89DNebHAH1moHpUp1PEN
   Q==;
X-CSE-ConnectionGUID: ynrIoi6gR223tZ/PcHlEmw==
X-CSE-MsgGUID: tNPIocLcS3uFjKivAiE4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51740934"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="51740934"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:16:21 -0700
X-CSE-ConnectionGUID: Hivuy77vQGiNIO0pYXteYQ==
X-CSE-MsgGUID: zSu77wqATHmYtOw/1AR+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="151227583"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2025 23:16:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPbEX-000BC2-1V;
	Thu, 12 Jun 2025 06:16:17 +0000
Date: Thu, 12 Jun 2025 14:15:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
Message-ID: <202506121427.HiVP7wbb-lkp@intel.com>
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
In-Reply-To: <20250611073454.978859-3-shgarg@nvidia.com>
References: <20250611073454.978859-3-shgarg@nvidia.com>
TO: Shubhi Garg <shgarg@nvidia.com>
TO: Lee Jones <lee@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: --to=jonathanh@nvidia.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rtc@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: Shubhi Garg <shgarg@nvidia.com>

Hi Shubhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on abelloni/rtc-next linus/master v6.16-rc1 next-20250611]
[cannot apply to lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shubhi-Garg/dt-bindings-mfd-add-NVIDIA-VRS-PSEQ/20250611-164642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250611073454.978859-3-shgarg%40nvidia.com
patch subject: [PATCH v3 2/6] arm64: tegra: Add device-tree node for NVVRS PSEQ
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250612/202506121427.HiVP7wbb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506121427.HiVP7wbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506121427.HiVP7wbb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi:11.3-29: Warning (alias_paths): /aliases:rtc0: aliases property is not a valid node (/bpmp/i2c/vrs@3c)
--
>> arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi:10.3-29: Warning (alias_paths): /aliases:rtc0: aliases property is not a valid node (/bpmp/i2c/vrs@3c)

vim +11 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi

ab9cd79d418fa2 Dara Stotland  2024-08-26   4  
5862ae43a16e96 Mohan Kumar    2023-06-20   5  / {
5862ae43a16e96 Mohan Kumar    2023-06-20   6  	compatible = "nvidia,p3701", "nvidia,tegra234";
5862ae43a16e96 Mohan Kumar    2023-06-20   7  
57cfb0aba290cb Thierry Reding 2023-12-19   8  	aliases {
57cfb0aba290cb Thierry Reding 2023-12-19   9  		mmc0 = "/bus@0/mmc@3460000";
57cfb0aba290cb Thierry Reding 2023-12-19  10  		mmc1 = "/bus@0/mmc@3400000";
eaae639444b081 Shubhi Garg    2025-06-11 @11  		rtc0 = "/bpmp/i2c/vrs@3c";

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
