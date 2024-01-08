Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35955101A
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMjGNCgA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40d89446895so10276585e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 08 Jan 2024 04:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717154; x=1705321954; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIxLu4zoh3LL7Q1uFUiAUZZBCWCjlaxYGRlHTrnotok=;
        b=xMjGNCgAS5GIKGKW3hodVjPpysmiu4vyo3zCd0zPFumxLXgF4yhblVb3g52TPMO/Qj
         EC7H57IofNgjGXq+1SVg1Wl00Yru1M7G3HLbHqw9GYSOXGDUr53DmzcuyyFtPETSn8r1
         c2I5L45U7sPq7Xo1LmwqHS6xOJEfqwkyRkwbVVr6qMswdTdTj/X+Ieh2je3ctLu7ZVnb
         2ig0n8UC3d09XVxCAZU2503MaDmP790lAec6+0cO35muICnNuWjPlJfFfHPdUtkk5Sah
         zGumZuPgHwhVMb28Xa1vnyK8rMFcfU2wGgj/43XReXB+vtMFEBvHzhDXxfFHP9KiN05d
         pAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717154; x=1705321954;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIxLu4zoh3LL7Q1uFUiAUZZBCWCjlaxYGRlHTrnotok=;
        b=u8mT10w0Tznv1dMxv16LjBLEPJ58HQ8urcm96PCXA0lihJnxpIG5hkoCWCp6iKk06K
         pnAfeFqd9Cd1qPBYlx3modobY73aGdYjzKw22x7UrBjnSvH/hVU73Y0SKfSQ0KpxW8bg
         lFmrUbbSBRdbGzdJ5Gt2AGSunTo/uxo4ri8xsQLmgr7WXxv/JnI2LMZ6bCUvU+y1QAPZ
         yebpdMX5L66Vg0f8ceQUU1UmZNYu+bpmftxpCLL7m7KJ9y/vxK8+c7U5JB5Fk/IvY2RT
         4YVvHX3GGxeE8vECAd6N9OJV9Edl8xOd5OgQwXdvz42TpV0YIkzG+eji7c8xRTUPeFcX
         N82A==
X-Gm-Message-State: AOJu0YyUPBlvuJ5iTR0TjfLuU+h7M5YQdXUGiGOIYxSHOff/nnQuQd0A
	F+hYKMUna8KOtoDmextJr8qEo/bbZj6FhoBhppe7qILHci0=
X-Google-Smtp-Source: AGHT+IE+NkW4hWdxv32tlGd7cXBMw5imwbk0V7RvQKd/VL9ZO1zWdxXipu6P7+Pqkybyv7RYrj3Kig==
X-Received: by 2002:a05:600c:4212:b0:40d:7822:ce28 with SMTP id x18-20020a05600c421200b0040d7822ce28mr1669498wmh.83.1704717154499;
        Mon, 08 Jan 2024 04:32:34 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id c4-20020a05600c0a4400b0040e39cbf2a4sm10621284wmq.42.2024.01.08.04.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:34 -0800 (PST)
Date: Mon, 8 Jan 2024 15:32:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9386/12908] mm/huge_memory.c:546 thpsize_create()
 warn: Calling kobject_put|get with state->initialized unset from line: 533
Message-ID: <efeda6be-8d1d-45a4-b6cb-950cb087124d@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Harshit,

We get this warning when the DB isn't enabled.  I just pushed a fix for
it.

regards,
dan carpenter

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bffdfd2e7e63175ae261131a620f809d946cf9a7
commit: 3485b88390b0af9e05dc2c3f57e9936f41e159a0 [9386/12908] mm: thp: introduce multi-size THP sysfs interface
config: i386-randconfig-141-20240106 (https://download.01.org/0day-ci/archive/20240108/202401082055.s03XC1wp-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202401082055.s03XC1wp-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:546 thpsize_create() warn: Calling kobject_put|get with state->initialized unset from line: 533

vim +546 mm/huge_memory.c

3485b88390b0af Ryan Roberts 2023-12-07  527  static struct thpsize *thpsize_create(int order, struct kobject *parent)
3485b88390b0af Ryan Roberts 2023-12-07  528  {
3485b88390b0af Ryan Roberts 2023-12-07  529  	unsigned long size = (PAGE_SIZE << order) / SZ_1K;
3485b88390b0af Ryan Roberts 2023-12-07  530  	struct thpsize *thpsize;
3485b88390b0af Ryan Roberts 2023-12-07  531  	int ret;
3485b88390b0af Ryan Roberts 2023-12-07  532  
3485b88390b0af Ryan Roberts 2023-12-07  533  	thpsize = kzalloc(sizeof(*thpsize), GFP_KERNEL);
3485b88390b0af Ryan Roberts 2023-12-07  534  	if (!thpsize)
3485b88390b0af Ryan Roberts 2023-12-07  535  		return ERR_PTR(-ENOMEM);
3485b88390b0af Ryan Roberts 2023-12-07  536  
3485b88390b0af Ryan Roberts 2023-12-07  537  	ret = kobject_init_and_add(&thpsize->kobj, &thpsize_ktype, parent,
3485b88390b0af Ryan Roberts 2023-12-07  538  				   "hugepages-%lukB", size);
3485b88390b0af Ryan Roberts 2023-12-07  539  	if (ret) {
3485b88390b0af Ryan Roberts 2023-12-07  540  		kfree(thpsize);
3485b88390b0af Ryan Roberts 2023-12-07  541  		return ERR_PTR(ret);
3485b88390b0af Ryan Roberts 2023-12-07  542  	}
3485b88390b0af Ryan Roberts 2023-12-07  543  
3485b88390b0af Ryan Roberts 2023-12-07  544  	ret = sysfs_create_group(&thpsize->kobj, &thpsize_attr_group);
3485b88390b0af Ryan Roberts 2023-12-07  545  	if (ret) {
3485b88390b0af Ryan Roberts 2023-12-07 @546  		kobject_put(&thpsize->kobj);
3485b88390b0af Ryan Roberts 2023-12-07  547  		return ERR_PTR(ret);
3485b88390b0af Ryan Roberts 2023-12-07  548  	}
3485b88390b0af Ryan Roberts 2023-12-07  549  
3485b88390b0af Ryan Roberts 2023-12-07  550  	thpsize->order = order;
3485b88390b0af Ryan Roberts 2023-12-07  551  	return thpsize;
3485b88390b0af Ryan Roberts 2023-12-07  552  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

