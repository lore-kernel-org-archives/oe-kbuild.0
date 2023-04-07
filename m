Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB291FBC;
	Fri,  7 Apr 2023 08:54:26 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso4066167wmo.0;
        Fri, 07 Apr 2023 01:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680857664; x=1683449664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaKBcV3thczVG2Nc5f/R1elxYgYuzwXb5YeHi04c1UM=;
        b=pjrzkvf4g2zYJ4KtRU+0mwfsmDdZMSPUGwru+mjnh6wqHyByyREN42EnWFU2wWj1N8
         lYO0wAK28X/FhFLf3j+b4RJ3YpA23yp9BTEUy82H3fIyGBeZwzSX2rj3NJ8/TimNAHLj
         IgSFc9S2jWMWChzoEK0QnVxpba5PAnVElmOjoQEKRYVkAQKhGTXnulcsPhVh0PvLQQrF
         qu2Cvxmn/qUIDfTq2XifRirbGzBYM02LrN7FNXZdHJOHkr0k6pjQGsv1BcIBGLUULZdD
         oh0PAQwS/k5jC4jpzKGQxSsjC5l0wRJ3SOeakLBB5Az2r8jPM9RDdRE8YYnUePN8OnTb
         HL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680857664; x=1683449664;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaKBcV3thczVG2Nc5f/R1elxYgYuzwXb5YeHi04c1UM=;
        b=hoatTjdtaoGmdDFcVOrwYER9rsaMfZ81Hns1WU/Yy5FEpIzE5a289VhPYne+Vi/Re4
         dtVxjs7d4Lsbw/F1MUBcMY9hHgAY2uO9dfF6lagpa+2EcYC6khUB5JcpVMXyLu/4RW4w
         c104SchxaeAx5TxnCC6OKn2GVcVhmgESUbabziz1ML38OQ2jO+P9LudwG3h9ay+rUqLN
         LVqttlWgzJAFJahdHdF2tNEXGc2MOQk/wxD9q8RtZzRnZWkA/0mbeTWHR6puKQGG4Gvw
         IAZ8Uy1y1HxVVPxbOQdeyyh7BOvpiVaO02Huqq1JuMz7kHlAPLKI2zuvAt13JPnWt+g3
         wnAg==
X-Gm-Message-State: AAQBX9d/rnXScAXjgEdO6mSJSnfv0k6zW8hqdzERXSeahomAYS9SIeh8
	A4rhdL7cBm8ahl9PYF67eq0XpBl4fJ/W1w==
X-Google-Smtp-Source: AKy350ZUE5nUvrWAebaDyUpMUE+uHjc8PDtEnwZuIY6umr3NV5taJBhVOoe0ZykmWgzKeD3J9qj23A==
X-Received: by 2002:a7b:c018:0:b0:3ed:6c71:9dc8 with SMTP id c24-20020a7bc018000000b003ed6c719dc8mr1202727wmb.22.1680857664232;
        Fri, 07 Apr 2023 01:54:24 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bd5-20020a05600c1f0500b003f0472ffc7csm7666435wmb.11.2023.04.07.01.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 01:54:23 -0700 (PDT)
Date: Fri, 7 Apr 2023 11:54:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-03292023-yi 15/42]
 drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error:
 uninitialized symbol 'klen'.
Message-ID: <da386e9c-ba54-4ea3-a5ab-d538e1f3229b@kili.mountain>
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
commit: cfab6d45ee4dd485bc223d0135643093a7778923 [15/42] iommufd/selftest: Add domain_alloc_user() support in iommu mock
config: i386-randconfig-m021-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070422.X4wpZb1u-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070422.X4wpZb1u-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:247 iommufd_hwpt_alloc() error: uninitialized symbol 'klen'.

Old smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:162 iommufd_hw_pagetable_alloc() error: uninitialized symbol 'rc'.
drivers/iommu/iommufd/hw_pagetable.c:309 iommufd_hwpt_invalidate() warn: always true condition '(cmd->data_type >= (0 / 4 + (0))) => (0-u32max >= 0)'

vim +/klen +247 drivers/iommu/iommufd/hw_pagetable.c

654fb5316ca27c Jason Gunthorpe 2023-02-16  173  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
654fb5316ca27c Jason Gunthorpe 2023-02-16  174  {
a5314a527b1ab8 Yi Liu          2023-03-03  175  	struct iommufd_hw_pagetable *hwpt, *parent = NULL;
654fb5316ca27c Jason Gunthorpe 2023-02-16  176  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
a5314a527b1ab8 Yi Liu          2023-03-03  177  	struct iommufd_object *pt_obj;
a5314a527b1ab8 Yi Liu          2023-03-03  178  	const struct iommu_ops *ops;
654fb5316ca27c Jason Gunthorpe 2023-02-16  179  	struct iommufd_device *idev;
654fb5316ca27c Jason Gunthorpe 2023-02-16  180  	struct iommufd_ioas *ioas;
a5314a527b1ab8 Yi Liu          2023-03-03  181  	void *data = NULL;
a5314a527b1ab8 Yi Liu          2023-03-03  182  	u32 klen;
654fb5316ca27c Jason Gunthorpe 2023-02-16  183  	int rc;
654fb5316ca27c Jason Gunthorpe 2023-02-16  184  
654fb5316ca27c Jason Gunthorpe 2023-02-16  185  	if (cmd->flags || cmd->__reserved)
654fb5316ca27c Jason Gunthorpe 2023-02-16  186  		return -EOPNOTSUPP;
654fb5316ca27c Jason Gunthorpe 2023-02-16  187  
654fb5316ca27c Jason Gunthorpe 2023-02-16  188  	idev = iommufd_get_device(ucmd, cmd->dev_id);
654fb5316ca27c Jason Gunthorpe 2023-02-16  189  	if (IS_ERR(idev))
654fb5316ca27c Jason Gunthorpe 2023-02-16  190  		return PTR_ERR(idev);
654fb5316ca27c Jason Gunthorpe 2023-02-16  191  
a5314a527b1ab8 Yi Liu          2023-03-03  192  	ops = dev_iommu_ops(idev->dev);
a5314a527b1ab8 Yi Liu          2023-03-03  193  
ee19e9e5b92641 Yi Liu          2023-03-03  194  	/*
ee19e9e5b92641 Yi Liu          2023-03-03  195  	 * cmd->data_type should be a supported type marked in the
ee19e9e5b92641 Yi Liu          2023-03-03  196  	 * ops->hwpt_type_bitmap. Otherwise, the allocation can continue
ee19e9e5b92641 Yi Liu          2023-03-03  197  	 * only when the ops->hw_info_type==IOMMU_HW_INFO_TYPE_NONE and
ee19e9e5b92641 Yi Liu          2023-03-03  198  	 * cmd->data_type==IOMMU_HWPT_TYPE_DEFAULT.
ee19e9e5b92641 Yi Liu          2023-03-03  199  	 */
ee19e9e5b92641 Yi Liu          2023-03-03  200  	if (!((1 << cmd->data_type) & ops->hwpt_type_bitmap) &&
ee19e9e5b92641 Yi Liu          2023-03-03  201  	    ((ops->hw_info_type != IOMMU_HW_INFO_TYPE_NONE) ||
ee19e9e5b92641 Yi Liu          2023-03-03  202  	     (cmd->data_type != IOMMU_HWPT_TYPE_DEFAULT))) {
a5314a527b1ab8 Yi Liu          2023-03-03  203  		rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  204  		goto out_put_idev;
a5314a527b1ab8 Yi Liu          2023-03-03  205  	}
a5314a527b1ab8 Yi Liu          2023-03-03  206  
a5314a527b1ab8 Yi Liu          2023-03-03  207  	pt_obj = iommufd_get_object(ucmd->ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
a5314a527b1ab8 Yi Liu          2023-03-03  208  	if (IS_ERR(pt_obj)) {
a5314a527b1ab8 Yi Liu          2023-03-03  209  		rc = -EINVAL;
654fb5316ca27c Jason Gunthorpe 2023-02-16  210  		goto out_put_idev;
654fb5316ca27c Jason Gunthorpe 2023-02-16  211  	}
654fb5316ca27c Jason Gunthorpe 2023-02-16  212  
a5314a527b1ab8 Yi Liu          2023-03-03  213  	switch (pt_obj->type) {
a5314a527b1ab8 Yi Liu          2023-03-03  214  	case IOMMUFD_OBJ_IOAS:
a5314a527b1ab8 Yi Liu          2023-03-03  215  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
a5314a527b1ab8 Yi Liu          2023-03-03  216  		break;
a5314a527b1ab8 Yi Liu          2023-03-03  217  	case IOMMUFD_OBJ_HW_PAGETABLE:
a5314a527b1ab8 Yi Liu          2023-03-03  218  		/* pt_id points HWPT only when data_type is !IOMMU_HWPT_TYPE_DEFAULT */
a5314a527b1ab8 Yi Liu          2023-03-03  219  		if (cmd->data_type == IOMMU_HWPT_TYPE_DEFAULT) {
a5314a527b1ab8 Yi Liu          2023-03-03  220  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  221  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  222  		}
a5314a527b1ab8 Yi Liu          2023-03-03  223  
a5314a527b1ab8 Yi Liu          2023-03-03  224  		parent = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
a5314a527b1ab8 Yi Liu          2023-03-03  225  		/*
a5314a527b1ab8 Yi Liu          2023-03-03  226  		 * Cannot allocate user-managed hwpt linking to auto_created
a5314a527b1ab8 Yi Liu          2023-03-03  227  		 * hwpt. If the parent hwpt is already a user-managed hwpt,
a5314a527b1ab8 Yi Liu          2023-03-03  228  		 * don't allocate another user-managed hwpt linking to it.
a5314a527b1ab8 Yi Liu          2023-03-03  229  		 */
a5314a527b1ab8 Yi Liu          2023-03-03  230  		if (parent->auto_domain || parent->parent) {
a5314a527b1ab8 Yi Liu          2023-03-03  231  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  232  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  233  		}
a5314a527b1ab8 Yi Liu          2023-03-03  234  		ioas = parent->ioas;
a5314a527b1ab8 Yi Liu          2023-03-03  235  		break;
a5314a527b1ab8 Yi Liu          2023-03-03  236  	default:
a5314a527b1ab8 Yi Liu          2023-03-03  237  		rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  238  		goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  239  	}
a5314a527b1ab8 Yi Liu          2023-03-03  240  
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  241  	if (cmd->data_type != IOMMU_HWPT_TYPE_SELFTTEST)
a5314a527b1ab8 Yi Liu          2023-03-03  242  		klen = iommufd_hwpt_alloc_data_size[cmd->data_type];
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  243  #ifdef CONFIG_IOMMUFD_TEST
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  244  	else
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  245  		klen = sizeof(struct iommu_hwpt_selftest);
cfab6d45ee4dd4 Nicolin Chen    2023-02-26  246  #endif

Assume cmd->data_type == IOMMU_HWPT_TYPE_SELFTTEST and CONFIG_IOMMUFD_TEST
is not defined.

a5314a527b1ab8 Yi Liu          2023-03-03 @247  	if (klen) {
a5314a527b1ab8 Yi Liu          2023-03-03  248  		if (!cmd->data_len) {
a5314a527b1ab8 Yi Liu          2023-03-03  249  			rc = -EINVAL;
a5314a527b1ab8 Yi Liu          2023-03-03  250  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  251  		}
a5314a527b1ab8 Yi Liu          2023-03-03  252  
a5314a527b1ab8 Yi Liu          2023-03-03  253  		data = kzalloc(klen, GFP_KERNEL);
a5314a527b1ab8 Yi Liu          2023-03-03  254  		if (!data) {
a5314a527b1ab8 Yi Liu          2023-03-03  255  			rc = -ENOMEM;
a5314a527b1ab8 Yi Liu          2023-03-03  256  			goto out_put_pt;
a5314a527b1ab8 Yi Liu          2023-03-03  257  		}
a5314a527b1ab8 Yi Liu          2023-03-03  258  
a5314a527b1ab8 Yi Liu          2023-03-03  259  		rc = copy_struct_from_user(data, klen,
a5314a527b1ab8 Yi Liu          2023-03-03  260  					   u64_to_user_ptr(cmd->data_uptr),
a5314a527b1ab8 Yi Liu          2023-03-03  261  					   cmd->data_len);
a5314a527b1ab8 Yi Liu          2023-03-03  262  		if (rc)
a5314a527b1ab8 Yi Liu          2023-03-03  263  			goto out_free_data;
a5314a527b1ab8 Yi Liu          2023-03-03  264  	}
a5314a527b1ab8 Yi Liu          2023-03-03  265  
654fb5316ca27c Jason Gunthorpe 2023-02-16  266  	mutex_lock(&ioas->mutex);
c1cf862f230cf3 Yi Liu          2023-03-03  267  	hwpt = iommufd_hw_pagetable_alloc(ucmd->ictx, ioas, idev,
a5314a527b1ab8 Yi Liu          2023-03-03  268  					  parent, data, false);
654fb5316ca27c Jason Gunthorpe 2023-02-16  269  	mutex_unlock(&ioas->mutex);
654fb5316ca27c Jason Gunthorpe 2023-02-16  270  	if (IS_ERR(hwpt)) {
654fb5316ca27c Jason Gunthorpe 2023-02-16  271  		rc = PTR_ERR(hwpt);
a5314a527b1ab8 Yi Liu          2023-03-03  272  		goto out_free_data;
654fb5316ca27c Jason Gunthorpe 2023-02-16  273  	}
654fb5316ca27c Jason Gunthorpe 2023-02-16  274  
654fb5316ca27c Jason Gunthorpe 2023-02-16  275  	cmd->out_hwpt_id = hwpt->obj.id;
654fb5316ca27c Jason Gunthorpe 2023-02-16  276  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
654fb5316ca27c Jason Gunthorpe 2023-02-16  277  	if (rc)
654fb5316ca27c Jason Gunthorpe 2023-02-16  278  		goto out_hwpt;
654fb5316ca27c Jason Gunthorpe 2023-02-16  279  	iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
a5314a527b1ab8 Yi Liu          2023-03-03  280  	goto out_free_data;
654fb5316ca27c Jason Gunthorpe 2023-02-16  281  
654fb5316ca27c Jason Gunthorpe 2023-02-16  282  out_hwpt:
654fb5316ca27c Jason Gunthorpe 2023-02-16  283  	iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
a5314a527b1ab8 Yi Liu          2023-03-03  284  out_free_data:
a5314a527b1ab8 Yi Liu          2023-03-03  285  	kfree(data);
a5314a527b1ab8 Yi Liu          2023-03-03  286  out_put_pt:
a5314a527b1ab8 Yi Liu          2023-03-03  287  	iommufd_put_object(pt_obj);
654fb5316ca27c Jason Gunthorpe 2023-02-16  288  out_put_idev:
654fb5316ca27c Jason Gunthorpe 2023-02-16  289  	iommufd_put_object(&idev->obj);
654fb5316ca27c Jason Gunthorpe 2023-02-16  290  	return rc;
654fb5316ca27c Jason Gunthorpe 2023-02-16  291  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

