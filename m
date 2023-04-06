Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E4B8476;
	Thu,  6 Apr 2023 15:06:43 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id jw24so2143033ejc.3;
        Thu, 06 Apr 2023 08:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680793601; x=1683385601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WobX980C6bMc9a38iuo0UCtbd0J2ivVsUR16UY6ld4=;
        b=MbjEcDCeLAt/UlAvgojRTFhyllyipM6o0/nXwU2CQnlEpiM1Df2Gc/kp4B70n9b8ph
         xVuxnV2xiZzAjQjD8eANKrazHpAP1aiza30Qw86zYdJJtIFL5m80pwLgCW0R/vfxeRgS
         60AfcOPvFKNQxGy2OzqewIO3YIs0GJaPypWkxGQMV1g6J21rhK0HEVBHBxIohe3zLBU3
         bBPG+su7LiH6WBECkMSqO4R9EO7y2wSYGXPjdOYzVcdSufOlsJQTpYVTcuK9ISq/ahss
         jknjBNMvnzpcIvOKLAx4yLhqpkspp3+v8g1RvKNCC5Tgmt27IOF4vj928T8SYfg4uv66
         C8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680793601; x=1683385601;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WobX980C6bMc9a38iuo0UCtbd0J2ivVsUR16UY6ld4=;
        b=II9sQDfs5xb/XcEdbKIyN0I39+hf5KdOoyOv/4UVQXFP6V5lVzuiXGyLQtj2zKU/dP
         5s/1zIbBn3Z7hVibCjJTe1h13ZsY1GT8x5OWzOu23x2rKOXJbOrpFcKtwy+6ptaQpTpT
         lFmjvQKm3XQ+Ex7wNUlItRyJdAF5BS5OuduXbb8CCiRCcTyFeyq+McWCnmQ5DiZ1JRhR
         I+SdmhVGfst767Wn7HPj34blQxwc8u/qwig17PyzZ/cMGieAzlLsPs9MgdkumxFt2tDc
         H1pP0unHrql9EWFo+HnHQjqigy8Q2I/emSMsDGVrzYRqqgxoCLxl6lau4Bm+yd4OxCqj
         fV1g==
X-Gm-Message-State: AAQBX9dmphPg6QObac2gvbxtvOrhMjICoRfvJ/LCk48Anv803GHNzNdS
	VefF+otRAJDM2ZykZc0kE+yS3QyTb8IykA==
X-Google-Smtp-Source: AKy350YF7/RUYmdyCg390bju08mY5ezvPSm6sjL3uS/A7+Tu2Y0TRFKbBmyPtN3P5PYRqqaVRl/HZg==
X-Received: by 2002:a17:906:144d:b0:93f:fbe:ed17 with SMTP id q13-20020a170906144d00b0093f0fbeed17mr6551457ejc.62.1680793601226;
        Thu, 06 Apr 2023 08:06:41 -0700 (PDT)
Received: from localhost (h130e.n1.ips.mtn.co.ug. [41.210.147.14])
        by smtp.gmail.com with ESMTPSA id i9-20020a1709063c4900b00947c0cecceasm896218ejg.206.2023.04.06.08.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:06:40 -0700 (PDT)
Date: Thu, 6 Apr 2023 17:53:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 3/42]
 drivers/iommu/iommufd/device.c:329 iommufd_device_get_hw_info() error:
 uninitialized symbol 'rc'.
Message-ID: <e5fc1830-14b6-4e4c-8ded-0542ef601a81@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-03292023-yi
head:   032ce679f2322b426350f8721d7a1afca1bb7aab
commit: 06ac6c12f5cac61638684e9d6f3fee0fca1287d3 [3/42] iommufd: Add IOMMU_DEVICE_GET_HW_INFO
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230406/202304062233.7sW2ckXj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304062233.7sW2ckXj-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:329 iommufd_device_get_hw_info() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/device.c:335 iommufd_device_get_hw_info() error: 'data' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/iommu/iommufd/device.c:1151 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/rc +329 drivers/iommu/iommufd/device.c

06ac6c12f5cac6 Yi Liu 2023-01-12  277  int iommufd_device_get_hw_info(struct iommufd_ucmd *ucmd)
06ac6c12f5cac6 Yi Liu 2023-01-12  278  {
06ac6c12f5cac6 Yi Liu 2023-01-12  279  	struct iommu_hw_info *cmd = ucmd->cmd;
06ac6c12f5cac6 Yi Liu 2023-01-12  280  	unsigned int length, data_len;
06ac6c12f5cac6 Yi Liu 2023-01-12  281  	struct iommufd_device *idev;
06ac6c12f5cac6 Yi Liu 2023-01-12  282  	const struct iommu_ops *ops;
06ac6c12f5cac6 Yi Liu 2023-01-12  283  	void *data = NULL;
06ac6c12f5cac6 Yi Liu 2023-01-12  284  	int rc;
06ac6c12f5cac6 Yi Liu 2023-01-12  285  
06ac6c12f5cac6 Yi Liu 2023-01-12  286  	if (cmd->flags || cmd->__reserved || !cmd->data_len)
06ac6c12f5cac6 Yi Liu 2023-01-12  287  		return -EOPNOTSUPP;
06ac6c12f5cac6 Yi Liu 2023-01-12  288  
06ac6c12f5cac6 Yi Liu 2023-01-12  289  	idev = iommufd_get_device(ucmd, cmd->dev_id);
06ac6c12f5cac6 Yi Liu 2023-01-12  290  	if (IS_ERR(idev))
06ac6c12f5cac6 Yi Liu 2023-01-12  291  		return PTR_ERR(idev);
06ac6c12f5cac6 Yi Liu 2023-01-12  292  
06ac6c12f5cac6 Yi Liu 2023-01-12  293  	ops = dev_iommu_ops(idev->dev);
06ac6c12f5cac6 Yi Liu 2023-01-12  294  	if (!ops->hw_info) {
06ac6c12f5cac6 Yi Liu 2023-01-12  295  		rc = 0;
06ac6c12f5cac6 Yi Liu 2023-01-12  296  		length = 0;
06ac6c12f5cac6 Yi Liu 2023-01-12  297  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  298  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  299  
06ac6c12f5cac6 Yi Liu 2023-01-12  300  	/* driver has hw_info callback should have a unique hw_info_type */
06ac6c12f5cac6 Yi Liu 2023-01-12  301  	if (ops->hw_info_type == IOMMU_HW_INFO_TYPE_NONE) {
06ac6c12f5cac6 Yi Liu 2023-01-12  302  		pr_warn_ratelimited("iommu driver set an invalid type\n");
06ac6c12f5cac6 Yi Liu 2023-01-12  303  		rc = -ENODEV;
06ac6c12f5cac6 Yi Liu 2023-01-12  304  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  305  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  306  
06ac6c12f5cac6 Yi Liu 2023-01-12  307  	data = ops->hw_info(idev->dev, &data_len);
06ac6c12f5cac6 Yi Liu 2023-01-12  308  	if (IS_ERR(data)) {
06ac6c12f5cac6 Yi Liu 2023-01-12  309  		rc = PTR_ERR(data);
06ac6c12f5cac6 Yi Liu 2023-01-12  310  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  311  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  312  
06ac6c12f5cac6 Yi Liu 2023-01-12  313  	length = min(cmd->data_len, data_len);
06ac6c12f5cac6 Yi Liu 2023-01-12  314  	if (copy_to_user(u64_to_user_ptr(cmd->data_ptr), data, length)) {
06ac6c12f5cac6 Yi Liu 2023-01-12  315  		rc = -EFAULT;
06ac6c12f5cac6 Yi Liu 2023-01-12  316  		goto out;
06ac6c12f5cac6 Yi Liu 2023-01-12  317  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  318  
06ac6c12f5cac6 Yi Liu 2023-01-12  319  	/*
06ac6c12f5cac6 Yi Liu 2023-01-12  320  	 * Zero the trailing bytes if the user buffer is bigger than the
06ac6c12f5cac6 Yi Liu 2023-01-12  321  	 * data size kernel actually has.
06ac6c12f5cac6 Yi Liu 2023-01-12  322  	 */
06ac6c12f5cac6 Yi Liu 2023-01-12  323  	if (length < cmd->data_len) {
06ac6c12f5cac6 Yi Liu 2023-01-12  324  		rc = iommufd_zero_fill_user(cmd->data_ptr + length,
06ac6c12f5cac6 Yi Liu 2023-01-12  325  					    cmd->data_len - length);
06ac6c12f5cac6 Yi Liu 2023-01-12  326  	}

rc not set on else path.


06ac6c12f5cac6 Yi Liu 2023-01-12  327  
06ac6c12f5cac6 Yi Liu 2023-01-12  328  out:
06ac6c12f5cac6 Yi Liu 2023-01-12 @329  	if (!rc) {
06ac6c12f5cac6 Yi Liu 2023-01-12  330  		cmd->out_data_type = ops->hw_info_type;
06ac6c12f5cac6 Yi Liu 2023-01-12  331  		cmd->data_len = length;
06ac6c12f5cac6 Yi Liu 2023-01-12  332  		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
06ac6c12f5cac6 Yi Liu 2023-01-12  333  	}
06ac6c12f5cac6 Yi Liu 2023-01-12  334  
06ac6c12f5cac6 Yi Liu 2023-01-12 @335  	kfree(data);
06ac6c12f5cac6 Yi Liu 2023-01-12  336  	iommufd_put_object(&idev->obj);
06ac6c12f5cac6 Yi Liu 2023-01-12  337  	return rc;
06ac6c12f5cac6 Yi Liu 2023-01-12  338  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

