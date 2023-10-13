Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13C10945
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kK/U+TH0"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32799639a2aso1707392f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697187007; x=1697791807; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRfUKpv/DBLLhqgF91vJ9c5yRbJ5jeBlC4lGHMsrSOk=;
        b=kK/U+TH0XlPjnTx5yw924MDTIz9hF8pNoqNILgT6SN+yzD1frmKhypKclEQwzW+iZ6
         FNmjQjT4iOFBq0n3W8NOpBOj2i9HkHyZRUf+qHAJDBZwZABS+bVS3AorRnCPU+wsSWkP
         jbD6K7Cg6Jd9xOsbWkoavhAZMdQEw7qDT66/MFyueRmWrWQNNtx1zCIuOhsZjYC8h0ih
         H1/N5MvRjd1PZzrWU9P418j45PYdjrFdZCYLXlHrCKFpFGSMfNjV/OkiVCUuM8BrtLYz
         Lzg6/uuZqNSWXv/q8wgSh7t/D7gRBsoZhrafShLIvX8u//CHEGFJ6gvlYUDGTN/MWZYl
         qprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697187007; x=1697791807;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRfUKpv/DBLLhqgF91vJ9c5yRbJ5jeBlC4lGHMsrSOk=;
        b=iQj8hmThhZjsUoE4vYn/2ajwad0SYDYGHX9OPirLvsp7LHnm8oYvCIPLR3CpentO9m
         HubpmP8mPWUbKF4OHZRX1LlAk3RNswirf26CXzrcYKyhFMnpM2scs4/WQ8SaUcSZ9ZiH
         qUeaevae+r0LcTtVpGN93tFolYc3vU8LbF4V+c3FNFzVzW/Z+Oe1y72Wxw3kTiNMBVCf
         9y9S9ezwlQueT6DVmo7TDLzdb2zWV+wldaoKUJb3xUiHkjbA66NqkKZp6pzGcq3ZSgK8
         VlTcTwLBgVVdAU8t8DynBM93V7IP+MiTgglDZ7iuWjkQy5cEb6e0l0F4B93T+f44x+Ls
         2DAQ==
X-Gm-Message-State: AOJu0Yxda/n+yUOCvimLhRQ4AoqhBjljkbUNM0zgtg+hP+sUUjvuxoV8
	J6v1x76h8ni4UUmVxiGFmstWFKF4FqJ5KYHFd94=
X-Google-Smtp-Source: AGHT+IEOMC+EI3xlIYQWQN8GijlT5dawWbmNOIldygcXlZcDXXIPgVq4wB5UX8eLVSbMvyQaiD8Vjw==
X-Received: by 2002:a05:6000:228:b0:32d:56bd:1f5c with SMTP id l8-20020a056000022800b0032d56bd1f5cmr7734589wrz.71.1697187006813;
        Fri, 13 Oct 2023 01:50:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u18-20020adff892000000b00326b8a0e817sm773575wrp.84.2023.10.13.01.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:50:06 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:50:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-0829 3/95]
 drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return
 -EFAULT instead of the bytes remaining?
Message-ID: <b31e2759-f745-493f-9edc-500b237880b4@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-0829
head:   39409b7fc57036afdb9ea1b641c827951ffbd32e
commit: 69055cc0284095e68fd61f1705ef518ad731d120 [3/95] iommufd: Add IOMMU_GET_HW_INFO
config: x86_64-randconfig-161-20230826 (https://download.01.org/0day-ci/archive/20231013/202310130916.94838ZMF-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130916.94838ZMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310130916.94838ZMF-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/main.c:259 iommufd_get_hw_info() warn: maybe return -EFAULT instead of the bytes remaining?

vim +259 drivers/iommu/iommufd/main.c

69055cc0284095 Yi Liu 2023-01-12  220  static int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
69055cc0284095 Yi Liu 2023-01-12  221  {
69055cc0284095 Yi Liu 2023-01-12  222  	struct iommu_hw_info *cmd = ucmd->cmd;
69055cc0284095 Yi Liu 2023-01-12  223  	unsigned int length = cmd->data_len;
69055cc0284095 Yi Liu 2023-01-12  224  	struct iommufd_device *idev;
69055cc0284095 Yi Liu 2023-01-12  225  	void __user *user_ptr;
69055cc0284095 Yi Liu 2023-01-12  226  	u32 hw_info_type;
69055cc0284095 Yi Liu 2023-01-12  227  	int rc = 0;
69055cc0284095 Yi Liu 2023-01-12  228  
69055cc0284095 Yi Liu 2023-01-12  229  	if (cmd->flags || cmd->__reserved || !cmd->data_len)
69055cc0284095 Yi Liu 2023-01-12  230  		return -EOPNOTSUPP;
69055cc0284095 Yi Liu 2023-01-12  231  
69055cc0284095 Yi Liu 2023-01-12  232  	idev = iommufd_get_device(ucmd, cmd->dev_id);
69055cc0284095 Yi Liu 2023-01-12  233  	if (IS_ERR(idev))
69055cc0284095 Yi Liu 2023-01-12  234  		return PTR_ERR(idev);
69055cc0284095 Yi Liu 2023-01-12  235  
69055cc0284095 Yi Liu 2023-01-12  236  	user_ptr = u64_to_user_ptr(cmd->data_ptr);
69055cc0284095 Yi Liu 2023-01-12  237  
69055cc0284095 Yi Liu 2023-01-12  238  	rc = iommufd_fill_hw_info(idev->dev, user_ptr,
69055cc0284095 Yi Liu 2023-01-12  239  				  &length, &hw_info_type);
69055cc0284095 Yi Liu 2023-01-12  240  	if (rc)
69055cc0284095 Yi Liu 2023-01-12  241  		goto err_put;
69055cc0284095 Yi Liu 2023-01-12  242  
69055cc0284095 Yi Liu 2023-01-12  243  	/*
69055cc0284095 Yi Liu 2023-01-12  244  	 * Zero the trailing bytes if the user buffer is bigger than the
69055cc0284095 Yi Liu 2023-01-12  245  	 * data size kernel actually has.
69055cc0284095 Yi Liu 2023-01-12  246  	 */
69055cc0284095 Yi Liu 2023-01-12  247  	if (length < cmd->data_len) {
69055cc0284095 Yi Liu 2023-01-12  248  		rc = clear_user(user_ptr + length, cmd->data_len - length);

clear_user() is like copy_to_user() and returns the number of bytes
remaining.  It should be:

		if (clear_user(user_ptr + length, cmd->data_len - length)) {
			rc = -EFAULT;
			goto err_put;
		}

69055cc0284095 Yi Liu 2023-01-12  249  		if (rc)
69055cc0284095 Yi Liu 2023-01-12  250  			goto err_put;
69055cc0284095 Yi Liu 2023-01-12  251  	}
69055cc0284095 Yi Liu 2023-01-12  252  
69055cc0284095 Yi Liu 2023-01-12  253  	cmd->data_len = length;
69055cc0284095 Yi Liu 2023-01-12  254  	cmd->out_data_type = hw_info_type;
69055cc0284095 Yi Liu 2023-01-12  255  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
69055cc0284095 Yi Liu 2023-01-12  256  
69055cc0284095 Yi Liu 2023-01-12  257  err_put:
69055cc0284095 Yi Liu 2023-01-12  258  	iommufd_put_object(&idev->obj);
69055cc0284095 Yi Liu 2023-01-12 @259  	return rc;
69055cc0284095 Yi Liu 2023-01-12  260  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

