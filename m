Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDB223D5
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D4ksdnlK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b399f0b6fso10585335e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 23:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700896225; x=1701501025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNICJpc4r6LblTrWTCdIMPSQfd/ZQpwwACbiJ1cgEKc=;
        b=D4ksdnlK+Rp25iUtFjcII4GS2Q68jVb+6jxslgsOFYTQnHrmWX6q9r/eJz3ToxxF8Y
         nbywjiYfxNLqpoyT7PTSvxL1WnMh1bQOugZtS8PMM5d05rF8xN+SzZs/pMxC7fTpZmCC
         gwbppIY2c+XFD5KVVRpmibb8ldiZ9Q7jwU579eWn34weeTgCWWUyWDYM0wWHY/jnivjX
         8FedbgR3NoWOVXCaUa5LneRBqIyMObGUtH2U4EhJpCllvSXrjJVZ5CQjRemIi3BmsXo/
         jP+vhKPZpLkBkCaMVyoU56a2McJ2LVYi0YeakxiRwSi8e1Q0rPfqZAgkQu5Z+Q/2Hwap
         mRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700896225; x=1701501025;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNICJpc4r6LblTrWTCdIMPSQfd/ZQpwwACbiJ1cgEKc=;
        b=JqauurNHdaha77DDOq9rGkMIPYTQLsdp2jh/+qxnGUKAEfXqLjnyQdTcxcrQu2NCgz
         YFH4uSW6lwMrs112ZZ7j3NDC1+XQlivXgEZqGpIbzP3xjI7nKpeyK43xLJ6nAdldvcki
         ZHRHOYJN78E3R/hUmMlZSylgMzemt2ftMFKU3b8pg4jG8GTyL+IfgAGzFoLLsh6cmyYW
         1hrSs9NlHs3n5Fkl326jxK7L84dOH1lFAHuIi2hx8xMUeB0zf6MAqYfYAo1UofWy9LFV
         RFYtEANON5P7+jUnx8EBXc6wNIGvsENUAI/yiE7bMyYvMcnafxv+7XpvXDegtPfTjwgy
         BB9g==
X-Gm-Message-State: AOJu0Yzvx3qV2CfeEFv6QxTWz92omJAHrOPHd7TjdsBG7zWO3xRXlWop
	5/PxzKT/89Lsomt91dai30DGuV0PSN1dsQAlpYA=
X-Google-Smtp-Source: AGHT+IG3aRFbV+p/718t8bopeYgOMMA73KlLymKurOaoTU365U9M+kCYVd8NEIZNVSrrMGbi5qVa1A==
X-Received: by 2002:a05:600c:4507:b0:40b:338b:5f10 with SMTP id t7-20020a05600c450700b0040b338b5f10mr4374487wmo.32.1700896225412;
        Fri, 24 Nov 2023 23:10:25 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id je19-20020a05600c1f9300b004083729fc14sm7647760wmb.20.2023.11.24.23.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:10:25 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 25 Nov 2023 10:10:22 +0300
To: oe-kbuild@lists.linux.dev,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org,
	alsi@bang-olufsen.dk, andrew@lunn.ch, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, arinc.unal@arinc9.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: Re: [net-next 2/2] net: dsa: realtek: load switch variants on demand
Message-ID: <78a4a47d-cde1-4c2c-999c-6f76b5fa9c87@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117235140.1178-3-luizluca@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Angelo-Daros-de-Luca/net-dsa-realtek-create-realtek-common/20231118-075444
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231117235140.1178-3-luizluca%40gmail.com
patch subject: [net-next 2/2] net: dsa: realtek: load switch variants on demand
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231125/202311251132.QKdGl71R-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311251132.QKdGl71R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311251132.QKdGl71R-lkp@intel.com/

smatch warnings:
drivers/net/dsa/realtek/realtek-smi.c:418 realtek_smi_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +418 drivers/net/dsa/realtek/realtek-smi.c

d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  398  static int realtek_smi_probe(struct platform_device *pdev)
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  399  {
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  400  	struct device *dev = &pdev->dev;
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  401  	struct realtek_priv *priv;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  402  	int ret;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  403  
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  404  	priv = realtek_common_probe(dev, realtek_smi_regmap_config,
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  405  				    realtek_smi_nolock_regmap_config);
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  406  	if (IS_ERR(priv))
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  407  		return PTR_ERR(priv);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  408  
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  409  	/* Fetch MDIO pins */
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  410  	priv->mdc = devm_gpiod_get_optional(dev, "mdc", GPIOD_OUT_LOW);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  411  	if (IS_ERR(priv->mdc)) {
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  412  		ret = PTR_ERR(priv->mdc);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  413  		goto err_variant_put;
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  414  	}
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  415  
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  416  	priv->mdio = devm_gpiod_get_optional(dev, "mdio", GPIOD_OUT_LOW);
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  417  	if (IS_ERR(priv->mdio)) {
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17 @418  		ret = PTR_ERR(priv->mdc);

s/mdc/mdio/.

7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  419  		goto err_variant_put;
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  420  	}
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  421  
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  422  	priv->setup_interface = realtek_smi_setup_mdio;
217d45f6e61f5d drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  423  	priv->write_reg_noack = realtek_smi_write_reg_noack;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  424  
f5f119077b1cd6 drivers/net/dsa/realtek/realtek-smi-core.c Luiz Angelo Daros de Luca 2022-01-28  425  	ret = priv->ops->detect(priv);
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  426  	if (ret) {
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  427  		dev_err(dev, "unable to detect switch\n");
7e61e799f3f92c drivers/net/dsa/realtek/realtek-smi.c      Luiz Angelo Daros de Luca 2023-11-17  428  		goto err_variant_put;
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  429  	}
d8652956cf37c5 drivers/net/dsa/realtek-smi.c              Linus Walleij             2018-07-14  430  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

