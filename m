Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5501842;
	Sat,  7 Jan 2023 08:39:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id bs20so3260555wrb.3;
        Sat, 07 Jan 2023 00:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SrR1PP1YqUsYgyNnIl4a7+7p6c9Ob2UXH8yRh1y/fKI=;
        b=WkySpuAXO7VXFEBOxxu0M4gffOwpnfXzX0aftDCsPKDXvTP6v5TSSlLIhhXblLBHlg
         O7SChr8SGud7QIsd0PEc6AUMmpRHrZgHOcb/dajPrBmaK6IsEn9pJsU0KktCCs82ROgK
         SRuiZSbgd+hplmthEWppnRhRefsimxkmvLNeBd5v7DNNwnI6azvsLz/aq8SS8KcO+RFO
         8p/6KuQRXVi1bLbCEYAUJzUZOn4zHrZaUIRdOgDESJonTzdoKOB//cXwvpdODEAAHSL2
         2u7E4P1w47Vmo1LJxky/MbMLhLp2lYIeyNErCWzaVYL9ol4R+0EFJDt4KnHWq538bxT2
         56Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrR1PP1YqUsYgyNnIl4a7+7p6c9Ob2UXH8yRh1y/fKI=;
        b=7a/My0Tagt5Zl3U9uE44yh5QDZfU8aQbNLSPU6hSebhcyv7Auu6KS7tOUfa2ZArN3n
         BBz0ElmI5aH3RZtJEDqjHQyMvr316nIzrtQnINCYCvWRqvgl9QLw7OoIghaJ2zYOLoGn
         UWj4FYVSDLbQ/iljKu0IjI5UgFqFqPuFiHcxd7ralB+JUdh664/XYzY35yb2texHhFLo
         JgT6Gm4Um7LCmHBbfO9Nov0zq7+zinPUdFNpYYV4dXvlwPlurigOVWAvqap+cRAGkyhZ
         r6eFGmuxgohHt9mv2RoB2ylSkCKzGDcgEnsWjDG60fa5OnPSRuUs4EzlrMTPzLg3wOXk
         1feA==
X-Gm-Message-State: AFqh2kpiZpmRaIhDlCaYW8xfIDvXiAqIFOKNJLU7rmTHl0faaeiq37O1
	l+mOFPzxVzU72BEt7evjmKuzRT8+tFw04Wah
X-Google-Smtp-Source: AMrXdXtbuLj2dCyC0K7l6xu6BjZ+NzUfM4YJidI/5ARk+ZzxpzU2ghwr2HT7sPePyAjXWfm6sC0QUA==
X-Received: by 2002:a5d:5c0d:0:b0:242:1809:7e13 with SMTP id cc13-20020a5d5c0d000000b0024218097e13mr45083079wrb.11.1673080761892;
        Sat, 07 Jan 2023 00:39:21 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m1-20020a5d6241000000b002bbdaf21744sm206977wrv.113.2023.01.07.00.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:39:21 -0800 (PST)
Date: Sat, 7 Jan 2023 11:39:17 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:tmp/for_baolu_0105 16/23]
 drivers/iommu/iommufd/device.c:174 iommufd_device_get_info() error:
 uninitialized symbol 'rc'.
Message-ID: <202301070655.LsWlWorx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230107083917.E3lE7UF5YHBb3kvHlC8qTpgtTNvwRTpayNzb0zDNPIs@z>

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

847b9d82e16033 Yi Liu          2022-05-11  136  int iommufd_device_get_info(struct iommufd_ucmd *ucmd)
847b9d82e16033 Yi Liu          2022-05-11  137  {
847b9d82e16033 Yi Liu          2022-05-11  138  	struct iommu_device_info *cmd = ucmd->cmd;
847b9d82e16033 Yi Liu          2022-05-11  139  	struct iommufd_object *obj;
847b9d82e16033 Yi Liu          2022-05-11  140  	struct iommufd_device *idev;
847b9d82e16033 Yi Liu          2022-05-11  141  	void *data;
847b9d82e16033 Yi Liu          2022-05-11  142  	int rc;
847b9d82e16033 Yi Liu          2022-05-11  143  
847b9d82e16033 Yi Liu          2022-05-11  144  	if (cmd->flags || cmd->__reserved || !cmd->data_len ||
847b9d82e16033 Yi Liu          2022-05-11  145  	    cmd->data_len > PAGE_SIZE)
847b9d82e16033 Yi Liu          2022-05-11  146  		return -EOPNOTSUPP;
847b9d82e16033 Yi Liu          2022-05-11  147  
847b9d82e16033 Yi Liu          2022-05-11  148  	obj = iommufd_get_object(ucmd->ictx, cmd->dev_id, IOMMUFD_OBJ_DEVICE);
847b9d82e16033 Yi Liu          2022-05-11  149  	if (IS_ERR(obj))
847b9d82e16033 Yi Liu          2022-05-11  150  		return PTR_ERR(obj);
847b9d82e16033 Yi Liu          2022-05-11  151  
847b9d82e16033 Yi Liu          2022-05-11  152  	idev = container_of(obj, struct iommufd_device, obj);
847b9d82e16033 Yi Liu          2022-05-11  153  
847b9d82e16033 Yi Liu          2022-05-11  154  	data = kzalloc(cmd->data_len, GFP_KERNEL);
847b9d82e16033 Yi Liu          2022-05-11  155  	if (!data)
847b9d82e16033 Yi Liu          2022-05-11  156  		goto out_put;

rc = -ENOMEM;

847b9d82e16033 Yi Liu          2022-05-11  157  
847b9d82e16033 Yi Liu          2022-05-11  158  	rc = iommu_get_hw_info(idev->dev, cmd->out_device_type,
847b9d82e16033 Yi Liu          2022-05-11  159  			       data, cmd->data_len);
847b9d82e16033 Yi Liu          2022-05-11  160  	if (rc < 0)
847b9d82e16033 Yi Liu          2022-05-11  161  		goto out_free_data;
847b9d82e16033 Yi Liu          2022-05-11  162  
847b9d82e16033 Yi Liu          2022-05-11  163  	if (copy_to_user((void __user *)cmd->data_ptr, data, cmd->data_len)) {
847b9d82e16033 Yi Liu          2022-05-11  164  		rc = -EFAULT;
847b9d82e16033 Yi Liu          2022-05-11  165  		goto out_free_data;
847b9d82e16033 Yi Liu          2022-05-11  166  	}
847b9d82e16033 Yi Liu          2022-05-11  167  
847b9d82e16033 Yi Liu          2022-05-11  168  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
847b9d82e16033 Yi Liu          2022-05-11  169  
847b9d82e16033 Yi Liu          2022-05-11  170  out_free_data:
847b9d82e16033 Yi Liu          2022-05-11  171  	kfree(data);
847b9d82e16033 Yi Liu          2022-05-11  172  out_put:
847b9d82e16033 Yi Liu          2022-05-11  173  	iommufd_put_object(obj);
847b9d82e16033 Yi Liu          2022-05-11 @174  	return rc;
847b9d82e16033 Yi Liu          2022-05-11  175  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

