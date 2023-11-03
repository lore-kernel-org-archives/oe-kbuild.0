Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8EA17EA
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfNgEoln"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9dd3f4a0f5aso8842666b.1
        for <oe-kbuild@lists.linux.dev>; Thu, 02 Nov 2023 23:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698991202; x=1699596002; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZxDSdMzVCpjHsvR+qZrln4myCmxkfc2LuMbC+pvU/84=;
        b=wfNgEolnW0CYw9ZrdZTOij40WFkmfp3gzWZzzmDIVs5WpAcwLO8QUawB0636PA+LFQ
         9uenmbSRiho/j5BUe/cNA8wmBtbHCxIwje23pHYRd8uLiOhcKO1/Ye9UsG9XYZZYMpWS
         5o9xvn4Dc7csEoTKnoPYmz+xRZ8G09iFIk+OP8Z7ud5oQgp9Ko+s1xU2S9ONyXNJWhgt
         Bwc5Egf8j20OxSO/gbCweh3ArKhPuPHc7uNuNZhO+Y+yg0Pl4I3bl+FS+ZNqm4do1pRY
         0/3zDJnfS521UGg7kEmBY4wzhgr9MQ9jnAmZCEHflvYITCWZ//aSfSVw1WbBz2SRdLhZ
         Bc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698991202; x=1699596002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxDSdMzVCpjHsvR+qZrln4myCmxkfc2LuMbC+pvU/84=;
        b=PIuuikAEFoAe7Qyh0srf9tS7PgCGmb8JDzTUA4UY+yZjDMAAsxI1e2TyXXS4mUmIKq
         bCjHqlndoQfM1EkMmxuQHwLIMuOaJ//DxuwpBfPrJyjH4x3xjNFJd8m6BDPZBACN3ntw
         oFZWwJzmKhFvX15rkjp1GWpV85vNG8BlxFMuZFElduwLCA0FDGmDGm7cs0C8VzXemBe4
         Q4QOVuBJYuOZCxbcRxpghgTnec6urdvcZFolyv0zjGAUk8sZVNikRD6DkCr/gFU0Mryy
         7tWR1zZdSb6e5lnwPM+XfBGBuIn0DN7n2q0OIYpLS+mal0QpY+eDGvK0JmfHRU3sNdUq
         WziQ==
X-Gm-Message-State: AOJu0YxG2w624hMLLGlLrDwR1IVHQ58IbH86SkVmUOhqm84mD4LPWhAt
	FGAVPToTPaZ5Bqm+OqGPX5kSPsZkQqe3LF+0+Vw=
X-Google-Smtp-Source: AGHT+IETB8T1GhUXYuMPcptvFaualbInBCIx8AiSdFPyi1Gp2XP3C8B1h6EpdqwUNTo2KtbGkxL/uA==
X-Received: by 2002:a17:906:478b:b0:9c7:4e5d:12bc with SMTP id cw11-20020a170906478b00b009c74e5d12bcmr6141917ejc.51.1698991201698;
        Thu, 02 Nov 2023 23:00:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t9-20020a1709060c4900b00997c1d125fasm507494ejf.170.2023.11.02.23.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 23:00:01 -0700 (PDT)
Date: Fri, 3 Nov 2023 08:59:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: fs/bcachefs/chardev.c:391 bch2_ioctl_fs_usage() warn: check for
 integer overflow 'replica_entries_bytes'
Message-ID: <84d54213-e093-4c6e-a126-4df1253ca73d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 22502ac23a2eaa3714b77d4a9242df352a9cd0c0 bcachefs: Redo filesystem usage ioctls
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030618.5bKFt0YI-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030618.5bKFt0YI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202311030618.5bKFt0YI-lkp@intel.com/

New smatch warnings:
fs/bcachefs/chardev.c:391 bch2_ioctl_fs_usage() warn: check for integer overflow 'replica_entries_bytes'

Old smatch warnings:
fs/bcachefs/chardev.c:444 bch2_ioctl_fs_usage() warn: maybe return -EFAULT instead of the bytes remaining?
fs/bcachefs/chardev.c:524 bch2_ioctl_read_super() warn: maybe return -EFAULT instead of the bytes remaining?

vim +/replica_entries_bytes +391 fs/bcachefs/chardev.c

22502ac23a2eaa Kent Overstreet 2019-12-16  375  static long bch2_ioctl_fs_usage(struct bch_fs *c,
22502ac23a2eaa Kent Overstreet 2019-12-16  376  				struct bch_ioctl_fs_usage __user *user_arg)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  377  {
22502ac23a2eaa Kent Overstreet 2019-12-16  378  	struct bch_ioctl_fs_usage *arg = NULL;
22502ac23a2eaa Kent Overstreet 2019-12-16  379  	struct bch_replicas_usage *dst_e, *dst_end;
22502ac23a2eaa Kent Overstreet 2019-12-16  380  	struct bch_fs_usage_online *src;
22502ac23a2eaa Kent Overstreet 2019-12-16  381  	u32 replica_entries_bytes;
22502ac23a2eaa Kent Overstreet 2019-12-16  382  	unsigned i;
22502ac23a2eaa Kent Overstreet 2019-12-16  383  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  384  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  385  	if (!test_bit(BCH_FS_STARTED, &c->flags))
1c6fdbd8f2465d Kent Overstreet 2017-03-16  386  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  387  
22502ac23a2eaa Kent Overstreet 2019-12-16  388  	if (get_user(replica_entries_bytes, &user_arg->replica_entries_bytes))

This comes from the user.

1c6fdbd8f2465d Kent Overstreet 2017-03-16  389  		return -EFAULT;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  390  
22502ac23a2eaa Kent Overstreet 2019-12-16 @391  	arg = kzalloc(sizeof(*arg) + replica_entries_bytes, GFP_KERNEL);

This can lead to an integer overflow on 32 bit systems.

This API is a bit problematice because we don't ensure that sizeof()
bytes is divisible by sizeof(struct bch_replicas_usage).  Use
struct_size() or size_add() to fix the integer overflow.

22502ac23a2eaa Kent Overstreet 2019-12-16  392  	if (!arg)
22502ac23a2eaa Kent Overstreet 2019-12-16  393  		return -ENOMEM;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  394  
22502ac23a2eaa Kent Overstreet 2019-12-16  395  	src = bch2_fs_usage_read(c);
22502ac23a2eaa Kent Overstreet 2019-12-16  396  	if (!src) {
22502ac23a2eaa Kent Overstreet 2019-12-16  397  		ret = -ENOMEM;
22502ac23a2eaa Kent Overstreet 2019-12-16  398  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  399  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  400  
22502ac23a2eaa Kent Overstreet 2019-12-16  401  	arg->capacity		= c->capacity;
22502ac23a2eaa Kent Overstreet 2019-12-16  402  	arg->used		= bch2_fs_sectors_used(c, src);
22502ac23a2eaa Kent Overstreet 2019-12-16  403  	arg->online_reserved	= src->online_reserved;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

