Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBEC156886;
	Mon,  6 Jan 2025 15:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177959; cv=none; b=KBiT4VnOV1AwTDKVV4Yl3bVj0ds18MvBWKYUBfJQ6cQieqhewzZE86l4GnlQfRNmRN1iG7PQi/cvpEzoXi/qegbtNz7on/mOpU8eERxDJWtscC50czWur0at5ERgb8nh84S0JUNht/tKKWajh8pp7Ok/aCR7GipY3BQc6K/xPZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177959; c=relaxed/simple;
	bh=6FTeL7J9W/8v/MFftWkYANi3oEghJQhAORIbcFv+bpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2Nv2E7yWpldRjAHZ9iKVSz0AEN1C90fVYUIqM4MQyJJl/fDdHiGaOlGB1Pb8jo4ghTk3I00qUDIUnN7H+QZ+k1fsSzZxYol5NsyTj0zKkB8gcdnBoPH8F0bcgALVmVCxEdUG7fN/k8s7TIzQlLm6ZdcEo5LLM4ovMzUzI27rU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=domJMjmE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="domJMjmE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3e9f60bf4so26056423a12.3;
        Mon, 06 Jan 2025 07:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177956; x=1736782756; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjInjQ8EYFWqvY7RVufEqpVSTgGfiOzA1xoY/iPL4eM=;
        b=domJMjmEsItMLkEY/YMtv52I+UtD9TWCRZLyvY7C2vHnX6Wf3SGOvfcKWxlKZLzMgY
         R8Q50WL8vJ66tR92x5xn65fWzqTFRjmY6dZX1fwxT5/pirdbHm7y1Vh+uBkMT13uCGse
         yjoBsATdARUW5QgQ5Alc3euVl6aevaolMlcfQMGm6GbcJMmuM9yqGiMF56Ip195cYz1O
         EteDESrGsqw2J+WUzJWwuvRF2CGy124cfAK0bJQM2NR7ZxP/9TC/hjwMPMqX+ESxc0Sm
         jJfjONil47d5Cge0x5KAlnaQHhzzLFEnxphdaAdz5Va0fG0dPeWXSw6xPI0K9wzm9zIh
         CChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177956; x=1736782756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjInjQ8EYFWqvY7RVufEqpVSTgGfiOzA1xoY/iPL4eM=;
        b=lKYRFeujm48IX/jiHbzgr5h3AWjUsU3Nya8SsR+gpDnA1xfiq/nBkBgBYKQXL+gBIw
         0LrRk84sEEAoEnPJadYLh97ew9iJXInQ28emTM4yT9HBzs2RwfBmpNdaFZ55plG/8ta4
         0e6W+qc9B+5b76zYNIgg1xYQb7/ZYVtRsTCLe3n7oTWY7Xlj7CkMVkUQe2US1mmeGypV
         0poItYJCr5Spy9ppDGqw+8sM0cKgPJO+hFHQxAJKXmAWe4k0tJlShPFpZ3QGl02WRCzO
         EEQEFiWrbHcxCldP/prnneTShDj+4nzKbGfa5EavVt572T0L4C/4QFQXnebsR1oJSuES
         JEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl7setoc9tuWdafbXB2aqyMLbhivo+atPx1Mth0ZNbKMmetBgn+Y3rf6uAM54kPFyzZcHdOYnY9M6eV6kN@lists.linux.dev
X-Gm-Message-State: AOJu0YyyBH7KDKO5ZQsi/G0VJjZmdDakfjvtA3dbL62EjfUEVxtiK7U5
	XCggYvqtoZCPhFT5XLGDFeDWx3Fsg7+1jMUU25KZgJNvwudeksxTepI5EFj6QYiovbeSGMqVdHe
	D5RhWxy6YyXDUkNTLRXy6iSJBDDU=
X-Gm-Gg: ASbGncsKxMvLF8EUoHv9qOO7MNCAiRnOqlAlUmf77+OBgmWqTXJ9TsUq55ztPPAmUzz
	VewgrJstH2Vn52oRD4YStgyZHeCpyIoJlGeIqMg==
X-Google-Smtp-Source: AGHT+IEGN1GdG+i3TIHVGvpAsiqTdVpoXIFMSYU+j0qxRCJAVqb+OjpdIo8gZVE36TK6MxTksPlnEo2hd8k6w5btTAA=
X-Received: by 2002:a50:cc04:0:b0:5d8:a46f:110b with SMTP id
 4fb4d7f45d1cf-5d8a46f1123mr28655123a12.17.1736177955405; Mon, 06 Jan 2025
 07:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <dc020ef3-e48a-42cb-aa4c-81d46ebac338@stanley.mountain>
In-Reply-To: <dc020ef3-e48a-42cb-aa4c-81d46ebac338@stanley.mountain>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 6 Jan 2025 21:08:44 +0530
Message-ID: <CANAwSgRzexcPSwJxORxG9FSuCXCeKHSCa90brmG0bX-jD9DoZQ@mail.gmail.com>
Subject: Re: [pci:controller/rockchip 1/3] drivers/pci/controller/pcie-rockchip.c:134
 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Mon, 6 Jan 2025 at 17:09, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/rockchip
> head:   8261bf695c47b98a2d8f63e04e2fc2e4a8c6b12b
> commit: fa0ce454cd4ee35703d4126c5b8e4a9a398cf198 [1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
> config: arm64-randconfig-r073-20250102 (https://download.01.org/0day-ci/archive/20250104/202501040409.SUV09R80-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/
>
> smatch warnings:
> drivers/pci/controller/pcie-rockchip.c:134 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'
>
> vim +/dev_err_probe +134 drivers/pci/controller/pcie-rockchip.c
>
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  115     rockchip->aclk_rst = devm_reset_control_get_exclusive(dev, "aclk");
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  116     if (IS_ERR(rockchip->aclk_rst)) {
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  117             if (PTR_ERR(rockchip->aclk_rst) != -EPROBE_DEFER)
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  118                     dev_err(dev, "missing aclk reset property in node\n");
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  119             return PTR_ERR(rockchip->aclk_rst);
> e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  120     }
> e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  121
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  122     if (rockchip->is_rc)
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  123             rockchip->perst_gpio = devm_gpiod_get_optional(dev, "ep",
> 840b7a5edf88fe drivers/pci/controller/pcie-rockchip.c Manivannan Sadhasivam 2024-04-16  124                                                            GPIOD_OUT_LOW);
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  125     else
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  126             rockchip->perst_gpio = devm_gpiod_get_optional(dev, "reset",
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  127                                                            GPIOD_IN);
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  128     if (IS_ERR(rockchip->perst_gpio))
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  129             return dev_err_probe(dev, PTR_ERR(rockchip->perst_gpio),
> a7137cbf6bd53a drivers/pci/controller/pcie-rockchip.c Damien Le Moal        2024-10-17  130                                  "failed to get PERST# GPIO\n");
> e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  131
> fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  132     rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
> fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02  133     if (rockchip->num_clks < 0)
> fa0ce454cd4ee3 drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-12-02 @134             return dev_err_probe(dev, err, "failed to get clocks\n");
>
>
> "err" is zero.  It should be "rockchip->num_clks".
>
> 4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  135
> 964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  136     return 0;
> 4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  137  }
>
Thanks for the report I have submitted this fix for this.

[0] https://lore.kernel.org/linux-pci/20250106153041.55267-1-linux.amoon@gmail.com/

Thanks
-Anand

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
