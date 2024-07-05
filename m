Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D316A949
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720189838; cv=none; b=OmlIvgq99Iet05zCu/hWP+NSOOfAMU7jqvkjoOwvsWumcHEeAyI8lJDKCeWU++U3OybZ0nWiQSatstEn9Nog59L8F/Z1so5gaAu622ZowVSNMHrL9oZbjdrkDefvs0mrAF6mznw2X09SXdu5ZjVvpmFgR/f6TN+1Sb8DVowLRhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720189838; c=relaxed/simple;
	bh=PO9/FWxxHmBZwy653yLyqGX9V3+5cab8W0a6ZCWszXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUns3M3rTjczBUxcMt5kLePjsWV6EYIm3fdJbhqMeZF+RgScGHxpajCEeCWcJ+Td2C/8vTp32CwZi/KNvx/DtFi07bPxRUOlSpBpKbIOEWnTJW4S05UxJIjREb1srcISn5PiMpxm0DxCQ8sHJu+K2f33ptSecffe3L1yMBwqX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9+n4dsO; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9+n4dsO"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5c652d56313so495726eaf.0
        for <oe-kbuild@lists.linux.dev>; Fri, 05 Jul 2024 07:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720189835; x=1720794635; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eL0uaa5I05VLy2KdRezNaQwM9PiFEMQyHzE8lT7svVg=;
        b=r9+n4dsOx4wBLMCAq24FIMQ1G9oH+HFwYj6QMSFvJTrTRaes2LUAcb4EFq3lo//H5w
         S7fluHm3gVjA7NxoffS0uPEjpsS8G9X/cav7t69CXtpJUzOtM1fZ46oYDZIHQjf9R9vP
         4DGeiucmOTkvV79XigHY42Y008mDEk1PMCSVpyJdRjCUOSSbd6mdqu02XF1ApJ4Qp50A
         +iWrNpq4+s86kWMVbsVFwn51giJRli4XsK5tevhAmDyMsXCI6nV1jBeFRMiGITegzgKV
         put2BjMzf/5L16tKLMEpOR3cJVw3AN9ie0plBf2e+mFRWX8iMZ1ioRYoM4/ypHc6KULj
         5A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720189835; x=1720794635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eL0uaa5I05VLy2KdRezNaQwM9PiFEMQyHzE8lT7svVg=;
        b=RhmlROpH6mWq44UBslMnG+WJDvFa8Zm+XrGExKqR+p6R0Iij2psW5HyFtlbzU3fh1A
         /sXzItLyvcHVyRHCVztqSd1RB4m/68F87THedyzc+NcMflHor+c7M9FzsH2QEghQzPJ+
         rOXLyKVl6nCyIB4B+Iy6s8AmGtGllrPwYb2LxgZhJNHNAxgRvs+LYKwu9Zldd3EdCzyx
         0Aq+zaYGP4BwZixxFCefg2CCCAPPJMg4koO3Wxq3JyDtYgvC5kv66Bw0v8spgUfwiwMH
         ZKuv9RIKSu6DzfycN19hd1w906j6sdusjOnLk7BfPVMifW4l1rhg/YW2LSdLYyNnxRAo
         T4uQ==
X-Gm-Message-State: AOJu0YxB8eCO/B+9bE2YHZJTVyggzAUwW8g4PD/GKei7Vf2KBRUW5Exi
	d7Ze3z4paY9MF9b6gtQmW5Of5b4Yc+tZe10l7ITOL7yupapNWjQt2lbpVDG94BKNnSTDLxBxpoZ
	g
X-Google-Smtp-Source: AGHT+IE2RmEOLrbjJxMPo3WbrADfoI8B6egfY2Aa1ozlRCyKnZqM2VjHYxD51eiRAL6+KtFGq6W02g==
X-Received: by 2002:a4a:de4f:0:b0:5c6:6029:b1cd with SMTP id 006d021491bc7-5c66029b48dmr880548eaf.8.1720189834834;
        Fri, 05 Jul 2024 07:30:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:45d:774f:47f7:bb6a])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c4149d263fsm2045897eaf.48.2024.07.05.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 07:30:34 -0700 (PDT)
Date: Fri, 5 Jul 2024 16:30:32 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Guo Mengqi <guomengqi3@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21813/23252]
 drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->recv_buf'
 double freed
Message-ID: <d9d1d0db-daa9-46b5-b11b-3b2a6856d74d@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1b4ca2a2c1253c9e2d2428cc4fae541fdf3b326d
commit: 807378830df3ae30f0c5b956174bba0281ec0f5e [21813/23252] uio_hv_generic: Fix a memory leak in error handling paths
config: x86_64-randconfig-161-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050741.OaaupcUL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407050741.OaaupcUL-lkp@intel.com/

smatch warnings:
drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->recv_buf' double freed
drivers/uio/uio_hv_generic.c:311 hv_uio_probe() warn: 'pdata->send_buf' double freed

vim +311 drivers/uio/uio_hv_generic.c

95096f2fbd1018 Stephen Hemminger  2016-12-03  192  static int
95096f2fbd1018 Stephen Hemminger  2016-12-03  193  hv_uio_probe(struct hv_device *dev,
95096f2fbd1018 Stephen Hemminger  2016-12-03  194  	     const struct hv_vmbus_device_id *dev_id)
95096f2fbd1018 Stephen Hemminger  2016-12-03  195  {
95096f2fbd1018 Stephen Hemminger  2016-12-03  196  	struct hv_uio_private_data *pdata;
95096f2fbd1018 Stephen Hemminger  2016-12-03  197  	int ret;
95096f2fbd1018 Stephen Hemminger  2016-12-03  198  
95096f2fbd1018 Stephen Hemminger  2016-12-03  199  	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
95096f2fbd1018 Stephen Hemminger  2016-12-03  200  	if (!pdata)
95096f2fbd1018 Stephen Hemminger  2016-12-03  201  		return -ENOMEM;
95096f2fbd1018 Stephen Hemminger  2016-12-03  202  
95096f2fbd1018 Stephen Hemminger  2016-12-03  203  	ret = vmbus_open(dev->channel, HV_RING_SIZE * PAGE_SIZE,
95096f2fbd1018 Stephen Hemminger  2016-12-03  204  			 HV_RING_SIZE * PAGE_SIZE, NULL, 0,
135db384a2efde Stephen Hemminger  2018-04-16  205  			 hv_uio_channel_cb, dev->channel);
95096f2fbd1018 Stephen Hemminger  2016-12-03  206  	if (ret)
95096f2fbd1018 Stephen Hemminger  2016-12-03  207  		goto fail;
95096f2fbd1018 Stephen Hemminger  2016-12-03  208  
06028d15177a1b Stephen Hemminger  2018-01-09  209  	/* Communicating with host has to be via shared memory not hypercall */
06028d15177a1b Stephen Hemminger  2018-01-09  210  	if (!dev->channel->offermsg.monitor_allocated) {
06028d15177a1b Stephen Hemminger  2018-01-09  211  		dev_err(&dev->device, "vmbus channel requires hypercall\n");
06028d15177a1b Stephen Hemminger  2018-01-09  212  		ret = -ENOTSUPP;
06028d15177a1b Stephen Hemminger  2018-01-09  213  		goto fail_close;
06028d15177a1b Stephen Hemminger  2018-01-09  214  	}
06028d15177a1b Stephen Hemminger  2018-01-09  215  
95096f2fbd1018 Stephen Hemminger  2016-12-03  216  	dev->channel->inbound.ring_buffer->interrupt_mask = 1;
2141a8457f16ba Stephen Hemminger  2018-01-04  217  	set_channel_read_mode(dev->channel, HV_CALL_ISR);
95096f2fbd1018 Stephen Hemminger  2016-12-03  218  
95096f2fbd1018 Stephen Hemminger  2016-12-03  219  	/* Fill general uio info */
95096f2fbd1018 Stephen Hemminger  2016-12-03  220  	pdata->info.name = "uio_hv_generic";
95096f2fbd1018 Stephen Hemminger  2016-12-03  221  	pdata->info.version = DRIVER_VERSION;
95096f2fbd1018 Stephen Hemminger  2016-12-03  222  	pdata->info.irqcontrol = hv_uio_irqcontrol;
95096f2fbd1018 Stephen Hemminger  2016-12-03  223  	pdata->info.irq = UIO_IRQ_CUSTOM;
95096f2fbd1018 Stephen Hemminger  2016-12-03  224  
95096f2fbd1018 Stephen Hemminger  2016-12-03  225  	/* mem resources */
95096f2fbd1018 Stephen Hemminger  2016-12-03  226  	pdata->info.mem[TXRX_RING_MAP].name = "txrx_rings";
95096f2fbd1018 Stephen Hemminger  2016-12-03  227  	pdata->info.mem[TXRX_RING_MAP].addr
81ddc6592e779e Stephen Hemminger  2019-11-21  228  		= (uintptr_t)page_address(dev->channel->ringbuffer_page);
95096f2fbd1018 Stephen Hemminger  2016-12-03  229  	pdata->info.mem[TXRX_RING_MAP].size
9c40546c012c8d Stephen Hemminger  2018-01-04  230  		= dev->channel->ringbuffer_pagecount << PAGE_SHIFT;
95096f2fbd1018 Stephen Hemminger  2016-12-03  231  	pdata->info.mem[TXRX_RING_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  232  
95096f2fbd1018 Stephen Hemminger  2016-12-03  233  	pdata->info.mem[INT_PAGE_MAP].name = "int_page";
9c40546c012c8d Stephen Hemminger  2018-01-04  234  	pdata->info.mem[INT_PAGE_MAP].addr
72d1465789506c Arnd Bergmann      2018-01-10  235  		= (uintptr_t)vmbus_connection.int_page;
95096f2fbd1018 Stephen Hemminger  2016-12-03  236  	pdata->info.mem[INT_PAGE_MAP].size = PAGE_SIZE;
95096f2fbd1018 Stephen Hemminger  2016-12-03  237  	pdata->info.mem[INT_PAGE_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  238  
9c40546c012c8d Stephen Hemminger  2018-01-04  239  	pdata->info.mem[MON_PAGE_MAP].name = "monitor_page";
9c40546c012c8d Stephen Hemminger  2018-01-04  240  	pdata->info.mem[MON_PAGE_MAP].addr
72d1465789506c Arnd Bergmann      2018-01-10  241  		= (uintptr_t)vmbus_connection.monitor_pages[1];
95096f2fbd1018 Stephen Hemminger  2016-12-03  242  	pdata->info.mem[MON_PAGE_MAP].size = PAGE_SIZE;
95096f2fbd1018 Stephen Hemminger  2016-12-03  243  	pdata->info.mem[MON_PAGE_MAP].memtype = UIO_MEM_LOGICAL;
95096f2fbd1018 Stephen Hemminger  2016-12-03  244  
e7d214642a19b8 Stephen Hemminger  2018-01-09  245  	pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
e7d214642a19b8 Stephen Hemminger  2018-01-09  246  	if (pdata->recv_buf == NULL) {
e7d214642a19b8 Stephen Hemminger  2018-01-09  247  		ret = -ENOMEM;
e7d214642a19b8 Stephen Hemminger  2018-01-09  248  		goto fail_close;
e7d214642a19b8 Stephen Hemminger  2018-01-09  249  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  250  
e7d214642a19b8 Stephen Hemminger  2018-01-09  251  	ret = vmbus_establish_gpadl(dev->channel, pdata->recv_buf,
e7d214642a19b8 Stephen Hemminger  2018-01-09  252  				    RECV_BUFFER_SIZE, &pdata->recv_gpadl);
807378830df3ae Christophe JAILLET 2024-03-09  253  	if (ret) {
807378830df3ae Christophe JAILLET 2024-03-09  254  		vfree(pdata->recv_buf);
                                                                ^^^^^^^^^^^^^^^^^^^^^^^
Freed

e7d214642a19b8 Stephen Hemminger  2018-01-09  255  		goto fail_close;
807378830df3ae Christophe JAILLET 2024-03-09  256  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  257  
e7d214642a19b8 Stephen Hemminger  2018-01-09  258  	/* put Global Physical Address Label in name */
e7d214642a19b8 Stephen Hemminger  2018-01-09  259  	snprintf(pdata->recv_name, sizeof(pdata->recv_name),
e7d214642a19b8 Stephen Hemminger  2018-01-09  260  		 "recv:%u", pdata->recv_gpadl);
e7d214642a19b8 Stephen Hemminger  2018-01-09  261  	pdata->info.mem[RECV_BUF_MAP].name = pdata->recv_name;
e7d214642a19b8 Stephen Hemminger  2018-01-09  262  	pdata->info.mem[RECV_BUF_MAP].addr
d6088e9a89f7c6 Arnd Bergmann      2018-01-12  263  		= (uintptr_t)pdata->recv_buf;
e7d214642a19b8 Stephen Hemminger  2018-01-09  264  	pdata->info.mem[RECV_BUF_MAP].size = RECV_BUFFER_SIZE;
e7d214642a19b8 Stephen Hemminger  2018-01-09  265  	pdata->info.mem[RECV_BUF_MAP].memtype = UIO_MEM_VIRTUAL;
e7d214642a19b8 Stephen Hemminger  2018-01-09  266  
e7d214642a19b8 Stephen Hemminger  2018-01-09  267  
e7d214642a19b8 Stephen Hemminger  2018-01-09  268  	pdata->send_buf = vzalloc(SEND_BUFFER_SIZE);
e7d214642a19b8 Stephen Hemminger  2018-01-09  269  	if (pdata->send_buf == NULL) {
e7d214642a19b8 Stephen Hemminger  2018-01-09  270  		ret = -ENOMEM;
e7d214642a19b8 Stephen Hemminger  2018-01-09  271  		goto fail_close;
e7d214642a19b8 Stephen Hemminger  2018-01-09  272  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  273  
e7d214642a19b8 Stephen Hemminger  2018-01-09  274  	ret = vmbus_establish_gpadl(dev->channel, pdata->send_buf,
e7d214642a19b8 Stephen Hemminger  2018-01-09  275  				    SEND_BUFFER_SIZE, &pdata->send_gpadl);
807378830df3ae Christophe JAILLET 2024-03-09  276  	if (ret) {
807378830df3ae Christophe JAILLET 2024-03-09  277  		vfree(pdata->send_buf);
                                                                      ^^^^^^^^^^^^^^^
Freed.

e7d214642a19b8 Stephen Hemminger  2018-01-09  278  		goto fail_close;
807378830df3ae Christophe JAILLET 2024-03-09  279  	}
e7d214642a19b8 Stephen Hemminger  2018-01-09  280  
e7d214642a19b8 Stephen Hemminger  2018-01-09  281  	snprintf(pdata->send_name, sizeof(pdata->send_name),
e7d214642a19b8 Stephen Hemminger  2018-01-09  282  		 "send:%u", pdata->send_gpadl);
e7d214642a19b8 Stephen Hemminger  2018-01-09  283  	pdata->info.mem[SEND_BUF_MAP].name = pdata->send_name;
e7d214642a19b8 Stephen Hemminger  2018-01-09  284  	pdata->info.mem[SEND_BUF_MAP].addr
d6088e9a89f7c6 Arnd Bergmann      2018-01-12  285  		= (uintptr_t)pdata->send_buf;
e7d214642a19b8 Stephen Hemminger  2018-01-09  286  	pdata->info.mem[SEND_BUF_MAP].size = SEND_BUFFER_SIZE;
e7d214642a19b8 Stephen Hemminger  2018-01-09  287  	pdata->info.mem[SEND_BUF_MAP].memtype = UIO_MEM_VIRTUAL;
e7d214642a19b8 Stephen Hemminger  2018-01-09  288  
95096f2fbd1018 Stephen Hemminger  2016-12-03  289  	pdata->info.priv = pdata;
95096f2fbd1018 Stephen Hemminger  2016-12-03  290  	pdata->device = dev;
95096f2fbd1018 Stephen Hemminger  2016-12-03  291  
95096f2fbd1018 Stephen Hemminger  2016-12-03  292  	ret = uio_register_device(&dev->device, &pdata->info);
95096f2fbd1018 Stephen Hemminger  2016-12-03  293  	if (ret) {
95096f2fbd1018 Stephen Hemminger  2016-12-03  294  		dev_err(&dev->device, "hv_uio register failed\n");
95096f2fbd1018 Stephen Hemminger  2016-12-03  295  		goto fail_close;
95096f2fbd1018 Stephen Hemminger  2016-12-03  296  	}
95096f2fbd1018 Stephen Hemminger  2016-12-03  297  
ca3cda6fcf1e92 Stephen Hemminger  2018-01-09  298  	vmbus_set_chn_rescind_callback(dev->channel, hv_uio_rescind);
37b96a4931dba0 Stephen Hemminger  2018-02-05  299  	vmbus_set_sc_create_callback(dev->channel, hv_uio_new_channel);
ca3cda6fcf1e92 Stephen Hemminger  2018-01-09  300  
9ab877a6ccf820 Stephen Hemminger  2018-04-16  301  	ret = sysfs_create_bin_file(&dev->channel->kobj, &ring_buffer_bin_attr);
9ab877a6ccf820 Stephen Hemminger  2018-04-16  302  	if (ret)
9ab877a6ccf820 Stephen Hemminger  2018-04-16  303  		dev_notice(&dev->device,
9ab877a6ccf820 Stephen Hemminger  2018-04-16  304  			   "sysfs create ring bin file failed; %d\n", ret);
9ab877a6ccf820 Stephen Hemminger  2018-04-16  305  
95096f2fbd1018 Stephen Hemminger  2016-12-03  306  	hv_set_drvdata(dev, pdata);
95096f2fbd1018 Stephen Hemminger  2016-12-03  307  
95096f2fbd1018 Stephen Hemminger  2016-12-03  308  	return 0;
95096f2fbd1018 Stephen Hemminger  2016-12-03  309  
95096f2fbd1018 Stephen Hemminger  2016-12-03  310  fail_close:
e7d214642a19b8 Stephen Hemminger  2018-01-09 @311  	hv_uio_cleanup(dev, pdata);
                                                                       ^^^
Double frees

95096f2fbd1018 Stephen Hemminger  2016-12-03  312  	vmbus_close(dev->channel);
95096f2fbd1018 Stephen Hemminger  2016-12-03  313  fail:
95096f2fbd1018 Stephen Hemminger  2016-12-03  314  	kfree(pdata);
95096f2fbd1018 Stephen Hemminger  2016-12-03  315  
95096f2fbd1018 Stephen Hemminger  2016-12-03  316  	return ret;
95096f2fbd1018 Stephen Hemminger  2016-12-03  317  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

