Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21282274B3C
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 07:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766042280; cv=none; b=L+KJ2KHMFoYf4wMqfU5GOsYTLv3nSG8TpBeK+OGMFjW4RCRFtYMYbnUarO5yFMAL/zR9N+fOt0KrIxb4JmGB4WXzm7t9c4eWvsAdpezPMjzhSKZfrDrf3AqJdmJoD/MifnFVuuoj3TvbF3N7sdAxNOlO+HdNz8PAdj4SVtyiVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766042280; c=relaxed/simple;
	bh=ZG2uGVos9jKrEEh0YiSgQg9bh1K8XhAuGphKItgKMUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B94HSlyvukeB3+p2wUahRrga77VhMdDiBQo6kTiuci7fSn0h9sHhRqlJJHxePswTRgwsOeSWnhOZ9oPYgRWsw2sEngR61CoJpmx7GwHq0438SUwbmIcs6RJsM62HzIGwfbRaTuRbdyKa77dfCXzUuw9ysnn2U0jGIWl7KwzzMNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLJXmzVC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLJXmzVC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so133096f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 23:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766042276; x=1766647076; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jf5BAcGhlQ0Lnqc8uMzINeGbDdKgDigIFHuO+3zKQo4=;
        b=FLJXmzVC/oijd18fCwV54NVrhv97SIPJOI3ctrOMCp1zzrxRCF/zNTru10IpY9aXyP
         Lx3s3PUXxTxgxiFhxF2bJcwz0J8ODJznGy7/MAOzV9CE3StEN6iRKez3wAawj/ZaTidg
         /sqjokOvc4tXuz6iGN545oAsKsGPmVNc4korcgSVXOrmYo4iQHQq1o8v7gBDMX8dPfiw
         xxl5cWzP5/oF7eXi2eDs4bGm3HBcmmv5tY1ikxHuSONHjIFSdNGNOYXths28eDsH1bEq
         xu8VYX2YNw5ufgtBVAHnr5Cxdnj3YoR2kS98+ShdEe4DzmG/92IwO27yhJCEPUP59Uj1
         W8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766042276; x=1766647076;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jf5BAcGhlQ0Lnqc8uMzINeGbDdKgDigIFHuO+3zKQo4=;
        b=Fgm75b83AuKFLhMBEF4ItN/LZ5AC0Qpm7UC1wkp2J3ENT8v/y87KZcYDPTOf2KzDiA
         lP+3VgxGXD8CpBte5qs1LrEWSpByqyJMQCFbmpHUcvFa8RG/sNqte6uTnIV0JxY12kL7
         l3s7LIpPmiW02qqK1gTCvQfRjwrd13eu1VFS2MUGGPXmMJQ1l7NMqAWghFE1J+a+XCtK
         znokCxAkq/AfIPRvf5vi5sddGwEHHkfLeRLr6kaWWk/bLY6QbZNVmK5NIhq3/JeuxoZF
         Wb45H+cIWnRA5fsHSWtswV7+epE1WgTD+vhd+M2lFG8c/jldqmCgY0ILfnWwho6XNEXn
         45sg==
X-Gm-Message-State: AOJu0YwrVek8sS7hCIhzrrR1d53gG2eB3Drrd/AM6Z5/J0zeYNlq8fDL
	qTHMrSYJ3BQBogDcLG5ElQ4A98v36NNHXfDWgtL3tUSpd3NvF2TUgwcGLSbTdUn4HIHb5T5CXUm
	WW6QK
X-Gm-Gg: AY/fxX7VjbXdx0E98ni7S4MQNh4cJbZzPRwVd0+ZsPqGCKGNrtUWfDdwpIY/wqD2TQd
	5y+xViexdX1KovdEb80xxFDUhELkl/XceAeR2DvZjoH7hKdujJAb+yU1SnPsMI/N5+tdhmrvC5S
	nnc4l4fMWvp7RzFRogxCLSvO6cNEP5XskwwO4Id7TbAdKNVotrDvNgyy2fuGF4YwX5TsfOKCaAQ
	puB2+CqNq3GF5OOiCCAk31YvZ05WrgobDaOD2m9i6za1pGh8dAJFMHVXz5iPL5q+VuNl3H7/chP
	g9NgP8/Nip4bTQXRxQO8+HntBc5B0ERXD5EE53ue+DlKucrXhIxO8iR1rQafcfRCE5uMPMG7hou
	LyuRFIzBDhUBFiznQ+Bf5100cUCsRnGBD/O7BKJgDev5llfzchH/Zf2RpErhBYPopeAjWSv5NgL
	zoj54yyRYX88n3QCP9
X-Google-Smtp-Source: AGHT+IHP0/nOTUAYZJnjYxs4Ze+aKEzrPADjEBA33VeDRR8gsG0whl1HjnLrlF5DyOhSaqSl0ytkbQ==
X-Received: by 2002:a05:6000:2c0d:b0:431:a16:5533 with SMTP id ffacd0b85a97d-4310a1656f6mr6517869f8f.31.1766042275841;
        Wed, 17 Dec 2025 23:17:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493fd73sm3294161f8f.13.2025.12.17.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:17:55 -0800 (PST)
Date: Thu, 18 Dec 2025 10:17:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: drivers/android/binder/rust_binderfs.c:134
 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <202512181203.IOv6IChH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251218071752.omIsi0jVF7L3YxQY2GherDcimX3EhZblIJkCW28hLz0@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
config: loongarch-randconfig-r071-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181203.IOv6IChH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512181203.IOv6IChH-lkp@intel.com/

smatch warnings:
drivers/android/binder/rust_binderfs.c:134 binderfs_binder_device_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/android/binder/rust_binderfs.c:418 binderfs_binder_ctl_create() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +134 drivers/android/binder/rust_binderfs.c

eafedbc7c050c4 Alice Ryhl 2025-09-19  130  
eafedbc7c050c4 Alice Ryhl 2025-09-19  131  	/* Reserve new minor number for the new device. */
eafedbc7c050c4 Alice Ryhl 2025-09-19  132  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  133  	if (++info->device_count <= info->mount_opts.max)
eafedbc7c050c4 Alice Ryhl 2025-09-19 @134  		minor = ida_alloc_max(&binderfs_minors,
eafedbc7c050c4 Alice Ryhl 2025-09-19  135  				      use_reserve ? BINDERFS_MAX_MINOR :
eafedbc7c050c4 Alice Ryhl 2025-09-19  136  						    BINDERFS_MAX_MINOR_CAPPED,

ida_alloc_max() takes the maximum valid id not the count.  These should
be BINDERFS_MAX_MINOR - 1, BINDERFS_MAX_MINOR_CAPPED - 1.

eafedbc7c050c4 Alice Ryhl 2025-09-19  137  				      GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  138  	else
eafedbc7c050c4 Alice Ryhl 2025-09-19  139  		minor = -ENOSPC;
eafedbc7c050c4 Alice Ryhl 2025-09-19  140  	if (minor < 0) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  141  		--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  142  		mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  143  		return minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  144  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  145  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  146  
eafedbc7c050c4 Alice Ryhl 2025-09-19  147  	ret = -ENOMEM;
eafedbc7c050c4 Alice Ryhl 2025-09-19  148  	device = kzalloc(sizeof(*device), GFP_KERNEL);
eafedbc7c050c4 Alice Ryhl 2025-09-19  149  	if (!device)
eafedbc7c050c4 Alice Ryhl 2025-09-19  150  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  151  
eafedbc7c050c4 Alice Ryhl 2025-09-19  152  	req->name[BINDERFS_MAX_NAME] = '\0'; /* NUL-terminate */
eafedbc7c050c4 Alice Ryhl 2025-09-19  153  
eafedbc7c050c4 Alice Ryhl 2025-09-19  154  	ctx = rust_binder_new_context(req->name);
eafedbc7c050c4 Alice Ryhl 2025-09-19  155  	if (!ctx)
eafedbc7c050c4 Alice Ryhl 2025-09-19  156  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  157  
eafedbc7c050c4 Alice Ryhl 2025-09-19  158  	inode = new_inode(sb);
eafedbc7c050c4 Alice Ryhl 2025-09-19  159  	if (!inode)
eafedbc7c050c4 Alice Ryhl 2025-09-19  160  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  161  
eafedbc7c050c4 Alice Ryhl 2025-09-19  162  	inode->i_ino = minor + INODE_OFFSET;
eafedbc7c050c4 Alice Ryhl 2025-09-19  163  	simple_inode_init_ts(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  164  	init_special_inode(inode, S_IFCHR | 0600,
eafedbc7c050c4 Alice Ryhl 2025-09-19  165  			   MKDEV(MAJOR(binderfs_dev), minor));
eafedbc7c050c4 Alice Ryhl 2025-09-19  166  	inode->i_fop = &rust_binder_fops;
eafedbc7c050c4 Alice Ryhl 2025-09-19  167  	inode->i_uid = info->root_uid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  168  	inode->i_gid = info->root_gid;
eafedbc7c050c4 Alice Ryhl 2025-09-19  169  
eafedbc7c050c4 Alice Ryhl 2025-09-19  170  	req->major = MAJOR(binderfs_dev);
eafedbc7c050c4 Alice Ryhl 2025-09-19  171  	req->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  172  	device->ctx = ctx;
eafedbc7c050c4 Alice Ryhl 2025-09-19  173  	device->minor = minor;
eafedbc7c050c4 Alice Ryhl 2025-09-19  174  
eafedbc7c050c4 Alice Ryhl 2025-09-19  175  	if (userp && copy_to_user(userp, req, sizeof(*req))) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  176  		ret = -EFAULT;
eafedbc7c050c4 Alice Ryhl 2025-09-19  177  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  178  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  179  
eafedbc7c050c4 Alice Ryhl 2025-09-19  180  	root = sb->s_root;
eafedbc7c050c4 Alice Ryhl 2025-09-19  181  	inode_lock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  182  
eafedbc7c050c4 Alice Ryhl 2025-09-19  183  	/* look it up */
eafedbc7c050c4 Alice Ryhl 2025-09-19  184  	dentry = lookup_noperm(&QSTR(req->name), root);
eafedbc7c050c4 Alice Ryhl 2025-09-19  185  	if (IS_ERR(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  186  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  187  		ret = PTR_ERR(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  188  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  189  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  190  
eafedbc7c050c4 Alice Ryhl 2025-09-19  191  	if (d_really_is_positive(dentry)) {
eafedbc7c050c4 Alice Ryhl 2025-09-19  192  		/* already exists */
eafedbc7c050c4 Alice Ryhl 2025-09-19  193  		dput(dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  194  		inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  195  		ret = -EEXIST;
eafedbc7c050c4 Alice Ryhl 2025-09-19  196  		goto err;
eafedbc7c050c4 Alice Ryhl 2025-09-19  197  	}
eafedbc7c050c4 Alice Ryhl 2025-09-19  198  
eafedbc7c050c4 Alice Ryhl 2025-09-19  199  	inode->i_private = device;
eafedbc7c050c4 Alice Ryhl 2025-09-19  200  	d_instantiate(dentry, inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  201  	fsnotify_create(root->d_inode, dentry);
eafedbc7c050c4 Alice Ryhl 2025-09-19  202  	inode_unlock(d_inode(root));
eafedbc7c050c4 Alice Ryhl 2025-09-19  203  
eafedbc7c050c4 Alice Ryhl 2025-09-19  204  	return 0;
eafedbc7c050c4 Alice Ryhl 2025-09-19  205  
eafedbc7c050c4 Alice Ryhl 2025-09-19  206  err:
eafedbc7c050c4 Alice Ryhl 2025-09-19  207  	kfree(device);
eafedbc7c050c4 Alice Ryhl 2025-09-19  208  	rust_binder_remove_context(ctx);
eafedbc7c050c4 Alice Ryhl 2025-09-19  209  	mutex_lock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  210  	--info->device_count;
eafedbc7c050c4 Alice Ryhl 2025-09-19  211  	ida_free(&binderfs_minors, minor);
eafedbc7c050c4 Alice Ryhl 2025-09-19  212  	mutex_unlock(&binderfs_minors_mutex);
eafedbc7c050c4 Alice Ryhl 2025-09-19  213  	iput(inode);
eafedbc7c050c4 Alice Ryhl 2025-09-19  214  
eafedbc7c050c4 Alice Ryhl 2025-09-19  215  	return ret;
eafedbc7c050c4 Alice Ryhl 2025-09-19  216  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

