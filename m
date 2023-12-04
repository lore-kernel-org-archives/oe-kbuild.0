Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5404B1873
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nXVSFdMe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40838915cecso41417715e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 21:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701666033; x=1702270833; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ru/NPj09V1ASiEGDCszqcY2Rb4Q+L/jQQ4h1Ot3L8XU=;
        b=nXVSFdMea6ZqPVd6tSigFQq4FcBvsYaiZeJ5X0YqRcLrwEELRdmF4sYMzVMfoOQOo6
         HPqxB9y5GWYGd16X8l6rXPtQa2Dygd5toCGp5nJ1k38sk96Gh/zZpXLhUgcqT/9knid9
         5zuyQKWFP3HlcBEaLChNCiJ4bm5Ue1uq1D63NOSpNax0OnS7hIzDxhMosM8OE+4vBpRE
         3DKQwH2ZqXb4oe/0SCEHwIMNp3QmaGAgrzOWN6sO4X87xRIR1oMmBjaqTDXr5DoV45U4
         HH3K6KM4tKOMBnvNnpr7i3vT0eU6ATK5BBfNyYpdmKje7ISlAh0Y+5WomNDjGsis8oQa
         hzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701666033; x=1702270833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ru/NPj09V1ASiEGDCszqcY2Rb4Q+L/jQQ4h1Ot3L8XU=;
        b=k0Zjkb/CfCNGckzqB3S9UYEjrns7K6gRfO6v6ZwwdFf35T77M+VPqJkHQeG2zPdmpa
         fqXGMITZOnOQrVv/hqifjUN0b3AuacGnR0S+RWezmJtbmCIaHSokV5mviQ3DB2SdQkVN
         EryRETpttdUP9q8eiXX2YSHpugj5qZcWqNVgDYxcl+Pu2sdydnya+P8q+/rJI6ss/lmE
         6KeMvnu/LV9MviV2wvbAF3zMaR0qsURHvsnOWszLxuDGVSiauPq1u+SWhO+m1XQR5myq
         ZFvPwclcMf69eRBWNwtjpA0Il9M2ODEcm0ITiW9FwgZ0LAHH7tLsUKpQvENI4MWWAYnY
         JFnQ==
X-Gm-Message-State: AOJu0YwTVg9nDKmfrVauazh8ydn2ess5z6EvI5E/iTBcGxxrxyZswZmI
	jzMLzBNE78KfB7qTqKxVP/dF0zfhr+uJC6z+xU0=
X-Google-Smtp-Source: AGHT+IEkXJrUkXJJogule3Vldy+8qcSDhRA/unZzuiLtfHzdZ3i9H6s6WVRZBg9D6M0qgUEnPEOnng==
X-Received: by 2002:a7b:ce8b:0:b0:40b:5e59:daa3 with SMTP id q11-20020a7bce8b000000b0040b5e59daa3mr1958418wmj.182.1701666033441;
        Sun, 03 Dec 2023 21:00:33 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c510f00b004064cd71aa8sm12143279wms.34.2023.12.03.21.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 21:00:32 -0800 (PST)
Date: Mon, 4 Dec 2023 08:00:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/2] serial: core: implement support for rs485-mux-gpios
Message-ID: <bb7376cd-27b9-4585-9c98-140a29808b0f@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120151056.148450-3-linux@rasmusvillemoes.dk>

Hi Rasmus,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rasmus-Villemoes/dt-bindings-serial-rs485-add-rs485-mux-gpios-binding/20231120-231551
base:   v6.7-rc2
patch link:    https://lore.kernel.org/r/20231120151056.148450-3-linux%40rasmusvillemoes.dk
patch subject: [PATCH 2/2] serial: core: implement support for rs485-mux-gpios
config: hexagon-randconfig-r071-20231121 (https://download.01.org/0day-ci/archive/20231203/202312031811.pmLZJIf5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031811.pmLZJIf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312031811.pmLZJIf5-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/serial_core.c:3651 uart_get_rs485_mode() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/tty/serial/serial_core.c:2996 iomem_base_show() warn: argument 3 to %lX specifier is cast from pointer

vim +/PTR_ERR +3651 drivers/tty/serial/serial_core.c

7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3641  	dflags = (rs485conf->flags & SER_RS485_RX_DURING_TX) ?
163f080eb717d2 Christoph Niedermaier 2022-12-02  3642  		 GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3643  	desc = devm_gpiod_get_optional(dev, "rs485-rx-during-tx", dflags);
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3644  	if (IS_ERR(desc))
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3645  		return dev_err_probe(dev, PTR_ERR(desc), "Cannot get rs485-rx-during-tx-gpios\n");
7cda0b9eb6eb9e Andy Shevchenko       2023-10-03  3646  	port->rs485_rx_during_tx_gpio = desc;
163f080eb717d2 Christoph Niedermaier 2022-12-02  3647  
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3648  	dflags = (rs485conf->flags & SER_RS485_ENABLED) ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3649  	desc = devm_gpiod_get_optional(dev, "rs485-mux", dflags);
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3650  	if (IS_ERR(desc))
da0ccd117da1e4 Rasmus Villemoes      2023-11-20 @3651  		return dev_err_probe(dev, PTR_ERR(port->rs485_mux_gpio),
                                                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
s/port->rs485_mux_gpio/desc/

da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3652  				     "Cannot get rs485-mux-gpios\n");
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3653  	port->rs485_mux_gpio = desc;
da0ccd117da1e4 Rasmus Villemoes      2023-11-20  3654  
c150c0f362c1e5 Lukas Wunner          2020-05-12  3655  	return 0;
ef838a81dd4de1 Uwe Kleine-König      2017-09-13  3656  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

