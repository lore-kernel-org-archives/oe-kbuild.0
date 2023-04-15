Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90862103;
	Sat, 15 Apr 2023 13:15:13 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id xd13so18552822ejb.4;
        Sat, 15 Apr 2023 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681564512; x=1684156512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EpckPTlITJCcV86K42wxeJjyBtM78s04ZVrlAnB1Wo=;
        b=BygQT2Cxosjd6UPDSFJUTlWXXtlv8r3BC7YTdH+F9N6oKIIwZvKxv/BqYwFdO+bWoB
         JRNneGUusVSQOVhM55BuTaYF1SwP3nmuPEd2OQDPHWEi+F3ygUKO88A/1QKLC2Yynrda
         vlLg/RBngIDcodg8eJrrgLwnv5FpGdN5pz/0tgVD2iNkBwHM9bSxeEk/MXjEZjqg7hsw
         ejAnozHRSqVbbicDrI2uaQMviNJkMEsfxLvszjAm8pKtw4aR+gvfTTKhBfIyrF+Jvr2a
         6qXg/7WjZxnJVgq67UJQdmimLp0izxD9mJboD2/qW4GlSK5cVBsaA2c6CIAQvQje4+hZ
         BMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681564512; x=1684156512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EpckPTlITJCcV86K42wxeJjyBtM78s04ZVrlAnB1Wo=;
        b=IP8llBSkUYYRFzy5FVTseJvYCMItcvF+EMr3lHkexgGHzQunrcikb7+TTBkTQXfYYG
         10weHnW1wTvZGKrRNdtaPi5p3d0RNqHu0xKHS20iqPxdno7EPDy8HH/8lySHeHzlj9A7
         UIuiFeokvpKU3onlSYBYAjCgBK/0pG4+x+hW21mwm6ZTbi7pKZeenGp2jMCUhPhT3a8D
         E7dgRh2q31leQwSXXkgX34POKqEJCKu02mHLv6CuFvLpeLY1DcVh9ITlGJl3rchteJ47
         l1IxT2c0neETAbXsIKs0dAkKxgNE693AgX5wrAH2NWAPEkT9SikjtymWb0vM0fzECQye
         YO2g==
X-Gm-Message-State: AAQBX9d09eLXMs3iPwuE+BvVRZcwiqGo93YrLcKd7Vchw2In6AjmT1av
	UBahDBh6ovNGdiuOpByY5lowsKjK8VE=
X-Google-Smtp-Source: AKy350aUPNHE349aRb9CqXOWcVUsZbUebYwWtRJFyLTkbWDfMNqc8WyezjQHw28/aOeRHzzKP2vKGw==
X-Received: by 2002:a17:906:7f9a:b0:92f:b290:78c with SMTP id f26-20020a1709067f9a00b0092fb290078cmr2527291ejr.21.1681564511746;
        Sat, 15 Apr 2023 06:15:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g25-20020a17090613d900b0094edfbd475csm2307410ejc.127.2023.04.15.06.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 06:15:11 -0700 (PDT)
Date: Sat, 15 Apr 2023 16:15:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Kalle Valo <quic_kvalo@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/ath/ath11k/debugfs.c:1009
 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'
Message-ID: <278dae1d-0cc2-4963-b7f0-5d611a5b31a4@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7a934f4bd7d6f9da84c8812da3ba42ee10f5778e
commit: 323d91d4684d238f6bc3693fed93caf795378fe0 wifi: ath11k: debugfs: fix to work with multiple PCI devices
config: openrisc-randconfig-m041-20230414 (https://download.01.org/0day-ci/archive/20230415/202304152142.ssXYxFdQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304152142.ssXYxFdQ-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath11k/debugfs.c:1009 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/net/wireless/ath/ath11k/debugfs.c:1022 ath11k_debugfs_soc_create() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1009 drivers/net/wireless/ath/ath11k/debugfs.c

cb4e57db2ff0c8 Kalle Valo 2020-09-16   998  int ath11k_debugfs_soc_create(struct ath11k_base *ab)
da3a9d3c15769b Kalle Valo 2020-09-16   999  {
323d91d4684d23 Kalle Valo 2022-12-22  1000  	struct dentry *root;
323d91d4684d23 Kalle Valo 2022-12-22  1001  	bool dput_needed;
323d91d4684d23 Kalle Valo 2022-12-22  1002  	char name[64];
323d91d4684d23 Kalle Valo 2022-12-22  1003  	int ret;
323d91d4684d23 Kalle Valo 2022-12-22  1004  
323d91d4684d23 Kalle Valo 2022-12-22  1005  	root = debugfs_lookup("ath11k", NULL);
323d91d4684d23 Kalle Valo 2022-12-22  1006  	if (!root) {
323d91d4684d23 Kalle Valo 2022-12-22  1007  		root = debugfs_create_dir("ath11k", NULL);
323d91d4684d23 Kalle Valo 2022-12-22  1008  		if (IS_ERR_OR_NULL(root))
323d91d4684d23 Kalle Valo 2022-12-22 @1009  			return PTR_ERR(root);

Debugfs used to return a mix of error pointers and NULL but we changed
the NULL return to an error pointer to encourage people to just delete
all debugfs error handling code.

323d91d4684d23 Kalle Valo 2022-12-22  1010  
323d91d4684d23 Kalle Valo 2022-12-22  1011  		dput_needed = false;
323d91d4684d23 Kalle Valo 2022-12-22  1012  	} else {
323d91d4684d23 Kalle Valo 2022-12-22  1013  		/* a dentry from lookup() needs dput() after we don't use it */
323d91d4684d23 Kalle Valo 2022-12-22  1014  		dput_needed = true;
323d91d4684d23 Kalle Valo 2022-12-22  1015  	}
323d91d4684d23 Kalle Valo 2022-12-22  1016  
323d91d4684d23 Kalle Valo 2022-12-22  1017  	scnprintf(name, sizeof(name), "%s-%s", ath11k_bus_str(ab->hif.bus),
323d91d4684d23 Kalle Valo 2022-12-22  1018  		  dev_name(ab->dev));
da3a9d3c15769b Kalle Valo 2020-09-16  1019  
323d91d4684d23 Kalle Valo 2022-12-22  1020  	ab->debugfs_soc = debugfs_create_dir(name, root);
323d91d4684d23 Kalle Valo 2022-12-22  1021  	if (IS_ERR_OR_NULL(ab->debugfs_soc)) {
323d91d4684d23 Kalle Valo 2022-12-22  1022  		ret = PTR_ERR(ab->debugfs_soc);
323d91d4684d23 Kalle Valo 2022-12-22  1023  		goto out;
323d91d4684d23 Kalle Valo 2022-12-22  1024  	}
323d91d4684d23 Kalle Valo 2022-12-22  1025  
323d91d4684d23 Kalle Valo 2022-12-22  1026  	ret = 0;
323d91d4684d23 Kalle Valo 2022-12-22  1027  
323d91d4684d23 Kalle Valo 2022-12-22  1028  out:
323d91d4684d23 Kalle Valo 2022-12-22  1029  	if (dput_needed)
323d91d4684d23 Kalle Valo 2022-12-22  1030  		dput(root);
323d91d4684d23 Kalle Valo 2022-12-22  1031  
323d91d4684d23 Kalle Valo 2022-12-22  1032  	return ret;
da3a9d3c15769b Kalle Valo 2020-09-16  1033  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

