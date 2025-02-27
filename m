Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E026A1B0
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 19:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740684002; cv=none; b=tWDOdxLf/R6ToZpafKeAsBzDTiveQU+7oqSsKcVoxZ/NVqPl/fBtMBF9cJlzCMeR2nw29p7NM+MsMQDFrtRM/q/gnOK8V9Ul2Z9V6jl4S7YZLmm6xuctl3LuotmWOILhIkIVBnx+TQqn8Nz3nv52oR6ETL/OLU015MIV3puc5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740684002; c=relaxed/simple;
	bh=z39Exji9yzsQggACJ6Tz/NfiQVTODmr1oyErR/L0JO4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5olu3HufjAlSsV8mouwFlQI88AKD6WFV+G5ys2CWyyIOzvUDbe2Y63p+C+dmoaDIGiCudSQYzM0yAt4tjSEB3Goijvb5nlchMWSDDtkdXQFa4Oy+1Qc+sgN3QCN58KNH0PZ1RXhOu05TcEa6AmF398qX8kzWxB5nTq1HQQRduY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL+n4GTZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL+n4GTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740684001; x=1772220001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z39Exji9yzsQggACJ6Tz/NfiQVTODmr1oyErR/L0JO4=;
  b=RL+n4GTZdIT0LHXyUpxKF0gbSB8FrLVm1tTSqWyw7Obf01d5s6jgzc8S
   4cP8mXX8RqcMHxlLb5cO5F/gm3kJOFww7XdCoZ4qhSvY9yxRYyenqJrk1
   9lw2KmdWBxWOEnEEwPE2HQK+9dMk8df7DqNY+xZWumzgjSCjlp1m6N7P2
   h3mqorcWYhYIZ8PZbEj5LO+WaDBHH2Qfyx33Lx0gYa2YgiAoTpdqpB7Xv
   A8dxa3V/PF/7uiEvVmbOG6xZv88R1KJCJNpyPxTIkMarClFcMbBmVIbGp
   f7KNrHdIrmSG12nfDKCrJMXA578IhfBkU42AzdFSETVHs6YNtwdQGZKa6
   g==;
X-CSE-ConnectionGUID: xhfoWqcuTIG1voAgofD8yA==
X-CSE-MsgGUID: Um4Q0ws0SJK/Kv5cV6jtzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52228385"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="52228385"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 11:20:00 -0800
X-CSE-ConnectionGUID: toKyAlcXTZaMK/BSbgXgaQ==
X-CSE-MsgGUID: AmjUdhUWRVCilmFjrueqtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118042920"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Feb 2025 11:19:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnjQK-000Dvk-2L;
	Thu, 27 Feb 2025 19:19:56 +0000
Date: Fri, 28 Feb 2025 03:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-ID: <202502280231.qRmjWxdW-lkp@intel.com>
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
In-Reply-To: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250223123044.725493-4-ivo.ivanov.ivanov1@gmail.com>
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
CC: linux-samsung-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Ivaylo,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next pinctrl-samsung/for-next linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250223-203243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250223123044.725493-4-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v2 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-003-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280231.qRmjWxdW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280231.qRmjWxdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502280231.qRmjWxdW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
>> arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos2200-cmu.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

dtcheck warnings: (new ones prefixed by >>)
>> In file included from arch/arm64/boot/dts/exynos/exynos2200-g0s.dts:9:
   arch/arm64/boot/dts/exynos/exynos2200.dtsi:8:10: fatal error: dt-bindings/clock/samsung,exynos2200-cmu.h: No such file or directory
       8 | #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

vim +8 arch/arm64/boot/dts/exynos/exynos2200.dtsi

b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  @8  #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23   9  #include <dt-bindings/interrupt-controller/arm-gic.h>
b661f5fc96c5e9 Ivaylo Ivanov 2025-02-23  10  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
