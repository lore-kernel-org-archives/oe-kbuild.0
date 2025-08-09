Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74642AD5A
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Aug 2025 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754779113; cv=none; b=DkIrOQSGvcjLBFnI7/6jjRwulmVxTAZBjm37HuhiskH7pZY02mQWJJ9qBI25FZHkp0IxAZM7Afoc+igmr/hZq4fNcjIIwC6Ph7jBoBFSEo5c2E99r66kzmPCGyaPHeAch/tB8QFKQFSdHlshNE6GtLRqltPXnMbrADOeLpu+fbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754779113; c=relaxed/simple;
	bh=jNylUXtEY+LYUZD1E5R8xyuf0720B0xfDRtSxsNo2DE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bgo54gtV01ha8lHmgZosIg/q/GACJEokf6odGzHWcZcSYF1DF4dTN6ZHR0V0K7RXRRnjod5SNhOGghJMTyS3bsvoExOVkIaErS38OZJNGlvMQi/+QGYyuRYFQvGRCRKiJ8uRay+YyngtawnUrojcEJNxSYtSYJdzBKhQ0SpBkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kk0SqbmE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk0SqbmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754779111; x=1786315111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jNylUXtEY+LYUZD1E5R8xyuf0720B0xfDRtSxsNo2DE=;
  b=kk0SqbmEqO0rWR4Qnmu0uPZe+vku/Nzm9S11/svBO7ZraV7++jW/qIxg
   tNMdfBIfqwRJaZC4ASbF4ckhO3Go6gOcgkX/GFIFtI8G5fC5WRjCbuFrl
   27rUh7Q0k4OMTx5DuC9lieUa5tBRzFTHRst0TRVDqi55Dxvg7kU5ojart
   AhVlOiv+kcltVtbTVY3wi/VDVYBBH3fooGKR5k95ZbBSiqIqMoKv3NHkG
   d9TE+kHQAMEoA4foh7Y95KtXtUm+PY2rMt7PYxH96vY331UdB28BJ89hO
   7jGJH6LT5IhltsS5dy/AOCZwTjB89QjQ1K7+y1yacKY7fvZXFC5ywg60V
   g==;
X-CSE-ConnectionGUID: Lo6tij2yQqqRJ1/tz0WMhA==
X-CSE-MsgGUID: 7IBGISBQRxyYtrQANpcArg==
X-IronPort-AV: E=McAfee;i="6800,10657,11516"; a="67676483"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="67676483"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2025 15:38:31 -0700
X-CSE-ConnectionGUID: j0yQ20d6STWHJiCHhTfU2g==
X-CSE-MsgGUID: HeRNq3y5SlK08+QPYcu0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165241574"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2025 15:38:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uksCW-00055I-35;
	Sat, 09 Aug 2025 22:38:14 +0000
Date: Sun, 10 Aug 2025 06:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 14/34] fs/nfsd/filecache.c:387
 nfsd_file_put_local() error: uninitialized symbol 'nf'.
Message-ID: <202508100609.MBMcAaY4-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   98fda891f0626192fd4d782d5483e7298ae5b061
commit: 7550ab865bc73e6365cbcf09e09d0a6a58d9afcd [14/34] rcu: Support Clang's capability analysis
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: i386-randconfig-141-20250810 (https://download.01.org/0day-ci/archive/20250810/202508100609.MBMcAaY4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508100609.MBMcAaY4-lkp@intel.com/

smatch warnings:
fs/nfsd/filecache.c:387 nfsd_file_put_local() error: uninitialized symbol 'nf'.
fs/nfsd/localio.c:101 nfsd_open_local_fh() error: uninitialized symbol 'new'.

vim +/nf +387 fs/nfsd/filecache.c

65294c1f2c5e72 Jeff Layton  2019-08-18  372  
a61e147e6be6e7 Mike Snitzer 2024-09-05  373  /**
b33f7dec3a6721 Mike Snitzer 2024-11-15  374   * nfsd_file_put_local - put nfsd_file reference and arm nfsd_net_put in caller
c840b8e1f039e9 Mike Snitzer 2024-11-13  375   * @nf: nfsd_file of which to put the reference
a61e147e6be6e7 Mike Snitzer 2024-09-05  376   *
c840b8e1f039e9 Mike Snitzer 2024-11-13  377   * First save the associated net to return to caller, then put
c840b8e1f039e9 Mike Snitzer 2024-11-13  378   * the reference of the nfsd_file.
a61e147e6be6e7 Mike Snitzer 2024-09-05  379   */
c840b8e1f039e9 Mike Snitzer 2024-11-13  380  struct net *
c25a89770d1f21 NeilBrown    2025-05-09  381  nfsd_file_put_local(struct nfsd_file __rcu **pnf)
a61e147e6be6e7 Mike Snitzer 2024-09-05  382  {
c25a89770d1f21 NeilBrown    2025-05-09  383  	struct nfsd_file *nf;
c25a89770d1f21 NeilBrown    2025-05-09  384  	struct net *net = NULL;
a61e147e6be6e7 Mike Snitzer 2024-09-05  385  
c25a89770d1f21 NeilBrown    2025-05-09  386  	nf = unrcu_pointer(xchg(pnf, NULL));
c25a89770d1f21 NeilBrown    2025-05-09 @387  	if (nf) {
c25a89770d1f21 NeilBrown    2025-05-09  388  		net = nf->nf_net;
a61e147e6be6e7 Mike Snitzer 2024-09-05  389  		nfsd_file_put(nf);
c25a89770d1f21 NeilBrown    2025-05-09  390  	}
c840b8e1f039e9 Mike Snitzer 2024-11-13  391  	return net;
a61e147e6be6e7 Mike Snitzer 2024-09-05  392  }
a61e147e6be6e7 Mike Snitzer 2024-09-05  393  

:::::: The code at line 387 was first introduced by commit
:::::: c25a89770d1f216dcedfc2d25d56b604f62ce0bd nfs_localio: change nfsd_file_put_local() to take a pointer to __rcu pointer

:::::: TO: NeilBrown <neil@brown.name>
:::::: CC: Anna Schumaker <anna.schumaker@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
