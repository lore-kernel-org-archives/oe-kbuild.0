Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC927B;
	Fri,  6 Jan 2023 07:12:33 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g10so489294wmo.1;
        Thu, 05 Jan 2023 23:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1s5gp4ISUmFqYQ0nI9T44bNdkPzGnN+vYlbMYXmqGg=;
        b=mDi+68xqOmfRKhcLE28XGre18i8Lgq1XSrJMaGHZiSpXOrfz6niW4cu6CkJk7oradL
         bY77//p8R8RwFh6WEsiGxBSfQiEkCNGUi+MMsVi7IWoePeMzvR8a4/5F1tR5MjOHuGKP
         g9+B6lvNSu68S/4vhub+o/qNIxI1FPnlTjjVG5BnIwSZBtanwu9GigjYhhX00v2HxkFx
         aFi6BeYkvWvmKe011F5s7YF51ErYyiqVHNYhsGI96RUfNeW01oWGmNkedBRKWFFioRkp
         IfqHAJMUBLWVJoLYNeZ6sgS8Hfzdlb6wQ6oU9bLjdHnu3oBLoy86lHwB4oB/hBj/ndoz
         TU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1s5gp4ISUmFqYQ0nI9T44bNdkPzGnN+vYlbMYXmqGg=;
        b=6gMCvyCbfamlg58m2/g/NclQ5RRMQLlDQ72vrd3dJKSwYwK7D9BoHtgX0NU6qG/ZPP
         bxX/rSLIDn0HxXO51Wgg2iDf/QMRKft+PWymakwxWh7qphw4a7rhOf/Jb3sjDmnJYHHs
         PG8WP+X4zx1BEf6OPh9ZDWu+UpWuRg+NpZIbCXnaFsKWDN07Sg0npeNOfIQl+AFndxTL
         3JxcOjLAvxczGFozo9VGEtM01NTW14cz1P1RR33vIDLUEoGJAN1QT/JaTQ9TpBbZrsBu
         aqh540uxb4zrosEJA+fHIFIxdxkKgiaPSAgSCIYpPN4Nreot3C0IzZdSHgLcCFS6UL92
         d0WA==
X-Gm-Message-State: AFqh2krfHExviDQSaHs2twAX0L047v3jJgrSwZbpfRbXsOHteONhvKNH
	2QSgdDd8Mc/+sz2xMaxsTYcd6o9SauGXMw==
X-Google-Smtp-Source: AMrXdXsaFWPG2+wY6IZ6M2F7nZIlaCG79f3hhfMed3AywXRPrLKOmcGKl8oh9ErgaMa4r59v9UU0VQ==
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id b19-20020a05600c4e1300b003c6e63dfcfcmr38195098wmq.35.1672989151258;
        Thu, 05 Jan 2023 23:12:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600c1d0b00b003d01b84e9b2sm667207wms.27.2023.01.05.23.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:12:30 -0800 (PST)
Date: Fri, 6 Jan 2023 10:12:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for_baolu_0105 16/23]
 drivers/iommu/iommufd/device.c:174 iommufd_device_get_info() error:
 uninitialized symbol 'rc'.
Message-ID: <202301060054.XgmLKByO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230106071226.U5lWdf1leRC4SW2jNk8TzgCXkZQP6U_3PRF20spxmBI@z>

tree:   https://github.com/yiliu1765/iommufd.git tmp/for_baolu_0105
head:   9f612668786f66b0591cfee1b4f4a29770a30311
commit: 847b9d82e1603373da4103a967b5c18cc975fb6d [16/23] iommufd: Add IOMMU_DEVICE_GET_INFO support
config: parisc-randconfig-m041-20230105
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/iommu/iommufd/device.c:174 iommufd_device_get_info() error: uninitialized symbol 'rc'.

Old smatch warnings:
drivers/iommu/iommufd/device.c:774 iommufd_access_rw() error: uninitialized symbol 'rc'.

vim +/rc +174 drivers/iommu/iommufd/device.c

847b9d82e160337 Yi Liu          2022-05-11  136  int iommufd_device_get_info(struct iommufd_ucmd *ucmd)
847b9d82e160337 Yi Liu          2022-05-11  137  {
847b9d82e160337 Yi Liu          2022-05-11  138  	struct iommu_device_info *cmd = ucmd->cmd;
847b9d82e160337 Yi Liu          2022-05-11  139  	struct iommufd_object *obj;
847b9d82e160337 Yi Liu          2022-05-11  140  	struct iommufd_device *idev;
847b9d82e160337 Yi Liu          2022-05-11  141  	void *data;
847b9d82e160337 Yi Liu          2022-05-11  142  	int rc;
847b9d82e160337 Yi Liu          2022-05-11  143  
847b9d82e160337 Yi Liu          2022-05-11  144  	if (cmd->flags || cmd->__reserved || !cmd->data_len ||
847b9d82e160337 Yi Liu          2022-05-11  145  	    cmd->data_len > PAGE_SIZE)
847b9d82e160337 Yi Liu          2022-05-11  146  		return -EOPNOTSUPP;
847b9d82e160337 Yi Liu          2022-05-11  147  
847b9d82e160337 Yi Liu          2022-05-11  148  	obj = iommufd_get_object(ucmd->ictx, cmd->dev_id, IOMMUFD_OBJ_DEVICE);
847b9d82e160337 Yi Liu          2022-05-11  149  	if (IS_ERR(obj))
847b9d82e160337 Yi Liu          2022-05-11  150  		return PTR_ERR(obj);
847b9d82e160337 Yi Liu          2022-05-11  151  
847b9d82e160337 Yi Liu          2022-05-11  152  	idev = container_of(obj, struct iommufd_device, obj);
847b9d82e160337 Yi Liu          2022-05-11  153  
847b9d82e160337 Yi Liu          2022-05-11  154  	data = kzalloc(cmd->data_len, GFP_KERNEL);
847b9d82e160337 Yi Liu          2022-05-11  155  	if (!data)
847b9d82e160337 Yi Liu          2022-05-11  156  		goto out_put;

rc = -ENOMEM;

847b9d82e160337 Yi Liu          2022-05-11  157  
847b9d82e160337 Yi Liu          2022-05-11  158  	rc = iommu_get_hw_info(idev->dev, cmd->out_device_type,
847b9d82e160337 Yi Liu          2022-05-11  159  			       data, cmd->data_len);
847b9d82e160337 Yi Liu          2022-05-11  160  	if (rc < 0)
847b9d82e160337 Yi Liu          2022-05-11  161  		goto out_free_data;
847b9d82e160337 Yi Liu          2022-05-11  162  
847b9d82e160337 Yi Liu          2022-05-11  163  	if (copy_to_user((void __user *)cmd->data_ptr, data, cmd->data_len)) {
847b9d82e160337 Yi Liu          2022-05-11  164  		rc = -EFAULT;
847b9d82e160337 Yi Liu          2022-05-11  165  		goto out_free_data;
847b9d82e160337 Yi Liu          2022-05-11  166  	}
847b9d82e160337 Yi Liu          2022-05-11  167  
847b9d82e160337 Yi Liu          2022-05-11  168  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
847b9d82e160337 Yi Liu          2022-05-11  169  
847b9d82e160337 Yi Liu          2022-05-11  170  out_free_data:
847b9d82e160337 Yi Liu          2022-05-11  171  	kfree(data);
847b9d82e160337 Yi Liu          2022-05-11  172  out_put:
847b9d82e160337 Yi Liu          2022-05-11  173  	iommufd_put_object(obj);
847b9d82e160337 Yi Liu          2022-05-11 @174  	return rc;
847b9d82e160337 Yi Liu          2022-05-11  175  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

