Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B0CA6F
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 11:31:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401da71b85eso23548895e9.1
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Sep 2023 04:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693913498; x=1694518298; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ucSMS6f1i4AJkmKZWAiTc8WB+F0d5XaASaMmBm7ZJv0=;
        b=HAvmlDi8Mcu51TICP2y5KZT5K9YqxHf28CGZVtROqlhBGeDfmM/bZQ9CfASP8i68J+
         6tvWsvM0f+cad694fA7mvFozqtStXcXFJoNc2IPNZmMiqVFt3n34/j09zKFiyVFeqTCw
         q/91fyLyLYIIV+6eDx6Yotfl11KxPS2rZGOie1bQkjVRu2+SSVqHQDjzW+o0MnTeKUfs
         WspLpsFcvTjud6u6YOUXRPO3NBzhjI3rK52AuVTDEUKYWmnJUyfkZFIO72aG6MdI73B7
         pkU0gresOBl9t277C6Xv1WZ4MNNnIs6e5wL9JSGDIKm+NAF1Ilaw01izYmjnytgKP1S1
         IcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693913498; x=1694518298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ucSMS6f1i4AJkmKZWAiTc8WB+F0d5XaASaMmBm7ZJv0=;
        b=cNC+l7QIsY5RopEydNAckzW8WLsc+93HPqNnpEfPck3UuV0Ue92keVyVvmJjfClIHA
         yaM+puzJoKTP5GEfFelvDSzvqiin/afu+XZM5t4Z6eT8aa11UdNO00OiEFF+VsoU/f64
         vvDGKlT0NMjE83WGP28I8nOLtETTl/Wxq7UhSBN10frx2joj2Y+W+bpqLjoRsYmEwm31
         hO6cUdk7T40aLywmTLax2qmvCgLOaEhuQN423fNrFHWHKmJSzvCM2EmpIy1Xuvt/PFqt
         JtTivAMXgWKRup/Vx3Y3mGzMDC+a6juefi6u57ygRLYEEUkK34BfuXCfer+WQdQskldl
         Qoew==
X-Gm-Message-State: AOJu0YxLphI8OVkql5Qo1Ca4cjJ73ItA89cHU9NG9WQILtELkQ1TemCh
	85WxKPod6MwWANenKfhjWCVYZTYwhCR6NUsiz+U=
X-Google-Smtp-Source: AGHT+IEpJmilH9Tppz6BKD/gVURbvbPERFqtmnEdu+ZGNvg+ETGDXFXfFdgWvlIP9ozV8luG9EA7aA==
X-Received: by 2002:a1c:4b08:0:b0:3fe:d1b9:7ea9 with SMTP id y8-20020a1c4b08000000b003fed1b97ea9mr9575348wma.36.1693913498664;
        Tue, 05 Sep 2023 04:31:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bcb89000000b003fe26244858sm19823929wmi.46.2023.09.05.04.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:31:38 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:31:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/2] pinctrl: mcp23s08: Simplify probe()
Message-ID: <2ce09856-244a-4e3f-89ff-d9439ea06af9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230902090937.32195-3-biju.das.jz@bp.renesas.com>

Hi Biju,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/pinctrl-mcp23s08-Extend-match-support-for-OF-tables/20230902-171023
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230902090937.32195-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH 2/2] pinctrl: mcp23s08: Simplify probe()
config: i386-randconfig-141-20230902 (https://download.01.org/0day-ci/archive/20230903/202309030751.GQvtrZnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309030751.GQvtrZnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309030751.GQvtrZnS-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-mcp23s08_i2c.c:33 mcp230xx_probe() error: we previously assumed 'info' could be null (see line 31)

vim +/info +33 drivers/pinctrl/pinctrl-mcp23s08_i2c.c

8bb5811129f9e4 Uwe Kleine-König 2022-11-18  19  static int mcp230xx_probe(struct i2c_client *client)
0f04a81784fe3d Andy Shevchenko  2020-04-07  20  {
b5f259f6fc5912 Biju Das         2023-09-02  21  	const struct mcp23s08_i2c_info *info;
0f04a81784fe3d Andy Shevchenko  2020-04-07  22  	struct device *dev = &client->dev;
0f04a81784fe3d Andy Shevchenko  2020-04-07  23  	struct mcp23s08 *mcp;
0f04a81784fe3d Andy Shevchenko  2020-04-07  24  	int ret;
0f04a81784fe3d Andy Shevchenko  2020-04-07  25  
0f04a81784fe3d Andy Shevchenko  2020-04-07  26  	mcp = devm_kzalloc(dev, sizeof(*mcp), GFP_KERNEL);
0f04a81784fe3d Andy Shevchenko  2020-04-07  27  	if (!mcp)
0f04a81784fe3d Andy Shevchenko  2020-04-07  28  		return -ENOMEM;
0f04a81784fe3d Andy Shevchenko  2020-04-07  29  
b5f259f6fc5912 Biju Das         2023-09-02  30  	info = i2c_get_match_data(client);
b5f259f6fc5912 Biju Das         2023-09-02 @31  	if (!info)
b5f259f6fc5912 Biju Das         2023-09-02  32  		return dev_err_probe(dev, -EINVAL, "invalid device type (%d)\n",
b5f259f6fc5912 Biju Das         2023-09-02 @33  				     info->type);
                                                                                     ^^^^^^^^^^
info is NULL.

0f04a81784fe3d Andy Shevchenko  2020-04-07  34  
b5f259f6fc5912 Biju Das         2023-09-02  35  	mcp->reg_shift = info->reg_shift;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

