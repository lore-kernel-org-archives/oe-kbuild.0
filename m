Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0313BB66C
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 09:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780045520; cv=none; b=EPO6fPKD0q583pKuM0RkieoEevtEU7EoFZR8HhLFGVbBkZThg5L5OlE3mk2d4Ho6/EqYYOIIqgaH/tl7lXU/IzByxOPXNnnM8D0nKWnUqII8FhyqRGz8qYQmOYxeQyM7GTUJ/BZNVVzIhgNfrHRfY38g1/nWpxd4ljvv0qXXEkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780045520; c=relaxed/simple;
	bh=v+5liiOtJPXsUpIsSkJwAou5XSqnlimEVIHYHQmbXNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=szPF91trIyvfv06Lng8WqPyPzPiOKE/gmE/EqhWZmiXKxfT6dkBov336IWm9A4qUdy/Nq6P2WtQw6fO+tbqe+ygP81G1sLrDwBLeZ7w3Jy4REPAZ+fb6/9V135RSIoVMCKwB4gXSRQ41enwtJffSLwW7ScPn6EXkBRkXnInI4O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqBx2dC2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqBx2dC2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso117998095e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780045517; x=1780650317; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tohVCl3IuQLJyuLwKLcxJEjy1VE5ZddD6HVUsg4X/LY=;
        b=OqBx2dC2dpmbGulwACi9lCHhgiR90DFNpxdXD8M3Pn8GhkKVIksS31mpgKJx7vpPkw
         /2dFl8/aDQ3K+Q3D0YkAhWJPLUObkWHp4gFlC2fDw/1KAiRhzp4TxtWH5hhklvp8w3EY
         wGB4VbkyE0NfBw+T3wxz1zv28N0tF4iLgJ70Sr/vY0En3ftd4n2B4xYKUu0PccAK0M/S
         tPY++g3FKL9EiKMMiwwVzdkggGCl38rp7CG8vsmnIelnwM/A4w7wa43nlTpbvZ5Oas/e
         aACqkYNxK6/wewIxJYdc+9Uq+i4nWSH3DRbZr0y5d4AKkwNxDWF9hK/tcBqnf1E+2ayF
         pgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780045517; x=1780650317;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tohVCl3IuQLJyuLwKLcxJEjy1VE5ZddD6HVUsg4X/LY=;
        b=S+VBqk7JXkgP8ad8RWAVxyZhSzYeYh9vmET0qdzhTp3TYpk3WCqk5gf806xFstY7AQ
         nza3DNNa62TzLWopel928Zt/OsnKyaqKt4vWYBP3q3I0BRXV9oFn//MsZl+JI6E5HcyM
         6lYeFXhfzdBLIsAlJPZJxYXFsbHyd8oafP0cmb7vND19yCbzPgwEE7/X4sGo/hQOEd/f
         54DmLmNMcfT4suro0zp6hqlV5htGgc3piykjIJExICiCPnuv8NfwCb20BHh/MBs9DcFe
         33CHGOTQ8d9XpglQDDtODdR6HyA3oWvgCSckC9VuvPbZasWVR4AW7FN/CH+fG5encHP6
         lDyg==
X-Gm-Message-State: AOJu0YyUkPwUyii/OGG9Ikx/pERo2YBzHO824ehJhdE+w7sPbSb7SKHj
	JtzpgLzi2ig35lFXQVp2FbYhh/thebRvV/f44r3Z+tnLRqhnPM7vxUynxg4vuYRF
X-Gm-Gg: Acq92OGqHVLVhj85IWkXNYDCJ7NBTqy6vU3X4pIEWOMhDnElLYaduX68HXEl48GsURk
	Uq8xrmDwWkZIX11Pn2XbD4FN7MgD+ycVAqFQofXKjXMDECzkgmJw+fiMD3ICWvLLKtOZ2dv4zQ7
	Y/DXqzhJPE3v1DbVVy/FRIcYN63BS18kl7hpZmx1FpWbRxyvIFurDTuf9wIDDjJlSTdEgk2XS5x
	KsyosqEQqosdbIRtjlT+ulyl/F2F1VOqspt1ijALHxmVUSzbkPShhpvvEGvvIlOQ/hlK/tFGsvl
	qg4zD79pqk0vbQP4bOWp3RIrCXJiGekIN54xZbjle9/9u9u0nKboeZwmUT4u4bTGL8iY4HqAwKT
	vD61eWGteTF0n01I7NTit3I1wqow4Y+ZDM7FrL5kLg0uXUAPBI8KViTZvHttd8Wc6vPqKtzIQjC
	1/LKWgN9hTU1PnlwWV+cg8hi/9cfDpMw==
X-Received: by 2002:a05:600c:b46:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-4909c08ee6dmr26440785e9.11.1780045517097;
        Fri, 29 May 2026 02:05:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d5f2347sm26381475e9.0.2026.05.29.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:05:16 -0700 (PDT)
Date: Fri, 29 May 2026 12:05:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Hannes Reinecke <hare@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v5 18/26] fs/configfs/mount.c:206
 configfs_init() warn: missing error code 'err'
Message-ID: <202605291604.0ixc9ROU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260529090513.kSnzwFFyVj-hfNZk7D0FwCAjsa_Q65JTupp-rYDZ3Xo@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v5
head:   ef344c27d4d9d0e8ba46f599a08ab287a95e132b
commit: c799a72504df6236d949d8c65ab1d39ea4dc0ccd [18/26] fs/configfs: dynamically allocate super_info
config: x86_64-randconfig-r073-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291604.0ixc9ROU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605291604.0ixc9ROU-lkp@intel.com/

New smatch warnings:
fs/configfs/mount.c:206 configfs_init() warn: missing error code 'err'

Old smatch warnings:
fs/configfs/mount.c:205 configfs_init() warn: 'configfs_root' is an error pointer or valid

vim +/err +206 fs/configfs/mount.c

7063fbf2261194f Joel Becker       2005-12-15  186  static int __init configfs_init(void)
7063fbf2261194f Joel Becker       2005-12-15  187  {
3d0f89bb169482d Joel Becker       2006-01-25  188  	int err = -ENOMEM;
3d0f89bb169482d Joel Becker       2006-01-25  189  
3d0f89bb169482d Joel Becker       2006-01-25  190  	configfs_dir_cachep = kmem_cache_create("configfs_dir_cache",
3d0f89bb169482d Joel Becker       2006-01-25  191  						sizeof(struct configfs_dirent),
20c2df83d25c6a9 Paul Mundt        2007-07-20  192  						0, 0, NULL);
3d0f89bb169482d Joel Becker       2006-01-25  193  	if (!configfs_dir_cachep)
3d0f89bb169482d Joel Becker       2006-01-25  194  		goto out;
7063fbf2261194f Joel Becker       2005-12-15  195  
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  196  	err = sysfs_create_mount_point(kernel_kobj, "config");
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  197  	if (err)
7c6455e368bc87e Al Viro           2011-12-13  198  		goto out2;
7c6455e368bc87e Al Viro           2011-12-13  199  
7063fbf2261194f Joel Becker       2005-12-15  200  	err = register_filesystem(&configfs_fs_type);
7c6455e368bc87e Al Viro           2011-12-13  201  	if (err)
b4caecd48005fbe Christoph Hellwig 2015-01-14  202  		goto out3;
7063fbf2261194f Joel Becker       2005-12-15  203  
c799a72504df623 Hannes Reinecke   2026-05-22  204  	configfs_root = configfs_get_root(NULL);
c799a72504df623 Hannes Reinecke   2026-05-22  205  	if (!configfs_root)
c799a72504df623 Hannes Reinecke   2026-05-22 @206  		goto out4;

Apparently this should be an IS_ERR() check and we need to set the
error code.

c799a72504df623 Hannes Reinecke   2026-05-22  207  
7c6455e368bc87e Al Viro           2011-12-13  208  	return 0;
c799a72504df623 Hannes Reinecke   2026-05-22  209  out4:
c799a72504df623 Hannes Reinecke   2026-05-22  210  	pr_err("Unable to get initlal root context\n");
c799a72504df623 Hannes Reinecke   2026-05-22  211  	unregister_filesystem(&configfs_fs_type);
7c6455e368bc87e Al Viro           2011-12-13  212  out3:
b4caecd48005fbe Christoph Hellwig 2015-01-14  213  	pr_err("Unable to register filesystem!\n");
f9bb48825a6b5d0 Eric W. Biederman 2015-05-13  214  	sysfs_remove_mount_point(kernel_kobj, "config");
7c6455e368bc87e Al Viro           2011-12-13  215  out2:
e0bf68ddec4f4f9 Peter Zijlstra    2007-10-16  216  	kmem_cache_destroy(configfs_dir_cachep);
e0bf68ddec4f4f9 Peter Zijlstra    2007-10-16  217  	configfs_dir_cachep = NULL;
3d0f89bb169482d Joel Becker       2006-01-25  218  out:
7063fbf2261194f Joel Becker       2005-12-15  219  	return err;
7063fbf2261194f Joel Becker       2005-12-15  220  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

