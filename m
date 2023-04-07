Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682711FBC;
	Fri,  7 Apr 2023 08:58:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id l12so41758563wrm.10;
        Fri, 07 Apr 2023 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680857883; x=1683449883;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2zU8xpPm7B7AOktQAN+xESgPuKd0jMKHam6FOaB2TI=;
        b=U/ZDTWee6RYE53r2CgnupRr+4gk5Zrpho+990CYH5EP6TQU3oeP6NQF+e88sr3dhLD
         JONpXp6v4PEt7h9fBXYz/vzbga0kuCL8UNfvU4c6gNoqmykB8YXN6N8gZSWPEsuAY7gw
         IHwk3xd+M9LVbDJ3KJMK6Hn3G3ublNKSChZkXC9wBgsL1y8W7TZ0D6GnK/LjufGRNId2
         5QMoymj/0vRou8iI+FW6fjBqTHw3PfDvcArP5KSVP1t6AVByt+5SfhOR/Jj1yoBcGIYx
         bTP1VXZL9J5jApsjnP+xI2zYcSxb0QM2kJ9ODk0eptmSEk7CYqAn5hXSLXnBxYauOIVi
         0tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857883; x=1683449883;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2zU8xpPm7B7AOktQAN+xESgPuKd0jMKHam6FOaB2TI=;
        b=L9lUT58E2dsAuuEWP06r9oyX2GgfCXFwh/2WmvMqj+0AExuGzLrDyt/xr/q0Ztq6BZ
         0ESN8keX1qCUqkK3FgRPon1wvGuoLavxyqi4TxikQsNNpu1gr2ILhAytXM0DCcA+e7EP
         rNRRvhAMyTjHPZ/BMkJ1qX05vwv2K8rj4McUwk/fDYevS00XcTvSgHbKVpoLG1ecCkZD
         kbcfUuY7nTmatGxcuogWKwF6Ub+D6jV06far75eq8D6Mqm0d7z13mcNsoikpvyRnB2nR
         lOlZzAJqCt/7BDcqfmXs8fZH+jLSi9o6ry5WJw7bo67FwtTj8btlZs/JHgTZc2575SfT
         AVtQ==
X-Gm-Message-State: AAQBX9cq/Zb5UiWdDdlwfNi527il+5ysWmF05v/nu0tKl1wM1n01jrjv
	tHKy3KQGW++E5B1Dv/rfO8DMwtpqnFRKmw==
X-Google-Smtp-Source: AKy350YrFU3JnV/1fVFDeTQB5hMYTnbgnPNaStaShTGDRvOJEO1zIm7HlvtCmVg93FGjicS4AkCWVA==
X-Received: by 2002:adf:f588:0:b0:2d7:c9d1:65eb with SMTP id f8-20020adff588000000b002d7c9d165ebmr831621wro.36.1680857883384;
        Fri, 07 Apr 2023 01:58:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a13-20020adfe5cd000000b002cea8664304sm3967160wrn.91.2023.04.07.01.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 01:58:02 -0700 (PDT)
Date: Fri, 7 Apr 2023 11:57:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 18/42]
 drivers/iommu/iommufd/hw_pagetable.c:329 iommufd_hwpt_invalidate() error:
 uninitialized symbol 'klen'.
Message-ID: <fb615df5-2493-4731-b4ef-fc38b45a0276@kili.mountain>
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
commit: 7c7afc988c9e13edc817899c9ace9504f2483dfe [18/42] iommufd/selftest: Add coverage for IOMMU_HWPT_INVALIDATE ioctl
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070656.pdx7M6xV-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070656.pdx7M6xV-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:329 iommufd_hwpt_invalidate() error: uninitialized symbol 'klen'.

Old smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:162 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error: uninitialized symbol 'klen'.
drivers/iommu/iommufd/hw_pagetable.c:310 iommufd_hwpt_invalidate() warn: always true condition '(cmd->data_type >= (0 / 4 + (0))) => (0-u32max >= 0)'

vim +/klen +329 drivers/iommu/iommufd/hw_pagetable.c

e23c914d2fef0e Yi Liu       2023-01-13  298  
e23c914d2fef0e Yi Liu       2023-01-13  299  int iommufd_hwpt_invalidate(struct iommufd_ucmd *ucmd)
e23c914d2fef0e Yi Liu       2023-01-13  300  {
e23c914d2fef0e Yi Liu       2023-01-13  301  	struct iommu_hwpt_invalidate *cmd = ucmd->cmd;
e23c914d2fef0e Yi Liu       2023-01-13  302  	struct iommufd_hw_pagetable *hwpt;
e23c914d2fef0e Yi Liu       2023-01-13  303  	u64 user_ptr;
e23c914d2fef0e Yi Liu       2023-01-13  304  	u32 user_data_len, klen;
e23c914d2fef0e Yi Liu       2023-01-13  305  	int rc = 0;
e23c914d2fef0e Yi Liu       2023-01-13  306  
e23c914d2fef0e Yi Liu       2023-01-13  307  	/* For a user-managed HWPT, type should not be IOMMU_HWPT_TYPE_DEFAULT */
e23c914d2fef0e Yi Liu       2023-01-13  308  	if (cmd->data_type == IOMMU_HWPT_TYPE_DEFAULT || !cmd->data_len ||
7c7afc988c9e13 Nicolin Chen 2022-12-14  309  	    (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST &&
7c7afc988c9e13 Nicolin Chen 2022-12-14  310  	     cmd->data_type >= ARRAY_SIZE(iommufd_hwpt_invalidate_info_size)))
e23c914d2fef0e Yi Liu       2023-01-13  311  		return -EOPNOTSUPP;
e23c914d2fef0e Yi Liu       2023-01-13  312  
e23c914d2fef0e Yi Liu       2023-01-13  313  	hwpt = iommufd_get_hwpt(ucmd, cmd->hwpt_id);
e23c914d2fef0e Yi Liu       2023-01-13  314  	if (IS_ERR(hwpt))
e23c914d2fef0e Yi Liu       2023-01-13  315  		return PTR_ERR(hwpt);
e23c914d2fef0e Yi Liu       2023-01-13  316  
e23c914d2fef0e Yi Liu       2023-01-13  317  	/* Do not allow any kernel-managed hw_pagetable */
e23c914d2fef0e Yi Liu       2023-01-13  318  	if (!hwpt->parent) {
e23c914d2fef0e Yi Liu       2023-01-13  319  		rc = -EINVAL;
e23c914d2fef0e Yi Liu       2023-01-13  320  		goto out_put_hwpt;
e23c914d2fef0e Yi Liu       2023-01-13  321  	}
e23c914d2fef0e Yi Liu       2023-01-13  322  
7c7afc988c9e13 Nicolin Chen 2022-12-14  323  	if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
e23c914d2fef0e Yi Liu       2023-01-13  324  		klen = iommufd_hwpt_invalidate_info_size[cmd->data_type];
7c7afc988c9e13 Nicolin Chen 2022-12-14  325  #ifdef CONFIG_IOMMUFD_TEST
7c7afc988c9e13 Nicolin Chen 2022-12-14  326  	else
7c7afc988c9e13 Nicolin Chen 2022-12-14  327  		klen = sizeof(struct iommu_hwpt_invalidate_selftest);
7c7afc988c9e13 Nicolin Chen 2022-12-14  328  #endif
e23c914d2fef0e Yi Liu       2023-01-13 @329  	if (!klen) {

Same situation == IOMMU_HWPT_TYPE_SELFTTEST and not defined.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

