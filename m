Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56754364036
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891281; cv=none; b=MkZLp70h7/CKjM6ZS+hN25kJpG1k4CmAHX5FfJLqXiLwhXydRqCtffth0nR6VU+Nv/j6QXgoEmrGqSA2DLXWZOUM/oL6q05aU3rMYNrnaIxLIlkfak51YeuclzO9QGIcODLIvqabrkJBjfWgC8+3GRdyKlTL+B3JjMpMpBSOLpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891281; c=relaxed/simple;
	bh=FbeYi8abbKKDQN5ErrQhoV4Xo3NLRa/2WQwcV2r2I/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ma7koXjC14KXQO6JkBb1cO1gzX13y+LwCeX/RGdgqxE4g6Flw+JBlee0A8ZT/UX15NcqA0NcWC9JVzrif/F39hxtvD6SpySmR/zgW+ZM2uv/gye6U9DC16ZGhoIKke2Otf4T9EVHIZ25YHbGGnW4UXZfJhUSySfc1AckernXMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFXYQDw7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFXYQDw7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so35704695e9.3
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 05:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765891275; x=1766496075; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wmHNZH7NrH1Cn87hSg81r6ayZGoy2xZZEr6d5MxEDc=;
        b=tFXYQDw7DQ45tGs8YrqeYBzNQnrRaVj2UbbamBgXxTHYmxEgz3qEeNqJl2KmG4PzgH
         2QbWXdyAMyGXCoVF4i8NKqFVzOqQu7cjD4MkNZBEspmFWuJeYX+J1s9pHQ/GR0Xrjsdm
         poW+zKST33eIb4ecCMBUydK/xBH4+3FEFwMbVpiFKR4gue1v4LVwG+yChyKj+YdvKxVp
         8krSM9Pwu5XdjUCOPA0/7+MYukJBKDf69Kx+mAUzjVpJNfIcpUmZJ1RtUDqmgI0mRkOd
         stxpI8CwhZw/k0SaMyIgMYaWaCPlBndS5m55udReBOK6LuFJDAqJRrUoRNVqfP3g1Jtk
         8G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765891275; x=1766496075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wmHNZH7NrH1Cn87hSg81r6ayZGoy2xZZEr6d5MxEDc=;
        b=P+5I/n+WkYWNDjeqM9qXiK5f4jRACQ+MQ21XBPDKBuP3lPsrwPMbTTngas7oltntWD
         niDLHg+Ybj6yyjde1mRSIFrtX6OzEfoax7XnYHbRVMl+J7lrrlrR7Hfbn8T734OXc9AD
         I/x8xeg426mn0nr1JhO395Ig+GcIaGIRudJSWuce8RnzhtDZXO5gLSf1/bR6MipwES95
         L1wtiElQo/GaaOc3J9rArqE/KLU5wvLT1EhfN7+IMG30kFNDNwjwiU5xEuFtBozS4Q2E
         O7MDlSmFH2s82CTmDIOkhsZZSj8TyKUQMKp+TKpmKgUJ/vJkcbuOj8jKvkkX54OjBTYB
         d40Q==
X-Gm-Message-State: AOJu0Yxm2nYANpxSP0CYZSYsVO7w3H+OsR9Js4qj99RvZyVoVuCAmA+X
	bOVd9QziCJoU+ie2V+nhX+qzeWrXKnamgEIe0V+LulYbiVNOoa1pFrFZDwICAEY/rzl9c2cC4Dm
	nFnFr
X-Gm-Gg: AY/fxX5oGjJemVQeqfYRa5/igtfNU/RXTvU7Q9j6t4EznRucgxQgLl9d2DGVNG/6X1R
	8Z1e0mHAgEmdwr4I3oUZr7q6Sike6H7n7qinULCJRRVeURyE5BWoLbasybrEoFHAKTZ1DkJWtQQ
	RxmytbUhTPMpPbo94rf9niLLNsDgDy4sKC3e/8fX3tb/v1w9iQh/mdMOpwirP9w3i5MqGkwURdz
	o/f/qpbT4vf2rLLhx0By39NL2brMN7zhIQbj1pvGBhg2s/OslQsX79VACDPMS0rawqJgOq1CAR/
	aYCQCx3faMP85XT9ED5PPfNu7BEOVo9qPT0WMiVPVNeGq3vSIqbazgrlOXY0oPIekO84MucNv2Q
	C7zUZBvg0VF5ecqVoPGtuhelwxTFvAIlde3hYcpvKMLTyEbPwytghNIu29bPGDdvRN1XWhG/J3E
	97NEZZB2g2Y82PqZ6T
X-Google-Smtp-Source: AGHT+IGfFKCHm6qQ5HvvPNH5WnmUcSnA8Trk6y8PPDniJYRofsEI3htHdqlRoko+7RtUJWrsVXM8MQ==
X-Received: by 2002:a05:600c:46cb:b0:47a:810f:1d06 with SMTP id 5b1f17b1804b1-47a8f89cb47mr158078375e9.4.1765891275096;
        Tue, 16 Dec 2025 05:21:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4ef38bsm255963575e9.0.2025.12.16.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:21:14 -0800 (PST)
Date: Tue, 16 Dec 2025 16:21:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhu Lingshan <lingshan.zhu@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Infrastructure <z1.linuxinfra@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:amd-staging-drm-next 2547/2632]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165
 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see
 line 3162)
Message-ID: <202512162104.8deuIhSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251216132111.2WtdAin94DUXKbJzgJ-iwO7vr4SrG85zHR1Q-gLM1NE@z>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e4a7a6e594f81347a95c965ce5e5d07ddea16913
commit: eb39a457ba5456fbc31d9bc0765af3fc00901cfc [2547/2632] amdkfd: introduce new ioctl AMDKFD_IOC_CREATE_PROCESS
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251216/202512162104.8deuIhSW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512162104.8deuIhSW-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c:3165 kfd_ioctl_create_process() warn: variable dereferenced before check 'p' (see line 3162)

vim +/p +3165 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_chardev.c

eb39a457ba5456 Zhu Lingshan 2025-08-21  3156  static int kfd_ioctl_create_process(struct file *filep, struct kfd_process *p, void *data)
eb39a457ba5456 Zhu Lingshan 2025-08-21  3157  {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3158  	struct kfd_process *process;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3159  	int ret;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3160  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3161  	/* Each FD owns only one kfd_process */
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3162  	if (p->context_id != KFD_CONTEXT_ID_PRIMARY)
                                                    ^^^^^^^^^^^^^
This dereferences p

eb39a457ba5456 Zhu Lingshan 2025-08-21  3163  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3164  
eb39a457ba5456 Zhu Lingshan 2025-08-21 @3165  	if (!filep->private_data || !p)
                                                                             ^
So this NULL check is too late.

eb39a457ba5456 Zhu Lingshan 2025-08-21  3166  		return -EINVAL;
eb39a457ba5456 Zhu Lingshan 2025-08-21  3167  
eb39a457ba5456 Zhu Lingshan 2025-08-21  3168  	mutex_lock(&kfd_processes_mutex);
eb39a457ba5456 Zhu Lingshan 2025-08-21  3169  	if (p != filep->private_data) {
eb39a457ba5456 Zhu Lingshan 2025-08-21  3170  		mutex_unlock(&kfd_processes_mutex);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

