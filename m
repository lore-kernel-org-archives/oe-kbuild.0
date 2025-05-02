Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88322ACDC
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 11:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184863; cv=none; b=Fnd6LeOtecVudOh6i8GbOls8LIZewPUK8dhQbmRQuxO9HU3am3rR/EY17+dk9/ul+W3Ry1rUBXqCBushB0l5srp8X64/cdvij7dYKNQmGBHOptqiSZ54dYKGmcb21DoGARBJf2MZXlPh2IHTXgqkWfNr+3/eFre8uZxWJwv6UXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184863; c=relaxed/simple;
	bh=wt6uk4XkxiMyP8xd6dDqZ0JSEIssi4GZCS0fLSWDxk4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQQ/whc67woct3Q3of8g5wQLhfHudWCoETukgm6QRAtS/sQzW8+RH9YNUcVdBc//TPS38ubkvUEKjoqEwK6P5RCmPNx5MRmPWvyt/nQPT3s0ZKyyjrC76xDhLRs2Sm6sgRtHWEW1V/lH44UI8hFZrQwNPk+C3HkP4mREru8hX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGYG9MYz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGYG9MYz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746184862; x=1777720862;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wt6uk4XkxiMyP8xd6dDqZ0JSEIssi4GZCS0fLSWDxk4=;
  b=nGYG9MYzAYlSqLAfyJh4oXLkM6XZFO8skGg8Y+5f7HGp28V6krXKOwzx
   Ol4p1jec7QQifr4a9ywXhBBK8BZwQzI0xbA4HiDSBjI/HCMf28YG2vNcy
   sXIUkKVyGbyTgdaKGFcKvR3N7HnF8tU8zOpZP8WVwDhvO98qU9En6GqIb
   RmqmgLaiPqdfSPv/hmMknnjhERItCgo01yiRlbwLF38ugVdiGvU975nub
   om/h7jFmsFqyQPdXaOo8pVwmixNpfhTdU/ECyAtlfpXt14618XzkQ7A0h
   9YLyYFEPW9llV11u0AXXi/cdJIky5m6pD84EsgFbXYOQDdRRYAJr05rTp
   Q==;
X-CSE-ConnectionGUID: QRlakQPGSvereb91pvJPUg==
X-CSE-MsgGUID: XH7RZ7p/Ts+EpG5CLN+DzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51676894"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="51676894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 04:20:59 -0700
X-CSE-ConnectionGUID: /z/pKDWXS8yJ3Zt4TlkaNg==
X-CSE-MsgGUID: F9sMvIV6TuKSa4ElNVBCvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139427317"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 04:20:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAoRs-0004hX-0g;
	Fri, 02 May 2025 11:20:56 +0000
Date: Fri, 2 May 2025 19:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 5/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
Message-ID: <202505021845.U9TQJxnX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-5-50cd8caf9017@uclouvain.be>
References: <20250421-b4-gs101_max77759_fg-v3-5-50cd8caf9017@uclouvain.be>
TO: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Peter Griffin <peter.griffin@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Tudor Ambarus <tudor.ambarus@linaro.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Dimitri Fedrau <dima.fedrau@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Thomas Antoine <t.antoine@uclouvain.be>

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e48e99b6edf41c69c5528aa7ffb2daf3c59ee105]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Antoine-via-B4-Relay/power-supply-correct-capacity-computation/20250422-021612
base:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
patch link:    https://lore.kernel.org/r/20250421-b4-gs101_max77759_fg-v3-5-50cd8caf9017%40uclouvain.be
patch subject: [PATCH v3 5/5] arm64: dts: exynos: gs101-oriole: enable Maxim max77759 fuel gauge
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250502/202505021845.U9TQJxnX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021845.U9TQJxnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021845.U9TQJxnX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): reg: [[54]] is too short
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): reg-names: ['m5'] is too short
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: fuel-gauge@36 (maxim,max77759-fg): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
--
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): reg: [[54]] is too short
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): reg-names: ['m5'] is too short
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: fuel-gauge@36 (maxim,max77759-fg): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/power/supply/maxim,max17201.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
