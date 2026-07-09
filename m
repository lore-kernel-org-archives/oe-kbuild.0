Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46A62809
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 22:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783637108; cv=none; b=X9Nsvnm5pRE1cSYDYJkrFTXfbXEWttlvOjXPZh2bAmkjRhdmxjbuJz1/dPHioFHAMuSvc1h9bHn0leNYze+hD/U+zK2yx/XNTpfa1IJsmv3tmCO8mDy8WZzion7uJwdS3coF5+U4j1eXl4THkwIocgx4mMe/NFY6rlz/i11zBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783637108; c=relaxed/simple;
	bh=rtyRp/Xb9V8dPGMVoDy/ItjNNDiikMkOOMuanH21w8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pvFKPNIkhaDgxLOcmKMRmy3AVRYoHXefI1Fgm2PsuKeadMZuSy0S/2TKx4LSpEZY6lVO7HbFKb+nc3ZfzGGbGjNqzdU4WSYFQBsSGct6QU/Np3vc2aiLLJyj0jyNlr8EkoMPZ71YzTrIbgFX46lqobJHLHSMX0pXVhjv+28Q66o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmD/XBVN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmD/XBVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783637106; x=1815173106;
  h=date:from:to:cc:subject:message-id;
  bh=rtyRp/Xb9V8dPGMVoDy/ItjNNDiikMkOOMuanH21w8c=;
  b=BmD/XBVN2NbDjKJO9EQ0/vaIeK/ubSGDVLIxreZL94kRX10R5CkVaFmu
   rvdEMrpakYsI7PN7qVObGLSCQAlIF9HRUawYGhbD4DKWb1bduhi02LpRL
   yBkfYsxtGp0VCeJKqkJlZxQ+Wqr8LZS+vIaAIdijRXDlpwUgJPsiIuzh2
   MOxvrBiyg3Gwr9vF4U8PdOgU+V/3ZD+I5ox0CowP+2YVR6pQIWTKlnz0/
   UoSVERJGC2J9FSRwJB3MWo2ikGIJMX65EwLrWn0nNTZBAoALfi7AI0APV
   gKanuf7tmsCb1tchKCfhv/plK1qe13gMHrobGN1KhUj6B/IU890Oc8TAD
   w==;
X-CSE-ConnectionGUID: KS6uSHRkSayznCGXFm1xGQ==
X-CSE-MsgGUID: OxnSNhjvRyeNkikQJ3ApkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83313820"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83313820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 15:45:05 -0700
X-CSE-ConnectionGUID: WVF2e2j4RHejGSx00euZMg==
X-CSE-MsgGUID: J7NeHsjbQiOTjEuyI4WknA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292911858"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 15:45:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whxUL-00000000ICh-0SZ5;
	Thu, 09 Jul 2026 22:45:01 +0000
Date: Fri, 10 Jul 2026 06:45:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 19/19]
 drivers/mmc/host/mmc_spi.c:172 mmc_spi_skip() error: buffer overflow 'cp' 29
 <= 31
Message-ID: <202607100622.TUC32zpP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   713cfd970c85b62fef547f66366270b9124c5c92
commit: 095cb607f1468d75d87a80ad16e513c8fe82d8e7 [19/19] mmc: mmc_spi: remove custom DMA mapped buffers
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260710/202607100622.TUC32zpP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607100622.TUC32zpP-lkp@intel.com/

New smatch warnings:
drivers/mmc/host/mmc_spi.c:172 mmc_spi_skip() error: buffer overflow 'cp' 29 <= 31

Old smatch warnings:
drivers/mmc/host/mmc_spi.c:173 mmc_spi_skip() error: buffer overflow 'cp' 29 <= 31

vim +/cp +172 drivers/mmc/host/mmc_spi.c

15a0580ced081a David Brownell  2007-08-08  156  
56e303ebeec7ef Wolfgang Muees  2009-04-07  157  static int mmc_spi_skip(struct mmc_spi_host *host, unsigned long timeout,
56e303ebeec7ef Wolfgang Muees  2009-04-07  158  			unsigned n, u8 byte)
15a0580ced081a David Brownell  2007-08-08  159  {
15a0580ced081a David Brownell  2007-08-08  160  	u8 *cp = host->data->status;
56e303ebeec7ef Wolfgang Muees  2009-04-07  161  	unsigned long start = jiffies;
15a0580ced081a David Brownell  2007-08-08  162  
696068470e38e4 Andy Shevchenko 2021-06-23  163  	do {
15a0580ced081a David Brownell  2007-08-08  164  		int		status;
15a0580ced081a David Brownell  2007-08-08  165  		unsigned	i;
15a0580ced081a David Brownell  2007-08-08  166  
15a0580ced081a David Brownell  2007-08-08  167  		status = mmc_spi_readbytes(host, n);
15a0580ced081a David Brownell  2007-08-08  168  		if (status < 0)
15a0580ced081a David Brownell  2007-08-08  169  			return status;
15a0580ced081a David Brownell  2007-08-08  170  
15a0580ced081a David Brownell  2007-08-08  171  		for (i = 0; i < n; i++) {
15a0580ced081a David Brownell  2007-08-08 @172  			if (cp[i] != byte)
15a0580ced081a David Brownell  2007-08-08  173  				return cp[i];
15a0580ced081a David Brownell  2007-08-08  174  		}
15a0580ced081a David Brownell  2007-08-08  175  
696068470e38e4 Andy Shevchenko 2021-06-23  176  		/* If we need long timeouts, we may release the CPU */
696068470e38e4 Andy Shevchenko 2021-06-23  177  		cond_resched();
696068470e38e4 Andy Shevchenko 2021-06-23  178  	} while (time_is_after_jiffies(start + timeout));
15a0580ced081a David Brownell  2007-08-08  179  	return -ETIMEDOUT;
15a0580ced081a David Brownell  2007-08-08  180  }
15a0580ced081a David Brownell  2007-08-08  181  

:::::: The code at line 172 was first introduced by commit
:::::: 15a0580ced081a0f7dc2deea8a4812bdc5e9a109 mmc_spi host driver

:::::: TO: David Brownell <david-b@pacbell.net>
:::::: CC: Pierre Ossman <drzeus@drzeus.cx>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
