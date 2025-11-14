Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D612DDA1
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Nov 2025 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104808; cv=none; b=mHKr3jBOXXfXd2UP1nvtbFsQ8SC++DgxvpCK7qCUbzh+0WLOc6iMRaMsZBCmlC7jCMFdmkjRGXnWibcnLHCpmkQI81XmBZ+fTxX4DKjMBBTvKi6cWLe8j/kSkHq0T25gfDG/31f1dGo9xNM+z30Gu44o6hsxoKjk9AwPeMbPCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104808; c=relaxed/simple;
	bh=oiH/02Hnt9Np667dGU5srl8VPjy0r9uNmZp0TZ2XDTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hr3UgLHAisM06Ahc00hEgdM4O2As3LmFaWA3JVPbhXIlETWmBtUtVS/AwUiyajpuyCcvnaGEnUI8gIZOsUUWdeMyQTZDSnUGvziJndTS/4jnIDoLaYGURuqTIx0tUO0rJOUvdzXVPeNd8gy/B9eis38CmwYDh5gumsJAxgmsC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VbwpDqeO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VbwpDqeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763104807; x=1794640807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oiH/02Hnt9Np667dGU5srl8VPjy0r9uNmZp0TZ2XDTE=;
  b=VbwpDqeOA0j29KHexXB+HPsuZbUF9ooS8jN87A9a7rNvnGRZIua9jthR
   +x2JNouwasMmip4JR7FkZoxgSJbjFm217TgsXAzKcpZgdocA+Uap40hPQ
   EGm4+xAUINsPbgyAe3Y/gVIlIEWhMPuIPl8zaEMzAeZYxU98vscprulTu
   eoZFDlOErDzI7UwAK9f4v6BvYzjSjIlWMx5Zm66Ul1ZmZd4y7j4cZqEbM
   Kzk+vJEP/lwz46WYMZCaP3/ueU/IjNF0VV/XCNjoSogwUjvO/M/lItAGT
   JW4w/GtvSHgWAVYx74GSEXvplNuI251lbfBVJ+w8p+9VXH/luoao/Fp8D
   Q==;
X-CSE-ConnectionGUID: AC7UYRw0RUW9fNIbFul3Mg==
X-CSE-MsgGUID: aEopq8SdS6ijFYbELttEyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69063149"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="69063149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 23:20:04 -0800
X-CSE-ConnectionGUID: wVcNWrsPTo2rXqa92Ti0Pg==
X-CSE-MsgGUID: IWOwm2ZWTdClS8h+AFEA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194851423"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2025 23:20:03 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJo6C-0006IH-2i;
	Fri, 14 Nov 2025 07:20:00 +0000
Date: Fri, 14 Nov 2025 15:19:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-github:work.ovl.cred.guard 22/46] fs/overlayfs/inode.c:482
 ovl_set_or_remove_acl() error: uninitialized symbol 'real_acl'.
Message-ID: <202511141535.GQA6bqo8-lkp@intel.com>
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
commit: 46c2b7adb65b6efb83dec3894fb056cda37e0508 [22/46] ovl: port ovl_set_or_remove_acl() to cred guard
:::::: branch date: 10 hours ago
:::::: commit date: 20 hours ago
config: parisc-randconfig-r072-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141535.GQA6bqo8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511141535.GQA6bqo8-lkp@intel.com/

New smatch warnings:
fs/overlayfs/inode.c:482 ovl_set_or_remove_acl() error: uninitialized symbol 'real_acl'.

Old smatch warnings:
fs/overlayfs/inode.c:280 ovl_getattr() error: uninitialized symbol 'err'.
fs/overlayfs/inode.c:458 do_ovl_get_acl() error: uninitialized symbol 'acl'.
fs/overlayfs/inode.c:1201 ovl_get_inode() error: we previously assumed 'lowerpath' could be null (see line 1198)

vim +/real_acl +482 fs/overlayfs/inode.c

0e641857322f4d Christian Brauner 2022-09-22  460  
0e641857322f4d Christian Brauner 2022-09-22  461  static int ovl_set_or_remove_acl(struct dentry *dentry, struct inode *inode,
0e641857322f4d Christian Brauner 2022-09-22  462  				 struct posix_acl *acl, int type)
0e641857322f4d Christian Brauner 2022-09-22  463  {
0e641857322f4d Christian Brauner 2022-09-22  464  	int err;
0e641857322f4d Christian Brauner 2022-09-22  465  	struct path realpath;
0e641857322f4d Christian Brauner 2022-09-22  466  	const char *acl_name;
0e641857322f4d Christian Brauner 2022-09-22  467  	struct ovl_fs *ofs = OVL_FS(dentry->d_sb);
0e641857322f4d Christian Brauner 2022-09-22  468  	struct dentry *upperdentry = ovl_dentry_upper(dentry);
0e641857322f4d Christian Brauner 2022-09-22  469  	struct dentry *realdentry = upperdentry ?: ovl_dentry_lower(dentry);
0e641857322f4d Christian Brauner 2022-09-22  470  
0e641857322f4d Christian Brauner 2022-09-22  471  	/*
0e641857322f4d Christian Brauner 2022-09-22  472  	 * If ACL is to be removed from a lower file, check if it exists in
0e641857322f4d Christian Brauner 2022-09-22  473  	 * the first place before copying it up.
0e641857322f4d Christian Brauner 2022-09-22  474  	 */
0e641857322f4d Christian Brauner 2022-09-22  475  	acl_name = posix_acl_xattr_name(type);
0e641857322f4d Christian Brauner 2022-09-22  476  	if (!acl && !upperdentry) {
0e641857322f4d Christian Brauner 2022-09-22  477  		struct posix_acl *real_acl;
0e641857322f4d Christian Brauner 2022-09-22  478  
0e641857322f4d Christian Brauner 2022-09-22  479  		ovl_path_lower(dentry, &realpath);
46c2b7adb65b6e Christian Brauner 2025-11-12  480  		with_ovl_creds(dentry->d_sb)
46c2b7adb65b6e Christian Brauner 2025-11-12  481  			real_acl = vfs_get_acl(mnt_idmap(realpath.mnt), realdentry, acl_name);
0e641857322f4d Christian Brauner 2022-09-22 @482  		if (IS_ERR(real_acl)) {
0e641857322f4d Christian Brauner 2022-09-22  483  			err = PTR_ERR(real_acl);
162d06444070c1 Amir Goldstein    2023-07-20  484  			goto out;
0e641857322f4d Christian Brauner 2022-09-22  485  		}
5b52aebef8954c Christian Brauner 2022-11-03  486  		posix_acl_release(real_acl);
0e641857322f4d Christian Brauner 2022-09-22  487  	}
0e641857322f4d Christian Brauner 2022-09-22  488  
0e641857322f4d Christian Brauner 2022-09-22  489  	if (!upperdentry) {
0e641857322f4d Christian Brauner 2022-09-22  490  		err = ovl_copy_up(dentry);
0e641857322f4d Christian Brauner 2022-09-22  491  		if (err)
162d06444070c1 Amir Goldstein    2023-07-20  492  			goto out;
0e641857322f4d Christian Brauner 2022-09-22  493  
0e641857322f4d Christian Brauner 2022-09-22  494  		realdentry = ovl_dentry_upper(dentry);
0e641857322f4d Christian Brauner 2022-09-22  495  	}
0e641857322f4d Christian Brauner 2022-09-22  496  
162d06444070c1 Amir Goldstein    2023-07-20  497  	err = ovl_want_write(dentry);
162d06444070c1 Amir Goldstein    2023-07-20  498  	if (err)
162d06444070c1 Amir Goldstein    2023-07-20  499  		goto out;
162d06444070c1 Amir Goldstein    2023-07-20  500  
46c2b7adb65b6e Christian Brauner 2025-11-12  501  	with_ovl_creds(dentry->d_sb) {
0e641857322f4d Christian Brauner 2022-09-22  502  		if (acl)
0e641857322f4d Christian Brauner 2022-09-22  503  			err = ovl_do_set_acl(ofs, realdentry, acl_name, acl);
0e641857322f4d Christian Brauner 2022-09-22  504  		else
0e641857322f4d Christian Brauner 2022-09-22  505  			err = ovl_do_remove_acl(ofs, realdentry, acl_name);
46c2b7adb65b6e Christian Brauner 2025-11-12  506  	}
162d06444070c1 Amir Goldstein    2023-07-20  507  	ovl_drop_write(dentry);
0e641857322f4d Christian Brauner 2022-09-22  508  
0e641857322f4d Christian Brauner 2022-09-22  509  	/* copy c/mtime */
0e641857322f4d Christian Brauner 2022-09-22  510  	ovl_copyattr(inode);
162d06444070c1 Amir Goldstein    2023-07-20  511  out:
0e641857322f4d Christian Brauner 2022-09-22  512  	return err;
0e641857322f4d Christian Brauner 2022-09-22  513  }
0e641857322f4d Christian Brauner 2022-09-22  514  

:::::: The code at line 482 was first introduced by commit
:::::: 0e641857322f4d0a99aec3f49b21b732f3bb5ef9 ovl: implement set acl method

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner (Microsoft) <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
