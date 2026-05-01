Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DCF359A7E
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 19:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662958; cv=none; b=cmfxcJTwie+e/bosjoK8WLDHvZ1Q02WIul+HgQygyLU74stDqLTjB7GPD3e4Knpgwwk4V0BCIphCdD0eEqiSf8txYzV7O6cYX7ODpXrMfVct273j/21MkQ6GrKU9UbN0GxoEG/MiIYdJrX9p4K68dmETKUFTObEzQgduO5l0hlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662958; c=relaxed/simple;
	bh=toT4vXuxSMxpS5LGxVuVDEgUDwbAySAZriN2qwv7CEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DDIlcm/YCK/5LLjzCnbXymBEw5KIY5jQmqE898EaP57CStjClEKfz2AWUNJcuyvPbJeShbRX7WRrqHfQk7dm8161OyhTf2T4+DUfyg6o16ldsinlEGBj5U+FFTg4n+rvbIG0bDJqnkNMB0ZaTyt8oZIyhvDx6xyc6cxwfTG19cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDN22uut; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDN22uut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777662955; x=1809198955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=toT4vXuxSMxpS5LGxVuVDEgUDwbAySAZriN2qwv7CEA=;
  b=iDN22uutIOt2BDOEhHj+/usRucDEJJdohYU5f0TMZlEquYfPPHdGPWHP
   RxwwdTv6Yqw3WiPLLDFkypeHOwND8fwnbMe/roZCpQiFl/mXJcTUIpKkM
   lWG/NMI7NLIqLnAqJYj/7no2HAXuo1C7Z7UOIVCFn4HKJ1snDk5P7Zads
   CdtVim8Jj+sez29zHW8wvqDWcEAo7jmal088m2Xzuqh0BJWclvdO52Xjg
   ggl+k6s/Lx/DYe4aRzpDgyK/kG68eNNiAsdkC0Vhxa2PYMGLpQEzfkuRz
   jCeJZP5yQzaDtEbUUYxHcGziwpGBuVVSa1wHoiBh0CWRtOjqDmGXSVgDn
   g==;
X-CSE-ConnectionGUID: S+LNKIkYRFqDG66LRP3ftg==
X-CSE-MsgGUID: bjKTPmbXQpaYrPuUtvsp6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="96192598"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="96192598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 12:15:54 -0700
X-CSE-ConnectionGUID: UY7564E3TIiMrISZY6fIhw==
X-CSE-MsgGUID: sgvXB5eaS6qc8cpQJVnOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="234833260"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 01 May 2026 12:15:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wItL4-0000000056D-2Fja;
	Fri, 01 May 2026 19:15:50 +0000
Date: Fri, 1 May 2026 21:15:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: qcom: slim7x: Add Embedded Controller node
Message-ID: <202605012151.D0Ud5u14-lkp@intel.com>
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
In-Reply-To: <20260429103301.17449-1-daniel@quora.org>
References: <20260429103301.17449-1-daniel@quora.org>
TO: Daniel J Blueman <daniel@quora.org>
TO: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Hans de Goede <hansg@kernel.org>
TO: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Randy Dunlap <rdunlap@infradead.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
CC: Maya Matuszczyk <maccraft123mc@gmail.com>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Akhil P Oommen <akhilpo@oss.qualcomm.com>
CC: Abel Vesa <abel.vesa@oss.qualcomm.com>
CC: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
CC: Daniel J Blueman <daniel@quora.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-J-Blueman/arm64-dts-qcom-slim7x-Add-Embedded-Controller-node/20260501-055507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260429103301.17449-1-daniel%40quora.org
patch subject: [PATCH] arm64: dts: qcom: slim7x: Add Embedded Controller node
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-2053-20260501 (https://download.01.org/0day-ci/archive/20260501/202605012151.D0Ud5u14-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605012151.D0Ud5u14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605012151.D0Ud5u14-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,glymur-crd-ec', 'qcom,hamoa-crd-ec']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,glymur-crd-ec', 'qcom,hamoa-crd-ec']
--
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,glymur-crd-ec', 'qcom,hamoa-crd-ec']
>> arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x-el2.dtb: /soc@0/geniqup@bc0000/i2c@b94000/embedded-controller@76: failed to match any schema with compatible: ['qcom,glymur-crd-ec', 'qcom,hamoa-crd-ec']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
