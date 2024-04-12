Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8841775
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 11:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712920786; cv=none; b=Jhds5lyCG2KZ+04PHsZ+JILo3/5kw1Q2wCgGpFJdn2ZZRxAUPianwX3vnWkF+uxWdAWEo16oT+4jboYxJNP2yYhC8IC/qLKoZbVN59b9XhQI8D59KXb1d3t6E8VvxZcLhvyA2zsEcuMNWVS2bBob8jxDVBva2vU75D++6x8MJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712920786; c=relaxed/simple;
	bh=ctzWgqfJv5fnk95ge32HhAYqZHPGWiIaOjf/Ni3JnuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgkhPc6k/Ky7txMyO20Z8W+0HgLXDaUGpN3K1TSRDnYkALcybBfcEzYI+mA3Q0wJkqPL6RA5u8dXYKjdaWWYiCDC1lg6H1uS0yVGN7GSBt4ZrIZvmSVg66FsSIOvOgQLS8SDsyZ4He6oSGMzM/gn9qdJ36NyiUxcLy0vL6ZsRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0387z/X; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0387z/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712920785; x=1744456785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctzWgqfJv5fnk95ge32HhAYqZHPGWiIaOjf/Ni3JnuE=;
  b=N0387z/XqRPRlNOW3tLMIESnZiGMLypEJfgW+KJIvnVR7xCzqU0tZ2n8
   RtK+wdV20hn5dlXnRsQulN/GWRDqjvMa09xzYqhAFjoVPozPoZJC3ZRt3
   DaQCbvwZQs2Ng6bVtTLaJrfel7vWW6gv/e4XvuNv8Bg/X+HpmKSit8PoW
   69tm37BCcyRhAts6R45D8OBaVgpCTigLJdtEsNEFXBhRjo3ZxRpnqO1Ni
   zVlUMq2F3LeLlr1z1OoepZQmVBM8E2BvaCiF2mBu84HRgLSMHNCynas9C
   H/mdvPdlLtK9EN/GMhoN4+5+hG2DImKC+Oi2+45tfu8nbs9ImnRUusJzj
   Q==;
X-CSE-ConnectionGUID: 1zI3wXLyThijp530ym1Pug==
X-CSE-MsgGUID: AooTLO5FT3eDPE8Ml9wL0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8289505"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8289505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 04:19:44 -0700
X-CSE-ConnectionGUID: PgFclvpZRc29VpLKlB/rIQ==
X-CSE-MsgGUID: DZgOk98jRYa6EyobfSPKwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="21292627"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2024 04:19:42 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvEwW-0009hp-1Y;
	Fri, 12 Apr 2024 11:19:40 +0000
Date: Fri, 12 Apr 2024 19:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 331/438]
 arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1261 pseudo_lock_measure_trigger()
 warn: potential spectre issue 'buf' [w]
Message-ID: <202404121902.YyIVlsC0-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: b07f20689e1567c51174538eb7ddfc7b86170dd6 [331/438] x86/kernel: convert to read/write iterators
:::::: branch date: 16 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121902.YyIVlsC0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404121902.YyIVlsC0-lkp@intel.com/

smatch warnings:
arch/x86/kernel/cpu/resctrl/pseudo_lock.c:1261 pseudo_lock_measure_trigger() warn: potential spectre issue 'buf' [w]

vim +/buf +1261 arch/x86/kernel/cpu/resctrl/pseudo_lock.c

443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1246  
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1247  static ssize_t pseudo_lock_measure_trigger(struct kiocb *iocb,
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1248  					   struct iov_iter *from)
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1249  {
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1250  	struct rdtgroup *rdtgrp = iocb->ki_filp->private_data;
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1251  	size_t count = iov_iter_count(from);
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1252  	size_t buf_size;
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1253  	char buf[32];
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1254  	int ret;
8a2fc0e1bc0cd85 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1255  	int sel;
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1256  
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1257  	buf_size = min(count, (sizeof(buf) - 1));
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1258  	if (!copy_from_iter_full(buf, buf_size, from))
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1259  		return -EFAULT;
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1260  
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22 @1261  	buf[buf_size] = '\0';
8a2fc0e1bc0cd85 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1262  	ret = kstrtoint(buf, 10, &sel);
8a2fc0e1bc0cd85 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1263  	if (ret == 0) {
53ed74af05517cf arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-09-19  1264  		if (sel != 1 && sel != 2 && sel != 3)
8a2fc0e1bc0cd85 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1265  			return -EINVAL;
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1266  		ret = debugfs_file_get(iocb->ki_filp->f_path.dentry);
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1267  		if (ret)
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1268  			return ret;
8a2fc0e1bc0cd85 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1269  		ret = pseudo_lock_measure_cycles(rdtgrp, sel);
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1270  		if (ret == 0)
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1271  			ret = count;
b07f20689e1567c arch/x86/kernel/cpu/resctrl/pseudo_lock.c   Jens Axboe      2024-04-11  1272  		debugfs_file_put(iocb->ki_filp->f_path.dentry);
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1273  	}
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1274  
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1275  	return ret;
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1276  }
443810fe6160542 arch/x86/kernel/cpu/intel_rdt_pseudo_lock.c Reinette Chatre 2018-06-22  1277  

:::::: The code at line 1261 was first introduced by commit
:::::: 443810fe6160542c78e24c66047edd7a3cc830c6 x86/intel_rdt: Create debugfs files for pseudo-locking testing

:::::: TO: Reinette Chatre <reinette.chatre@intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
