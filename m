Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2521B0F1E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636863; cv=none; b=B+qpBmMCLBzKPVhgb9EgIDuglHT5InsgRN2E0mgdhYN9fXWe2MnnYCW8EIy8PQrCxb09UsfJ/L9Xz8bZf0V6+OZmue9vGI+N9dXC99ngKtdID3HqidJccsSp+kDCyL4SpJhATsS8E0dywuEUzm1Q2Nkhhuwv9DauOgu8dGO0Qj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636863; c=relaxed/simple;
	bh=6R/QzzfbNl+glnMUV9gfT2R8RnZ1DBdiuJ5yNOaTxtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B13zZH9b8SSP3X/ml4pB+QzdRK1igKsUucBlAnkf0T/lfSF7I7Mr4sNhTiNTOXEtY7y1fFBrhQgjUDjb4C/2CZja0yb+bXhv/jnA9KORzTTmtq5g417L9aLdA9hXb5U5inRsbQwBadfsI4tei/C9YFd2xfgF8lXHU/WgrxlBIQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hrZxb3j6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrZxb3j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746636862; x=1778172862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6R/QzzfbNl+glnMUV9gfT2R8RnZ1DBdiuJ5yNOaTxtQ=;
  b=hrZxb3j6sx/xVW2aeKYKqA+zH4SAwQKIVIMQq4/le+7gECWWpHN55Zbx
   8MU62hrPbxaSqtR3+UBnDJwuX/a+cHRgAXumW2/W7OL/C2MjF1jvMT/Dc
   b6CFGjlqwEOqf6coYSwguqrWurSYPLZolYeqG4LKdqRe9OE5C748X4NjW
   y9THdLxzj51SggsoNh+e30I/LOi7K1SMHF4Seav5FAn2N0r5BER/yA13T
   ZPuS2eqnaFMtcHBDGZWGoPELH6aTJIxuP1vYnVJdpX+p0IrBDITimNw6P
   FPEjkHNegHP0wQ3VbvAEYVYTrCs/UOdqSznbi0Azbt3cHZiS5nbUv7EfX
   Q==;
X-CSE-ConnectionGUID: zqpAmWr/Q8KCuM6hm1oq/g==
X-CSE-MsgGUID: xrwur7NbQkKjfvXPUT2VAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73768286"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="73768286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 09:54:21 -0700
X-CSE-ConnectionGUID: tB+AHqHBSBKUK0T1KyJofw==
X-CSE-MsgGUID: +9kzPB9iSJe38+CMTmY7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166947614"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 09:54:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCi2D-0008Bp-1q;
	Wed, 07 May 2025 16:54:17 +0000
Date: Thu, 8 May 2025 00:54:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk-pm:opp/cleanup 5/6] drivers/opp/core.c:2950
 dev_pm_opp_sync_regulators() warn: iterator 'i' not incremented
Message-ID: <202505080037.DaApZwGO-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/cleanup
head:   cb4bdf07e512e39af4c9142679c1361ce76e9336
commit: 5330d0dab7367f7e17911dfa82a6712de27aa968 [5/6] OPP: Define and use scope-based cleanup helpers
:::::: branch date: 13 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250508/202505080037.DaApZwGO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505080037.DaApZwGO-lkp@intel.com/

smatch warnings:
drivers/opp/core.c:2950 dev_pm_opp_sync_regulators() warn: iterator 'i' not incremented

vim +/i +2950 drivers/opp/core.c

25cb20a212a1f9 Stephen Boyd 2019-10-16  2922  
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2923  /**
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2924   * dev_pm_opp_sync_regulators() - Sync state of voltage regulators
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2925   * @dev:	device for which we do this operation
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2926   *
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2927   * Sync voltage state of the OPP table regulators.
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2928   *
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2929   * Return: 0 on success or a negative error value.
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2930   */
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2931  int dev_pm_opp_sync_regulators(struct device *dev)
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2932  {
5330d0dab7367f Viresh Kumar 2025-04-23  2933  	struct opp_table *opp_table __free(put_opp_table);
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2934  	struct regulator *reg;
5330d0dab7367f Viresh Kumar 2025-04-23  2935  	int i;
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2936  
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2937  	/* Device may not have OPP table */
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2938  	opp_table = _find_opp_table(dev);
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2939  	if (IS_ERR(opp_table))
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2940  		return 0;
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2941  
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2942  	/* Regulator may not be required for the device */
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2943  	if (unlikely(!opp_table->regulators))
5330d0dab7367f Viresh Kumar 2025-04-23  2944  		return 0;
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2945  
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2946  	/* Nothing to sync if voltage wasn't changed */
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2947  	if (!opp_table->enabled)
5330d0dab7367f Viresh Kumar 2025-04-23  2948  		return 0;
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2949  
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03 @2950  	for (i = 0; i < opp_table->regulator_count; i++) {
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2951  		reg = opp_table->regulators[i];
5330d0dab7367f Viresh Kumar 2025-04-23  2952  		return regulator_sync_voltage(reg);
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2953  	}
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2954  
5330d0dab7367f Viresh Kumar 2025-04-23  2955  	return 0;
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2956  }
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2957  EXPORT_SYMBOL_GPL(dev_pm_opp_sync_regulators);
0b40dd3bcfc6f5 Viresh Kumar 2024-01-03  2958  

:::::: The code at line 2950 was first introduced by commit
:::::: 0b40dd3bcfc6f521e6ac0e297ecdcc391d5cc4bb OPP: Relocate dev_pm_opp_sync_regulators()

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
