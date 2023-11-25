Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AD53A8
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 06:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K9DE1EzN"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40839652b97so17560895e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 22:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700895588; x=1701500388; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jv56Dw/13rdERqX56wyZWfTEhu+Zdb+87UC8Y/SSDI=;
        b=K9DE1EzNzhH+wG8pUpdRFQo+smtzK+DTyZnR8SgfCY3EDF5Zm2z+37R5q/gxwRKND0
         61lKl3NlpxyFwsS7v7OtXdd05pwHavorE/EtUV7Nz/yyLSr3Zwlx0eJ0T9t/pAkTI8fX
         mgiGYOrPFMN62X1Jh12moNOAq2jT6D0bLkD2hACuJym7U//LTKiq1FposIPHouNxZutj
         WIzI8OdDna2HwoiqOygVqHOmvCNvut6icvrnwEkhG8ZV7l7uUtPWTMiee5nZW6Jqj18p
         5HXCOO3u5p82z8O/wO9nN36cRi6olRouV/pVpOJS9YWqfGV/iwTogVhV+uy1vQgR8sM7
         nmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700895588; x=1701500388;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jv56Dw/13rdERqX56wyZWfTEhu+Zdb+87UC8Y/SSDI=;
        b=uZQL/sV1aw9jLQGRZOHB6C2veQrWEjtar4eMQC4XxnNa7PJYDaNLehWCSWNkBqettM
         UD4Uz2POGQ9DrCZxo56RsIchKg7tb66XOGwI0yaGAVqegW/E4NQY/bCWIimBHPw+rzoN
         IIbiyu3/082sAPW+ckJemN2bDjeTnC4wrQfLcRSLzerI1srP5wgmFXlN+D0Nb9MUIPMU
         mLlumkjLMGD5ry6misp+wVkgK79/dWi/896WJISVWSSz/2iUX9SKyZA/VhJNqs3BzWUQ
         VWEESQecEJa+Qi0QfCaQ7Aw9pHxJcDfvZPNoVtZbf7UMAgPGPipbJmq8AANRNbYAPAtR
         twuQ==
X-Gm-Message-State: AOJu0Yxbgpx0wDjysnhDT6ncaSjUjPA00YxcUE6g5e6G2DRhUdqpIu3B
	gXW6ltu84pUMEVgReGLen0jVqfWQIqPXuyjjXQM=
X-Google-Smtp-Source: AGHT+IE0H38nrVlmsa1+mXam7+u2KQDJktnXjDn6D3EDkxDsBXvxWXcWdOoy/SNYk/aKOMrGECN6vg==
X-Received: by 2002:a05:600c:3c82:b0:40b:3820:acf4 with SMTP id bg2-20020a05600c3c8200b0040b3820acf4mr428430wmb.3.1700895588376;
        Fri, 24 Nov 2023 22:59:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b0040a3f9862e3sm2587550wmh.1.2023.11.24.22.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 22:59:48 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 25 Nov 2023 09:59:45 +0300
To: oe-kbuild@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.dcache-misc 10/18] fs/dcache.c:2062
 __d_obtain_alias() warn: variable dereferenced before check 'inode' (see
 line 2059)
Message-ID: <c1712d34-7c60-4491-aee7-7ae9177c2c4c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.dcache-misc
head:   0695819b3988e7e4d8099f8388244c1549d230cc
commit: 8a0af412cf8ba3a000a0e00c0c5dd411b9a0fc2a [10/18] kill d_instantate_anon(), fold __d_instantiate_anon() into remaining caller
config: i386-randconfig-141-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241915.3OrRNpQB-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241915.3OrRNpQB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241915.3OrRNpQB-lkp@intel.com/

smatch warnings:
fs/dcache.c:2062 __d_obtain_alias() warn: variable dereferenced before check 'inode' (see line 2059)

vim +/inode +2062 fs/dcache.c

f9c34674bc60e5 Miklos Szeredi    2018-01-19  2057  static struct dentry *__d_obtain_alias(struct inode *inode, bool disconnected)
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2058  {
8a0af412cf8ba3 Al Viro           2023-11-18 @2059  	struct super_block *sb = inode->i_sb;
                                                                                 ^^^^^^^^^^^
Unchecked dereference

8a0af412cf8ba3 Al Viro           2023-11-18  2060  	struct dentry *new, *res;
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2061  
f9c34674bc60e5 Miklos Szeredi    2018-01-19 @2062  	if (!inode)
                                                            ^^^^^^
NULL check is too late

f9c34674bc60e5 Miklos Szeredi    2018-01-19  2063  		return ERR_PTR(-ESTALE);
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2064  	if (IS_ERR(inode))
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2065  		return ERR_CAST(inode);
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2066  
8a0af412cf8ba3 Al Viro           2023-11-18  2067  	res = d_find_any_alias(inode); /* existing alias? */
f9c34674bc60e5 Miklos Szeredi    2018-01-19  2068  	if (res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

