Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06065EEDE
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 04:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747541456; cv=none; b=CAR/rDZm9kyq29r/jWo0o66OftgU+DJPBWxsZ8XSX0zABBjGb8HHUu67LwDx+tNhcIhKWolVekMfv0zlqrZqzzxwU1s15dgZC1ynhe0CAIh0mjJbdkLJz4hRpAvQW872V6Yk7T9J6C2EfoYDSgLFx128Tnux2wLNZSL2zN46+PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747541456; c=relaxed/simple;
	bh=Rctu/nMGSYzOj9wHZWrK13l8S/0n66MYzSuYRMlM/uI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpfSFGFAusaNiaJXyemjijhRRer178qNT+9KIail+WvLcHWgoOmZU8cqVwsNjBfVRtc0fLoDWbA12bnw17013zAQY7B74lw1xZbYt88RGeSYxNwLpw993r//lAAs15t8M7y8CEYn6g97DcZE0AeI0zF2dXlzct/4dbpSHmkAH/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=We2fmMyC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="We2fmMyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747541454; x=1779077454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rctu/nMGSYzOj9wHZWrK13l8S/0n66MYzSuYRMlM/uI=;
  b=We2fmMyCEsEjwapmSZVtNMfTHmTngdlHhwQZ6whTuBphYqV54FrDEKQ6
   +JQ8kmnebQcCljkgT3NJdAN6V0ugxqKC6t8hUCQC68R8Cv8duZpQU9Tzb
   95T/ghbfpAzlJDo7RcTrpPnGBLNbh1Esb/dDsYyGidX0cpbkLWVYvpDB1
   4lpeAzvVesDuSk3v3iYEQvNjnJ+QRqcvuhsaLPaK5oznLhxzwmu/anEMA
   2EqX/7B/CikRZhT/ya82h4EqzLb3nGc1ONBWE3XpcNxabRkhFDzd5vL/a
   SQ4O2rDH+atD8QR5Q70jm/ZyAYuE6wDlySoM4C2RiZk6exyJjOAQXpTUq
   Q==;
X-CSE-ConnectionGUID: 706yCmlATP6KawIwiE+j0Q==
X-CSE-MsgGUID: SWmBiJ3JSFe4KC8u7O6E5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="67021901"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="67021901"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 21:10:52 -0700
X-CSE-ConnectionGUID: vdbsMz+FQFilL5MFOH1uNw==
X-CSE-MsgGUID: r868xKMNQdyKWZK54aDamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="170093619"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 May 2025 21:10:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGVMP-000Kbf-0O;
	Sun, 18 May 2025 04:10:49 +0000
Date: Sun, 18 May 2025 12:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] NFS: Fixes for nfs4_proc_mkdir() error handling
Message-ID: <202505181116.RhlCb75I-lkp@intel.com>
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
In-Reply-To: <20250516150010.61641-1-anna@kernel.org>
References: <20250516150010.61641-1-anna@kernel.org>
TO: Anna Schumaker <anna@kernel.org>
TO: linux-nfs@vger.kernel.org
TO: trond.myklebust@hammerspace.com
CC: anna@kernel.org

Hi Anna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anna-Schumaker/NFS-Fixes-for-nfs4_proc_mkdir-error-handling/20250516-231124
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20250516150010.61641-1-anna%40kernel.org
patch subject: [PATCH] NFS: Fixes for nfs4_proc_mkdir() error handling
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250517 (https://download.01.org/0day-ci/archive/20250518/202505181116.RhlCb75I-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505181116.RhlCb75I-lkp@intel.com/

New smatch warnings:
fs/nfs/nfs4proc.c:5277 nfs4_proc_mkdir() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/nfs/nfs4proc.c:1471 nfs4_opendata_alloc() error: we previously assumed 'c' could be null (see line 1439)

vim +/PTR_ERR +5277 fs/nfs/nfs4proc.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  5259  
8376583b84a193 NeilBrown           2025-02-27  5260  static struct dentry *nfs4_proc_mkdir(struct inode *dir, struct dentry *dentry,
^1da177e4c3f41 Linus Torvalds      2005-04-16  5261  				      struct iattr *sattr)
^1da177e4c3f41 Linus Torvalds      2005-04-16  5262  {
dff25ddb48086a Andreas Gruenbacher 2016-12-02  5263  	struct nfs_server *server = NFS_SERVER(dir);
0688e64bc60038 Trond Myklebust     2019-04-07  5264  	struct nfs4_exception exception = {
0688e64bc60038 Trond Myklebust     2019-04-07  5265  		.interruptible = true,
0688e64bc60038 Trond Myklebust     2019-04-07  5266  	};
c528f70f504434 Trond Myklebust     2022-10-19  5267  	struct nfs4_label l, *label;
8376583b84a193 NeilBrown           2025-02-27  5268  	struct dentry *alias;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5269  	int err;
a8a5da996df7d2 Aneesh Kumar K.V    2010-12-09  5270  
aa9c2669626ca7 David Quigley       2013-05-22  5271  	label = nfs4_label_init_security(dir, dentry, sattr, &l);
aa9c2669626ca7 David Quigley       2013-05-22  5272  
dff25ddb48086a Andreas Gruenbacher 2016-12-02  5273  	if (!(server->attr_bitmask[2] & FATTR4_WORD2_MODE_UMASK))
a8a5da996df7d2 Aneesh Kumar K.V    2010-12-09  5274  		sattr->ia_mode &= ~current_umask();
^1da177e4c3f41 Linus Torvalds      2005-04-16  5275  	do {
8376583b84a193 NeilBrown           2025-02-27  5276  		alias = _nfs4_proc_mkdir(dir, dentry, sattr, label);
4c35d65f4c6f1e Anna Schumaker      2025-05-16 @5277  		err = PTR_ERR(alias);
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5278  		if (err > 0)
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5279  			err = 0;
078ea3dfe396b1 Trond Myklebust     2013-08-12  5280  		trace_nfs4_mkdir(dir, &dentry->d_name, err);
078ea3dfe396b1 Trond Myklebust     2013-08-12  5281  		err = nfs4_handle_exception(NFS_SERVER(dir), err,
^1da177e4c3f41 Linus Torvalds      2005-04-16  5282  				&exception);
^1da177e4c3f41 Linus Torvalds      2005-04-16  5283  	} while (exception.retry);
aa9c2669626ca7 David Quigley       2013-05-22  5284  	nfs4_label_release_security(label);
aa9c2669626ca7 David Quigley       2013-05-22  5285  
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5286  	if (err != 0)
4c35d65f4c6f1e Anna Schumaker      2025-05-16  5287  		return ERR_PTR(err);
8376583b84a193 NeilBrown           2025-02-27  5288  	return alias;
^1da177e4c3f41 Linus Torvalds      2005-04-16  5289  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  5290  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
