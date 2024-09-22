Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3228F4
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726992587; cv=none; b=dPV2jzsggV6/Tpjudj2X1TCaR42fACJOp4VBcplNjSSEuZHPeXWLGlq+uPdHQPFGbavXPbbxUU1z4rMJW/lb9z2OHuHEqjwsU1JMjdGtj+wM9SrK7ZwAIdnSAT3D+DKczhb7FRAgkb6q0If7fV10n1uRyiHWY/C4quzp6QwV2Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726992587; c=relaxed/simple;
	bh=lSY/YktBI4ltA4suCE2B6IZ7qwDSMAOewEHkOz31oUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OOWFTOgztAselvthYeJXquStaIPRpVdsSpHzy2wY2kY/12cqtAsvSzNNN1+W1eQXyvzF04mw4sSKZGGGC9MEPupiZEkY/ji1o3QZdbdpPzFwno4VLeFESADNBfulq6m5hN62ZC0ZrCIoPR19E6rk9Vc/8ihFfnlsATD+CKLTzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwBe6BHC; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwBe6BHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726992585; x=1758528585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lSY/YktBI4ltA4suCE2B6IZ7qwDSMAOewEHkOz31oUM=;
  b=TwBe6BHCkicMrw5HIVEP5F+nz/X5kvfHVsViIeP2r3WRWmbk3RMNAknU
   F1rBSuQb6whN8zk1fGHEb5bvp4lOmX79Lcvtp9kLIEUY2D49cRtkEIG4s
   zBn3FSDnAqC45JnorO9oUga/wwYa43aTHLKXYwYac56SUvjNM/I6PQU8b
   W+zCnJWALlQh7hIY+8rJZTpQZ/ZqBgMG2YdmC/dsgJEDcuhTCuX4ibI05
   wbEaMAVxHy1q5TsiHgKl9FY2tTbAfkxub3M1VRu9DCOr63bcNhvnoHMfP
   dmC6JFCTVGSv5UmUHmghQ6ofelOVU/MTWtqPO3vPkgfwMQz6g/QK9ZgqP
   Q==;
X-CSE-ConnectionGUID: vfe6iI/0R5yGVKRWF0b4eA==
X-CSE-MsgGUID: NYpct6DHQXS5LPyJEQk36Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36615878"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36615878"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 01:09:45 -0700
X-CSE-ConnectionGUID: tLToT9TKR+SKxZcayxDLrA==
X-CSE-MsgGUID: l0wX6zWhQkqnIZycFDVItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75703864"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2024 01:09:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssHf3-000G8T-0z;
	Sun, 22 Sep 2024 08:09:41 +0000
Date: Sun, 22 Sep 2024 16:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 335/448] arch/x86/mm/pkeys.c:151
 init_pkru_write_file() warn: potential spectre issue 'buf' [w]
Message-ID: <202409221627.dt45gV2I-lkp@intel.com>
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
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: 083d5a15e39c7e798998664b292946133858524f [335/448] x86/mm: convert to read/write iterators
:::::: branch date: 82 minutes ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221627.dt45gV2I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221627.dt45gV2I-lkp@intel.com/

smatch warnings:
arch/x86/mm/pkeys.c:151 init_pkru_write_file() warn: potential spectre issue 'buf' [w]

vim +/buf +151 arch/x86/mm/pkeys.c

76de993727d22e Dave Hansen 2016-07-29  138  
083d5a15e39c7e Jens Axboe  2024-04-11  139  static ssize_t init_pkru_write_file(struct kiocb *iocb, struct iov_iter *from)
76de993727d22e Dave Hansen 2016-07-29  140  {
083d5a15e39c7e Jens Axboe  2024-04-11  141  	size_t count = iov_iter_count(from);
76de993727d22e Dave Hansen 2016-07-29  142  	char buf[32];
76de993727d22e Dave Hansen 2016-07-29  143  	ssize_t len;
76de993727d22e Dave Hansen 2016-07-29  144  	u32 new_init_pkru;
76de993727d22e Dave Hansen 2016-07-29  145  
76de993727d22e Dave Hansen 2016-07-29  146  	len = min(count, sizeof(buf) - 1);
083d5a15e39c7e Jens Axboe  2024-04-11  147  	if (!copy_from_iter_full(buf, len, from))
76de993727d22e Dave Hansen 2016-07-29  148  		return -EFAULT;
76de993727d22e Dave Hansen 2016-07-29  149  
76de993727d22e Dave Hansen 2016-07-29  150  	/* Make the buffer a valid string that we can not overrun */
76de993727d22e Dave Hansen 2016-07-29 @151  	buf[len] = '\0';
76de993727d22e Dave Hansen 2016-07-29  152  	if (kstrtouint(buf, 0, &new_init_pkru))
76de993727d22e Dave Hansen 2016-07-29  153  		return -EINVAL;
76de993727d22e Dave Hansen 2016-07-29  154  
76de993727d22e Dave Hansen 2016-07-29  155  	/*
76de993727d22e Dave Hansen 2016-07-29  156  	 * Don't allow insane settings that will blow the system
76de993727d22e Dave Hansen 2016-07-29  157  	 * up immediately if someone attempts to disable access
76de993727d22e Dave Hansen 2016-07-29  158  	 * or writes to pkey 0.
76de993727d22e Dave Hansen 2016-07-29  159  	 */
76de993727d22e Dave Hansen 2016-07-29  160  	if (new_init_pkru & (PKRU_AD_BIT|PKRU_WD_BIT))
76de993727d22e Dave Hansen 2016-07-29  161  		return -EINVAL;
76de993727d22e Dave Hansen 2016-07-29  162  
76de993727d22e Dave Hansen 2016-07-29  163  	WRITE_ONCE(init_pkru_value, new_init_pkru);
76de993727d22e Dave Hansen 2016-07-29  164  	return count;
76de993727d22e Dave Hansen 2016-07-29  165  }
76de993727d22e Dave Hansen 2016-07-29  166  

:::::: The code at line 151 was first introduced by commit
:::::: 76de993727d22eb29c716abacfae9d9444bb7897 x86/pkeys: Allow configuration of init_pkru

:::::: TO: Dave Hansen <dave.hansen@linux.intel.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
