Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738EB324B35
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132571; cv=none; b=RrYUttMK8oNPWM2cLEPlWwhYO11L/rWnvw8oM9+nXaq/3faK/5jMAVZHAj3aIs8dPI/Ve+ck2AHz0S2G5DyBiQffjIaaaojz8qj1tsBUzEQq21k4K38TsTyAAfpb0IAwF/tYHdGZvuO0lTSWzWqlPOr0td1pjqBFaw+lZ3RV36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132571; c=relaxed/simple;
	bh=JwDtfdTKMGwlmTLCbNvmO+jtozWazO82r/+hXIcioZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUFbXZCnMMH5USb4FAW4Hw3Mq52FVwkttCSvJXbUhI9/LAx6TaGMU3Ob1o0CLt3HtJexukUDdIHS+Ft5W6bYeu4yaRF4WkOeutYyfWZtpAlGzolSrEtk8q9InqovZj6Cok+lgPAY5t990vhdKiFLsglPDXYLKQ0RJmsI20jSjBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gSJ0pCPn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gSJ0pCPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763132569; x=1794668569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JwDtfdTKMGwlmTLCbNvmO+jtozWazO82r/+hXIcioZs=;
  b=gSJ0pCPn8njUKumzXVFdyyM8faBFpPnrgPxtPGw/YNedyE+Ka+Ph93U/
   wGO/Wp/U0EdIfQddYYtwXhsxWCsda384fZ1O0e54jQrc9iVD0vrjeyq4B
   DexVjrnk9xI6zAh4POqrMb6unP0ANT1rguGwNPKkthL3vqA/Ru9Fnif0+
   mRGU6H7pH2xRySJ9FQRQrEeZ34IPG32aoaqUoGB4oJSbYt+D20H5UojH9
   1hgRlcfSEyCKg7PiphEhr2W3Tb/HUD+jxEsBmGWCGinqd7hEgqAiA0EYE
   TWKH9EughlzpXrSPw4YN4DVtz+da4g8XhLofFNQLiR0o4FnsrXt070+aC
   A==;
X-CSE-ConnectionGUID: rmyu35fsQIm2c/0vae/HRw==
X-CSE-MsgGUID: Q1ASqXRDSDup2x/guclZ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="65112184"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65112184"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 07:02:49 -0800
X-CSE-ConnectionGUID: ijgt8OJ/TuSiDxjthCEnWg==
X-CSE-MsgGUID: UYRSC4k7T7KQ0Bxh1cyJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189061661"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2025 07:02:47 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJvK1-0006gz-22;
	Fri, 14 Nov 2025 15:02:45 +0000
Date: Fri, 14 Nov 2025 23:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 41/46] fs/overlayfs/namei.c:1409
 ovl_lookup() error: uninitialized symbol 'err'.
Message-ID: <202511142222.gmx8s5s6-lkp@intel.com>
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
commit: 0bd86355fb98c4f3e030b386c71a46676e045906 [41/46] ovl: port ovl_lookup() to cred guard
:::::: branch date: 18 hours ago
:::::: commit date: 27 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142222.gmx8s5s6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511142222.gmx8s5s6-lkp@intel.com/

New smatch warnings:
fs/overlayfs/namei.c:1409 ovl_lookup() error: uninitialized symbol 'err'.

Old smatch warnings:
fs/overlayfs/namei.c:44 ovl_check_redirect() warn: passing zero to 'PTR_ERR'
fs/overlayfs/namei.c:505 ovl_check_origin() warn: passing zero to 'PTR_ERR'
fs/overlayfs/namei.c:607 ovl_index_upper() warn: passing zero to 'ERR_CAST'
fs/overlayfs/namei.c:684 ovl_verify_index() warn: passing zero to 'PTR_ERR'

vim +/err +1409 fs/overlayfs/namei.c

bf4c50b6cbddef Christian Brauner 2025-11-13  1377  
bf4c50b6cbddef Christian Brauner 2025-11-13  1378  struct dentry *ovl_lookup(struct inode *dir, struct dentry *dentry,
bf4c50b6cbddef Christian Brauner 2025-11-13  1379  			  unsigned int flags)
bf4c50b6cbddef Christian Brauner 2025-11-13  1380  {
bf4c50b6cbddef Christian Brauner 2025-11-13  1381  	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
bf4c50b6cbddef Christian Brauner 2025-11-13  1382  	struct ovl_entry *poe = OVL_E(dentry->d_parent);
bf4c50b6cbddef Christian Brauner 2025-11-13  1383  	bool check_redirect = (ovl_redirect_follow(ofs) || ofs->numdatalayer);
bf4c50b6cbddef Christian Brauner 2025-11-13  1384  	int err;
bf4c50b6cbddef Christian Brauner 2025-11-13  1385  	struct ovl_lookup_ctx ctx = {
bf4c50b6cbddef Christian Brauner 2025-11-13  1386  		.dentry = dentry,
bf4c50b6cbddef Christian Brauner 2025-11-13  1387  	};
bf4c50b6cbddef Christian Brauner 2025-11-13  1388  	struct ovl_lookup_data d = {
bf4c50b6cbddef Christian Brauner 2025-11-13  1389  		.sb	= dentry->d_sb,
bf4c50b6cbddef Christian Brauner 2025-11-13  1390  		.dentry = dentry,
bf4c50b6cbddef Christian Brauner 2025-11-13  1391  		.name	= dentry->d_name,
bf4c50b6cbddef Christian Brauner 2025-11-13  1392  		.last	= check_redirect ? false : !ovl_numlower(poe),
bf4c50b6cbddef Christian Brauner 2025-11-13  1393  	};
bf4c50b6cbddef Christian Brauner 2025-11-13  1394  
bf4c50b6cbddef Christian Brauner 2025-11-13  1395  	if (dentry->d_name.len > ofs->namelen)
bf4c50b6cbddef Christian Brauner 2025-11-13  1396  		return ERR_PTR(-ENAMETOOLONG);
bf4c50b6cbddef Christian Brauner 2025-11-13  1397  
0bd86355fb98c4 Christian Brauner 2025-11-13  1398  	with_ovl_creds(dentry->d_sb)
bf4c50b6cbddef Christian Brauner 2025-11-13  1399  		err = do_ovl_lookup(&ctx, &d);
f4288844561922 Miklos Szeredi    2020-03-17  1400  
bf4c50b6cbddef Christian Brauner 2025-11-13  1401  	if (ctx.origin_path) {
bf4c50b6cbddef Christian Brauner 2025-11-13  1402  		dput(ctx.origin_path->dentry);
bf4c50b6cbddef Christian Brauner 2025-11-13  1403  		kfree(ctx.origin_path);
9d3dfea3d35a32 Vivek Goyal       2018-05-11  1404  	}
bf4c50b6cbddef Christian Brauner 2025-11-13  1405  	dput(ctx.index);
bf4c50b6cbddef Christian Brauner 2025-11-13  1406  	ovl_stack_free(ctx.stack, ctx.ctr);
02b69b284cd781 Miklos Szeredi    2016-12-16  1407  	kfree(d.redirect);
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  1408  
bf4c50b6cbddef Christian Brauner 2025-11-13 @1409  	if (err) {
bf4c50b6cbddef Christian Brauner 2025-11-13  1410  		ovl_free_entry(ctx.oe);
bf4c50b6cbddef Christian Brauner 2025-11-13  1411  		dput(ctx.upperdentry);
a6fcfe9bb26df1 Miklos Szeredi    2025-02-07  1412  		kfree(d.upperredirect);
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  1413  		return ERR_PTR(err);
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  1414  	}
bbb1e54dd53cf8 Miklos Szeredi    2016-12-16  1415  
bf4c50b6cbddef Christian Brauner 2025-11-13  1416  	return d_splice_alias(ctx.inode, dentry);
bf4c50b6cbddef Christian Brauner 2025-11-13  1417  }
bf4c50b6cbddef Christian Brauner 2025-11-13  1418  

:::::: The code at line 1409 was first introduced by commit
:::::: bf4c50b6cbddef7ba1f2d8b48d455abc3a9f3ae2 ovl: refactor ovl_lookup()

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
