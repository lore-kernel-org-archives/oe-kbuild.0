Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C81DFDE
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 16:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwFeY/3/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso15553945e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700497105; x=1701101905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s2521BguFPahNtQVt5gNlkIeY96EJfle3B8C9Si+c40=;
        b=QwFeY/3/65T1ha+a5I0mf+3vmwc/qNsx6Den/UvSIfpA0V4Fi+s4/vBlKv+EoU3Yfz
         5GQ2YWtN5DXbhG00a/WdDJjj3JT4lm5v6xM/LPtPKscYXGb324zTVCbnLrTtE6sfKU41
         9pPsJ4FFlCqNZHBwDVl8/Z9lawdxNy9ss0m1cxT4W+xYPSm/cXD8IyBguUHE9psejA1/
         NEFyoswSeW/R3cvjBBuVNx/pDHeEg2hfprnVZcpkmyV67CBrLBMIkHuMki3djv42YPqR
         VTVOz2YrewL1gpvlcwKwkcn4H66ig+4Qb9Fm2Mdl8lOp5f3vWzvM7t+ARUmgAFg01UEm
         jvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497105; x=1701101905;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2521BguFPahNtQVt5gNlkIeY96EJfle3B8C9Si+c40=;
        b=K6ezL5KzMZXrxw7pqLUYxGUYK235pYscCsyHSir9inL5oJr8ExAkZvieXagI1bRh46
         Ft6ivIbRzt7hjFER/1/vc7+Cu90VvChis716j3ZItQ8CSZJh3YfF78v8jKvAvSraxun1
         b2i7MAWwRKVCVQcRCZJzDnly1nQ1teyHFVE85/bHtnPSqqu0AV/QRC/N3O11QXm76S+0
         0N7S5c51weusGgj+Xe4kBZ17rmoz7+3xYhfwgtY9j0UcowmcvZtPccTzvUKjXAIqop2G
         /IvRdf9lwWsJZFfqjd10iWIYiyLyER3Pt5gXq8vb9l0GsjTngx/hGtqXoHAwzDDrU82n
         ZsRg==
X-Gm-Message-State: AOJu0Yzdk85lKBzbxJqdqYD/dROs7lDaU8LwDStxMQlXQxwT9G30YSqD
	8sLyWDgKiQICQVnrI5inxPmvGS4Hmntm4NalDK8=
X-Google-Smtp-Source: AGHT+IHAsnwJrZVQ1CLosctT8NZ/oMBKh372TupzsBQCbJOFIiiLfuJ04UvThrOcL0L28mcMcWZTsg==
X-Received: by 2002:a05:600c:3b9d:b0:40a:6235:e82d with SMTP id n29-20020a05600c3b9d00b0040a6235e82dmr5088555wms.15.1700497105146;
        Mon, 20 Nov 2023 08:18:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c230100b003fefb94ccc9sm13665281wmo.11.2023.11.20.08.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:18:24 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 11:18:21 -0500
To: oe-kbuild@lists.linux.dev, James Tai <james.tai@realtek.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] irqchip: Introduce RTD1319 support using the
 Realtek common interrupt controller driver
Message-ID: <a045008a-5a97-4903-b5e4-a761f7e4c20a@suswa.mountain>
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
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201929.2FpvMRlg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201929.2FpvMRlg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311201929.2FpvMRlg-lkp@intel.com/

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
40e5ff4eaef72b James Tai 2023-11-18  182  		return -ENOMEM;

This loop just returns -ENOMEM.  Missing if statement?
No clean up either.  Needs to release resources before returning.

40e5ff4eaef72b James Tai 2023-11-18  183  	}
40e5ff4eaef72b James Tai 2023-11-18  184  
40e5ff4eaef72b James Tai 2023-11-18  185  	platform_set_drvdata(pdev, data);
40e5ff4eaef72b James Tai 2023-11-18  186  
40e5ff4eaef72b James Tai 2023-11-18 @187  	return 0;
40e5ff4eaef72b James Tai 2023-11-18  188  }
40e5ff4eaef72b James Tai 2023-11-18  189  EXPORT_SYMBOL(realtek_intc_probe);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

