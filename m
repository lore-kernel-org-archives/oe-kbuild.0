Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C4E149009
	for <oe-kbuild@lists.linux.dev>; Fri, 31 May 2024 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144254; cv=none; b=gunt+6ORAZnVqRqQ4DgN4PFcC/pRrFsvAI/c5fFpVS9PW+OoPm8pVJEnXc+CUILiUd1FUXu0g0avwTPCPTDj6Y8kEwlx/327wdGXNThvsNi3x2My6AawzI9U/V5IBrrmuvQfiDBbGeczrPFFm2LoTzA6R1Nro6ne+RSA4NfaDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144254; c=relaxed/simple;
	bh=Rra0CvxMAFO9EmhtueRO5C26ghHhcxpMPOIyK1JqdgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lim0f1MyYvjPAH9Sc54IcI3ZIt5GQbuGxJqTgHa7SDMDgcubHcMuexmx7VHEE9tRxzBYkiRlli91DogrKHDs1U+7WbuLcr6dJq3KtzTI6Skr+MnvAaZq8br63jew6zfZIi6N/gK29vXg0dTfoVBXwUUEzUlr1eF8286Y+TJbpBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OocSEBMr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OocSEBMr"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a688ebb75b9so3794666b.3
        for <oe-kbuild@lists.linux.dev>; Fri, 31 May 2024 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717144251; x=1717749051; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQhQKXpXtOiuTo/rl0QBli/a7iaMP8bEwDCa183WM/8=;
        b=OocSEBMrd/bg3hAG/8d2jXE5WWGhIpk4CtylNprWZUwsVs/c1gmuT64VjC+5be/4N7
         5jcbTxWSOZrCaa9hxaEeCOTvJQZtnr0Gxsr9jaFGSoqDoYlYCHUw8JZ7kpMkLguf3YyN
         kDWO/AYr22yG6eYFdNIygWsQPIUoT3FAsnVWHP9Yz9Do3znOK1i1HdS/+l4BQgMbq68k
         1KhX5CotV42HEW0vvjlJjzv20sVxaJlw3YCppT8dOhZcTeLGOJiDIbgecQAzOf9cs/Z0
         rHKCQGjCArwTfSvGRRzRGcVd9VOh/C+aw8RBD13nZMMdctYS9PGZdRvlBW53KFBqOBIM
         93Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717144251; x=1717749051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQhQKXpXtOiuTo/rl0QBli/a7iaMP8bEwDCa183WM/8=;
        b=P8/ApMAPpR6Fmxp6g9c3LA8joPZePwL84xYUA4nH64oH+FqfGe8+s6XesoMVEDDEr8
         8rW7ke4wEl7SRMhmXCXzTCXGB/opNaerEww9aVpH3BvIS8XsqN0gFwmMztmIy8oQiigQ
         VBGNIcX9VqRasUirZ1uisEx3Jx6Fd5Bgoakr/5V1zOwGv0EfzvLn8/V8dROEjNXBtoZs
         Y9KAZVDzFqvKPJJBbHJYcw+BmRD7TaaT4rb5RUgT5prIQnXDgxbMF3qySl5K2U7CJosd
         Tm3QvcMdXEaDz/K10SPk4mwhssCv6sWjhQrke4KMkgm+sdx/EDu6KbSdm2C1CaCd7RvU
         TAUQ==
X-Gm-Message-State: AOJu0YwNDwZOg1zIoYDdoUfxXRdZr4WAQX10RpPBaARe9I22NqOJSgkG
	tWLJubjFPvILfvyOkTWGSKVrddMPJXV8SlKkyg6PPh1NRp9+LZP54jS7rX5z5ov5RYghHXO/jRF
	w7rPZlg==
X-Google-Smtp-Source: AGHT+IFtZxB5rMJqeki2YYdPq+U0CW1C4dQ4RYP6jCff6tgt2zJj+VbGriWib9GkFbtwxN24rpBBMA==
X-Received: by 2002:a17:906:2e8a:b0:a68:8940:10d8 with SMTP id a640c23a62f3a-a68894014e5mr34386866b.17.1717144251081;
        Fri, 31 May 2024 01:30:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e6f03b50sm62661366b.28.2024.05.31.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:30:50 -0700 (PDT)
Date: Fri, 31 May 2024 11:30:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sunil V L <sunilvl@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 48/54]
 drivers/irqchip/irq-riscv-aplic-direct.c:202
 aplic_direct_parse_parent_hwirq() error: uninitialized symbol 'rc'.
Message-ID: <7aef19fa-99a8-4b51-b4c3-bcbd20d62e23@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   0dea64cc13417fc07df1d97a05904896f59fb329
commit: 9e014be7064b9ad2b121d1970cb8f27ec009f960 [48/54] irqchip/riscv-aplic: Add ACPI support
config: riscv-randconfig-r071-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310518.PSoGXyNv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405310518.PSoGXyNv-lkp@intel.com/

smatch warnings:
drivers/irqchip/irq-riscv-aplic-direct.c:202 aplic_direct_parse_parent_hwirq() error: uninitialized symbol 'rc'.

vim +/rc +202 drivers/irqchip/irq-riscv-aplic-direct.c

2333df5ae51ead Anup Patel 2024-03-07  192  static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
9e014be7064b9a Sunil V L  2024-04-07  193  					   u32 *parent_hwirq, unsigned long *parent_hartid,
9e014be7064b9a Sunil V L  2024-04-07  194  					   struct aplic_priv *priv)
2333df5ae51ead Anup Patel 2024-03-07  195  {
2333df5ae51ead Anup Patel 2024-03-07  196  	struct of_phandle_args parent;
9e014be7064b9a Sunil V L  2024-04-07  197  	unsigned long hartid;
2333df5ae51ead Anup Patel 2024-03-07  198  	int rc;
2333df5ae51ead Anup Patel 2024-03-07  199  
9e014be7064b9a Sunil V L  2024-04-07  200  	if (!is_of_node(dev->fwnode)) {
9e014be7064b9a Sunil V L  2024-04-07  201  		hartid = acpi_get_ext_intc_parent_hartid(priv->id, index);
9e014be7064b9a Sunil V L  2024-04-07 @202  		if (rc)

if (hartid < 0)?

9e014be7064b9a Sunil V L  2024-04-07  203  			return rc;
9e014be7064b9a Sunil V L  2024-04-07  204  
9e014be7064b9a Sunil V L  2024-04-07  205  		*parent_hartid = hartid;
9e014be7064b9a Sunil V L  2024-04-07  206  		*parent_hwirq = RV_IRQ_EXT;
9e014be7064b9a Sunil V L  2024-04-07  207  		return 0;
9e014be7064b9a Sunil V L  2024-04-07  208  	}
2333df5ae51ead Anup Patel 2024-03-07  209  
2333df5ae51ead Anup Patel 2024-03-07  210  	rc = of_irq_parse_one(to_of_node(dev->fwnode), index, &parent);
2333df5ae51ead Anup Patel 2024-03-07  211  	if (rc)
2333df5ae51ead Anup Patel 2024-03-07  212  		return rc;
2333df5ae51ead Anup Patel 2024-03-07  213  
2333df5ae51ead Anup Patel 2024-03-07  214  	rc = riscv_of_parent_hartid(parent.np, parent_hartid);
2333df5ae51ead Anup Patel 2024-03-07  215  	if (rc)
2333df5ae51ead Anup Patel 2024-03-07  216  		return rc;
2333df5ae51ead Anup Patel 2024-03-07  217  
2333df5ae51ead Anup Patel 2024-03-07  218  	*parent_hwirq = parent.args[0];
2333df5ae51ead Anup Patel 2024-03-07  219  	return 0;
2333df5ae51ead Anup Patel 2024-03-07  220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

