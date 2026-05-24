Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D92737FC
	for <oe-kbuild@lists.linux.dev>; Sun, 24 May 2026 02:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779591081; cv=none; b=s+zz7rDNUwOGMNLw+Pjwn8y1J5kwoTMjVTAQfU9+azxK19mWJ/gTerCpyyi8ipUTNrUvvFbp0nK8RjW32WfoiLS2xMPBLBLDgfRLuPfoWGtWhiYGX421j1/2arFPnACHBxlL88sAg7eV5Rlf+OctHhBaNfQMHkKXUAluZyLdBSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779591081; c=relaxed/simple;
	bh=VuzYJylauD9erNX88UwnFFvz9LKjyk5DreEo9sBDaAc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GoEzgQt9/Amx514uc/YsfhyORM0+ZtOPhihXVd8IB1ydjyv9RYeGJ4ymJHcewJPteLk8ezKHefOO8MIssUl88FLEXgFnjNelpnmfYcQRnf/uPRkVmuxWg7W9T4pWCVZ+orgupguCKxk+8xbe0iJm4huuZYPUgzT+cQzxfcclAL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPzwvJRw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPzwvJRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779591080; x=1811127080;
  h=date:from:to:cc:subject:message-id;
  bh=VuzYJylauD9erNX88UwnFFvz9LKjyk5DreEo9sBDaAc=;
  b=FPzwvJRw8w4c/F6Mc/N5HPwqkDEE+qES5NfpXZE7Z2M94650XrB06s0t
   c9+OMQEmbjr0ckYETUHYCChjP3fU69QziYWrMOUnh2pk4Mm/5ach6j8Pa
   nbkVly26G+h8ULhZZyUIoZc0wuYoGVYrWrAyzgyBoU9gzReN2JanOtPeN
   24IQXsnMbmrO1CoC/BMhAPZGyhG9516x2aO2s7zUm0Ef5tAQk4R2BAdrM
   hNyPHkDvtPsKyyqe5+RdKnBR81/wHu6cmZBewnx9eaDO5FCbWIdoj32Xn
   7WDos/FAaIjMiWX3ZYqj8/KvZoP4DbaFAR7JCuwtJLoUYHnAk6FAuFzKy
   Q==;
X-CSE-ConnectionGUID: M4dRen7HSwKUkDbOJ6wbrw==
X-CSE-MsgGUID: oG44wxBtTPeDYfADgdXItw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="103139520"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="103139520"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 19:51:19 -0700
X-CSE-ConnectionGUID: ifBOcOaeQqGGuzSATfSC4Q==
X-CSE-MsgGUID: yk7JZWzORZyxYGovwgctHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246344592"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 19:51:17 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQyvr-000000000dL-1KhK;
	Sun, 24 May 2026 02:51:15 +0000
Date: Sun, 24 May 2026 10:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: warning:
 'lpi_gpio_write' defined but not used
Message-ID: <202605241040.1av35pgK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Ajay-Kumar-Nandam/pinctrl-qcom-lpass-lpi-Enable-runtime-PM-hooks-on-LPASS-LPI-SoCs/20260523-045345, commit: 17180a26c6c4b402663de8c4118bc02db50d869d"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ajay-Kumar-Nandam/pinctrl-qcom-lpass-lpi-Enable-runtime-PM-hooks-on-LPASS-LPI-SoCs/20260523-045345
head:   17180a26c6c4b402663de8c4118bc02db50d869d
commit: 17180a26c6c4b402663de8c4118bc02db50d869d pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605241040.1av35pgK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241040.1av35pgK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605241040.1av35pgK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: warning: 'lpi_gpio_write' defined but not used [-Wunused-function]
      82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
         |            ^~~~~~~~~~~~~~


vim +/lpi_gpio_write +82 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c

6e261d1090d6db Srinivas Kandagatla 2020-12-02  81  
6e261d1090d6db Srinivas Kandagatla 2020-12-02 @82  static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
6e261d1090d6db Srinivas Kandagatla 2020-12-02  83  			  unsigned int addr, unsigned int val)
6e261d1090d6db Srinivas Kandagatla 2020-12-02  84  {
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  85  	int ret;
18d676ac0cce3e Nickolay Goppen     2025-09-08  86  
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  87  	ret = pm_runtime_resume_and_get(state->dev);
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  88  	if (ret < 0)
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  89  		return ret;
18d676ac0cce3e Nickolay Goppen     2025-09-08  90  
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  91  	__lpi_gpio_write(state, pin, addr, val);
6e261d1090d6db Srinivas Kandagatla 2020-12-02  92  
17180a26c6c4b4 Ajay Kumar Nandam   2026-05-23  93  	return pm_runtime_put_autosuspend(state->dev);
6e261d1090d6db Srinivas Kandagatla 2020-12-02  94  }
6e261d1090d6db Srinivas Kandagatla 2020-12-02  95  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
