Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F250438023
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700005; cv=none; b=VRpfyAi+XnYXbYqBb1UTTyBc3293ojuB4r1ylcQEYpdTLInyiKgJHurr7E/N8OGt4g2p08/6BLJtcCmrg98wXpGsIlkorFDp03CRJWYjPB0WXSorFAQGnq3u/z3nN1w3bnBxVXhQhQ/CO91qEaKvy+pDxO7ih6ZbugJGATM2XV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700005; c=relaxed/simple;
	bh=MieuSzUKDtkOxVdykcJ4z9AJQ2uXvt11xlGLpbZb0s8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AN6TXBawMD4ekK1NhUmKfycRPQGJPU1qjLIV+X9n/pCHinZT98b9YuGSGn4LYsFtyiTqCCi5VZWb/sbAByNmBJ7LyxYkk7DhKdV59lK7jOYG6JUIM+QjvDn6m4LhGl4xI7tzKF5VIQAZ+XmqYLpp8k/OtIQT9gEk1HCdoCuqjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6aiC2sG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6aiC2sG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783700002; x=1815236002;
  h=date:from:to:cc:subject:message-id;
  bh=MieuSzUKDtkOxVdykcJ4z9AJQ2uXvt11xlGLpbZb0s8=;
  b=m6aiC2sG+duCBohDhpfrp/ogIfvZoLa0RKWv8B7sU5NKhGTarVH+UbRc
   rerdVj37XIPF3RJxo46zFtEexNrCPpNH/aEgiNdHgkX9n6/owiJFx61Sl
   g+YLDS35cSslmTnp2lCBK7ACR3Z79Gt46wM2KuIHQ9RRab4H2zJo21tgA
   klIO5uAmq83cNY2J6fNGP/b+q/1FXsHOfMPN/3/zkfBUsO0G1/nlGHYZP
   N/pd/drVTBRQsJtD9zgYQvaGiFBWoaOqNbRMcIunvexv7HfaIqB/sThLI
   J18g4QwarpUkMocCwFF3BW8gCe/XGNHtyesQbWCkVQvtP2pkWKMs2fWeZ
   g==;
X-CSE-ConnectionGUID: PFaDaq6oSwuVznYQZDGegQ==
X-CSE-MsgGUID: lxgzXrKCRZ+3Qa9CjofnTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84279992"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84279992"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 09:13:21 -0700
X-CSE-ConnectionGUID: Y5j3PxJgTTSVroJ6NPiMaA==
X-CSE-MsgGUID: TXn7fPe/SkOZaBosAMUROw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="256865114"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2026 09:13:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiDqn-00000000J6D-1q93;
	Fri, 10 Jul 2026 16:13:17 +0000
Date: Sat, 11 Jul 2026 00:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/adc/stm32-dfsdm-core.c:481
 stm32_dfsdm_core_resume() warn: 'priv->clk' from clk_prepare() not released
 on lines: 481.
Message-ID: <202607110019.uqVaY2mQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: c021c1b38f90d639423c1369625daa703a8472ea PM: Move two sleep-related functions under CONFIG_PM_SLEEP
date:   1 year ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year ago
config: alpha-randconfig-r072-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110019.uqVaY2mQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c021c1b38f90 ("PM: Move two sleep-related functions under CONFIG_PM_SLEEP")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607110019.uqVaY2mQ-lkp@intel.com/

smatch warnings:
drivers/iio/adc/stm32-dfsdm-core.c:481 stm32_dfsdm_core_resume() warn: 'priv->clk' from clk_prepare() not released on lines: 481.

vim +481 drivers/iio/adc/stm32-dfsdm-core.c

6ec417d2f1a028 Fabrice Gasnier  2019-03-25  466  
ade59a7af270d2 Jonathan Cameron 2022-01-30  467  static int stm32_dfsdm_core_resume(struct device *dev)
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  468  {
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  469  	struct stm32_dfsdm *dfsdm = dev_get_drvdata(dev);
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  470  	struct dfsdm_priv *priv = to_stm32_dfsdm_priv(dfsdm);
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  471  	int ret;
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  472  
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  473  	ret = pinctrl_pm_select_default_state(dev);
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  474  	if (ret)
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  475  		return ret;
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  476  
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  477  	ret = clk_prepare(priv->clk);
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  478  	if (ret)
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  479  		return ret;
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  480  
6ec417d2f1a028 Fabrice Gasnier  2019-03-25 @481  	return pm_runtime_force_resume(dev);
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  482  }
6ec417d2f1a028 Fabrice Gasnier  2019-03-25  483  

:::::: The code at line 481 was first introduced by commit
:::::: 6ec417d2f1a028705a1ae6f59d3e15344f6a4fbe iio: adc: stm32-dfsdm: add PM support

:::::: TO: Fabrice Gasnier <fabrice.gasnier@st.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
