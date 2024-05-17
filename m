Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1313A29B
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715943698; cv=none; b=a1JeOlMk5pS9Trg8zfvM/ed9Z1XQiYm7EYGoIIUYSSTS3Q3ACQ9Qf7tc9N38EEmZaqEl06EVpLfZaEcWjBQ17mGnuPf4uoxXAsdxRYswI7JFPJsYB/EJDomlTrJ3Iaxb1e+npm5LgF5DXS/kU0TiPFXe6aa52TeDsMnj55MZRtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715943698; c=relaxed/simple;
	bh=tVRF4RaYBVX+KzaS74RJYVtbLqfxhP6c/vZtg/ARxG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=aoFV6uKHGFcU6/3M4QH+vPmC95bvX+PI84JJyxJ0PgeGVq/A07vrrwDMyn5tuSLLVVk7Dq9aMXvQ6x/wYaHu/17uu7bKJ0R+BISdDOWLiirlycl/dOdnan3KL9uTb3TBwexyahvY3sFMkBWE/K6khzlJFTj8JDnwvXkMGwQxu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPIwF1yb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPIwF1yb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5727dc6d3edso4754877a12.0
        for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715943694; x=1716548494; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8VnQm4Wzd0jj3I6yb4jC8r7D5oR7hIr9rTTosx/fIZs=;
        b=ZPIwF1yb1HlXUAW+8uCX+9jc1M/5yF3Sedf5CLaKjzcljO7cLScE1To/bH0jtjy/9x
         9eCN0QoyNZocRVFNxFM0Tja0FbSLzK86YYO2SSEnfC3wtDafpDwciFTXbELCGcumzpE8
         h0ZVPRc2Giz+LYTdTkCZtX2lG2x33cHDuNYOWwzB/HDiXYN8VJPDF39b8HTaYmMc5UeH
         VQFOSAsaR183GGQmmKDqTJbi+p6EUvL/l/vNMxbT8VzN/w5B+/mCoHMATYPOEZdzXYHB
         tot1ePQIreIsCzKh5iAh8pzHL6I7UdgLJDnmeKecNzzTCuDZMLM5ZI2FS0xX6tpEI4lV
         u1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715943694; x=1716548494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VnQm4Wzd0jj3I6yb4jC8r7D5oR7hIr9rTTosx/fIZs=;
        b=WE6/w4YmKqyeBNUYZYC0PSPmRX9wC9Ut3fxnSq+YuJ7zhh7Uxk/ypM183/u6YakLx7
         3xuwzfwagOtDwil7+lKyKzxat0ZOkhftNGoSFVxPZwjzR+KqQv0swbAXMAcgbQGHSSmA
         MTRLzU4CplqWVdUXP3yXjI2pmxo5I9Oao3xaVGw+7PxcxG3ZTUUnwkm8EORin+EOUHRx
         eG7ELNgKtE5lHQg8qpIiv+PkkepPVwuiYIS8Shoxs1M7uNf0wSM7NloAGfOlMnD1DokZ
         Ezg04Er8fiSngWNDktB3F/AEE+lGfucWJNwK5hCMUNuIrYSg6pIVWXLByQY/SOhUWPg3
         tqrA==
X-Gm-Message-State: AOJu0Yx33z5Od4XH9Zd6+IPa29pIEPX4/Clxt0CfuePmilOXAesPcMT6
	agBtd7vH5eZegEV8RoDcTkvVM/r80Tq5Cssgg/nN3Gdu7hhHI/irErX2+iMHI0QybupUbJQIyzl
	1
X-Google-Smtp-Source: AGHT+IGo0vF44PU8Flj2L8GcXH3uM02w5tyFNQ9qE8+bL2lhGta8EhoiS+njX2Y3R8ShLB5wWk0tPw==
X-Received: by 2002:a17:906:8315:b0:a5a:d6c:a30b with SMTP id a640c23a62f3a-a5a2d65f265mr1511949966b.58.1715943694164;
        Fri, 17 May 2024 04:01:34 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01968sm1108799366b.166.2024.05.17.04.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 04:01:33 -0700 (PDT)
Date: Fri, 17 May 2024 13:01:31 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hongbo Li <lihongbo22@huawei.com>,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	lihongbo22@huawei.com
Subject: Re: [PATCH] hostfs: convert hostfs to use the new mount api
Message-ID: <d845ba1a-2b10-4d83-a687-56406ce657c9@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240513124141.3788846-1-lihongbo22@huawei.com>

Hi Hongbo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/hostfs-convert-hostfs-to-use-the-new-mount-api/20240513-204233
base:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20240513124141.3788846-1-lihongbo22%40huawei.com
patch subject: [PATCH] hostfs: convert hostfs to use the new mount api
config: um-randconfig-r081-20240517 (https://download.01.org/0day-ci/archive/20240517/202405171154.21q42SWy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405171154.21q42SWy-lkp@intel.com/

smatch warnings:
fs/hostfs/hostfs_kern.c:960 hostfs_fill_super() error: uninitialized symbol 'host_root'.

vim +/host_root +960 fs/hostfs/hostfs_kern.c

2c2593890079e8 Hongbo Li         2024-05-13  938  static int hostfs_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  939  {
2c2593890079e8 Hongbo Li         2024-05-13  940  	struct hostfs_fs_info *fsi = sb->s_fs_info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  941  	struct inode *root_inode;
2c2593890079e8 Hongbo Li         2024-05-13  942  	char *host_root;
^1da177e4c3f41 Linus Torvalds    2005-04-16  943  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  944  
^1da177e4c3f41 Linus Torvalds    2005-04-16  945  	sb->s_blocksize = 1024;
^1da177e4c3f41 Linus Torvalds    2005-04-16  946  	sb->s_blocksize_bits = 10;
^1da177e4c3f41 Linus Torvalds    2005-04-16  947  	sb->s_magic = HOSTFS_SUPER_MAGIC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  948  	sb->s_op = &hostfs_sbops;
b26d4cd385fc51 Al Viro           2013-10-25  949  	sb->s_d_op = &simple_dentry_operations;
752fa51e4c5182 Wolfgang Illmeyer 2009-06-30  950  	sb->s_maxbytes = MAX_LFS_FILESIZE;
ce72750f04d68a Sjoerd Simons     2021-11-05  951  	err = super_setup_bdi(sb);
ce72750f04d68a Sjoerd Simons     2021-11-05  952  	if (err)
74ce793bcbde5c Mickaël Salaün    2023-06-12  953  		return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  954  
b58c4e96192ee7 Andy Shevchenko   2020-03-20  955  	/* NULL is printed as '(null)' by printf(): avoid that. */
2c2593890079e8 Hongbo Li         2024-05-13  956  	if (fc->source == NULL)
2c2593890079e8 Hongbo Li         2024-05-13  957  		host_root = "";

Uninitialized on else path

^1da177e4c3f41 Linus Torvalds    2005-04-16  958  
2c2593890079e8 Hongbo Li         2024-05-13  959  	fsi->host_root_path =
2c2593890079e8 Hongbo Li         2024-05-13 @960  		kasprintf(GFP_KERNEL, "%s/%s", root_ino, host_root);
                                                                                                         ^^^^^^^^^


2c2593890079e8 Hongbo Li         2024-05-13  961  	if (fsi->host_root_path == NULL)
74ce793bcbde5c Mickaël Salaün    2023-06-12  962  		return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

