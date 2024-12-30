Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605B370
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582771; cv=none; b=SzGEAblipTI90RdWTcmLY+XXuD7WpL225ppX5HION7hJb2TuZVT10u5ulNty4cc6Cz6aNdW+VjEQV3RvdN3b30OhPPutwwF1rmF9FxvxyAPK0YroR4Jd25SlE+UPcxxv2bA6JYsxNE+clt1ODR8XGE6OcRgmNnBcddor1OtoDdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582771; c=relaxed/simple;
	bh=Iu+XKkH8oy7IumVrq/9XlGdmwDMa7e7zUmmP/1h6K4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4A0khAVgJvc+fiLMcBEo5oh6jquairp92X6aonL50QpuM0NPxnC95SoAG9g9wkzdYxJ5vNWUkCOa1Q2GCmKg2MuL9a/OX16aO+WRHho9zJ/dApg3iqyHRpaPtbef3mnNLL2TqrYInggwZQ3d9iVjJoU/RYCecycH6uwhQKqTzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1yvCNQr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1yvCNQr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735582769; x=1767118769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iu+XKkH8oy7IumVrq/9XlGdmwDMa7e7zUmmP/1h6K4E=;
  b=K1yvCNQr0dYvfZRIgM7nGO5fLimCw1xG1DwjRw+MrdfIhIOLFfuiEFYn
   d21FCP7iY1x/DR/AQgFKwh5h6a4SSV25FI2PKhv3EySG7lcpRu5m3yNdk
   e+uqIEevPxFPNcVHZxpE+AXc2beBok4MkNOpfPQr2u+UxtDJJGS4n0EMg
   nEzlwOejIPgRCIP0bZMLR2EdTc8+uOQOCDoTva7qLW0PRhas5riWAlE4I
   2q0ZKIvCexvIpX0tppwFCHdT00o01my5bEeku46ThYBw6L7V+1wf+IcaO
   KdIaCUA9Ime8w9eWQUH+doT2sriQZyGlcapdgJJexYXuliGj7n+Fqrxnm
   w==;
X-CSE-ConnectionGUID: QRSqgoWlQ4CFxutOPWiN3Q==
X-CSE-MsgGUID: 2dUr+n//T/eEBQJOJHK6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35752924"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35752924"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 10:19:27 -0800
X-CSE-ConnectionGUID: szcNbOOsRmyqlcrQ50OzsA==
X-CSE-MsgGUID: Uqw/jvD1TU+l6hBxXy3ipw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="100968481"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Dec 2024 10:19:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSKMO-0006Ij-1e;
	Mon, 30 Dec 2024 18:19:24 +0000
Date: Tue, 31 Dec 2024 02:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk:next/dt64 23/23]
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/i2c@10990000:
 failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
Message-ID: <202412310214.8Ux36YEA-lkp@intel.com>
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
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git next/dt64
head:   f424523b1b516b3f0984feeb1d8218e904d17a97
commit: f424523b1b516b3f0984feeb1d8218e904d17a97 [23/23] arm64: dts: exynos8895: Add camera hsi2c nodes
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-051-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310214.8Ux36YEA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310214.8Ux36YEA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412310214.8Ux36YEA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/i2c@10990000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/i2c@109a0000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/i2c@109b0000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: /soc@0/i2c@109c0000: failed to match any schema with compatible: ['samsung,exynos8895-hsi2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
