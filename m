Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52767C8E2
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 07:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0M6RJbM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b5155e154so4342225e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 23:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701328217; x=1701933017; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qnji0I3JgObq/fWIwro3G9ISvDwi5sdGVqwTpUKDhEI=;
        b=y0M6RJbMfkyQ28p6eOjagwUXvjO1KrshfssFUPsdDM79R7DOggYW3LbdUGDkAX6H5Q
         wY68vjiPTrE8nGhUkh6h8Ds1n5cbCpSEFBvmlnfOBqyFZCelC33MlvROGrZEcaK3m0ds
         MHQQNg5jynuyEPBcqQXbvJqS/xvdSFeQP423uUMkN6G23ieB0S8RsLcGyWDAxhDVx1EK
         CqOV5JEn41cxYh04kpfq5dZqmTP78riE2bOXcS/CPvffwV5flRG+93ketrmUAn/nZgPs
         VaJ9ojdicHYq6bq86r9XeHViQwRbrAqV0GZHdrq99agW6W1eLfX25yydOGFCUucfl3FZ
         1Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701328217; x=1701933017;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qnji0I3JgObq/fWIwro3G9ISvDwi5sdGVqwTpUKDhEI=;
        b=onUVVHJdbbiyUNbJPX4ZjuYZ6Vki7hd85Mi5rBNslPCL0IsI/N2I/0nt3XaZjoCZqS
         +DTeH3Hw5VlEOiN1Lf1eiFjQgFefiSAYc3Pjt8u0uBbvgdA+T+wBNNWvt1+ve3dCEf8W
         nnDSifA9hEnK5X71NQQd6GJgB4yS5BCq4EWDvX8ruW5xgWDtpRVb/WanP8pK7ve36PM9
         fuYPoHUOVO2dOz75Orvqnzka0Af4eUx5zbNA/MK8/JYoowcXhSrgagjoSXLjqIph80+A
         kxn9zeWRsL9hGksVpERbjMkohyXIZ3cxPCNnjG6BoaT5/15GD21WvjKYfcqUkw4azDbk
         znZg==
X-Gm-Message-State: AOJu0YxNCJ4zwrrLEwjT4fWMmoIJBc5lKxirNqddADheJwBwBkag+hDl
	fj4t1rlZyFdkBHzIrpKHHXrtmoOrYSqVFqoYn/g=
X-Google-Smtp-Source: AGHT+IH/Jvj2OfG3Rg0ggXGKhks8Phw3XlDerxaVK/2WWK7J+c93psVfqzjj2pIu0ZF1soo3xEqrzQ==
X-Received: by 2002:a05:600c:3b22:b0:407:5b54:bb10 with SMTP id m34-20020a05600c3b2200b004075b54bb10mr14633136wms.8.1701328217218;
        Wed, 29 Nov 2023 23:10:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b0040b45282f88sm4479058wmq.36.2023.11.29.23.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:10:16 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Nov 2023 10:08:02 +0300
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 7/16] drivers/soc/apple/mailbox.c:290
 apple_mbox_get() warn: passing zero to 'ERR_PTR'
Message-ID: <32890a65-1144-46d0-9743-4a27221c7b64@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   3d3347e62feacf57f15c7f20c0309c8dac65da44
commit: 818b34e17da79772d796cfbe9cb923f2025af007 [7/16] mailbox: apple: Delete driver
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231130/202311300228.1rvmJjdA-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300228.1rvmJjdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300228.1rvmJjdA-lkp@intel.com/

smatch warnings:
drivers/soc/apple/mailbox.c:290 apple_mbox_get() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +290 drivers/soc/apple/mailbox.c

b7bac953131b57 Hector Martin 2023-03-14  280  struct apple_mbox *apple_mbox_get(struct device *dev, int index)
b7bac953131b57 Hector Martin 2023-03-14  281  {
b7bac953131b57 Hector Martin 2023-03-14  282  	struct of_phandle_args args;
b7bac953131b57 Hector Martin 2023-03-14  283  	struct platform_device *pdev;
b7bac953131b57 Hector Martin 2023-03-14  284  	struct apple_mbox *mbox;
b7bac953131b57 Hector Martin 2023-03-14  285  	int ret;
b7bac953131b57 Hector Martin 2023-03-14  286  
b7bac953131b57 Hector Martin 2023-03-14  287  	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
b7bac953131b57 Hector Martin 2023-03-14  288  					 index, &args);
b7bac953131b57 Hector Martin 2023-03-14  289  	if (ret || !args.np)
b7bac953131b57 Hector Martin 2023-03-14 @290  		return ERR_PTR(ret);

We probably want to set an error code in the !args.np case.

b7bac953131b57 Hector Martin 2023-03-14  291  
b7bac953131b57 Hector Martin 2023-03-14  292  	pdev = of_find_device_by_node(args.np);
b7bac953131b57 Hector Martin 2023-03-14  293  	of_node_put(args.np);
b7bac953131b57 Hector Martin 2023-03-14  294  
b7bac953131b57 Hector Martin 2023-03-14  295  	if (!pdev)
b7bac953131b57 Hector Martin 2023-03-14  296  		return ERR_PTR(EPROBE_DEFER);
b7bac953131b57 Hector Martin 2023-03-14  297  
b7bac953131b57 Hector Martin 2023-03-14  298  	mbox = platform_get_drvdata(pdev);
b7bac953131b57 Hector Martin 2023-03-14  299  	if (!mbox)
b7bac953131b57 Hector Martin 2023-03-14  300  		return ERR_PTR(EPROBE_DEFER);
b7bac953131b57 Hector Martin 2023-03-14  301  
b7bac953131b57 Hector Martin 2023-03-14  302  	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
b7bac953131b57 Hector Martin 2023-03-14  303  		return ERR_PTR(ENODEV);
b7bac953131b57 Hector Martin 2023-03-14  304  
b7bac953131b57 Hector Martin 2023-03-14  305  	return mbox;
b7bac953131b57 Hector Martin 2023-03-14  306  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

