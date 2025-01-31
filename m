Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC95182
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 00:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282659; cv=none; b=T4wZzbaUK0r9N5KoOfs9tpJ0DmyPsAHHGF4m91UFtLjP2FwEr/WPUauRe+ANuVqrKyjlCrB0eqmdYAMdb6p4zzxKdt0Dk7Pil6TZ/9yvZbg3wfkQvUMfZMau+faYME7UxvtdA000HQl68OY/A97Lm1MccflaVEh3M1tzwy9DycI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282659; c=relaxed/simple;
	bh=7rBSt1itWI7diYk244zqS2dto7Cn8GcszuyHhvs+WBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=udC/EvexSFedpNsHAMRj4n7slGDn7qgHLnBzDjg8IpcbxRuOHjCUKI8r40B1x3KSOuiG69jwQcMNvsxWqbvU2UxtD7SClALIfJ1uRB1Vpl8U7XvwhIGSYG/yLIFoNpjwup6YqiZ3adr77bT/yKC3BRuQ8Mowb/5wQac3ks7/auI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDNRbDAU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDNRbDAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738282658; x=1769818658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7rBSt1itWI7diYk244zqS2dto7Cn8GcszuyHhvs+WBY=;
  b=LDNRbDAUMq7QwdGGZfVL5FwreV7NwCwB7MEbbL2oJAclN4ncRSMu85kK
   PnF96FtUtGpn1zl++GF/15RtGkEEIKMu8gK/kXqNqB1rr4BqNm+01dgpp
   EyzRZqSYmC+Kk/s/APrbrtCHblRtGCQexASOjuZTWhFL7pWvsQlHOgUTC
   l+Bj9eX+Cn0oaAdhlW1GonI9fJCT6LYNWuqtmQInoXE7E2pZU6Wf/6VBG
   i9rgghrdl6A8H+QT5wpQ/+tKD3K0TxMGBPMJXCDuVBvZQlx8aXdvDWWCm
   JIVMbvqn29P3sI7EQP2j+al45wJ02rdHH71GJYVV04D44+iTvuFpnS65l
   A==;
X-CSE-ConnectionGUID: 7kQkBo6PSdejg/iVcWKBFw==
X-CSE-MsgGUID: PB5/NJVbRzygIXhly3PJQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49446317"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; 
   d="scan'208";a="49446317"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 16:17:37 -0800
X-CSE-ConnectionGUID: iulj925eSfej4NLyadrhOA==
X-CSE-MsgGUID: 9gRx+gI6Q4OUh5rILJOttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146666056"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Jan 2025 16:17:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdeiz-000lRL-1K;
	Fri, 31 Jan 2025 00:17:33 +0000
Date: Fri, 31 Jan 2025 08:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/afs/dynroot.c:313 afs_dynroot_rm_one_dir() warn: passing zero to
 'PTR_ERR'
Message-ID: <202501310850.GMxGHSiG-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4b0881156fb8209bf5ef6cb63211bb0ad6e1a6b
commit: 92f08e9d3cf0f8005ac6fcb931e3c388efc3ac49 afs: Make /afs/.<cell> as well as /afs/<cell> mountpoints
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-141-20250131 (https://download.01.org/0day-ci/archive/20250131/202501310850.GMxGHSiG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501310850.GMxGHSiG-lkp@intel.com/

smatch warnings:
fs/afs/dynroot.c:313 afs_dynroot_rm_one_dir() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +313 fs/afs/dynroot.c

0da0b7fd73e4f2 David Howells 2018-06-15  305  
92f08e9d3cf0f8 David Howells 2025-01-07  306  static void afs_dynroot_rm_one_dir(struct dentry *root, const char *name, size_t name_len)
0da0b7fd73e4f2 David Howells 2018-06-15  307  {
92f08e9d3cf0f8 David Howells 2025-01-07  308  	struct dentry *subdir;
0da0b7fd73e4f2 David Howells 2018-06-15  309  
0da0b7fd73e4f2 David Howells 2018-06-15  310  	/* Don't want to trigger a lookup call, which will re-add the cell */
92f08e9d3cf0f8 David Howells 2025-01-07  311  	subdir = try_lookup_one_len(name, root, name_len);
0da0b7fd73e4f2 David Howells 2018-06-15  312  	if (IS_ERR_OR_NULL(subdir)) {
0da0b7fd73e4f2 David Howells 2018-06-15 @313  		_debug("lookup %ld", PTR_ERR(subdir));
92f08e9d3cf0f8 David Howells 2025-01-07  314  		return;
0da0b7fd73e4f2 David Howells 2018-06-15  315  	}
0da0b7fd73e4f2 David Howells 2018-06-15  316  
0da0b7fd73e4f2 David Howells 2018-06-15  317  	_debug("rmdir %pd %u", subdir, d_count(subdir));
0da0b7fd73e4f2 David Howells 2018-06-15  318  
0da0b7fd73e4f2 David Howells 2018-06-15  319  	if (subdir->d_fsdata) {
0da0b7fd73e4f2 David Howells 2018-06-15  320  		_debug("unpin %u", d_count(subdir));
0da0b7fd73e4f2 David Howells 2018-06-15  321  		subdir->d_fsdata = NULL;
0da0b7fd73e4f2 David Howells 2018-06-15  322  		dput(subdir);
0da0b7fd73e4f2 David Howells 2018-06-15  323  	}
0da0b7fd73e4f2 David Howells 2018-06-15  324  	dput(subdir);
92f08e9d3cf0f8 David Howells 2025-01-07  325  }
92f08e9d3cf0f8 David Howells 2025-01-07  326  

:::::: The code at line 313 was first introduced by commit
:::::: 0da0b7fd73e4f20e1a987dfade0b36bb4813cf10 afs: Display manually added cells in dynamic root mount

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
