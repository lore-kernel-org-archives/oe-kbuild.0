Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336617F7;
	Tue,  7 Feb 2023 05:24:11 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id bk16so12400854wrb.11;
        Mon, 06 Feb 2023 21:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nYuhbxKTv5gi6L1XYKUM1gFnaEBIaYUpfy7Ajj2Og4=;
        b=ZpLwX5rdBMx76S2XuTJhiI7PAGFvjhQNAQkISNf257JeW7/sSq7IbVugNcJZIfRY5q
         8CECkTdCDnfPQYhGJFVqLSQIsk+ldpp8vYkXrrjvYg8R5Dykn0d+1PVRTMnVcXu6rib6
         xxeDFX3F5BIjMzK6G72LdZvI4lYa0EtCNmA477KBjie8Pg5cazxpjAyV34jV/6eZkcme
         s/zRBd9W2bRoKh3KhAbDzTCMr8HjWMF80QWnZlZhSkDFUvqQwQPHw88DqQjeECD9YOMF
         QEkElEJuD18xZtZBkkSjhgeRLifIJofN32l9YI6oLQRVo4DASCfJ6vfO7an4ebyrbHb8
         ylVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nYuhbxKTv5gi6L1XYKUM1gFnaEBIaYUpfy7Ajj2Og4=;
        b=7U5YX6byoO+4I139AypqFDTdF0xRiVd0qexSpe4YQdDklFqxnWfx+t0RPDZQz1Tv1M
         USzWVnrRoPLLLkxws5BgRUQ3KRJIytwxY17+QUqDxqHHeV8ePbYx5DBEFq3IvLKFkGdG
         3f8LonJm+AMYg6aMQBxC4eHWoe+74cnttYTgK1M+RvSQSTW2zWag9VpNNwHty8hrVG+6
         xyZ6+FJ8U1b7Vj5PRW7AIcR0ZL0wRb5RcyarOoAW7+5mNPdb2TEwYh+cA9yAmTQOx1ey
         M2SuVs+hgClsuU0M8qdyo8UQa/1xhfG9dhY/JdQLBBXK/0H4sIrj6bkaLvoh3QorvG1M
         tEiw==
X-Gm-Message-State: AO0yUKXub5lHd1rHuLXSWnvTcOHnBvgCtIY7bwZvxkgkX3SCzcaoSaP3
	yTl1C8ce8lDhDzUXG+U/ZK6jiX9UVrbpsHNK
X-Google-Smtp-Source: AK7set/9391XXQJFm/ayxAByr9OiRzBjY4xS/qXEQl57LoOan/+NrBKWhxgEcmpyiKmkZSEPSsus1A==
X-Received: by 2002:a5d:595f:0:b0:2c3:d8f0:547a with SMTP id e31-20020a5d595f000000b002c3d8f0547amr1371145wri.1.1675747449853;
        Mon, 06 Feb 2023 21:24:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l13-20020adffe8d000000b002bfbda53b98sm7341176wrr.35.2023.02.06.21.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 21:24:09 -0800 (PST)
Date: Tue, 7 Feb 2023 08:24:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Niklas Schnelle <schnelle@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [niks:dma_iommu_v5 4/7] drivers/iommu/s390-iommu.c:713
 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see
 line 713)
Message-ID: <202302071312.P2C14gaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230207052406.BV501p4agH-0lEhEp_6BkvzdzbdalSH2H0PksIoDzgY@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git dma_iommu_v5
head:   1130d11df3ad4a18aada280e80da35911239b4ad
commit: 4dd8a9e92a898af65c84631f354f51a8b9f9ff09 [4/7] s390/pci: Use dma-iommu layer
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071312.P2C14gaH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iommu/s390-iommu.c:713 zpci_get_iommu_ctrs() error: we previously assumed 'zdev' could be null (see line 713)

vim +/zdev +713 drivers/iommu/s390-iommu.c

4dd8a9e92a898a Niklas Schnelle 2022-07-01  711  struct zpci_iommu_ctrs *zpci_get_iommu_ctrs(struct zpci_dev *zdev)
4dd8a9e92a898a Niklas Schnelle 2022-07-01  712  {
4dd8a9e92a898a Niklas Schnelle 2022-07-01 @713  	if (!zdev && !zdev->s390_domain)

Should be || instead of &&.

4dd8a9e92a898a Niklas Schnelle 2022-07-01  714  		return NULL;
4dd8a9e92a898a Niklas Schnelle 2022-07-01  715  	return &zdev->s390_domain->ctrs;
4dd8a9e92a898a Niklas Schnelle 2022-07-01  716  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

