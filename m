Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2633C20ADEE
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Jul 2025 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753719079; cv=none; b=aYL589EDN6cjEctqfeJqVgfnDuid+qQnVm76iuLFUxEf6H19SlJZMn1rmZ8Ny3nbBVAcRZG2FBXcQ7T+Aoce3iYPszxv9y65muUewOG6tAfFBuUxFkeWXN0hKdnh3ufn+t48HJRCOPHef2zDojjImC/YItj0CrHIbWr2zgYm55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753719079; c=relaxed/simple;
	bh=02dbSMUp8lmFf5Brr+y+DCRJysxdLUvGdvoSPMBRpV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPA39FsY9ZOC3HMZZcTxvHgD++iaW13Cr/TZ8imkjXfyXctLa2xn3QQkY17MrAXN9zUiXORxbo7np12SF8CIqTRFiybx+DzFPKWniOJllD+sdTKzxujTMypPnVXk0pvKQMvCEfyXxfWyKIsZDkX1cFX7bRczs5y00NjivHXisKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEZrGip7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEZrGip7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753719077; x=1785255077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02dbSMUp8lmFf5Brr+y+DCRJysxdLUvGdvoSPMBRpV4=;
  b=GEZrGip7fbOD+jLGEpD5U8FVsyNVKZMHVfC2yFJJbUP2neZQ/5kSJ1kS
   uCWt8RoB91gx0nzIruXQi39gsLo+zJScIYnyUs81HP4/4lutX/h3yX0Ga
   ITSPwCmCJZ50KUL0WrC3SQpoGUMy1gW+QX+e8wTylIIIha0gNrW2RWqR3
   xxDoPL0fQEHqixQDGA1+ttVsjL6E6vFYKSc9NzGWILUEuEGcblIYWq+22
   PZU64Qdf/1oSh5xlE2vp47kJ4c6BtyMGHQvlxfuZxLgEcVnUlBiaRHS4o
   SaSutwQzgDyFHMdgLWlIbMxiGlKhxn5lHtkqkL7MMBEl3PrBee/4Qi882
   A==;
X-CSE-ConnectionGUID: +L0yRoxdQQ+NAYlJQr5UyQ==
X-CSE-MsgGUID: kMdhM5KLSsi5Vykdc1a53A==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56052013"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56052013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 09:11:15 -0700
X-CSE-ConnectionGUID: 9Akj2t52T06Dpck/VUfGPA==
X-CSE-MsgGUID: tBP9VbRcTmKNXGaR0oF1FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193441035"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2025 09:11:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugQRT-0000ZD-2W;
	Mon, 28 Jul 2025 16:11:11 +0000
Date: Tue, 29 Jul 2025 00:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 4/5] dpll: zl3073x: Refactor DPLL initialization
Message-ID: <202507282309.ToVNHlep-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250725154136.1008132-5-ivecera@redhat.com>
References: <20250725154136.1008132-5-ivecera@redhat.com>
TO: Ivan Vecera <ivecera@redhat.com>
TO: netdev@vger.kernel.org
CC: Jiri Pirko <jiri@resnulli.us>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Prathosh Satish <Prathosh.Satish@microchip.com>
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Michal Schmidt <mschmidt@redhat.com>
CC: Petr Oros <poros@redhat.com>

Hi Ivan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Vecera/dpll-zl3073x-Add-functions-to-access-hardware-registers/20250725-234600
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250725154136.1008132-5-ivecera%40redhat.com
patch subject: [PATCH net-next 4/5] dpll: zl3073x: Refactor DPLL initialization
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r072-20250728 (https://download.01.org/0day-ci/archive/20250728/202507282309.ToVNHlep-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507282309.ToVNHlep-lkp@intel.com/

smatch warnings:
drivers/dpll/zl3073x/core.c:996 zl3073x_dev_phase_meas_setup() error: uninitialized symbol 'mask'.

vim +/mask +996 drivers/dpll/zl3073x/core.c

75a71ecc24125f Ivan Vecera 2025-07-04  958  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  959  /**
cafbc8d62bf9bd Ivan Vecera 2025-07-25  960   * zl3073x_dev_phase_meas_setup - setup phase offset measurement
cafbc8d62bf9bd Ivan Vecera 2025-07-25  961   * @zldev: pointer to zl3073x_dev structure
cafbc8d62bf9bd Ivan Vecera 2025-07-25  962   *
cafbc8d62bf9bd Ivan Vecera 2025-07-25  963   * Enable phase offset measurement block, set measurement averaging factor
cafbc8d62bf9bd Ivan Vecera 2025-07-25  964   * and enable DPLL-to-its-ref phase measurement for all DPLLs.
cafbc8d62bf9bd Ivan Vecera 2025-07-25  965   *
cafbc8d62bf9bd Ivan Vecera 2025-07-25  966   * Returns: 0 on success, <0 on error
cafbc8d62bf9bd Ivan Vecera 2025-07-25  967   */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  968  static int
cafbc8d62bf9bd Ivan Vecera 2025-07-25  969  zl3073x_dev_phase_meas_setup(struct zl3073x_dev *zldev)
cafbc8d62bf9bd Ivan Vecera 2025-07-25  970  {
cafbc8d62bf9bd Ivan Vecera 2025-07-25  971  	struct zl3073x_dpll *zldpll;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  972  	u8 dpll_meas_ctrl, mask;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  973  	int rc;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  974  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  975  	/* Read DPLL phase measurement control register */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  976  	rc = zl3073x_read_u8(zldev, ZL_REG_DPLL_MEAS_CTRL, &dpll_meas_ctrl);
cafbc8d62bf9bd Ivan Vecera 2025-07-25  977  	if (rc)
cafbc8d62bf9bd Ivan Vecera 2025-07-25  978  		return rc;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  979  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  980  	/* Setup phase measurement averaging factor */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  981  	dpll_meas_ctrl &= ~ZL_DPLL_MEAS_CTRL_AVG_FACTOR;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  982  	dpll_meas_ctrl |= FIELD_PREP(ZL_DPLL_MEAS_CTRL_AVG_FACTOR, 3);
cafbc8d62bf9bd Ivan Vecera 2025-07-25  983  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  984  	/* Enable DPLL measurement block */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  985  	dpll_meas_ctrl |= ZL_DPLL_MEAS_CTRL_EN;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  986  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  987  	/* Update phase measurement control register */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  988  	rc = zl3073x_write_u8(zldev, ZL_REG_DPLL_MEAS_CTRL, dpll_meas_ctrl);
cafbc8d62bf9bd Ivan Vecera 2025-07-25  989  	if (rc)
cafbc8d62bf9bd Ivan Vecera 2025-07-25  990  		return rc;
cafbc8d62bf9bd Ivan Vecera 2025-07-25  991  
cafbc8d62bf9bd Ivan Vecera 2025-07-25  992  	/* Enable DPLL-to-connected-ref measurement for each channel */
cafbc8d62bf9bd Ivan Vecera 2025-07-25  993  	list_for_each_entry(zldpll, &zldev->dplls, list)
cafbc8d62bf9bd Ivan Vecera 2025-07-25  994  		mask |= BIT(zldpll->id);
cafbc8d62bf9bd Ivan Vecera 2025-07-25  995  
cafbc8d62bf9bd Ivan Vecera 2025-07-25 @996  	return zl3073x_write_u8(zldev, ZL_REG_DPLL_PHASE_ERR_READ_MASK, mask);
cafbc8d62bf9bd Ivan Vecera 2025-07-25  997  }
cafbc8d62bf9bd Ivan Vecera 2025-07-25  998  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
