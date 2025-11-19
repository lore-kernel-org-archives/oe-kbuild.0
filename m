Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4F935293A
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551996; cv=none; b=eyV9at5LsU/DyDZ02/Ky8huQKsN6CPdaDKeTxChu9lAXUdIjvqytHBgVjup90dwnx1dm5YfwtgssqdCNP85tc5JNMPLwT3fehUF8RuETbZ9vX/tveQjP+YK1P5kanjhAMxxIUDv1xU3wkL5bE1qBqH17yMt7x9KlsgyRtscMeUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551996; c=relaxed/simple;
	bh=rEKHxiloOov11vR4ysdFapqx9+lo4NRYZaAhZDWi6RM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IW3Ojj3U/TMWTE+wRiyBxdTpFBmlikBEwSgI8JWjNi7L4PCyBEL+glaZzfel9jQqf5GjqwcgDFsEV4YLhkHT0NW6jIzO2aMuq9fQEtHTrqJGBPFbAZ/eyVDeO6jm8F6nI+UhfBib9rAbhuWUgQtvHOgVIDoyGnamCDQf//6RMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzshNIpp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzshNIpp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b73161849e1so1218585166b.2
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763551992; x=1764156792; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsBMIyY0Yp0x0Bid5eEV0tzC+f87jStvL72KKEcvouo=;
        b=NzshNIppwHECpFLdtoVv8CDOhrK8NaxqI4suQCi68av4mEzZKW8RshNm8bY0tHITdF
         Hf7asVmGrdLfulcjRgtM/L3SOFOlcowIrac9Fq8W+Qb2QTcstU8H804VnQ9ine3uoRSD
         ZVARjcoEobpgyE9ZGvVlAfpdUJjY1qLd31De00zgHsy3QqPffMiGozwvNmT9dtShFlHL
         SwgWAzFC0+u1Grqv1bbQKdaMdZa7TAstP2gTcOj6e3Q/l00JeiBctn+cQmqMlc5FepiF
         IaNpQHZBKLQvBgZ/tKqZWmTfMIfcdXAmPsHK4GDtgeA5Y6SJ9mtsS7L9wNcqmi9R4/xY
         di+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551992; x=1764156792;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsBMIyY0Yp0x0Bid5eEV0tzC+f87jStvL72KKEcvouo=;
        b=TVXbdA1SqQb+YFklQZ6vSKwGIl0fXI2O6y0mFpt75PDwZg5zM3++jSDxGlbkqwqxIJ
         PCfrU7wmH79HnaS2z08Mc3IWunVb+rpQY90jUy/OT2b/hO+W8pDZBedYl3V+eJZ/GBpK
         9PXvEvg1hAKxZxfFqTCa8m1AeKQssahjfKq/KxlglnRFxRg9cPf9Cql8RG/Z5Q29S3Z7
         LhqoHPF+QRkTKgQy6GQT5oNPyLVabFBhIHU4ezTmigJaRJTd9nV18zxu52ZDwjj69NJs
         fa3FWDAKzIkdedi2jl79hkR++PYpqjBs9DgYdE/pLONwiBzOwVLAR19gHTu12FguaxpA
         Np4Q==
X-Gm-Message-State: AOJu0YyzFxwwlcpvlqMkZ+/QClao+I5ZbuysA/sVfpQDvvNcjOJUaAe8
	9uprARBfDsNJbA0z+5d1xHC8H1ps/CNP79fyr58/IvIgPLpFtr/cIdKeLrJvVQvNEh3V6w4SPYj
	fDyIJ
X-Gm-Gg: ASbGncuPT/YGjBieiyZwmlYKJtnFm+pOYrvOSu8nA0ybH7N5Haqz3NbOEjgTsXJJ2jX
	yRjwW2CowrSCS8Vr5T9zcwAsFbzCu/EFsL3S5kId/R9HpA2ggnPYuxmOBNV1Ub2BtrUKMlXduX7
	bAWB9cKBLEPNsxnnEPcd3V5Uyvm686dsJiypKjndnHcZbbHxRdNAeazutoFy05suMwIogFb6g8D
	0rcpZY4DM++t1sSJND1U66tsrhXifb8ZCrlSPqkwGW1nAmfwR0LMs7vBVb60vf/N7KzzJEde46f
	uIoF14RTpJwiDyjDIXaANkpWQ8q1JhFdBggd8rM4EIKT3J/NwNcFdiUGXu7mQotqZP3/g1wNgst
	18ZASkJe18CcMicupjze4uH7h8vKitXibSco8umMd1F4JiogLNhvO9yleOUL7p1RkzKmvB3yROj
	pDBrOgGNZQRB7Cfmn3H0AyuCh2QfU=
X-Google-Smtp-Source: AGHT+IHtBfMJ71j5rAneYV9ERR1pGzs6y/BegtRlJtceqQt9QRH6bSuJtNPqXVsi0pGHXwmqg6BKgw==
X-Received: by 2002:a17:906:794d:b0:b73:870f:fa2b with SMTP id a640c23a62f3a-b76378bb2a9mr254097266b.27.1763551991708;
        Wed, 19 Nov 2025 03:33:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fad4487sm1640563666b.22.2025.11.19.03.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:33:11 -0800 (PST)
Date: Wed, 19 Nov 2025 14:33:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.fd.prepare 31/43] fs/namespace.c:4376
 __do_sys_fsmount() error: uninitialized symbol 'file'.
Message-ID: <202511190607.2Y9PvVQN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251119113307.bC7DSrg-W91RvHkpzQ89fHOjFFWHjq_ww-JFFC0ufUU@z>

tree:   https://github.com/brauner/linux.git work.fd.prepare
head:   7eb06f9f7a76175a82d3c6b9d94219d7b64b6bce
commit: 7a6aae3e938ed79442f55c1f2b6d4a73a2cf0c51 [31/43] fs: namespace
config: powerpc-randconfig-r072-20251119 (https://download.01.org/0day-ci/archive/20251119/202511190607.2Y9PvVQN-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511190607.2Y9PvVQN-lkp@intel.com/

New smatch warnings:
fs/namespace.c:4376 __do_sys_fsmount() error: uninitialized symbol 'file'.

vim +/file +4376 fs/namespace.c

93766fbd2696c2 David Howells     2018-11-01  4276  SYSCALL_DEFINE3(fsmount, int, fs_fd, unsigned int, flags,
93766fbd2696c2 David Howells     2018-11-01  4277  		unsigned int, attr_flags)
93766fbd2696c2 David Howells     2018-11-01  4278  {
93766fbd2696c2 David Howells     2018-11-01  4279  	struct mnt_namespace *ns;
93766fbd2696c2 David Howells     2018-11-01  4280  	struct fs_context *fc;
93766fbd2696c2 David Howells     2018-11-01  4281  	struct file *file;
7a6aae3e938ed7 Christian Brauner 2025-11-18  4282  	struct path newmount __free(path_put) = {};
93766fbd2696c2 David Howells     2018-11-01  4283  	struct mount *mnt;
93766fbd2696c2 David Howells     2018-11-01  4284  	unsigned int mnt_flags = 0;
93766fbd2696c2 David Howells     2018-11-01  4285  	long ret;
93766fbd2696c2 David Howells     2018-11-01  4286  
93766fbd2696c2 David Howells     2018-11-01  4287  	if (!may_mount())
93766fbd2696c2 David Howells     2018-11-01  4288  		return -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4289  
93766fbd2696c2 David Howells     2018-11-01  4290  	if ((flags & ~(FSMOUNT_CLOEXEC)) != 0)
93766fbd2696c2 David Howells     2018-11-01  4291  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4292  
5b490500f91b21 Christian Brauner 2021-01-21  4293  	if (attr_flags & ~FSMOUNT_VALID_FLAGS)
93766fbd2696c2 David Howells     2018-11-01  4294  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4295  
5b490500f91b21 Christian Brauner 2021-01-21  4296  	mnt_flags = attr_flags_to_mnt_flags(attr_flags);
93766fbd2696c2 David Howells     2018-11-01  4297  
93766fbd2696c2 David Howells     2018-11-01  4298  	switch (attr_flags & MOUNT_ATTR__ATIME) {
93766fbd2696c2 David Howells     2018-11-01  4299  	case MOUNT_ATTR_STRICTATIME:
93766fbd2696c2 David Howells     2018-11-01  4300  		break;
93766fbd2696c2 David Howells     2018-11-01  4301  	case MOUNT_ATTR_NOATIME:
93766fbd2696c2 David Howells     2018-11-01  4302  		mnt_flags |= MNT_NOATIME;
93766fbd2696c2 David Howells     2018-11-01  4303  		break;
93766fbd2696c2 David Howells     2018-11-01  4304  	case MOUNT_ATTR_RELATIME:
93766fbd2696c2 David Howells     2018-11-01  4305  		mnt_flags |= MNT_RELATIME;
93766fbd2696c2 David Howells     2018-11-01  4306  		break;
93766fbd2696c2 David Howells     2018-11-01  4307  	default:
93766fbd2696c2 David Howells     2018-11-01  4308  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4309  	}
93766fbd2696c2 David Howells     2018-11-01  4310  
8152f820108835 Al Viro           2024-07-19  4311  	CLASS(fd, f)(fs_fd);
8152f820108835 Al Viro           2024-07-19  4312  	if (fd_empty(f))
93766fbd2696c2 David Howells     2018-11-01  4313  		return -EBADF;
93766fbd2696c2 David Howells     2018-11-01  4314  
1da91ea87aefe2 Al Viro           2024-05-31  4315  	if (fd_file(f)->f_op != &fscontext_fops)
8152f820108835 Al Viro           2024-07-19  4316  		return -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4317  
1da91ea87aefe2 Al Viro           2024-05-31  4318  	fc = fd_file(f)->private_data;
93766fbd2696c2 David Howells     2018-11-01  4319  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4320  	ACQUIRE(mutex_intr, uapi_mutex)(&fc->uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4321  	ret = ACQUIRE_ERR(mutex_intr, &uapi_mutex);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4322  	if (ret)
8152f820108835 Al Viro           2024-07-19  4323  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4324  
93766fbd2696c2 David Howells     2018-11-01  4325  	/* There must be a valid superblock or we can't mount it */
93766fbd2696c2 David Howells     2018-11-01  4326  	ret = -EINVAL;
93766fbd2696c2 David Howells     2018-11-01  4327  	if (!fc->root)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4328  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4329  
93766fbd2696c2 David Howells     2018-11-01  4330  	ret = -EPERM;
93766fbd2696c2 David Howells     2018-11-01  4331  	if (mount_too_revealing(fc->root->d_sb, &mnt_flags)) {
807602d8cfc8b6 Aleksa Sarai      2025-08-06  4332  		errorfcp(fc, "VFS", "Mount too revealing");
7a6aae3e938ed7 Christian Brauner 2025-11-18  4333  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4334  	}
93766fbd2696c2 David Howells     2018-11-01  4335  
93766fbd2696c2 David Howells     2018-11-01  4336  	ret = -EBUSY;
93766fbd2696c2 David Howells     2018-11-01  4337  	if (fc->phase != FS_CONTEXT_AWAITING_MOUNT)
7a6aae3e938ed7 Christian Brauner 2025-11-18  4338  		return ret;
93766fbd2696c2 David Howells     2018-11-01  4339  
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4340  	if (fc->sb_flags & SB_MANDLOCK)
f7e33bdbd6d1bd Jeff Layton       2021-08-19  4341  		warn_mandlock();
93766fbd2696c2 David Howells     2018-11-01  4342  
93766fbd2696c2 David Howells     2018-11-01  4343  	newmount.mnt = vfs_create_mount(fc);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4344  	if (IS_ERR(newmount.mnt))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4345  		return PTR_ERR(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4346  	newmount.dentry = dget(fc->root);
93766fbd2696c2 David Howells     2018-11-01  4347  	newmount.mnt->mnt_flags = mnt_flags;
93766fbd2696c2 David Howells     2018-11-01  4348  
93766fbd2696c2 David Howells     2018-11-01  4349  	/* We've done the mount bit - now move the file context into more or
93766fbd2696c2 David Howells     2018-11-01  4350  	 * less the same state as if we'd done an fspick().  We don't want to
93766fbd2696c2 David Howells     2018-11-01  4351  	 * do any memory allocation or anything like that at this point as we
93766fbd2696c2 David Howells     2018-11-01  4352  	 * don't want to have to handle any errors incurred.
93766fbd2696c2 David Howells     2018-11-01  4353  	 */
93766fbd2696c2 David Howells     2018-11-01  4354  	vfs_clean_context(fc);
93766fbd2696c2 David Howells     2018-11-01  4355  
93766fbd2696c2 David Howells     2018-11-01  4356  	ns = alloc_mnt_ns(current->nsproxy->mnt_ns->user_ns, true);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4357  	if (IS_ERR(ns))
7a6aae3e938ed7 Christian Brauner 2025-11-18  4358  		return PTR_ERR(ns);
93766fbd2696c2 David Howells     2018-11-01  4359  	mnt = real_mount(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4360  	ns->root = mnt;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4361  	ns->nr_mounts = 1;
2eea9ce4310d8c Miklos Szeredi    2023-10-25  4362  	mnt_add_to_ns(ns, mnt);
1b0b9cc8d3793e Eric Biggers      2019-06-12  4363  	mntget(newmount.mnt);
93766fbd2696c2 David Howells     2018-11-01  4364  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4365  	FD_PREPARE(fdprep, (flags & FSMOUNT_CLOEXEC) ? O_CLOEXEC : 0,
7a6aae3e938ed7 Christian Brauner 2025-11-18  4366  		   dentry_open(&newmount, O_PATH, fc->cred));
7a6aae3e938ed7 Christian Brauner 2025-11-18  4367  	if (fd_prepare_failed(fdprep)) {
93766fbd2696c2 David Howells     2018-11-01  4368  		dissolve_on_fput(newmount.mnt);
7a6aae3e938ed7 Christian Brauner 2025-11-18  4369  		return fd_prepare_error(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4370  	}
93766fbd2696c2 David Howells     2018-11-01  4371  
7a6aae3e938ed7 Christian Brauner 2025-11-18  4372  	/*
7a6aae3e938ed7 Christian Brauner 2025-11-18  4373  	 * Attach to an apparent O_PATH fd with a note that we
7a6aae3e938ed7 Christian Brauner 2025-11-18  4374  	 * need to unmount it, not just simply put it.
7a6aae3e938ed7 Christian Brauner 2025-11-18  4375  	 */
7a6aae3e938ed7 Christian Brauner 2025-11-18 @4376  	file->f_mode |= FMODE_NEED_UNMOUNT;
                                                        ^^^^^^^^^^^^
Was part of the commit missing? file is uninitialized.

7a6aae3e938ed7 Christian Brauner 2025-11-18  4377  	return fd_publish(fdprep);
93766fbd2696c2 David Howells     2018-11-01  4378  }
93766fbd2696c2 David Howells     2018-11-01  4379  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

