Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FF12570;
	Tue, 10 Jan 2023 07:36:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id az7so10770188wrb.5;
        Mon, 09 Jan 2023 23:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3oAkXJEzh6LxJmbtj/1T7N61kCjlPW6Cpb2ncZwdow=;
        b=JR5F9ibaSL6+Yo5yByDs5+N+yiv3SdikTnW832l07pjeHqQnmyqvvVsXOrW/ZiElOM
         gJPNXol+PEZJaH2h/SGOwHfe1sk/EQERTy69pI7akW61R+dugTvmjNcpNxVMtuRX2vt2
         iW8g79nd7O2DFhxZV+KOfphGEoInDOPmQdn6mYD9XEUpggRjf4gew+owA3t2CRT/ut9k
         rq2SlUjNp+AzhcqCZcQHaRaQYZnGerG5qjLcRkkGxPENKoptG49mxsbU8tWSI6f6sKSD
         v3k6ongRtyHqmrZE9JfvQRuwwck43/LKUtewsv7hgCmKMYFH1x+rKK81VNwOvIL63G1Z
         LbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3oAkXJEzh6LxJmbtj/1T7N61kCjlPW6Cpb2ncZwdow=;
        b=w/t456fuqpLeAN1Zh31ssT1EP+3nsO9/h+vxaFXXo2q8Oeex8fTjGcVbwnM0dpDcSc
         GMyZOUNrOhBOcaEj0yp3x/ObQlbyEw9/DN0nYkrXmroJiLKPcwngEfkcRb5dt4UcJtKQ
         yh5EuOvZg7QmVIZ5aUM21Ud2bq661+IeYCW549T2yMb0CbLbjgsLOl4blhw63qO72xmS
         CHw19VehXQeW/K+MSSgj1VW+2kFRBEhZ6Qpga6EYfH8gCLKNi+9R7CKXcojdfvtmcgZi
         mHG62zhoR+mLJFs9Ars6mXG/BaTICehCNJCXuNjmouYefIeO7wqugxFOO+AooKU85YM1
         y3pA==
X-Gm-Message-State: AFqh2koJNyjvniCCpf72kZUQgD7jEUmYkC1sNSwTwqU2+2U2iMohb25k
	X2nky1tsnIf0mddMrF6uZfIvS2LLz7s/vQ==
X-Google-Smtp-Source: AMrXdXvSvcedvxcTmeaA1G8qag033v5qE5+/PISXawEvI1PQTHfeHLV6+Q658WhJMUVyd5tIuBg5KQ==
X-Received: by 2002:a05:6000:1e11:b0:2bb:366b:d5e1 with SMTP id bj17-20020a0560001e1100b002bb366bd5e1mr10712027wrb.30.1673336206810;
        Mon, 09 Jan 2023 23:36:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bj27-20020a0560001e1b00b0023659925b2asm10700153wrb.51.2023.01.09.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 23:36:46 -0800 (PST)
Date: Tue, 10 Jan 2023 10:36:40 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd-v6.2-rc2-nesting 29/30]
 drivers/iommu/iommufd/hw_pagetable.c:206 iommufd_hwpt_alloc() warn: possible
 memory leak of 'cache'
Message-ID: <202301101322.YLesCXLW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230110073640.tzJgl0kIKtlzVdZRRXD16_K3A2jEEXVl35Ev0s_oGQ8@z>

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd-v6.2-rc2-nesting
head:   7b5ee9d41fb7df93dd054ee9b7047a98260c6e1b
commit: 4eb19c1cbdd1d656a7032d997777bcb0407e5f9d [29/30] iommufd: Add user hw_pagetable allocation
config: arm64-randconfig-m031-20230108
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iommu/iommufd/hw_pagetable.c:206 iommufd_hwpt_alloc() warn: possible memory leak of 'cache'

vim +/cache +206 drivers/iommu/iommufd/hw_pagetable.c

4eb19c1cbdd1d6 Yi Liu 2023-01-05  111  int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
4eb19c1cbdd1d6 Yi Liu 2023-01-05  112  {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  113  	struct iommufd_hw_pagetable *hwpt, *parent = NULL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  114  	struct iommu_hwpt_alloc *cmd = ucmd->cmd;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  115  	struct iommufd_ctx *ictx = ucmd->ictx;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  116  	struct iommufd_object *pt_obj = NULL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  117  	struct iommufd_ioas *ioas = NULL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  118  	struct iommufd_device *idev;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  119  	void *data = NULL, *cache = NULL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  120  	int rc;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  121  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  122  	if (cmd->__reserved || cmd->flags ||
4eb19c1cbdd1d6 Yi Liu 2023-01-05  123  	    cmd->data_len > PAGE_SIZE)
4eb19c1cbdd1d6 Yi Liu 2023-01-05  124  		return -EOPNOTSUPP;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  125  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  126  	idev = iommufd_device_get_by_id(ictx, cmd->dev_id);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  127  	if (IS_ERR(idev))
4eb19c1cbdd1d6 Yi Liu 2023-01-05  128  		return PTR_ERR(idev);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  129  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  130  	pt_obj = iommufd_get_object(ictx, cmd->pt_id, IOMMUFD_OBJ_ANY);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  131  	if (IS_ERR(pt_obj)) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  132  		rc = -EINVAL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  133  		goto out_put_dev;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  134  	}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  135  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  136  	switch (pt_obj->type) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  137  	case IOMMUFD_OBJ_HW_PAGETABLE:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  138  		parent = container_of(pt_obj, struct iommufd_hw_pagetable, obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  139  		if (parent->auto_domain) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  140  			rc = -EINVAL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  141  			goto out_put_pt;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  142  		}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  143  		ioas = parent->ioas;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  144  		break;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  145  	case IOMMUFD_OBJ_IOAS:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  146  		ioas = container_of(pt_obj, struct iommufd_ioas, obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  147  		break;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  148  	default:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  149  		rc = -EINVAL;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  150  		goto out_put_pt;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  151  	}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  152  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  153  	if (cmd->data_len && cmd->data_type != IOMMU_DEVICE_DATA_NONE) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  154  		data = kzalloc(cmd->data_len, GFP_KERNEL);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  155  		if (!data) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  156  			rc = -ENOMEM;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  157  			goto out_put_pt;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  158  		}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  159  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  160  		cache = kzalloc(sizeof(union iommufd_invalidate_buffer),
4eb19c1cbdd1d6 Yi Liu 2023-01-05  161  				GFP_KERNEL);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  162  		if (!cache) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  163  			rc = -ENOMEM;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  164  			goto out_free_data;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  165  		}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  166  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  167  		rc = copy_struct_from_user(data, cmd->data_len,
4eb19c1cbdd1d6 Yi Liu 2023-01-05  168  					   (void __user *)cmd->data_uptr,
4eb19c1cbdd1d6 Yi Liu 2023-01-05  169  					   cmd->data_len);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  170  		if (rc)
4eb19c1cbdd1d6 Yi Liu 2023-01-05  171  			goto out_free_cache;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  172  	}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  173  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  174  	mutex_lock(&ioas->mutex);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  175  	hwpt = __iommufd_hw_pagetable_alloc(ictx, idev->dev, ioas,
4eb19c1cbdd1d6 Yi Liu 2023-01-05  176  					    cmd->data_type, parent,
4eb19c1cbdd1d6 Yi Liu 2023-01-05  177  					    data, cmd->data_len);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  178  	mutex_unlock(&ioas->mutex);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  179  	if (IS_ERR(hwpt)) {
4eb19c1cbdd1d6 Yi Liu 2023-01-05  180  		rc = PTR_ERR(hwpt);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  181  		goto out_free_data;

goto out_free_cache;

4eb19c1cbdd1d6 Yi Liu 2023-01-05  182  	}
4eb19c1cbdd1d6 Yi Liu 2023-01-05  183  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  184  	cmd->out_hwpt_id = hwpt->obj.id;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  185  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  186  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
4eb19c1cbdd1d6 Yi Liu 2023-01-05  187  	if (rc)
4eb19c1cbdd1d6 Yi Liu 2023-01-05  188  		goto out_destroy_hwpt;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  189  
4eb19c1cbdd1d6 Yi Liu 2023-01-05  190  	hwpt->cache = cache;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  191  	iommufd_object_finalize(ucmd->ictx, &hwpt->obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  192  	kfree(data);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  193  	iommufd_put_object(pt_obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  194  	iommufd_put_object(&idev->obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  195  	return 0;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  196  out_destroy_hwpt:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  197  	iommufd_object_abort_and_destroy(ucmd->ictx, &hwpt->obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  198  out_free_cache:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  199  	kfree(cache);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  200  out_free_data:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  201  	kfree(data);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  202  out_put_pt:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  203  	iommufd_put_object(pt_obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05  204  out_put_dev:
4eb19c1cbdd1d6 Yi Liu 2023-01-05  205  	iommufd_put_object(&idev->obj);
4eb19c1cbdd1d6 Yi Liu 2023-01-05 @206  	return rc;
4eb19c1cbdd1d6 Yi Liu 2023-01-05  207  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

