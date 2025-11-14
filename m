Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085581684B4
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 00:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763078909; cv=none; b=e0LI/bIvsNJ1ENUxMaMStcWpxthCg3K1W49s2HlhkHETN4BCfsvEj0eUIKmkwIjw458wF/slsYetLs9P9gtiYmDavSakgU4HSYS4F/G4g9OmvWPGboJ318vdwPbXGpDh45LAJqcl/humR5T3eFvfYwFN3PRKOE//wmThco0gbLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763078909; c=relaxed/simple;
	bh=bPgLBNiF3fmbvj1mgh7JMGQKmksrP1njQ4LDjNQPDP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kEKbIkbpdfb/LBzzfSwVAKPcPh04FkEVQ3VR6JTZVDLkkmXBqoQqt5Zpr0Q0irLDchlbEQ0ld75H1vXcT+ArfarBhvZRzMRdQvMdTrLpDxkylmohTFJxRNAieZAmBiBBozcb0bq/YYepcVD4rP+t+4JoG++6KPyNmGiqgs7+Tn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsSBJ8IN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsSBJ8IN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763078906; x=1794614906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bPgLBNiF3fmbvj1mgh7JMGQKmksrP1njQ4LDjNQPDP4=;
  b=YsSBJ8INGAtphs8CYu7T3uMeEfj7o6FGCFfW/aSxxMr0CWCb3mWA2I4G
   SiZt90OQ+q2a2/o/dnR9/oyepzay3hNWJcWkqHTa7I1Eyx0QQwp6nEFn9
   gTNq3dc86xZqWHwg7X/mIC4IimLGsleFKMnjOZosDqPaAUkIR+iW2mC/I
   pcp2AWxjlFgmU76AqLyktykUw52Y0qCIgPGpd0BjugkXJETGw1XHNdLwU
   3FKXT4AZFUCKBmH3/mKSjv+Da6vJHksJb7j2+MmizF/7AELvzWcWVfLdi
   QTncB8s4OPPTYDKvjLzTbfRm1gaFYFXCkQ9pcOjJX4IFgw/jRgz4Z5KQH
   g==;
X-CSE-ConnectionGUID: WlZb8C3xRYS78CQBko7vCw==
X-CSE-MsgGUID: 2kaHv0E6TbqLWLGfEbLDNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82566110"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="82566110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 16:08:25 -0800
X-CSE-ConnectionGUID: qlGkJ7HjRt6xfYa0MQ5xHQ==
X-CSE-MsgGUID: /RqRU7HMR06cGKErOSU8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="226971905"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2025 16:08:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJhMT-00060F-1A;
	Fri, 14 Nov 2025 00:08:21 +0000
Date: Fri, 14 Nov 2025 08:07:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 7/46] fs/overlayfs/dir.c:654
 ovl_create_or_link() error: uninitialized symbol 'err'.
Message-ID: <202511140805.FxiiRvrt-lkp@intel.com>
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
commit: 939c09f73a75c0d72556ea38b91e6fb9cfa5af5a [7/46] ovl: port ovl_create_or_link() to cred guard
:::::: branch date: 3 hours ago
:::::: commit date: 13 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140805.FxiiRvrt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511140805.FxiiRvrt-lkp@intel.com/

smatch warnings:
fs/overlayfs/dir.c:654 ovl_create_or_link() error: uninitialized symbol 'err'.

vim +/err +654 fs/overlayfs/dir.c

9a87907de3597a Miklos Szeredi    2024-05-02  610  
51f7e52dc94346 Miklos Szeredi    2016-07-29  611  static int ovl_create_or_link(struct dentry *dentry, struct inode *inode,
471ec5dcf4e712 Amir Goldstein    2018-05-16  612  			      struct ovl_cattr *attr, bool origin)
e9be9d5e76e348 Miklos Szeredi    2014-10-24  613  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24  614  	int err;
939c09f73a75c0 Christian Brauner 2025-11-12  615  	const struct cred *new_cred __free(put_cred) = NULL;
ea3dad18dc5f77 Amir Goldstein    2017-07-11  616  	struct dentry *parent = dentry->d_parent;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  617  
939c09f73a75c0 Christian Brauner 2025-11-12  618  	scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
ea3dad18dc5f77 Amir Goldstein    2017-07-11  619  		/*
ea3dad18dc5f77 Amir Goldstein    2017-07-11  620  		 * When linking a file with copy up origin into a new parent, mark the
ea3dad18dc5f77 Amir Goldstein    2017-07-11  621  		 * new parent dir "impure".
ea3dad18dc5f77 Amir Goldstein    2017-07-11  622  		 */
ea3dad18dc5f77 Amir Goldstein    2017-07-11  623  		if (origin) {
ea3dad18dc5f77 Amir Goldstein    2017-07-11  624  			err = ovl_set_impure(parent, ovl_dentry_upper(parent));
ea3dad18dc5f77 Amir Goldstein    2017-07-11  625  			if (err)
939c09f73a75c0 Christian Brauner 2025-11-12  626  				return err;
ea3dad18dc5f77 Amir Goldstein    2017-07-11  627  		}
ea3dad18dc5f77 Amir Goldstein    2017-07-11  628  
5b0db51215e895 Zhang Tianci      2022-09-01  629  		if (!attr->hardlink) {
5b0db51215e895 Zhang Tianci      2022-09-01  630  			/*
5b0db51215e895 Zhang Tianci      2022-09-01  631  			 * In the creation cases(create, mkdir, mknod, symlink),
5b0db51215e895 Zhang Tianci      2022-09-01  632  			 * ovl should transfer current's fs{u,g}id to underlying
5b0db51215e895 Zhang Tianci      2022-09-01  633  			 * fs. Because underlying fs want to initialize its new
5b0db51215e895 Zhang Tianci      2022-09-01  634  			 * inode owner using current's fs{u,g}id. And in this
5b0db51215e895 Zhang Tianci      2022-09-01  635  			 * case, the @inode is a new inode that is initialized
5b0db51215e895 Zhang Tianci      2022-09-01  636  			 * in inode_init_owner() to current's fs{u,g}id. So use
5b0db51215e895 Zhang Tianci      2022-09-01  637  			 * the inode's i_{u,g}id to override the cred's fs{u,g}id.
5b0db51215e895 Zhang Tianci      2022-09-01  638  			 *
5b0db51215e895 Zhang Tianci      2022-09-01  639  			 * But in the other hardlink case, ovl_link() does not
5b0db51215e895 Zhang Tianci      2022-09-01  640  			 * create a new inode, so just use the ovl mounter's
5b0db51215e895 Zhang Tianci      2022-09-01  641  			 * fs{u,g}id.
5b0db51215e895 Zhang Tianci      2022-09-01  642  			 */
939c09f73a75c0 Christian Brauner 2025-11-12  643  			new_cred = ovl_setup_cred_for_create(dentry, inode, attr->mode, old_cred);
939c09f73a75c0 Christian Brauner 2025-11-12  644  			if (IS_ERR(new_cred))
939c09f73a75c0 Christian Brauner 2025-11-12  645  				return PTR_ERR(new_cred);
711747e204ead1 Amir Goldstein    2024-11-14  646  		}
d0e13f5bbe4be7 Miklos Szeredi    2016-06-15  647  
c412ce49839609 Miklos Szeredi    2016-12-16  648  		if (!ovl_dentry_is_whiteout(dentry))
939c09f73a75c0 Christian Brauner 2025-11-12  649  			return ovl_create_upper(dentry, inode, attr);
939c09f73a75c0 Christian Brauner 2025-11-12  650  
939c09f73a75c0 Christian Brauner 2025-11-12  651  		return ovl_create_over_whiteout(dentry, inode, attr);
5b0db51215e895 Zhang Tianci      2022-09-01  652  
939c09f73a75c0 Christian Brauner 2025-11-12  653  	}
e9be9d5e76e348 Miklos Szeredi    2014-10-24 @654  	return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  655  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  656  

:::::: The code at line 654 was first introduced by commit
:::::: e9be9d5e76e34872f0c37d72e25bc27fe9e2c54c overlay filesystem

:::::: TO: Miklos Szeredi <mszeredi@suse.cz>
:::::: CC: Miklos Szeredi <mszeredi@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
