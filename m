Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D2EC2C7;
	Fri,  7 Apr 2023 08:53:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v1so41773018wrv.1;
        Fri, 07 Apr 2023 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680857591; x=1683449591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G71T9GGseStTKAbGr+pTIDVcU56vAsuCBu0thw43efg=;
        b=Kzsq6x+eLaatjVN7jq7mYXZX7WpIGDpdYUWco7xctcO9vsuwWmWy7M8c5DtsuaY/bR
         PznrlOrqmM3ijKg5ukvwSQKuBBpBJggUgpl1pUUn6PEk1tsh05LtemUuqT5uF4hliNbA
         AA5+y+Fvtw9qy7NVnV47DgYj6bi3aiOlNxmun9EeCFR+qyvoP9oNmpgXdr2bqnuxpyHP
         FUhoSV5tHccl+EhbW3WuSGW9b3pSIgfE8sFLL0Hwih56rrYRf/gv+qntDHn4SpidOss0
         ds4pHIAnb7yoiEtqlactVVXZWjY/iAYdBIFX+VZreWJd6LHRspgeKatCyah1iViCFc81
         1rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857591; x=1683449591;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G71T9GGseStTKAbGr+pTIDVcU56vAsuCBu0thw43efg=;
        b=y+cKhHijNevI0XLhany8IAc378dpTcTKXzSdgczJ5lyTGvl5sV6489MeSgnLFNAV0w
         rY9CHdUqPbkUvnbNXayeKar9eH+AEhc/IM0w7+rO+yoVOBfLaeD56pEhaZzPk8Q5cq+H
         6P5lYSjYnSVYiq5ahGQUfu2KB+otqDVPRp2W9/z4vsuAefX6FuoMWUPlCFAJ6O8NRQab
         LGMDyopdzubkxIpkxMd0n+x+qFHQxnVrmoDlbSUg9hM5Jrk81aqRnUq0+o1zHVWktqNI
         8o2VC5nKkur6A47NI89EINFRYK4aDJsZdByQc/Ew+dqV+S1rd7Hs1s+McA6a7mja+hkX
         B0Fw==
X-Gm-Message-State: AAQBX9eA4ZxlGm1+lW7QnHY2RC673guZDUQ/YZ9YB4a/POIVfupt2VnQ
	P3HFu+vzsgSPDJoGtVq6Wbg4iKG8CS/0xw==
X-Google-Smtp-Source: AKy350bzZyAQfAGMivyHXrgH3jecfQpT8GUM1THZT0oNFEKyGYTXQK1f1lbgGCiS1Ck8DenqxAUIQg==
X-Received: by 2002:adf:dbc3:0:b0:2e4:b9a3:4426 with SMTP id e3-20020adfdbc3000000b002e4b9a34426mr871491wrj.27.1680857591148;
        Fri, 07 Apr 2023 01:53:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d50cd000000b002c71b4d476asm3936670wrt.106.2023.04.07.01.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 01:53:10 -0700 (PDT)
Date: Fri, 7 Apr 2023 11:53:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 9/42]
 drivers/iommu/iommufd/hw_pagetable.c:143 iommufd_hw_pagetable_alloc() error:
 uninitialized symbol 'rc'.
Message-ID: <96a1dd3a-fee1-4dfe-8603-8f28ff1f1f46@kili.mountain>
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
commit: c1cf862f230cf33abdfd85051027ada354fecf14 [9/42] iommufd: Pass parent hwpt and user_data to iommufd_hw_pagetable_alloc()
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070109.JNljFPM5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070109.JNljFPM5-lkp@intel.com/

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:143 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.

vim +/rc +143 drivers/iommu/iommufd/hw_pagetable.c

ea4acfac57b9dee Jason Gunthorpe 2022-11-29   59  struct iommufd_hw_pagetable *
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   60  iommufd_hw_pagetable_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
c1cf862f230cf33 Yi Liu          2023-03-03   61  			   struct iommufd_device *idev,
c1cf862f230cf33 Yi Liu          2023-03-03   62  			   struct iommufd_hw_pagetable *parent,
c1cf862f230cf33 Yi Liu          2023-03-03   63  			   void *user_data, bool immediate_attach)
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   64  {
298c389caeaf008 Yi Liu          2023-01-19   65  	const struct iommu_ops *ops = dev_iommu_ops(idev->dev);
c1cf862f230cf33 Yi Liu          2023-03-03   66  	struct iommu_domain *parent_domain = NULL;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   67  	struct iommufd_hw_pagetable *hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   68  	int rc;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   69  
339fbf3ae144263 Jason Gunthorpe 2023-03-01   70  	lockdep_assert_held(&ioas->mutex);
339fbf3ae144263 Jason Gunthorpe 2023-03-01   71  
c1cf862f230cf33 Yi Liu          2023-03-03   72  	if ((user_data || parent) && !ops->domain_alloc_user)
c1cf862f230cf33 Yi Liu          2023-03-03   73  		return ERR_PTR(-EOPNOTSUPP);
c1cf862f230cf33 Yi Liu          2023-03-03   74  
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   75  	hwpt = iommufd_object_alloc(ictx, hwpt, IOMMUFD_OBJ_HW_PAGETABLE);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   76  	if (IS_ERR(hwpt))
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   77  		return hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   78  
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   79  	INIT_LIST_HEAD(&hwpt->hwpt_item);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   80  	/* Pairs with iommufd_hw_pagetable_destroy() */
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   81  	refcount_inc(&ioas->obj.users);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29   82  	hwpt->ioas = ioas;
c1cf862f230cf33 Yi Liu          2023-03-03   83  	if (parent) {
c1cf862f230cf33 Yi Liu          2023-03-03   84  		hwpt->parent = parent;
c1cf862f230cf33 Yi Liu          2023-03-03   85  		parent_domain = parent->domain;
c1cf862f230cf33 Yi Liu          2023-03-03   86  		refcount_inc(&parent->obj.users);
c1cf862f230cf33 Yi Liu          2023-03-03   87  	}
25cde97d953208b Jason Gunthorpe 2023-03-01   88  
298c389caeaf008 Yi Liu          2023-01-19   89  	if (ops->domain_alloc_user)
c1cf862f230cf33 Yi Liu          2023-03-03   90  		hwpt->domain = ops->domain_alloc_user(idev->dev,
c1cf862f230cf33 Yi Liu          2023-03-03   91  						      parent_domain, user_data);
298c389caeaf008 Yi Liu          2023-01-19   92  	else
339fbf3ae144263 Jason Gunthorpe 2023-03-01   93  		hwpt->domain = iommu_domain_alloc(idev->dev->bus);
25cde97d953208b Jason Gunthorpe 2023-03-01   94  	if (!hwpt->domain) {
25cde97d953208b Jason Gunthorpe 2023-03-01   95  		rc = -ENOMEM;
25cde97d953208b Jason Gunthorpe 2023-03-01   96  		goto out_abort;
25cde97d953208b Jason Gunthorpe 2023-03-01   97  	}
25cde97d953208b Jason Gunthorpe 2023-03-01   98  
c1cf862f230cf33 Yi Liu          2023-03-03   99  	/* It must be either NESTED or UNMANAGED, depending on parent_domain */
c1cf862f230cf33 Yi Liu          2023-03-03  100  	if (WARN_ON((parent_domain && hwpt->domain->type != IOMMU_DOMAIN_NESTED) ||
c1cf862f230cf33 Yi Liu          2023-03-03  101  	            (!parent_domain && hwpt->domain->type != IOMMU_DOMAIN_UNMANAGED)))
c1cf862f230cf33 Yi Liu          2023-03-03  102  		goto out_abort;

Needs an error code on this path.

c1cf862f230cf33 Yi Liu          2023-03-03  103  
403bdbf937722d2 Jason Gunthorpe 2023-02-16  104  	/*
403bdbf937722d2 Jason Gunthorpe 2023-02-16  105  	 * Set the coherency mode before we do iopt_table_add_domain() as some
403bdbf937722d2 Jason Gunthorpe 2023-02-16  106  	 * iommus have a per-PTE bit that controls it and need to decide before
403bdbf937722d2 Jason Gunthorpe 2023-02-16  107  	 * doing any maps. It is an iommu driver bug to report
403bdbf937722d2 Jason Gunthorpe 2023-02-16  108  	 * IOMMU_CAP_ENFORCE_CACHE_COHERENCY but fail enforce_cache_coherency on
403bdbf937722d2 Jason Gunthorpe 2023-02-16  109  	 * a new domain.
403bdbf937722d2 Jason Gunthorpe 2023-02-16  110  	 */
403bdbf937722d2 Jason Gunthorpe 2023-02-16  111  	if (idev->enforce_cache_coherency) {
403bdbf937722d2 Jason Gunthorpe 2023-02-16  112  		rc = iommufd_hw_pagetable_enforce_cc(hwpt);
403bdbf937722d2 Jason Gunthorpe 2023-02-16  113  		if (WARN_ON(rc))
403bdbf937722d2 Jason Gunthorpe 2023-02-16  114  			goto out_abort;
403bdbf937722d2 Jason Gunthorpe 2023-02-16  115  	}
403bdbf937722d2 Jason Gunthorpe 2023-02-16  116  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  117  	/*
339fbf3ae144263 Jason Gunthorpe 2023-03-01  118  	 * immediate_attach exists only to accommodate iommu drivers that cannot
339fbf3ae144263 Jason Gunthorpe 2023-03-01  119  	 * directly allocate a domain. These drivers do not finish creating the
339fbf3ae144263 Jason Gunthorpe 2023-03-01  120  	 * domain until attach is completed. Thus we must have this call
339fbf3ae144263 Jason Gunthorpe 2023-03-01  121  	 * sequence. Once those drivers are fixed this should be removed.
36a117b606efcce Jason Gunthorpe 2023-02-16  122  	 *
36a117b606efcce Jason Gunthorpe 2023-02-16  123  	 * Note we hold the igroup->lock here which prevents any other thread
36a117b606efcce Jason Gunthorpe 2023-02-16  124  	 * from observing igroup->hwpt until we finish setting it up.
339fbf3ae144263 Jason Gunthorpe 2023-03-01  125  	 */
339fbf3ae144263 Jason Gunthorpe 2023-03-01  126  	if (immediate_attach) {
339fbf3ae144263 Jason Gunthorpe 2023-03-01  127  		rc = iommufd_hw_pagetable_attach(hwpt, idev);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  128  		if (rc)
36a117b606efcce Jason Gunthorpe 2023-02-16  129  			goto out_abort;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  130  	}
339fbf3ae144263 Jason Gunthorpe 2023-03-01  131  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  132  	rc = iopt_table_add_domain(&hwpt->ioas->iopt, hwpt->domain);
339fbf3ae144263 Jason Gunthorpe 2023-03-01  133  	if (rc)
339fbf3ae144263 Jason Gunthorpe 2023-03-01  134  		goto out_detach;
339fbf3ae144263 Jason Gunthorpe 2023-03-01  135  	list_add_tail(&hwpt->hwpt_item, &hwpt->ioas->hwpt_list);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  136  	return hwpt;
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  137  
339fbf3ae144263 Jason Gunthorpe 2023-03-01  138  out_detach:
339fbf3ae144263 Jason Gunthorpe 2023-03-01  139  	if (immediate_attach)
36a117b606efcce Jason Gunthorpe 2023-02-16  140  		iommufd_hw_pagetable_detach(idev);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  141  out_abort:
25cde97d953208b Jason Gunthorpe 2023-03-01  142  	iommufd_object_abort_and_destroy(ictx, &hwpt->obj);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29 @143  	return ERR_PTR(rc);
ea4acfac57b9dee Jason Gunthorpe 2022-11-29  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

