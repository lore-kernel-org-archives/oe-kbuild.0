Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE63276020
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 20:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498296; cv=none; b=MOVKg4qsE5Av04TLlLd1kl7TLhFwaiUAjL1FxfECNncwbIqtASCmIg9T3sVBzEv0zEbNLJBo307FIS09/MhPPpmRJmcZZ5hayftQyZF08/tKo3ZEAkuzfj+ohdux1piPcV3UTOSY9p/ZsVItZhRovc4WvLGZn3VouCGsfiLGbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498296; c=relaxed/simple;
	bh=PNvUVknTsMOFD0pyBkHcVsHKTvw30IdHFKiJAh1vMLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n4sdmn+1rre/jwXJkjlbq0o+luSJE+vqJfdiPmbasPfemAwAYPIm4SCrDNAxHtO+50tYeT7HZ8rZnA8dYHVNgYwNrUBeP5KvFuwdBppPH1VNDjDasIWFJa8yh370oOKWm4gjrlZfzLp+Gv9gYrQVXSNBrLbN7HbCiQkix+aRMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOHkZbmo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOHkZbmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763498295; x=1795034295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNvUVknTsMOFD0pyBkHcVsHKTvw30IdHFKiJAh1vMLM=;
  b=KOHkZbmoUCH8YO/AghhVVV9FwKur+rUzL2qd2+qivxQygOqG6gXVVaKh
   MssF9v10HZH4SgsIb10o/NLdG7/Z7+YSkDd4iB8jTcak9tK/kujQ8IO43
   0hZ6w+x2iBpevxhQUIcc6uRL5GUPD7rWPpIIxp9U4t6bs6Xd3eNsmjHq3
   YxKvLL4Z48G+HP32aC1uWyokyANse0Qp1SeryAFl7C0gCpf3brCeXhYmR
   k+5xgGMn8qRHuiQgckfvmSHtL7ooqBaKYKUotYNQO2U9o6nQKyjKliGgf
   zWRMHsm3huuuK9icLeyDbpSN4jZcPLmCe3XT20NgLzTDFXEV/o+43WOSW
   Q==;
X-CSE-ConnectionGUID: VuFTNBiqTVagPL+XId6LrA==
X-CSE-MsgGUID: UCO0rDNORfiUsR6MiTEOWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65693629"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65693629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 12:38:14 -0800
X-CSE-ConnectionGUID: qi8x7UMyRMqtdJoO+kUMuQ==
X-CSE-MsgGUID: WhW3Ei4JQuCe9jmj2kBclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="195168101"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2025 12:38:13 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLSSo-00029P-1L;
	Tue, 18 Nov 2025 20:38:10 +0000
Date: Wed, 19 Nov 2025 04:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs-6.19.ovl 98/100] fs/overlayfs/copy_up.c:906
 ovl_copy_up_tmpfile() error: uninitialized symbol 'tmpfile'.
Message-ID: <202511190437.kgEsBrRJ-lkp@intel.com>
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
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/brauner/linux.git vfs-6.19.ovl
head:   048bceb3415a09b6a830c0b9956c650e8c1861a3
commit: d6a4c32fb434cec92045f18dfc793a57e7a38eda [98/100] ovl: port ovl_copy_up_tmpfile() to cred guard
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190437.kgEsBrRJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511190437.kgEsBrRJ-lkp@intel.com/

New smatch warnings:
fs/overlayfs/copy_up.c:906 ovl_copy_up_tmpfile() error: uninitialized symbol 'tmpfile'.

Old smatch warnings:
fs/overlayfs/copy_up.c:812 ovl_copy_up_workdir() error: uninitialized symbol 'temp'.

vim +/tmpfile +906 fs/overlayfs/copy_up.c

0c288874936364 Vivek Goyal       2018-05-11  887  
6b52243f633eb5 Miklos Szeredi    2018-10-26  888  /* Copyup using O_TMPFILE which does not require cross dir locking */
6b52243f633eb5 Miklos Szeredi    2018-10-26  889  static int ovl_copy_up_tmpfile(struct ovl_copy_up_ctx *c)
b10cdcdc2012b2 Amir Goldstein    2018-10-08  890  {
576bb263450bbb Christian Brauner 2022-04-04  891  	struct ovl_fs *ofs = OVL_FS(c->dentry->d_sb);
6b52243f633eb5 Miklos Szeredi    2018-10-26  892  	struct inode *udir = d_inode(c->destdir);
6b52243f633eb5 Miklos Szeredi    2018-10-26  893  	struct dentry *temp, *upper;
2b1a77461f1602 Miklos Szeredi    2022-09-24  894  	struct file *tmpfile;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  895  	int err;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  896  
d6a4c32fb434ce Christian Brauner 2025-11-14  897  	scoped_class(copy_up_creds, copy_up_creds, c->dentry) {
d6a4c32fb434ce Christian Brauner 2025-11-14  898  		if (IS_ERR(copy_up_creds))
d6a4c32fb434ce Christian Brauner 2025-11-14  899  			return PTR_ERR(copy_up_creds);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  900  
c63e56a4a6523f Amir Goldstein    2023-08-16  901  		ovl_start_write(c->dentry);
2b1a77461f1602 Miklos Szeredi    2022-09-24  902  		tmpfile = ovl_do_tmpfile(ofs, c->workdir, c->stat.mode);
c63e56a4a6523f Amir Goldstein    2023-08-16  903  		ovl_end_write(c->dentry);
d6a4c32fb434ce Christian Brauner 2025-11-14  904  	}
d6a4c32fb434ce Christian Brauner 2025-11-14  905  
2b1a77461f1602 Miklos Szeredi    2022-09-24 @906  	if (IS_ERR(tmpfile))
2b1a77461f1602 Miklos Szeredi    2022-09-24  907  		return PTR_ERR(tmpfile);
2b1a77461f1602 Miklos Szeredi    2022-09-24  908  
2b1a77461f1602 Miklos Szeredi    2022-09-24  909  	temp = tmpfile->f_path.dentry;
2b1a77461f1602 Miklos Szeredi    2022-09-24  910  	if (!c->metacopy && c->stat.size) {
7d6899fb69d25e Amir Goldstein    2024-08-29  911  		err = ovl_copy_up_file(ofs, c->dentry, tmpfile, c->stat.size,
7d6899fb69d25e Amir Goldstein    2024-08-29  912  				       !c->metadata_fsync);
2b1a77461f1602 Miklos Szeredi    2022-09-24  913  		if (err)
baabaa50556336 Miklos Szeredi    2023-01-24  914  			goto out_fput;
2b1a77461f1602 Miklos Szeredi    2022-09-24  915  	}
b10cdcdc2012b2 Amir Goldstein    2018-10-08  916  
c63e56a4a6523f Amir Goldstein    2023-08-16  917  	ovl_start_write(c->dentry);
c63e56a4a6523f Amir Goldstein    2023-08-16  918  
2b1a77461f1602 Miklos Szeredi    2022-09-24  919  	err = ovl_copy_up_metadata(c, temp);
6b52243f633eb5 Miklos Szeredi    2018-10-26  920  	if (err)
c63e56a4a6523f Amir Goldstein    2023-08-16  921  		goto out;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  922  
b10cdcdc2012b2 Amir Goldstein    2018-10-08  923  	inode_lock_nested(udir, I_MUTEX_PARENT);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  924  
22f289ce1f8b10 Christian Brauner 2022-04-04  925  	upper = ovl_lookup_upper(ofs, c->destname.name, c->destdir,
22f289ce1f8b10 Christian Brauner 2022-04-04  926  				 c->destname.len);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  927  	err = PTR_ERR(upper);
6b52243f633eb5 Miklos Szeredi    2018-10-26  928  	if (!IS_ERR(upper)) {
576bb263450bbb Christian Brauner 2022-04-04  929  		err = ovl_do_link(ofs, temp, udir, upper);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  930  		dput(upper);
02209d10709c18 Amir Goldstein    2017-05-19  931  	}
6b52243f633eb5 Miklos Szeredi    2018-10-26  932  	inode_unlock(udir);
02209d10709c18 Amir Goldstein    2017-05-19  933  
e9be9d5e76e348 Miklos Szeredi    2014-10-24  934  	if (err)
c63e56a4a6523f Amir Goldstein    2023-08-16  935  		goto out;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  936  
0c71faf5a607c8 Alexander Larsson 2023-04-19  937  	if (c->metacopy_digest)
0c71faf5a607c8 Alexander Larsson 2023-04-19  938  		ovl_set_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
0c71faf5a607c8 Alexander Larsson 2023-04-19  939  	else
0c71faf5a607c8 Alexander Larsson 2023-04-19  940  		ovl_clear_flag(OVL_HAS_DIGEST, d_inode(c->dentry));
0c71faf5a607c8 Alexander Larsson 2023-04-19  941  	ovl_clear_flag(OVL_VERIFIED_DIGEST, d_inode(c->dentry));
0c71faf5a607c8 Alexander Larsson 2023-04-19  942  
0c288874936364 Vivek Goyal       2018-05-11  943  	if (!c->metacopy)
0c288874936364 Vivek Goyal       2018-05-11  944  		ovl_set_upperdata(d_inode(c->dentry));
2b1a77461f1602 Miklos Szeredi    2022-09-24  945  	ovl_inode_update(d_inode(c->dentry), dget(temp));
6b52243f633eb5 Miklos Szeredi    2018-10-26  946  
c63e56a4a6523f Amir Goldstein    2023-08-16  947  out:
c63e56a4a6523f Amir Goldstein    2023-08-16  948  	ovl_end_write(c->dentry);
2b1a77461f1602 Miklos Szeredi    2022-09-24  949  out_fput:
2b1a77461f1602 Miklos Szeredi    2022-09-24  950  	fput(tmpfile);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  951  	return err;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  952  }
e9be9d5e76e348 Miklos Szeredi    2014-10-24  953  

:::::: The code at line 906 was first introduced by commit
:::::: 2b1a77461f1602f870d6fe61fc65610bb8c8dd05 ovl: use vfs_tmpfile_open() helper

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
