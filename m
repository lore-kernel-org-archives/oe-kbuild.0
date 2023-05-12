Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EED3ED6
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 05:41:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3063208beedso9029034f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 22:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683870074; x=1686462074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRLM54m4oNof2pLRboZuVsUjfYt5aZs+58w3qZaftDY=;
        b=kFDBkoGue96E/tX+H3qVJQxr7ukww/c4REfNOx2RBujhBTRXlOAWnKt7r5cgdmU1JB
         aLbCxazsL0mhKGxbhhvjS8IfqoH3LM/EowWfU8d7xMWLq0aoJEm7bB1cCjf9PNdn7ouS
         kSpIZd/d+Yltor7bIu1hKBwJ9yBiI2s8iaqDDV2gpJ/7aQxO8XfZsjmQbt6Yn0gvnxeC
         62syf98HY8bSC9t8PPyWPDuc1G+8QULNXUhMeESQNcVLjnhIrHnUwdl50P9usyctng/r
         zPG9OvzLbkPciHHy6ze9sycFdfYz1cEJ8gQlQPbthO0M99+wnRpxxtJx3hfrfgeaGGV3
         rS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683870074; x=1686462074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRLM54m4oNof2pLRboZuVsUjfYt5aZs+58w3qZaftDY=;
        b=St0p98vSXzsrLc5lGztdFRl8PENTOwADy2Lhsz+qzm2rll7m7aqzLJ41FQtVsQr+I8
         ILuvU58J6A/s8J3I7qitodYsE1OwNh2FL5awA8bGCkLgowI9p4A9/QNQrboXFRzLC4yc
         YQLc/zfCStheKxS0+dTnhSqdnyCT4C+FA6aaInvyARZfZBVX50H+13XZbUaw8DOboWa+
         yfSTCdkZpz0SR5aF1vf8Lm+UkzWQHqhRmGZQfHQCFUCC/YliWQdoA0ByKcolBrofj2dE
         Lp/irUCDfphHZZy0boc0aETWZBOiZBNWXyxS/sda/Kux8mYILQ0V1s0Y68nXgJl1bm17
         YVqg==
X-Gm-Message-State: AC+VfDzNHT4iROqTYBf5ZvKQfsgM5ByPtcuRAxMiFO41Bc+ZK3z722ZX
	U0nxHphDzAMvzHzPG4xDkYFOkQ==
X-Google-Smtp-Source: ACHHUZ6seLDwpj4RolVQYyb0o1iErqMDr1kmvf6fp+MtcMehIqrlZQ8vKDd63c9pWnSxB6RtD1MWgA==
X-Received: by 2002:adf:cd0e:0:b0:304:6a26:1f6 with SMTP id w14-20020adfcd0e000000b003046a2601f6mr17996620wrm.59.1683870074239;
        Thu, 11 May 2023 22:41:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020adfebc3000000b00307c0afc030sm5251841wrn.4.2023.05.11.22.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 22:41:12 -0700 (PDT)
Date: Fri, 12 May 2023 08:41:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal()
 warn: passing zero to 'dev_err_probe'
Message-ID: <f5f669fc-ebb4-46df-8957-84c714481ace@kili.mountain>
References: <46296e39-dbc1-4f27-b89c-af6f08d9f318@kili.mountain>
 <a1ad0e10-23d2-a860-e9a1-2680313d643f@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1ad0e10-23d2-a860-e9a1-2680313d643f@gmail.com>

On Fri, May 12, 2023 at 08:16:02AM +0300, Matti Vaittinen wrote:
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1046  	irq = fwnode_irq_get_byname(fwnode, "INT1");
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1047  	if (irq > 0) {
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1048  		data->inc_reg = KX022A_REG_INC1;
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1049  		data->ien_reg = KX022A_REG_INC4;
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1050  	} else {
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1051  		irq = fwnode_irq_get_byname(fwnode, "INT2");
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24  1052  		if (irq <= 0)
> >                                                                      ^^^^^^^^
> > This code assumes fwnode_irq_get_byname() can return zero.
> > 
> > 7c1d1677b3227c Matti Vaittinen 2022-10-24 @1053  			return dev_err_probe(dev, irq, "No suitable IRQ\n");
> > 
> > But fortunately, it can't otherwise this would return success.
> > 
> 
> Ouch. Actually, the fwnode_irq_get_byname() can return zero on device-tree
> mapping error. I did actually send a patch to address this some time ago:
> https://lore.kernel.org/lkml/cover.1666710197.git.mazziesaccount@gmail.com/
> 

Ah.  I just went by the documentation instead of looking at the code.

Originally a bunch of irq functions return NO_IRQ on error which was a
design mistake...  irq_of_parse_and_map() still returns zero on error
instead of negative error codes.  I wrote a check for that yesterday.

drivers/gpu/drm/msm/dsi/dsi_host.c:1949 msm_dsi_host_init() warn: irq_of_parse_and_map() returns zero on failure
drivers/dma/ti/edma.c:2405 edma_probe() warn: irq_of_parse_and_map() returns zero on failure
drivers/dma/ti/edma.c:2421 edma_probe() warn: irq_of_parse_and_map() returns zero on failure
drivers/net/ethernet/xilinx/ll_temac_main.c:1570 temac_probe() warn: irq_of_parse_and_map() returns zero on failure
drivers/net/ethernet/xilinx/ll_temac_main.c:1573 temac_probe() warn: irq_of_parse_and_map() returns zero on failure
drivers/ata/sata_mv.c:4094 mv_platform_probe() warn: irq_of_parse_and_map() returns zero on failure

It would be good if we could apply your patch, otherwise I could create
an explicit check for fwnode_irq_get_byname() returns.

Ideally, everything would just return negative error codes on error.
It's harder to change irq_of_parse_and_map() because it doesn't return a
mix of errors and zero, but just zero.  We would have to rename it to
something else, otherwise backports would get messed up.

regards,
dan carpenter
