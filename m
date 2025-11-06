Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B92EB860
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441011; cv=none; b=oZHI9tVAxY+e0k2I57a9Z8OPt+MsX5ghKcQNCB+OEM6fGwIKsW0XDU/B48JF7ldqhZfo6YabGMZz4LwSQummb4RDVMe26pz08OT8JKbBH2vnLde044u405ct9HQdhB63OfH/sxAJl6oXmyYPJZWSkQ5I/OVQA6Qj7xVFqp6KR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441011; c=relaxed/simple;
	bh=n/Bd7/snV3eURY+ywL671CnPXYMhVnja6SgaOBw9EHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNKrWARd7eIYSlp1XBskm6+gUI+P68bZBrqEiycjEhxfChUk1xyHyzBddwlTTearQaloEUD9EHy68vLgoPfkcoVCF7boXApeEIERkjwNtXO+fc5YwdGfClr2BK6uNA8eDEIh6p3RkBQYqlddbSm/vHHhzeCXmwQYmg3IQlFS3ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RyMOagCn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RyMOagCn"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so1806885a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 06 Nov 2025 06:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762441007; x=1763045807; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4cZBXfyVG+iyRMG+Gxr/rrQlxQkjiNHu4700aC64gkg=;
        b=RyMOagCnL4vfmGRnMZGsUzIxOV2RYuEEs00b3uAFoQZQiuieDyTCqHgeHaVjbVd7Q8
         rT6dt+O+8GyF8tln9wBMtU5vA1eKr4o7DC1PkvnaWwsig+Vmlh5Zvz+vgEWOysHxZe3s
         MnviYtV4KT66YQtDm2DIjH0Dt2SdtzPG9CZd8L1rhDsFQ2F6Mr7Z9RLhkLqGDfJs7Fxc
         WZ36eFw6CvCVjMMAmkgywT4HhGW+IXLjiRzf17pfbCK8pDK5TR9PTERV7vCU95t404en
         W/LQbZvRAWKovYDRz7OGMdtA4QeXVZJB7r6p+6beklLA8qH6joc+LuH9vR2DSLwjxDQf
         IcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441007; x=1763045807;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cZBXfyVG+iyRMG+Gxr/rrQlxQkjiNHu4700aC64gkg=;
        b=Nh2ORcEEmCXGrsi2gx8B8tpH1fUGQAn1koBaRkRjKPkwqi6xy54h5ulwdlcaFVwM+Y
         6xwYPVAAWImQHbgHLrkDxAvs34bYw9JGw/dnmyQAGf1UMoBDn6hALgO7NyKLU0++qUJ2
         /a5AkyUPgbZaB8GyjvY8WYepsHPvY0dLeUOvXyD1zoXk9zRmIm1/oiDRWmiG5j+cySvE
         fofdYPx5Ayw3ML5HtV1S0TwYS5gIBZi4XgFYBB8bChsK2VmDoVH1A4zaZQQGkKP1dT7h
         hSNj6mQ2ssjf9lw2YlW9uNpAf/pbZIZ4s6nn/7mpVRu43IfRa/Fx8t7bnURuR7HIiq+T
         6n0Q==
X-Gm-Message-State: AOJu0YxlGJHk+WATwHNaN5s5LHW7GBFtI6AlrTPABIc/lcRrw9rYru15
	UBtHCWz1zSXklv8LW3wc/DFL6CEQFUjIiyu8QIx9J8mAue7ew4FPVWnr58a9vJQTSyoUNrb6ZeS
	SSSAh
X-Gm-Gg: ASbGncspB2FVKblhp7W2eY+pOyExU3uWOcxSlwN4xf0yXRyHmGqBDDjhY+G35pLa5Qz
	gsoNenQ9TC7Ez35W/Ui3qoxEOGRo7/+1cUcZSQmfq6XFUP+t6MUrGX+gugxmLTe/04uR/ggX69D
	7idsj89Pf29RFjNUIc8ymwqPKfL1y5CaU9/fIcG2J3Fpkwd4lvAKcPxW1wMcO3WPEVSlYcEwEyg
	xvcOXRQ495NS0ZtQEtR+3VK2UkcIADZZtJWehq3SUA0uuNOq9ltUgwDqsaEMbuDGwD/GnV7VKhR
	FrvZw4wDD+IeLm0w3YhMq4ryfjaPPz6lTeu4H3HY+PBB66nPxxD9EyxI/5JyTrXxNtemn0HmEOy
	BnWy9HAMFS/LYbSs3KaEx607dtMkEgShCuROkhMVC9jdlc5c8x+3f779PRl2tzNgdX9MrIMzwmW
	wZMmt5/KI1yUTs
X-Google-Smtp-Source: AGHT+IGxIARIFdT8QKdjVus9pKC+4LttK7muSxiBACisce7x+5Op/S+eLKsGU6c0B1NhGDTVHdwoEg==
X-Received: by 2002:a17:906:f855:b0:b72:95ff:3996 with SMTP id a640c23a62f3a-b7295ff4f7amr213659766b.10.1762441007341;
        Thu, 06 Nov 2025 06:56:47 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728937faedsm230489666b.27.2025.11.06.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:56:46 -0800 (PST)
Date: Thu, 6 Nov 2025 17:56:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anup Patel <apatel@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [avpatel:riscv_trace_support_v2 48/58]
 drivers/hwtracing/rvtrace/rvtrace-platform.c:83 rvtrace_of_parse_outconns()
 error: we previously assumed 'pdata->outconns' could be null (see line 29)
Message-ID: <76e46318-d6ad-41a2-8c43-aa6fb6a3e1a3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v2
head:   41e2962102e2318916f87f0ed7eb297a6b3224d3
commit: 23eb544f3ac1c85fd63c43865b4429cbcfd35e63 [48/58] rvtrace: Initial implementation of driver framework
config: riscv-randconfig-r071-20251103 (https://download.01.org/0day-ci/archive/20251104/202511041509.Nqw6F4Fn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511041509.Nqw6F4Fn-lkp@intel.com/

smatch warnings:
drivers/hwtracing/rvtrace/rvtrace-platform.c:83 rvtrace_of_parse_outconns() error: we previously assumed 'pdata->outconns' could be null (see line 29)

vim +83 drivers/hwtracing/rvtrace/rvtrace-platform.c

23eb544f3ac1c8 Anup Patel 2025-07-10  15  static int rvtrace_of_parse_outconns(struct rvtrace_platform_data *pdata)
23eb544f3ac1c8 Anup Patel 2025-07-10  16  {
23eb544f3ac1c8 Anup Patel 2025-07-10  17  	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
23eb544f3ac1c8 Anup Patel 2025-07-10  18  	struct rvtrace_connection *conn;
23eb544f3ac1c8 Anup Patel 2025-07-10  19  	struct of_endpoint ep, rep;
23eb544f3ac1c8 Anup Patel 2025-07-10  20  	int ret = 0, i = 0;
23eb544f3ac1c8 Anup Patel 2025-07-10  21  
23eb544f3ac1c8 Anup Patel 2025-07-10  22  	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
23eb544f3ac1c8 Anup Patel 2025-07-10  23  	if (!parent)
23eb544f3ac1c8 Anup Patel 2025-07-10  24  		return 0;
23eb544f3ac1c8 Anup Patel 2025-07-10  25  
23eb544f3ac1c8 Anup Patel 2025-07-10  26  	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
23eb544f3ac1c8 Anup Patel 2025-07-10  27  	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
23eb544f3ac1c8 Anup Patel 2025-07-10  28  				       sizeof(*pdata->outconns), GFP_KERNEL);
23eb544f3ac1c8 Anup Patel 2025-07-10 @29  	if (!pdata->outconns) {
23eb544f3ac1c8 Anup Patel 2025-07-10  30  		ret = -ENOMEM;
23eb544f3ac1c8 Anup Patel 2025-07-10  31  		goto done;

->outcons is NULL.  ret is -ENOMEME

23eb544f3ac1c8 Anup Patel 2025-07-10  32  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  33  
23eb544f3ac1c8 Anup Patel 2025-07-10  34  	for_each_endpoint_of_node(parent, ep_node) {
23eb544f3ac1c8 Anup Patel 2025-07-10  35  		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
23eb544f3ac1c8 Anup Patel 2025-07-10  36  		if (!conn) {
23eb544f3ac1c8 Anup Patel 2025-07-10  37  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  38  			ret = -ENOMEM;
23eb544f3ac1c8 Anup Patel 2025-07-10  39  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  40  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  41  
23eb544f3ac1c8 Anup Patel 2025-07-10  42  		ret = of_graph_parse_endpoint(ep_node, &ep);
23eb544f3ac1c8 Anup Patel 2025-07-10  43  		if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  44  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  45  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  46  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  47  
23eb544f3ac1c8 Anup Patel 2025-07-10  48  		rep_node = of_graph_get_remote_endpoint(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  49  		if (!rep_node) {
23eb544f3ac1c8 Anup Patel 2025-07-10  50  			ret = -ENODEV;
23eb544f3ac1c8 Anup Patel 2025-07-10  51  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  52  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  53  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  54  		rdev_node = of_graph_get_port_parent(rep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  55  
23eb544f3ac1c8 Anup Patel 2025-07-10  56  		ret = of_graph_parse_endpoint(rep_node, &rep);
23eb544f3ac1c8 Anup Patel 2025-07-10  57  		if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  58  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  59  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  60  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  61  
23eb544f3ac1c8 Anup Patel 2025-07-10  62  		conn->src_port = ep.port;
23eb544f3ac1c8 Anup Patel 2025-07-10  63  		conn->src_fwnode = dev_fwnode(pdata->dev);
23eb544f3ac1c8 Anup Patel 2025-07-10  64  		/* The 'src_comp' is set by rvtrace_register_component() */
23eb544f3ac1c8 Anup Patel 2025-07-10  65  		conn->src_comp = NULL;
23eb544f3ac1c8 Anup Patel 2025-07-10  66  		conn->dest_port = rep.port;
23eb544f3ac1c8 Anup Patel 2025-07-10  67  		conn->dest_fwnode = of_fwnode_handle(rdev_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  68  		fwnode_handle_get(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  69  		conn->dest_comp = rvtrace_find_by_fwnode(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  70  		if (!conn->dest_comp) {
23eb544f3ac1c8 Anup Patel 2025-07-10  71  			ret = -EPROBE_DEFER;
23eb544f3ac1c8 Anup Patel 2025-07-10  72  			of_node_put(ep_node);
23eb544f3ac1c8 Anup Patel 2025-07-10  73  			break;
23eb544f3ac1c8 Anup Patel 2025-07-10  74  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  75  
23eb544f3ac1c8 Anup Patel 2025-07-10  76  		pdata->outconns[i] = conn;
23eb544f3ac1c8 Anup Patel 2025-07-10  77  		i++;
23eb544f3ac1c8 Anup Patel 2025-07-10  78  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  79  
23eb544f3ac1c8 Anup Patel 2025-07-10  80  done:
23eb544f3ac1c8 Anup Patel 2025-07-10  81  	if (ret) {
23eb544f3ac1c8 Anup Patel 2025-07-10  82  		for (i = 0; i < pdata->nr_outconns; i++) {
23eb544f3ac1c8 Anup Patel 2025-07-10 @83  			conn = pdata->outconns[i];
                                                                       ^^^^^^^^^^^^^^^^^^
NULL dereference

23eb544f3ac1c8 Anup Patel 2025-07-10  84  			if (conn && conn->dest_fwnode)
23eb544f3ac1c8 Anup Patel 2025-07-10  85  				fwnode_handle_put(conn->dest_fwnode);
23eb544f3ac1c8 Anup Patel 2025-07-10  86  		}
23eb544f3ac1c8 Anup Patel 2025-07-10  87  	}
23eb544f3ac1c8 Anup Patel 2025-07-10  88  	of_node_put(parent);
23eb544f3ac1c8 Anup Patel 2025-07-10  89  	return ret;
23eb544f3ac1c8 Anup Patel 2025-07-10  90  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

