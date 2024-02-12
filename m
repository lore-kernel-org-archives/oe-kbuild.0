Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17E17483
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707725870; cv=none; b=gacnSr2M2gS4rsT0SQOmRBAbaU9Y3cMV/mxTYRIVh3IEvb88bvKhOX/dwVM29dj14akFqwsb4u6w+unZsTbgOsmWaYhwC+sGkS2NzhuPE8uIxjegstkJPoGMG0HfOEshAAR+hVGHk0noAkasVLwp0HWg6+Vzh0r+qW3unI9Ol2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707725870; c=relaxed/simple;
	bh=tOIPNw4dNbIPeVbG3nByvllBJfybEKyRu13UE5L0Cd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=p6JDBQCRAd3sE+RN5ovQ/O+XGsNcPSGcpIuC+vHgwOBC/7tQrOm5fwuihry0IauatfeJ12MXHQNIgGwRe9/0IVPtLB9rdcUaLr9npiiqAoEGD6rQyjdyrFQ6jF+wPRbdSqihB/KmYM+G6fLBaziwZYW1hqwoE0BXxk88RXlWuQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqFMaDc9; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqFMaDc9"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso3675135a12.0
        for <oe-kbuild@lists.linux.dev>; Mon, 12 Feb 2024 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707725866; x=1708330666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IgRlFVad8LwIhP5jpZKETMsb6daw55MtLMHfKSOgg7c=;
        b=aqFMaDc9yqdp5kuXdc+shxVgI7z32vxE6hpaX9Ar8JH4ssqD3k8fMToWIudGEpNmuo
         kzAcHCtw2l1ohu/u2rR7THjIZBqlACM0Qt562CUUHJjjl5hK/3lcRTy6jAUMP+oAoFL5
         CnDu4ZWu759X9aAcVoxTQAxvG7NaLV48gvm0RLIZjO+lhlPKgp1SlCjVVZgbSWAainqZ
         0FY/jPN6hH/SVLEnarA5Q4PupUbIZN16DwUbfdeyofuqZFLmyhGWkc1qJkKcBBXaDdNR
         32VJ4hN8Gj0yemj5r3PJAtTcJ5Qq92GI4rs/nXNYDWiY1tVCprGwFs7x42UO/cFNXpL0
         KJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707725866; x=1708330666;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgRlFVad8LwIhP5jpZKETMsb6daw55MtLMHfKSOgg7c=;
        b=NW1TEit0mKceJu8c9oG35YHrX1n1duY+PBcZTV5fP9NJ6nJ2PEncxeaeQh+W17gzfb
         c/MCF6NvS5UU/z3h3aAK09Vzzm6ghfztwjwiJspUZXMut5rduBPCj4rpCqr4GXkIlHVr
         lXnuuX0gyJHOYrRLSgY7z0GkWdYxp4dFpTHcNNCP6lvoVq1tlsR2DbjW44tMFuPodnDh
         /dwyQGqgyK7yTynis7p7qupEAkCueTT86FppfwVezNd2oft2iMd7p9lmM9bIUcQzU+F5
         3sBWvkDTkKqHi3a+berHr3SRcxcFnH5zrRI16PtCS6ocToOVWpe2/OxHLxJHdP9PEXf8
         lm0g==
X-Gm-Message-State: AOJu0Yw1D7uYJ9wOXz/85vlBRlbgkyi3k5tWzIi2ezW8Di2ta9eSQxwi
	GC6UV7DQUp7RU0ubj7s7ZqcbPQQHkKzBS25oV/LBKZmqaAdr91fapVfj+tn0r4wjm7XUAMgUtQ6
	m
X-Google-Smtp-Source: AGHT+IFhzNR3hgdBD/mnCMKuG1BgHLbkCR5vTiQsXZ5H3Eb0NydIX8xbWHz53/LNTiM3sGYggui9Ew==
X-Received: by 2002:aa7:c71a:0:b0:560:ea74:a679 with SMTP id i26-20020aa7c71a000000b00560ea74a679mr3582158edq.5.1707725866330;
        Mon, 12 Feb 2024 00:17:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+bdymo+XkURNN2y3EbZ/jsCpvOyKu/b7kSnFBkbqgd7diDwNr5qp9P5vNBX2LMK4ZJxeBPVMy6jadExOWHhSaEMNXh03eSHvJCDXk+sIfrWkaodtMXIVcNSnJ6JlqUUkbXSeb8pYt1PWjqBuK7OLWdjD76SiFm9cRxF2f
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b6-20020aa7c906000000b00560ba66587csm2462955edt.13.2024.02.12.00.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 00:17:46 -0800 (PST)
Date: Mon, 12 Feb 2024 11:17:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Eric Woudstra <ericwouds@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha
 EN8811H PHY driver
Message-ID: <20977ba9-0cdd-4f5d-a203-64b01af2acfb@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206194751.1901802-3-ericwouds@gmail.com>

Hi Eric,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Woudstra/dt-bindings-net-airoha-en8811h-Add-en8811h-serdes-polarity/20240207-035021
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240206194751.1901802-3-ericwouds%40gmail.com
patch subject: [PATCH net-next 2/2] net: phy: air_en8811h: Add the Airoha EN8811H PHY driver
config: sh-randconfig-r081-20240211 (https://download.01.org/0day-ci/archive/20240211/202402110805.r1KRiKtL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402110805.r1KRiKtL-lkp@intel.com/

smatch warnings:
drivers/net/phy/air_en8811h.c:560 air_led_hw_control_set() error: testing array offset 'index' after use.

vim +/index +560 drivers/net/phy/air_en8811h.c

3fe47bc0b949e7 Eric Woudstra 2024-02-06  551  static int air_led_hw_control_set(struct phy_device *phydev, u8 index,
3fe47bc0b949e7 Eric Woudstra 2024-02-06  552  				  unsigned long rules)
3fe47bc0b949e7 Eric Woudstra 2024-02-06  553  {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  554  	struct en8811h_priv *priv = phydev->priv;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  555  	u16 on = 0, blink = 0;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  556  	int ret;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  557  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  558  	priv->led[index].rules = rules;
                                                         ^^^^^^
out of bounds

3fe47bc0b949e7 Eric Woudstra 2024-02-06  559  
3fe47bc0b949e7 Eric Woudstra 2024-02-06 @560  	if (index >= EN8811H_LED_COUNT)
                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^

Too late.  priv->led[] has EN8811H_LED_COUNT elements.

3fe47bc0b949e7 Eric Woudstra 2024-02-06  561  		return -EINVAL;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  562  
3fe47bc0b949e7 Eric Woudstra 2024-02-06  563  	if (rules & (BIT(TRIGGER_NETDEV_LINK_10)   | BIT(TRIGGER_NETDEV_LINK))) {
3fe47bc0b949e7 Eric Woudstra 2024-02-06  564  		on |= AIR_PHY_LED_ON_LINK10;
3fe47bc0b949e7 Eric Woudstra 2024-02-06  565  		if (rules & BIT(TRIGGER_NETDEV_RX))
3fe47bc0b949e7 Eric Woudstra 2024-02-06  566  			blink |= AIR_PHY_LED_BLINK_10RX;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

