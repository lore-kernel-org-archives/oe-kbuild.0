Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9E2DC780
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665311; cv=none; b=Gmht6jODIpBLPgS7TFx3xcOiHwCMgHIkcMoKOk2FtRLPODNzjHT7tHxUeiV937Tb72bNMTXG8ZGVNHwRacdxSXWxMW0Pn0pqO5SpU0BDAiLKAHBGUiCNhgTDYPERqsRq1FgL/8dsZBCb1kVJBR2drBozlTtjzbmLewTcTQN+bNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665311; c=relaxed/simple;
	bh=qZUNdYRrarMZrx/I2jScYFyIRFcUWFIjiLtabn+O6tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uQfKPD7t2TpWc980TJFVL0/MkjWfj4XXc18Z9Yv/vnh+xS1LCnr64s0wluYozHrfj/XoIzkwLLudV7fgLIqgObe5hpiS0dXAEHRlwFGqkd4C8wAYoHttLxpkNIXYFF9NEIsQW2AbxtQn11yigJf/S4MZwx8fJuxKgc+AncZKAb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lhUP9OBa; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lhUP9OBa"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so19081205e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757665308; x=1758270108; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W60sZMoMdyLE26ZTuIL3nBsOV3BIJdUY+5uCUKpKW8g=;
        b=lhUP9OBaxvTf8/iC25ITgvx/afzNhcSF25A4oJGu8bx0lHAGw1vIU3UIErOM6euCe1
         Cf8E1hnuptHY/lW9RxCriahqCqrRZcH1btC+AzvumfAPGSRpz4CeKd4g7nFJM3RgVevX
         gtGON9uDvc2aVOE6yxy9Z/xoWRn1x/iD2eQEYBl6uxxlPMjxC2LTLlx52U3ixVZrN5ZH
         3gxV/Pyi7Y6rGGhAwXZlXzs7pKK4nI/B/yJ53RNL92CeZ1AFA5RbDCpokQ8BXstEoLdm
         sMbyySTZLkMJswA0NPu/dMG6JZYw1ioSqKoLn7YSQJE1xserPLPhR57/5hEYuogohVsF
         oTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665308; x=1758270108;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W60sZMoMdyLE26ZTuIL3nBsOV3BIJdUY+5uCUKpKW8g=;
        b=lu+GF6g5Zd73O87QTxLTXAiTkK0CNIRzzRmgy9PQCeAVZaWVrSkpwk7hPFS/qzc/jq
         E2rIi6DmeCJ8zQLL/u0HylnAqPmDGuvJpyG9CjIvfcTWx0JJqihb3Di1XYMG0ug+gzdv
         uwzlQt+70677Rqz4atdOqxAPpu30mz/ky13sQTyn3O9YqufR+r5QjZhHkpyBWKsNVjP0
         3digOR2kcVycQG8t13f3OTk62/10yY8784U45ZXZTXnuYa1l5/hBes0Fh7322qHHORwl
         zdts5yA/e6eIrIsqFvIkcUQF8pxYWH3DavhgUI1qpORgf9HaJsKh28ENAd2wK9U0RTJX
         USRg==
X-Gm-Message-State: AOJu0YwgYJkRmGXnFgIO2nfBkH+NPpG+uta6FQCrKTwASv8TFOnqE9FS
	OqzM6qoksZrFIA4UEp4A6/4z3aIYjpy/89hdptnmG8F48R6qT63ts8JiPJ0mpR9b7xW9+35PWAz
	8H4ol
X-Gm-Gg: ASbGncukZ26olaLpPJwk+8LQZJJ0GwYIpSQf86/i+E2ufYW+nq5+DnRFRnSkS8MfPnQ
	TeoKflJY2wUbAQal0NjvyQ8Wb5taZgH+8RUgUiLMhgFGFopdDtZL/RIz7j+4Z2rScaGKnoGHa2X
	Zk+Jeaf/BiUDQ2MPkNhUfeC+g7FgQK0TfeAv4898JsibI+yApUsCuSOifJ+fEEgttP9Hk4vJAi9
	vRKJY+K/v3s8yMmgcGskO5T1fRRQnqAoI3IpHRaZpEgRF8i91/nVCc3yWtzoTVew3bCEUVIYaNr
	vSCFTulBG2LaPWuvMvwmxstBsIyLLKVshvxy65iu+55HKO52cDzQ20kmCxG3x5Ljs9v6rWE4ceV
	cgK0qUgGe9SU3vsrR5LgzZAXGwcpuAEfm7X0h4g==
X-Google-Smtp-Source: AGHT+IFTVzbYTElrhk+3fv8FZJj0pkcZ0zRcQ2nWpXCv1OCHxc8/2XmvcN8Ey7vGOZneILg1INJRRw==
X-Received: by 2002:a7b:c006:0:b0:45a:236a:23ba with SMTP id 5b1f17b1804b1-45f211f6b92mr13416655e9.22.1757665307562;
        Fri, 12 Sep 2025 01:21:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e016b5cbcsm56441345e9.11.2025.09.12.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:21:47 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:21:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Thomas Bertschinger <tahbertschinger@gmail.com>,
	io-uring@vger.kernel.org, axboe@kernel.dk,
	linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk,
	brauner@kernel.org, linux-nfs@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Thomas Bertschinger <tahbertschinger@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>, chuck.lever@oracle.com,
	jlayton@kernel.org
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
In-Reply-To: <20250910214927.480316-8-tahbertschinger@gmail.com>
Message-ID: <20250912082144.pOhc7_dcqh-HMUpuZ-Xf1JYo-eLavx8wR7XYyoWs1T8@z>

Hi Thomas,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Bertschinger/fhandle-create-helper-for-name_to_handle_at-2/20250911-054830
base:   76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
patch link:    https://lore.kernel.org/r/20250910214927.480316-8-tahbertschinger%40gmail.com
patch subject: [PATCH 07/10] exportfs: new FILEID_CACHED flag for non-blocking fh lookup
config: arm-randconfig-r071-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120423.cZlR8oLY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509120423.cZlR8oLY-lkp@intel.com/

smatch warnings:
fs/exportfs/expfs.c:539 exportfs_decode_fh_raw() warn: maybe use && instead of &

vim +539 fs/exportfs/expfs.c

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

It needs to be &&.  DCACHE_DISCONNECTED is BIT(5).

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

