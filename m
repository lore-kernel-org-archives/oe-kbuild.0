Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7A2E0902
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491928; cv=none; b=JH72su1auKIRfSKN0FvVM+9pb2u10qgUw2dY3wX8GdkHO+mVG5s7zFsfDqKCuL0Nm4HMoVmaOTr8O0WKdSgNOeBUWGjLTBzqG772Q14z7jf1Ui5wf0ku+/95W1mrPZhz+gDLB5XtMRzm3oiwwXDSGfrL/AoMjSEvqbG+tHtZlq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491928; c=relaxed/simple;
	bh=Cu9IsyVsJTbmaP9z4GgHuh4Dkeq8B+tbj8ZHzds9Pgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SfZ9HsLT+mInTHI7F+gpTBMmf2VH44VA7VkBDa5IDhJsglIxCso8534CQEMDQYkQkdj+ZCPQiSSLd17sthkNm7Zq7qArd/BuKuABBIpYdo5RZSo+JE1Fooy93nXAsqLXZPYeimtUh2a/xsxTL8zocc0XTV2vkApU8AiqFR7OwBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJc2o7Ly; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJc2o7Ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763491927; x=1795027927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cu9IsyVsJTbmaP9z4GgHuh4Dkeq8B+tbj8ZHzds9Pgg=;
  b=nJc2o7LycDpbVF542aY2ETLUeZzUYGy4JzLmRkRp6RIX5T3jHKql0wye
   2MXJmSV+YCkmfqmUzGP4QZ2Ww1ZwoFWMJ5+qtRn84+PPR5HbcaYy5DoNa
   JJ6gEPPylGCuf+RgYelO4ytZkwb8YpoTd9h5imkyRtOF2IZQ6N8YLBA0n
   qWch3D7SLlAbNO31Ddw3CghatSjr8b2w3sVlt+W+5VV4jbgKEfMRxXQWL
   Sc07OOWqs5vk/+aqhWCadEEBL33cnHX/rn9jkEEev1ToV4arT8zAM4lHi
   WXB8b+MFmxCSys0uUNYVIlcqbcv44+swI6xDKKgIIxSCj3lLIEev1uvGk
   g==;
X-CSE-ConnectionGUID: uZyo0HA5R0S6FED5TqDvhg==
X-CSE-MsgGUID: dbNKSHWCRy+3ANX6qgtsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76133609"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76133609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:52:05 -0800
X-CSE-ConnectionGUID: sE3eqDD+Tf6uaq7uP+dNUA==
X-CSE-MsgGUID: WhxP4qGGSsu86+ZUSsXosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221744322"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2025 10:52:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLQo5-000267-2W;
	Tue, 18 Nov 2025 18:52:01 +0000
Date: Wed, 19 Nov 2025 02:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:vfs-6.19.ovl 95/100] fs/overlayfs/copy_up.c:812
 ovl_copy_up_workdir() error: uninitialized symbol 'temp'.
Message-ID: <202511190225.KJIeqCih-lkp@intel.com>
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
commit: 41faaabc80d0666c831a225f410e0fb08e8186c5 [95/100] ovl: port ovl_copy_up_workdir() to cred guard
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: i386-randconfig-141-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190225.KJIeqCih-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511190225.KJIeqCih-lkp@intel.com/

smatch warnings:
fs/overlayfs/copy_up.c:812 ovl_copy_up_workdir() error: uninitialized symbol 'temp'.

vim +/temp +812 fs/overlayfs/copy_up.c

8ff1ba15c5f6b8 Christian Brauner 2025-11-14  780  
8ff1ba15c5f6b8 Christian Brauner 2025-11-14  781  DEFINE_CLASS(copy_up_creds, const struct cred *,
8ff1ba15c5f6b8 Christian Brauner 2025-11-14  782  	     if (!IS_ERR_OR_NULL(_T)) ovl_revert_copy_up_creds(_T),
8ff1ba15c5f6b8 Christian Brauner 2025-11-14  783  	     ovl_prepare_copy_up_creds(dentry), struct dentry *dentry)
8ff1ba15c5f6b8 Christian Brauner 2025-11-14  784  
3a1e819b4e8021 Amir Goldstein    2017-03-30  785  /*
b10cdcdc2012b2 Amir Goldstein    2018-10-08  786   * Copyup using workdir to prepare temp file.  Used when copying up directories,
b10cdcdc2012b2 Amir Goldstein    2018-10-08  787   * special files or when upper fs doesn't support O_TMPFILE.
3a1e819b4e8021 Amir Goldstein    2017-03-30  788   */
b10cdcdc2012b2 Amir Goldstein    2018-10-08  789  static int ovl_copy_up_workdir(struct ovl_copy_up_ctx *c)
b10cdcdc2012b2 Amir Goldstein    2018-10-08  790  {
576bb263450bbb Christian Brauner 2022-04-04  791  	struct ovl_fs *ofs = OVL_FS(c->dentry->d_sb);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  792  	struct inode *inode;
2b1a77461f1602 Miklos Szeredi    2022-09-24  793  	struct path path = { .mnt = ovl_upper_mnt(ofs) };
a8b0026847b8c4 Al Viro           2023-11-20  794  	struct dentry *temp, *upper, *trap;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  795  	int err;
6b52243f633eb5 Miklos Szeredi    2018-10-26  796  	struct ovl_cattr cattr = {
6b52243f633eb5 Miklos Szeredi    2018-10-26  797  		/* Can't properly set mode on creation because of the umask */
6b52243f633eb5 Miklos Szeredi    2018-10-26  798  		.mode = c->stat.mode & S_IFMT,
6b52243f633eb5 Miklos Szeredi    2018-10-26  799  		.rdev = c->stat.rdev,
6b52243f633eb5 Miklos Szeredi    2018-10-26  800  		.link = c->link
6b52243f633eb5 Miklos Szeredi    2018-10-26  801  	};
b10cdcdc2012b2 Amir Goldstein    2018-10-08  802  
41faaabc80d066 Christian Brauner 2025-11-14  803  	scoped_class(copy_up_creds, copy_up_creds, c->dentry) {
41faaabc80d066 Christian Brauner 2025-11-14  804  		if (IS_ERR(copy_up_creds))
41faaabc80d066 Christian Brauner 2025-11-14  805  			return PTR_ERR(copy_up_creds);
6b52243f633eb5 Miklos Szeredi    2018-10-26  806  
c63e56a4a6523f Amir Goldstein    2023-08-16  807  		ovl_start_write(c->dentry);
576bb263450bbb Christian Brauner 2022-04-04  808  		temp = ovl_create_temp(ofs, c->workdir, &cattr);
c63e56a4a6523f Amir Goldstein    2023-08-16  809  		ovl_end_write(c->dentry);
41faaabc80d066 Christian Brauner 2025-11-14  810  	}
6b52243f633eb5 Miklos Szeredi    2018-10-26  811  
b10cdcdc2012b2 Amir Goldstein    2018-10-08 @812  	if (IS_ERR(temp))
c63e56a4a6523f Amir Goldstein    2023-08-16  813  		return PTR_ERR(temp);
bd64e57586d372 Vivek Goyal       2018-05-11  814  
2b1a77461f1602 Miklos Szeredi    2022-09-24  815  	/*
2b1a77461f1602 Miklos Szeredi    2022-09-24  816  	 * Copy up data first and then xattrs. Writing data after
2b1a77461f1602 Miklos Szeredi    2022-09-24  817  	 * xattrs will remove security.capability xattr automatically.
2b1a77461f1602 Miklos Szeredi    2022-09-24  818  	 */
2b1a77461f1602 Miklos Szeredi    2022-09-24  819  	path.dentry = temp;
2b1a77461f1602 Miklos Szeredi    2022-09-24  820  	err = ovl_copy_up_data(c, &path);
9d23967b18c64b NeilBrown         2025-07-16  821  	ovl_start_write(c->dentry);
9d23967b18c64b NeilBrown         2025-07-16  822  	if (err)
9d23967b18c64b NeilBrown         2025-07-16  823  		goto cleanup_unlocked;
9d23967b18c64b NeilBrown         2025-07-16  824  
c4f8f862b31ccd NeilBrown         2025-07-16  825  	if (S_ISDIR(c->stat.mode) && c->indexed) {
c4f8f862b31ccd NeilBrown         2025-07-16  826  		err = ovl_create_index(c->dentry, c->origin_fh, temp);
c4f8f862b31ccd NeilBrown         2025-07-16  827  		if (err)
c4f8f862b31ccd NeilBrown         2025-07-16  828  			goto cleanup_unlocked;
c4f8f862b31ccd NeilBrown         2025-07-16  829  	}
c4f8f862b31ccd NeilBrown         2025-07-16  830  
c63e56a4a6523f Amir Goldstein    2023-08-16  831  	/*
413ba91089c742 Amir Goldstein    2023-12-17  832  	 * We cannot hold lock_rename() throughout this helper, because of
c63e56a4a6523f Amir Goldstein    2023-08-16  833  	 * lock ordering with sb_writers, which shouldn't be held when calling
c63e56a4a6523f Amir Goldstein    2023-08-16  834  	 * ovl_copy_up_data(), so lock workdir and destdir and make sure that
c63e56a4a6523f Amir Goldstein    2023-08-16  835  	 * temp wasn't moved before copy up completion or cleanup.
c63e56a4a6523f Amir Goldstein    2023-08-16  836  	 */
a8b0026847b8c4 Al Viro           2023-11-20  837  	trap = lock_rename(c->workdir, c->destdir);
a8b0026847b8c4 Al Viro           2023-11-20  838  	if (trap || temp->d_parent != c->workdir) {
413ba91089c742 Amir Goldstein    2023-12-17  839  		/* temp or workdir moved underneath us? abort without cleanup */
413ba91089c742 Amir Goldstein    2023-12-17  840  		dput(temp);
c63e56a4a6523f Amir Goldstein    2023-08-16  841  		err = -EIO;
9d23967b18c64b NeilBrown         2025-07-16  842  		if (!IS_ERR(trap))
9d23967b18c64b NeilBrown         2025-07-16  843  			unlock_rename(c->workdir, c->destdir);
a8b0026847b8c4 Al Viro           2023-11-20  844  		goto out;
c63e56a4a6523f Amir Goldstein    2023-08-16  845  	}
2b1a77461f1602 Miklos Szeredi    2022-09-24  846  
2b1a77461f1602 Miklos Szeredi    2022-09-24  847  	err = ovl_copy_up_metadata(c, temp);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  848  	if (err)
b10cdcdc2012b2 Amir Goldstein    2018-10-08  849  		goto cleanup;
bd64e57586d372 Vivek Goyal       2018-05-11  850  
22f289ce1f8b10 Christian Brauner 2022-04-04  851  	upper = ovl_lookup_upper(ofs, c->destname.name, c->destdir,
22f289ce1f8b10 Christian Brauner 2022-04-04  852  				 c->destname.len);
6b52243f633eb5 Miklos Szeredi    2018-10-26  853  	err = PTR_ERR(upper);
6b52243f633eb5 Miklos Szeredi    2018-10-26  854  	if (IS_ERR(upper))
6b52243f633eb5 Miklos Szeredi    2018-10-26  855  		goto cleanup;
6b52243f633eb5 Miklos Szeredi    2018-10-26  856  
bc9241367aac08 NeilBrown         2025-06-13  857  	err = ovl_do_rename(ofs, c->workdir, temp, c->destdir, upper, 0);
a735bdf0b78528 NeilBrown         2025-07-16  858  	unlock_rename(c->workdir, c->destdir);
6b52243f633eb5 Miklos Szeredi    2018-10-26  859  	dput(upper);
0c288874936364 Vivek Goyal       2018-05-11  860  	if (err)
a735bdf0b78528 NeilBrown         2025-07-16  861  		goto cleanup_unlocked;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  862  
b10cdcdc2012b2 Amir Goldstein    2018-10-08  863  	inode = d_inode(c->dentry);
0c71faf5a607c8 Alexander Larsson 2023-04-19  864  	if (c->metacopy_digest)
0c71faf5a607c8 Alexander Larsson 2023-04-19  865  		ovl_set_flag(OVL_HAS_DIGEST, inode);
0c71faf5a607c8 Alexander Larsson 2023-04-19  866  	else
0c71faf5a607c8 Alexander Larsson 2023-04-19  867  		ovl_clear_flag(OVL_HAS_DIGEST, inode);
0c71faf5a607c8 Alexander Larsson 2023-04-19  868  	ovl_clear_flag(OVL_VERIFIED_DIGEST, inode);
0c71faf5a607c8 Alexander Larsson 2023-04-19  869  
0c71faf5a607c8 Alexander Larsson 2023-04-19  870  	if (!c->metacopy)
0c71faf5a607c8 Alexander Larsson 2023-04-19  871  		ovl_set_upperdata(inode);
6b52243f633eb5 Miklos Szeredi    2018-10-26  872  	ovl_inode_update(inode, temp);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  873  	if (S_ISDIR(inode->i_mode))
b10cdcdc2012b2 Amir Goldstein    2018-10-08  874  		ovl_set_flag(OVL_WHITEOUTS, inode);
a8b0026847b8c4 Al Viro           2023-11-20  875  out:
c63e56a4a6523f Amir Goldstein    2023-08-16  876  	ovl_end_write(c->dentry);
b10cdcdc2012b2 Amir Goldstein    2018-10-08  877  
0c288874936364 Vivek Goyal       2018-05-11  878  	return err;
b10cdcdc2012b2 Amir Goldstein    2018-10-08  879  
b10cdcdc2012b2 Amir Goldstein    2018-10-08  880  cleanup:
9d23967b18c64b NeilBrown         2025-07-16  881  	unlock_rename(c->workdir, c->destdir);
9d23967b18c64b NeilBrown         2025-07-16  882  cleanup_unlocked:
fe4d3360f9cbb5 NeilBrown         2025-07-16  883  	ovl_cleanup(ofs, c->workdir, temp);
6b52243f633eb5 Miklos Szeredi    2018-10-26  884  	dput(temp);
9d23967b18c64b NeilBrown         2025-07-16  885  	goto out;
0c288874936364 Vivek Goyal       2018-05-11  886  }
0c288874936364 Vivek Goyal       2018-05-11  887  

:::::: The code at line 812 was first introduced by commit
:::::: b10cdcdc2012b2c199077a0a648e8a7067e573bf ovl: untangle copy up call chain

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
