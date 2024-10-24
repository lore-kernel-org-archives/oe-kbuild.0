Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F011216A0C
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 21:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804586; cv=none; b=DnMohI+XLDlEamDd7QuuVPFTZP7aIgc5F97ZgEVuAHlSK/HixYO006Jq5SOo2UB3CjMTa5FDcK4RTbLH15CbW4NCG+O6OAtCmnwMsVyinC1ygfBkcVe2siWUOyOcK4nKdvPrhBZH7w5x8UUSI3MpLAcephfl6+g7stQaaBOPpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804586; c=relaxed/simple;
	bh=vHyBjQXoCqcpsExT13MmZXfP6YbL+GVnNak4JWOdodU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eD/ii4KufkLio0EKqQfA+MKXYL7Ashs+XTO+kyN3WVsLbLh1UUasKSqSryUbEspVeNLRgbQ2xF/Hi7a+/YHCkcZiDXWyfDVnBINiTAtbSm7Ejj477UCB0IGIqqk0rhzhFqiRVdRaN0IG4RsYw5Ym7ONspXBb1tOq12x1gkhMTsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7i/GGGx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7i/GGGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729804584; x=1761340584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vHyBjQXoCqcpsExT13MmZXfP6YbL+GVnNak4JWOdodU=;
  b=H7i/GGGxP+CHSJW0ZS57pYAvbT28TMXKtmWi/cXGWhPhaVjYiKCX6vIb
   HOm7fGATWqLx9xwhPpD3pEdh8SgqYuC69ySSwvZ/iezVyXWJHA3p30ZKT
   s+CBeC+slAeldckBmOdwHNCwQl66PgdK7K/rf1s4w+36vtEiy6rBHCaMc
   BnuBCT6RpPPIVXYFIM+rDvK7T/zHapHEUIjh+02YTvma9S1Wue9Hjv28h
   qrG1+n6eFdEb/xYZnELu4Z2cgQ+StH4hnJkXXn0QFUAPda6ChBF2jGD+n
   91ZbUbYgAKdt3x/Psocq78It28X/DAccveBOooOPlB/Zb5jaGzQPdRD7J
   A==;
X-CSE-ConnectionGUID: qkAcy5rBTWOOLRi0odgxCw==
X-CSE-MsgGUID: VN+E+C3PRcyVvbP+XOSgUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40571976"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40571976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 14:16:24 -0700
X-CSE-ConnectionGUID: kHSWG9VjTdunCvjKlHYtvg==
X-CSE-MsgGUID: 0fIEiOEnRQ+Z94IXCVeFQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="111565580"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2024 14:16:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t45Bs-000X9y-2F;
	Thu, 24 Oct 2024 21:16:20 +0000
Date: Fri, 25 Oct 2024 05:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos8895: Add clock management unit
 nodes
Message-ID: <202410250411.9yICHpQp-lkp@intel.com>
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
In-Reply-To: <20241023091734.538682-3-ivo.ivanov.ivanov1@gmail.com>
References: <20241023091734.538682-3-ivo.ivanov.ivanov1@gmail.com>
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Andi Shyti <andi.shyti@kernel.org>
TO: Mark Brown <broonie@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: linux-samsung-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241024]
[cannot apply to tip/timers/core robh/for-next krzk-dt/for-next linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-timer-exynos4210-mct-Add-samsung-exynos8895-mct-compatible/20241023-172002
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241023091734.538682-3-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 2/5] arm64: dts: exynos8895: Add clock management unit nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241025/202410250411.9yICHpQp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250411.9yICHpQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410250411.9yICHpQp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts:9:
>> arch/arm64/boot/dts/exynos/exynos8895.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos8895.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos8895.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts:9:
   arch/arm64/boot/dts/exynos/exynos8895.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos8895.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos8895.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +8 arch/arm64/boot/dts/exynos/exynos8895.dtsi

9cc9aaadb0aa92 Ivaylo Ivanov 2024-10-23  @8  #include <dt-bindings/clock/samsung,exynos8895.h>
dcabaa8ae45764 Ivaylo Ivanov 2024-09-20   9  #include <dt-bindings/interrupt-controller/arm-gic.h>
dcabaa8ae45764 Ivaylo Ivanov 2024-09-20  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
