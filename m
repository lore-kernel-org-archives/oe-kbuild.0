Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003841C04
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Oct 2023 04:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ypwn6iCo"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5071165d5so46354971fa.0
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Oct 2023 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698209216; x=1698814016; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suMfGZBMuJJ3ZPNgb3oGCd+oj2cE5p1SU2OfEz0kNdM=;
        b=Ypwn6iCoEQnozpck3pkJE6Kz4u9/tySQHy4ug0yYkvDXN1HyytVpHWNYiQnTrdDVtD
         LUE5a1tRHYpMV74TbySpT7u7Nbdzuhnw+n7W38PZ6M6279eTY3GeSNsSQNfs1Nb+rax3
         BQLdQ4exbDqVxZuVO2EdHDHSo4Rtauwgm1/1AKNlVZd2+ymhCJgRpcT+wS/722qta/pj
         nu2PUK0sehGq1lhtzRcfHo2a29isjRv/ZdHSrnnBXBYNoZK7FtDhrcKTU4g2KrVOO+TA
         hTiOZOKc0sObqpx5DNAGiTsHGZC93Vdw6x3IHfOWPBAUWtDAc6d+F2n+2v4WBrLvkkYt
         AxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698209216; x=1698814016;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suMfGZBMuJJ3ZPNgb3oGCd+oj2cE5p1SU2OfEz0kNdM=;
        b=fmxP6MgypN0M4GRhXngB2sdHqHCi57dSOXujbDh15y7gdQV/XAxkxv7zUIK0THKrhG
         ZXHKq2P65sSmC7iTlxmCCPl4pCdZJcr24B0zQfMC0iMeGIch7toTG6gw1UPs50zMX5je
         6YH5QDqDrCoq/Hb14sVes9VcZkk+VlD/v7GKVCIjTpHs5N8hVmwJYzxKB2SoODEZ8iip
         urSuakX1Hvd3hJFhTU5lxkWBXrNczGCpMGQ9Pv8dlwWRVoVkvABq/hGO79pWnPzRvUHX
         47IjkfqLcTtOZQKzRNs4kqvSJz4HNKiLubn7iZnH6kiuPBcbm2ypR1zsX/CymN+N49kB
         vx2w==
X-Gm-Message-State: AOJu0YzP9MwXrsbUIHQKlNyyeLn3jQsKrrb4z79nf0bzMs3X6XzmVTUD
	WDE2NLD1BFEU6aOhouMWOJ4+N1FwsgccZjeZy+o=
X-Google-Smtp-Source: AGHT+IEg/ozvQuqwfL1Jkqch3FXYThvTnuP2tDGSVtu9w6TnwzKYCjFXu019hJQRpU/SM7F5G7O2DA==
X-Received: by 2002:a2e:bc26:0:b0:2c0:20e3:990f with SMTP id b38-20020a2ebc26000000b002c020e3990fmr12377104ljf.10.1698209215724;
        Tue, 24 Oct 2023 21:46:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bcbcf000000b004060f0a0fdbsm18216807wmi.41.2023.10.24.21.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 21:46:55 -0700 (PDT)
Date: Wed, 25 Oct 2023 07:46:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-10202023-yi 9/54]
 drivers/iommu/iommufd/selftest.c:232 mock_domain_alloc_user() warn: can
 'mock_parent' even be NULL?
Message-ID: <e5576ff2-aae5-4561-9078-4a84248a17a6@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-10202023-yi
head:   7e413d2798f93759b4500bd7bfdc9a6186bf68ae
commit: e8d915274cfedb8169b63ceae4cb015c63e92af8 [9/54] iommufd/selftest: Add nested domain allocation for mock domain
config: x86_64-randconfig-161-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251111.VbtSeoru-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231025/202310251111.VbtSeoru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310251111.VbtSeoru-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/selftest.c:232 mock_domain_alloc_user() warn: can 'mock_parent' even be NULL?

vim +/mock_parent +232 drivers/iommu/iommufd/selftest.c

408663619fcfc8 Yi Liu       2023-09-28  207  static struct iommu_domain *
530905d6710537 Yi Liu       2023-09-01  208  mock_domain_alloc_user(struct device *dev, u32 flags,
530905d6710537 Yi Liu       2023-09-01  209  		       struct iommu_domain *parent,
530905d6710537 Yi Liu       2023-09-01  210  		       const struct iommu_user_data *user_data)
408663619fcfc8 Yi Liu       2023-09-28  211  {
e8d915274cfedb Nicolin Chen 2023-02-26  212  	struct mock_iommu_domain *mock_parent;
e8d915274cfedb Nicolin Chen 2023-02-26  213  	struct iommu_hwpt_selftest user_cfg;
e8d915274cfedb Nicolin Chen 2023-02-26  214  	int rc;
408663619fcfc8 Yi Liu       2023-09-28  215  
408663619fcfc8 Yi Liu       2023-09-28  216  	if (flags & (~IOMMU_HWPT_ALLOC_NEST_PARENT))
408663619fcfc8 Yi Liu       2023-09-28  217  		return ERR_PTR(-EOPNOTSUPP);
408663619fcfc8 Yi Liu       2023-09-28  218  
e8d915274cfedb Nicolin Chen 2023-02-26  219  	if (!user_data) {	/* must be mock_domain */
e8d915274cfedb Nicolin Chen 2023-02-26  220  		if (parent)
e8d915274cfedb Nicolin Chen 2023-02-26  221  			return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  222  		return __mock_domain_alloc_paging(IOMMU_DOMAIN_UNMANAGED);
e8d915274cfedb Nicolin Chen 2023-02-26  223  	}
e8d915274cfedb Nicolin Chen 2023-02-26  224  
e8d915274cfedb Nicolin Chen 2023-02-26  225  	/* must be mock_domain_nested */
e8d915274cfedb Nicolin Chen 2023-02-26  226  	if (user_data->type != IOMMU_HWPT_DATA_SELFTEST)
e8d915274cfedb Nicolin Chen 2023-02-26  227  		return ERR_PTR(-EOPNOTSUPP);
e8d915274cfedb Nicolin Chen 2023-02-26  228  	if (!parent || parent->ops != mock_ops.default_domain_ops)
e8d915274cfedb Nicolin Chen 2023-02-26  229  		return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  230  
e8d915274cfedb Nicolin Chen 2023-02-26  231  	mock_parent = container_of(parent, struct mock_iommu_domain, domain);
e8d915274cfedb Nicolin Chen 2023-02-26 @232  	if (!mock_parent)

Yeah.  No need to check for NULL.  mock_parent is parent with an offset
subtracted from it.

e8d915274cfedb Nicolin Chen 2023-02-26  233  		return ERR_PTR(-EINVAL);
e8d915274cfedb Nicolin Chen 2023-02-26  234  
e8d915274cfedb Nicolin Chen 2023-02-26  235  	rc = iommu_copy_struct_from_user(&user_cfg, user_data,
e8d915274cfedb Nicolin Chen 2023-02-26  236  					 IOMMU_HWPT_DATA_SELFTEST, iotlb);
e8d915274cfedb Nicolin Chen 2023-02-26  237  	if (rc)
e8d915274cfedb Nicolin Chen 2023-02-26  238  		return ERR_PTR(rc);
e8d915274cfedb Nicolin Chen 2023-02-26  239  
e8d915274cfedb Nicolin Chen 2023-02-26  240  	return __mock_domain_alloc_nested(mock_parent, &user_cfg);
408663619fcfc8 Yi Liu       2023-09-28  241  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

