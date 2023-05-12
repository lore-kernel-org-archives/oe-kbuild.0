Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8091AA2A;
	Fri, 12 May 2023 05:49:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f11d267d8bso10659628e87.2;
        Thu, 11 May 2023 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683870594; x=1686462594;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dR0nPo0wLXJGUhsmXk+iF/iV8x3IujL7+cKIQfngnOU=;
        b=i0sxN/sx8ja2FZljN9NZ10+XdTRyx7TVXS3XfBfK+T5XnYeoQATiWpyzGVwwQoV7Rh
         ou2JuvRLHczboNQzh7ytXb/iJhLsDOqiXOAg5Eg3KTiD6TsfZe7Qsb6auRw9iEt9aHPb
         qXrKwLRV5Q6GiY6YnueJ9qDNFSkEiWmntCsj3ztOHJhDlF880ld+kbZHJ3H6CSJ7WjUb
         qKcnsRjk7I9k18xWhdJQL6+LY+jJ/u7woDjRPnb3ibZY9Ksdmlox5qB1k7X3crDmo12r
         ZLY+kB4j+Sva8WpyGOt4xYL9sWdgYZJUjj09kRcfvU0F52vgYlhs8aBfO//0HWw8j3Ic
         Mdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683870594; x=1686462594;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dR0nPo0wLXJGUhsmXk+iF/iV8x3IujL7+cKIQfngnOU=;
        b=k43pqDho7gmnGJnEnbjjQG5dF9JQd/YaSCWv34ncBC6PSIzOGjxrw84sutBcgwsAea
         Fb3XlBbC21XvHMLIotUJc1yVfw5cRi/wA8xJl3st05eguftfjTqx/KoE/NQk73sUQvIZ
         cL9sacNA4HmgafIMEb6vUlSu4U0lgYXxyWyRGJYtcww5OP5xYFwUTfHglDjlvGEBa3+V
         5i9vzWUUk7m66oroczEwqc9/hG0Sk6iLk4X3BYXOopY29RD+IdRBK8sFBlLlKiHnPRGr
         7w92PAHEeO0Mmg/lncL54D36k3xLpUoryRNU0dYkclV7KVlHlY3Sbhofw+LlcKq5ky/S
         aeIA==
X-Gm-Message-State: AC+VfDwQJGxmZEyDcBBxrRJfW5yqV7zsFJRMxqMFgSpz1/NJDbWpbZIb
	3m2kAJeAigJzj53fPImn5jY=
X-Google-Smtp-Source: ACHHUZ43V0as7o8VwI49xZcuvNvWFSSEekkE+KpkYu8hWeWT0AjKq8aHqvDUeYmVV0l16OsvGj3u1A==
X-Received: by 2002:ac2:5d6e:0:b0:4d6:d0a0:8313 with SMTP id h14-20020ac25d6e000000b004d6d0a08313mr3178160lft.10.1683870594149;
        Thu, 11 May 2023 22:49:54 -0700 (PDT)
Received: from [192.168.1.126] (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id z10-20020a19f70a000000b004f00189e1dcsm1344831lfe.117.2023.05.11.22.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 22:49:53 -0700 (PDT)
Message-ID: <f4ed65a9-4d7f-0b76-1b04-b0c85fabd8cd@gmail.com>
Date: Fri, 12 May 2023 08:49:52 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US, en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <46296e39-dbc1-4f27-b89c-af6f08d9f318@kili.mountain>
 <a1ad0e10-23d2-a860-e9a1-2680313d643f@gmail.com>
 <f5f669fc-ebb4-46df-8957-84c714481ace@kili.mountain>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: drivers/iio/accel/kionix-kx022a.c:1053 kx022a_probe_internal()
 warn: passing zero to 'dev_err_probe'
In-Reply-To: <f5f669fc-ebb4-46df-8957-84c714481ace@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/23 08:41, Dan Carpenter wrote:
> On Fri, May 12, 2023 at 08:16:02AM +0300, Matti Vaittinen wrote:
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1046  	irq = fwnode_irq_get_byname(fwnode, "INT1");
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1047  	if (irq > 0) {
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1048  		data->inc_reg = KX022A_REG_INC1;
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1049  		data->ien_reg = KX022A_REG_INC4;
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1050  	} else {
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1051  		irq = fwnode_irq_get_byname(fwnode, "INT2");
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24  1052  		if (irq <= 0)
>>>                                                                       ^^^^^^^^
>>> This code assumes fwnode_irq_get_byname() can return zero.
>>>
>>> 7c1d1677b3227c Matti Vaittinen 2022-10-24 @1053  			return dev_err_probe(dev, irq, "No suitable IRQ\n");
>>>
>>> But fortunately, it can't otherwise this would return success.
>>>
>>
>> Ouch. Actually, the fwnode_irq_get_byname() can return zero on device-tree
>> mapping error. I did actually send a patch to address this some time ago:
>> https://lore.kernel.org/lkml/cover.1666710197.git.mazziesaccount@gmail.com/
>>
> 
> Ah.  I just went by the documentation instead of looking at the code.
> 
> Originally a bunch of irq functions return NO_IRQ on error which was a
> design mistake...  irq_of_parse_and_map() still returns zero on error
> instead of negative error codes.  I wrote a check for that yesterday.
> 
> drivers/gpu/drm/msm/dsi/dsi_host.c:1949 msm_dsi_host_init() warn: irq_of_parse_and_map() returns zero on failure
> drivers/dma/ti/edma.c:2405 edma_probe() warn: irq_of_parse_and_map() returns zero on failure
> drivers/dma/ti/edma.c:2421 edma_probe() warn: irq_of_parse_and_map() returns zero on failure
> drivers/net/ethernet/xilinx/ll_temac_main.c:1570 temac_probe() warn: irq_of_parse_and_map() returns zero on failure
> drivers/net/ethernet/xilinx/ll_temac_main.c:1573 temac_probe() warn: irq_of_parse_and_map() returns zero on failure
> drivers/ata/sata_mv.c:4094 mv_platform_probe() warn: irq_of_parse_and_map() returns zero on failure
> 
> It would be good if we could apply your patch, otherwise I could create
> an explicit check for fwnode_irq_get_byname() returns.

I guess I can re-spin the series. Let's see if there is some good 
suggestion(s) on how to fix the i2c-smbus.

> Ideally, everything would just return negative error codes on error.

I definitely agree.


Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

