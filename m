Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E098E562619
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171056; cv=none; b=QPon38ns2JQVvp/s+JyzkBVlaM2qk9WjmvoDTB4qey/TeenQa11br4osjpJQTeFmT0oO3z07RtPGKls/cT7fJj72ycSstDKmI2thYxKPODWhIPxwmcFU8tLKamcHZwtklB/0wQ42upJG9S2pgBHQDLKnkjoIVg9KPcwhBwiVII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171056; c=relaxed/simple;
	bh=fPHd1w/ApjSFam73h2c11YfBZ7cEZlXvy4G47s3pxUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jNWcG7dJth1FGmFmyRISMQMjUkKWoS5ciP6zlNnP0+Uwki9BGsIqErdDoKE6t/prPn9mMmb85izcFdIiaY1RwFncUyDICRsyBT4951OHQCAu5+4Zeimeznf0oJuBmSfKPxkUwKoWzY0lE/wq2au9PDm6lFJ276lP1VVvSm/s3ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=clsQsb4U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="clsQsb4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792171054; x=1823707054;
  h=date:from:to:cc:subject:message-id;
  bh=fPHd1w/ApjSFam73h2c11YfBZ7cEZlXvy4G47s3pxUE=;
  b=clsQsb4UCD0oWc+OGqQeZBpSakTkYQeBrmnDAonq9nOYGCn1dYWXjYQ+
   MbMDp22gxVBDlv1099UlZHh1GCbc4IeK8Zbf8yMGuiK+4aHMPLZI0ROtz
   4ZApF8IV1+9wGkHWdv5bSjK5oCmRRN+NcVZQA3+Mh8eNsrCRDeqBh9+uf
   KPHCzH/ckx3qRmayyNTScvGpRFhM8kNapWX5IHNA9nkyqL/Gv2/APajEW
   WUPOk9wcL2xbofInisbRcnSuA7qOZ+ju9PiBGmqaV8GtwyDaIBwHbdGwZ
   eU439xqmF3Dtbknb+Yl7Qc5DDq0b9LJtDwrlnU81p1aELFoerrQBQYffu
   Q==;
X-CSE-ConnectionGUID: GR5fHWujQE20p4GqiWhswQ==
X-CSE-MsgGUID: xv/GWCelTnaZ3ohyDIAjlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="968881"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="968881"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 10:17:33 -0700
X-CSE-ConnectionGUID: rE0PmgSuTUilvT8gpnFwuw==
X-CSE-MsgGUID: ssWwEiPMRZaYaXaCpCHmlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1910451"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Oct 2026 10:17:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHlYg-00000000IT4-1sey;
	Fri, 16 Oct 2026 17:17:30 +0000
Date: Sat, 17 Oct 2026 01:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [axboe:io_uring-exit-cancel.7 10/10]
 build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out
 of range (try using text-section-literals): (.text+0x7c88)
Message-ID: <202610170150.yS2ImxZJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "xtensa: dangerous relocation"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-exit-cancel.7
head:   56582c9ccc36003c41e558796ae2bb8ea1093e10
commit: 56582c9ccc36003c41e558796ae2bb8ea1093e10 [10/10] io_uring: wait for in-flight requests on ring release
:::::: branch date: 5 weeks ago
:::::: commit date: 5 weeks ago
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20261017/202610170150.yS2ImxZJ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170150.yS2ImxZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610170150.yS2ImxZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/build_policy.o: in function `switched_to_dl':
>> build_policy.c:(.text+0x7c9f): dangerous relocation: l32r: literal target out of range (try using text-section-literals): (.text+0x7c88)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
