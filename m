Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0540A13B792
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734476467; cv=none; b=upsOwAJcbmm9ChC5LubLAlmAnMDgI9A2yMQRonO+k9cMC3Z28qvNM45tfUa8AevqUnzGjWKtEeIthVZiWDbZmd16kvvLyGE7acF8oo0vrovrK2lJWnD/+IBesf5L4EYQ6tMw8dCTD7jztFa9KdVjgNEp5unc4mmH8/oX7QoVXW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734476467; c=relaxed/simple;
	bh=zc8ruqt9qCbhRodMD5OirZo9zwsV6OrLhm7vGsO0gDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPiJLpDqzpSvjl+5ql3LLRbwJ/M4PtPuZq9xTW7fVYVbP3VF5TbinqL00RIqWUaF6cjSzBZ/NU7QOotzweV0dTH3jB2Qe1GmEXiX5+JlPkBFYR+FK6oVOUlR1305XM6Bq7pu2h/QCxpLt7+eyyEhyDCv8Wz5k73/TmCXTUeqRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ll0AJC6c; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ll0AJC6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734476465; x=1766012465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zc8ruqt9qCbhRodMD5OirZo9zwsV6OrLhm7vGsO0gDI=;
  b=Ll0AJC6cpjVvIa+4rluvJRlN5Jt7ggsympUAWWWoeDeunFu2wlcdhgFg
   nCqDnZBgl/8AZ0Yy2S86ctRZJL2TU7Se9vyLDEk/ieGCFrHclHzQ+B07J
   mxF4WQ7YLlHNhJMOjV0uo6FMOaUIyChQz46M07A4aHoMNgMFAfVL1sK9Z
   4L24B//NGXBaaUC3BOrJkNi0kIJELE2qHYe5piqDTwMmEI+DtfdyEaYNL
   Jok7vl2ENqPkJdeb2jfZTl9Q/P29dGtEdI/BIiOaIMPnh8CvzFXu5lyVf
   z6kFjS8D+whErT7ZkDXJzjK1hPjmOyTBigpEO3dxYDk3mcXotYyPDDhqs
   A==;
X-CSE-ConnectionGUID: 33/WtrImSoCNEBnF2ECbwg==
X-CSE-MsgGUID: jge+Fu3sRAKO2BGdhfLFKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34961083"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="34961083"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 15:00:53 -0800
X-CSE-ConnectionGUID: hUwibVxNRQqw+cvX0XLnVQ==
X-CSE-MsgGUID: duaM8NBtTci4ax0PB9lQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101807198"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2024 15:00:51 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNgYb-000FsU-01;
	Tue, 17 Dec 2024 23:00:49 +0000
Date: Wed, 18 Dec 2024 07:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 1640/1640] drivers/ata/ahci_zhaoxin_sgpio.c:36
 ahci_wait_em_reset() warn: variable dereferenced before check
 'sgpio_zhaoxin' (see line 33)
Message-ID: <202412180610.tvT1b9wN-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: "LeoLiu-oc" <leoliu-oc@zhaoxin.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [1640/1640] ata: ahci: Add support for AHCI SGPIO Enclosure Management
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20241217 (https://download.01.org/0day-ci/archive/20241218/202412180610.tvT1b9wN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412180610.tvT1b9wN-lkp@intel.com/

smatch warnings:
drivers/ata/ahci_zhaoxin_sgpio.c:36 ahci_wait_em_reset() warn: variable dereferenced before check 'sgpio_zhaoxin' (see line 33)
drivers/ata/ahci_zhaoxin_sgpio.c:335 ahci_transmit_sgpio_indicator_gp() warn: inconsistent returns '&sgpio_zhaoxin->wr_lock'.

vim +/sgpio_zhaoxin +36 drivers/ata/ahci_zhaoxin_sgpio.c

fb43492008c11f leoliu-oc 2024-06-18  25  
fb43492008c11f leoliu-oc 2024-06-18  26  static unsigned int zhaoxin_em_type __read_mostly = AHCI_EM_MSG_LED_MODE; /*LED protocol*/
fb43492008c11f leoliu-oc 2024-06-18  27  module_param(zhaoxin_em_type, int, 0644);
fb43492008c11f leoliu-oc 2024-06-18  28  MODULE_PARM_DESC(zhaoxin_em_type,
fb43492008c11f leoliu-oc 2024-06-18  29  	"AHCI Enclosure Management Message type control (1 = led on, 2 = sgpio on,3 = sgpio gp on)");
fb43492008c11f leoliu-oc 2024-06-18  30  
fb43492008c11f leoliu-oc 2024-06-18  31  int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
fb43492008c11f leoliu-oc 2024-06-18  32  {
fb43492008c11f leoliu-oc 2024-06-18 @33  	void __iomem *mmio = sgpio_zhaoxin->mmio;
fb43492008c11f leoliu-oc 2024-06-18  34  	u32 em_ctl;
fb43492008c11f leoliu-oc 2024-06-18  35  
fb43492008c11f leoliu-oc 2024-06-18 @36  	if (!sgpio_zhaoxin || retry == 0) {
fb43492008c11f leoliu-oc 2024-06-18  37  		pr_err("In ahci wait em reset, invalid param\n");
fb43492008c11f leoliu-oc 2024-06-18  38  		return -EINVAL;
fb43492008c11f leoliu-oc 2024-06-18  39  	}
fb43492008c11f leoliu-oc 2024-06-18  40  
fb43492008c11f leoliu-oc 2024-06-18  41  	while (retry--) { /*EM_CTL needs reset at least 64ms*/
fb43492008c11f leoliu-oc 2024-06-18  42  		em_ctl = readl(mmio + HOST_EM_CTL);
fb43492008c11f leoliu-oc 2024-06-18  43  		if (em_ctl & EM_CTL_RST)
fb43492008c11f leoliu-oc 2024-06-18  44  			usleep_range(10000, 20000); /*EM_CTL still in reset, usleep 10ms*/
fb43492008c11f leoliu-oc 2024-06-18  45  		else
fb43492008c11f leoliu-oc 2024-06-18  46  			break;
fb43492008c11f leoliu-oc 2024-06-18  47  
fb43492008c11f leoliu-oc 2024-06-18  48  		if (!retry)
fb43492008c11f leoliu-oc 2024-06-18  49  			pr_err("Wait for EM_CTL reset, time out\n");
fb43492008c11f leoliu-oc 2024-06-18  50  	}
fb43492008c11f leoliu-oc 2024-06-18  51  
fb43492008c11f leoliu-oc 2024-06-18  52  	return 0;
fb43492008c11f leoliu-oc 2024-06-18  53  }
fb43492008c11f leoliu-oc 2024-06-18  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
