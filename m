Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652411E04A8
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728494383; cv=none; b=n79palEzT9F/FnhFBQLTUlsCHNQcRV7GFPkGM/nLmh7MG7klI4J54BAwINjH+sPbsIPAVjZeS/UliU2VDGQaNYpaxk68rOvWmj+Tklq309cbGgdvEUQQYPQmfENI2p4MPUXCKX/qJ6uy8RLP5/UtiAkKoBq3EZlI+XG2MKsTxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728494383; c=relaxed/simple;
	bh=D1RCBvolVwGk1YmkaU7qNRk2q+gp97D7sSRe7bDMJQU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DLaOJgWGaMbwWPQ/FRgI2bdCPEwvcqBdnHrN5ZgH5y598PAw9uXudDo6fusfDf4skAF0yESCpiKniql7yt51HgrLPZF8S055mVuhe1BX1BmMn77eaiv6ScmPeYjAybz6q5vFzKGXoDfvnqLBABl0EDh1s60wppj2YZfsQNoLvn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b4oOP7wp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b4oOP7wp"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d372c18acso4186f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728494379; x=1729099179; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afIn8IMjC7kf2X5Y3tpOFzs6699YGBAZhINwB+OZxK4=;
        b=b4oOP7wpuQniUsq9SX2dH5Bk2ke+xXwfodOuQK6Mk7h2dL4BZp/KMafptOLm+dvksX
         7O2KOl4aEj8D4Y7uCBZr0GEbpDhWpuZgKxzsAJOJ58rnhCofidbi9NjhvpzPbE+GZTpF
         84fcQ3Zyy5XJHShvEdnp7MJ44o7wNCnL81K8Lljk72RojijRoLOJU78STz+eq9RObK/u
         EUlb8YCdBaJO+0zKzeWC1tPfzxeyBYYEKKluP3PKYql94cKjlcmU5YoY3x2GTDH8mFP5
         Ppar3upjw5Wnu1xOUVzBykjW4f0f/tQTAASPPc8YuoFGN1na7woUD/RdcBkkFge9xoiE
         iJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728494379; x=1729099179;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afIn8IMjC7kf2X5Y3tpOFzs6699YGBAZhINwB+OZxK4=;
        b=gz6o0ryJ+dVxeXXnEmpYvAC21QJy8wjJ0JNR/d0U6PmVGOZ48wTVwc5NGPDIKJLBos
         ECAKih56lokvHWmnLXaaA8+LwyEf3Iq7I8trNgkpbFMbVEJ7CMdvhr/YiuUJ12qeDFCK
         z+vZZZAeCKLov5Iv+3OhYEFgOonFxoX/6S6fiUVvTWr4V3+8eNbdwOaezsoEDbimEJUx
         IvfJ3+6zlITzxhzV34xEEM6WTlf4XG4weTPs7TJaPpRvPd4I5pnuWaPY9dtjN9KTxtQj
         Y1gUfYIoYFWFnvKxBkuHl/ApyQwxhsZs1dwQLU8iPqJceofS/Chh4MtW2BXphwK3jaKk
         Es1w==
X-Gm-Message-State: AOJu0YzNbviYq68DR+ulTw8KDxARWHISxSZMS0Wdp0nmdC52GVwv+lAS
	DUkTTeFbJWrDkbN1jjT3YzdjHHPX8AQ5FzluAfI3LCXCBvUDiaIpt4b81AFXEnnjmZUMQ9luzSf
	n
X-Google-Smtp-Source: AGHT+IESN+5zvgJDcQvJ5AH0Ne9NxWaWaYKKtugic6yzuEwVsthJkTHx5JeUb7jgicH67N+SNJp8CA==
X-Received: by 2002:adf:a2d0:0:b0:374:c977:363 with SMTP id ffacd0b85a97d-37d3a9efa92mr2050350f8f.24.1728494379512;
        Wed, 09 Oct 2024 10:19:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f767sm10882855f8f.20.2024.10.09.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 10:19:39 -0700 (PDT)
Date: Wed, 9 Oct 2024 20:19:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anand Moon <linux.amoon@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v6 RESET 1/3] PCI: rockchip: Simplify clock handling by
 using clk_bulk*() function
Message-ID: <614d3e0e-10ba-4c13-a309-1e4305b5951a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241006182445.3713-2-linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/PCI-rockchip-Simplify-clock-handling-by-using-clk_bulk-function/20241007-022714
base:   8f602276d3902642fdc3429b548d73c745446601
patch link:    https://lore.kernel.org/r/20241006182445.3713-2-linux.amoon%40gmail.com
patch subject: [PATCH v6 RESET 1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
config: loongarch-randconfig-r071-20241009 (https://download.01.org/0day-ci/archive/20241010/202410100015.9W01OqrR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410100015.9W01OqrR-lkp@intel.com/

smatch warnings:
drivers/pci/controller/pcie-rockchip.c:132 rockchip_pcie_parse_dt() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +132 drivers/pci/controller/pcie-rockchip.c

964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  122  	if (rockchip->is_rc) {
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  123  		rockchip->ep_gpio = devm_gpiod_get_optional(dev, "ep",
840b7a5edf88fe drivers/pci/controller/pcie-rockchip.c Manivannan Sadhasivam 2024-04-16  124  							    GPIOD_OUT_LOW);
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  125  		if (IS_ERR(rockchip->ep_gpio))
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  126  			return dev_err_probe(dev, PTR_ERR(rockchip->ep_gpio),
58adbfb3ebec46 drivers/pci/controller/pcie-rockchip.c Chen-Yu Tsai          2021-01-22  127  					     "failed to get ep GPIO\n");
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  128  	}
e77f847df54c6b drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-09-03  129  
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06  130  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06  131  	if (rockchip->num_clks < 0)
9a8ff91a0ee96b drivers/pci/controller/pcie-rockchip.c Anand Moon            2024-10-06 @132  		return dev_err_probe(dev, err, "failed to get clocks\n");
                                                                                                                                  ^^^
Was intended to be rockchip->num_clks.

4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  133  
964bac9455bee7 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2018-05-09  134  	return 0;
4816c4c7b82b55 drivers/pci/host/pcie-rockchip.c       Shawn Lin             2016-12-07  135  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

