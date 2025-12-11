Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08182D7393
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431893; cv=none; b=rCAuVBMzJ3z1W6z2K8hQYLS47yKCOflPdyf1nCBtaAW3k2wN0UC2a/ifHtiiLyxnNrEVcIz2sVo+EYSAiKJL8EGixdK4gpQLCUh/GRI/BJerAGgVk8TCVOjpcG2MJX4CaBDx4bXajEafI/iaq6JdPmU2bW6Sin9WTy14Q1YF7kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431893; c=relaxed/simple;
	bh=T1YAyf3q6Dx37F7X6+jwTyU2VB5zQcBGw8LmQqXviN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pss4hYFL1CVRCvY1KgtfDTRN8EsBLv7uVk7joQKRX+7FPRsYZalcoSDKPYypfe63sJSe5frcKt3M224CO3Icr0KUE1sXRfSerLZuWVJttP6trZ5792e5Lwvs41dSgykGC4n2VablzF7lR3P4ozodIdn3KglAM29M9htqNSg6cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aifTwTWO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aifTwTWO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324054so99200566b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 10 Dec 2025 21:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765431889; x=1766036689; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbiWRCHVIzYRuQelpFvBR6flqP287FKxUrkvV482ow0=;
        b=aifTwTWObK7BGGIDrYO5T2hv13v86HzWKrxiteZPxeJ+FZt5w2g5wDeFKJMo0yqp3y
         uV6h19bilOnB8RRn57AHSiRQabiG4fqlUm/2hxB5XbOrF2AxeVNFRvNCxS5tRx7Emjm/
         6T5fZReaicrO6e9l5FgTnA6EcLvtCN9PXAKaIluudJSjsh5fujO3ruCdHOIu0f3zIbP4
         vc1O4nmcwmH0Rd3nwMy9BT6AmgLv5US3NAm9BfmTh06TQI+vj3GhMCQ6Ozd3XzaJRmgx
         VRsjl7/PoENd9+5eFbnGzC3EMEmnj+2EONazg9pftDwqPYw4Dr15b8A1oFCKNWQQ+wqt
         bcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765431889; x=1766036689;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbiWRCHVIzYRuQelpFvBR6flqP287FKxUrkvV482ow0=;
        b=DKfjzsdVt5jZpibzyulj2qWhOMRkQgxieRjhc4g/REFs4E5bpDpSK7F02lziJqQQql
         3yP7kqMrlPRHgPyVS+j3Pm5Yy/azvjuwB9ZBU+hV/0SPak1DOFA4EJyYkhrDH0oxiKY9
         r+I5eFCyNfbHtmc9+1/IF8hVejQi1fAgz2WJ644qAqsX2cFNYCyDE32G8J08pVt2jNxq
         /S1c+apvRhBTFAukMmY6wPf6UaLCiVGPQ0ENvEHObblH9Aq+/eyUj6uwZ5PoqXa+2/R8
         5XQvjPAQIXRSxYhsRjfdMsP9JUnSeTGtpT4G8EG1YafCzocOXYxurcNLx1iV4c85QLsJ
         YOqg==
X-Gm-Message-State: AOJu0Yw8oOKFW8+DXH7tSODSz09TPf+liT+AFLbnWUez982ppPjKasIN
	qpZpVmEZqGKMft62vqxqv5tr+pCMwanTHwIxIVeBFGbX/+yT71lRdi3SmTKNM9/c8eSDmLkMutQ
	LNRQK
X-Gm-Gg: ASbGnct1ILx3dNZx6kQNgadwgtLpSpeA9fmsFb32hRCZzn7s1gU2zp3WeYW8LRJNrXG
	zwSu/Eo9sIb4PjhuKA2w5h5DtNh0Z70NKgvjPWycHwEBgdlcmFc7VEXvoBD9oyFZE1Xq3dzwyn8
	dF8VKQUF7hgs8DkPPSZ002CkqdGbLH2VS7vy+VU4ZSqXZpaCiQQ61YZ5LYl8xRwRr9gaalctQm8
	7Ix62Sdv5/lGiP2+QTWrA19hUIrFMwgofAj0gVfdSX6ToWqaZ3lknZZ3ruAytdEoDncQ2IG7e3w
	SONvtjmOG3OA3PK6ip8Shjz6sl6M4uXQGP5cvzK7MbkAEMUqCmhde6Jmsj+vknaYSkY5QCYmzGW
	tOhM5kj45Cxcwpv9Z/2gCWlR6bHbS+5C6mvu+Inf8UwdC33hUBRqsMpjpMeZG4iqV5Y3ZZEPM/T
	K6Gog8dKEtk/z7hJDr
X-Google-Smtp-Source: AGHT+IF0W59LbVgha1axiFIYG/pu4AYK7MDs1Rg2dc2Txd/cBnBZH+JL5oWM4he2YT/TRj2p+xd8kw==
X-Received: by 2002:a17:907:3e1b:b0:b72:6143:60c2 with SMTP id a640c23a62f3a-b7ce8427b68mr508208966b.51.1765431888660;
        Wed, 10 Dec 2025 21:44:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64982040c32sm1425232a12.4.2025.12.10.21.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:44:48 -0800 (PST)
Date: Thu, 11 Dec 2025 08:44:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marc Dionne <marc.dionne@auristor.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing
 zero to 'ERR_PTR'
Message-ID: <202512111002.nWtkWQkS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251211054444.j5J-nkVN6OHG3J2uYDVCzshtn4oQdXSUD0x4uOFn3Ok@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c8081cc599fcafa25371d50959c17e154f9fd08
commit: 406fad7698f5bf21ab6b5ca195bf4b9e0b3990ed cachefiles: Fix oops in vfs_mkdir from cachefiles_get_directory
config: sparc64-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111002.nWtkWQkS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512111002.nWtkWQkS-lkp@intel.com/

smatch warnings:
fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +203 fs/cachefiles/namei.c

32759f7d7af545 David Howells  2021-10-21   84  struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
32759f7d7af545 David Howells  2021-10-21   85  					struct dentry *dir,
32759f7d7af545 David Howells  2021-10-21   86  					const char *dirname,
32759f7d7af545 David Howells  2021-10-21   87  					bool *_is_new)
32759f7d7af545 David Howells  2021-10-21   88  {
32759f7d7af545 David Howells  2021-10-21   89  	struct dentry *subdir;
32759f7d7af545 David Howells  2021-10-21   90  	struct path path;
32759f7d7af545 David Howells  2021-10-21   91  	int ret;
32759f7d7af545 David Howells  2021-10-21   92  
32759f7d7af545 David Howells  2021-10-21   93  	_enter(",,%s", dirname);
32759f7d7af545 David Howells  2021-10-21   94  
32759f7d7af545 David Howells  2021-10-21   95  	/* search the current directory for the element name */
32759f7d7af545 David Howells  2021-10-21   96  	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
32759f7d7af545 David Howells  2021-10-21   97  
32759f7d7af545 David Howells  2021-10-21   98  retry:
32759f7d7af545 David Howells  2021-10-21   99  	ret = cachefiles_inject_read_error();
32759f7d7af545 David Howells  2021-10-21  100  	if (ret == 0)
32759f7d7af545 David Howells  2021-10-21  101  		subdir = lookup_one_len(dirname, dir, strlen(dirname));
32759f7d7af545 David Howells  2021-10-21  102  	else
32759f7d7af545 David Howells  2021-10-21  103  		subdir = ERR_PTR(ret);
8c39b8bc82aafc David Howells  2022-01-14  104  	trace_cachefiles_lookup(NULL, dir, subdir);
32759f7d7af545 David Howells  2021-10-21  105  	if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  106  		trace_cachefiles_vfs_error(NULL, d_backing_inode(dir),
32759f7d7af545 David Howells  2021-10-21  107  					   PTR_ERR(subdir),
32759f7d7af545 David Howells  2021-10-21  108  					   cachefiles_trace_lookup_error);
32759f7d7af545 David Howells  2021-10-21  109  		if (PTR_ERR(subdir) == -ENOMEM)
32759f7d7af545 David Howells  2021-10-21  110  			goto nomem_d_alloc;
32759f7d7af545 David Howells  2021-10-21  111  		goto lookup_error;
32759f7d7af545 David Howells  2021-10-21  112  	}
32759f7d7af545 David Howells  2021-10-21  113  
32759f7d7af545 David Howells  2021-10-21  114  	_debug("subdir -> %pd %s",
32759f7d7af545 David Howells  2021-10-21  115  	       subdir, d_backing_inode(subdir) ? "positive" : "negative");
32759f7d7af545 David Howells  2021-10-21  116  
32759f7d7af545 David Howells  2021-10-21  117  	/* we need to create the subdir if it doesn't exist yet */
32759f7d7af545 David Howells  2021-10-21  118  	if (d_is_negative(subdir)) {
3929eca769b5a2 David Howells  2021-10-21  119  		ret = cachefiles_has_space(cache, 1, 0,
3929eca769b5a2 David Howells  2021-10-21  120  					   cachefiles_has_space_for_create);
32759f7d7af545 David Howells  2021-10-21  121  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  122  			goto mkdir_error;
32759f7d7af545 David Howells  2021-10-21  123  
32759f7d7af545 David Howells  2021-10-21  124  		_debug("attempt mkdir");
32759f7d7af545 David Howells  2021-10-21  125  
32759f7d7af545 David Howells  2021-10-21  126  		path.mnt = cache->mnt;
32759f7d7af545 David Howells  2021-10-21  127  		path.dentry = dir;
32759f7d7af545 David Howells  2021-10-21  128  		ret = security_path_mkdir(&path, subdir, 0700);
32759f7d7af545 David Howells  2021-10-21  129  		if (ret < 0)
32759f7d7af545 David Howells  2021-10-21  130  			goto mkdir_error;
406fad7698f5bf Marc Dionne    2025-03-25  131  		ret = cachefiles_inject_write_error();
406fad7698f5bf Marc Dionne    2025-03-25  132  		if (ret == 0)
c54b386969a581 NeilBrown      2025-02-27  133  			subdir = vfs_mkdir(&nop_mnt_idmap, d_inode(dir), subdir, 0700);

If this vfs_mkdir() fails then we don't set ret.

406fad7698f5bf Marc Dionne    2025-03-25  134  		else
406fad7698f5bf Marc Dionne    2025-03-25  135  			subdir = ERR_PTR(ret);
c54b386969a581 NeilBrown      2025-02-27  136  		if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  137  			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
32759f7d7af545 David Howells  2021-10-21  138  						   cachefiles_trace_mkdir_error);
32759f7d7af545 David Howells  2021-10-21  139  			goto mkdir_error;
32759f7d7af545 David Howells  2021-10-21  140  		}
8c39b8bc82aafc David Howells  2022-01-14  141  		trace_cachefiles_mkdir(dir, subdir);
32759f7d7af545 David Howells  2021-10-21  142  
c54b386969a581 NeilBrown      2025-02-27  143  		if (unlikely(d_unhashed(subdir) || d_is_negative(subdir))) {
c54b386969a581 NeilBrown      2025-02-27  144  			dput(subdir);
32759f7d7af545 David Howells  2021-10-21  145  			goto retry;
32759f7d7af545 David Howells  2021-10-21  146  		}
32759f7d7af545 David Howells  2021-10-21  147  		ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  148  
32759f7d7af545 David Howells  2021-10-21  149  		_debug("mkdir -> %pd{ino=%lu}",
32759f7d7af545 David Howells  2021-10-21  150  		       subdir, d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  151  		if (_is_new)
32759f7d7af545 David Howells  2021-10-21  152  			*_is_new = true;
32759f7d7af545 David Howells  2021-10-21  153  	}
32759f7d7af545 David Howells  2021-10-21  154  
32759f7d7af545 David Howells  2021-10-21  155  	/* Tell rmdir() it's not allowed to delete the subdir */
32759f7d7af545 David Howells  2021-10-21  156  	inode_lock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  157  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  158  
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  159  	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  160  		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  161  			  subdir, d_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  162  		goto mark_error;
08d7a6fb7e44ae Miklos Szeredi 2022-09-24  163  	}
32759f7d7af545 David Howells  2021-10-21  164  
32759f7d7af545 David Howells  2021-10-21  165  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  166  
32759f7d7af545 David Howells  2021-10-21  167  	/* we need to make sure the subdir is a directory */
32759f7d7af545 David Howells  2021-10-21  168  	ASSERT(d_backing_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  169  
32759f7d7af545 David Howells  2021-10-21  170  	if (!d_can_lookup(subdir)) {
32759f7d7af545 David Howells  2021-10-21  171  		pr_err("%s is not a directory\n", dirname);
32759f7d7af545 David Howells  2021-10-21  172  		ret = -EIO;
32759f7d7af545 David Howells  2021-10-21  173  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  174  	}
32759f7d7af545 David Howells  2021-10-21  175  
32759f7d7af545 David Howells  2021-10-21  176  	ret = -EPERM;
32759f7d7af545 David Howells  2021-10-21  177  	if (!(d_backing_inode(subdir)->i_opflags & IOP_XATTR) ||
32759f7d7af545 David Howells  2021-10-21  178  	    !d_backing_inode(subdir)->i_op->lookup ||
32759f7d7af545 David Howells  2021-10-21  179  	    !d_backing_inode(subdir)->i_op->mkdir ||
32759f7d7af545 David Howells  2021-10-21  180  	    !d_backing_inode(subdir)->i_op->rename ||
32759f7d7af545 David Howells  2021-10-21  181  	    !d_backing_inode(subdir)->i_op->rmdir ||
32759f7d7af545 David Howells  2021-10-21  182  	    !d_backing_inode(subdir)->i_op->unlink)
32759f7d7af545 David Howells  2021-10-21  183  		goto check_error;
32759f7d7af545 David Howells  2021-10-21  184  
32759f7d7af545 David Howells  2021-10-21  185  	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
32759f7d7af545 David Howells  2021-10-21  186  	return subdir;
32759f7d7af545 David Howells  2021-10-21  187  
32759f7d7af545 David Howells  2021-10-21  188  check_error:
32759f7d7af545 David Howells  2021-10-21  189  	cachefiles_put_directory(subdir);
32759f7d7af545 David Howells  2021-10-21  190  	_leave(" = %d [check]", ret);
32759f7d7af545 David Howells  2021-10-21  191  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  192  
32759f7d7af545 David Howells  2021-10-21  193  mark_error:
32759f7d7af545 David Howells  2021-10-21  194  	inode_unlock(d_inode(subdir));
32759f7d7af545 David Howells  2021-10-21  195  	dput(subdir);
32759f7d7af545 David Howells  2021-10-21  196  	return ERR_PTR(-EBUSY);
32759f7d7af545 David Howells  2021-10-21  197  
32759f7d7af545 David Howells  2021-10-21  198  mkdir_error:
32759f7d7af545 David Howells  2021-10-21  199  	inode_unlock(d_inode(dir));
c54b386969a581 NeilBrown      2025-02-27  200  	if (!IS_ERR(subdir))
32759f7d7af545 David Howells  2021-10-21  201  		dput(subdir);
32759f7d7af545 David Howells  2021-10-21  202  	pr_err("mkdir %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21 @203  	return ERR_PTR(ret);
                                                       ^^^^^^^^^^^^
And we return NULL here.  I looked at the callers and couldn't
see if it was a bug, but I'm guessing it is because the label has
"_error" in the name.

32759f7d7af545 David Howells  2021-10-21  204  
32759f7d7af545 David Howells  2021-10-21  205  lookup_error:
32759f7d7af545 David Howells  2021-10-21  206  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  207  	ret = PTR_ERR(subdir);
32759f7d7af545 David Howells  2021-10-21  208  	pr_err("Lookup %s failed with error %d\n", dirname, ret);
32759f7d7af545 David Howells  2021-10-21  209  	return ERR_PTR(ret);
32759f7d7af545 David Howells  2021-10-21  210  
32759f7d7af545 David Howells  2021-10-21  211  nomem_d_alloc:
32759f7d7af545 David Howells  2021-10-21  212  	inode_unlock(d_inode(dir));
32759f7d7af545 David Howells  2021-10-21  213  	_leave(" = -ENOMEM");
32759f7d7af545 David Howells  2021-10-21  214  	return ERR_PTR(-ENOMEM);
32759f7d7af545 David Howells  2021-10-21  215  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

