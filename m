Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999D318DB05
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742125502; cv=none; b=hgpm+h6gmZMWr9Hq2f1KnvKIKwv/AYBt1WGO00SN1X+zfyxmPpM/KWnIkhI9Cnd0/wASk5TLRrDd0loyzj/kCRWPNissppSuS8cVYyB4A+sSB7x1lN7D9bg65Yq5hW6mYP4qcl0zQ/fI1tA+rgxvPeu4yx2fdIW2utiEvVbedY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742125502; c=relaxed/simple;
	bh=LBSEfVovD4nDf3E5onrgXvdi2b7+J45Z1yC0vLrh3JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EygwEjP1t/tYjkDlm+lTFfpwxHoY4oap9xKPGrC07n2mEPj5vYIr1nBMWltYs6DihkRJQAlkBIkZOFuq1w218sxva/XPWhTa3onbtn2vp5uNwphTyiiXtOLoi3SN+VqLnv656on6X15Bvt2UXLoQnYMl+1CeeSKeJlNuQyc//8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4kn9RGA; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4kn9RGA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2108324f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 16 Mar 2025 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742125498; x=1742730298; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4z/GrSbwmpt8ZzAL70C3RRPxtlwbJhPaVOT6CiyQvcg=;
        b=d4kn9RGAII6bnUWgxk7ju0Sb4rYereUOUEbokj90TFSkiOLHuVR5r6YaAvnYqBVJl5
         +1aeg0xObXd81SWYIj09BSpai+YKmrPKf6AxM8b5+x2otlD/yboh49WyIbMxCpaUeOSm
         X7IUxDapeIupA0s0BLhSbpbuptrtQa/RNJ+uZF5hInSRCUXiNboCZHOylXsnUbZsVow7
         Jan1T9Njss2odysrqCSDU3aIaOXvl4GeCLDmBs6I47NKO0t7Ig+0lKV+eDUyLmJ89q7c
         L7v4Lv65qdwtV3bb3giTBneI8WY3C64F0uUtVTHTjH2SOlgQlvDWs8t6aGhsn3FiJqPJ
         pn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742125498; x=1742730298;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4z/GrSbwmpt8ZzAL70C3RRPxtlwbJhPaVOT6CiyQvcg=;
        b=mHeBz+wbQ4tNbVBHG6qBDWwwMzbbqnNdnzSVy9qijeEkxl3ZodcU0fhVw6PxGm7iRS
         swNADs/yFu8DKzc7IsbyKW/789VjNsrxigl3ms25titAKSXLhg+RM2JNSYldA+gZzsh0
         qODfzu6Txe41RMkLj5bw61V7j/Gs8W7HH9wnpZknM2WjmfjkOVmuWXwXgDteGY1hkLFx
         mLxzmfKnaT6KtQ45hsXBvJQ0ZGg3CFDn6p2ipy3wF2yFJCACsuoth1X+b0VoFnULUKNx
         jeAxCtSgVpkdWSytnHXhVKex2ErD6KuYKJtbKGqHz0+T9bsQQS0LNmhMw1IEn6S601yK
         Sdew==
X-Gm-Message-State: AOJu0Yys4dsUpFpn29ZAAZi9D4RG2E7tOFlnZ24ePcpWnfPTWA07wmMD
	Am/wPIzwnpPZRY1QrmITO0Jb2hMyeeydWf4uwSzE8uJPZ9AmeQubMgLw2jSlqtsx/ZZ1sJKDYub
	c
X-Gm-Gg: ASbGncvrJg1fBHSO/9O3y/i8/aGym+BGrLob06v/wJolCirpny4k1GLxipYQO5pGyqL
	Isr+6zZCm7SUQQoD8e0evSOzAaNsuIOEdqUwebJOvTezT9F88EcOgMuygxw9pHRWlR4bFy8qjRE
	GYNVske1umOJLCJMu01OcbvoCpzo/6egfnMbpJNiG5ODcG+5jQ4f07Ia/AhjsA6QAw/6/seyGFv
	qciG7ergjD95RIN0whwCm674mnYf6l1S+WnOO2ZENXLKKQ06QhUP306VyMc4lgIGLQTri34TEMN
	gY9a0VB6iRcaZP36ZQKKRuE7WIBXoo5ooMSxRtTM9qkTrToZcA==
X-Google-Smtp-Source: AGHT+IGSLtUKDzy+yy1bstXhLFvRdnEKTEieXKC2dfWuQBjP+OJnPO04R2BQoH4o46VIG9NWApnaRg==
X-Received: by 2002:adf:a297:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3971e3a54bfmr8689570f8f.31.1742125498164;
        Sun, 16 Mar 2025 04:44:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-395c7df34eesm11986796f8f.18.2025.03.16.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 04:44:57 -0700 (PDT)
Date: Sun, 16 Mar 2025 14:44:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20250311 20/30]
 drivers/iommu/iommufd/device.c:478 iommufd_hw_pagetable_attach() warn:
 passing positive error code '4294950918-4294967294' to 'PTR_ERR'
Message-ID: <8f3f0c86-8059-4444-9fc0-3011a8db8d7e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20250311
head:   61681190f00a2bd3a65f06f64d4279c5a9987c75
commit: 88f4b638c9af4670720e029522e8fee6e55cb26d [20/30] iommufd/device: Add pasid_attach array to track per-PASID attach
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250316/202503161104.CANtg5Ng-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503161104.CANtg5Ng-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:478 iommufd_hw_pagetable_attach() warn: passing positive error code '4294950918-4294967294' to 'PTR_ERR'

vim +478 drivers/iommu/iommufd/device.c

339fbf3ae144263 Jason Gunthorpe 2023-03-01  463  int iommufd_hw_pagetable_attach(struct iommufd_hw_pagetable *hwpt,
0e3f068ad552018 Yi Liu          2025-02-26  464  				struct iommufd_device *idev, ioasid_t pasid)
e8d57210035b637 Jason Gunthorpe 2022-11-29  465  {
b2f44814680b569 Nicolin Chen    2024-08-06  466  	struct iommufd_hwpt_paging *hwpt_paging = find_hwpt_paging(hwpt);
509c6c6f3098710 Yi Liu          2025-02-26  467  	bool attach_resv = hwpt_paging && pasid == IOMMU_NO_PASID;
88f4b638c9af467 Yi Liu          2025-03-09  468  	struct iommufd_hw_pagetable *old_hwpt = NULL;
481d086162ecc90 Yi Liu          2025-03-06  469  	struct iommufd_group *igroup = idev->igroup;
80ca6ff4d5b9edf Yi Liu          2025-03-08  470  	struct iommufd_attach_handle *handle;
e8d57210035b637 Jason Gunthorpe 2022-11-29  471  	int rc;
e8d57210035b637 Jason Gunthorpe 2022-11-29  472  
481d086162ecc90 Yi Liu          2025-03-06  473  	mutex_lock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  474  
88f4b638c9af467 Yi Liu          2025-03-09  475  	handle = xa_cmpxchg(&igroup->pasid_attach, pasid, NULL,
88f4b638c9af467 Yi Liu          2025-03-09  476  			    XA_ZERO_ENTRY, GFP_KERNEL);
88f4b638c9af467 Yi Liu          2025-03-09  477  	if (xa_is_err(handle)) {
88f4b638c9af467 Yi Liu          2025-03-09 @478  		rc = PTR_ERR(handle);

This should be: rc = xa_err(handle);

88f4b638c9af467 Yi Liu          2025-03-09  479  		goto err_unlock;
88f4b638c9af467 Yi Liu          2025-03-09  480  	}
88f4b638c9af467 Yi Liu          2025-03-09  481  
c8cb4382bcb8855 Yi Liu          2025-03-09  482  	if (!handle) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  483  		handle = kzalloc(sizeof(*handle), GFP_KERNEL);
80ca6ff4d5b9edf Yi Liu          2025-03-08  484  		if (!handle) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  485  			rc = -ENOMEM;
88f4b638c9af467 Yi Liu          2025-03-09  486  			goto err_release_id;
80ca6ff4d5b9edf Yi Liu          2025-03-08  487  		}
80ca6ff4d5b9edf Yi Liu          2025-03-08  488  		handle->idev = idev;
405653abe7c7f0c Yi Liu          2025-03-08  489  		xa_init(&handle->device_array);
80ca6ff4d5b9edf Yi Liu          2025-03-08  490  	}
80ca6ff4d5b9edf Yi Liu          2025-03-08  491  
c8cb4382bcb8855 Yi Liu          2025-03-09  492  	old_hwpt = handle->hwpt;
c8cb4382bcb8855 Yi Liu          2025-03-09  493  
405653abe7c7f0c Yi Liu          2025-03-08  494  	rc = xa_insert(&handle->device_array, idev->obj.id, idev, GFP_KERNEL);
3c97e09cef9ed05 Yi Liu          2025-03-08  495  	if (rc) {
3c97e09cef9ed05 Yi Liu          2025-03-08  496  		WARN_ON(rc == -EBUSY && !old_hwpt);
3c97e09cef9ed05 Yi Liu          2025-03-08  497  		goto err_free_handle;
3c97e09cef9ed05 Yi Liu          2025-03-08  498  	}
3c97e09cef9ed05 Yi Liu          2025-03-08  499  
c8cb4382bcb8855 Yi Liu          2025-03-09  500  	if (old_hwpt && old_hwpt != hwpt) {
c8cb4382bcb8855 Yi Liu          2025-03-09  501  		rc = -EINVAL;
3c97e09cef9ed05 Yi Liu          2025-03-08  502  		goto err_erase_dev;
c8cb4382bcb8855 Yi Liu          2025-03-09  503  	}
c8cb4382bcb8855 Yi Liu          2025-03-09  504  
509c6c6f3098710 Yi Liu          2025-02-26  505  	if (attach_resv) {
b2f44814680b569 Nicolin Chen    2024-08-06  506  		rc = iommufd_device_attach_reserved_iova(idev, hwpt_paging);
e8d57210035b637 Jason Gunthorpe 2022-11-29  507  		if (rc)
3c97e09cef9ed05 Yi Liu          2025-03-08  508  			goto err_erase_dev;
58d84f430dc7f73 Jason Gunthorpe 2023-10-25  509  	}
e8d57210035b637 Jason Gunthorpe 2022-11-29  510  
e8d57210035b637 Jason Gunthorpe 2022-11-29  511  	/*
91a2e17e243f70e Jason Gunthorpe 2023-07-17  512  	 * Only attach to the group once for the first device that is in the
91a2e17e243f70e Jason Gunthorpe 2023-07-17  513  	 * group. All the other devices will follow this attachment. The user
91a2e17e243f70e Jason Gunthorpe 2023-07-17  514  	 * should attach every device individually to the hwpt as the per-device
91a2e17e243f70e Jason Gunthorpe 2023-07-17  515  	 * reserved regions are only updated during individual device
91a2e17e243f70e Jason Gunthorpe 2023-07-17  516  	 * attachment.
e8d57210035b637 Jason Gunthorpe 2022-11-29  517  	 */
88f4b638c9af467 Yi Liu          2025-03-09  518  	if (!iommufd_group_device_num(igroup, pasid)) {
80ca6ff4d5b9edf Yi Liu          2025-03-08  519  		rc = iommufd_hwpt_attach_device(hwpt, idev, pasid, handle);
e8d57210035b637 Jason Gunthorpe 2022-11-29  520  		if (rc)
339fbf3ae144263 Jason Gunthorpe 2023-03-01  521  			goto err_unresv;
c8cb4382bcb8855 Yi Liu          2025-03-09  522  		handle->hwpt = hwpt;
88f4b638c9af467 Yi Liu          2025-03-09  523  		WARN_ON(xa_is_err(xa_store(&igroup->pasid_attach, pasid, handle,
88f4b638c9af467 Yi Liu          2025-03-09  524  					   GFP_KERNEL)));
e8d57210035b637 Jason Gunthorpe 2022-11-29  525  	}
91a2e17e243f70e Jason Gunthorpe 2023-07-17  526  	refcount_inc(&hwpt->obj.users);
481d086162ecc90 Yi Liu          2025-03-06  527  	mutex_unlock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  528  	return 0;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  529  err_unresv:
509c6c6f3098710 Yi Liu          2025-02-26  530  	if (attach_resv)
b2f44814680b569 Nicolin Chen    2024-08-06  531  		iopt_remove_reserved_iova(&hwpt_paging->ioas->iopt, idev->dev);
3c97e09cef9ed05 Yi Liu          2025-03-08  532  err_erase_dev:
405653abe7c7f0c Yi Liu          2025-03-08  533  	xa_erase(&handle->device_array, idev->obj.id);
80ca6ff4d5b9edf Yi Liu          2025-03-08  534  err_free_handle:
c8cb4382bcb8855 Yi Liu          2025-03-09  535  	if (!old_hwpt)
80ca6ff4d5b9edf Yi Liu          2025-03-08  536  		kfree(handle);
88f4b638c9af467 Yi Liu          2025-03-09  537  err_release_id:
88f4b638c9af467 Yi Liu          2025-03-09  538  	if (!old_hwpt)
88f4b638c9af467 Yi Liu          2025-03-09  539  		xa_release(&igroup->pasid_attach, pasid);
91a2e17e243f70e Jason Gunthorpe 2023-07-17  540  err_unlock:
481d086162ecc90 Yi Liu          2025-03-06  541  	mutex_unlock(&igroup->lock);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  542  	return rc;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  543  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

