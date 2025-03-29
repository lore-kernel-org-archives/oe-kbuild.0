Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F55E1EB3D
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Mar 2025 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743255512; cv=none; b=hGF7rR0wevcibT+P+tFPVWoqXcln3rJZm0DHUvDjE5Rq82vK2p2LBt8X1caXwx880qGGcEvG+zqamuJol3utncf2qb9CglpO0lBCEyl0/Ax8Yalc24EShK3KEqJC/3Ys6YGvlRYIdtxTYq37nQuiVY94oP8sA/1hY64DeuUApbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743255512; c=relaxed/simple;
	bh=3GG2UFwOhrbaBMbDv4QVSGu1U/EWt5MFZD4I2OKZuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oo8Pfsid4JARBa2JbBFU2uDGA93AwHEoH2yhZ+51f10KQmtboDffk7mRt8cXNXIEKGXuuFknpyad9nx4AgKibWdMpLEd+dENQYNQWC2L4gDV8wRvK/LmCQGJxUbx3VYvBaX6fQANa9ZolYPKPi6vWPBNvfwCT/qcbQqKiq1sWK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GS6k3k87; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GS6k3k87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743255511; x=1774791511;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3GG2UFwOhrbaBMbDv4QVSGu1U/EWt5MFZD4I2OKZuSY=;
  b=GS6k3k879+inAhuocdc5sgQAdl4wLIcFhubpef16xOwk7YcOZlcVYbSr
   XbhMqjewm7/fq8BHAlWMh8MRNM4Am7PIJH51KI4Igv/azWGiguOe8/TQS
   BsWjHAItNQG3Rg9YevLvx6vCVg0f7My+z6LQMhXU/DQwCaV8aen/LOCNy
   9i1bV4sL/d4YAH+Xo8fK/l9Rk1ms10Hs9ar+1D+GwTpZ4hFYBlhT2WvPW
   3GlfXMZMJOAkfG251MVB3dXfN+W6ASgRzrjGRBCoSs2w6z1aTcZ6fq1kG
   1o+KwuRiI6IB5O7PaQgmPcfoCu6Vc5ff6pCz4+oXfPz3Hjq+59ushbno7
   A==;
X-CSE-ConnectionGUID: kE2GNxPTRFqAO2EIc5+LYA==
X-CSE-MsgGUID: GznFzu4DQVijwmHNPr2MfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="48475690"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="48475690"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 06:38:30 -0700
X-CSE-ConnectionGUID: zEXwGZ15T7qAZGW2SjUqSQ==
X-CSE-MsgGUID: J5iZm6HMQJa+bu1/l8kp1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="126146200"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2025 06:38:29 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyWOJ-00088U-0J;
	Sat, 29 Mar 2025 13:38:27 +0000
Date: Sat, 29 Mar 2025 21:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 2/3] dt-bindings: soc: samsung: exynos-pmu: update
 reset for gs101
Message-ID: <202503292114.3S0uotSr-lkp@intel.com>
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
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
References: <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
TO: "André Draszik" <andre.draszik@linaro.org>
TO: Sebastian Reichel <sre@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: Peter Griffin <peter.griffin@linaro.org>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Will McVicker <willmcvicker@google.com>
CC: kernel-team@android.com
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org
CC: "André Draszik" <andre.draszik@linaro.org>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on db8da9da41bced445077925f8a886c776a47440c]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Draszik/dt-bindings-power-reset-google-gs101-reboot-add-Google-GS101-specific-reset/20250328-231732
base:   db8da9da41bced445077925f8a886c776a47440c
patch link:    https://lore.kernel.org/r/20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace%40linaro.org
patch subject: [PATCH v4 2/3] dt-bindings: soc: samsung: exynos-pmu: update reset for gs101
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-051-20250329 (https://download.01.org/0day-ci/archive/20250329/202503292114.3S0uotSr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503292114.3S0uotSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503292114.3S0uotSr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: system-controller@17460000: syscon-reboot: False schema does not allow {'compatible': ['syscon-reboot'], 'offset': 14848, 'mask': 2, 'value': 2}
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#
--
>> arch/arm64/boot/dts/exynos/google/gs101-raven.dtb: system-controller@17460000: syscon-reboot: False schema does not allow {'compatible': ['syscon-reboot'], 'offset': 14848, 'mask': 2, 'value': 2}
   	from schema $id: http://devicetree.org/schemas/soc/samsung/exynos-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
