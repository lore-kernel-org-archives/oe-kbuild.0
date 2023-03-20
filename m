Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CB10E5;
	Mon, 20 Mar 2023 05:23:10 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g6-20020a05600c4ec600b003ed8826253aso2427080wmq.0;
        Sun, 19 Mar 2023 22:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679289788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l5WpM1F0jvC503hrz/f5W6eN+MMqPtXfj2Cb/T2guUE=;
        b=CPCpiMLlkHtl0PMFVN96Dn7GXa8YwQ+KMCtg7DKHdL7os+dfzbku+aE/fn4dbxAQzt
         SFhsPlwM9CUDr3Fo4rvKh4TNQfFlAxzjVVPTzRd8yt0n+arcVu5Ixxdw1+WLM1o0g9Kj
         0m43XsPInm+apvvZTySUrZ3370P8GwQp3CcGiJvXufVQEmhOyW4F3WDomnuyyVXusjIN
         N8LiRCqyrrFo8hxYP6jAlYSt22wcIv/KwRW/Tw7BSdvKf21rEHAfGMLGqX6oXSCyngwo
         LOO7/ItMf0fTbLgSbOLdX09CImm+kOdmb51qZApo4UpkWVlU3FapR9NWAHLWgRp0mDFT
         N+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679289788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5WpM1F0jvC503hrz/f5W6eN+MMqPtXfj2Cb/T2guUE=;
        b=4g+6zvF0KmY5rIoeqokftsjPust1nAQp0KHZOl40ThAMIxBkhwb3wsSAIKRHoj7+w6
         fCYpGnQJ3UXThBQJf9xj5bVKaVdcTgbpE5IQEWsdnsLLXCLEfWT61nHB58eww6JjXOmo
         EuOv/Bz8pqzT81UFcmKzHGEolFIKMaPmAo8M9w3WRKV73qpFWpFKZcbz9zB2AJ1AQL9/
         U1VkifHh9lnPJZhF3mhj+cIDyfr8aTyzDFmQYdhQlKvjBK+gCTEJJR3mIv+x6eRNKhgJ
         YapcKUoDIsDwKa6Z4vRgtuLPCWpOFD2tX9+T8d1vPs9Qvy3ExPaJJC9Vvo7Wky5wXm/O
         /fcA==
X-Gm-Message-State: AO0yUKXxXbirB6zgWMevr/4BBR57LItpedDDCv2YeFliCBumef/hzg8H
	KsxgbxXOT0mijAHapBqSRcQWi3l2eZM=
X-Google-Smtp-Source: AK7set915PQa6HVkYw0iPMyCF/Jfvp7ojVyukTxPBc7USQdLo/C1h2qcPOeukbOWzzcgeKXnYxo8PA==
X-Received: by 2002:a05:600c:470e:b0:3eb:42fc:fb30 with SMTP id v14-20020a05600c470e00b003eb42fcfb30mr32580085wmo.32.1679289788007;
        Sun, 19 Mar 2023 22:23:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k16-20020a7bc310000000b003ed2433aa4asm9279746wmj.41.2023.03.19.22.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 22:23:07 -0700 (PDT)
Date: Mon, 20 Mar 2023 08:23:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Eric Lin <eric.lin@sifive.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: drivers/perf/riscv_pmu_sbi.c:802 pmu_sbi_device_probe() warn:
 missing unwind goto?
Message-ID: <e3648550-7207-44db-a7a8-41640ea958ad@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: e9a023f2b73ac35ff5cfbefe8524c64d8173d65f drivers/perf: riscv_pmu: Add riscv pmu pm notifier
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303200941.4TSDQb89-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303200941.4TSDQb89-lkp@intel.com/

New smatch warnings:
drivers/perf/riscv_pmu_sbi.c:802 pmu_sbi_device_probe() warn: missing unwind goto?

vim +802 drivers/perf/riscv_pmu_sbi.c

e9991434596f53 Atish Patra 2022-02-18  764  static int pmu_sbi_device_probe(struct platform_device *pdev)
e9991434596f53 Atish Patra 2022-02-18  765  {
e9991434596f53 Atish Patra 2022-02-18  766  	struct riscv_pmu *pmu = NULL;
e9991434596f53 Atish Patra 2022-02-18  767  	int num_counters;
4905ec2fb7e642 Atish Patra 2022-02-18  768  	int ret = -ENODEV;
e9991434596f53 Atish Patra 2022-02-18  769  
e9991434596f53 Atish Patra 2022-02-18  770  	pr_info("SBI PMU extension is available\n");
e9991434596f53 Atish Patra 2022-02-18  771  	pmu = riscv_pmu_alloc();
e9991434596f53 Atish Patra 2022-02-18  772  	if (!pmu)
e9991434596f53 Atish Patra 2022-02-18  773  		return -ENOMEM;
e9991434596f53 Atish Patra 2022-02-18  774  
e9991434596f53 Atish Patra 2022-02-18  775  	num_counters = pmu_sbi_find_num_ctrs();
e9991434596f53 Atish Patra 2022-02-18  776  	if (num_counters < 0) {
e9991434596f53 Atish Patra 2022-02-18  777  		pr_err("SBI PMU extension doesn't provide any counters\n");
4905ec2fb7e642 Atish Patra 2022-02-18  778  		goto out_free;
e9991434596f53 Atish Patra 2022-02-18  779  	}
e9991434596f53 Atish Patra 2022-02-18  780  
e9991434596f53 Atish Patra 2022-02-18  781  	/* cache all the information about counters now */
e9991434596f53 Atish Patra 2022-02-18  782  	if (pmu_sbi_get_ctrinfo(num_counters))
4905ec2fb7e642 Atish Patra 2022-02-18  783  		goto out_free;

Better to preserve the error code from pmu_sbi_get_ctrinfo() instead of
just returning -ENODEV;

e9991434596f53 Atish Patra 2022-02-18  784  
4905ec2fb7e642 Atish Patra 2022-02-18  785  	ret = pmu_sbi_setup_irqs(pmu, pdev);
4905ec2fb7e642 Atish Patra 2022-02-18  786  	if (ret < 0) {
4905ec2fb7e642 Atish Patra 2022-02-18  787  		pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
4905ec2fb7e642 Atish Patra 2022-02-18  788  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
4905ec2fb7e642 Atish Patra 2022-02-18  789  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
4905ec2fb7e642 Atish Patra 2022-02-18  790  	}
e9991434596f53 Atish Patra 2022-02-18  791  	pmu->num_counters = num_counters;
e9991434596f53 Atish Patra 2022-02-18  792  	pmu->ctr_start = pmu_sbi_ctr_start;
e9991434596f53 Atish Patra 2022-02-18  793  	pmu->ctr_stop = pmu_sbi_ctr_stop;
e9991434596f53 Atish Patra 2022-02-18  794  	pmu->event_map = pmu_sbi_event_map;
e9991434596f53 Atish Patra 2022-02-18  795  	pmu->ctr_get_idx = pmu_sbi_ctr_get_idx;
e9991434596f53 Atish Patra 2022-02-18  796  	pmu->ctr_get_width = pmu_sbi_ctr_get_width;
e9991434596f53 Atish Patra 2022-02-18  797  	pmu->ctr_clear_idx = pmu_sbi_ctr_clear_idx;
e9991434596f53 Atish Patra 2022-02-18  798  	pmu->ctr_read = pmu_sbi_ctr_read;
e9991434596f53 Atish Patra 2022-02-18  799  
e9991434596f53 Atish Patra 2022-02-18  800  	ret = cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
e9991434596f53 Atish Patra 2022-02-18  801  	if (ret)
e9991434596f53 Atish Patra 2022-02-18 @802  		return ret;

This needs to clean up before returning.

The out_unregister name is misleading because it doesn't undo the
perf_pmu_register() as you would expect based on the name.  Also
pmu_sbi_get_ctrinfo() and pmu_sbi_setup_irqs() should really have been
cleaned up.

There is a system that people often use to write error handling in a
straight forward way:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

e9991434596f53 Atish Patra 2022-02-18  803  
e9a023f2b73ac3 Eric Lin    2022-07-05  804  	ret = riscv_pm_pmu_register(pmu);
e9a023f2b73ac3 Eric Lin    2022-07-05  805  	if (ret)
e9a023f2b73ac3 Eric Lin    2022-07-05  806  		goto out_unregister;
e9a023f2b73ac3 Eric Lin    2022-07-05  807  
e9991434596f53 Atish Patra 2022-02-18  808  	ret = perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
e9a023f2b73ac3 Eric Lin    2022-07-05  809  	if (ret)
e9a023f2b73ac3 Eric Lin    2022-07-05  810  		goto out_unregister;
e9991434596f53 Atish Patra 2022-02-18  811  
e9991434596f53 Atish Patra 2022-02-18  812  	return 0;
4905ec2fb7e642 Atish Patra 2022-02-18  813  
e9a023f2b73ac3 Eric Lin    2022-07-05  814  out_unregister:
e9a023f2b73ac3 Eric Lin    2022-07-05  815  	riscv_pmu_destroy(pmu);
e9a023f2b73ac3 Eric Lin    2022-07-05  816  
4905ec2fb7e642 Atish Patra 2022-02-18  817  out_free:
4905ec2fb7e642 Atish Patra 2022-02-18  818  	kfree(pmu);
4905ec2fb7e642 Atish Patra 2022-02-18  819  	return ret;
e9991434596f53 Atish Patra 2022-02-18  820  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

