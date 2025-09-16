Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83ED1F94A
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757981022; cv=none; b=ApMXcOpUCntAfUCskr8xwRr7v9NvTaCa0a8qCePcn8eJfZBeeYYE/VxH+wKnsPXgzZsX/CZDpfVe8KY3g+QsNJ1R4dio51POWcRL9oLLW70CRwy9ZxvEvcoB+r2XopGZu6EjrJrHa/JSNh8vQdKXDlSiYhDdCf9pF8mXSZX7pjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757981022; c=relaxed/simple;
	bh=wsAYtUfLti7xYhFeNQN1oey8Bfwa7+ZkdUHC0Nq12zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JEnf8pZ0q9bjssneBBJSPunnUABxqsH6eG/HReJ8HyIcwXx8Q5reAzmX8h6ne0IyfB9eD8r+j17RN4qyloZZ0ruYzjmJ7o7mvCtnZ4jUrvkcui4pOPDG8lmEPh8pL5kpA3hKiatKD/Dt5Qwi9NC5okS9LiYe7Iu+TZxNKMMptgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFBmKuP8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFBmKuP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757981021; x=1789517021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wsAYtUfLti7xYhFeNQN1oey8Bfwa7+ZkdUHC0Nq12zg=;
  b=QFBmKuP8MmblN+2RIDj3NIYQJvuV4rCquc94uZrs+y6JwJKwrzoF5Hm+
   4kaHizl0HaVUV85QZATL5uKWhFtSO3ne3KD/dQrl1yJSQrm+96mXiK/bD
   r6OMjkmCJd+peVG7+q6S5IPeBloJngURaLFXGkL8/o4D+C+Xa+Vjzifxd
   1ITX/0Qep3Do7CXozrDBp98C+yCdlzKXDkKclXzP7vj4wfWImLgIzneBT
   6IWh48Jfi7p7xJgXNGRb4le8/wyNOSJqPjjQVurAlQ7GekLlCBSIEbC1F
   kpoixhLG7JNM2+6upAdJzk7A1YwnGT9r2m4Mqrx6b6J/UxpKNMxwZL4CA
   w==;
X-CSE-ConnectionGUID: +bEuNFX2QkmgogjM58H7iw==
X-CSE-MsgGUID: EoT+fPN0T6urGlJkyjZ5eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="71348907"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="71348907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 17:03:40 -0700
X-CSE-ConnectionGUID: LDq9VWinTPa4M7/FV0wSBg==
X-CSE-MsgGUID: c0j0hM4hQ8aqrKzRgCEGJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; 
   d="scan'208";a="174325540"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2025 17:03:40 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyJAW-0000nR-2e;
	Tue, 16 Sep 2025 00:03:36 +0000
Date: Tue, 16 Sep 2025 08:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:thead/dt 1/2]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000
 (thead,th1520-gpu): 'power-domain-names' is a required property
Message-ID: <202509160720.CDeUzdD3-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Drew Fustini <fustini@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git thead/dt
head:   dfa743da83ab7ba51ec5692d5939ba1bab4b78c1
commit: 5052d5cf1359e9057ec311788c12997406fdb2fc [1/2] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
:::::: branch date: 9 days ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-052-20250916 (https://download.01.org/0day-ci/archive/20250916/202509160720.CDeUzdD3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160720.CDeUzdD3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509160720.CDeUzdD3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too short
   	['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too long
   	'thead,th1520-gpu' is not one of ['ti,am62-gpu']
   	'thead,th1520-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): 'power-domain-names' is a required property
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: gpu@ffef400000 (thead,th1520-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too short
   	['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue'] is too long
   	'thead,th1520-gpu' is not one of ['ti,am62-gpu']
   	'thead,th1520-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/gpu@ffef400000: failed to match any schema with compatible: ['thead,th1520-gpu', 'img,img-bxm-4-64', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
