Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CBE11712
	for <oe-kbuild@lists.linux.dev>; Sat, 10 May 2025 04:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746849696; cv=none; b=pEGAMXgd8wPsgix0gVODALayXqBtKvMASFedCzXYzf6lXizTu9hTds5c5VZ/s+gQugqkCDT1yl4tiszLuTc+TfiauhcZVmrRcInHDCZy80qJJA4uC6FCc4v2ysmloebhpgM+LYmVNsyVwArW/1iJC3H2XUonLbCE0FtlPoOcEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746849696; c=relaxed/simple;
	bh=pSZBbAAMIPLhs1QC216LBVJMnVNMfBXoIAdn3TvG34k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLCxDt7pCLp9xfcyhfevZriEVzw8z6+tYv+xfo+2GWkznFkodF692lmvtnuLnadRg23n/dpNGaI81+W21gq/Zy2ZBf96QcKF3gJmAcTmsBa24Keo8MIVpc+brwR4A5er+lREj403MsLEbdSqgA5lJ1lbV2PC+kGV6BjlCbds+rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFs2i4cX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFs2i4cX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746849695; x=1778385695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSZBbAAMIPLhs1QC216LBVJMnVNMfBXoIAdn3TvG34k=;
  b=bFs2i4cXBPdDZjHhIZQE23f+BPdtY+EWNCECzLvIhKW6j2UL2tWmshX2
   oG6S6MAUpUXw+oVYQkBjNUWddKnJi/23CDZci2VYT8qwUAkxz5//PrVsu
   ZzGc3+XLbcvM+P/t60er9wdaH47DLLJdeaKz72nJwRFNlQpcbDV9Y9buu
   ssU5h7KYD8OJvWjUIc+Wbrfkr+lOpluVzD7ZN7WaynZ5wUpKgsCOsE/Gr
   xecpsQQPvBbxU6LLFWEywoYSVNf+0icstzqa5SaLHLOpRqKC1E+6SVmGb
   fKonBTrUASIyHFe/AkH5xpS8gh2xK3CeZyxjwOerhTJws6Gp0ZVMjGCEU
   w==;
X-CSE-ConnectionGUID: vOwcrg49QUqP7ADD4hKZ3w==
X-CSE-MsgGUID: sFBY4vTTS76HLA+F/CObGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59322526"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="59322526"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 21:01:34 -0700
X-CSE-ConnectionGUID: W1sNEjiqTLarXAGRcwPU7w==
X-CSE-MsgGUID: 6BlEjFHIQxClUDbspLrWdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137296530"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 May 2025 21:01:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDbP0-000Cm7-1h;
	Sat, 10 May 2025 04:01:30 +0000
Date: Sat, 10 May 2025 12:00:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/4] arm64: tegra: Add EMC timings to P2180
Message-ID: <202505101149.RJOfvqyi-lkp@intel.com>
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
In-Reply-To: <20250508-tegra210-emc-dt-v2-3-d33dc20a1123@gmail.com>
References: <20250508-tegra210-emc-dt-v2-3-d33dc20a1123@gmail.com>
TO: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-tegra@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Aaron Kling <webgeek1234@gmail.com>

Hi Aaron,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8bac8898fe398ffa3e09075ecea2be511725fb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Kling-via-B4-Relay/dt-bindings-memory-controllers-Describe-Tegra210-EMC-Tables/20250508-141240
base:   8bac8898fe398ffa3e09075ecea2be511725fb0b
patch link:    https://lore.kernel.org/r/20250508-tegra210-emc-dt-v2-3-d33dc20a1123%40gmail.com
patch subject: [PATCH v2 3/4] arm64: tegra: Add EMC timings to P2180
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250510/202505101149.RJOfvqyi-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101149.RJOfvqyi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505101149.RJOfvqyi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:18.20-1260.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@40800: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@40800)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:1261.20-2503.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@68000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@68000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:2504.21-3746.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@102000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@102000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:3747.21-4989.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@204000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@204000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:4990.21-6232.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@408000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@408000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:6233.21-7475.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@665600: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@665600)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:7476.21-8718.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@800000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@800000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:8719.22-9961.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@1065600: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@1065600)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:9962.22-11204.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@1331200: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@1331200)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:11205.22-12447.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@0/emc-table@1600000: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@0/emc-table-derated@1600000)
   arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi:24886.20-26128.6: Warning (unique_unit_address_if_enabled): /external-memory-controller@7001b000/emc-table@1/emc-table@40800: duplicate unit-address (also used in node /external-memory-controller@7001b000/emc-table@1/emc-table-derated@40800)

vim +18 arch/arm64/boot/dts/nvidia/tegra210-p2180-emc.dtsi

c20eabce47f6fe Aaron Kling 2025-05-08 @18  			emc-table@40800 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
