Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1BA2FC01A
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 08:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109262; cv=none; b=rkZNH9UXPwYdjTg8BfseKPyRgs2rwwNVezy7W3SWETdZm/jW8C4luWBTk1Krf+/zNXXxbfcSaSGbcUJFUoT2svRBfZ6qegR5lXkqzTf17DnJIUypj/JVxXiqEWIPNhB3RjrVKpNEuaHv3lNY0/iucHRl7tug3KDxhOnMDiHZK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109262; c=relaxed/simple;
	bh=t8JBcmcXxBBWT+t2+R6Lwwoqe04duRdyuq74+nuALtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jdl12efwpB1khb+72eB2uVz/S5YkzWd7ZbACnMwa0Ttn2GxokKVQvNM2wW2Uj2cjj0zJmkBs9taFoqb+IYTrBGytlYt2osmHhL18CjeRRuO2P3XGySwKfagb/4sNPIZMFHbhIOLPs9uAJHzGvvus6S0DIdfrg0xF/N9AknMF4ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3h7nieh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3h7nieh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763109260; x=1794645260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t8JBcmcXxBBWT+t2+R6Lwwoqe04duRdyuq74+nuALtY=;
  b=n3h7niehXyLyr6Oqp0TnD+myErMJIAuCVQD/OmSGA7zrSZiQ201oKTZm
   AR86Fe0dt7w6EBne0DabBppZQVcDieDGFBxXgumkxPyZTm9ppquRsn/Ke
   kWxTR190OqVr8W6oC7G5z24o1CDpO/V8CCxAZnNu+zw282E0gH6bB6ILr
   VPubuZF2WotxJlH8ZFInGzc3kafDlNJ3SSxpWAKfGHRdx+h/3uM/DEExK
   X1tt34sGktpxQML50doxaIj8KIch65I6eceNEmkTCyzHQtcuIhlmE6qpA
   4tHJfF0hubZqSNY7KjDeZOjtcrscuDXYToitIUGqt9bvMqJh2EreLYK5P
   g==;
X-CSE-ConnectionGUID: HlScA1xiQb+jq2PsLmkFGw==
X-CSE-MsgGUID: 4/FD11pUTcq6P3bWGANWdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52768792"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="52768792"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 00:34:12 -0800
X-CSE-ConnectionGUID: r/MDBm2gSi2D6BaYyrUpAA==
X-CSE-MsgGUID: KPHyViR2Q6G2Jc54lYh7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194876614"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 00:34:11 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJpFw-0006Lh-1C;
	Fri, 14 Nov 2025 08:34:08 +0000
Date: Fri, 14 Nov 2025 16:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 25/46] fs/overlayfs/inode.c:716
 ovl_fileattr_get() error: uninitialized symbol 'err'.
Message-ID: <202511141646.3SjA548A-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard
head:   74fa97e66e24a79a77ee469a7e8305f2013edd1f
commit: 72cadf7476d5f5367014a3f328f3b712eee6701f [25/46] ovl: port ovl_fileattr_get() to cred guard
:::::: branch date: 11 hours ago
:::::: commit date: 21 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141646.3SjA548A-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141646.3SjA548A-lkp@intel.com/

New smatch warnings:
fs/overlayfs/inode.c:716 ovl_fileattr_get() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/inode.c:280 ovl_getattr() error: uninitialized symbol 'err'.
fs/overlayfs/inode.c:458 do_ovl_get_acl() error: uninitialized symbol 'acl'.
fs/overlayfs/inode.c:482 ovl_set_or_remove_acl() error: uninitialized symbol 'real_acl'.
fs/overlayfs/inode.c:1194 ovl_get_inode() error: we previously assumed 'lowerpath' could be null (see line 1191)

vim +/err +716 fs/overlayfs/inode.c

72db82115d2bdf Amir Goldstein    2021-06-19  702  
ca115d7e754691 Christian Brauner 2025-07-03  703  int ovl_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
66dbfabf10d3cb Miklos Szeredi    2021-04-07  704  {
66dbfabf10d3cb Miklos Szeredi    2021-04-07  705  	struct inode *inode = d_inode(dentry);
72db82115d2bdf Amir Goldstein    2021-06-19  706  	struct path realpath;
66dbfabf10d3cb Miklos Szeredi    2021-04-07  707  	int err;
66dbfabf10d3cb Miklos Szeredi    2021-04-07  708  
72db82115d2bdf Amir Goldstein    2021-06-19  709  	ovl_path_real(dentry, &realpath);
72db82115d2bdf Amir Goldstein    2021-06-19  710  
72cadf7476d5f5 Christian Brauner 2025-11-12  711  	with_ovl_creds(inode->i_sb) {
72db82115d2bdf Amir Goldstein    2021-06-19  712  		err = ovl_real_fileattr_get(&realpath, fa);
096a218a588d78 Amir Goldstein    2021-06-19  713  		ovl_fileattr_prot_flags(inode, fa);
72cadf7476d5f5 Christian Brauner 2025-11-12  714  	}
66dbfabf10d3cb Miklos Szeredi    2021-04-07  715  
66dbfabf10d3cb Miklos Szeredi    2021-04-07 @716  	return err;
66dbfabf10d3cb Miklos Szeredi    2021-04-07  717  }
66dbfabf10d3cb Miklos Szeredi    2021-04-07  718  

:::::: The code at line 716 was first introduced by commit
:::::: 66dbfabf10d3cb68ee01df60b11c0b3777a4217b ovl: stack fileattr ops

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
