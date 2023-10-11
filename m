Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEE21798A
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PaeOEU2s"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40566f8a093so59916305e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 00:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697008425; x=1697613225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScPYujJrd0RiqEz8o3BO9MuSWljJLNx95KbRlurhiFs=;
        b=PaeOEU2szRY4i+SuwL5y2TOwIk0rqheX9JSMcKeKIuw5IL3GJlGmbyoOdD1L9KWUbi
         80J6kmWotA0C9+REPpz6W+uHeO5qT5oJLwAg7o7UCgW7qLrevIbqG70sUn+ymr41qKH8
         D5BHTlvSSmZ/YUAfjpLbCHtelJpl95aMYsnHq/EvGrtj2HCRjced2E9GWy0tPy4VPkRg
         9hUPVgqIl0XE0poGSXjtDVvOixo8AkVk0wpoF/cbiOTKmTX/9AIN7mbO6Im8kxGmXjwm
         WXMtpsxe9xvHk5XsxdyUNsK4IkBCEUC4GystOYrVFiMdsJstygL4kEwC62wmevpyfF/W
         1ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008425; x=1697613225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScPYujJrd0RiqEz8o3BO9MuSWljJLNx95KbRlurhiFs=;
        b=i6g28rdJijOJXwrcyPvTtWD+O6VKL+q8LappNyQ2YnoeIXaXU5uHtOy4uv43qwVNZ/
         OS2kRfhSQq4Zzn58CdIdhGdA6qSJu4QaqQ4noA3C6/4Jf4y7vi+j3aSIY+LQ6s/M0Q+m
         ZvLC9BUDM25YjJTwOJ7qTQoohnSUD/HBupvHuaQcdrrCrBePgL3xAwUKgbhlBSJKO4UV
         jS8K9lOffcBwARQ5Feq1Ngy04etQB4F4exTdgt+KhSCI5o5cqe2bHoJzGx1YuZN6wRoa
         nSQBRR/GnxuYg5YtQ6MZlfNOsmBt/5quOTG557pTWC+mun4Wh7VxFAOhXtdhxPtWRnrp
         QCtQ==
X-Gm-Message-State: AOJu0YxTspd6ZVmeLqy2+Gn8EIG8ICn0Vj2SLKwaeXiHv5P11NLxZeyA
	20n3UBmjGmQKbJvuKB4kemb5zxU642tATmkTaYo=
X-Google-Smtp-Source: AGHT+IFF2ajkFXhMQg81VHg+VGGJDbFYh5KOKS2gwpGR4LKkFmbji3L54USmvFLuJWWvx5KV2b3Qbw==
X-Received: by 2002:a7b:c40a:0:b0:401:23fc:1f92 with SMTP id k10-20020a7bc40a000000b0040123fc1f92mr18425710wmi.25.1697008425403;
        Wed, 11 Oct 2023 00:13:45 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c204400b00403b63e87f2sm15840040wmg.32.2023.10.11.00.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:13:44 -0700 (PDT)
Date: Wed, 11 Oct 2023 10:13:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/7] [RFC] Allow atomic_open() on positive dentry
Message-ID: <1931d96b-c5ad-4d6f-8c01-3b1acb309bff@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920173445.3943581-4-bschubert@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-fuse_create_open/20230921-013805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230920173445.3943581-4-bschubert%40ddn.com
patch subject: [PATCH v9 3/7] [RFC] Allow atomic_open() on positive dentry
config: i386-randconfig-141-20230927 (https://download.01.org/0day-ci/archive/20231011/202310111158.c6Ja8z2x-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111158.c6Ja8z2x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310111158.c6Ja8z2x-lkp@intel.com/

New smatch warnings:
fs/namei.c:3442 lookup_open() error: uninitialized symbol 'error'.

vim +/error +3442 fs/namei.c

da5ebf5aa676c4 Al Viro           2020-01-09  3406  static struct dentry *lookup_open(struct nameidata *nd, struct file *file,
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3407  				  const struct open_flags *op,
3ec2eef116e900 Al Viro           2018-06-08  3408  				  bool got_write)
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3409  {
6c960e68aaed33 Christian Brauner 2023-01-13  3410  	struct mnt_idmap *idmap;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3411  	struct dentry *dir = nd->path.dentry;
54ef487241e863 Miklos Szeredi    2012-06-05  3412  	struct inode *dir_inode = dir->d_inode;
1643b43fbd0524 Al Viro           2016-04-27  3413  	int open_flag = op->open_flag;
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3414  	struct dentry *dentry;
1643b43fbd0524 Al Viro           2016-04-27  3415  	int error, create_error = 0;
1643b43fbd0524 Al Viro           2016-04-27  3416  	umode_t mode = op->mode;
6fbd07146d9923 Al Viro           2016-04-28  3417  	DECLARE_WAIT_QUEUE_HEAD_ONSTACK(wq);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3418  
ce8644fcadc52d Al Viro           2016-04-26  3419  	if (unlikely(IS_DEADDIR(dir_inode)))
da5ebf5aa676c4 Al Viro           2020-01-09  3420  		return ERR_PTR(-ENOENT);
d58ffd35c1e595 Miklos Szeredi    2012-06-05  3421  
73a09dd94377e4 Al Viro           2018-06-08  3422  	file->f_mode &= ~FMODE_CREATED;
6fbd07146d9923 Al Viro           2016-04-28  3423  	dentry = d_lookup(dir, &nd->last);
6fbd07146d9923 Al Viro           2016-04-28  3424  	for (;;) {
6fbd07146d9923 Al Viro           2016-04-28  3425  		if (!dentry) {
6fbd07146d9923 Al Viro           2016-04-28  3426  			dentry = d_alloc_parallel(dir, &nd->last, &wq);
54ef487241e863 Miklos Szeredi    2012-06-05  3427  			if (IS_ERR(dentry))
da5ebf5aa676c4 Al Viro           2020-01-09  3428  				return dentry;
6fbd07146d9923 Al Viro           2016-04-28  3429  		}
6fbd07146d9923 Al Viro           2016-04-28  3430  		if (d_in_lookup(dentry))
6fbd07146d9923 Al Viro           2016-04-28  3431  			break;

error is not initialized if we hit this break on the first iteration
through the loop

54ef487241e863 Miklos Szeredi    2012-06-05  3432  
6fbd07146d9923 Al Viro           2016-04-28  3433  		error = d_revalidate(dentry, nd->flags);
6fbd07146d9923 Al Viro           2016-04-28  3434  		if (likely(error > 0))
6fbd07146d9923 Al Viro           2016-04-28  3435  			break;
6fbd07146d9923 Al Viro           2016-04-28  3436  		if (error)
6fbd07146d9923 Al Viro           2016-04-28  3437  			goto out_dput;
6fbd07146d9923 Al Viro           2016-04-28  3438  		d_invalidate(dentry);
6fbd07146d9923 Al Viro           2016-04-28  3439  		dput(dentry);
6fbd07146d9923 Al Viro           2016-04-28  3440  		dentry = NULL;
6fbd07146d9923 Al Viro           2016-04-28  3441  	}
0032f53f8fce4f Miklos Szeredi    2023-09-20 @3442  	if (dentry->d_inode && error != D_REVALIDATE_ATOMIC) {
                                                                               ^^^^^
Warning triggered here

d18e9008c377dc Miklos Szeredi    2012-06-05  3443  		/* Cached positive dentry: will open in f_op->open */
da5ebf5aa676c4 Al Viro           2020-01-09  3444  		return dentry;
6c51e513a3aa49 Al Viro           2016-03-05  3445  	}
d18e9008c377dc Miklos Szeredi    2012-06-05  3446  
1643b43fbd0524 Al Viro           2016-04-27  3447  	/*
1643b43fbd0524 Al Viro           2016-04-27  3448  	 * Checking write permission is tricky, bacuse we don't know if we are

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

