Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3A110F9
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Aug 2023 05:22:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so9389005e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 22:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691731335; x=1692336135;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=StJM37uFj72EuXJh2kG0KxSwjqIa9z/OGCpOOCONA2I=;
        b=Y/MCMjfJLRhywtm49Ji6G4VMq5lQyGggCUkipSlLu7DOy/6vVgwfYnK6y8HCoxm5SJ
         mz9ESQBT3r3h67PHbUoGSCDymBQa0M3UJGMd6bJ4x3rYnsgVGoSITkZ7cxsofSbhtPUn
         Q0GqTYJtjPXiXcjmbW1qbrV8CrS7jS4AVmBPTlMPQV4gJiGRyWkST9J8h726W+fvWPQr
         tli9Oqa9Hv8ft2V7vzmW5xccNHUPxGYSwN/lSjZkOacuhOiaiLEpV01grEY7V05K5k+g
         h7FWrL/uY9H2ZM/YIjlazRB2h3tm5fBLzTS1YaZfceC+l6Z/lT7W4Chy5Ugv5jqMdywN
         1uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691731335; x=1692336135;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=StJM37uFj72EuXJh2kG0KxSwjqIa9z/OGCpOOCONA2I=;
        b=WSHLGe/X7cT3yCku48GBQCCVpAt85RsTHw3KgdQk9nefg21W/v/jPJqfsbPfn8x6vC
         HGRfk8s54VaRpZ9KlAcLyXJNaancvZ8xU29qHZIs1y2yEDw4SjziafUfXwhCUpb0+rDp
         c4VWkQm8zBhYKKELEg74unjmalxNwmSjLEfaBvEUbNUL1XGmJlgbzUolUg9msqOL+65+
         4L31zcPcwRoWBygXPZnhqyPy21w0ubVcYkk8a0ZaiCx7OvKdOW/aYJw/BLJrjWs0gaz4
         ClyxBu587rtEF6TbitGyOazxBqS/qiENBWTUe4c7ThyVv3Q54OZjpSQy4IRQ8NjmBV8l
         XF0Q==
X-Gm-Message-State: AOJu0YzYqptgnYNBxznXE9qDVOePmtHtHJjzUF9slUXqDii2yhspImJW
	2Ax/qyRssD7US1kzPXWzxMTocxUSEySs8Btsk6Y=
X-Google-Smtp-Source: AGHT+IG31LqdKcwnOwbM7Nxv4m2eqFLZanC0bafMRwubi2NujsCgdrd38Gp+WD5SbKJdF+aej/LmJA==
X-Received: by 2002:a7b:cc91:0:b0:3fe:163e:d6a5 with SMTP id p17-20020a7bcc91000000b003fe163ed6a5mr666771wma.4.1691731334796;
        Thu, 10 Aug 2023 22:22:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t15-20020a7bc3cf000000b003fe601a7d46sm6918652wmj.45.2023.08.10.22.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 22:22:14 -0700 (PDT)
Date: Fri, 11 Aug 2023 08:22:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 36/42] fs/configfs/inode.c:189
 configfs_create() error: we previously assumed 'sd_parent' could be null
 (see line 182)
Message-ID: <9f4729a7-f1ce-4c93-b156-7872835c5f2a@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   49642342732c55841e454f874f36062a1a64e0dd
commit: 6570cb0654b65ea2dbe52c1c0f2590e338d9ab7e [36/42] FIXUP: CHROMIUM: configfs: inherit file and directory owners
config: arc-randconfig-m041-20230811 (https://download.01.org/0day-ci/archive/20230811/202308110932.apiJRvXa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110932.apiJRvXa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308110932.apiJRvXa-lkp@intel.com/

smatch warnings:
fs/configfs/inode.c:189 configfs_create() error: we previously assumed 'sd_parent' could be null (see line 182)

vim +/sd_parent +189 fs/configfs/inode.c

2743c515a1239b Al Viro          2019-09-11  157  struct inode *configfs_create(struct dentry *dentry, umode_t mode)
7063fbf2261194 Joel Becker      2005-12-15  158  {
7063fbf2261194 Joel Becker      2005-12-15  159  	struct inode *inode = NULL;
16d13b59b5b85e Al Viro          2012-03-17  160  	struct configfs_dirent *sd;
16d13b59b5b85e Al Viro          2012-03-17  161  	struct inode *p_inode;
e5e090ca97600b Daniel Rosenberg 2018-03-15  162  	struct dentry *parent;
16d13b59b5b85e Al Viro          2012-03-17  163  
16d13b59b5b85e Al Viro          2012-03-17  164  	if (!dentry)
2743c515a1239b Al Viro          2019-09-11  165  		return ERR_PTR(-ENOENT);
16d13b59b5b85e Al Viro          2012-03-17  166  
2b0143b5c986be David Howells    2015-03-17  167  	if (d_really_is_positive(dentry))
2743c515a1239b Al Viro          2019-09-11  168  		return ERR_PTR(-EEXIST);
16d13b59b5b85e Al Viro          2012-03-17  169  
16d13b59b5b85e Al Viro          2012-03-17  170  	sd = dentry->d_fsdata;
e5e090ca97600b Daniel Rosenberg 2018-03-15  171  	parent = dget_parent(dentry);
e5e090ca97600b Daniel Rosenberg 2018-03-15  172  	if (parent && !sd->s_iattr) {
6570cb0654b65e Tzung-Bi Shih    2023-08-09  173  		struct configfs_dirent *sd_parent = parent->d_fsdata;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  174  
6570cb0654b65e Tzung-Bi Shih    2023-08-09  175  		sd->s_iattr = kzalloc(sizeof(struct iattr), GFP_KERNEL);
36caf34d422a0c Tzung-Bi Shih    2023-08-09  176  		if (!sd->s_iattr) {
36caf34d422a0c Tzung-Bi Shih    2023-08-09  177  			dput(parent);
e5e090ca97600b Daniel Rosenberg 2018-03-15  178  			return ERR_PTR(-ENOMEM);
e5e090ca97600b Daniel Rosenberg 2018-03-15  179  		}
6570cb0654b65e Tzung-Bi Shih    2023-08-09  180  
6570cb0654b65e Tzung-Bi Shih    2023-08-09  181  		sd->s_iattr->ia_mode = sd->s_mode;
6570cb0654b65e Tzung-Bi Shih    2023-08-09 @182  		if (sd_parent && sd_parent->s_iattr) {
                                                                    ^^^^^^^^^
this assumes sd_parent can be NULL

6570cb0654b65e Tzung-Bi Shih    2023-08-09  183  			sd->s_iattr->ia_uid = sd_parent->s_iattr->ia_uid;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  184  			sd->s_iattr->ia_gid = sd_parent->s_iattr->ia_gid;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  185  		} else {
6570cb0654b65e Tzung-Bi Shih    2023-08-09  186  			sd->s_iattr->ia_uid = GLOBAL_ROOT_UID;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  187  			sd->s_iattr->ia_gid = GLOBAL_ROOT_GID;
6570cb0654b65e Tzung-Bi Shih    2023-08-09  188  		}
6570cb0654b65e Tzung-Bi Shih    2023-08-09 @189  		if (sd_parent->s_dentry && d_inode(sd_parent->s_dentry))
                                                                    ^^^^^^^^^^^^^^^^^^^
unchecked dereference

6570cb0654b65e Tzung-Bi Shih    2023-08-09  190  			sd->s_iattr->ia_ctime = current_time(d_inode(sd_parent->s_dentry));
6570cb0654b65e Tzung-Bi Shih    2023-08-09  191  		else
6570cb0654b65e Tzung-Bi Shih    2023-08-09  192  			ktime_get_coarse_real_ts64(&sd->s_iattr->ia_ctime);
6570cb0654b65e Tzung-Bi Shih    2023-08-09  193  		sd->s_iattr->ia_atime = sd->s_iattr->ia_mtime = sd->s_iattr->ia_ctime;
36caf34d422a0c Tzung-Bi Shih    2023-08-09  194  	}
e5e090ca97600b Daniel Rosenberg 2018-03-15  195  	dput(parent);
16d13b59b5b85e Al Viro          2012-03-17  196  	inode = configfs_new_inode(mode, sd, dentry->d_sb);
16d13b59b5b85e Al Viro          2012-03-17  197  	if (!inode)
2743c515a1239b Al Viro          2019-09-11  198  		return ERR_PTR(-ENOMEM);
16d13b59b5b85e Al Viro          2012-03-17  199  
2b0143b5c986be David Howells    2015-03-17  200  	p_inode = d_inode(dentry->d_parent);
c2050a454c7f12 Deepa Dinamani   2016-09-14  201  	p_inode->i_mtime = p_inode->i_ctime = current_time(p_inode);
e74cc06df3b05e Louis Rilling    2009-01-28  202  	configfs_set_inode_lock_class(sd, inode);
2743c515a1239b Al Viro          2019-09-11  203  	return inode;
7063fbf2261194 Joel Becker      2005-12-15  204  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

