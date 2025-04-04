Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA091DA53
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 13:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772032; cv=none; b=QJvBtMeqnvqprO4324vS8Y/4cSFNd92fFGBBhnEpgfKnSnRjAftOCxt1oD3J++UgZquNk0gn3j3+VOalULAFT1JMS4HHngk7Jf2q4ejA53t7gjcx0HKlWQX7Yf/nV20ZqnqoIPm/d7xfWhJTBPdAM7a1ES+7c19u7k4afXMv+/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772032; c=relaxed/simple;
	bh=W44BrKOK8AS0+ffWoA1gfrvUNI6jWPJ1YWK9rj1wwQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiZztGwGwUOIY7nE21pza615ZxXV7C6FS920dQAyCWOe70Hz3f/nwhSV0gsbjOwxwB51jRRcn6cxoF9IL5HzvWr0uv7EoWxRY0dx6urynLcvj0AUd+eNheiLkJZCBwHvoJmmbw5SNgR6tNvhG5aJqe/LIjOHiAtMjzuMUvhjKAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsxeXchM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsxeXchM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so3277375e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 04 Apr 2025 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743772028; x=1744376828; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5KXhq05ViDXh7e+CB6BbZ2L92h5jQPNDQUsuB4QpPaA=;
        b=SsxeXchMJUk1GWTsL2TpXwz4BdukSYtso7n/iQp2+NN7wCaZMIoOK4J1sV2Q0BBASf
         gSIVEl8N12mYLq/t8TG+VLV9uDvClowyfHw25bPceef0UOkrSqyGVlk2ntFEN5wXmULr
         kuhSNf3fodp1/ys7JdVfwby0M79/zfwi+yHgxwNTbyFysD+tTsuBzAHW8AISRYBLUzeU
         INNpNk+LnZv20Mz2YjG+PSR6FndQf3h9q1GctJ8DOA31y5FaTIWC0sT4b8rGL2KvUtqo
         wnfBCimhNHCiHTP91q2IxJ1pa0WcT5PNtegPPbDogc2K74h52PkJ8yJeUt8uKQWcGfQW
         RW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743772028; x=1744376828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KXhq05ViDXh7e+CB6BbZ2L92h5jQPNDQUsuB4QpPaA=;
        b=egohropJF3UTz/bopKp7IyWobx191dBmmQ2DqLPNNWhQrOcn76VW/pUijufXBUE1g/
         C+UF9fjj7yKjutwpUzAAcvm8vBO2biOUqRXV4sgvWXj0EsZTfsMNxXDQbwcS3gHFQ8ol
         wI+UrQKLzHt5sKKwbHIm1Yl/AsFl/B8yWl1633rtKok4cPK0gtvBGANCm9WUdW9x7eDP
         r9pbYNVK8eFBc2U3CW+cNxAfe5KtQWS5vaodh95cqVu3i4kg6UOLjihLC4kBteCohxVV
         Qd8EW5YziOuDwp6916kpXE/ChMZQiGQ0VwbvjqEXam6t6/sszuAZk6k9oYS+Puizjgd/
         iJiQ==
X-Gm-Message-State: AOJu0YypmixFCCzA07ZfOP7qpMsAOF24ib3Tl5K5ChNdZUf4rTDGSdvq
	tPia/nTu3IRRr8rNTDZs3Ter0p5YdCXQvkl92TpLsy7CEdw6fT1FJificvB//WkxVGch41u+vSR
	8
X-Gm-Gg: ASbGncvSQnyiqGWcSEoZ/QMkLeiXmV9r2nbY5d5GEFyJVgXSfnOS5miggHakYGzEPwl
	NiyP5MAiQ+UXry13vogUuQx/D2WZMQWrZ/tBjc3NxldCbacy733bIxkA1poONsRxHhrtU0S3tqV
	QLPtvZ4meacXultlapjFGHUbL9N4vgwolj3deo73imONsWe4MG2IafNywKyXUHkVgLcJ/iBMOhe
	f2udQIA+TK0Yw27mFoApNe42ZnvihmC2zBs+OfNISHLwHe+DylKz9mft5J6PEL8RXzMbsmesECs
	9m5rysNVqtg6pIQiRyRjqNx4ljnhpOeHGmFoOa7ufRwfD9mKIQ==
X-Google-Smtp-Source: AGHT+IHFeLCxSi+dpe6OsYojj32lSmxQ+0JrEaVpOz7wOqLY4Kdknhz1oy9PvzMuPM+otutqMoyIGA==
X-Received: by 2002:a05:600c:1f0c:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-43ecf85db8bmr29052385e9.9.1743772026779;
        Fri, 04 Apr 2025 06:07:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec36699e0sm45610875e9.35.2025.04.04.06.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:07:06 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:07:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marc Dionne <marc.dionne@auristor.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: fs/cachefiles/namei.c:203 cachefiles_get_directory() warn: passing
 zero to 'ERR_PTR'
Message-ID: <a767137a-10fe-497c-a199-0750f8d25529@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
commit: 406fad7698f5bf21ab6b5ca195bf4b9e0b3990ed cachefiles: Fix oops in vfs_mkdir from cachefiles_get_directory
config: i386-randconfig-141-20250404 (https://download.01.org/0day-ci/archive/20250404/202504042052.d4liiRat-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504042052.d4liiRat-lkp@intel.com/

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
                                                                ^^^^^^^^^^^^^^^^^^
Let's say this fails.

406fad7698f5bf Marc Dionne    2025-03-25  134  		else
406fad7698f5bf Marc Dionne    2025-03-25  135  			subdir = ERR_PTR(ret);
c54b386969a581 NeilBrown      2025-02-27  136  		if (IS_ERR(subdir)) {
32759f7d7af545 David Howells  2021-10-21  137  			trace_cachefiles_vfs_error(NULL, d_inode(dir), ret,
32759f7d7af545 David Howells  2021-10-21  138  						   cachefiles_trace_mkdir_error);
32759f7d7af545 David Howells  2021-10-21  139  			goto mkdir_error;

Then it means "ret" is zero and we return a NULL.  Intentional?

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

