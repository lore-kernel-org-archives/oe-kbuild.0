Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069551C5A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Sep 2024 06:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726554533; cv=none; b=GEcSr6PC6KZ0YHcYxPnuaUADZHCah00Z2BoujaB7hEv3xYuEjSKp4JWpfKNZyS/SEaBunZPoJbm+Ritug/pCqZedTLMMOJKu9UYCHmohhtcxtUmDqduq7FSEHEVzGsQwar+Th0zGVuptalQj0PiIHjn992oeu8C/2Na1TWH2qF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726554533; c=relaxed/simple;
	bh=NtlTFMULOm9QUW2xAIgJWIOJf9/RU5ImfrNBCf/ouGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aLGDEoQ8vQ7zrMfTpBvMQam39XzFTVCnVLZ/Gxt/Q96nct0FHTeVSKag/lGY8qaBA2X4mdzULSd88i7tQCCh6hvrgUWHuqsmY0vcMcntkTGi5ZNgKVefXGp6lb5RSvlrs9z0T7Q0XQMDsBPQhMD45WQNBsjrogoWs3ZnYR6HND4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq1sVHF+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq1sVHF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726554532; x=1758090532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtlTFMULOm9QUW2xAIgJWIOJf9/RU5ImfrNBCf/ouGQ=;
  b=Rq1sVHF+g6sxFEsUxhXku40Ayi3T/VDDR1oLn1eevJrvDAmyO6UH0klI
   siJsN7tvv/MmgMhWtYREDihZikNZ6KRNeD/hZENhhj0LorcIcaucN9zOz
   QcExlHzph+NAXfZyRl8SHRgiwyyvUsUHhVew7wNxQhYIBOme4vCymbQTX
   G0YTrx1wax5Doc/oT6oMrPQR/tO438NCmwzedBqUIgkim1IvEL4WCMnTL
   ZBYAP+Ow7zz/n4hBJBzUh43hN3iBmhWG0F9gcT9YBj5NkPzM3y4r74/IJ
   oY0xiK5SPMRpqWArmZvPXZpVTwrR21zxbefwdmf3k2J4trBh42zzOd6bY
   A==;
X-CSE-ConnectionGUID: MO8Fzoc+QgSbcPf4JLILuA==
X-CSE-MsgGUID: vJpRtzAyRK+0DkYCjnt0TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29295747"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="29295747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 23:28:51 -0700
X-CSE-ConnectionGUID: f/vFWCiIRUu4voIGdmiC9A==
X-CSE-MsgGUID: FXtk6w12TzuGzIfEjzIk5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="69192893"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 23:28:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqRhg-000Aqx-0N;
	Tue, 17 Sep 2024 06:28:48 +0000
Date: Tue, 17 Sep 2024 14:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 82/447] kernel/sched/debug.c:233
 sched_dynamic_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202409171428.h5DWhBjf-lkp@intel.com>
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
head:   78e9603229ee010d330a9ca61ef1a62ee7317352
commit: 3d61c5e0a312de3f0478993550b0add306cb8ef9 [82/447] sched/debug: convert to read/write iterators
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-randconfig-161-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171428.h5DWhBjf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409171428.h5DWhBjf-lkp@intel.com/

smatch warnings:
kernel/sched/debug.c:233 sched_dynamic_write() warn: potential spectre issue 'buf' [w]

vim +/buf +233 kernel/sched/debug.c

1011dcce99f802 Peter Zijlstra 2021-03-25  220  
3d61c5e0a312de Jens Axboe     2024-04-08  221  static ssize_t sched_dynamic_write(struct kiocb *iocb, struct iov_iter *from)
1011dcce99f802 Peter Zijlstra 2021-03-25  222  {
3d61c5e0a312de Jens Axboe     2024-04-08  223  	size_t cnt = iov_iter_count(from);
1011dcce99f802 Peter Zijlstra 2021-03-25  224  	char buf[16];
1011dcce99f802 Peter Zijlstra 2021-03-25  225  	int mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  226  
1011dcce99f802 Peter Zijlstra 2021-03-25  227  	if (cnt > 15)
1011dcce99f802 Peter Zijlstra 2021-03-25  228  		cnt = 15;
1011dcce99f802 Peter Zijlstra 2021-03-25  229  
3d61c5e0a312de Jens Axboe     2024-04-08  230  	if (!copy_from_iter_full(&buf, cnt, from))
1011dcce99f802 Peter Zijlstra 2021-03-25  231  		return -EFAULT;
1011dcce99f802 Peter Zijlstra 2021-03-25  232  
1011dcce99f802 Peter Zijlstra 2021-03-25 @233  	buf[cnt] = 0;
1011dcce99f802 Peter Zijlstra 2021-03-25  234  	mode = sched_dynamic_mode(strstrip(buf));
1011dcce99f802 Peter Zijlstra 2021-03-25  235  	if (mode < 0)
1011dcce99f802 Peter Zijlstra 2021-03-25  236  		return mode;
1011dcce99f802 Peter Zijlstra 2021-03-25  237  
1011dcce99f802 Peter Zijlstra 2021-03-25  238  	sched_dynamic_update(mode);
1011dcce99f802 Peter Zijlstra 2021-03-25  239  
3d61c5e0a312de Jens Axboe     2024-04-08  240  	iocb->ki_pos += cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  241  
1011dcce99f802 Peter Zijlstra 2021-03-25  242  	return cnt;
1011dcce99f802 Peter Zijlstra 2021-03-25  243  }
1011dcce99f802 Peter Zijlstra 2021-03-25  244  

:::::: The code at line 233 was first introduced by commit
:::::: 1011dcce99f8026d48fdd7b9cc259e32a8b472be sched,preempt: Move preempt_dynamic to debug.c

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
