Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388B134CE
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYl0Rcda"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c5210a1515so64181061fa.0
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 00:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698131492; x=1698736292; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzPKTIMRHpKvzKLVJ+54o1Xr908wt85KHRoRpuUteu8=;
        b=rYl0RcdaChBpzzfQmtSpt44je2wtoasSbIkevVVuc1c+UDK1FxVIcGbTFikPhUqUB3
         JAulBSGwrLkk0mLS1pudcFO51GvXRGFgBVYf/DNyJo7byIPhr92N8WsLnRMlWxD8xRer
         Hf1Pyr9v7kBuuJZCwKnxa/jmbXpaMaPTpXoxb3yoIlaPLS5ZDHFSRfpUODXVrsIocr4x
         yD+sJlvPAwKuaQsQfOanwaPfpd2WQx4p08yqyjIU2XiisWadvmxs4118byM3+L5hyHEu
         YHnqONExF+uWyE9WAzrCjM4gTO4hwS9SOXw7BkxXd1+LabPAk06uBwojZkK/ez0njsBF
         0FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698131492; x=1698736292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzPKTIMRHpKvzKLVJ+54o1Xr908wt85KHRoRpuUteu8=;
        b=qAqf4fDVpXh3+EeWBgVfi/+JvP2IF5HfOiOwWapK6Yd/LrylBrHxDxx1gYv6h5iBc0
         paknIPYnz7n9zWrzeGYLvCEmX5NmhTsJxmai3QYwv9BPA6c5KQAoy0D6AqXm/AMjqFan
         mzRbg1rBodpDaAWDTX2kzh8PKbxw/htAs6o+jP+uwdl6Jw8C1e7D3e2aEAtHKB3+7Thh
         NyvyxA9n5Su4kFsJNbjiOd60m/sBdFUVR0aEBaN4x8vqKXXkwfkuUyy+CdOSkL9r0IYj
         dptFbOdFk2hgzcvkzJisif+LhNpvrD/bzt4IHUECwgFwSUcd+PofPwwmm6yFigwaw2bF
         avmw==
X-Gm-Message-State: AOJu0YzuSW0TCb0LO2DHxgMQqI9uTpHq03SYhMo32r8WqxbfsUZ0hJRg
	a2TEp6Ddx3Xj+2pUlLzwT8cLE5l3SE4Ora6K5UE=
X-Google-Smtp-Source: AGHT+IEOLm6bDOnxKrH+RuTGlEg1h/YTehZwg+JzooCp/KI/JGztHcMSsPMz/5+Im16ysGl6NGXUtQ==
X-Received: by 2002:a2e:3c03:0:b0:2c5:2357:be98 with SMTP id j3-20020a2e3c03000000b002c52357be98mr8082742lja.44.1698131492432;
        Tue, 24 Oct 2023 00:11:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l21-20020a056000023500b003198a9d758dsm9346924wrz.78.2023.10.24.00.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 00:11:32 -0700 (PDT)
Date: Tue, 24 Oct 2023 10:11:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 25/29] fs/fuse/passthrough.c:204
 fuse_passthrough_setup() error: uninitialized symbol 'fb'.
Message-ID: <beeab035-1c63-4f30-9d74-52af747b7905@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   c4564efb86b4d078be40ef2bc3c09eacece9d05e
commit: cf5bd4ebed653b0e21f85958466f41fd6c869710 [25/29] fuse: implement ioctls to manage backing files
config: x86_64-randconfig-161-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220943.UJd8HSEP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220943.UJd8HSEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310220943.UJd8HSEP-lkp@intel.com/

smatch warnings:
fs/fuse/passthrough.c:204 fuse_passthrough_setup() error: uninitialized symbol 'fb'.

vim +/fb +204 fs/fuse/passthrough.c

cf5bd4ebed653b Amir Goldstein 2023-09-11  169  void fuse_passthrough_setup(struct file *file, int backing_id)
cf5bd4ebed653b Amir Goldstein 2023-09-11  170  {
cf5bd4ebed653b Amir Goldstein 2023-09-11  171  	struct fuse_file *ff = file->private_data;
cf5bd4ebed653b Amir Goldstein 2023-09-11  172  	struct fuse_conn *fc = ff->fm->fc;
cf5bd4ebed653b Amir Goldstein 2023-09-11  173  	struct fuse_backing *fb;
cf5bd4ebed653b Amir Goldstein 2023-09-11  174  	struct file *backing_file;
cf5bd4ebed653b Amir Goldstein 2023-09-11  175  	int err;
cf5bd4ebed653b Amir Goldstein 2023-09-11  176  
cf5bd4ebed653b Amir Goldstein 2023-09-11  177  	err = -EINVAL;
cf5bd4ebed653b Amir Goldstein 2023-09-11  178  	if (backing_id <= 0)
cf5bd4ebed653b Amir Goldstein 2023-09-11  179  		goto out;

fb not initialized on this path

cf5bd4ebed653b Amir Goldstein 2023-09-11  180  
cf5bd4ebed653b Amir Goldstein 2023-09-11  181  	rcu_read_lock();
cf5bd4ebed653b Amir Goldstein 2023-09-11  182  	fb = idr_find(&fc->backing_files_map, backing_id);
cf5bd4ebed653b Amir Goldstein 2023-09-11  183  	fb = fuse_backing_get(fb);
cf5bd4ebed653b Amir Goldstein 2023-09-11  184  	rcu_read_unlock();
cf5bd4ebed653b Amir Goldstein 2023-09-11  185  
cf5bd4ebed653b Amir Goldstein 2023-09-11  186  	err = -ENOENT;
cf5bd4ebed653b Amir Goldstein 2023-09-11  187  	if (!fb)
cf5bd4ebed653b Amir Goldstein 2023-09-11  188  		goto out;
cf5bd4ebed653b Amir Goldstein 2023-09-11  189  
cf5bd4ebed653b Amir Goldstein 2023-09-11  190  	/* Allocate backing file per fuse file to store fuse path */
cf5bd4ebed653b Amir Goldstein 2023-09-11  191  	backing_file = backing_file_open(&file->f_path, file->f_flags,
cf5bd4ebed653b Amir Goldstein 2023-09-11  192  					 &fb->file->f_path, fb->cred);
cf5bd4ebed653b Amir Goldstein 2023-09-11  193  	err = PTR_ERR(backing_file);
cf5bd4ebed653b Amir Goldstein 2023-09-11  194  	if (IS_ERR(backing_file))
cf5bd4ebed653b Amir Goldstein 2023-09-11  195  		goto out;
cf5bd4ebed653b Amir Goldstein 2023-09-11  196  
cf5bd4ebed653b Amir Goldstein 2023-09-11  197  	err = 0;
cf5bd4ebed653b Amir Goldstein 2023-09-11  198  	ff->passthrough = backing_file;
cf5bd4ebed653b Amir Goldstein 2023-09-11  199  	ff->cred = get_cred(fb->cred);
cf5bd4ebed653b Amir Goldstein 2023-09-11  200  out:
cf5bd4ebed653b Amir Goldstein 2023-09-11  201  	pr_debug("%s: backing_id=%d, fb=0x%p, backing_file=0x%p, err=%i\n", __func__,
cf5bd4ebed653b Amir Goldstein 2023-09-11  202  		 backing_id, fb, ff->passthrough, err);
                                                                     ^^
Uninitialized

cf5bd4ebed653b Amir Goldstein 2023-09-11  203  
cf5bd4ebed653b Amir Goldstein 2023-09-11 @204  	fuse_backing_put(fb);
cf5bd4ebed653b Amir Goldstein 2023-09-11  205  	if (!ff->passthrough)
cf5bd4ebed653b Amir Goldstein 2023-09-11  206  		ff->open_flags &= ~FOPEN_PASSTHROUGH;
cf5bd4ebed653b Amir Goldstein 2023-09-11  207  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

