Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED94346E43
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 05:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687494; cv=none; b=BflwN9r8CdKe4sGNrc0HRB4CZyZeuKhmND+GWOJulME+wDhGEnF7q+VQJVWd8ExdEiki5tud4+We8PuJxZI3SDzmPBdCu/+9GVHb/DEWmIcIZEnwy9fVRjaukr+ljjMtozf2MA+lBPLLAKVWwHiahakto3kmchQuNcvo/7UeJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687494; c=relaxed/simple;
	bh=nQUu7s2TMJUvY9+9YzZA+VbgL8RFwhh7U/9013zV7d8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LhuIImK2YyPMc+RiqGYDkndy0FVtOoC7CDWjYDMhFXMwmTitk4ogwdfC+WvKkKxltNR42gEsymRLH6U7Ie3mcZn/VZvM71y3IPh8lLeSwkw7nAj4UR4UkNWR3+cil3G8uMgFLxebL7Gt7C6LkKsA5LmsN5DP1xGNdhBUTP1Sq0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDIyFAwo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDIyFAwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779687490; x=1811223490;
  h=date:from:to:cc:subject:message-id;
  bh=nQUu7s2TMJUvY9+9YzZA+VbgL8RFwhh7U/9013zV7d8=;
  b=SDIyFAwor5NYlv7v2qNDj0Xb/zvZxLjgvn9lrDFSoIwO4rWDjWwjL22L
   yMSr4aH+lUAy2lZ6yCbVf0NAAwBKgIYTTexJHrcuRYFzHsz9Dsrd+KLka
   GmPtFa5VTy/QJ91YMX7Ta5+7dBJByTKDu8FINwKRU8wpHpgDoKuW/mvYh
   P7DAiwEtKnVW9j+ZPvVZ9IrgwavomJP/2KDJ4nN5hrti3r4Dj01RZNDRt
   2UW6+QgMS4XJcYg1seKIGix2G6UkEN3wV8SsFQTJ4eJjl6s+bF0FWTNlH
   DZ/sYr0Ep61qWDQo6gSmghzR8/fzWl/8HKJZ2cutorhnSVOwanSqEuJRR
   Q==;
X-CSE-ConnectionGUID: KSxD0HoQQOm8NhnfdZD59g==
X-CSE-MsgGUID: 9gRCeC61SwKdf//1zoVKuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="79653665"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="79653665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 22:38:06 -0700
X-CSE-ConnectionGUID: Y1os1iG0S3itAnVlwDIjCA==
X-CSE-MsgGUID: XwlOOqEPSQmPUV80exOqFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237082630"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2026 22:38:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRO0o-0000000017R-3A5I;
	Mon, 25 May 2026 05:38:02 +0000
Date: Mon, 25 May 2026 13:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 return around line 555.
Message-ID: <202605251340.6R7jAyAS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 63d2059cd665c4e5e4ca6cfbc58c6f171e7939b1 pinctrl: imx1: Allow parsing DT without function nodes
date:   13 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 13 days ago
config: sh-randconfig-r062-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251340.6R7jAyAS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605251340.6R7jAyAS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 555.
   drivers/pinctrl/freescale/pinctrl-imx1-core.c:557:2-24: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 559.

vim +/for_each_child_of_node +553 drivers/pinctrl/freescale/pinctrl-imx1-core.c

30612cd90005d8 drivers/pinctrl/pinctrl-imx1-core.c           Markus Schneider-Pargmann 2013-10-28  542  
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  543  /*
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  544   * Check if the DT contains pins in the direct child nodes. This indicates the
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  545   * newer DT format to store pins. This function returns true if the first found
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  546   * fsl,pins property is in a child of np. Otherwise false is returned.
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  547   */
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  548  static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  549  {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  550  	struct device_node *function_np;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  551  	struct device_node *pinctrl_np;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  552  
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05 @553  	for_each_child_of_node(np, function_np) {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  554  		if (of_property_present(function_np, "fsl,pins"))
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05 @555  			return true;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  556  
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  557  		for_each_child_of_node(function_np, pinctrl_np) {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  558  			if (of_property_present(pinctrl_np, "fsl,pins"))
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  559  				return false;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  560  		}
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  561  	}
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  562  
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  563  	return true;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  564  }
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  565  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
