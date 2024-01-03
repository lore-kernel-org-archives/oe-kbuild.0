Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CCB18E17
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 11:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzHdS8mb"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e835800adso6378646e87.0
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704281002; x=1704885802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJRFm+aJFXgkxWtqPNaVAM12RXPKxO0DGGq8KgLaeE0=;
        b=dzHdS8mbeyEcUh+KKuzlNgGMIb5JcQZdC7dgN1z8ks7PiZgO38S4d9YieE1jQFW42v
         DHFCSHzhKjqnBpeB38EOf/TQYEkhCXDCS9pHXwK0WTe2W8n2EUKJmmpxIYAHmCA+Bwgg
         BMdDfRRH2NQ2RNMR1CfIgDG+i5RjsBwoQ91/9TRTIrSPUJvnaIFOSW8ODbrddplG54U6
         WAVZymNJkJabWl7bjc36tGA0T84AMuquEDOlWO9pUFogkF4DZtirsKHrdEbVaLJ/LwuU
         97qx4POIkg3j2NpCCUgYXpF85VNbSeRD34iOcfx6kLL0t63xUg15+hOottgJRMxmK/Zy
         nXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704281002; x=1704885802;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJRFm+aJFXgkxWtqPNaVAM12RXPKxO0DGGq8KgLaeE0=;
        b=qiLXBkKEXw0r6PYCSW3Ztd6bwiqWxkD2N4Rquiu45WMlE8d8n35m/APQvHtQ7SjpiU
         yGKE53LhMIWdx7R4/+y0ZG5nIdLcBaby+mjjdlNCgVCz6yVkr9nWNP1vjKTsUTcz1Yda
         J3Y658yACsIcCyqkcYYzvZ8+YRGfvNGfZcgNrxB86Vu++zYWSF9ufvfxLi19yWPY17tZ
         5/mzVVJfQSWWKNU2pm19e206d3uZKpeIUn4cnY8vJ087hhQ8ICxLOHqL++yLwwum9Dg1
         miKsH3cu+jsheKMN6y6v9K3eWKM6GWCYzS3Ruxn5u2VRqc9wNlY1a8LAeaNBo/xj2LhQ
         k2eg==
X-Gm-Message-State: AOJu0YxvN9e29thyqCNXgeC0jPFkGBsrh7BV/Oc5qzARwDvviHWIq6vd
	LTu/8tz9wUMfaapCX6emWw3S9VWSW1XJc4xwpK6tCa+nTqs=
X-Google-Smtp-Source: AGHT+IFJVTLwzRGF1DuQP3vjPisYKxiWF+5uAzI0kdZJOWOmMPRP4sLXPJuiATG9UCHDYViYbvZ6Qg==
X-Received: by 2002:a05:6512:ad0:b0:50e:6b38:9e0b with SMTP id n16-20020a0565120ad000b0050e6b389e0bmr6715682lfu.73.1704281001941;
        Wed, 03 Jan 2024 03:23:21 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id p2-20020a056402044200b005553a8bb61dsm10309013edw.87.2024.01.03.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 03:23:21 -0800 (PST)
Date: Wed, 3 Jan 2024 14:23:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, deepakx.nagaraju@intel.com,
	joyce.ooi@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	Nagaraju DeepakX <deepakx.nagaraju@intel.com>,
	Andy Schevchenko <andriy.schevchenko@linux.intel.com>
Subject: Re: [PATCH 5/5] net: ethernet: altera: rename functions and their
 prototypes
Message-ID: <ca5c5be7-9270-412b-a868-d5e28116f983@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213071112.18242-6-deepakx.nagaraju@intel.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/deepakx-nagaraju-intel-com/net-ethernet-altera-remove-unneeded-assignments/20231213-151600
base:   net/main
patch link:    https://lore.kernel.org/r/20231213071112.18242-6-deepakx.nagaraju%40intel.com
patch subject: [PATCH 5/5] net: ethernet: altera: rename functions and their prototypes
config: m68k-randconfig-r081-20231218 (https://download.01.org/0day-ci/archive/20231220/202312200739.79WGCuyb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312200739.79WGCuyb-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/altera/altera_tse_main.c:266 alloc_init_skbufs() warn: double check that we're allocating correct size: 24 vs 164

Old smatch warnings:
drivers/net/ethernet/altera/altera_tse_main.c:271 alloc_init_skbufs() warn: double check that we're allocating correct size: 24 vs 164
drivers/net/ethernet/altera/altera_tse_main.c:988 tse_open() warn: 'priv->tx_irq' from request_irq() not released on lines: 988.

vim +266 drivers/net/ethernet/altera/altera_tse_main.c

bbd2190ce96d8f Vince Bridgers   2014-03-17  257  static int alloc_init_skbufs(struct altera_tse_private *priv)
bbd2190ce96d8f Vince Bridgers   2014-03-17  258  {
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  259  	struct altera_dma_private *dma = &priv->dma_priv;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  260  	unsigned int rx_descs = dma->rx_ring_size;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  261  	unsigned int tx_descs = dma->tx_ring_size;
bbd2190ce96d8f Vince Bridgers   2014-03-17  262  	int ret = -ENOMEM;
bbd2190ce96d8f Vince Bridgers   2014-03-17  263  	int i;
bbd2190ce96d8f Vince Bridgers   2014-03-17  264  
bbd2190ce96d8f Vince Bridgers   2014-03-17  265  	/* Create Rx ring buffer */
ad6f888f174e6a Nagaraju DeepakX 2023-12-13 @266  	dma->rx_ring = kcalloc(rx_descs, sizeof(struct altera_dma_private), GFP_KERNEL);

There is a mismatch here.  dma->rx_ring was changed to altera_dma_buffer
but the sizeof was changed to altera_dma_private.

ad6f888f174e6a Nagaraju DeepakX 2023-12-13  267  	if (!dma->rx_ring)
bbd2190ce96d8f Vince Bridgers   2014-03-17  268  		goto err_rx_ring;
bbd2190ce96d8f Vince Bridgers   2014-03-17  269  
bbd2190ce96d8f Vince Bridgers   2014-03-17  270  	/* Create Tx ring buffer */
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  271  	dma->tx_ring = kcalloc(tx_descs, sizeof(struct altera_dma_private), GFP_KERNEL);
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  272  	if (!dma->tx_ring)
bbd2190ce96d8f Vince Bridgers   2014-03-17  273  		goto err_tx_ring;
bbd2190ce96d8f Vince Bridgers   2014-03-17  274  
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  275  	dma->tx_cons = 0;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  276  	dma->tx_prod = 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  277  
bbd2190ce96d8f Vince Bridgers   2014-03-17  278  	/* Init Rx ring */
bbd2190ce96d8f Vince Bridgers   2014-03-17  279  	for (i = 0; i < rx_descs; i++) {
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  280  		ret = tse_init_rx_buffer(priv, &priv->dma_priv.rx_ring[i], dma->rx_dma_buf_sz);
bbd2190ce96d8f Vince Bridgers   2014-03-17  281  		if (ret)
bbd2190ce96d8f Vince Bridgers   2014-03-17  282  			goto err_init_rx_buffers;
bbd2190ce96d8f Vince Bridgers   2014-03-17  283  	}
bbd2190ce96d8f Vince Bridgers   2014-03-17  284  
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  285  	dma->rx_cons = 0;
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  286  	dma->rx_prod = 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  287  
bbd2190ce96d8f Vince Bridgers   2014-03-17  288  	return 0;
bbd2190ce96d8f Vince Bridgers   2014-03-17  289  err_init_rx_buffers:
bbd2190ce96d8f Vince Bridgers   2014-03-17  290  	while (--i >= 0)
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  291  		tse_free_rx_buffer(priv, &priv->dma_priv.rx_ring[i]);
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  292  	kfree(dma->tx_ring);
bbd2190ce96d8f Vince Bridgers   2014-03-17  293  err_tx_ring:
ad6f888f174e6a Nagaraju DeepakX 2023-12-13  294  	kfree(dma->rx_ring);
bbd2190ce96d8f Vince Bridgers   2014-03-17  295  err_rx_ring:
bbd2190ce96d8f Vince Bridgers   2014-03-17  296  	return ret;
bbd2190ce96d8f Vince Bridgers   2014-03-17  297  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

