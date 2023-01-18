Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F962564;
	Wed, 18 Jan 2023 08:28:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id z5so32045878wrt.6;
        Wed, 18 Jan 2023 00:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6XCQ5CPYe6jj7C4XyOnz3surWIznaw7vUo8bT2zWqw0=;
        b=cMVQGsWjsLpS7BdMzhtoy+NBU4mKTi2WE/7ktDIYXUoI9SWHosQQWtrZyf57hbhA+v
         IseaxZB2muGcTMsG2Xs0xuIkv2GDFmbvpOmebz2addeG+IUZC95CWsQTuQSNd9Qg6DPG
         kyYS+FjiAZexWB2oDTU6RvmYmaxbdxqpAlJw1naFR6ghy3evF0zgFQWj0khIcOoQOb1z
         bzAqGHDS1Es50LrFtg2v7GHfhjiT7qaUN/YxmCB8TPYC6ZgJb2WHzFPsJqZcSkVMxFk2
         P0sNJGdMYqGoakfpxMLOdODgiYT3F7qoQwNUtQ23zS3+8zpyGiToWBrfHcLbkYGLBVyG
         GlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XCQ5CPYe6jj7C4XyOnz3surWIznaw7vUo8bT2zWqw0=;
        b=OsncEXNnvokJ8ZrvdK86lqZfebSi8QBEfRcPvgt7oRFqt+Y0vab7K5S8wb/5mpgvgZ
         E7hrCIh51JZMM2r2Azi8V0uVa8pwO9E4ecwQWHr+t0M/gMJRykuuCYfhbwnDMubheufA
         LFRB+kgxivyg0meqHsAZ00RRHVpWlnnF+6C8V/+fifBWAJ/C7y+Y1GUqO3GxjFox+Xdz
         rvuWCg2jJBh4Lce32NHVIkKD1ZrTMPVjRMq14uL0zHp5RpYwUGeV3XyB1PFAQQFyvlWR
         13QkY2caSb26JYmWXFAmuG1wP7Wd3GKhz/L3rmce7UylKHvOMiSjbWEQ7AP6xZsVIsBE
         ufAA==
X-Gm-Message-State: AFqh2kqE+OYi99lgYkZ8cKBR9ZuleGmlh12BE9EPw1qMn/qj8yDnpmkz
	E4ChlPktS9G/wlpdbLEXljes56vqjqDcqw==
X-Google-Smtp-Source: AMrXdXvolSfVCufAO9/kRH+hSsWNPxOCvJmg187PwtyDLgQXv67ZJm4WIPBKvhVzT0Y5lqjrcMO6DQ==
X-Received: by 2002:a5d:4d91:0:b0:2bb:a83c:efc4 with SMTP id b17-20020a5d4d91000000b002bba83cefc4mr5534561wru.7.1674030502334;
        Wed, 18 Jan 2023 00:28:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z12-20020adfd0cc000000b002bdff778d87sm7877420wrh.34.2023.01.18.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:28:21 -0800 (PST)
Date: Wed, 18 Jan 2023 11:28:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc4-nesting 12/42]
 drivers/vfio/vfio_main.c:438 vfio_device_first_open() error: uninitialized
 symbol 'ret'.
Message-ID: <202301180513.OxZqSU0a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230118082808.YXtWyfOeTcs4qUJqhVa-8vj4EDwnwkNn5wNRYRtSN1Y@z>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc4-nesting
head:   0abe56cdd480433333a9c5ce93fd34c029d85629
commit: 0f0c97b100d769244040f4811f17f6a4b1f26687 [12/42] vfio: Add ioctls for device cdev iommufd
config: csky-randconfig-m041-20230115
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/vfio/vfio_main.c:438 vfio_device_first_open() error: uninitialized symbol 'ret'.

vim +/ret +438 drivers/vfio/vfio_main.c

ba348e21f7a4b8 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  396  static int vfio_device_first_open(struct vfio_device_file *df,
ba348e21f7a4b8 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  397  				  u32 *dev_id, u32 *pt_id)
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  398  {
78f6eb81848ef6 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  399  	struct vfio_device *device = df->device;
78f6eb81848ef6 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  400  	struct iommufd_ctx *iommufd = df->iommufd;
78f6eb81848ef6 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  401  	struct kvm *kvm = df->kvm;
805bb6c1bd9009 drivers/vfio/vfio.c      Jason Gunthorpe 2022-05-16  402  	int ret;
03a76b60f8ba27 drivers/vfio/vfio.c      Alex Williamson 2015-12-21  403  
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  404  	lockdep_assert_held(&device->dev_set->lock);
cba3345cc494ad drivers/vfio/vfio.c      Alex Williamson 2012-07-31  405  
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  406  	/* df->iommufd and df->noiommu should be exclusive */
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  407  	if (WARN_ON(iommufd && df->noiommu))
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  408  		return -EINVAL;
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  409  
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  410  	if (!try_module_get(device->dev->driver->owner))
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  411  		return -ENODEV;
2fd585f4ed9de9 drivers/vfio/vfio.c      Jason Gunthorpe 2021-08-05  412  
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  413  	/*
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  414  	 * For group path, iommufd pointer is NULL when comes into this
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  415  	 * helper. Its noiommu support is in container.c.
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  416  	 *
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  417  	 * For iommufd compat mode, iommufd pointer here is a valid value.
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  418  	 * Its noiommu support is supposed to be in vfio_iommufd_bind().
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  419  	 *
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  420  	 * For device cdev path, iommufd pointer here is a valid value for
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  421  	 * normal cases, but it is NULL if it's noiommu. The reason is
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  422  	 * that userspace uses iommufd==-1 to indicate noiommu mode in this
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  423  	 * path. So caller of this helper will pass in a NULL iommufd
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  424  	 * pointer. To differentiate it from the group path which also
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  425  	 * passes NULL iommufd pointer in, df->noiommu is used. For cdev
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  426  	 * noiommu, df->noiommu would be set to mark noiommu case for cdev
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  427  	 * path.
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  428  	 *
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  429  	 * So if df->noiommu is set then this helper just goes ahead to
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  430  	 * open device. If not, it depends on if iommufd pointer is NULL
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  431  	 * to handle the group path, iommufd compat mode, normal cases in
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  432  	 * the cdev path.
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  433  	 */
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  434  	if (iommufd)
ba348e21f7a4b8 drivers/vfio/vfio_main.c Yi Liu          2022-11-27  435  		ret = vfio_iommufd_bind(device, iommufd, dev_id, pt_id);
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  436  	else if (!df->noiommu)
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  437  		ret = vfio_device_group_use_iommu(device);

"ret" is not initialized on the else { path.

a4d1f91db5021c drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29 @438  	if (ret)
a4d1f91db5021c drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  439  		goto err_module_put;
bab6fabc01d99c drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  440  
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  441  	device->kvm = kvm;
421cfe6596f6cb drivers/vfio/vfio.c      Matthew Rosato  2022-05-19  442  	if (device->ops->open_device) {
2fd585f4ed9de9 drivers/vfio/vfio.c      Jason Gunthorpe 2021-08-05  443  		ret = device->ops->open_device(device);
2fd585f4ed9de9 drivers/vfio/vfio.c      Jason Gunthorpe 2021-08-05  444  		if (ret)
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  445  			goto err_unuse_iommu;
9dcf01d9572126 drivers/vfio/vfio.c      Max Gurtovoy    2021-05-18  446  	}
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  447  	return 0;
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  448  
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  449  err_unuse_iommu:
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  450  	device->kvm = NULL;
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  451  	if (iommufd)
a4d1f91db5021c drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  452  		vfio_iommufd_unbind(device);
0f0c97b100d769 drivers/vfio/vfio_main.c Yi Liu          2022-12-02  453  	else if (!df->noiommu)
5c8d3d93f6a7c9 drivers/vfio/vfio_main.c Yi Liu          2022-11-02  454  		vfio_device_group_unuse_iommu(device);
bab6fabc01d99c drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  455  err_module_put:
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  456  	module_put(device->dev->driver->owner);
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  457  	return ret;
294aaccb50130f drivers/vfio/vfio_main.c Jason Gunthorpe 2022-11-29  458  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

