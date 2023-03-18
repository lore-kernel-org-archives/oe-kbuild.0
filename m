Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470E7F8;
	Sat, 18 Mar 2023 07:40:18 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id v25so2736407wra.12;
        Sat, 18 Mar 2023 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679125217;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eUgoomZqG9/B1fL4HpwEEvVn4MSGDtxplQAM8jc3kWk=;
        b=nxl0eeKBdp3D3+EAssQEzjMWbpngkQ2tScjWaDNEW4GPug1BWbpgW7ew7ZduE6LJAj
         ymYPsX9BVWnzr9zvqZMV84oxe+3lLMIt+ey46scaZXHhlddIVDW5Az8DD7HcuTIaMgqm
         qow9fRge8fgO0Tbd7WwXwW/sE0LBGIOxsMA0G5SBHWQNpkj+pAIIFT5HspXOciqv17I8
         /2WMY5ZUxdaRoWiGMLwZN8LAvj0Ucz8A2SKIrdmBgvFq/9jLrnImzpmE5ZohZM/ujDOn
         bUsItApeRyOz4U17ZL7R9LYTiCjtP7D5nRPd8/gYrsn4ME14igYgw3EkqHSat/2Xmo/O
         enBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679125217;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUgoomZqG9/B1fL4HpwEEvVn4MSGDtxplQAM8jc3kWk=;
        b=UZbMeNq+VsivUmxfK1X7Kf3x+IXv+mVG1PjaGybmfbX8GbkkX8Z5Fbm9+av77bQBYB
         OpBLpX8pkTW4mmBSGuVEv9qjsgYOLCPUwLdLy2nIdKmwMX7XYK/zqGk0Sr0uiOti120U
         aNFJS1s5Zs92MWefBiweGzFM2inRBo58O7X+O1LJEQQDW58vhfso4NoWgAe3cbCp62zy
         ejLDwI6gSk0nk87jsV6PUcNjnidsCWVCl6CWyS7bqy2N+B2HBAO+aYDY4AGA1GISiGRe
         vCcDDws6fqGnoJ20u+7OIHx7K0C4spGJJGGGbLLcbwM4mzQvNh43IMgk2/BM4XxkV3Es
         qoOg==
X-Gm-Message-State: AO0yUKX/j+TR5rigHPGl7iuz29WmwbvY142Pb7lwvtJ5yEw/dvOsfDJy
	T6RGrJK09VEMulQXZ4wLL6XLYWcBumg=
X-Google-Smtp-Source: AK7set8thGwJNwDN9F+/IS/CRT3mtrMP8Dnzqf9jZ0b/Saa0hxmqJcfdhtsqmv17weWmOt0NLdeaVQ==
X-Received: by 2002:adf:ded0:0:b0:2cf:e9de:1082 with SMTP id i16-20020adfded0000000b002cfe9de1082mr7964739wrn.24.1679125216814;
        Sat, 18 Mar 2023 00:40:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d4486000000b002cfef4cfdfbsm3668256wrq.115.2023.03.18.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:40:16 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:40:08 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Reinette Chatre <reinette.chatre@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/8] vfio/pci: Support dynamic MSI-x
Message-ID: <13a125f5-4481-46f4-b809-a90e35e1a561@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <591ce11f4a33e022fc9242324ebdc077202bedaf.1678911529.git.reinette.chatre@intel.com>

Hi Reinette,

url:    https://github.com/intel-lab-lkp/linux/commits/Reinette-Chatre/vfio-pci-Consolidate-irq-cleanup-on-MSI-MSI-X-disable/20230316-050150
base:   eeac8ede17557680855031c6f305ece2378af326
patch link:    https://lore.kernel.org/r/591ce11f4a33e022fc9242324ebdc077202bedaf.1678911529.git.reinette.chatre%40intel.com
patch subject: [RFC PATCH 7/8] vfio/pci: Support dynamic MSI-x
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230316/202303162207.6AD9wdJd-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303162207.6AD9wdJd-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_intrs.c:557 vfio_msi_set_vector_signal() error: uninitialized symbol 'new_ctx'.

Old smatch warnings:
drivers/vfio/pci/vfio_pci_intrs.c:569 vfio_msi_set_vector_signal() error: uninitialized symbol 'new_ctx'.

vim +/new_ctx +557 drivers/vfio/pci/vfio_pci_intrs.c

536475109c8284 Max Gurtovoy      2021-08-26  440  static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
45d99835bd7f50 Reinette Chatre   2023-03-15  441  				      unsigned int vector, int fd, bool msix)
89e1f7d4c66d85 Alex Williamson   2012-07-31  442  {
89e1f7d4c66d85 Alex Williamson   2012-07-31  443  	struct pci_dev *pdev = vdev->pdev;
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  444  	struct vfio_pci_irq_ctx *ctx;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  445  	struct msi_map msix_map = {};
89e1f7d4c66d85 Alex Williamson   2012-07-31  446  	struct eventfd_ctx *trigger;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  447  	bool new_ctx;

Was never intiliazed to false.

b95d9305e8cb8d Alex Williamson   2016-02-22  448  	int irq, ret;
abafbc551fdded Alex Williamson   2020-04-22  449  	u16 cmd;
89e1f7d4c66d85 Alex Williamson   2012-07-31  450  
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  451  	ctx = vfio_irq_ctx_get(vdev, vector);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  452  	/* Only MSI-X allows dynamic allocation. */
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  453  	if (!msix && !ctx)
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  454  		return -EINVAL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  455  
61771468e0a567 Christoph Hellwig 2016-09-11  456  	irq = pci_irq_vector(pdev, vector);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  457  	/* Context and interrupt are always allocated together. */
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  458  	WARN_ON((ctx && irq == -EINVAL) || (!ctx && irq != -EINVAL));
b95d9305e8cb8d Alex Williamson   2016-02-22  459  
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  460  	if (ctx && ctx->trigger) {
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  461  		irq_bypass_unregister_producer(&ctx->producer);
abafbc551fdded Alex Williamson   2020-04-22  462  
abafbc551fdded Alex Williamson   2020-04-22  463  		cmd = vfio_pci_memory_lock_and_enable(vdev);
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  464  		free_irq(irq, ctx->trigger);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  465  		if (msix) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  466  			msix_map.index = vector;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  467  			msix_map.virq = irq;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  468  			pci_msix_free_irq(pdev, msix_map);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  469  			irq = -EINVAL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  470  		}
abafbc551fdded Alex Williamson   2020-04-22  471  		vfio_pci_memory_unlock_and_restore(vdev, cmd);
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  472  		kfree(ctx->name);
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  473  		eventfd_ctx_put(ctx->trigger);
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  474  		ctx->trigger = NULL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  475  		if (msix) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  476  			vfio_irq_ctx_free(vdev, vector);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  477  			ctx = NULL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  478  		}
89e1f7d4c66d85 Alex Williamson   2012-07-31  479  	}
89e1f7d4c66d85 Alex Williamson   2012-07-31  480  
89e1f7d4c66d85 Alex Williamson   2012-07-31  481  	if (fd < 0)
89e1f7d4c66d85 Alex Williamson   2012-07-31  482  		return 0;
89e1f7d4c66d85 Alex Williamson   2012-07-31  483  
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  484  	if (!ctx) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  485  		ret = vfio_irq_ctx_alloc_single(vdev, vector);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  486  		if (ret)
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  487  			return ret;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  488  		ctx = vfio_irq_ctx_get(vdev, vector);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  489  		if (!ctx) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  490  			ret = -EINVAL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  491  			goto out_free_ctx;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  492  		}
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  493  		new_ctx = true;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  494  	}
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  495  
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  496  	ctx->name = kasprintf(GFP_KERNEL_ACCOUNT, "vfio-msi%s[%d](%s)",
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  497  			      msix ? "x" : "", vector, pci_name(pdev));
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  498  	if (!ctx->name) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  499  		ret = -ENOMEM;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  500  		goto out_free_ctx;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  501  	}
89e1f7d4c66d85 Alex Williamson   2012-07-31  502  
89e1f7d4c66d85 Alex Williamson   2012-07-31  503  	trigger = eventfd_ctx_fdget(fd);
89e1f7d4c66d85 Alex Williamson   2012-07-31  504  	if (IS_ERR(trigger)) {
224474be3986e1 Reinette Chatre   2023-03-15  505  		ret = PTR_ERR(trigger);
224474be3986e1 Reinette Chatre   2023-03-15  506  		goto out_free_name;
89e1f7d4c66d85 Alex Williamson   2012-07-31  507  	}
89e1f7d4c66d85 Alex Williamson   2012-07-31  508  
abafbc551fdded Alex Williamson   2020-04-22  509  	cmd = vfio_pci_memory_lock_and_enable(vdev);
b8f02af096b1fc Gavin Shan        2014-09-29  510  	if (msix) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  511  		if (irq == -EINVAL) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  512  			msix_map = pci_msix_alloc_irq_at(pdev, vector, NULL);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  513  			if (msix_map.index < 0) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  514  				vfio_pci_memory_unlock_and_restore(vdev, cmd);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  515  				ret = msix_map.index;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  516  				goto out_put_eventfd_ctx;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  517  			}
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  518  			irq = msix_map.virq;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  519  		} else {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  520  			/*
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  521  			 * The MSIx vector table resides in device memory which
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  522  			 * may be cleared via backdoor resets. We don't allow
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  523  			 * direct access to the vector table so even if a
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  524  			 * userspace driver attempts to save/restore around
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  525  			 * such a reset it would be unsuccessful. To avoid
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  526  			 * this, restore the cached value of the message prior
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  527  			 * to enabling.
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  528  			 */
b8f02af096b1fc Gavin Shan        2014-09-29  529  			struct msi_msg msg;
b8f02af096b1fc Gavin Shan        2014-09-29  530  
b8f02af096b1fc Gavin Shan        2014-09-29  531  			get_cached_msi_msg(irq, &msg);
83a18912b0e8d2 Jiang Liu         2014-11-09  532  			pci_write_msi_msg(irq, &msg);
b8f02af096b1fc Gavin Shan        2014-09-29  533  		}
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  534  	}
b8f02af096b1fc Gavin Shan        2014-09-29  535  
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  536  	ret = request_irq(irq, vfio_msihandler, 0, ctx->name, trigger);
224474be3986e1 Reinette Chatre   2023-03-15  537  	if (ret)
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  538  		goto out_free_irq_locked;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  539  
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  540  	vfio_pci_memory_unlock_and_restore(vdev, cmd);
89e1f7d4c66d85 Alex Williamson   2012-07-31  541  
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  542  	ctx->producer.token = trigger;
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  543  	ctx->producer.irq = irq;
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  544  	ret = irq_bypass_register_producer(&ctx->producer);
852b1beecb6ff9 Alex Williamson   2020-10-19  545  	if (unlikely(ret)) {
6d7425f109d262 Feng Wu           2015-09-18  546  		dev_info(&pdev->dev,
6d7425f109d262 Feng Wu           2015-09-18  547  		"irq bypass producer (token %p) registration fails: %d\n",
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  548  		ctx->producer.token, ret);
6d7425f109d262 Feng Wu           2015-09-18  549  
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  550  		ctx->producer.token = NULL;
852b1beecb6ff9 Alex Williamson   2020-10-19  551  	}
d6ddf3a1f66d02 Reinette Chatre   2023-03-15  552  	ctx->trigger = trigger;
89e1f7d4c66d85 Alex Williamson   2012-07-31  553  
89e1f7d4c66d85 Alex Williamson   2012-07-31  554  	return 0;
224474be3986e1 Reinette Chatre   2023-03-15  555  
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  556  out_free_irq_locked:
db5c3d2cbe1a75 Reinette Chatre   2023-03-15 @557  	if (msix && new_ctx) {
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  558  		msix_map.index = vector;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  559  		msix_map.virq = irq;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  560  		pci_msix_free_irq(pdev, msix_map);
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  561  	}
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  562  	vfio_pci_memory_unlock_and_restore(vdev, cmd);
224474be3986e1 Reinette Chatre   2023-03-15  563  out_put_eventfd_ctx:
224474be3986e1 Reinette Chatre   2023-03-15  564  	eventfd_ctx_put(trigger);
224474be3986e1 Reinette Chatre   2023-03-15  565  out_free_name:
224474be3986e1 Reinette Chatre   2023-03-15  566  	kfree(ctx->name);
224474be3986e1 Reinette Chatre   2023-03-15  567  	ctx->name = NULL;
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  568  out_free_ctx:
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  569  	if (msix && new_ctx)
db5c3d2cbe1a75 Reinette Chatre   2023-03-15  570  		vfio_irq_ctx_free(vdev, vector);
224474be3986e1 Reinette Chatre   2023-03-15  571  	return ret;
89e1f7d4c66d85 Alex Williamson   2012-07-31  572  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

