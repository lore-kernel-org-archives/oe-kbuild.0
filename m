Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C942070
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735300062; cv=none; b=nu6EDjzlV0/PNbnJKL0zQjFUPFALJ439MZ1YcYYOZGJ/gsk1Mn4yVUOxInqbRiLmFGFML0K8Ylwc7FJsatuwpZcnwDabY5GNvHaiJct4aLXIa6kaabgu/q/zuIISPZVMi2zzeKS3wQZMt6wGR1VVqJzcpJTf6RGVAXCGTW+QQiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735300062; c=relaxed/simple;
	bh=SEVmTyCjU4B1elbdMrmLEDOOBK3Ubtv0QH8/gAvYAWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNU7BbM0Z+98wrKyQPgdxfVWyL4ACe/cQw+vlpVaZdZMwhnIcjRWQ+5hQRm7cfxANP2Ww28vRlvp9CA1atPFSt97P1ktBaFJpRHFc7IqBkxyPBnRgcRTVZwlk09ySq9p//4MkoSRPJef5Sogbn3SyWbcCNAFjhuS6/5FAwLW9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDrBv/3p; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDrBv/3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735300060; x=1766836060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEVmTyCjU4B1elbdMrmLEDOOBK3Ubtv0QH8/gAvYAWs=;
  b=hDrBv/3p345g7aDHdpo7XvvqCAKjSdRb25+y4z5FB78878VGpoPbhrOW
   iNibVsMPu9NLlx4BVK45TVCfV/I9dWX6niu/whiUqP5pdHoaqJS89Y7Ki
   J1SHyCEm76Fw/nb7gVICzuvkfJ1XHmdzAGMS8kanZh4RfF7Xjf3tea/GV
   AX6iPwKCDE9YH3yYEggx/8+VP/Lf5IQCBNLmEyK0PUzVgiNfQQaINoBdi
   BTljL6izoR5/97M0Ii9jrC/6INrcFGKZ0GoIe+5A3Xd4DsGBfrEfB+6B0
   eDLFouWl7l5T4IR1ZOhYF5PfgBBM2Of9UolhkRFAY0Z0mtqHA8jkqj0R2
   w==;
X-CSE-ConnectionGUID: DEqJxLAMS+uNzRx2MkXj9g==
X-CSE-MsgGUID: hnEjhkOhQLWWoZh8+Efpgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53103594"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="53103594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 03:47:39 -0800
X-CSE-ConnectionGUID: xplv48QNS5GVlhwQJJgG0w==
X-CSE-MsgGUID: vYFnj5hCTbWEhZSYBbzP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="130984159"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 03:47:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR8oa-0003AM-0Q;
	Fri, 27 Dec 2024 11:47:36 +0000
Date: Fri, 27 Dec 2024 19:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations
 when profiling is disabled
Message-ID: <202412271903.leG6fSFl-lkp@intel.com>
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
In-Reply-To: <20241226211639.1357704-1-surenb@google.com>
References: <20241226211639.1357704-1-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 431614f1580a03c1a653340c55ea76bd12a9403f]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-skip-pgalloc_tag_swap-if-profiling-is-disabled/20241227-051744
base:   431614f1580a03c1a653340c55ea76bd12a9403f
patch link:    https://lore.kernel.org/r/20241226211639.1357704-1-surenb%40google.com
patch subject: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arc-randconfig-r073-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271903.leG6fSFl-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412271903.leG6fSFl-lkp@intel.com/

New smatch warnings:
fs/overlayfs/namei.c:658 ovl_verify_index() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
fs/overlayfs/namei.c:44 ovl_check_redirect() warn: passing zero to 'PTR_ERR'
fs/overlayfs/namei.c:479 ovl_check_origin() warn: passing zero to 'PTR_ERR'
fs/overlayfs/namei.c:581 ovl_index_upper() warn: passing zero to 'ERR_CAST'

vim +/PTR_ERR +658 fs/overlayfs/namei.c

e8f9e5b780b040 Amir Goldstein   2018-01-11  598  
415543d5c64fe4 Amir Goldstein   2017-06-21  599  /*
415543d5c64fe4 Amir Goldstein   2017-06-21  600   * Verify that an index entry name matches the origin file handle stored in
415543d5c64fe4 Amir Goldstein   2017-06-21  601   * OVL_XATTR_ORIGIN and that origin file handle can be decoded to lower path.
415543d5c64fe4 Amir Goldstein   2017-06-21  602   * Return 0 on match, -ESTALE on mismatch or stale origin, < 0 on error.
415543d5c64fe4 Amir Goldstein   2017-06-21  603   */
1eff1a1deec727 Amir Goldstein   2017-12-12  604  int ovl_verify_index(struct ovl_fs *ofs, struct dentry *index)
415543d5c64fe4 Amir Goldstein   2017-06-21  605  {
415543d5c64fe4 Amir Goldstein   2017-06-21  606  	struct ovl_fh *fh = NULL;
415543d5c64fe4 Amir Goldstein   2017-06-21  607  	size_t len;
b93436320c1e90 Chandan Rajendra 2017-07-24  608  	struct ovl_path origin = { };
b93436320c1e90 Chandan Rajendra 2017-07-24  609  	struct ovl_path *stack = &origin;
e8f9e5b780b040 Amir Goldstein   2018-01-11  610  	struct dentry *upper = NULL;
415543d5c64fe4 Amir Goldstein   2017-06-21  611  	int err;
415543d5c64fe4 Amir Goldstein   2017-06-21  612  
415543d5c64fe4 Amir Goldstein   2017-06-21  613  	if (!d_inode(index))
415543d5c64fe4 Amir Goldstein   2017-06-21  614  		return 0;
415543d5c64fe4 Amir Goldstein   2017-06-21  615  
fa0096e3bad69e Amir Goldstein   2017-10-24  616  	err = -EINVAL;
cbe7fba8edfc8c Amir Goldstein   2019-11-15  617  	if (index->d_name.len < sizeof(struct ovl_fb)*2)
415543d5c64fe4 Amir Goldstein   2017-06-21  618  		goto fail;
415543d5c64fe4 Amir Goldstein   2017-06-21  619  
415543d5c64fe4 Amir Goldstein   2017-06-21  620  	err = -ENOMEM;
415543d5c64fe4 Amir Goldstein   2017-06-21  621  	len = index->d_name.len / 2;
cbe7fba8edfc8c Amir Goldstein   2019-11-15  622  	fh = kzalloc(len + OVL_FH_WIRE_OFFSET, GFP_KERNEL);
415543d5c64fe4 Amir Goldstein   2017-06-21  623  	if (!fh)
415543d5c64fe4 Amir Goldstein   2017-06-21  624  		goto fail;
415543d5c64fe4 Amir Goldstein   2017-06-21  625  
415543d5c64fe4 Amir Goldstein   2017-06-21  626  	err = -EINVAL;
cbe7fba8edfc8c Amir Goldstein   2019-11-15  627  	if (hex2bin(fh->buf, index->d_name.name, len))
2e1a532883cf77 Amir Goldstein   2017-10-24  628  		goto fail;
2e1a532883cf77 Amir Goldstein   2017-10-24  629  
cbe7fba8edfc8c Amir Goldstein   2019-11-15  630  	err = ovl_check_fb_len(&fh->fb, len);
2e1a532883cf77 Amir Goldstein   2017-10-24  631  	if (err)
415543d5c64fe4 Amir Goldstein   2017-06-21  632  		goto fail;
415543d5c64fe4 Amir Goldstein   2017-06-21  633  
7db25d36d9253c Amir Goldstein   2018-01-11  634  	/*
7db25d36d9253c Amir Goldstein   2018-01-11  635  	 * Whiteout index entries are used as an indication that an exported
7db25d36d9253c Amir Goldstein   2018-01-11  636  	 * overlay file handle should be treated as stale (i.e. after unlink
7db25d36d9253c Amir Goldstein   2018-01-11  637  	 * of the overlay inode). These entries contain no origin xattr.
7db25d36d9253c Amir Goldstein   2018-01-11  638  	 */
7db25d36d9253c Amir Goldstein   2018-01-11  639  	if (ovl_is_whiteout(index))
7db25d36d9253c Amir Goldstein   2018-01-11  640  		goto out;
7db25d36d9253c Amir Goldstein   2018-01-11  641  
e8f9e5b780b040 Amir Goldstein   2018-01-11  642  	/*
e8f9e5b780b040 Amir Goldstein   2018-01-11  643  	 * Verifying directory index entries are not stale is expensive, so
e8f9e5b780b040 Amir Goldstein   2018-01-11  644  	 * only verify stale dir index if NFS export is enabled.
e8f9e5b780b040 Amir Goldstein   2018-01-11  645  	 */
e8f9e5b780b040 Amir Goldstein   2018-01-11  646  	if (d_is_dir(index) && !ofs->config.nfs_export)
e8f9e5b780b040 Amir Goldstein   2018-01-11  647  		goto out;
e8f9e5b780b040 Amir Goldstein   2018-01-11  648  
e8f9e5b780b040 Amir Goldstein   2018-01-11  649  	/*
e8f9e5b780b040 Amir Goldstein   2018-01-11  650  	 * Directory index entries should have 'upper' xattr pointing to the
e8f9e5b780b040 Amir Goldstein   2018-01-11  651  	 * real upper dir. Non-dir index entries are hardlinks to the upper
e8f9e5b780b040 Amir Goldstein   2018-01-11  652  	 * real inode. For non-dir index, we can read the copy up origin xattr
e8f9e5b780b040 Amir Goldstein   2018-01-11  653  	 * directly from the index dentry, but for dir index we first need to
e8f9e5b780b040 Amir Goldstein   2018-01-11  654  	 * decode the upper directory.
e8f9e5b780b040 Amir Goldstein   2018-01-11  655  	 */
8ea2876577b578 Amir Goldstein   2022-10-04  656  	upper = ovl_index_upper(ofs, index, false);
e8f9e5b780b040 Amir Goldstein   2018-01-11  657  	if (IS_ERR_OR_NULL(upper)) {
e8f9e5b780b040 Amir Goldstein   2018-01-11 @658  		err = PTR_ERR(upper);
24f0b17203691d Amir Goldstein   2018-01-11  659  		/*
24f0b17203691d Amir Goldstein   2018-01-11  660  		 * Directory index entries with no 'upper' xattr need to be
24f0b17203691d Amir Goldstein   2018-01-11  661  		 * removed. When dir index entry has a stale 'upper' xattr,
24f0b17203691d Amir Goldstein   2018-01-11  662  		 * we assume that upper dir was removed and we treat the dir
24f0b17203691d Amir Goldstein   2018-01-11  663  		 * index as orphan entry that needs to be whited out.
24f0b17203691d Amir Goldstein   2018-01-11  664  		 */
24f0b17203691d Amir Goldstein   2018-01-11  665  		if (err == -ESTALE)
24f0b17203691d Amir Goldstein   2018-01-11  666  			goto orphan;
24f0b17203691d Amir Goldstein   2018-01-11  667  		else if (!err)
e8f9e5b780b040 Amir Goldstein   2018-01-11  668  			err = -ESTALE;
e8f9e5b780b040 Amir Goldstein   2018-01-11  669  		goto fail;
e8f9e5b780b040 Amir Goldstein   2018-01-11  670  	}
e8f9e5b780b040 Amir Goldstein   2018-01-11  671  
610afc0bd40882 Miklos Szeredi   2020-09-02  672  	err = ovl_verify_fh(ofs, upper, OVL_XATTR_ORIGIN, fh);
e8f9e5b780b040 Amir Goldstein   2018-01-11  673  	dput(upper);
415543d5c64fe4 Amir Goldstein   2017-06-21  674  	if (err)
415543d5c64fe4 Amir Goldstein   2017-06-21  675  		goto fail;
415543d5c64fe4 Amir Goldstein   2017-06-21  676  
e8f9e5b780b040 Amir Goldstein   2018-01-11  677  	/* Check if non-dir index is orphan and don't warn before cleaning it */
e8f9e5b780b040 Amir Goldstein   2018-01-11  678  	if (!d_is_dir(index) && d_inode(index)->i_nlink == 1) {
8a22efa15b46d5 Amir Goldstein   2018-03-09  679  		err = ovl_check_origin_fh(ofs, fh, false, index, &stack);
415543d5c64fe4 Amir Goldstein   2017-06-21  680  		if (err)
415543d5c64fe4 Amir Goldstein   2017-06-21  681  			goto fail;
415543d5c64fe4 Amir Goldstein   2017-06-21  682  
610afc0bd40882 Miklos Szeredi   2020-09-02  683  		if (ovl_get_nlink(ofs, origin.dentry, index, 0) == 0)
24f0b17203691d Amir Goldstein   2018-01-11  684  			goto orphan;
e8f9e5b780b040 Amir Goldstein   2018-01-11  685  	}
caf70cb2ba5dff Amir Goldstein   2017-06-21  686  
415543d5c64fe4 Amir Goldstein   2017-06-21  687  out:
e8f9e5b780b040 Amir Goldstein   2018-01-11  688  	dput(origin.dentry);
415543d5c64fe4 Amir Goldstein   2017-06-21  689  	kfree(fh);
415543d5c64fe4 Amir Goldstein   2017-06-21  690  	return err;
415543d5c64fe4 Amir Goldstein   2017-06-21  691  
415543d5c64fe4 Amir Goldstein   2017-06-21  692  fail:
1bd0a3aea4357e lijiazi          2019-12-16  693  	pr_warn_ratelimited("failed to verify index (%pd2, ftype=%x, err=%i)\n",
61b674710cd9af Amir Goldstein   2017-07-18  694  			    index, d_inode(index)->i_mode & S_IFMT, err);
415543d5c64fe4 Amir Goldstein   2017-06-21  695  	goto out;
24f0b17203691d Amir Goldstein   2018-01-11  696  
24f0b17203691d Amir Goldstein   2018-01-11  697  orphan:
1bd0a3aea4357e lijiazi          2019-12-16  698  	pr_warn_ratelimited("orphan index entry (%pd2, ftype=%x, nlink=%u)\n",
24f0b17203691d Amir Goldstein   2018-01-11  699  			    index, d_inode(index)->i_mode & S_IFMT,
24f0b17203691d Amir Goldstein   2018-01-11  700  			    d_inode(index)->i_nlink);
24f0b17203691d Amir Goldstein   2018-01-11  701  	err = -ENOENT;
24f0b17203691d Amir Goldstein   2018-01-11  702  	goto out;
415543d5c64fe4 Amir Goldstein   2017-06-21  703  }
415543d5c64fe4 Amir Goldstein   2017-06-21  704  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
