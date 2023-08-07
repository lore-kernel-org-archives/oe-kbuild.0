Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E621369
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Aug 2023 05:41:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe48a2801bso6716287e87.1
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Aug 2023 22:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691386911; x=1691991711;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQhLfEtwIFdBlJJf2lRg7Mp04T0Ooyj+nqbL8L1R7jk=;
        b=riBSp9sdF8AblRzxN+M+hPHU7AGMthcxA4Ref1FP963iGCrMHYMkG9ri/MPsDTiwfy
         iOkDGufm4hsjeBtCZrt7TabuGPcNJ+QG0kMMPIqk9/0t6tzdXJMbRz1lpZs2aAVppasN
         JbEqZin0xc7f21lK1FTIvurkJd5sF4TuzbGBcWYMLAGHwlrU22Ca4u751gq/eEfsU8/Q
         O7Bp3akOXorJLJIh/0Kz+yDeKl6LusJbOYnSbnIkdEuV5lWVC/NAPjxnM8N46nWwGzq2
         ZZgq+6P1udhOZZwBKUmEBboVm7dAS60C3qF5o7lCn+GARLb42j20/V9f9Lqaj8ka7zpo
         yxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691386911; x=1691991711;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQhLfEtwIFdBlJJf2lRg7Mp04T0Ooyj+nqbL8L1R7jk=;
        b=IROVeahd2Y7ecrylx/hXpID+jIdX/pJ6kVxdq5/Sz21Y73W8QwQo59rifke0JRhSr4
         9edWxbrTDW76vb7dKYMkyGWK80TtYK5rqskmgydbcE0Fl6jebxh6xxylaI0a1w4q56G1
         QKOfxQCEIYSSSAi85aEv6JtO00BrdaPhZ95hzsGqd8oqyMvCsv4UwkP5EkOzbQ8mgtcd
         xgfxCX3vm6+MxWjJHaYuH2+LLfQtUv60jbX1Tb0vu2fbpLou/6qb39QMrjMF+LL6QFbp
         5+GHydSg5Eds6HwHkdLk+Q9nkPqw+syj7A4ycoZ+lVGBZLBEnedxvhh324fDI/2St61G
         /2cw==
X-Gm-Message-State: AOJu0YwITaNDetwEBcWe8+O8mEdBuj9idQ+8DH78y3L0u1QdXnqyYsyt
	3QFEELBuYEpKDsvmDb19CsdTppvv3u2Ao1KNUrU=
X-Google-Smtp-Source: AGHT+IFM5IgQ/YZV5kTj/ouznfSRyS6y7wtuXOW51mHC9VE5HOr+dSnyNMB/OyR9SpO/dim9BDXt7A==
X-Received: by 2002:a05:6512:3451:b0:4f9:54f0:b6db with SMTP id j17-20020a056512345100b004f954f0b6dbmr4524330lfr.13.1691386910826;
        Sun, 06 Aug 2023 22:41:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a7bc5d6000000b003fe195cecb3sm13891480wmk.38.2023.08.06.22.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 22:41:50 -0700 (PDT)
Date: Mon, 7 Aug 2023 08:41:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting_08042023-yi 12/57]
 drivers/iommu/iommufd/device.c:358 iommufd_must_remove_rr() error: we
 previously assumed 'new_hwpt' could be null (see line 341)
Message-ID: <e3e90a72-c226-46de-9b58-3e8b64630afc@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting_08042023-yi
head:   298b42007955fc150cad88c629de50dab7050f15
commit: cec938742db5c16708db0642a49e51085bee34f6 [12/57] iommufd: Handle IOMMU_RESV_SW_MSI complication with user-managed HWPTs
config: i386-randconfig-m021-20230806 (https://download.01.org/0day-ci/archive/20230806/202308062128.ASglP8pP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308062128.ASglP8pP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308062128.ASglP8pP-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/device.c:358 iommufd_must_remove_rr() error: we previously assumed 'new_hwpt' could be null (see line 341)
drivers/iommu/iommufd/device.c:433 iommufd_must_enforce_rr() error: we previously assumed 'old_hwpt' could be null (see line 414)

vim +/new_hwpt +358 drivers/iommu/iommufd/device.c

588f26078f3dfd4 Nicolin Chen    2023-08-01  330  static bool iommufd_must_remove_rr(struct iommufd_hw_pagetable *old_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  331  				   struct iommufd_hw_pagetable *new_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  332  				   bool *keep_sw_msi)
588f26078f3dfd4 Nicolin Chen    2023-08-01  333  {
cec938742db5c16 Nicolin Chen    2023-08-02  334  	struct iommufd_ioas *old_ioas, *new_ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  335  
cec938742db5c16 Nicolin Chen    2023-08-02  336  	if (old_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  337  		old_ioas = old_hwpt->parent->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  338  	else
cec938742db5c16 Nicolin Chen    2023-08-02  339  		old_ioas = old_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  340  
588f26078f3dfd4 Nicolin Chen    2023-08-01 @341  	if (!new_hwpt)
588f26078f3dfd4 Nicolin Chen    2023-08-01  342  		new_ioas = NULL;

This code assumes that new_hwpt can be NULL

cec938742db5c16 Nicolin Chen    2023-08-02  343  	else if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  344  		new_ioas = new_hwpt->parent->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  345  	else
588f26078f3dfd4 Nicolin Chen    2023-08-01  346  		new_ioas = new_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  347  
588f26078f3dfd4 Nicolin Chen    2023-08-01  348  	/* When switching IOAS, cleaning up the old IOAS is a must */
cec938742db5c16 Nicolin Chen    2023-08-02  349  	if (old_ioas != new_ioas) {
cec938742db5c16 Nicolin Chen    2023-08-02  350  		*keep_sw_msi = false;
cec938742db5c16 Nicolin Chen    2023-08-02  351  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  352  	}
cec938742db5c16 Nicolin Chen    2023-08-02  353  
cec938742db5c16 Nicolin Chen    2023-08-02  354  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  355  	 * Must keep IOMMU_RESV_SW_MSI when switching from a kernel-managed
cec938742db5c16 Nicolin Chen    2023-08-02  356  	 * hw_pagetable to its associated user-managed hw_pagetable.
cec938742db5c16 Nicolin Chen    2023-08-02  357  	 */
cec938742db5c16 Nicolin Chen    2023-08-02 @358  	if (!old_hwpt->user_managed && new_hwpt->user_managed) {
                                                                                       ^^^^^^^^^^^^^^^^^^^^^^
Unchecked dereference.

cec938742db5c16 Nicolin Chen    2023-08-02  359  		*keep_sw_msi = true;
588f26078f3dfd4 Nicolin Chen    2023-08-01  360  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  361  	}
cec938742db5c16 Nicolin Chen    2023-08-02  362  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  363  	 * Do not remove in the remaining cases when IOAS isn't changed:
cec938742db5c16 Nicolin Chen    2023-08-02  364  	 * - switching from a kernel-managed hw_pagetable to another kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  365  	 *   managed hw_pagetable associated to the same IOAS. All the existing
cec938742db5c16 Nicolin Chen    2023-08-02  366  	 *   reserved regions remain in the IOAS in this case.
cec938742db5c16 Nicolin Chen    2023-08-02  367  	 * - switching from a user-managed hw_pagetable to an associated kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  368  	 *   managed hw_pagetable. In this case, all reserved regions must have
cec938742db5c16 Nicolin Chen    2023-08-02  369  	 *   been enforced in the IOAS, i.e. no removal after the enforcement.
cec938742db5c16 Nicolin Chen    2023-08-02  370  	 * - switching from a user-managed hw_pagetable to another user-managed
cec938742db5c16 Nicolin Chen    2023-08-02  371  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
cec938742db5c16 Nicolin Chen    2023-08-02  372  	 *   In this case, the existing IOMMU_RESV_SW_MSI regions must be kept.
cec938742db5c16 Nicolin Chen    2023-08-02  373  	 */
588f26078f3dfd4 Nicolin Chen    2023-08-01  374  	return false;
588f26078f3dfd4 Nicolin Chen    2023-08-01  375  }
[ snip ]

588f26078f3dfd4 Nicolin Chen    2023-08-01  403  static bool iommufd_must_enforce_rr(struct iommufd_hw_pagetable *old_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  404  				    struct iommufd_hw_pagetable *new_hwpt,
cec938742db5c16 Nicolin Chen    2023-08-02  405  				    bool *sw_msi_only)
588f26078f3dfd4 Nicolin Chen    2023-08-01  406  {
cec938742db5c16 Nicolin Chen    2023-08-02  407  	struct iommufd_ioas *old_ioas, *new_ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  408  
cec938742db5c16 Nicolin Chen    2023-08-02  409  	if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  410  		new_ioas = new_hwpt->parent->ioas;
cec938742db5c16 Nicolin Chen    2023-08-02  411  	else
cec938742db5c16 Nicolin Chen    2023-08-02  412  		new_ioas = new_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  413  
588f26078f3dfd4 Nicolin Chen    2023-08-01 @414  	if (!old_hwpt)
                                                             ^^^^^^^^
Same

588f26078f3dfd4 Nicolin Chen    2023-08-01  415  		old_ioas = NULL;
cec938742db5c16 Nicolin Chen    2023-08-02  416  	else if (old_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  417  		old_ioas = old_hwpt->parent->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  418  	else
588f26078f3dfd4 Nicolin Chen    2023-08-01  419  		old_ioas = old_hwpt->ioas;
588f26078f3dfd4 Nicolin Chen    2023-08-01  420  
cec938742db5c16 Nicolin Chen    2023-08-02  421  	if (new_hwpt->user_managed)
cec938742db5c16 Nicolin Chen    2023-08-02  422  		*sw_msi_only = true;
cec938742db5c16 Nicolin Chen    2023-08-02  423  	else
cec938742db5c16 Nicolin Chen    2023-08-02  424  		*sw_msi_only = false;
cec938742db5c16 Nicolin Chen    2023-08-02  425  
588f26078f3dfd4 Nicolin Chen    2023-08-01  426  	/* When switching IOAS, enforcing the new IOAS is a must */
cec938742db5c16 Nicolin Chen    2023-08-02  427  	if (old_ioas != new_ioas)
cec938742db5c16 Nicolin Chen    2023-08-02  428  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  429  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  430  	 * Do not forget to enforce all regions when switching from a user-
cec938742db5c16 Nicolin Chen    2023-08-02  431  	 * managed hw_pagetable to its parent kernel-managed hw_pagetable.
cec938742db5c16 Nicolin Chen    2023-08-02  432  	 */
cec938742db5c16 Nicolin Chen    2023-08-02 @433  	if (old_hwpt->user_managed && !new_hwpt->user_managed)
                                                            ^^^^^^^^^^^^^^^^^^^^^^
Unchecked.

588f26078f3dfd4 Nicolin Chen    2023-08-01  434  		return true;
cec938742db5c16 Nicolin Chen    2023-08-02  435  	/*
cec938742db5c16 Nicolin Chen    2023-08-02  436  	 * Do not enforce in the remaining cases when IOAS isn't changed:
cec938742db5c16 Nicolin Chen    2023-08-02  437  	 * - switching from a kernel-managed hw_pagetable to another kernel-
cec938742db5c16 Nicolin Chen    2023-08-02  438  	 *   managed hw_pagetable associated to the same IOAS. All the existing
cec938742db5c16 Nicolin Chen    2023-08-02  439  	 *   reserved regions remain in the IOAS in this case.
cec938742db5c16 Nicolin Chen    2023-08-02  440  	 * - switching from a kernel-managed hw_pagetable to its associated
cec938742db5c16 Nicolin Chen    2023-08-02  441  	 *   user-managed hw_pagetable. In this case, all the reserved regions
cec938742db5c16 Nicolin Chen    2023-08-02  442  	 *   except IOMMU_RESV_SW_MSI will be removed from the reserved list.
cec938742db5c16 Nicolin Chen    2023-08-02  443  	 * - switching from a user-managed hw_pagetable to another user-managed
cec938742db5c16 Nicolin Chen    2023-08-02  444  	 *   hw_pagetable associated to the same parent hw_pagetable (or IOAS).
cec938742db5c16 Nicolin Chen    2023-08-02  445  	 *   In this case, IOMMU_RESV_SW_MSI is already enforced in the IOAS.
cec938742db5c16 Nicolin Chen    2023-08-02  446  	 */
588f26078f3dfd4 Nicolin Chen    2023-08-01  447  	return false;
588f26078f3dfd4 Nicolin Chen    2023-08-01  448  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

