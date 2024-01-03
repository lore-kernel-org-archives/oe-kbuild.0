Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0284418640
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiIt7Dv9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2814fa68eeso154553266b.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 01:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704275138; x=1704879938; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XFro0zDE33nuxg1ml/0DMiVoso4Wj1BQrGtGR63iVA=;
        b=IiIt7Dv92t+FglOpvt01lI1FxsX437nlEu93ihbn+UUiZ+FSbBMX46eK8Ktrn5EMYT
         DrM3xhphLdiqHGLqoqvOQ1PiYZRCGU/PMtjXzxbCgkiZl8l7sZnqBCk3y8COljB2uqcs
         UwNHjDJsYcxHdxrCJjOgaT0oKZKNehZwFpr8cKcfIDEDWAgWGIeskYvs13SjxsRZadQB
         3xXJd6Mo+3seQARtiVm0SD+bNyOKlSGnDRy6c2WJ/2wrXvrnBRf8+eIu0+Ybo7TWDcex
         tr55jEOJRbsFeuAaO6J0FHdcW35LyVGUXOlH7UA4MHgO9hVZuVe7YymnLkdBm6WUrFS6
         mFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704275138; x=1704879938;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1XFro0zDE33nuxg1ml/0DMiVoso4Wj1BQrGtGR63iVA=;
        b=CGFZezpfXNv3kzsviz+mllq3G37vst3gYCrGH0S2q3mckSVZAAn9aTnuKhNI/rNDJ7
         gaQgPnp9zoyyd0Kugkm93QG5axMjrKKDT+OWaZXNoYNXnVoX6CvhFu7J/6KAGu36ZQNT
         n2Rk2knTY6yIj4nihQ+4Qo3VV485a6vlmTNY36wr/Uk7dvZZMIrevvZMl9+c0Uo2YjPX
         hFvzdxtJZK2vg9z7BsPfenWKr/OVunz8KUL8BzJPooxPJx8n+J+Hc33RF6soXy3tEYFf
         RgZt8wq7AIp6MC14XzwOj5WWXBTNeZDMgGygTsEiDks6keNy0NiC4zJ9/twyg3UpXYpX
         4XCQ==
X-Gm-Message-State: AOJu0YyO/VLiNgIjJ5GT7q1s/xAUacfVLRKbbjVwtBiRFjekzowmwnci
	Nc28TKvHEoIhCQpK5xF8UEX1wYs1tToRdenJZofok6oTBm4=
X-Google-Smtp-Source: AGHT+IEJZtiOe8S7Hm02u5QiHa9HqT4SSVlifY1Jy9f4gxVxzrACTb8d6jybuGtZDZaFQiT2nUhP4Q==
X-Received: by 2002:a17:907:984:b0:a27:af7:bba5 with SMTP id bf4-20020a170907098400b00a270af7bba5mr8336282ejc.22.1704275138083;
        Wed, 03 Jan 2024 01:45:38 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t15-20020a170906178f00b00a28acfac149sm56045eje.53.2024.01.03.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 01:45:37 -0800 (PST)
Date: Wed, 3 Jan 2024 12:45:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, James Tai <james.tai@realtek.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] irqchip: Introduce RTD1319 support using the
 Realtek common interrupt controller driver
Message-ID: <edcbb1d9-ba72-496c-90c5-57948efe23f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117162709.1096585-4-james.tai@realtek.com>

Hi James,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Tai/dt-bindings-interrupt-controller-Add-support-for-Realtek-DHC-SoCs/20231118-003036
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20231117162709.1096585-4-james.tai%40realtek.com
patch subject: [PATCH v2 3/6] irqchip: Introduce RTD1319 support using the Realtek common interrupt controller driver
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231217/202312172011.8iKGuYB9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312172011.8iKGuYB9-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-realtek-intc-common.c:179 realtek_intc_probe() warn: ignoring unreachable code.
drivers/irqchip/irq-realtek-intc-common.c:187 realtek_intc_probe() warn: 'data->base' from of_iomap() not released on lines: 176,182.

vim +179 drivers/irqchip/irq-realtek-intc-common.c

40e5ff4eaef72b James Tai 2023-11-18  155  int realtek_intc_probe(struct platform_device *pdev, const struct realtek_intc_info *info)
40e5ff4eaef72b James Tai 2023-11-18  156  {
40e5ff4eaef72b James Tai 2023-11-18  157  	struct realtek_intc_data *data;
40e5ff4eaef72b James Tai 2023-11-18  158  	struct device *dev = &pdev->dev;
40e5ff4eaef72b James Tai 2023-11-18  159  	struct device_node *node = dev->of_node;
40e5ff4eaef72b James Tai 2023-11-18  160  	int ret, i;
40e5ff4eaef72b James Tai 2023-11-18  161  
40e5ff4eaef72b James Tai 2023-11-18  162  	data = devm_kzalloc(dev, struct_size(data, subset_data, info->cfg_num), GFP_KERNEL);
40e5ff4eaef72b James Tai 2023-11-18  163  	if (!data)
40e5ff4eaef72b James Tai 2023-11-18  164  		return -ENOMEM;
40e5ff4eaef72b James Tai 2023-11-18  165  
40e5ff4eaef72b James Tai 2023-11-18  166  	data->base = of_iomap(node, 0);
40e5ff4eaef72b James Tai 2023-11-18  167  	if (!data->base)
40e5ff4eaef72b James Tai 2023-11-18  168  		return -ENOMEM;
40e5ff4eaef72b James Tai 2023-11-18  169  
40e5ff4eaef72b James Tai 2023-11-18  170  	data->info = info;
40e5ff4eaef72b James Tai 2023-11-18  171  
40e5ff4eaef72b James Tai 2023-11-18  172  	raw_spin_lock_init(&data->lock);
40e5ff4eaef72b James Tai 2023-11-18  173  
40e5ff4eaef72b James Tai 2023-11-18  174  	data->domain = irq_domain_add_linear(node, 32, &realtek_intc_domain_ops, data);
40e5ff4eaef72b James Tai 2023-11-18  175  	if (!data->domain)
40e5ff4eaef72b James Tai 2023-11-18  176  		return -ENOMEM;
40e5ff4eaef72b James Tai 2023-11-18  177  
40e5ff4eaef72b James Tai 2023-11-18  178  	data->subset_data_num = info->cfg_num;
40e5ff4eaef72b James Tai 2023-11-18 @179  	for (i = 0; i < info->cfg_num; i++) {
40e5ff4eaef72b James Tai 2023-11-18  180  		ret = realtek_intc_subset(node, data, i);
40e5ff4eaef72b James Tai 2023-11-18  181  		WARN(ret, "failed to init subset %d: %d", i, ret);

if statement missing

40e5ff4eaef72b James Tai 2023-11-18  182  		return -ENOMEM;
40e5ff4eaef72b James Tai 2023-11-18  183  	}
40e5ff4eaef72b James Tai 2023-11-18  184  
40e5ff4eaef72b James Tai 2023-11-18  185  	platform_set_drvdata(pdev, data);
40e5ff4eaef72b James Tai 2023-11-18  186  
40e5ff4eaef72b James Tai 2023-11-18 @187  	return 0;
40e5ff4eaef72b James Tai 2023-11-18  188  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

