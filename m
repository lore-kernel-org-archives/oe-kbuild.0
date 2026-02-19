Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7E3358D0
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489726; cv=none; b=A4BvMeMFO20UexY3iWgd6u16o6Jyn2m2Qnh8GKMmWutEIQSQbFVagAQeHfM9Wii1R1OEF9/+6UI8c3VOeBK0qGQZMGWf4Sj0VPN/H1MY6IHmE0hpSrtnRpYV1J8gAZDGn4EtF9YslCm+s4elkCP5U2TOGSdlf1/ENEHSy7iUHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489726; c=relaxed/simple;
	bh=CZdvF0NSmvpT3FQaL3yhFOnbzjIg5pEomEvylH7mBNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cn/u74kAPA2jwy2924eVqpIRlOKo3lXWh0e8n8FL5C3PjHf9ps+b46jr08f4Rcpfr4HdiFVysGNbDArhG+OeF4cmn1r2fObI0lYEe4s0b9CbmkoF1gVSQfKIZWEYTz1wLOw6UcYt91tjsRvs03Ff/MspUAgxJbADAdMBHMcVzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTlcuUbl; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTlcuUbl"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4362507f396so687951f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 00:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489723; x=1772094523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LlA0MoNwLthJ3WbFXT1GsIbvdxg0vIHk87hmvUw3AEo=;
        b=LTlcuUbl8FYDqCvkHwX2nlLmvsCJhBf0XjQaQ1ybXlUXruh5WIfdKtZZxhG3/dUI0P
         JNwv8WswHXQu+cjxXQkpz0OtJqpY2IXRs6hkTie6U8Yb1xiN2iMrhinlValtiMSjam/d
         0vz94bxCSpzhvgvwjxo7UylFTkuBIblHPQvOKJqRVuTaHsw+C5g2UqS08tu+LimLx8kt
         vae42wQsKr9zXXxSz48OluKJF8vv6SOAtsfb3zZLTKDQCZyZE0kpkEdyj4K7BCRUD2gx
         AzGtOmFS26gFUuAUILKFjhG/sfOt5haJuvB1X+FjxQnuzqAJnzxypGKRFkPLruETRKgR
         WoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489723; x=1772094523;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlA0MoNwLthJ3WbFXT1GsIbvdxg0vIHk87hmvUw3AEo=;
        b=PKVvMIxtXfFwQK4QBO5yBmcYdtpnRHpr8YOz/VPCoICRggb3W3dqcPv/Qzsz/mHjcb
         eTZxO05gg7dNa9aS91SafGPUaeTs1SFwWMOAaqGNJy83gCNkEOsvHuP4VxoyLfeC8WML
         V/OmuILTgyIYsXKPqo4chHKHJMmjOi4LZx3CgXA+zRKT1U8HE6Su/TiP4JQvqiXelgph
         xLRI/8VAl7mcozWuq+m3zv7PgZbbgvb0iHeVUOuH+UZ7YQl4IrNOsDhQWTuxkwh3gQ9M
         mu4mlDegYKgfnY5Sl3GWBo7frBOu8OyuSqsI4SE7Q+vjDRNYdO+zClrvKbTeKf2x/Ej+
         Ospw==
X-Gm-Message-State: AOJu0YwHitEe6LpzkvKLDECs4L+VHUm/SAYwiN0Ieer1Md+iErGi7q7O
	5f97DxiqayyAp66TVEO1LTv9LUHaCus8wyglkM4LKU71C/xAJd9ec0t1lKZvp3M8SVguc2KoTd/
	EASwN
X-Gm-Gg: AZuq6aIVJx+KPSGJq31y/vi6zqaN0gPiq2Hv9lER9iEZs9o2KLD7mIkEk++eQacDNtq
	60nj9i8uw0+Fw1PTWZxHUsr0hmKEmW11RHwwF5l6JZQTkPweyNaSlkdVCsxHUQjxbzG7Qy6LU3k
	R5manu+3vWa4t1cruVL6dKdGmdJpLZUaCmvgNwHcPz/2C32uJX1C4VntD4xo5R8AmS1KzUazfrz
	mdC2Lu2A9ofGj6FmwqBhyfxJ8v+b092bM1Vi48cHVw9OTNMDpoiSLTQu4yH51AECvGZJfBtyEau
	dDp9EhKJUXjq/9NS00JNh+gv8/N5uxKVIrYejqxuIJaFAzlDCvZSy9zGT3/p2J+kxnF205NmzLG
	bUkmzh+Q262pzE6vrlT1gtH9+y3q6KJRXZYN5bN24mIsd7/PnOePpO6lrfWIojlGA5kyZpzUp8N
	wUITw7oX3bwxPuMDwmHanZ48Efrw5L
X-Received: by 2002:a05:6000:402b:b0:437:678b:83c2 with SMTP id ffacd0b85a97d-43958e5794dmr8711741f8f.54.1771489723133;
        Thu, 19 Feb 2026 00:28:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac7csm44982348f8f.7.2026.02.19.00.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:28:42 -0800 (PST)
Date: Thu, 19 Feb 2026 11:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Akhil R <akhilrajeev@nvidia.com>,
	dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, p.zabel@pengutronix.de,
	Akhil R <akhilrajeev@nvidia.com>
Subject: Re: [PATCH 6/8] dmaengine: tegra: Use iommu-map for stream ID
Message-ID: <202602181757.Amx49qCP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217173457.18628-7-akhilrajeev@nvidia.com>
Message-ID: <20260219082839.3R9k7KazKwkFyp9XaqRfUMEKzNDl54olaMcPj8Y_Uq4@z>

Hi Akhil,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-dma-nvidia-tegra186-gpc-dma-Add-iommu-map-property/20260218-014114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260217173457.18628-7-akhilrajeev%40nvidia.com
patch subject: [PATCH 6/8] dmaengine: tegra: Use iommu-map for stream ID
config: sparc64-randconfig-r072-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181757.Amx49qCP-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602181757.Amx49qCP-lkp@intel.com/

smatch warnings:
drivers/dma/tegra186-gpc-dma.c:1543 tegra_dma_probe() warn: missing error code 'ret'

vim +/ret +1543 drivers/dma/tegra186-gpc-dma.c

ee17028009d49f Akhil R         2022-02-25  1514  	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
ee17028009d49f Akhil R         2022-02-25  1515  
ee17028009d49f Akhil R         2022-02-25  1516  	ret = dma_async_device_register(&tdma->dma_dev);
ee17028009d49f Akhil R         2022-02-25  1517  	if (ret < 0) {
ee17028009d49f Akhil R         2022-02-25  1518  		dev_err_probe(&pdev->dev, ret,
ee17028009d49f Akhil R         2022-02-25  1519  			      "GPC DMA driver registration failed\n");
ee17028009d49f Akhil R         2022-02-25  1520  		return ret;
ee17028009d49f Akhil R         2022-02-25  1521  	}
ee17028009d49f Akhil R         2022-02-25  1522  
43f59d3fa0deca Akhil R         2026-02-17  1523  	list_for_each_entry(chan, &tdma->dma_dev.channels, device_node) {
43f59d3fa0deca Akhil R         2026-02-17  1524  		struct device *chdev = &chan->dev->device;
43f59d3fa0deca Akhil R         2026-02-17  1525  
43f59d3fa0deca Akhil R         2026-02-17  1526  		tdc = to_tegra_dma_chan(chan);
43f59d3fa0deca Akhil R         2026-02-17  1527  		if (use_iommu_map) {
43f59d3fa0deca Akhil R         2026-02-17  1528  			chdev->coherent_dma_mask = pdev->dev.coherent_dma_mask;
43f59d3fa0deca Akhil R         2026-02-17  1529  			chdev->dma_mask = &chdev->coherent_dma_mask;
43f59d3fa0deca Akhil R         2026-02-17  1530  			chdev->bus = pdev->dev.bus;
43f59d3fa0deca Akhil R         2026-02-17  1531  
43f59d3fa0deca Akhil R         2026-02-17  1532  			ret = of_dma_configure_id(chdev, pdev->dev.of_node,
43f59d3fa0deca Akhil R         2026-02-17  1533  						  true, &tdc->id);
43f59d3fa0deca Akhil R         2026-02-17  1534  			if (ret) {
43f59d3fa0deca Akhil R         2026-02-17  1535  				dev_err(chdev, "Failed to configure IOMMU for channel %d: %d\n",
43f59d3fa0deca Akhil R         2026-02-17  1536  					tdc->id, ret);
43f59d3fa0deca Akhil R         2026-02-17  1537  				goto err_unregister;
43f59d3fa0deca Akhil R         2026-02-17  1538  			}
43f59d3fa0deca Akhil R         2026-02-17  1539  
43f59d3fa0deca Akhil R         2026-02-17  1540  			if (!tegra_dev_iommu_get_stream_id(chdev, &stream_id)) {
43f59d3fa0deca Akhil R         2026-02-17  1541  				dev_err(chdev, "Failed to get stream ID for channel %d\n",
43f59d3fa0deca Akhil R         2026-02-17  1542  					tdc->id);
43f59d3fa0deca Akhil R         2026-02-17 @1543  				goto err_unregister;

ret = -EINVAL;

43f59d3fa0deca Akhil R         2026-02-17  1544  			}
43f59d3fa0deca Akhil R         2026-02-17  1545  
43f59d3fa0deca Akhil R         2026-02-17  1546  			chan->dev->chan_dma_dev = true;
43f59d3fa0deca Akhil R         2026-02-17  1547  		}
43f59d3fa0deca Akhil R         2026-02-17  1548  
43f59d3fa0deca Akhil R         2026-02-17  1549  		/* program stream-id for this channel */
43f59d3fa0deca Akhil R         2026-02-17  1550  		tegra_dma_program_sid(tdc, stream_id);
43f59d3fa0deca Akhil R         2026-02-17  1551  		tdc->stream_id = stream_id;
43f59d3fa0deca Akhil R         2026-02-17  1552  	}
43f59d3fa0deca Akhil R         2026-02-17  1553  
ee17028009d49f Akhil R         2022-02-25  1554  	ret = of_dma_controller_register(pdev->dev.of_node,
ee17028009d49f Akhil R         2022-02-25  1555  					 tegra_dma_of_xlate, tdma);
ee17028009d49f Akhil R         2022-02-25  1556  	if (ret < 0) {
ee17028009d49f Akhil R         2022-02-25  1557  		dev_err_probe(&pdev->dev, ret,
ee17028009d49f Akhil R         2022-02-25  1558  			      "GPC DMA OF registration failed\n");
43f59d3fa0deca Akhil R         2026-02-17  1559  		goto err_unregister;
ee17028009d49f Akhil R         2022-02-25  1560  	}
ee17028009d49f Akhil R         2022-02-25  1561  
43f59d3fa0deca Akhil R         2026-02-17  1562  	dev_info(&pdev->dev, "GPC DMA driver registered %lu channels\n",
3a0c95b61385f5 Akhil R         2022-11-10  1563  		 hweight_long(tdma->chan_mask));
ee17028009d49f Akhil R         2022-02-25  1564  
ee17028009d49f Akhil R         2022-02-25  1565  	return 0;
43f59d3fa0deca Akhil R         2026-02-17  1566  
43f59d3fa0deca Akhil R         2026-02-17  1567  err_unregister:
43f59d3fa0deca Akhil R         2026-02-17  1568  	dma_async_device_unregister(&tdma->dma_dev);
43f59d3fa0deca Akhil R         2026-02-17  1569  	return ret;
ee17028009d49f Akhil R         2022-02-25  1570  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

