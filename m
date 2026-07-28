Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA1A42A159
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785235366; cv=none; b=unjp/bXd06uL+l0nE7F25lptAVnyAQIF682HdDPs5MCXr2s5kgJjJ9zyeRc095X0cKMLkQk3ny8y2yeuw+XASAQJ17BACmAzVrCldjOscs8zqkeG89SZZSkFz1hIIkOs52r5QDKFCystVqoUA4vKKG8dIDcu08Gj9MwkML2dd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785235366; c=relaxed/simple;
	bh=TX8TQtgmnQTm9zk35vc+LzzAFPi5C7PENg/llKS2lBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EIi2q3W1WdN+ZM8CwRviCL6BTlmESh+Gcniv0XM6cxJia0A4GgkDet1PQ7GXPXtydhCOfWxduZNfOilOId+oVA+3Daio9eFevpkkifUOAP0hBeQ7k5EfPDaFFBdHc97B3zm42+1H3Zz2Jiowb4gIMkpgvFP2U0ofeGbn5sfj2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3m/3iiR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3m/3iiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785235364; x=1816771364;
  h=date:from:to:cc:subject:message-id;
  bh=TX8TQtgmnQTm9zk35vc+LzzAFPi5C7PENg/llKS2lBE=;
  b=D3m/3iiRTGPAYktJq09J4tKdcCT4tgt2p2gaeG91u1Lg2aMUlH0tuHl/
   VHYxlPutV3arqa4w2YvLsh+XmJRNPeRuRPUPzDlJ8cWEvcDIBm6btvUE9
   e+rpuwfhjGr/g7WufkPwfqUj3ENM0v2BVPA3zwcF+YnalVMUPjaA51X7w
   wpDJn+pWGN4d0CEdK0bWPY9eRzqzXeNWDggqKABj+6J5RJngVFE0R6RNL
   R0lIp0Xb6aRBSZHtCgjxQy7QZGQHrB5R3I12AgUMqO8BpBUntBzhaj2PC
   5LGF1kBQ/MVfMaVCcyQWzjt6B7sHOt7hqXcyTSMidDDqMaiGK/tN8q5dU
   Q==;
X-CSE-ConnectionGUID: IRRihNnDRHi4Z7i4ZQ+t1Q==
X-CSE-MsgGUID: mcyiKuSlRIqRCFCeESse+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85683631"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85683631"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:42:43 -0700
X-CSE-ConnectionGUID: D6vtaWecSL23/xwhCf5e+Q==
X-CSE-MsgGUID: aWBSGTe2QVOsKpRn95pOeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264668333"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jul 2026 03:42:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofGh-00000000eFt-3Eja;
	Tue, 28 Jul 2026 10:42:39 +0000
Date: Tue, 28 Jul 2026 18:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/exec.c:745 transfer_args_to_stack() error: buffer
 overflow 'bprm->page' 32 <= 32
Message-ID: <202607281823.Th3aUv95-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Christian Brauner <brauner@kernel.org>
CC: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62cc90241548d5570ee68e01aaba6506964e9811
commit: 16cc4f5c1c4b9e45eca7f7deefa5410a292db599 exec: fix unsigned loop counter wrap in transfer_args_to_stack()
date:   7 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 days ago
config: arm-randconfig-r072-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281823.Th3aUv95-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 16cc4f5c1c4b ("exec: fix unsigned loop counter wrap in transfer_args_to_stack()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607281823.Th3aUv95-lkp@intel.com/

smatch warnings:
fs/exec.c:745 transfer_args_to_stack() error: buffer overflow 'bprm->page' 32 <= 32

vim +745 fs/exec.c

7e7ec6a934349ef Nicolas Pitre         2016-07-24  729  
7e7ec6a934349ef Nicolas Pitre         2016-07-24  730  /*
7e7ec6a934349ef Nicolas Pitre         2016-07-24  731   * Transfer the program arguments and environment from the holding pages
7e7ec6a934349ef Nicolas Pitre         2016-07-24  732   * onto the stack. The provided stack pointer is adjusted accordingly.
7e7ec6a934349ef Nicolas Pitre         2016-07-24  733   */
7e7ec6a934349ef Nicolas Pitre         2016-07-24  734  int transfer_args_to_stack(struct linux_binprm *bprm,
7e7ec6a934349ef Nicolas Pitre         2016-07-24  735  			   unsigned long *sp_location)
7e7ec6a934349ef Nicolas Pitre         2016-07-24  736  {
7e7ec6a934349ef Nicolas Pitre         2016-07-24  737  	unsigned long index, stop, sp;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  738  	int ret = 0;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  739  
7e7ec6a934349ef Nicolas Pitre         2016-07-24  740  	stop = bprm->p >> PAGE_SHIFT;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  741  	sp = *sp_location;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  742  
16cc4f5c1c4b9e4 Christian Brauner     2026-07-21  743  	for (index = MAX_ARG_PAGES; index-- > stop; ) {
7e7ec6a934349ef Nicolas Pitre         2016-07-24  744  		unsigned int offset = index == stop ? bprm->p & ~PAGE_MASK : 0;
3a608cfee97e99b Fabio M. De Francesco 2022-08-03 @745  		char *src = kmap_local_page(bprm->page[index]) + offset;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  746  		sp -= PAGE_SIZE - offset;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  747  		if (copy_to_user((void *) sp, src, PAGE_SIZE - offset) != 0)
7e7ec6a934349ef Nicolas Pitre         2016-07-24  748  			ret = -EFAULT;
3a608cfee97e99b Fabio M. De Francesco 2022-08-03  749  		kunmap_local(src);
7e7ec6a934349ef Nicolas Pitre         2016-07-24  750  		if (ret)
7e7ec6a934349ef Nicolas Pitre         2016-07-24  751  			goto out;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  752  	}
7e7ec6a934349ef Nicolas Pitre         2016-07-24  753  
2aea94ac14d1e0a Max Filippov          2024-03-20  754  	bprm->exec += *sp_location - MAX_ARG_PAGES * PAGE_SIZE;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  755  	*sp_location = sp;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  756  
7e7ec6a934349ef Nicolas Pitre         2016-07-24  757  out:
7e7ec6a934349ef Nicolas Pitre         2016-07-24  758  	return ret;
7e7ec6a934349ef Nicolas Pitre         2016-07-24  759  }
7e7ec6a934349ef Nicolas Pitre         2016-07-24  760  EXPORT_SYMBOL(transfer_args_to_stack);
7e7ec6a934349ef Nicolas Pitre         2016-07-24  761  

:::::: The code at line 745 was first introduced by commit
:::::: 3a608cfee97e99b3fff9ffe62246a098042e725d exec: Replace kmap{,_atomic}() with kmap_local_page()

:::::: TO: Fabio M. De Francesco <fmdefrancesco@gmail.com>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
