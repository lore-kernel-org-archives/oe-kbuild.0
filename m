Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EEF5668
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 09:58:36 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-402c1407139so8848035e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Sep 2023 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694080714; x=1694685514; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H93pY4K5RGy48Le8MtNuXSVW/3TVf9QahqAqyrN5AqA=;
        b=mTBbFHSEG9Dq+QrMR14zJb8ptswv4xDfhWBsBXjWJoXZ9eAx+Az2CwESe4p21ONgpq
         9A11Xs9JJSiGwtNkJVzjc5+idmzh2egIyU0mB9Uopz1Nu7ndJyPIxIf9KsDsRFgK3ySp
         Am2eEqCbDifXEfWfDqcZCXbzdFUm4INHeJu26vARFgcUWtZSnj1lqcgoUiCD0XuBXnk1
         VPKVzbT5hzmA9NwAHwq1EGvDuDylSLzqJpLeggY64aWHcfHvlbVmtWR9q+VhHhnpgVpk
         c9cqYbu5wWvbascHxPwjgKLa8A6c7NF0HJMmpCPGZIpnXIHuvT08BZDDZ1Jn45ZVemDJ
         +e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694080714; x=1694685514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H93pY4K5RGy48Le8MtNuXSVW/3TVf9QahqAqyrN5AqA=;
        b=RFNSMecwR3/W9Wph9b9P8WrlRrfR7GlX4cZjVxvqhZCNKTYPEGdrFp27IXuvq7mhtJ
         QZ9qaCPXkvnzDXnS+ltVrhmtg83Engt47IPj7uCxIlaJCFqZ46uTYQzyG19qlkWTCsA+
         rlBsvDSy+4VN7ycbfk73P1KMihNgd6YCT96mx7dHG/3JBpmWjNIh7bxETSEor0tqLQ3F
         28EdJK3v991rHjqxK68ujWTb8o0Wzw8pZoCwJIMV5s+hB1+9aA+8EwFFqp9ZJ4KpoZJJ
         UtDYyFQykGf6pya4vRhj37Eir6sFiCqfgd8fV/47owCuUo+xWV4oN7V5G+5qiRCTIMyI
         yTpA==
X-Gm-Message-State: AOJu0YyOtAzUY1QT9oZ+jhiyQYc5cOcxGNz3s+ZgfPbIcPIxHmPS/2iL
	jfV78kGLJZstu1CX3lFJJTkWOfegtBSYrT9Ywbs=
X-Google-Smtp-Source: AGHT+IH+lYPU38QUaXAeYYuqKyQrTXDFtyGYgyHVyQ4jUsHelGNmSs0dnNbyJqEJz/httA9y1Roo5Q==
X-Received: by 2002:a5d:4406:0:b0:317:5fe7:6844 with SMTP id z6-20020a5d4406000000b003175fe76844mr4113931wrq.39.1694080714060;
        Thu, 07 Sep 2023 02:58:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bj13-20020a0560001e0d00b00317b5c8a4f1sm9837124wrb.60.2023.09.07.02.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:58:33 -0700 (PDT)
Date: Thu, 7 Sep 2023 12:58:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0825 3/95]
 drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return
 -EFAULT instead of the bytes remaining?
Message-ID: <9bdc6686-8561-4ee9-8cd5-adb66daa2bef@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0825
head:   98c119bc01ddf99ad4ac7c3e93980e3d835c0901
commit: 69055cc0284095e68fd61f1705ef518ad731d120 [3/95] iommufd: Add IOMMU_GET_HW_INFO
config: x86_64-randconfig-161-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270513.l9Ht4WmD-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270513.l9Ht4WmD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308270513.l9Ht4WmD-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return -EFAULT instead of the bytes remaining?

vim +259 drivers/iommu/iommufd/main.c

69055cc0284095e Yi Liu 2023-01-12  220  static int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
69055cc0284095e Yi Liu 2023-01-12  221  {
69055cc0284095e Yi Liu 2023-01-12  222  	struct iommu_hw_info *cmd = ucmd->cmd;
69055cc0284095e Yi Liu 2023-01-12  223  	unsigned int length = cmd->data_len;
69055cc0284095e Yi Liu 2023-01-12  224  	struct iommufd_device *idev;
69055cc0284095e Yi Liu 2023-01-12  225  	void __user *user_ptr;
69055cc0284095e Yi Liu 2023-01-12  226  	u32 hw_info_type;
69055cc0284095e Yi Liu 2023-01-12  227  	int rc = 0;
69055cc0284095e Yi Liu 2023-01-12  228  
69055cc0284095e Yi Liu 2023-01-12  229  	if (cmd->flags || cmd->__reserved || !cmd->data_len)
69055cc0284095e Yi Liu 2023-01-12  230  		return -EOPNOTSUPP;
69055cc0284095e Yi Liu 2023-01-12  231  
69055cc0284095e Yi Liu 2023-01-12  232  	idev = iommufd_get_device(ucmd, cmd->dev_id);
69055cc0284095e Yi Liu 2023-01-12  233  	if (IS_ERR(idev))
69055cc0284095e Yi Liu 2023-01-12  234  		return PTR_ERR(idev);
69055cc0284095e Yi Liu 2023-01-12  235  
69055cc0284095e Yi Liu 2023-01-12  236  	user_ptr = u64_to_user_ptr(cmd->data_ptr);
69055cc0284095e Yi Liu 2023-01-12  237  
69055cc0284095e Yi Liu 2023-01-12  238  	rc = iommufd_fill_hw_info(idev->dev, user_ptr,
69055cc0284095e Yi Liu 2023-01-12  239  				  &length, &hw_info_type);
69055cc0284095e Yi Liu 2023-01-12  240  	if (rc)
69055cc0284095e Yi Liu 2023-01-12  241  		goto err_put;
69055cc0284095e Yi Liu 2023-01-12  242  
69055cc0284095e Yi Liu 2023-01-12  243  	/*
69055cc0284095e Yi Liu 2023-01-12  244  	 * Zero the trailing bytes if the user buffer is bigger than the
69055cc0284095e Yi Liu 2023-01-12  245  	 * data size kernel actually has.
69055cc0284095e Yi Liu 2023-01-12  246  	 */
69055cc0284095e Yi Liu 2023-01-12  247  	if (length < cmd->data_len) {
69055cc0284095e Yi Liu 2023-01-12  248  		rc = clear_user(user_ptr + length, cmd->data_len - length);

clear_user() has the same return values as copy_to/from_user().  This
should be:

	if (clear_user(user_ptr + length, cmd->data_len - length)) {
		rc = -EFAULT;
		goto err_put;
	}

69055cc0284095e Yi Liu 2023-01-12  249  		if (rc)
69055cc0284095e Yi Liu 2023-01-12  250  			goto err_put;
69055cc0284095e Yi Liu 2023-01-12  251  	}
69055cc0284095e Yi Liu 2023-01-12  252  
69055cc0284095e Yi Liu 2023-01-12  253  	cmd->data_len = length;
69055cc0284095e Yi Liu 2023-01-12  254  	cmd->out_data_type = hw_info_type;
69055cc0284095e Yi Liu 2023-01-12  255  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
69055cc0284095e Yi Liu 2023-01-12  256  
69055cc0284095e Yi Liu 2023-01-12  257  err_put:
69055cc0284095e Yi Liu 2023-01-12  258  	iommufd_put_object(&idev->obj);
69055cc0284095e Yi Liu 2023-01-12 @259  	return rc;
69055cc0284095e Yi Liu 2023-01-12  260  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

