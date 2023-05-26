Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD0B1FDF
	for <oe-kbuild@lists.linux.dev>; Fri, 26 May 2023 04:18:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6094cb2ebso1777295e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 25 May 2023 21:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685074731; x=1687666731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pXqueL63eZUwWChTLS/+442AjqisvrIrW3RxXzCCAEo=;
        b=KZrf0gaPOERewu8z7PhSy+c2NZJGt+nKxiaIcQfNQEa+ZeBilWfUyAigAGl1tBGT6C
         r6hrJo0zmzHl5bIJf4MJkMMpEnrOat5nnoPpZCmNKYRMRxQWRiNYtTiyl+rkrRP5DUwG
         8y0yTn3rMIPRww5qN/5Vxwh7m9kC7mp0qftovFDaAdLa+65Mc7auBQYNX0vjqT6+SAAh
         LeANrgObtlJhhpLpP8EbNbf2gvrkYcJcdE0ucemyuzRmgVvoOMTDfQsb80ZeaFhrR/7m
         EAnrXbBx5WEI6eCjHhdFCU6xMr/UoVmzEr0UNsJCX5e3rfwmvSP6pPZuqYujxN25Lx8O
         905Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685074731; x=1687666731;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXqueL63eZUwWChTLS/+442AjqisvrIrW3RxXzCCAEo=;
        b=idm+q4A+LO+U92MguiD2OcwdmG3dtzL1Fmdzsv4j2lCvQdtJkbsnnTFRVnfbTnYuVz
         FCrDVj8oJbRJWZ/yujnzCCTfFC1wgGNFW+y3ZZz+w+ITDhO4Q2K4U4dyBaXXXACXe3QH
         O5aeHyZXRxF/0L34+CtM7Ojo6xEmw+HIvXX677QoZwj9C6Q1kbf1KdjCgasHJ2Hve5MG
         RWwYF10eelx8o9TnH8N3pBYam52YMYgD1xiK0kj8SBO4LsJDmYgUT0VUlCBCDnBKxKgY
         rWIOItAiYZ4MXdryh0UrMWC/4w+kEcoGt9Gt2NYO+9YWtlNmh+5NjTZa2qbJNKPEFu9R
         ArFA==
X-Gm-Message-State: AC+VfDxPed2RVgSjfkpDo0KXWX8g2Z0zV2JWrJYhmm775Y3mNBLCCUb2
	nHmmbydgorUIIL01SYGc8H4CEpWYP9dxDcst1D0=
X-Google-Smtp-Source: ACHHUZ51sy/3wlY2ZBa867msyA6JrD7OdfPNZzxyagAn/SpRexpXsEnf9NiYQp2CZUoFBF6gKMWC9g==
X-Received: by 2002:a05:600c:21cf:b0:3f1:bb10:c865 with SMTP id x15-20020a05600c21cf00b003f1bb10c865mr490515wmj.38.1685074730895;
        Thu, 25 May 2023 21:18:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d4385000000b003062b57ffd1sm3624519wrq.50.2023.05.25.21.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 21:18:49 -0700 (PDT)
Date: Fri, 26 May 2023 07:18:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/vfio_device_cdev_v12 22/36]
 drivers/vfio/group.c:197 vfio_df_group_open() warn: missing unwind goto?
Message-ID: <d228d7f1-74ac-4781-bdde-d6a6db275eb2@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/vfio_device_cdev_v12
head:   3601440697cc5133a0bdf30a2859956657e2b121
commit: c94075c2abbde32fd38ebae0aea6677fac488628 [22/36] vfio-iommufd: Split bind/attach into two steps
config: arm64-randconfig-m041-20230525
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305260324.g4NoyCIP-lkp@intel.com/

smatch warnings:
drivers/vfio/group.c:197 vfio_df_group_open() warn: missing unwind goto?

vim +197 drivers/vfio/group.c

5a82c123138ca5 Yi Liu         2023-02-04  172  static int vfio_df_group_open(struct vfio_device_file *df)
9eefba8002c27d Yi Liu         2022-11-25  173  {
5a82c123138ca5 Yi Liu         2023-02-04  174  	struct vfio_device *device = df->device;
9eefba8002c27d Yi Liu         2022-11-25  175  	int ret;
9eefba8002c27d Yi Liu         2022-11-25  176  
9eefba8002c27d Yi Liu         2022-11-25  177  	mutex_lock(&device->group->group_lock);
9eefba8002c27d Yi Liu         2022-11-25  178  	if (!vfio_group_has_iommu(device->group)) {
9eefba8002c27d Yi Liu         2022-11-25  179  		ret = -EINVAL;
9eefba8002c27d Yi Liu         2022-11-25  180  		goto out_unlock;
9eefba8002c27d Yi Liu         2022-11-25  181  	}
9eefba8002c27d Yi Liu         2022-11-25  182  
2b48f52f2bff8e Matthew Rosato 2023-02-03  183  	mutex_lock(&device->dev_set->lock);
2b48f52f2bff8e Matthew Rosato 2023-02-03  184  
9eefba8002c27d Yi Liu         2022-11-25  185  	/*
2b48f52f2bff8e Matthew Rosato 2023-02-03  186  	 * Before the first device open, get the KVM pointer currently
2b48f52f2bff8e Matthew Rosato 2023-02-03  187  	 * associated with the group (if there is one) and obtain a reference
2b48f52f2bff8e Matthew Rosato 2023-02-03  188  	 * now that will be held until the open_count reaches 0 again.  Save
2b48f52f2bff8e Matthew Rosato 2023-02-03  189  	 * the pointer in the device for use by drivers.
9eefba8002c27d Yi Liu         2022-11-25  190  	 */
2b48f52f2bff8e Matthew Rosato 2023-02-03  191  	if (device->open_count == 0)
2b48f52f2bff8e Matthew Rosato 2023-02-03  192  		vfio_device_group_get_kvm_safe(device);
2b48f52f2bff8e Matthew Rosato 2023-02-03  193  
5a82c123138ca5 Yi Liu         2023-02-04  194  	df->iommufd = device->group->iommufd;
95220bc7a59c28 Yi Liu         2023-04-23  195  	if (df->iommufd && vfio_device_is_noiommu(device) && device->open_count == 0) {
95220bc7a59c28 Yi Liu         2023-04-23  196  		if (!capable(CAP_SYS_RAWIO))
95220bc7a59c28 Yi Liu         2023-04-23 @197  			return -EPERM;

Needs to goto out_put_kvm or whatever.  It's weird to me that Smatch
doesn't generate a locking warning here.  It does on my system.

drivers/vfio/group.c:239 vfio_df_group_open() warn: inconsistent returns '&device->group->group_lock'.
  Locked on  : 196
  Unlocked on: 228,239
drivers/vfio/group.c:239 vfio_df_group_open() warn: inconsistent returns '&device->dev_set->lock'.
  Locked on  : 196
  Unlocked on: 228

95220bc7a59c28 Yi Liu         2023-04-23  198  
95220bc7a59c28 Yi Liu         2023-04-23  199  		/*
95220bc7a59c28 Yi Liu         2023-04-23  200  		 * Require no compat ioas to be assigned to proceed.  The basic
95220bc7a59c28 Yi Liu         2023-04-23  201  		 * statement is that the user cannot have done something that
95220bc7a59c28 Yi Liu         2023-04-23  202  		 * implies they expected translation to exist
95220bc7a59c28 Yi Liu         2023-04-23  203  		 */
95220bc7a59c28 Yi Liu         2023-04-23  204  		if (vfio_iommufd_device_has_compat_ioas(device, df->iommufd)) {
95220bc7a59c28 Yi Liu         2023-04-23  205  			ret = -EPERM;
95220bc7a59c28 Yi Liu         2023-04-23  206  			goto out_put_kvm;
95220bc7a59c28 Yi Liu         2023-04-23  207  		}
95220bc7a59c28 Yi Liu         2023-04-23  208  	}
5a82c123138ca5 Yi Liu         2023-02-04  209  
5a82c123138ca5 Yi Liu         2023-02-04  210  	ret = vfio_df_open(df);
c94075c2abbde3 Yi Liu         2023-04-23  211  	if (ret)
5d978ec2ad0ac0 Yi Liu         2022-12-15  212  		goto out_put_kvm;
c94075c2abbde3 Yi Liu         2023-04-23  213  
c94075c2abbde3 Yi Liu         2023-04-23  214  	if (df->iommufd && device->open_count == 1) {
c94075c2abbde3 Yi Liu         2023-04-23  215  		ret = vfio_iommufd_compat_attach_ioas(device,
c94075c2abbde3 Yi Liu         2023-04-23  216  						      df->iommufd);
c94075c2abbde3 Yi Liu         2023-04-23  217  		if (ret)
c94075c2abbde3 Yi Liu         2023-04-23  218  			goto out_close_device;
5d978ec2ad0ac0 Yi Liu         2022-12-15  219  	}
5d978ec2ad0ac0 Yi Liu         2022-12-15  220  
5d978ec2ad0ac0 Yi Liu         2022-12-15  221  	/*
5d978ec2ad0ac0 Yi Liu         2022-12-15  222  	 * Paired with smp_load_acquire() in vfio_device_fops::ioctl/
5d978ec2ad0ac0 Yi Liu         2022-12-15  223  	 * read/write/mmap and vfio_file_has_device_access()
5d978ec2ad0ac0 Yi Liu         2022-12-15  224  	 */
5d978ec2ad0ac0 Yi Liu         2022-12-15  225  	smp_store_release(&df->access_granted, true);
2b48f52f2bff8e Matthew Rosato 2023-02-03  226  
c94075c2abbde3 Yi Liu         2023-04-23  227  	mutex_unlock(&device->dev_set->lock);
c94075c2abbde3 Yi Liu         2023-04-23  228  	mutex_unlock(&device->group->group_lock);
c94075c2abbde3 Yi Liu         2023-04-23  229  	return 0;
c94075c2abbde3 Yi Liu         2023-04-23  230  
c94075c2abbde3 Yi Liu         2023-04-23  231  out_close_device:
c94075c2abbde3 Yi Liu         2023-04-23  232  	vfio_df_close(df);
5d978ec2ad0ac0 Yi Liu         2022-12-15  233  out_put_kvm:
c94075c2abbde3 Yi Liu         2023-04-23  234  	df->iommufd = NULL;
2b48f52f2bff8e Matthew Rosato 2023-02-03  235  	if (device->open_count == 0)
2b48f52f2bff8e Matthew Rosato 2023-02-03  236  		vfio_device_put_kvm(device);
2b48f52f2bff8e Matthew Rosato 2023-02-03  237  	mutex_unlock(&device->dev_set->lock);
9eefba8002c27d Yi Liu         2022-11-25  238  out_unlock:
9eefba8002c27d Yi Liu         2022-11-25  239  	mutex_unlock(&device->group->group_lock);
9eefba8002c27d Yi Liu         2022-11-25  240  	return ret;
9eefba8002c27d Yi Liu         2022-11-25  241  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

