Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCD276054
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Aug 2025 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754523064; cv=none; b=WgHVnnVXGUTn3HMk/mU0aLKrUxiR3IDMIw8xe8AjaKKWmBJRrghE330Ym8n4JXIyZCAYgndiA7+fPIWwyIYXxMfubg1ZeFzMaKB9T9NXsEdG2zYOtZ5nYL/6a7GY2CxddctzOcamY25sV2WBydmq+aJ7lK1x8ZqvHi/G70uZdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754523064; c=relaxed/simple;
	bh=s6I5UKNfsQ5+o2fbYkJsUFP7HL5sBmvtWpVMG6esvCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLUckU/pyaWbKhZwq7MybML5Vhw15buU3kObEuYSp769hI4X4NSjJBYGVdXiRk+mgPf9zFILf5S999PoO+OqrmK8UIavWvshZS0RJkJPgAEXv8sdctEIGUk5DeAlywwi/ir0fiSEWOkrEdtrZFh3EcGPKRY6uedHDxTjUgpuS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bgxj4ypb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bgxj4ypb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754523062; x=1786059062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6I5UKNfsQ5+o2fbYkJsUFP7HL5sBmvtWpVMG6esvCU=;
  b=Bgxj4ypbURTK4ZTwvMSVHyHN+uPsykkKrWTFEWGzg6PVGWiarCFysc5O
   6R4sswLLLZ9gJITBOIYF5v1rS1vkqtitNtpIujgiRWSlzNPCjA2Batq5W
   SaEkmkH5/00qEYd/weBTCfldlCAUbVl4oF3AM30a0ZCpvUzrxY2I+k/VV
   A/kUqla8YHtDmIlWoVA2G7t/HfrgymVPeHD/dCGn1M+QVIeF53ScrWK+V
   389OE0WP6gzCo1V+4lNUPreDG5RNe2MXBCYv/wUOUt6WmgQqCVmptk/QK
   M+aAG2V+aWsLTe7yZbOtLKyKSGw8nw97v8DZHRUPeHr4jdT1BKpX7qR5w
   g==;
X-CSE-ConnectionGUID: 1dXgwBupRSai0egl+IZRxQ==
X-CSE-MsgGUID: VgBMwuulRXaOHIJ+eYdSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60690653"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60690653"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 16:31:01 -0700
X-CSE-ConnectionGUID: Z2Gn5aR0TbuU9Np5g5/cGw==
X-CSE-MsgGUID: FcrAsffgQKSNKgJkdzmBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165238258"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 16:31:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujnb0-0002BO-1q;
	Wed, 06 Aug 2025 23:30:58 +0000
Date: Thu, 7 Aug 2025 07:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: st: Add memory-region-names property for
 stm32mp257f-ev1
Message-ID: <202508070700.XIyzqmd0-lkp@intel.com>
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
In-Reply-To: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
References: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
TO: Patrice Chotard <patrice.chotard@foss.st.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org
CC: Patrice Chotard <patrice.chotard@foss.st.com>

Hi Patrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 038d61fd642278bab63ee8ef722c50d10ab01e8f]

url:    https://github.com/intel-lab-lkp/linux/commits/Patrice-Chotard/arm64-dts-st-Add-memory-region-names-property-for-stm32mp257f-ev1/20250806-161245
base:   038d61fd642278bab63ee8ef722c50d10ab01e8f
patch link:    https://lore.kernel.org/r/20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d%40foss.st.com
patch subject: [PATCH] arm64: dts: st: Add memory-region-names property for stm32mp257f-ev1
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070700.XIyzqmd0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070700.XIyzqmd0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508070700.XIyzqmd0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: ommanager@40500000 (st,stm32mp25-omm): memory-region-names:0: 'mm_ospi1' is not one of ['ospi1', 'ospi2']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/st,stm32mp25-omm.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
