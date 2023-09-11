Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BC188
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 07:51:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-401da71b85eso45067215e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 00:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694418668; x=1695023468; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWnYh4CN57jmnhJ4yU3N3USKhafop4eKhKph1Fyl+mc=;
        b=aSY8gTYKmBCPNgaU2GEK6+64sfhzuGQKyGwnuz01Hn4o1jRLv8PSO90fzWQOinz4/Y
         cdsBwvM7bwQ6vkNeO0WuHwJ/6CKinU4u3sJrlySMpPE+BdEUp8RaSo2P9mXP5Rixi6wf
         pqtQ1Onh7SiQkVa5blaB13TBR+K5rXBiUjP9ntEPiUQ2X4yTdbvJVGFw0FlHZPzXXHfA
         jFJP4lDraS/NDSGqokAq0QpnN4lWwbBwkwR5lvW5Cwqbd0MuFDgkW2T7mkpzZzeKl/vn
         U0NIrF47uEYQwmTCm6O+kTGLw4pyvPc2AGv/Ru0BFl9oR4Qw6TUOsdm0y8cCwqxHlng6
         DQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694418668; x=1695023468;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWnYh4CN57jmnhJ4yU3N3USKhafop4eKhKph1Fyl+mc=;
        b=Zfa7rpH3fIGICGkDvRWmcz+lxLjDR9HiVbjGrPh6BDfP1KeQUJZcKSyB7KhNz+NoRf
         2dP1LgUIozi71efIJF2QE/6qv7pgSuz+VON9j49LkicfXTwnYO+IsZ+Pikqh2S+ZAk1U
         AusZWe7Aapukq6FieUL8GiwewI7jviM1re+HZuls8o3X8LbsdQ9RUGxpS7+Qh8So1CC7
         +nhjgvd+LAqYVTkPe+k3UT7a6qKDirYAKkwdJEZHwGJyrtVOGNTbxG6QlB6Hp2VNR/aS
         +Me0PYUyKklocW525dA9SH83YGRpPSyUBoGBK7HXysTdQmP79sqBqXrZAh/SM0QH8793
         4W8A==
X-Gm-Message-State: AOJu0YzN8eueZaGLGty2PCN6TI4C3TqX5GraVjWe6kbXEEScWAnm7q6s
	YTH8jd7RH/QeFCf17O5G483J991OI+0Tya6r6T8=
X-Google-Smtp-Source: AGHT+IECbvY4Hp7cae3cXFMGtYytnGnLISzQ3uBSG7uUw/oIeICC3Zeub830AdClcieScDUYfqLX7Q==
X-Received: by 2002:a05:600c:21d8:b0:3fc:e1:24b5 with SMTP id x24-20020a05600c21d800b003fc00e124b5mr7405212wmj.23.1694418667873;
        Mon, 11 Sep 2023 00:51:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f7-20020a7bcd07000000b00401c595fcc7sm12415696wmj.11.2023.09.11.00.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 00:51:07 -0700 (PDT)
Date: Mon, 11 Sep 2023 10:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_09042023-yi-not-tested 13/26]
 drivers/iommu/iommufd/hw_pagetable.c:325 iommufd_hwpt_alloc() error:
 potentially dereferencing uninitialized 'parent'.
Message-ID: <3ae3ca2f-290b-4697-b8f3-4c1f98ac01d3@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_09042023-yi-not-tested
head:   19df4ebfe078e091791110a53bfcc1abc6f72fb3
commit: 56bfc2cb8d81259247dcedd479140554c66f9aa3 [13/26] iommufd: Add user-managed hw_pagetable support
config: x86_64-randconfig-161-20230907 (https://download.01.org/0day-ci/archive/20230909/202309090432.uLNWDOfL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309090432.uLNWDOfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309090432.uLNWDOfL-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:325 iommufd_hwpt_alloc() error: potentially dereferencing uninitialized 'parent'.

vim +/parent +325 drivers/iommu/iommufd/hw_pagetable.c

7074d7bd67d495 Jason Gunthorpe 2023-07-17  284  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  285  {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  286  	struct iommufd_hw_pagetable *(*alloc_fn)(
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  287  					struct iommufd_ctx *ictx,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  288  					struct iommufd_object *pt_obj,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  289  					struct iommufd_device *idev,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  290  					u32 flags, enum iommu_hwpt_type type,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  291  					struct iommu_user_data *user_data,
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  292  					bool flag);
56bfc2cb8d8125 Nicolin Chen    2023-08-02  293  	struct iommufd_hw_pagetable *hwpt, *parent;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  294  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  295  	struct iommufd_object *pt_obj;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  296  	struct iommufd_device *idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  297  	struct iommufd_ioas *ioas;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  298  	struct mutex *mutex;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  299  	int rc;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  300  
08fa18dbae1178 Yi Liu          2023-09-01  301  	if (cmd->flags & (~IOMMU_HWPT_ALLOC_NEST_PARENT) || cmd->__reserved)
7074d7bd67d495 Jason Gunthorpe 2023-07-17  302  		return -EOPNOTSUPP;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  303  
7074d7bd67d495 Jason Gunthorpe 2023-07-17  304  	idev = iommufd_get_device(ucmd, cmd->dev_id);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  305  	if (IS_ERR(idev))
7074d7bd67d495 Jason Gunthorpe 2023-07-17  306  		return PTR_ERR(idev);
7074d7bd67d495 Jason Gunthorpe 2023-07-17  307  
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  308  	pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  309  	if (IS_ERR(pt_obj)) {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  310  		rc = -EINVAL;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  311  		goto out_put_idev;
7074d7bd67d495 Jason Gunthorpe 2023-07-17  312  	}
7074d7bd67d495 Jason Gunthorpe 2023-07-17  313  
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  314  	switch (pt_obj->type) {
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  315  	case IOMMUFD_OBJ_IOAS:
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  316  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  317  		mutex = &ioas->mutex;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  318  		alloc_fn = iommufd_hw_pagetable_alloc;
cbc3bc72c8f4d4 Nicolin Chen    2023-08-02  319  		break;
56bfc2cb8d8125 Nicolin Chen    2023-08-02  320  	case IOMMUFD_OBJ_HW_PAGETABLE:
56bfc2cb8d8125 Nicolin Chen    2023-08-02  321  		/*
56bfc2cb8d8125 Nicolin Chen    2023-08-02  322  		 * No user-managed HWPT on top of an user-managed one,
56bfc2cb8d8125 Nicolin Chen    2023-08-02  323  		 * parent should be allocated with NEST_PARENT flag.
56bfc2cb8d8125 Nicolin Chen    2023-08-02  324  		 */
56bfc2cb8d8125 Nicolin Chen    2023-08-02 @325  		if (parent->user_managed || !parent->nest_parent) {
                                                                    ^^^^^^^^                ^^^^^^^^^^
parent is uninitialized.



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

