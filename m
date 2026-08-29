Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88053F104C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Aug 2026 20:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035434; cv=none; b=QPeBuEQV3iMXedvGLRruuDyuaNREYGEXIUACYwMxwftkOs87+dy9ig9LWvTFUbqCsdtFO/e0fu/GV96mMtyQH1BbDoGAeU9Z77CzX94IsihTu9240W9HtcKgwYKIuYTcCrJz7zYqozgF4aZpZPXc+nz3NDd8PieO579qh8AYZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035434; c=relaxed/simple;
	bh=Pm53SEr/wXRItMh1H0urjuSsLAbs3chm/Ht061zKtuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C8nikiT3jz9tYOIJNmmevVgd4SoCPbSy85iVrK54DgYX14ZDJic5Y8NKnw1zrY2G5+HD38O6K8nH/VvR+KC56+NGAFwQZWYFc6B8PXA3gAzZUrPAdc1dMDLSabOGG5rgmLaANlOdrCavQMleFiGm82EDlOmj5orDmTZiuanAT0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DusvcjiO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DusvcjiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788035433; x=1819571433;
  h=date:from:to:cc:subject:message-id;
  bh=Pm53SEr/wXRItMh1H0urjuSsLAbs3chm/Ht061zKtuA=;
  b=DusvcjiOCYfFxzuiFu7GudWB+HbgLuKTvpdgK/YypD8hi7xFBfRcKPuw
   lOtSfeGW7iMCfs6QqBDdC8ThSmxbs0pITOflMqexVbxMTgn4exW/aF6fv
   mszBaALOqaG6pyaNq0FsisBQDEoajzL5/FSnqnpT4clLu6B3QJYh+ULvw
   jijVc7aeRsC2ykuUZm0iSgva9N9DSoT/ks6XraaFp1whWVmcdyQohaW++
   1sn8AMuF5H+slSSwlP4FR6dYlGo4KjF0CKGTqGjv/zB6AfRg6/yclIf7z
   QhdwXTtLDSrPpdZj+wD3o1DH4Co9pqd3qXSrzmyO73mMtzJw1ddWz1u8m
   g==;
X-CSE-ConnectionGUID: vbrqePmxRU65JA97Dksjlw==
X-CSE-MsgGUID: SpyqD4jSSTyN0tu/kjnNtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88427823"
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="88427823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2026 13:30:32 -0700
X-CSE-ConnectionGUID: Boid2V1KQzGu843UEEC3ZQ==
X-CSE-MsgGUID: ZaahZ2ShSAKfh9QEQ4P2lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,250,1779174000"; 
   d="scan'208";a="267120670"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2026 13:30:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0Ph6-00000000DH6-1Tgo;
	Sat, 29 Aug 2026 20:30:28 +0000
Date: Sun, 30 Aug 2026 04:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-2026-07 3/3]
 include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202608300459.AJTlSM5Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   421cb6aef8530513e16786742f07d9411c968bfc
commit: 99ca540851ee906ae15d36566ed3447e6e415780 [3/3] block: cleanup and fix batch completion adding conditions
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-randconfig-r121-20260828 (https://download.01.org/0day-ci/archive/20260830/202608300459.AJTlSM5Y-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608300459.AJTlSM5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608300459.AJTlSM5Y-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/block/null_blk/main.c: note: in included file (through drivers/block/null_blk/null_blk.h):
>> include/linux/blk-mq.h:865:31: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/block/null_blk/main.c:1677:46: sparse: signed value source

vim +865 include/linux/blk-mq.h

99e48cd6855e95 John Garry 2022-07-06  842  
f794f3351f2672 Jens Axboe 2021-10-08  843  /*
f794f3351f2672 Jens Axboe 2021-10-08  844   * Batched completions only work when there is no I/O error and no special
f794f3351f2672 Jens Axboe 2021-10-08  845   * ->end_io handler.
f794f3351f2672 Jens Axboe 2021-10-08  846   */
f794f3351f2672 Jens Axboe 2021-10-08  847  static inline bool blk_mq_add_to_batch(struct request *req,
f794f3351f2672 Jens Axboe 2021-10-08  848  				       struct io_comp_batch *iob, int ioerror,
f794f3351f2672 Jens Axboe 2021-10-08  849  				       void (*complete)(struct io_comp_batch *))
f794f3351f2672 Jens Axboe 2021-10-08  850  {
c6b7a3a26e809c Ming Lei   2023-06-24  851  	/*
99ca540851ee90 Jens Axboe 2025-02-13  852  	 * Check various conditions that exclude batch processing:
99ca540851ee90 Jens Axboe 2025-02-13  853  	 * 1) No batch container
99ca540851ee90 Jens Axboe 2025-02-13  854  	 * 2) Has scheduler data attached
99ca540851ee90 Jens Axboe 2025-02-13  855  	 * 3) Not a passthrough request and end_io set
99ca540851ee90 Jens Axboe 2025-02-13  856  	 * 4) Not a passthrough request and an ioerror
c6b7a3a26e809c Ming Lei   2023-06-24  857  	 */
99ca540851ee90 Jens Axboe 2025-02-13  858  	if (!iob)
f794f3351f2672 Jens Axboe 2021-10-08  859  		return false;
99ca540851ee90 Jens Axboe 2025-02-13  860  	if (req->rq_flags & RQF_SCHED_TAGS)
99ca540851ee90 Jens Axboe 2025-02-13  861  		return false;
99ca540851ee90 Jens Axboe 2025-02-13  862  	if (!blk_rq_is_passthrough(req)) {
99ca540851ee90 Jens Axboe 2025-02-13  863  		if (req->end_io)
99ca540851ee90 Jens Axboe 2025-02-13  864  			return false;
99ca540851ee90 Jens Axboe 2025-02-13 @865  		if (ioerror < 0)
99ca540851ee90 Jens Axboe 2025-02-13  866  			return false;
99ca540851ee90 Jens Axboe 2025-02-13  867  	}
ab3e1d3bbab9e9 Jens Axboe 2022-09-21  868  
f794f3351f2672 Jens Axboe 2021-10-08  869  	if (!iob->complete)
f794f3351f2672 Jens Axboe 2021-10-08  870  		iob->complete = complete;
f794f3351f2672 Jens Axboe 2021-10-08  871  	else if (iob->complete != complete)
f794f3351f2672 Jens Axboe 2021-10-08  872  		return false;
f794f3351f2672 Jens Axboe 2021-10-08  873  	iob->need_ts |= blk_mq_need_time_stamp(req);
f794f3351f2672 Jens Axboe 2021-10-08  874  	rq_list_add(&iob->req_list, req);
f794f3351f2672 Jens Axboe 2021-10-08  875  	return true;
f794f3351f2672 Jens Axboe 2021-10-08  876  }
320ae51feed5c2 Jens Axboe 2013-10-24  877  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
