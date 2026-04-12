Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A729D294
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Apr 2026 11:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775994884; cv=none; b=OUrHAiioasCtXWTL/OVZQD+ld5pp2uRRXF5W7ptS1Hq8+khprKiXvIPaG8epOiRGJbxc7wVsuv6kGCn6OYWHEF6/bG8BQNubGC4Q9H4R4O9wYvztNCRHY5EWjdiCxrO6SNMVM7zaMAR7kUNi68XMU+yzPO/v5zZ/5D2fd2pFsUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775994884; c=relaxed/simple;
	bh=WFEvJBIYhpf3SL0zNm94LXB2R2MESwQsgvqMvvklXbY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=teEcXgyCOl2SP5sEBTJgathw66eNKpMgAuhCvWk6U3hmDYL7J6xfKCVB0uSMjsZ+c+MuDQzBBzxYfSUGEEV3OPt7khzZ793Pj2hOTnQ5RVfxBVaOyTUm3vJfUAM576FntIzlYxAavBCxUwN2R4XuWsrwQvzrtWWDkZeRVj7AmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfJBliZJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfJBliZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775994883; x=1807530883;
  h=date:from:to:cc:subject:message-id;
  bh=WFEvJBIYhpf3SL0zNm94LXB2R2MESwQsgvqMvvklXbY=;
  b=NfJBliZJJdqUzhnA9IZM019fcKodOqOY26jRHGDuMxILGwNzYrTumQ0H
   5AVRhLsZuA5W0HftmPgzUCzcLy/Q0ho9kiQLCvO1wNo5BebaI/TudWRXb
   UuNmQzdKS92eJbXF2ffCWibBUFXh224k1HalJcbfRRflTHcth7lABR0wr
   L4LnRcDQ6sfJwX0c5KOgSl2/ewZP8iNFgAHVAgxSYsuahjNq76fdc7cCw
   3g11o7ubxz9r59cuhiBg1h7YldokURPNasC4HpVhgg6upOZHFrEmyoOmO
   h2EwXZVrvVERHkRWnzUE5dwA2PIyHUE1zW+PNnUHXF0VjkZr5tLbJ7R02
   g==;
X-CSE-ConnectionGUID: taASK3m+SBu6hbigCTpyuw==
X-CSE-MsgGUID: /fZsQhu7TlWe/b/AOSUn1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="99591457"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="99591457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 04:54:42 -0700
X-CSE-ConnectionGUID: VivREeKLQ+eTCD+dn9vzEg==
X-CSE-MsgGUID: w0CJQmY6SOqYBIzMnWKVCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="252720773"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2026 04:54:40 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBtOg-000000002AH-0zz6;
	Sun, 12 Apr 2026 11:54:38 +0000
Date: Sun, 12 Apr 2026 19:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/platforms/pseries/papr-hvpipe.c:214
 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes
 remaining?
Message-ID: <202604121903.MkgWjl8q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Haren Myneni <haren@linux.ibm.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Mahesh Salgaonkar <mahesh@linux.ibm.com>
CC: Tyrel Datwyler <tyreld@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f5459048c38a00fc583658d6dcd0f894aff6df8f
commit: cebdb522fd3edd1fe05f7b4a74a27da7dd0f8d86 powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-r071-20260412 (https://download.01.org/0day-ci/archive/20260412/202604121903.MkgWjl8q-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cebdb522fd3e ("powerpc/pseries: Receive payload with ibm,receive-hvpipe-msg RTAS")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604121903.MkgWjl8q-lkp@intel.com/

New smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:214 hvpipe_rtas_recv_msg() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
arch/powerpc/platforms/pseries/papr-hvpipe.c:360 papr_hvpipe_handle_read() warn: maybe return -EFAULT instead of the bytes remaining?

vim +214 arch/powerpc/platforms/pseries/papr-hvpipe.c

814ef095f12c9f Haren Myneni 2025-09-09  166  
cebdb522fd3edd Haren Myneni 2025-09-09  167  /*
cebdb522fd3edd Haren Myneni 2025-09-09  168   * This work function collects receive buffer with recv HVPIPE
cebdb522fd3edd Haren Myneni 2025-09-09  169   * RTAS call. Called from read()
cebdb522fd3edd Haren Myneni 2025-09-09  170   * @buf: User specified buffer to copy the payload that returned
cebdb522fd3edd Haren Myneni 2025-09-09  171   *       from recv HVPIPE RTAS.
cebdb522fd3edd Haren Myneni 2025-09-09  172   * @size: Size of buffer user passed.
cebdb522fd3edd Haren Myneni 2025-09-09  173   */
cebdb522fd3edd Haren Myneni 2025-09-09  174  static int hvpipe_rtas_recv_msg(char __user *buf, int size)
cebdb522fd3edd Haren Myneni 2025-09-09  175  {
cebdb522fd3edd Haren Myneni 2025-09-09  176  	struct rtas_work_area *work_area;
cebdb522fd3edd Haren Myneni 2025-09-09  177  	u32 srcID, bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  178  	int ret;
cebdb522fd3edd Haren Myneni 2025-09-09  179  
cebdb522fd3edd Haren Myneni 2025-09-09  180  	work_area = rtas_work_area_alloc(SZ_4K);
cebdb522fd3edd Haren Myneni 2025-09-09  181  	if (!work_area) {
cebdb522fd3edd Haren Myneni 2025-09-09  182  		pr_err("Could not allocate RTAS buffer for recv pipe\n");
cebdb522fd3edd Haren Myneni 2025-09-09  183  		return -ENOMEM;
cebdb522fd3edd Haren Myneni 2025-09-09  184  	}
cebdb522fd3edd Haren Myneni 2025-09-09  185  
cebdb522fd3edd Haren Myneni 2025-09-09  186  	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
cebdb522fd3edd Haren Myneni 2025-09-09  187  					&bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  188  	if (!ret) {
cebdb522fd3edd Haren Myneni 2025-09-09  189  		/*
cebdb522fd3edd Haren Myneni 2025-09-09  190  		 * Recv HVPIPE RTAS is successful.
cebdb522fd3edd Haren Myneni 2025-09-09  191  		 * When releasing FD or no one is waiting on the
cebdb522fd3edd Haren Myneni 2025-09-09  192  		 * specific source, issue recv HVPIPE RTAS call
cebdb522fd3edd Haren Myneni 2025-09-09  193  		 * so that pipe is not blocked - this func is called
cebdb522fd3edd Haren Myneni 2025-09-09  194  		 * with NULL buf.
cebdb522fd3edd Haren Myneni 2025-09-09  195  		 */
cebdb522fd3edd Haren Myneni 2025-09-09  196  		if (buf) {
cebdb522fd3edd Haren Myneni 2025-09-09  197  			if (size < bytes_written) {
cebdb522fd3edd Haren Myneni 2025-09-09  198  				pr_err("Received the payload size = %d, but the buffer size = %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  199  					bytes_written, size);
cebdb522fd3edd Haren Myneni 2025-09-09  200  				bytes_written = size;
cebdb522fd3edd Haren Myneni 2025-09-09  201  			}
cebdb522fd3edd Haren Myneni 2025-09-09  202  			ret = copy_to_user(buf,
cebdb522fd3edd Haren Myneni 2025-09-09  203  					rtas_work_area_raw_buf(work_area),
cebdb522fd3edd Haren Myneni 2025-09-09  204  					bytes_written);
cebdb522fd3edd Haren Myneni 2025-09-09  205  			if (!ret)
cebdb522fd3edd Haren Myneni 2025-09-09  206  				ret = bytes_written;
cebdb522fd3edd Haren Myneni 2025-09-09  207  		}
cebdb522fd3edd Haren Myneni 2025-09-09  208  	} else {
cebdb522fd3edd Haren Myneni 2025-09-09  209  		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
cebdb522fd3edd Haren Myneni 2025-09-09  210  				ret);
cebdb522fd3edd Haren Myneni 2025-09-09  211  	}
cebdb522fd3edd Haren Myneni 2025-09-09  212  
cebdb522fd3edd Haren Myneni 2025-09-09  213  	rtas_work_area_free(work_area);
cebdb522fd3edd Haren Myneni 2025-09-09 @214  	return ret;
cebdb522fd3edd Haren Myneni 2025-09-09  215  }
cebdb522fd3edd Haren Myneni 2025-09-09  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
