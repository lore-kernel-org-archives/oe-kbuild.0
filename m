Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817B21772D
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745655020; cv=none; b=oMQRupIaZXuiokubcs185jrrriiatsbULDrj8MGDRLn4BzDign3v8ItY9adtQmXhNNyI4eVhoCuLZZZdxNJpctgsjRZF8Sxd8WwvH3f02t0eHvLpFkHwD0HhHrU+2CfG2MoepGElk3zWhaetJe84ziNiiQWP5PMLm5+q6w+KEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745655020; c=relaxed/simple;
	bh=wJ1WplUCyFn0t9VfxUYVzwC1BraW4VGvOcfhzZtZfXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ra3LSdU73+U/LBEhzsmLFozQjqFPv+vrkk0KJmxiYfqQuZSf1UoS/aI76oBBaN/Y6zo6uYJkvvuCQelwiIIIL1KV3/HrALiHl8N1W3luWJ5JayYzaR+m4eW8SPyxtl2b0YQ2fNPxYaUrmOwY0xoCIFQzvI4cSpZIsQgNo1PKoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCON7HBM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCON7HBM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913b539aabso1690585f8f.2
        for <oe-kbuild@lists.linux.dev>; Sat, 26 Apr 2025 01:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745655016; x=1746259816; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AOQ3YRUY7vkqhTlxjQxyYug106qzI78jFzS/zqp5JM=;
        b=tCON7HBMP5tc7SIp4dVIr4J9Fga5sPA9/4oe2XeNEuBArfhjsLRScmPrUvCClUas32
         ZUdSO9fMsaXGRXIJq8Wlbci28bWi13WldpUhrZMYmUaNXWYEsq3inO6YZ4PYDclzyKxd
         1wkwtbKQI2y/wuMSZm0DiMRA7j1mloMQgFHyeAeQJ0Gm52Dkxg0a/uYg2PCjAwZ0kWwV
         5rl9ERN2obU9rx6JnoU97+Yx9oS4L+QsmBXwFQH3erL7d9m+Totp+7cXyi/HZ+EupNnF
         lbdJKCt+3g0JxOQk5k0nfhhn/oRWm7raVHkAGtpp2vBGpktAdcHQDxFaChTEld327Jyt
         uueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745655016; x=1746259816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AOQ3YRUY7vkqhTlxjQxyYug106qzI78jFzS/zqp5JM=;
        b=OZHhH37e7OHIYX84Y9yahQuidVBuSy9pgz7O9WUpZ/4r8lxNEHX1Me1Gc1uLrobXMZ
         THe0MNYRvmzY0KVsXcCnT3iLEnzEi9hGdYfQCLcgxweyP9gEZ9wu2Xbp/Nay/qHLUlK9
         awc61W9k7AkHNX1eypLyu6jvAhWzjtIVhrIRAslU9bmJTotEp9crE23XE5ZjGEJQbspb
         G3E0z+VeefuDLJ8eoy79AyLMVLsMvM7HlT2e3dQBNrZTPj+pr+mwmEf0snyju+f7y0RD
         eiOaCobbGTdb5OMSXpiwMSQojohuBjowzJ/xS3H4Yg0V75OXF12bx+Ta6/sCnSFSfc2i
         elKg==
X-Gm-Message-State: AOJu0YxXg8BPb4jCTm9PhrJa7HfLN6ncCLk7/bzkFY3h4muqClqxa+Lx
	dKx6uxItE5v+3fpFC3GbqC7devfR/5WCYRNdAMnSrlPJk5aQnSzUUC4O/is+ovPz31PcVZ9tG0N
	+xm8=
X-Gm-Gg: ASbGncvgHqXylGWb20Y3kqvtDZ/HDq3U2IJmV6oPkkpF+OV8DMm2gmRzODwzv/AYtib
	9aTRqASOQkqIfVkokd7CUqHZiQrZeOtPuZsiTN7ye5SWbMeXcXMtbAdu6IrjTdNyB4B2cD7W/O+
	ZOxZ//ixZBj8HpjVXlqo0IZ6DTxmt90icsFkrUFpvjoTXFqq3bQ34EZRk+okYVapQiN+IB0VBYZ
	qjR1NdkaNHhvPrlxRnKenmt26Mde+2U2vFbBDrPtJWiXZjieeWND7dY8lJsm35eesaUZh44+qfy
	mgJgTq3ztHWGpfF/dmrrr3sueA631QaDa6TEpoqHw1pVSg==
X-Google-Smtp-Source: AGHT+IFKPt5U2AXRfqpb4dvQleqsA4Io95y/3AlV2YfjiRdAEv2fUHXxsmr5zzEEERFrZXoUo1Cp8A==
X-Received: by 2002:a5d:588a:0:b0:39c:3122:ad55 with SMTP id ffacd0b85a97d-3a07aa666f0mr1295122f8f.18.1745655015720;
        Sat, 26 Apr 2025 01:10:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e46a49sm4675034f8f.61.2025.04.26.01.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 01:10:15 -0700 (PDT)
Date: Sat, 26 Apr 2025 11:10:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.fixes 5/7] drivers/base/devtmpfs.c:358
 handle_remove() error: uninitialized symbol 'err'.
Message-ID: <202504261201.An2vRIlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250426081011.AtTYwXXoNZQN1Hl4s79wh8GEvBQP8g1GPt1Uwd0hBsU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   9664179186fb2ae576315b0e22b0e21f5de1a0e2
commit: 5a876a5097fed90a4742438fbc22357d67d9ea60 [5/7] devtmpfs: don't use vfs_getattr_nosec to query i_mode
config: i386-randconfig-141-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261201.An2vRIlC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504261201.An2vRIlC-lkp@intel.com/

smatch warnings:
drivers/base/devtmpfs.c:358 handle_remove() error: uninitialized symbol 'err'.

vim +/err +358 drivers/base/devtmpfs.c

2780f1ff6aec0c Al Viro           2011-06-27  320  static int handle_remove(const char *nodename, struct device *dev)
2b2af54a5bb6f7 Kay Sievers       2009-04-30  321  {
79714f72d3b964 Al Viro           2012-06-15  322  	struct path parent;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  323  	struct dentry *dentry;
5a876a5097fed9 Christoph Hellwig 2025-04-23  324  	struct inode *inode;
fbde7c6119f99a Axel Lin          2013-11-16  325  	int deleted = 0;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  326  	int err;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  327  
79714f72d3b964 Al Viro           2012-06-15  328  	dentry = kern_path_locked(nodename, &parent);
79714f72d3b964 Al Viro           2012-06-15  329  	if (IS_ERR(dentry))
79714f72d3b964 Al Viro           2012-06-15  330  		return PTR_ERR(dentry);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  331  
5a876a5097fed9 Christoph Hellwig 2025-04-23  332  	inode = d_inode(dentry);
5a876a5097fed9 Christoph Hellwig 2025-04-23  333  	if (dev_mynode(dev, inode)) {
5e31d76f2817bd Kay Sievers       2010-01-13  334  		struct iattr newattrs;
5e31d76f2817bd Kay Sievers       2010-01-13  335  		/*
5e31d76f2817bd Kay Sievers       2010-01-13  336  		 * before unlinking this node, reset permissions
5e31d76f2817bd Kay Sievers       2010-01-13  337  		 * of possible references like hardlinks
5e31d76f2817bd Kay Sievers       2010-01-13  338  		 */
91fa2ccaa87368 Eric W. Biederman 2012-04-25  339  		newattrs.ia_uid = GLOBAL_ROOT_UID;
91fa2ccaa87368 Eric W. Biederman 2012-04-25  340  		newattrs.ia_gid = GLOBAL_ROOT_GID;
5a876a5097fed9 Christoph Hellwig 2025-04-23  341  		newattrs.ia_mode = inode->i_mode & ~0777;
5e31d76f2817bd Kay Sievers       2010-01-13  342  		newattrs.ia_valid =
5e31d76f2817bd Kay Sievers       2010-01-13  343  			ATTR_UID|ATTR_GID|ATTR_MODE;
5955102c9984fa Al Viro           2016-01-22  344  		inode_lock(d_inode(dentry));
abf08576afe315 Christian Brauner 2023-01-13  345  		notify_change(&nop_mnt_idmap, dentry, &newattrs, NULL);
5955102c9984fa Al Viro           2016-01-22  346  		inode_unlock(d_inode(dentry));
abf08576afe315 Christian Brauner 2023-01-13  347  		err = vfs_unlink(&nop_mnt_idmap, d_inode(parent.dentry),
6521f891708292 Christian Brauner 2021-01-21  348  				 dentry, NULL);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  349  		if (!err || err == -ENOENT)
2b2af54a5bb6f7 Kay Sievers       2009-04-30  350  			deleted = 1;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  351  	}

err is uninitialized on else path.

2b2af54a5bb6f7 Kay Sievers       2009-04-30  352  	dput(dentry);
5955102c9984fa Al Viro           2016-01-22  353  	inode_unlock(d_inode(parent.dentry));
2b2af54a5bb6f7 Kay Sievers       2009-04-30  354  
79714f72d3b964 Al Viro           2012-06-15  355  	path_put(&parent);
2b2af54a5bb6f7 Kay Sievers       2009-04-30  356  	if (deleted && strchr(nodename, '/'))
2b2af54a5bb6f7 Kay Sievers       2009-04-30  357  		delete_path(nodename);
2b2af54a5bb6f7 Kay Sievers       2009-04-30 @358  	return err;
2b2af54a5bb6f7 Kay Sievers       2009-04-30  359  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

