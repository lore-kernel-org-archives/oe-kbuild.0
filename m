Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF917483
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 00:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757982946; cv=none; b=lM6PF2SRuajxxJCRm1u1bSU1+Hqh9BnREg9kVnJ1z8agS6Hrtp5fjc0hO4oYjaU80Uvokx3yViH/11Lh49zI6nU7vLVJVh9Sa4AYjB0WJOxnBip6BX8fJkK2hKNJMWMZXpXlNSaWZoMt3ECN2UKi0xfIkg2dW0XEv/4hWWrzS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757982946; c=relaxed/simple;
	bh=x/8kzG/UXFU/3h53irRgh2oCW8KptHFFttEoXuuqFzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XgrZZEUZiLA7P7G7i0FWlhjM5WgMPx4YXZ6CQTldJ5HYqP1ZhJWMY+yN3tBqGUCzXn02B/BBBsFo3TaruJ7wcaR7CjLa2GZQjO9BCKAQG6CUC+apA+uSaC1Fj3ahdpnEcJQHi53giI7u/IWX/JeFRRZ7HnD/2OKLMjPfrAe3AOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go6EaP58; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go6EaP58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757982944; x=1789518944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/8kzG/UXFU/3h53irRgh2oCW8KptHFFttEoXuuqFzY=;
  b=Go6EaP58auw8ghCxxqhAFoVKZyxd+IubZtpARGtJ2qDB7RzK1a6+mnAv
   UIcpsrkur5F8/JO4JsSy6GH5MPAHRwvA0sVTkhBJtxJu/wn4roUFjQJPV
   AQiEFKRneHu0edeu6SPjEp7xJZ1G8ECTTU7TiUbrYzyipMRgqSAcRqifb
   K0Imp631Niz6U9R8SwOxJ8EnIP9nN6/fxl8Zj857yZ1VBMclnF0BhljE7
   EnW+ye+pBPa1sOVr7VYnfo64rSz06nteG3lUHAHsSPJcQqFpaNWvkwWvr
   i3T3Lc74uL1a8mwhl0yL60LkxYqo/4D+MB+phlD7n+AYiIhAiQJb9sQgD
   A==;
X-CSE-ConnectionGUID: 2AamuEikTq6HayXt3xkQMw==
X-CSE-MsgGUID: 6lL4Zn2xSbWe3uNMAmuCgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85689165"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="85689165"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 17:35:44 -0700
X-CSE-ConnectionGUID: LtVYTX7ITHKJlbORVupjMQ==
X-CSE-MsgGUID: 1gF/DBPZRouiIcHWMX92wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="180032147"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2025 17:35:43 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyJfY-0000qV-32;
	Tue, 16 Sep 2025 00:35:40 +0000
Date: Tue, 16 Sep 2025 08:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: exynosautov920: Add DT node for sysMMU
Message-ID: <202509160855.27QlYINZ-lkp@intel.com>
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
In-Reply-To: <20250915051320.3378957-3-myunggeun.ji@samsung.com>
References: <20250915051320.3378957-3-myunggeun.ji@samsung.com>
TO: "myunggeun.ji" <myunggeun.ji@samsung.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Joerg Roedel <joro@8bytes.org>
TO: Will Deacon <will@kernel.org>
TO: Robin Murphy <robin.murphy@arm.com>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: iommu@lists.linux.dev
CC: Jongho Park <jongho0910.park@samsung.com>
CC: kiisung lee <kiisung.lee@samsung.com>
CC: "myunggeun.ji" <myunggeun.ji@samsung.com>

Hi myunggeun.ji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.17-rc6 next-20250912]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/myunggeun-ji/iommu-exynos-Implement-register-set-and-fault-handling-on-SysMMU-v9/20250915-134420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250915051320.3378957-3-myunggeun.ji%40samsung.com
patch subject: [PATCH 2/2] arm64: dts: exynosautov920: Add DT node for sysMMU
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250915 (https://download.01.org/0day-ci/archive/20250916/202509160855.27QlYINZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160855.27QlYINZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509160855.27QlYINZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18040000 (samsung,exynos-sysmmu): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18040000 (samsung,exynos-sysmmu): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18440000 (samsung,exynos-sysmmu): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18440000 (samsung,exynos-sysmmu): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18840000 (samsung,exynos-sysmmu): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#
   arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: sysmmu@18840000 (samsung,exynos-sysmmu): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/samsung,sysmmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
