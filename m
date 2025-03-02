Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17591D88A4
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740909214; cv=none; b=pmlIJgslL4iD7xNZBbh+DfmOm+RD14vKU+pRBsvMI/Rx8+GYwYSXSK9kTyZ2lcBgOmlOkw178ibHSuRkqgdD0Y+/LJ73WNtMcMW4DI+vVFITDFJlaWFUx/EivJJ9TW0BNCh9RR/kDi2FhLC369WeQDLH9pNGdjmTkvPARUYSsKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740909214; c=relaxed/simple;
	bh=c+W0bP20lijXMqB4tR95deyf+NsOc4d2Ry7DbDEyyQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=chdyAzekK62hHsyNjSO8jFCu7gkfU8sLQd0q8OvwLOdt/hwA6EbbWeXpLFKL63EamZI+aMlGt3fcQJ4yjIn0yr/YEhygy7UKpjL0wmnMqISbj6UzxIfbaUZFrOZz1pPUW0QrFYJEtBXbeo9Ex5fJRNDgtanDQHm0J8O9F14hgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef4gu0x7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef4gu0x7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740909212; x=1772445212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+W0bP20lijXMqB4tR95deyf+NsOc4d2Ry7DbDEyyQ4=;
  b=Ef4gu0x7TBAAwI68e7C/gcjZv32DihkaotEQ6wMS8HsntkHRuc6eEMP0
   R84uf7dezLEy5v4ZCRdSaj7o+QCucKVTHIWbg4PwYllbTgs5+k9vuoBJc
   XLvVVHPTJlMD8Q8yJkJonwH2rdjz9pnqWCbn9sAu1b+OKjb4aW+bP/obs
   o8DOkBxLtAbqvKXwyHzSNTbY6ZAk1OuiQ2Sd1RuuMR77RVoddXTKh5ygH
   sMh2EmTwDI7REySA+t1YmnxY7Q6wiV47DTd3uX/Kx8rtzEjagUpGqMvyp
   zLBSHjq7clgC3J/a/mKUjgx/t2dyRd0tYg6YMnkFFiIk9cuFZrvuJUSny
   g==;
X-CSE-ConnectionGUID: Wrt1U4rtSgiEFwO+j8s5pQ==
X-CSE-MsgGUID: oH5H5V39R0iuuN6B+golRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41709059"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="41709059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 01:53:19 -0800
X-CSE-ConnectionGUID: 4ABDLrm6TbSh9gnV9zv0XQ==
X-CSE-MsgGUID: mkMDGHy5QqqQZXwqW9teRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="118427776"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2025 01:53:17 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tog0Z-000HE2-1j;
	Sun, 02 Mar 2025 09:53:15 +0000
Date: Sun, 2 Mar 2025 17:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 8/8] arm64: dts: st: add low-power timer nodes on
 stm32mp251
Message-ID: <202503021757.hZ7JHNt5-lkp@intel.com>
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
In-Reply-To: <20250224180150.3689638-9-fabrice.gasnier@foss.st.com>
References: <20250224180150.3689638-9-fabrice.gasnier@foss.st.com>
TO: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
TO: lee@kernel.org
TO: ukleinek@kernel.org
TO: alexandre.torgue@foss.st.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: wbg@kernel.org
TO: jic23@kernel.org
TO: daniel.lezcano@linaro.org
TO: tglx@linutronix.de
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org
CC: linux-pwm@vger.kernel.org
CC: olivier.moysan@foss.st.com
CC: fabrice.gasnier@foss.st.com

Hi Fabrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-leds/for-leds-next jic23-iio/togreg tip/timers/core arm64/for-next/core linus/master v6.14-rc4 next-20250228]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/dt-bindings-mfd-stm32-lptimer-add-support-for-stm32mp25/20250225-022552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250224180150.3689638-9-fabrice.gasnier%40foss.st.com
patch subject: [PATCH 8/8] arm64: dts: st: add low-power timer nodes on stm32mp251
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250302/202503021757.hZ7JHNt5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021757.hZ7JHNt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503021757.hZ7JHNt5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46060000: trigger@3:reg:0:0: 3 is greater than the maximum of 2
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@46070000: trigger@4:reg:0:0: 4 is greater than the maximum of 2
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-lptimer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
