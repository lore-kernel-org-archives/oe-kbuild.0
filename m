Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8BB2F5A05
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557747; cv=none; b=GuLRG8CscOnUkm0Ex7jf0xP+u5zTzFz/+mWsK2pwQN5NSV8sHCzgB0RpMxJ2q2tLkVwfothZdYALnCr/8ongoJpyodY9V0Gn5pPJJqInvBE0ugaOmmPHa8V/4c3RDJD5JSs8vpMNgDng98iyHM+xQ0/anJjapWzLHgp9GDU030M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557747; c=relaxed/simple;
	bh=B7Vp/FaLRPrl9NTx71DTsOdCSouPoDGk3f0np/P23Ac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MKoZCKGEbP6KQ89IkSpfAXmFjbOonr5vLXVwBnvNKFUPuhih5fsvF9NSzfeFxdrW/z845B36o1LvAWruyEsehfdqY2kbN4wsLpmsti1I0r+aSUS24w2e7GB+IaA/mkL8xWR7xL9Zi+1hF/kNsC11+cfT1MBCyV8urZ0HjFmO5rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbhuCXzQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbhuCXzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769557745; x=1801093745;
  h=date:from:to:cc:subject:message-id;
  bh=B7Vp/FaLRPrl9NTx71DTsOdCSouPoDGk3f0np/P23Ac=;
  b=GbhuCXzQ5Qt9zx0261F9G7fopi87s45YxWK4rm32xaFlbVy+J0glHudw
   lKvtlx3dEaktJ7g29q81wGOpPzalnFReR1z+HcnAKfm9t0s17eTzMG6yb
   NHK/M2EDyUYrt2mDXyaoqbJ/xAlpFKE5vjGUlxq1V3eNBHHFD6OgJwKxD
   claNq4FzWTOaDH6RWuNUE6TQ0dcwu00GnjRAnW3QhpHQ+ATNaM3vGxWD7
   zMabsYzmfXiJKkk43JNL5u0+UziOaHkUVfloujXIQkoHwjMDS7GyILLt9
   nrMNunMQQUo6ydTNyiPB2lAxyYPKIBxVlLxB5Qx+jFUklE3iCambDG0n6
   g==;
X-CSE-ConnectionGUID: l13+S8nXQtmVvsgJlivXtA==
X-CSE-MsgGUID: k/HZolncTF2/WZaDC9EgiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="69966088"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="69966088"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 15:49:04 -0800
X-CSE-ConnectionGUID: wUDbx9xCTxOFdw/NHhsnrw==
X-CSE-MsgGUID: qHPsHxxiRW62Yv2/rgmTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="213070079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 15:49:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vksnq-00000000Z2S-1gon;
	Tue, 27 Jan 2026 23:48:58 +0000
Date: Wed, 28 Jan 2026 07:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1729/9906]
 drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant
 expression
Message-ID: <202601280742.mvDCU5qE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: "Alexandru-Catalin Ionita" <alexandru-catalin.ionita@nxp.com>
CC: Ciprian Costea <ciprianmarian.costea@nxp.com>
CC: "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f938c7d3b25d87b356af4106c2682caf8c835a2
commit: 4434072a893e4864519c167947083ff3e4cc2d95 [1729/9906] iio: adc: Add the NXP SAR ADC support for the s32g2/3 platforms
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: parisc-randconfig-r132-20260128 (https://download.01.org/0day-ci/archive/20260128/202601280742.mvDCU5qE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280742.mvDCU5qE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601280742.mvDCU5qE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1014:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/nxp-sar-adc.c:1015:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1015:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/nxp-sar-adc.c:1016:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/nxp-sar-adc.c:1016:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1014 drivers/iio/adc/nxp-sar-adc.c

4434072a893e48 Daniel Lezcano 2025-12-08  1013  
4434072a893e48 Daniel Lezcano 2025-12-08 @1014  MODULE_AUTHOR("NXP");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
