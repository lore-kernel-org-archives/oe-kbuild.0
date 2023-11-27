Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096AD1A28E
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjZOeUXO"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c87acba73bso54076891fa.1
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701084626; x=1701689426; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+MOXu27yPf3UCbViyAan00Rttoop53nJW7WCFKhbuw=;
        b=sjZOeUXOC6b+Vg/ozE0CdsPTlekiBNvaFtMcuIpEzzjJpNdM//GRq2akSKquz8VRXU
         1r+CxVjR0g66Qe0h01yAR4vm/ebljEo1j2rCI0PtQwdkDGznWSn13NvirLiItYf8p2vj
         lz8AqvniDzQn9jQqI/dcJONzlRZHjm/GWIMxUfS9ekfVYHQ1pSGVEavyKBecE7TAIYV2
         QsAVXn6sl2QHg9+93N3U4wSwMtGSz/3HohcUXGcLJ3bTfLUCYIP15fTDZTVCAarm1KTP
         /t4R+Ehhp3XCyS1bVpYs6CCFOHgs1xwwrqDciMdpZXT/buQXIzUZWj6vxfL0NkqSYX/e
         FLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701084626; x=1701689426;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+MOXu27yPf3UCbViyAan00Rttoop53nJW7WCFKhbuw=;
        b=jgWiNkCP6OVy96m997Q5CC0ElN1qGuqwL7zmtrOdqr14kf82KNrR8ZhH0vkOc11omG
         UDfKodaw5nl9G4BGwxUYYKkfOcAEN8Jzwas0cx2uI3R7X8WQ2XDEH3JIv6JoHWRzeH9M
         f7n6jRW0z4NIHdX9wHqKvXiSWRR63XpL8fNzIsc8SCEmlepTuj7TdfWHSiGkatoHzOWA
         yWy5LVAcGKv0T2C57Icavt8kgexD4jxQRL60yI7QuA2O+scMPnO9Dm7b7X5MH9pBIUzH
         92P1SwXO157Aw/sXgvelfhKgKMJWFQifKsn8SXKMX+a/hdhGa0EfkUbqTir2fCCS6ZbI
         9rcg==
X-Gm-Message-State: AOJu0Yyr7H9MBjmpd0bBXo4J8twfzBIiw7PsnxfmO0mEpn2pNEFBqM4Q
	oMvapJVgb0Ej2d1ZTTgqvlEAvlZWQxjIzj47MpY=
X-Google-Smtp-Source: AGHT+IFpesgrucFxK9BK7DrkGXBppFhyx8Itht8iBNii1N4/k/umtQB5oNRbGEgX5WkH+SS3D5TC4g==
X-Received: by 2002:a2e:9017:0:b0:2bd:1f83:8d4 with SMTP id h23-20020a2e9017000000b002bd1f8308d4mr4224636ljg.22.1701084625792;
        Mon, 27 Nov 2023 03:30:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c37-20020a05600c4a2500b003fee6e170f9sm13371467wmp.45.2023.11.27.03.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 03:30:25 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 14:30:21 +0300
To: oe-kbuild@lists.linux.dev, Hector Martin <marcan@marcan.st>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/21]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:1173 dockchannel_hid_probe()
 warn: passing zero to 'PTR_ERR'
Message-ID: <4656a259-a21a-4847-9850-fa362550bc44@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   16871bb3228eaf55cbdb1dfb81c1cecec4ee0d52
commit: af53f3ff74f442fae36262bda9be6a94ad52925e [15/21] hid: Add Apple DockChannel HID transport driver
config: parisc-randconfig-r071-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271546.ImsRFnlZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311271546.ImsRFnlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311271546.ImsRFnlZ-lkp@intel.com/

smatch warnings:
drivers/hid/dockchannel-hid/dockchannel-hid.c:1173 dockchannel_hid_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1173 drivers/hid/dockchannel-hid/dockchannel-hid.c

af53f3ff74f442 Hector Martin 2022-07-08  1094  static int dockchannel_hid_probe(struct platform_device *pdev)
af53f3ff74f442 Hector Martin 2022-07-08  1095  {
af53f3ff74f442 Hector Martin 2022-07-08  1096  	struct device *dev = &pdev->dev;
af53f3ff74f442 Hector Martin 2022-07-08  1097  	struct dockchannel_hid *dchid;
af53f3ff74f442 Hector Martin 2022-07-08  1098  	struct device_node *child, *helper;
af53f3ff74f442 Hector Martin 2022-07-08  1099  	struct platform_device *helper_pdev;
af53f3ff74f442 Hector Martin 2022-07-08  1100  	struct property *prop;
af53f3ff74f442 Hector Martin 2022-07-08  1101  	int ret;
af53f3ff74f442 Hector Martin 2022-07-08  1102  
af53f3ff74f442 Hector Martin 2022-07-08  1103  	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
af53f3ff74f442 Hector Martin 2022-07-08  1104  	if (ret)
af53f3ff74f442 Hector Martin 2022-07-08  1105  		return ret;
af53f3ff74f442 Hector Martin 2022-07-08  1106  
af53f3ff74f442 Hector Martin 2022-07-08  1107  	dchid = devm_kzalloc(dev, sizeof(*dchid), GFP_KERNEL);
af53f3ff74f442 Hector Martin 2022-07-08  1108  	if (!dchid) {
af53f3ff74f442 Hector Martin 2022-07-08  1109  		return -ENOMEM;
af53f3ff74f442 Hector Martin 2022-07-08  1110  	}
af53f3ff74f442 Hector Martin 2022-07-08  1111  
af53f3ff74f442 Hector Martin 2022-07-08  1112  	dchid->dev = dev;
af53f3ff74f442 Hector Martin 2022-07-08  1113  
af53f3ff74f442 Hector Martin 2022-07-08  1114  	/*
af53f3ff74f442 Hector Martin 2022-07-08  1115  	 * First make sure all the GPIOs are available, in cased we need to defer.
af53f3ff74f442 Hector Martin 2022-07-08  1116  	 * This is necessary because MTP will request them by name later, and by then
af53f3ff74f442 Hector Martin 2022-07-08  1117  	 * it's too late to defer the probe.
af53f3ff74f442 Hector Martin 2022-07-08  1118  	 */
af53f3ff74f442 Hector Martin 2022-07-08  1119  
af53f3ff74f442 Hector Martin 2022-07-08  1120  	for_each_child_of_node(dev->of_node, child) {
af53f3ff74f442 Hector Martin 2022-07-08  1121  		for_each_property_of_node(child, prop) {
af53f3ff74f442 Hector Martin 2022-07-08  1122  			size_t len = strlen(prop->name);
af53f3ff74f442 Hector Martin 2022-07-08  1123  			struct gpio_desc *gpio;
af53f3ff74f442 Hector Martin 2022-07-08  1124  
af53f3ff74f442 Hector Martin 2022-07-08  1125  			if (len < 12 || strncmp("apple,", prop->name, 6) ||
af53f3ff74f442 Hector Martin 2022-07-08  1126  			    strcmp("-gpios", prop->name + len - 6))
af53f3ff74f442 Hector Martin 2022-07-08  1127  				continue;
af53f3ff74f442 Hector Martin 2022-07-08  1128  
af53f3ff74f442 Hector Martin 2022-07-08  1129  			gpio = fwnode_gpiod_get_index(&child->fwnode, prop->name, 0, GPIOD_ASIS,
af53f3ff74f442 Hector Martin 2022-07-08  1130  						      prop->name);
af53f3ff74f442 Hector Martin 2022-07-08  1131  			if (IS_ERR_OR_NULL(gpio)) {
af53f3ff74f442 Hector Martin 2022-07-08  1132  				if (PTR_ERR(gpio) == -EPROBE_DEFER) {
af53f3ff74f442 Hector Martin 2022-07-08  1133  					of_node_put(child);
af53f3ff74f442 Hector Martin 2022-07-08  1134  					return -EPROBE_DEFER;
af53f3ff74f442 Hector Martin 2022-07-08  1135  				}
af53f3ff74f442 Hector Martin 2022-07-08  1136  			} else {
af53f3ff74f442 Hector Martin 2022-07-08  1137  				gpiod_put(gpio);
af53f3ff74f442 Hector Martin 2022-07-08  1138  			}
af53f3ff74f442 Hector Martin 2022-07-08  1139  		}
af53f3ff74f442 Hector Martin 2022-07-08  1140  	}
af53f3ff74f442 Hector Martin 2022-07-08  1141  
af53f3ff74f442 Hector Martin 2022-07-08  1142  	/*
af53f3ff74f442 Hector Martin 2022-07-08  1143  	 * Make sure we also have the MTP coprocessor available, and
af53f3ff74f442 Hector Martin 2022-07-08  1144  	 * defer probe if the helper hasn't probed yet.
af53f3ff74f442 Hector Martin 2022-07-08  1145  	 */
af53f3ff74f442 Hector Martin 2022-07-08  1146  	helper = of_parse_phandle(dev->of_node, "apple,helper-cpu", 0);
af53f3ff74f442 Hector Martin 2022-07-08  1147  	if (!helper) {
af53f3ff74f442 Hector Martin 2022-07-08  1148  		dev_err(dev, "Missing apple,helper-cpu property");
af53f3ff74f442 Hector Martin 2022-07-08  1149  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1150  	}
af53f3ff74f442 Hector Martin 2022-07-08  1151  
af53f3ff74f442 Hector Martin 2022-07-08  1152  	helper_pdev = of_find_device_by_node(helper);
af53f3ff74f442 Hector Martin 2022-07-08  1153  	of_node_put(helper);
af53f3ff74f442 Hector Martin 2022-07-08  1154  	if (!helper_pdev) {
af53f3ff74f442 Hector Martin 2022-07-08  1155  		dev_err(dev, "Failed to find helper device");
af53f3ff74f442 Hector Martin 2022-07-08  1156  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1157  	}
af53f3ff74f442 Hector Martin 2022-07-08  1158  
af53f3ff74f442 Hector Martin 2022-07-08  1159  	dchid->helper_link = device_link_add(dev, &helper_pdev->dev,
af53f3ff74f442 Hector Martin 2022-07-08  1160  					     DL_FLAG_AUTOREMOVE_CONSUMER);
af53f3ff74f442 Hector Martin 2022-07-08  1161  	put_device(&helper_pdev->dev);
af53f3ff74f442 Hector Martin 2022-07-08  1162  	if (!dchid->helper_link) {
af53f3ff74f442 Hector Martin 2022-07-08  1163  		dev_err(dev, "Failed to link to helper device");
af53f3ff74f442 Hector Martin 2022-07-08  1164  		return -EINVAL;
af53f3ff74f442 Hector Martin 2022-07-08  1165  	}
af53f3ff74f442 Hector Martin 2022-07-08  1166  
af53f3ff74f442 Hector Martin 2022-07-08  1167  	if (dchid->helper_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
af53f3ff74f442 Hector Martin 2022-07-08  1168  		return -EPROBE_DEFER;
af53f3ff74f442 Hector Martin 2022-07-08  1169  
af53f3ff74f442 Hector Martin 2022-07-08  1170  	/* Now it is safe to begin initializing */
af53f3ff74f442 Hector Martin 2022-07-08  1171  	dchid->dc = dockchannel_init(pdev);
af53f3ff74f442 Hector Martin 2022-07-08  1172  	if (IS_ERR_OR_NULL(dchid->dc)) {
af53f3ff74f442 Hector Martin 2022-07-08 @1173  		return PTR_ERR(dchid->dc);


We are returning success if dockchannel_init() returns NULL.

I only look at this email, but my guess without looking at the context
is that the IS_ERR_OR_NULL() check should just be IS_ERR().  Otherwise
it means that dockchannel_init() is optional.  See my blog for more
details.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

af53f3ff74f442 Hector Martin 2022-07-08  1174  	}
af53f3ff74f442 Hector Martin 2022-07-08  1175  	dchid->new_iface_wq = alloc_workqueue("dchid-new", WQ_MEM_RECLAIM, 0);
af53f3ff74f442 Hector Martin 2022-07-08  1176  	if (!dchid->new_iface_wq)
af53f3ff74f442 Hector Martin 2022-07-08  1177  		return -ENOMEM;
af53f3ff74f442 Hector Martin 2022-07-08  1178  
af53f3ff74f442 Hector Martin 2022-07-08  1179  	dchid->comm = dchid_get_interface(dchid, IFACE_COMM, "comm");
af53f3ff74f442 Hector Martin 2022-07-08  1180  	if (!dchid->comm) {
af53f3ff74f442 Hector Martin 2022-07-08  1181  		dev_err(dchid->dev, "Failed to initialize comm interface");
af53f3ff74f442 Hector Martin 2022-07-08  1182  		return -EIO;
af53f3ff74f442 Hector Martin 2022-07-08  1183  	}
af53f3ff74f442 Hector Martin 2022-07-08  1184  
af53f3ff74f442 Hector Martin 2022-07-08  1185  	dev_info(dchid->dev, "Initialized, awaiting packets\n");
af53f3ff74f442 Hector Martin 2022-07-08  1186  	dockchannel_await(dchid->dc, dchid_handle_packet, dchid, sizeof(struct dchid_hdr));
af53f3ff74f442 Hector Martin 2022-07-08  1187  
af53f3ff74f442 Hector Martin 2022-07-08  1188  	return 0;
af53f3ff74f442 Hector Martin 2022-07-08  1189  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

