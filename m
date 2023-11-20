Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6F14A99
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpC0WWZ3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40790b0a224so13527215e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700479882; x=1701084682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4KNEt5I1ZtkPToMD8d2NEwITwgnPqvD6+p6NguzcVqQ=;
        b=dpC0WWZ3dA1PBJJ5YBrZW24/qGk04MVgvDe5ZEH+8XQ3x7bJ9pFy4RyyRXqNuL03no
         9sSmpn6VdZspiqbugJ8VzlAsF+skiWWR/1TNE7+1LE2gEeqDqEhlvleBFqIBl4g3QNrv
         OIE3FRdhUa5lQVQDdy8Rp/ss3AYH2V9FcaSHKS78AqQl5HnEEEWwMd0vluf/eNFR9xh9
         BKDGh+elE793MljduiDnQhNiNT6xdYT99xysou4eDPBHfEUZ7RjF3W4jG5uGCBd5h+Qi
         IOklPc20o4SAZc7EXE/633pRGVx57qPFtMJ7Vkr7TAefGfEYuRQRYNFuLPv+Es61LBs5
         4QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700479882; x=1701084682;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KNEt5I1ZtkPToMD8d2NEwITwgnPqvD6+p6NguzcVqQ=;
        b=As1m09xisviQbXTUa2y3ioO8WVagGBbAA5fir5WQGFjGYdi71tKeLfeHJZ54Pm/ssF
         zVnRxh8ZeeEsFKFvcBPdT7FBeWXy5Zt6uNxI/g51ojm+mWHx6++HDtNvXDaLUzIbeWci
         lP+ojIOZ6+K2kFQx7vRdBjHcCElkc/OEGUVcvB2+zXKw5oJHjXk5KFIpNHsGvtGqUzMC
         WTFGRbe3wlEM089ZmwGJKUrYjR+Cy1YDHeRX/gq42TDts7gDFuRlOXH5lOa/FhRfFR2r
         ZMwZUnUygjEpEg3pZvRO9BaYruT5fOxIppY27xxFeQIx1GlZiwbOPpNpspTPL6UahVEy
         5X5w==
X-Gm-Message-State: AOJu0Yz6sD4Sw+UhlVdLPukEcUc5PV2XnZL4AC6NXpcvJED8xz9rdrFH
	fPffe7wyiMKUV0id/9/ahDGkK6glC7fhuw79n9g=
X-Google-Smtp-Source: AGHT+IGV9nwmrpO82YyxRsAgO5AMe/MOgSLUJJqDmB+XqcoiDICMqgHg2MbPcYkt4WTCYdAoOCqRSA==
X-Received: by 2002:a05:600c:4587:b0:40a:437e:30fe with SMTP id r7-20020a05600c458700b0040a437e30femr6074667wmo.24.1700479881994;
        Mon, 20 Nov 2023 03:31:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c30d400b004060f0a0fdbsm17178337wmn.41.2023.11.20.03.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 03:31:21 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 06:31:18 -0500
To: oe-kbuild@lists.linux.dev, Johannes Berg <johannes@sipsolutions.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] debugfs: fix automount d_fsdata usage
Message-ID: <5c59da09-c04a-4727-9265-58976ac13a45@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109222251.9e54cb55c700.I64fe5615568e87f9ae2d7fb2ac4e5fa96924cb50@changeid>

Hi Johannes,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/debugfs-fix-automount-d_fsdata-usage/20231110-054024
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20231109222251.9e54cb55c700.I64fe5615568e87f9ae2d7fb2ac4e5fa96924cb50%40changeid
patch subject: [RFC PATCH 1/6] debugfs: fix automount d_fsdata usage
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110653.cItFLCy6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110653.cItFLCy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110653.cItFLCy6-lkp@intel.com/

New smatch warnings:
fs/debugfs/inode.c:655 debugfs_create_automount() warn: possible memory leak of 'fsd'

vim +/fsd +655 fs/debugfs/inode.c

77b3da6e3232d3 Al Viro            2015-01-25  633  struct dentry *debugfs_create_automount(const char *name,
77b3da6e3232d3 Al Viro            2015-01-25  634  					struct dentry *parent,
93faccbbfa958a Eric W. Biederman  2017-02-01  635  					debugfs_automount_t f,
77b3da6e3232d3 Al Viro            2015-01-25  636  					void *data)
77b3da6e3232d3 Al Viro            2015-01-25  637  {
77b3da6e3232d3 Al Viro            2015-01-25  638  	struct dentry *dentry = start_creating(name, parent);
3e1dead436f419 Johannes Berg      2023-11-09  639  	struct debugfs_fsdata *fsd;
77b3da6e3232d3 Al Viro            2015-01-25  640  	struct inode *inode;
77b3da6e3232d3 Al Viro            2015-01-25  641  
77b3da6e3232d3 Al Viro            2015-01-25  642  	if (IS_ERR(dentry))
ff9fb72bc07705 Greg Kroah-Hartman 2019-01-23  643  		return dentry;
77b3da6e3232d3 Al Viro            2015-01-25  644  
3e1dead436f419 Johannes Berg      2023-11-09  645  	fsd = kzalloc(sizeof(*fsd), GFP_KERNEL);
3e1dead436f419 Johannes Berg      2023-11-09  646  	if (!fsd) {
3e1dead436f419 Johannes Berg      2023-11-09  647  		failed_creating(dentry);
3e1dead436f419 Johannes Berg      2023-11-09  648  		return ERR_PTR(-ENOMEM);
3e1dead436f419 Johannes Berg      2023-11-09  649  	}
3e1dead436f419 Johannes Berg      2023-11-09  650  
3e1dead436f419 Johannes Berg      2023-11-09  651  	fsd->automount = f;
3e1dead436f419 Johannes Berg      2023-11-09  652  
a24c6f7bc923d5 Peter Enderborg    2020-07-16  653  	if (!(debugfs_allow & DEBUGFS_ALLOW_API)) {
a24c6f7bc923d5 Peter Enderborg    2020-07-16  654  		failed_creating(dentry);
a24c6f7bc923d5 Peter Enderborg    2020-07-16 @655  		return ERR_PTR(-EPERM);

kfree(fsd);

a24c6f7bc923d5 Peter Enderborg    2020-07-16  656  	}
a24c6f7bc923d5 Peter Enderborg    2020-07-16  657  
77b3da6e3232d3 Al Viro            2015-01-25  658  	inode = debugfs_get_inode(dentry->d_sb);
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  659  	if (unlikely(!inode)) {
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  660  		pr_err("out of free dentries, can not create automount '%s'\n",
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  661  		       name);
77b3da6e3232d3 Al Viro            2015-01-25  662  		return failed_creating(dentry);
43e23b6c0b0151 Greg Kroah-Hartman 2019-07-03  663  	}
77b3da6e3232d3 Al Viro            2015-01-25  664  
87243deb88671f Seth Forshee       2016-03-09  665  	make_empty_dir_inode(inode);
77b3da6e3232d3 Al Viro            2015-01-25  666  	inode->i_flags |= S_AUTOMOUNT;
77b3da6e3232d3 Al Viro            2015-01-25  667  	inode->i_private = data;
3e1dead436f419 Johannes Berg      2023-11-09  668  	dentry->d_fsdata = fsd;
a8f324a46fbe54 Roman Pen          2016-02-09  669  	/* directory inodes start off with i_nlink == 2 (for "." entry) */
a8f324a46fbe54 Roman Pen          2016-02-09  670  	inc_nlink(inode);
77b3da6e3232d3 Al Viro            2015-01-25  671  	d_instantiate(dentry, inode);
a8f324a46fbe54 Roman Pen          2016-02-09  672  	inc_nlink(d_inode(dentry->d_parent));
a8f324a46fbe54 Roman Pen          2016-02-09  673  	fsnotify_mkdir(d_inode(dentry->d_parent), dentry);
77b3da6e3232d3 Al Viro            2015-01-25  674  	return end_creating(dentry);
77b3da6e3232d3 Al Viro            2015-01-25  675  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

