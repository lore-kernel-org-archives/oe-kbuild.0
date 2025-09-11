Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EB2D542F
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 20:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757623776; cv=none; b=VyG+aOLK3EwEk0dNHY4x/kFAL330g7AfzMAUNE6H0iSnZ0GrytxFJoW5C+Q3AktQ/U+/JibILf9wtvBGBONNkKO1n7T5B3BTCH+thjVvI/ssP7EVGHzuM/68dW7444bg7W8ZvzKoNmTbgPOPGmsNNxFEw1YFgPfvXnbZxv8OS/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757623776; c=relaxed/simple;
	bh=a1EtAhxz1y8nm0ejWjp6rFlw2H0g9p9UXkYN7WEybpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHHNsQEpRQS3n2pm3tiAlXAGSPd708f970MGGGzpFPZg3mHauSBLCqeRoGXmlCN9bx4PaHvotyozrKIXeAVFcNF6fod0X+Ng8T+43VJUtD0ZCktTUCKgGQHGPo6IVknj4LZZwia5jYPjMv/NUw19CF0Z8R7MrdXlOLiVSKAF+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcpxiwo8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcpxiwo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757623774; x=1789159774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a1EtAhxz1y8nm0ejWjp6rFlw2H0g9p9UXkYN7WEybpc=;
  b=lcpxiwo8+JEZDqOaX8CVWmijSPSI3kpgAOb9raPggqZ/una9ETxLN8X7
   y9HWz7QAqT4gxi+PmH/UBK6A3Hx8K58XRaaJGZpDNE+kVYD1rs0AeBMAy
   PO5BRIh59SQu/Qfvm7omgqZl3eKM2/FGSdl3m7iVyHSvvXk8NY9ChSgEk
   xsDui3TDsIWQuPWZg3DkDQwd75q8Mny1kJmctAONyNE5SnBEgdq+c0GsK
   GyEFwwwrasqlDZw9lJiuvRHKX9/+20+3WdxFt3dKC31GYffaI3kxwmcUL
   mDK9XHsnyQzyzVLjq4MdTdMgj+WGfytGC8wg1wjgHd6rMrk7EpJHA1RUd
   A==;
X-CSE-ConnectionGUID: yc/DSVqYSGqi5jsx4Z6LVg==
X-CSE-MsgGUID: wiJY9RIAQOmn9kEvoPx+zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63601549"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="63601549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 13:49:33 -0700
X-CSE-ConnectionGUID: Umw11w8uRhyEmkJJyBMoQg==
X-CSE-MsgGUID: lWwY+dTETiyUG3gpAu4EaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="197470410"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2025 13:49:31 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwoES-0000d2-2k;
	Thu, 11 Sep 2025 20:49:28 +0000
Date: Fri, 12 Sep 2025 04:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 07/10] exportfs: new FILEID_CACHED flag for non-blocking
 fh lookup
Message-ID: <202509120423.cZlR8oLY-lkp@intel.com>
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
In-Reply-To: <20250910214927.480316-8-tahbertschinger@gmail.com>
References: <20250910214927.480316-8-tahbertschinger@gmail.com>
TO: Thomas Bertschinger <tahbertschinger@gmail.com>
TO: io-uring@vger.kernel.org
TO: axboe@kernel.dk
TO: linux-fsdevel@vger.kernel.org
TO: viro@zeniv.linux.org.uk
TO: brauner@kernel.org
TO: linux-nfs@vger.kernel.org
CC: Thomas Bertschinger <tahbertschinger@gmail.com>
CC: Amir Goldstein <amir73il@gmail.com>
CC: chuck.lever@oracle.com
CC: jlayton@kernel.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bertschinger/fhandle-create-helper-for-name_to_handle_at-2/20250911-054830
base:   76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
patch link:    https://lore.kernel.org/r/20250910214927.480316-8-tahbertschinger%40gmail.com
patch subject: [PATCH 07/10] exportfs: new FILEID_CACHED flag for non-blocking fh lookup
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm-randconfig-r071-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120423.cZlR8oLY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509120423.cZlR8oLY-lkp@intel.com/

smatch warnings:
fs/exportfs/expfs.c:539 exportfs_decode_fh_raw() warn: maybe use && instead of &

vim +539 fs/exportfs/expfs.c

d37065cd6d6bbe9 Christoph Hellwig   2007-07-17  436  
d045465fc6cbfa4 Trond Myklebust     2020-11-30  437  struct dentry *
d045465fc6cbfa4 Trond Myklebust     2020-11-30  438  exportfs_decode_fh_raw(struct vfsmount *mnt, struct fid *fid, int fh_len,
620c266f394932e Christian Brauner   2024-05-24  439  		       int fileid_type, unsigned int flags,
d045465fc6cbfa4 Trond Myklebust     2020-11-30  440  		       int (*acceptable)(void *, struct dentry *),
d045465fc6cbfa4 Trond Myklebust     2020-11-30  441  		       void *context)
d37065cd6d6bbe9 Christoph Hellwig   2007-07-17  442  {
39655164405940d Christoph Hellwig   2007-10-21  443  	const struct export_operations *nop = mnt->mnt_sb->s_export_op;
638205375afdc8a Thomas Bertschinger 2025-09-10  444  	bool decode_cached = fileid_type & FILEID_CACHED;
2596110a3994593 Christoph Hellwig   2007-10-21  445  	struct dentry *result, *alias;
f3f8e17571934ea Al Viro             2008-08-11  446  	char nbuf[NAME_MAX+1];
2596110a3994593 Christoph Hellwig   2007-10-21  447  	int err;
d37065cd6d6bbe9 Christoph Hellwig   2007-07-17  448  
4a530a7c751d27f Amir Goldstein      2024-10-11  449  	if (fileid_type < 0 || FILEID_USER_FLAGS(fileid_type))
4a530a7c751d27f Amir Goldstein      2024-10-11  450  		return ERR_PTR(-EINVAL);
4a530a7c751d27f Amir Goldstein      2024-10-11  451  
2596110a3994593 Christoph Hellwig   2007-10-21  452  	/*
2596110a3994593 Christoph Hellwig   2007-10-21  453  	 * Try to get any dentry for the given file handle from the filesystem.
2596110a3994593 Christoph Hellwig   2007-10-21  454  	 */
66c62769bcf6aa1 Amir Goldstein      2023-10-23  455  	if (!exportfs_can_decode_fh(nop))
becfd1f37544798 Aneesh Kumar K.V    2011-01-29  456  		return ERR_PTR(-ESTALE);
638205375afdc8a Thomas Bertschinger 2025-09-10  457  
638205375afdc8a Thomas Bertschinger 2025-09-10  458  	if (decode_cached && !(nop->flags & EXPORT_OP_NONBLOCK))
638205375afdc8a Thomas Bertschinger 2025-09-10  459  		return ERR_PTR(-EAGAIN);
638205375afdc8a Thomas Bertschinger 2025-09-10  460  
2596110a3994593 Christoph Hellwig   2007-10-21  461  	result = nop->fh_to_dentry(mnt->mnt_sb, fid, fh_len, fileid_type);
09bb8bfffd29c3d NeilBrown           2016-08-04  462  	if (IS_ERR_OR_NULL(result))
d045465fc6cbfa4 Trond Myklebust     2020-11-30  463  		return result;
2596110a3994593 Christoph Hellwig   2007-10-21  464  
620c266f394932e Christian Brauner   2024-05-24  465  	if ((flags & EXPORT_FH_DIR_ONLY) && !d_is_dir(result)) {
620c266f394932e Christian Brauner   2024-05-24  466  		err = -ENOTDIR;
620c266f394932e Christian Brauner   2024-05-24  467  		goto err_result;
620c266f394932e Christian Brauner   2024-05-24  468  	}
620c266f394932e Christian Brauner   2024-05-24  469  
8a22efa15b46d52 Amir Goldstein      2018-03-09  470  	/*
8a22efa15b46d52 Amir Goldstein      2018-03-09  471  	 * If no acceptance criteria was specified by caller, a disconnected
8a22efa15b46d52 Amir Goldstein      2018-03-09  472  	 * dentry is also accepatable. Callers may use this mode to query if
8a22efa15b46d52 Amir Goldstein      2018-03-09  473  	 * file handle is stale or to get a reference to an inode without
8a22efa15b46d52 Amir Goldstein      2018-03-09  474  	 * risking the high overhead caused by directory reconnect.
8a22efa15b46d52 Amir Goldstein      2018-03-09  475  	 */
8a22efa15b46d52 Amir Goldstein      2018-03-09  476  	if (!acceptable)
8a22efa15b46d52 Amir Goldstein      2018-03-09  477  		return result;
8a22efa15b46d52 Amir Goldstein      2018-03-09  478  
e36cb0b89ce20b4 David Howells       2015-01-29  479  	if (d_is_dir(result)) {
2596110a3994593 Christoph Hellwig   2007-10-21  480  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  481  		 * This request is for a directory.
2596110a3994593 Christoph Hellwig   2007-10-21  482  		 *
2596110a3994593 Christoph Hellwig   2007-10-21  483  		 * On the positive side there is only one dentry for each
2596110a3994593 Christoph Hellwig   2007-10-21  484  		 * directory inode.  On the negative side this implies that we
2596110a3994593 Christoph Hellwig   2007-10-21  485  		 * to ensure our dentry is connected all the way up to the
2596110a3994593 Christoph Hellwig   2007-10-21  486  		 * filesystem root.
2596110a3994593 Christoph Hellwig   2007-10-21  487  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  488  		if (result->d_flags & DCACHE_DISCONNECTED) {
638205375afdc8a Thomas Bertschinger 2025-09-10  489  			err = -EAGAIN;
638205375afdc8a Thomas Bertschinger 2025-09-10  490  			if (decode_cached)
638205375afdc8a Thomas Bertschinger 2025-09-10  491  				goto err_result;
638205375afdc8a Thomas Bertschinger 2025-09-10  492  
f3f8e17571934ea Al Viro             2008-08-11  493  			err = reconnect_path(mnt, result, nbuf);
2596110a3994593 Christoph Hellwig   2007-10-21  494  			if (err)
2596110a3994593 Christoph Hellwig   2007-10-21  495  				goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  496  		}
2596110a3994593 Christoph Hellwig   2007-10-21  497  
2596110a3994593 Christoph Hellwig   2007-10-21  498  		if (!acceptable(context, result)) {
2596110a3994593 Christoph Hellwig   2007-10-21  499  			err = -EACCES;
2596110a3994593 Christoph Hellwig   2007-10-21  500  			goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  501  		}
2596110a3994593 Christoph Hellwig   2007-10-21  502  
2596110a3994593 Christoph Hellwig   2007-10-21  503  		return result;
2596110a3994593 Christoph Hellwig   2007-10-21  504  	} else {
2596110a3994593 Christoph Hellwig   2007-10-21  505  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  506  		 * It's not a directory.  Life is a little more complicated.
2596110a3994593 Christoph Hellwig   2007-10-21  507  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  508  		struct dentry *target_dir, *nresult;
2596110a3994593 Christoph Hellwig   2007-10-21  509  
2596110a3994593 Christoph Hellwig   2007-10-21  510  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  511  		 * See if either the dentry we just got from the filesystem
2596110a3994593 Christoph Hellwig   2007-10-21  512  		 * or any alias for it is acceptable.  This is always true
2596110a3994593 Christoph Hellwig   2007-10-21  513  		 * if this filesystem is exported without the subtreecheck
2596110a3994593 Christoph Hellwig   2007-10-21  514  		 * option.  If the filesystem is exported with the subtree
2596110a3994593 Christoph Hellwig   2007-10-21  515  		 * check option there's a fair chance we need to look at
2596110a3994593 Christoph Hellwig   2007-10-21  516  		 * the parent directory in the file handle and make sure
2596110a3994593 Christoph Hellwig   2007-10-21  517  		 * it's connected to the filesystem root.
2596110a3994593 Christoph Hellwig   2007-10-21  518  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  519  		alias = find_acceptable_alias(result, acceptable, context);
2596110a3994593 Christoph Hellwig   2007-10-21  520  		if (alias)
2596110a3994593 Christoph Hellwig   2007-10-21  521  			return alias;
2596110a3994593 Christoph Hellwig   2007-10-21  522  
2596110a3994593 Christoph Hellwig   2007-10-21  523  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  524  		 * Try to extract a dentry for the parent directory from the
2596110a3994593 Christoph Hellwig   2007-10-21  525  		 * file handle.  If this fails we'll have to give up.
2596110a3994593 Christoph Hellwig   2007-10-21  526  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  527  		err = -ESTALE;
2596110a3994593 Christoph Hellwig   2007-10-21  528  		if (!nop->fh_to_parent)
2596110a3994593 Christoph Hellwig   2007-10-21  529  			goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  530  
2596110a3994593 Christoph Hellwig   2007-10-21  531  		target_dir = nop->fh_to_parent(mnt->mnt_sb, fid,
2596110a3994593 Christoph Hellwig   2007-10-21  532  				fh_len, fileid_type);
a4f4d6df5373682 J. Bruce Fields     2008-12-08  533  		if (!target_dir)
a4f4d6df5373682 J. Bruce Fields     2008-12-08  534  			goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  535  		err = PTR_ERR(target_dir);
2596110a3994593 Christoph Hellwig   2007-10-21  536  		if (IS_ERR(target_dir))
2596110a3994593 Christoph Hellwig   2007-10-21  537  			goto err_result;
638205375afdc8a Thomas Bertschinger 2025-09-10  538  		err = -EAGAIN;
638205375afdc8a Thomas Bertschinger 2025-09-10 @539  		if (decode_cached & (target_dir->d_flags & DCACHE_DISCONNECTED)) {
638205375afdc8a Thomas Bertschinger 2025-09-10  540  			goto err_result;
638205375afdc8a Thomas Bertschinger 2025-09-10  541  		}
2596110a3994593 Christoph Hellwig   2007-10-21  542  
2596110a3994593 Christoph Hellwig   2007-10-21  543  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  544  		 * And as usual we need to make sure the parent directory is
2596110a3994593 Christoph Hellwig   2007-10-21  545  		 * connected to the filesystem root.  The VFS really doesn't
2596110a3994593 Christoph Hellwig   2007-10-21  546  		 * like disconnected directories..
2596110a3994593 Christoph Hellwig   2007-10-21  547  		 */
f3f8e17571934ea Al Viro             2008-08-11  548  		err = reconnect_path(mnt, target_dir, nbuf);
2596110a3994593 Christoph Hellwig   2007-10-21  549  		if (err) {
2596110a3994593 Christoph Hellwig   2007-10-21  550  			dput(target_dir);
2596110a3994593 Christoph Hellwig   2007-10-21  551  			goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  552  		}
2596110a3994593 Christoph Hellwig   2007-10-21  553  
2596110a3994593 Christoph Hellwig   2007-10-21  554  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  555  		 * Now that we've got both a well-connected parent and a
2596110a3994593 Christoph Hellwig   2007-10-21  556  		 * dentry for the inode we're after, make sure that our
2596110a3994593 Christoph Hellwig   2007-10-21  557  		 * inode is actually connected to the parent.
2596110a3994593 Christoph Hellwig   2007-10-21  558  		 */
e38f981758118d8 Christoph Hellwig   2007-10-21  559  		err = exportfs_get_name(mnt, target_dir, nbuf, result);
a2ece088882666e Al Viro             2019-11-08  560  		if (err) {
a2ece088882666e Al Viro             2019-11-08  561  			dput(target_dir);
a2ece088882666e Al Viro             2019-11-08  562  			goto err_result;
a2ece088882666e Al Viro             2019-11-08  563  		}
a2ece088882666e Al Viro             2019-11-08  564  
ce3490038971a20 NeilBrown           2025-06-09  565  		nresult = lookup_one_unlocked(mnt_idmap(mnt), &QSTR(nbuf), target_dir);
2596110a3994593 Christoph Hellwig   2007-10-21  566  		if (!IS_ERR(nresult)) {
a2ece088882666e Al Viro             2019-11-08  567  			if (unlikely(nresult->d_inode != result->d_inode)) {
2596110a3994593 Christoph Hellwig   2007-10-21  568  				dput(nresult);
a2ece088882666e Al Viro             2019-11-08  569  				nresult = ERR_PTR(-ESTALE);
2596110a3994593 Christoph Hellwig   2007-10-21  570  			}
2596110a3994593 Christoph Hellwig   2007-10-21  571  		}
2596110a3994593 Christoph Hellwig   2007-10-21  572  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  573  		 * At this point we are done with the parent, but it's pinned
2596110a3994593 Christoph Hellwig   2007-10-21  574  		 * by the child dentry anyway.
2596110a3994593 Christoph Hellwig   2007-10-21  575  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  576  		dput(target_dir);
2596110a3994593 Christoph Hellwig   2007-10-21  577  
a2ece088882666e Al Viro             2019-11-08  578  		if (IS_ERR(nresult)) {
a2ece088882666e Al Viro             2019-11-08  579  			err = PTR_ERR(nresult);
a2ece088882666e Al Viro             2019-11-08  580  			goto err_result;
a2ece088882666e Al Viro             2019-11-08  581  		}
a2ece088882666e Al Viro             2019-11-08  582  		dput(result);
a2ece088882666e Al Viro             2019-11-08  583  		result = nresult;
a2ece088882666e Al Viro             2019-11-08  584  
2596110a3994593 Christoph Hellwig   2007-10-21  585  		/*
2596110a3994593 Christoph Hellwig   2007-10-21  586  		 * And finally make sure the dentry is actually acceptable
2596110a3994593 Christoph Hellwig   2007-10-21  587  		 * to NFSD.
2596110a3994593 Christoph Hellwig   2007-10-21  588  		 */
2596110a3994593 Christoph Hellwig   2007-10-21  589  		alias = find_acceptable_alias(result, acceptable, context);
2596110a3994593 Christoph Hellwig   2007-10-21  590  		if (!alias) {
2596110a3994593 Christoph Hellwig   2007-10-21  591  			err = -EACCES;
2596110a3994593 Christoph Hellwig   2007-10-21  592  			goto err_result;
2596110a3994593 Christoph Hellwig   2007-10-21  593  		}
2596110a3994593 Christoph Hellwig   2007-10-21  594  
2596110a3994593 Christoph Hellwig   2007-10-21  595  		return alias;
2596110a3994593 Christoph Hellwig   2007-10-21  596  	}
2596110a3994593 Christoph Hellwig   2007-10-21  597  
2596110a3994593 Christoph Hellwig   2007-10-21  598   err_result:
2596110a3994593 Christoph Hellwig   2007-10-21  599  	dput(result);
2596110a3994593 Christoph Hellwig   2007-10-21  600  	return ERR_PTR(err);
10f11c341da8c0e Christoph Hellwig   2007-07-17  601  }
d045465fc6cbfa4 Trond Myklebust     2020-11-30  602  EXPORT_SYMBOL_GPL(exportfs_decode_fh_raw);
d045465fc6cbfa4 Trond Myklebust     2020-11-30  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
