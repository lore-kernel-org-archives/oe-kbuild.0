Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6004810A0A
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Dec 2023 05:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivj2H81U"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so509431f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 06 Dec 2023 21:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701926898; x=1702531698; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/w8d4bx85GCzG3q+XMNSr3H2oW0ZXJ+JkTmbFE6i40=;
        b=ivj2H81UTERGbpOy0FPdjm/pE+am0+kxu8UnRy6x3XbhLRj/AEFod50RV31HtDDDTG
         +Nl8OaJbk13uTebS4d3ELlc/0vzWBtUiP5xrDONnzobLBXNY2zdUasmKaF6idTAw9e1o
         XOzc9mq52YtvlXMkH38LV8X3I/ulvjCKcqE7qfRuMBNTCAvQRxCu3FOwySouQcFmvb0b
         WVPQiZAJLx3XVe+WKwRtK3Hm523aVWacm2AC0QmrRno6lXMDT931GXF+ghh6IweScsUP
         qqBWcErIG8BRSpQ45LUh8BeAlbPBO7lcctp9PgMHlfljhPL8eNLlqPdflS75PxTi0Mvh
         9utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701926898; x=1702531698;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/w8d4bx85GCzG3q+XMNSr3H2oW0ZXJ+JkTmbFE6i40=;
        b=haIZp6/vbbVfny9Ssc3dbIAqRp93TTrWbaMqoU3U3AvUuVuLUl1r0P1i+z7bqu4SOk
         CE3F1BP814EfBnk0xmEKOGGEjR9F7GPkWf2+ac6djFp4gDR2mYMLVRlwe7GbgPKQDoyD
         igne15yS6n9fh9b+uvDJbhmrwAvu5LjAOIMUZ1FNC9mZmsuDaLFdavn4ODz5528qRGBB
         a980WeuuW+X9NgEZD0fGifKvzgJtL0MncFnxA+R/XlzKFdXYZFgOE4DLKdrc+4Hux7Ml
         VduwJ5gdZSj8bWNa8WpGVEpj+N+pfAn8elUT50FZEm5ZydWcXjcaEZz6j5hoE3PMtvP8
         dXfw==
X-Gm-Message-State: AOJu0Yyx8tRM7jIRMKAGl3VWCJv6+LeNnucOOHm66Zvgk4bY2Y88tKDO
	Zm6E6MTxY0dfuYXqiGJY3HeefiNxGQx+jgmzOc0=
X-Google-Smtp-Source: AGHT+IE21IJuS8tBsselAAGayu4ujjz1P+t5qXxU0Ss8ACQiY5yyBYE/DI31YW+Ox7NMislqtWHqQA==
X-Received: by 2002:adf:a355:0:b0:333:2fd2:7665 with SMTP id d21-20020adfa355000000b003332fd27665mr518094wrb.86.1701926898494;
        Wed, 06 Dec 2023 21:28:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i15-20020adfe48f000000b0033344e2522dsm453279wrm.37.2023.12.06.21.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:28:18 -0800 (PST)
Date: Thu, 7 Dec 2023 08:28:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jeff LaBundy <jeff@labundy.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com, bartp@baasheep.co.uk,
	hannah.rossiter@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
Message-ID: <6f8e3b64-5b21-4a50-8680-063ef7a93bdb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204140505.2838916-4-kamel.bouhara@bootlin.com>

Hi Kamel,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kamel-Bouhara/dt-bindings-vendor-prefixes-Add-TouchNetix-AS/20231204-222017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231204140505.2838916-4-kamel.bouhara%40bootlin.com
patch subject: [PATCH v4 3/3] Input: Add TouchNetix axiom i2c touchscreen driver
config: i386-randconfig-r071-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312070608.vxtNAYhk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312070608.vxtNAYhk-lkp@intel.com/

smatch warnings:
drivers/input/touchscreen/touchnetix_axiom.c:565 axiom_i2c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +565 drivers/input/touchscreen/touchnetix_axiom.c

a9f3450f06a026 Kamel Bouhara 2023-12-04  536  static int axiom_i2c_probe(struct i2c_client *client)
a9f3450f06a026 Kamel Bouhara 2023-12-04  537  {
a9f3450f06a026 Kamel Bouhara 2023-12-04  538  	struct device *dev = &client->dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  539  	struct input_dev *input_dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  540  	struct axiom_data *ts;
a9f3450f06a026 Kamel Bouhara 2023-12-04  541  	u32 startup_delay_ms;
a9f3450f06a026 Kamel Bouhara 2023-12-04  542  	u32 poll_interval;
a9f3450f06a026 Kamel Bouhara 2023-12-04  543  	int target;
a9f3450f06a026 Kamel Bouhara 2023-12-04  544  	int error;
a9f3450f06a026 Kamel Bouhara 2023-12-04  545  
a9f3450f06a026 Kamel Bouhara 2023-12-04  546  	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
a9f3450f06a026 Kamel Bouhara 2023-12-04  547  	if (!ts)
a9f3450f06a026 Kamel Bouhara 2023-12-04  548  		return -ENOMEM;
a9f3450f06a026 Kamel Bouhara 2023-12-04  549  
a9f3450f06a026 Kamel Bouhara 2023-12-04  550  	ts->client = client;
a9f3450f06a026 Kamel Bouhara 2023-12-04  551  	i2c_set_clientdata(client, ts);
a9f3450f06a026 Kamel Bouhara 2023-12-04  552  	ts->dev = dev;
a9f3450f06a026 Kamel Bouhara 2023-12-04  553  
a9f3450f06a026 Kamel Bouhara 2023-12-04  554  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
a9f3450f06a026 Kamel Bouhara 2023-12-04  555  	if (IS_ERR(ts->reset_gpio))
a9f3450f06a026 Kamel Bouhara 2023-12-04  556  		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get reset GPIO\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  557  
a9f3450f06a026 Kamel Bouhara 2023-12-04  558  	if (ts->reset_gpio)
a9f3450f06a026 Kamel Bouhara 2023-12-04  559  		axiom_reset(ts->reset_gpio);
a9f3450f06a026 Kamel Bouhara 2023-12-04  560  
a9f3450f06a026 Kamel Bouhara 2023-12-04  561  	ts->vddi = devm_regulator_get_optional(dev, "VDDI");
a9f3450f06a026 Kamel Bouhara 2023-12-04  562  	if (!IS_ERR(ts->vddi)) {
a9f3450f06a026 Kamel Bouhara 2023-12-04  563  		error = regulator_enable(ts->vddi);
a9f3450f06a026 Kamel Bouhara 2023-12-04  564  		if (error)
a9f3450f06a026 Kamel Bouhara 2023-12-04 @565  			return dev_err_probe(&client->dev, PTR_ERR(ts->vddi),
                                                                                                   ^^^^^^^^^^^^^^^^^^
s/PTR_ERR(ts->vddi)/error/

a9f3450f06a026 Kamel Bouhara 2023-12-04  566  					     "Failed to enable VDDI regulator\n");
a9f3450f06a026 Kamel Bouhara 2023-12-04  567  	}
a9f3450f06a026 Kamel Bouhara 2023-12-04  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

