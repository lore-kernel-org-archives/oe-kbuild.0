Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E923EAA0
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 06:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038122; cv=none; b=IWS7LFyUJwaMmuL2Bg2UYRN+C/7Dm4mI4HKbusOFAL+7raZdEjCsn7Un5MmWr5N5Szz9XzZE8gERm3qYXl4l1SLIZfG76nRGExRRuym+yhqaEFvLhGAjzp1ir4N9oEAYHQinj+BcYwk1l4lxWSer69j8XiF59obpJ9R0jxtC/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038122; c=relaxed/simple;
	bh=SyX+eFonNdfvfR8ppDgXqh/sQK7LIamuy2MXM5Zg60I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2puk/jYAzVPPaRUj7EqnvOkUk/nFQG9VsAKzhnKDgXeyyOZ2g2wM1QCwc17/i/aeRe/Ke3nH+BeBMazFbd2MwRx9Z+IcGShOVqbxVcuV8Fs3Le2ODFa4ZQWoZvElPuKMJx7pbdmo1wlCWVp1+OJ7HRr/2M7QjgA2qSem9tXRUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiaW0obD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiaW0obD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766038120; x=1797574120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SyX+eFonNdfvfR8ppDgXqh/sQK7LIamuy2MXM5Zg60I=;
  b=kiaW0obDNaGTkYXfbmi+3Qe9XDZWxv6Tba1fGB9TUMhhZV8TxWM6Ya/S
   4rht0wyU+bTrwS4Ih+72CDPZSA5V63T+9xAZ1JzKxT5F22NT1Jcy4O4pB
   aYpnSVSIfjEb+hOhKmmusP667akdr6Ci1Mf6yr4iT/w5r8oijEvzQOAOd
   +UydxtZ7sEaZC4dbOrjzYueFi/GEtENlk58qirXbG1NNlUboHA5j1YUwh
   KL9S51sYE9O675hfgHNSHyrPqJYQOZCFYiDg47Wgx4ZaPplb4kp039qH7
   jSqeic2RT/bRFb0/gv2OMcsFNmwnEGLUFJQPeMOx+klPpMcTCovXXPgx9
   Q==;
X-CSE-ConnectionGUID: A56F3Ql7RG2HlD7ZRj1ehA==
X-CSE-MsgGUID: 5M/YUvMxQrmW1OviN1e5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78624324"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78624324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 22:08:39 -0800
X-CSE-ConnectionGUID: H9li/PlqQyKDGlqcTTQC9A==
X-CSE-MsgGUID: 3fMMX38PQMiHs0x1x2cbFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203018422"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2025 22:08:38 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW7Bj-000000001en-2wnt;
	Thu, 18 Dec 2025 06:08:35 +0000
Date: Thu, 18 Dec 2025 14:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android17-6.18 14/14]
 drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202512181424.7SYJiB4W-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   8b3c4de1cca2b865619f8662a2f262e499db0e13
commit: 4439db7b8f941e4e418fc4d07e84a2eb31c6f339 [14/14] ANDROID: interconnect: Enable debugfs client
:::::: branch date: 72 minutes ago
:::::: commit date: 2 years, 1 month ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181424.7SYJiB4W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181424.7SYJiB4W-lkp@intel.com/

smatch warnings:
drivers/interconnect/debugfs-client.c:121 icc_commit_set() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +121 drivers/interconnect/debugfs-client.c

770c69f037c18c Mike Tipton 2023-08-07  113  
770c69f037c18c Mike Tipton 2023-08-07  114  static int icc_commit_set(void *data, u64 val)
770c69f037c18c Mike Tipton 2023-08-07  115  {
770c69f037c18c Mike Tipton 2023-08-07  116  	int ret;
770c69f037c18c Mike Tipton 2023-08-07  117  
770c69f037c18c Mike Tipton 2023-08-07  118  	mutex_lock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  119  
770c69f037c18c Mike Tipton 2023-08-07  120  	if (IS_ERR_OR_NULL(cur_path)) {
770c69f037c18c Mike Tipton 2023-08-07 @121  		ret = PTR_ERR(cur_path);
770c69f037c18c Mike Tipton 2023-08-07  122  		goto out;
770c69f037c18c Mike Tipton 2023-08-07  123  	}
770c69f037c18c Mike Tipton 2023-08-07  124  
770c69f037c18c Mike Tipton 2023-08-07  125  	icc_set_tag(cur_path, tag);
770c69f037c18c Mike Tipton 2023-08-07  126  	ret = icc_set_bw(cur_path, avg_bw, peak_bw);
770c69f037c18c Mike Tipton 2023-08-07  127  out:
770c69f037c18c Mike Tipton 2023-08-07  128  	mutex_unlock(&debugfs_lock);
770c69f037c18c Mike Tipton 2023-08-07  129  	return ret;
770c69f037c18c Mike Tipton 2023-08-07  130  }
770c69f037c18c Mike Tipton 2023-08-07  131  

:::::: The code at line 121 was first introduced by commit
:::::: 770c69f037c18cfaa37c3d6c6ef8bd257635513f interconnect: Add debugfs test client

:::::: TO: Mike Tipton <quic_mdtipton@quicinc.com>
:::::: CC: Georgi Djakov <djakov@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
