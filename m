Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D34B1FBE;
	Sat,  5 Nov 2022 11:18:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so4583351wmb.0;
        Sat, 05 Nov 2022 04:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVMdXeOwqaUKCXEC+eVnAd8QT5UquDeDaCg+HC8l7U0=;
        b=E7tt51gA9q1+HrwtoE5aQ1fd7FygPvGfcmFSUDaCDehcLOXmJeZxwSA+UcTcUtcqHC
         jHMfj9sjxjHI37EcYUGvpa0V0676SgsF4d2wKzXd/H0kd2zVscg0655/mkD99afXwX9I
         w54jwqLW29zZKeP8ktM42apv5vMcQeq7tUcIPJmRfesjcT37deurjLmhbubjUHFQcEkK
         n4jmQRgedw3R5/P0lew3KL6yrMFNFNfvabZa4/kbU9RXT/QYNp75FrsZNFYi79C8aDkB
         QKuuS4P9fYLz4GOF0jpf8lxfkt6gnKkdcoholMZUXt9ehmxNY9sO2vjMJ8zzLfvKHMiG
         WhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVMdXeOwqaUKCXEC+eVnAd8QT5UquDeDaCg+HC8l7U0=;
        b=0/BoVVtFhDmk/fB88bQdmFXVCQtdW0Xo5pZQ7iPKjVvN1tkJ86S5OQxOYgcIxTmaHm
         rX0dA2+qAjKgqV1fGO0VoGvgFv1d4eVeEWub1N+DBa6Zk3psZNBQBQRR8aIh4k4BN6mn
         Cw+qgPTeKlWc9+c28JfA+uI/rP/W5xak4SqT+4vYuTteUbZX62XT3y8mMby4l9TxqRP2
         k487vQwtWlfkl/VUhIx2nd4MANwp48mXwqU6XB0ulDZzkj3FG9y9D1kiWwlOow6SKEC8
         lbR42iJMuSk/D7aAH5dQLS+T3Sg21DrAoSb18YIffBpGzsSbHazST4VXjZ+SijPiKkl+
         O1nQ==
X-Gm-Message-State: ACrzQf1wB53u6b63Y6so2LBJshzHuPshUDxIeRyNmG8l8vlQo1+gSrKK
	Xmw/N1SnNTHo7i5Xy+GlMNseaZJ8UG8=
X-Google-Smtp-Source: AMsMyM5Ckl3UBgWvOtEdCX4KzVolsRVNj593gfRZF4pW0Zor6dKcKJbt5LpfWKKcLG1NokrqA6i/Zg==
X-Received: by 2002:a05:600c:46cd:b0:3c6:f5ab:d383 with SMTP id q13-20020a05600c46cd00b003c6f5abd383mr27393534wmo.40.1667647110184;
        Sat, 05 Nov 2022 04:18:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bu24-20020a056000079800b00228a6ce17b4sm1891331wrb.37.2022.11.05.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 04:18:29 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:18:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Niklas Schnelle <schnelle@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [niks:dma_iommu_v2 14/17] drivers/iommu/s390-iommu.c:696
 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see
 line 696)
Message-ID: <202211051504.2kLwYzTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221105111826.4zVOMZdfsZIAMEz9cixQhcQ22el86e3wMygdKGKxA9U@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git dma_iommu_v2
head:   0c7818bd00bb2b6d6c37d3d3d287b7ee6a9ed464
commit: 319fa6ee88eb64f7c3825713c92afd457b0db3c4 [14/17] s390/pci: Use dma-iommu layer
config: s390-randconfig-m031-20221104
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iommu/s390-iommu.c:696 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see line 696)

vim +/zdev +696 drivers/iommu/s390-iommu.c

319fa6ee88eb64 Niklas Schnelle 2022-07-01  694  struct zpci_iommu_ctrs *zpci_get_iommu_ctrs(struct zpci_dev *zdev)
319fa6ee88eb64 Niklas Schnelle 2022-07-01  695  {
319fa6ee88eb64 Niklas Schnelle 2022-07-01 @696  	if (!zdev && !zdev->s390_domain)

Should be || instead of &&.

319fa6ee88eb64 Niklas Schnelle 2022-07-01  697  		return NULL;
319fa6ee88eb64 Niklas Schnelle 2022-07-01  698  	return &zdev->s390_domain->ctrs;
319fa6ee88eb64 Niklas Schnelle 2022-07-01  699  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

