Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46E38656C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569210; cv=none; b=jrd5x8ZP6FZZQWhfKQhKA9rko2Zm7YCIGyArq6Ktv2d7rflUeWVvJXcuCJD15dcPttPLgAh01S7IuI+kvs54hzPQS19BZL/gF8ZWV4kaeMQyzMGkMPryu7iRy6nhUKAv0wqoJ5pR4Nf1RqUMNBSNHNl+VwlfRcP9VgRUEmTopJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569210; c=relaxed/simple;
	bh=zAdgwyaWg5fXMB47RGiYo6X+jMGLBhlB9gYF/Sp/6FQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QBH1S5elvKzudpc9ruhO13l6gNCXCMdiZCRnEzqNk9pv6q+oU3gFf2ZvcuCEL4xPMFh2vwzCayF9I1jtenRJDkGa59cg3LdTSb0iJZJulqk6T+763bcpj4nAmhcRCZ4ypWCSpHYKXV2DH5JqEp5+9rOygD0/11cSXmAC5OFcyLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJXXUMsc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJXXUMsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774569208; x=1806105208;
  h=date:from:to:cc:subject:message-id;
  bh=zAdgwyaWg5fXMB47RGiYo6X+jMGLBhlB9gYF/Sp/6FQ=;
  b=IJXXUMsc7V9BDu50ZvrZZkVMQx3j8zRkXn9fgkZ4OXGtMFtwtWybXN+h
   yOXADOyJT9mrf5b45yxUHWLX4BKuznIgnF+C8UbewTqp0Xcpryo6/KZYh
   7LIEQrA+9kfgKQjKmAwTAyBdAn9LhGu2t+wQ3ACVV23k5fzBnpw0JZ/CR
   iecpfd255j4DRSfVPS+eMR2SJynHGvl/4Df+8hm5enQn4p/Cbyql9f+6r
   wcGyW+6XTYiIMSr1xI+lf5d3oGXXQR+ffwNtSM2o8MvdYo0MmlbHwnSxH
   dxC8+wo3u/8Q7jGv49eI7ljA2m3gfVp+Ktj69yP1r0MJUysz/bxP8EpBV
   g==;
X-CSE-ConnectionGUID: LZLJsXrWT4qukzUTN26/sA==
X-CSE-MsgGUID: XXlFDuDTRR21yBdlmz8lww==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87023163"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="87023163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 16:53:28 -0700
X-CSE-ConnectionGUID: jPt8Za3ZTmO6MF3yAVzq0g==
X-CSE-MsgGUID: gGpbT5XoTWWCZiVvcWGeLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="229932163"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Mar 2026 16:53:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5uVw-000000009Vl-31Dp;
	Thu, 26 Mar 2026 23:53:24 +0000
Date: Fri, 27 Mar 2026 07:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/adc/stm32-dfsdm-core.c:481
 stm32_dfsdm_core_resume() warn: 'priv->clk' from clk_prepare() not released
 on lines: 481.
Message-ID: <202603270745.0UaVkvcv-lkp@intel.com>
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
head:   46b513250491a7bfc97d98791dbe6a10bcc8129d
commit: c021c1b38f90d639423c1369625daa703a8472ea PM: Move two sleep-related functions under CONFIG_PM_SLEEP
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r073-20260327 (https://download.01.org/0day-ci/archive/20260327/202603270745.0UaVkvcv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603270745.0UaVkvcv-lkp@intel.com/

smatch warnings:
drivers/iio/adc/stm32-dfsdm-core.c:481 stm32_dfsdm_core_resume() warn: 'priv->clk' from clk_prepare() not released on lines: 481.

vim +481 drivers/iio/adc/stm32-dfsdm-core.c

6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  466  
ade59a7af270d24 Jonathan Cameron 2022-01-30  467  static int stm32_dfsdm_core_resume(struct device *dev)
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  468  {
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  469  	struct stm32_dfsdm *dfsdm = dev_get_drvdata(dev);
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  470  	struct dfsdm_priv *priv = to_stm32_dfsdm_priv(dfsdm);
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  471  	int ret;
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  472  
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  473  	ret = pinctrl_pm_select_default_state(dev);
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  474  	if (ret)
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  475  		return ret;
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  476  
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  477  	ret = clk_prepare(priv->clk);
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  478  	if (ret)
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  479  		return ret;
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  480  
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25 @481  	return pm_runtime_force_resume(dev);
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  482  }
6ec417d2f1a0287 Fabrice Gasnier  2019-03-25  483  

:::::: The code at line 481 was first introduced by commit
:::::: 6ec417d2f1a028705a1ae6f59d3e15344f6a4fbe iio: adc: stm32-dfsdm: add PM support

:::::: TO: Fabrice Gasnier <fabrice.gasnier@st.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
