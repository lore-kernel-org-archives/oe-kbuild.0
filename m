Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574111CBC
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qz/unXKD"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b472f98b1so3340075e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 00:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073392; x=1701678192; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3xbW3m1wgZA7xHDhdSDuWfisCkTFnB8xotKZ/z6GNc=;
        b=Qz/unXKDEDeINY3rfOpEtBlm8F3eiVD7blCkxKIsK6e7B6F/VwwRH1db2IiGCu8e6p
         s/2UW+xk8WNEQs85DEkYlbSQXAT6nAinJyHcqV8zbGW+6AK8M8Jh6XvWW0Fz+inmaP3Z
         HgvxX/+I+BAmbAxljzpVR6uMlNIF+LrXnE20F8hI3zfdzFZmlXxDWtt4WMm1L7JytlY1
         AmvKDstH36NNM47pdszWGKJl1TT2SXDlSrPGsA43c7O+NDUioBmlfcGSysYvcQf5+Sjx
         hdulQF/5YFLY1VfbahsLjYq3lJUBcytDSctWNO2aSU9xbzUp5ISzFr2HYVd2io3wiU6K
         ImdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073392; x=1701678192;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3xbW3m1wgZA7xHDhdSDuWfisCkTFnB8xotKZ/z6GNc=;
        b=ucNYWrKWQYPFL1aVMwrtYetPoprmEpHchd/RnGoayWVJuIZMNUtuqPWXxGeCHWpjli
         cTePa0N/WUwhUJCO/spikjtRXsNmJLfT6kIqgGnaqFZq/FlnhDbxucxFFlDqq2X0WwzF
         d4ZsURkrWi9e8GnlN5rR7RVkBUw33WiaDtoSObS0gGNhmrMdOCREqvpMo3E0CaPis8gn
         o/MmW7+fxp53nDAFozv8ZBVPcQpqkphyY6bwuUf74JBTdvXzC6FBCPXJKVno75rqA4Zs
         7vxuq8kEomP976K5HWiwHXi4nmB69ZTiz2ulKRp5uRhcvdsOZqrnReSuZ+kVKVNRTzT4
         TAEQ==
X-Gm-Message-State: AOJu0YzhyZo0zjp7Xxwkyjy1R/cMVGQPyVXnUdyLk3MTNYwvux/9seAw
	ucFNWALoCeDPrxRvjhHDsgt9ICApd5buWqUoOZk=
X-Google-Smtp-Source: AGHT+IHcxku4GkYQFgIwY+TSykoWNFuj4qdFMkUSxrPkAZM1Qp+7FaN4DmjCB/qp3PcmYZrayxyb8g==
X-Received: by 2002:a05:600c:1381:b0:405:3455:e1a3 with SMTP id u1-20020a05600c138100b004053455e1a3mr7241403wmf.17.1701073392005;
        Mon, 27 Nov 2023 00:23:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id jg28-20020a05600ca01c00b004063cd8105csm13624785wmb.22.2023.11.27.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:23:11 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 11:23:08 +0300
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_fwspec 12/41] drivers/iommu/of_iommu.c:128
 of_iommu_for_each_id() error: we previously assumed 'id' could be null (see
 line 127)
Message-ID: <7bbf49b2-4d51-4d4c-8014-57f9827cf247@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_fwspec
head:   49c7574491cc9c8e8f21a8e8acb635b0e0bdfd61
commit: c7f276e38638a13299b4ded2ad6193f863534475 [12/41] iommu/of: Make a of_iommu_for_each_id()
config: mips-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260642.VkLE7lht-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260642.VkLE7lht-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311260642.VkLE7lht-lkp@intel.com/

smatch warnings:
drivers/iommu/of_iommu.c:128 of_iommu_for_each_id() error: we previously assumed 'id' could be null (see line 127)

vim +/id +128 drivers/iommu/of_iommu.c

c7f276e38638a1 Jason Gunthorpe   2023-11-23  103  static int of_iommu_for_each_id(struct device *dev,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  104  				struct device_node *master_np, const u32 *id,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  105  				of_for_each_fn fn, void *info)
a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  106  {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  107  	/*
c7f276e38638a1 Jason Gunthorpe   2023-11-23  108  	 * We don't currently walk up the tree looking for a parent IOMMU.
c7f276e38638a1 Jason Gunthorpe   2023-11-23  109  	 * See the `Notes:' section of
c7f276e38638a1 Jason Gunthorpe   2023-11-23  110  	 * Documentation/devicetree/bindings/iommu/iommu.txt
c7f276e38638a1 Jason Gunthorpe   2023-11-23  111  	 */
c7f276e38638a1 Jason Gunthorpe   2023-11-23  112  	if (dev_is_pci(dev)) {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  113  		struct of_pci_iommu_alias_info pci_info = {
c7f276e38638a1 Jason Gunthorpe   2023-11-23  114  			.np = master_np,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  115  			.fn = fn,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  116  			.info = info,
c7f276e38638a1 Jason Gunthorpe   2023-11-23  117  		};
c7f276e38638a1 Jason Gunthorpe   2023-11-23  118  
c7f276e38638a1 Jason Gunthorpe   2023-11-23  119  		/* In PCI mode the ID comes from the RID */
c7f276e38638a1 Jason Gunthorpe   2023-11-23  120  		if (WARN_ON(id))
c7f276e38638a1 Jason Gunthorpe   2023-11-23  121  			return -EINVAL;
c7f276e38638a1 Jason Gunthorpe   2023-11-23  122  
c7f276e38638a1 Jason Gunthorpe   2023-11-23  123  		return pci_for_each_dma_alias(to_pci_dev(dev),
c7f276e38638a1 Jason Gunthorpe   2023-11-23  124  					     __for_each_map_pci, &pci_info);
c7f276e38638a1 Jason Gunthorpe   2023-11-23  125  	}
c7f276e38638a1 Jason Gunthorpe   2023-11-23  126  
c7f276e38638a1 Jason Gunthorpe   2023-11-23 @127  	if (!id)

Reversed if statement?

c7f276e38638a1 Jason Gunthorpe   2023-11-23 @128  		return __for_each_map_id(master_np, *id, fn, info);
                                                                                                    ^^^

c7f276e38638a1 Jason Gunthorpe   2023-11-23  129  	return __for_each_iommus(master_np, fn, info);
a081bd4af4ce80 Lorenzo Pieralisi 2020-06-19  130  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

