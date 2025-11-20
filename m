Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D26361DB6
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651912; cv=none; b=fUXkq7DJkCJVgZcAAfujYR5MYAVnmfqqSSN5XFgp/dxgHCsH9TDwHbR5ezgftIlLeqvfMiCqqIAYJkicsSVjPlSZBS13wiilKj+/BTyEQ3mrNwXS3FKDMs29njIr/Rhv0vysCTTFGXCc3dsdoOVh6o0m5TGsEnIkAmiu6I/8zNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651912; c=relaxed/simple;
	bh=hjuA2yhRe8VmfHNktQ4B1H9+iCQ/aSMKxvJ0V7/NM0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnUVbSM/HFZ9eEiIVzGEu4sUfSD2klEADC72BJVfw3AU1Jgq3U+4RhAnFX8R5gG528a7Ep91sif037JYfxzU7fQCwhG/2nDT4V5k0Zu5/HkVa3bV7EbNgymAfh2zB53JthtA5wAepOv8VEUPJhvBfVEPba0Nv//66f4vfW9zLOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFFF3Gl6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFFF3Gl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763651910; x=1795187910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hjuA2yhRe8VmfHNktQ4B1H9+iCQ/aSMKxvJ0V7/NM0k=;
  b=kFFF3Gl6fGdfCgm1IoPTh7mEsm3riCuE1xLcdFGaTcGXjQk0hnCA1sZ1
   SzjvbigauzrH85+zBEC8W49HYmF5Mkj6E6LlEmyRxEUmM3B786+COqV73
   MVmNdTqW4fgC4Ty586kE159ADIX+O2e4DfUDweym54Ex3V137gE0ecpyO
   6gG1V+qY7o7b6Q7zU9qicWk7Ayy/g6Uwozj+8Y7NHJX5e7x63m+s/pv79
   24wwgLEIz0WU3cIXug9h6UsLLQ1TqXuqrvEsHbpF3DpOc8RISiSmPfl8R
   a+4ZpKitdaXCRIHWVRenp7Mvt1fZCMdF+2htkG25xWdzt2i5NNnwzNk94
   Q==;
X-CSE-ConnectionGUID: +yNNN69PQJised0J5op4RQ==
X-CSE-MsgGUID: E/tc/PWkTCqYNTHa48WlUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53294884"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="53294884"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 07:18:29 -0800
X-CSE-ConnectionGUID: A9nMQneoQ2KW4Sl+CapvMw==
X-CSE-MsgGUID: Ovxws03hSiem+EC3omfgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190677720"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Nov 2025 07:18:28 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM6QT-0004B9-2k;
	Thu, 20 Nov 2025 15:18:25 +0000
Date: Thu, 20 Nov 2025 23:18:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <202511202354.csdBo9k9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
TO: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
TO: linux-kbuild@vger.kernel.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nicolas Schier <nsc@kernel.org>
CC: linux-kernel@vger.kernel.org

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on deab487e0f9b39ae4603e22d7d00908ebfc9753c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-De-Schampheleire/kbuild-fix-compilation-of-dtb-specified-on-command-line-without-make-rule/20251120-220837
base:   deab487e0f9b39ae4603e22d7d00908ebfc9753c
patch link:    https://lore.kernel.org/r/20251120140645.478623-1-thomas.de_schampheleire%40nokia.com
patch subject: [PATCH] kbuild: fix compilation of dtb specified on command-line without make rule
:::::: branch date: 69 minutes ago
:::::: commit date: 69 minutes ago
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20251120/202511202354.csdBo9k9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511202354.csdBo9k9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511202354.csdBo9k9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/mips/boot/dts/dtbs-list', needed by '.builtin-dtbs-list'.
   make[3]: Target '__default' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
