Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8463182CF
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/IpqvHu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-405497850dbso60142075e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 00:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697008643; x=1697613443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayhK5ZZITA9PWclc67B5lQjGuI1Rti5S1fpJxVmbBRY=;
        b=f/IpqvHuiSWfC+bXLKvmnp4we5lF9Ns8NQH55oKGgEWp7ula72XYn5inxJKkg3NoYP
         Wp+ftVRUjDw9iAqBcqpPqmyOsj/8TO0o+MZFY4PHpsKKixfHa96XvHIlz9k6M9wKTEBH
         n69zv2esufy7Cl1QcVhfo/tHwuFYYcoFvFFVj/WxMcTPYVkxOzn24RNc+XwpmitpH9yA
         pSjur/kiioYyzCaapcil/h267eboy+loaRmhuW+DhZCQsDFiSJvcEpqjVmTL6hQSXjMs
         L1/anBmfmNNIVa5aUW3j1uOfex3G/4F0aHVwlqEbsQAKRqQD0EmR24LGrWviofyx2gQy
         0M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008643; x=1697613443;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ayhK5ZZITA9PWclc67B5lQjGuI1Rti5S1fpJxVmbBRY=;
        b=rwRhs1XI1knDX+Sjz7YeZ30LC0F+fdABB5AuBxqnqtx21dveCzaPae5rR1WcyymvzA
         1FIV6aEA7VeaMA6Pgp33rCbGPQukADBCD1fknLg73eQS3z4qCp67hbDHdf/AXSZf7JCF
         H1CnMBXedvvYRgCB4kMnR15uKxV+gDGSr6SHr8VnuZDC4YjxE3I/FJ7UuUl6IPWEGv58
         uAeYcoAl/0KjyPY6EzfOqP2JJsTg31kselv73onIj2sgcTg80HISMaD7ijCCKJR9x1Mu
         5GRc6McUWKBwrci5M6iOqRZdT3Db8lvL3HQ9toiALiq62hcfmU/ELa2O8JwoDiZMABki
         8Azw==
X-Gm-Message-State: AOJu0Yy5KnsdbJGI/h3TeicOqN9Y7qLscdPkjOee0T0tnWBG3uIH1sMw
	O4XfxN6i1LLfiN+hC7+/eAxauEuNxV0PexLdAQE=
X-Google-Smtp-Source: AGHT+IGSgMuPNZcSb/qoRef2LT95GhuxlKDkCfgKDCNsPI99qj2VC19cSkJtgFiebD0cnCw5aDp8BA==
X-Received: by 2002:adf:ef91:0:b0:31f:f1f4:ca8b with SMTP id d17-20020adfef91000000b0031ff1f4ca8bmr16220473wro.40.1697008643069;
        Wed, 11 Oct 2023 00:17:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v26-20020a5d591a000000b0030ada01ca78sm14562733wrd.10.2023.10.11.00.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:17:22 -0700 (PDT)
Date: Wed, 11 Oct 2023 10:17:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>,
	linux-fsdevel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	bernd.schubert@fastmail.fm, miklos@szeredi.hu, dsingh@ddn.com,
	Bernd Schubert <bschubert@ddn.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 4/7] vfs: Optimize atomic_open() on positive dentry
Message-ID: <f1b371ce-9fa7-4d1c-bcad-968d1706ac99@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920173445.3943581-5-bschubert@ddn.com>

Hi Bernd,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-fuse_create_open/20230921-013805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git for-next
patch link:    https://lore.kernel.org/r/20230920173445.3943581-5-bschubert%40ddn.com
patch subject: [PATCH v9 4/7] vfs: Optimize atomic_open() on positive dentry
config: i386-randconfig-141-20230927 (https://download.01.org/0day-ci/archive/20231011/202310111259.WGjXat6p-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111259.WGjXat6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310111259.WGjXat6p-lkp@intel.com/

New smatch warnings:
fs/namei.c:3418 atomic_revalidate_open() warn: variable dereferenced before check 'got_write' (see line 3414)

Old smatch warnings:
fs/namei.c:1573 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1658 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2189 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:2600 __kern_path_locked() warn: inconsistent returns '&path->dentry->d_inode->i_rwsem'.
fs/namei.c:3480 lookup_open() error: uninitialized symbol 'error'.

vim +/got_write +3418 fs/namei.c

0bb53ce89df211 Bernd Schubert 2023-09-20  3391  static struct dentry *atomic_revalidate_open(struct dentry *dentry,
0bb53ce89df211 Bernd Schubert 2023-09-20  3392  					     struct nameidata *nd,
0bb53ce89df211 Bernd Schubert 2023-09-20  3393  					     struct file *file,
0bb53ce89df211 Bernd Schubert 2023-09-20  3394  					     const struct open_flags *op,
0bb53ce89df211 Bernd Schubert 2023-09-20  3395  					     bool *got_write)
0bb53ce89df211 Bernd Schubert 2023-09-20  3396  {
0bb53ce89df211 Bernd Schubert 2023-09-20  3397  	struct mnt_idmap *idmap;
0bb53ce89df211 Bernd Schubert 2023-09-20  3398  	struct dentry *dir = nd->path.dentry;
0bb53ce89df211 Bernd Schubert 2023-09-20  3399  	struct inode *dir_inode = dir->d_inode;
0bb53ce89df211 Bernd Schubert 2023-09-20  3400  	int open_flag = op->open_flag;
0bb53ce89df211 Bernd Schubert 2023-09-20  3401  	umode_t mode = op->mode;
0bb53ce89df211 Bernd Schubert 2023-09-20  3402  
0bb53ce89df211 Bernd Schubert 2023-09-20  3403  	if (unlikely(IS_DEADDIR(dir_inode)))
0bb53ce89df211 Bernd Schubert 2023-09-20  3404  		return ERR_PTR(-ENOENT);
0bb53ce89df211 Bernd Schubert 2023-09-20  3405  
0bb53ce89df211 Bernd Schubert 2023-09-20  3406  	file->f_mode &= ~FMODE_CREATED;
0bb53ce89df211 Bernd Schubert 2023-09-20  3407  
0bb53ce89df211 Bernd Schubert 2023-09-20  3408  	if (unlikely(open_flag & O_CREAT)) {
0bb53ce89df211 Bernd Schubert 2023-09-20  3409  		WARN_ON(1);
0bb53ce89df211 Bernd Schubert 2023-09-20  3410  		return ERR_PTR(-EINVAL);
0bb53ce89df211 Bernd Schubert 2023-09-20  3411  	}
0bb53ce89df211 Bernd Schubert 2023-09-20  3412  
0bb53ce89df211 Bernd Schubert 2023-09-20  3413  	if (open_flag & (O_TRUNC | O_WRONLY | O_RDWR))
0bb53ce89df211 Bernd Schubert 2023-09-20 @3414  		*got_write = !mnt_want_write(nd->path.mnt);

Dereferenced

0bb53ce89df211 Bernd Schubert 2023-09-20  3415  	else
0bb53ce89df211 Bernd Schubert 2023-09-20  3416  		*got_write = false;

Here too.

0bb53ce89df211 Bernd Schubert 2023-09-20  3417  
0bb53ce89df211 Bernd Schubert 2023-09-20 @3418  	if (!got_write)

Checked too late.  But I think maybe it was supposed to check
if (!*got_write)?

0bb53ce89df211 Bernd Schubert 2023-09-20  3419  		open_flag &= ~O_TRUNC;
0bb53ce89df211 Bernd Schubert 2023-09-20  3420  
0bb53ce89df211 Bernd Schubert 2023-09-20  3421  	inode_lock_shared(dir->d_inode);
0bb53ce89df211 Bernd Schubert 2023-09-20  3422  	dentry = atomic_open(nd, dentry, file, open_flag, mode);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

