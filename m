Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FA0221FC6
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 05:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773811351; cv=none; b=bUqKXC1vU/RJS7mzR0g0+/ELQA/l/IjFQTCV9QWcW4sPN2lir2xPgpW3bAtp0qDlVr7rbOQSQEGpFlF1dBs4z7EtGCGd4KSVS+2fk52i6KD8IfQI/lQp9N9v4b1WMCPkL0hlNxTeSvJIG1Tk3P+8Q7rNs2g/uW5LKYXhvQHOiNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773811351; c=relaxed/simple;
	bh=l0KAT/qhus0zeDZ1D948qhcwH351/jNxjyiq0JiwPxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ag+Za9l6shlqsrNxEZTbkt1lawAHH7dxmdFWejdHcLdF0d9EiX7qfIn4Kp6lKOtspkjJoTeWs1CR+2F0glg64uQPL0lj5+eRbgnBf377q71qtcJDAL/RawUwFLzdZ99RSo0TzxB68w9Mc/EEOIdS/H2cviW9a4YSXqH4DSll5LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eq3O1nOv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eq3O1nOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773811349; x=1805347349;
  h=date:from:to:cc:subject:message-id;
  bh=l0KAT/qhus0zeDZ1D948qhcwH351/jNxjyiq0JiwPxo=;
  b=Eq3O1nOvffFGqWuutg7U4M1Adf64sOAt/6E1nWMkwIahCdoWgyRlGMhu
   n8S4DXHvQq0S10j4JjXs4J4/Hbec6t8UHF3egkiW8fi4N60FIzuHfbK7j
   FvZAtbEW2PLQXg6tFfQQy/DzOiqLjmJEVivSKSKJrobnLJ1t32XCzCijk
   x26g0vpzG+CVVhDK6uFPd8k6lEvwx1aRi5DWOuf56TyTG0doSHOCCC2sJ
   fQscjRBukZDWB1sChLNWcxh6Et/Tyse709LupASn67r7UztOOBi0u51cj
   AceN5jndu2QUFLT03HrvqLQXwzY/5BOoBHXOKAv3Cs3wUnVda8XVar0R/
   A==;
X-CSE-ConnectionGUID: A0dvytqZQTufMbLGtgQiUA==
X-CSE-MsgGUID: bhVpIcBcS6+6hxnG1GQ2+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74744701"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74744701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 22:22:29 -0700
X-CSE-ConnectionGUID: HQfsb16ITa+lH3DS2fkzPQ==
X-CSE-MsgGUID: 3nfcdVX5SLu257PJMIZDeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="224603826"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Mar 2026 22:22:27 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2jMO-000000002YP-42Hc;
	Wed, 18 Mar 2026 05:22:24 +0000
Date: Wed, 18 Mar 2026 13:21:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dk:rw_iter 318/471] arch/x86/mm/pkeys.c:151
 init_pkru_write_file() warn: potential spectre issue 'buf' [w]
Message-ID: <202603181313.se1Glo5A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   git://git.kernel.dk/linux rw_iter
head:   7e8e9e30f1231e9ab34d17d42798297a502683f3
commit: a2a517bdbc607ba976ebc347c239b745943d8e35 [318/471] x86/mm: convert to read/write iterators
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20260318 (https://download.01.org/0day-ci/archive/20260318/202603181313.se1Glo5A-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603181313.se1Glo5A-lkp@intel.com/

smatch warnings:
arch/x86/mm/pkeys.c:151 init_pkru_write_file() warn: potential spectre issue 'buf' [w]

vim +/buf +151 arch/x86/mm/pkeys.c

76de993727d22e Dave Hansen 2016-07-29  138  
a2a517bdbc607b Jens Axboe  2024-04-11  139  static ssize_t init_pkru_write_file(struct kiocb *iocb, struct iov_iter *from)
76de993727d22e Dave Hansen 2016-07-29  140  {
a2a517bdbc607b Jens Axboe  2024-04-11  141  	size_t count = iov_iter_count(from);
76de993727d22e Dave Hansen 2016-07-29  142  	char buf[32];
76de993727d22e Dave Hansen 2016-07-29  143  	ssize_t len;
76de993727d22e Dave Hansen 2016-07-29  144  	u32 new_init_pkru;
76de993727d22e Dave Hansen 2016-07-29  145  
76de993727d22e Dave Hansen 2016-07-29  146  	len = min(count, sizeof(buf) - 1);
a2a517bdbc607b Jens Axboe  2024-04-11  147  	if (!copy_from_iter_full(buf, len, from))
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
