Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4717323C2
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 07:31:15 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f7368126a6so2635335e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 00:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686900672; x=1689492672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cChGQIty1IYA1Z9QffYMVvMHSh58mShOrUm17pTqqNI=;
        b=Hnqv1NZbrzS+ukYzcYXuMMMP+ZRBZFVf3YQxXb4Tlf7brJWBWQm7sVrrhvN1OLIh9I
         0kTh3apJeYs3Vy6nNT8smeHvVoJYwFU8h6AMkBPxaFy+ENdufHSHq0ARmU3CYd3GpU6Y
         Rkin+bSCfVWxY6SEEVKFKMywuGWe7tI10g6qeZ1eTYWrd55c9AZq6ssldTYGYt6Sewpf
         Mp8b5fFr79R9mkFe+R5R2Dk6Kt2dS0emjI5t1p3kPozHnVtpsOTRmoTOjSV88UG4qGlC
         ZwjR8AmHcpMwPiL41td4SRE44vX2+WkSIvvS+yK82HGizoGJErq0UtnKi0qwgmRy4WSS
         u3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686900672; x=1689492672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cChGQIty1IYA1Z9QffYMVvMHSh58mShOrUm17pTqqNI=;
        b=XfpdOmPjpYvJMqyEBlKZYNXYP5zKeq/HimSjjxnw1t2qkx9ESQqpz9FNaZxpGgF1zq
         Cd0joQIFPaEZbnzpAv7GsyUpqduDsk6FxEkG9VDITC3CSxvwisj+6Fo64u9eqh/iPYus
         gXLY0a3B98rvxk+DfWOmYgIp6u8mE2/cgI7twrkilOsrVCzkwoqL95oQEsLawOnUAQ5P
         /Jk0kw1aynepTkEPBp/euXNRZuOumDLFJZoLv9ldGYBQU2A8ctqji1fmZ8kZN+sfbNOF
         Ahyd8EaQxazyDN5d4SaQAoBrs+O51++qPqPZYHbDxUiBeOXTI1ozZ4SL9jbQiAt9xou8
         FN/g==
X-Gm-Message-State: AC+VfDw7t9xItkOu0EltklVsNp5KpX5KRJwONlcRfP1OzMhk02SSM00r
	Bz6Tuwk8rqOtCXpY8LHEfKHX/I/tVAgp1Ysx7/w=
X-Google-Smtp-Source: ACHHUZ6ueAVK11qRZPvI7PGYbkXA2M6FyjGq0KOMbk585g0qQQ/KUCeiXdglAMqym7LqwQaVRcFiQQ==
X-Received: by 2002:a7b:ca4e:0:b0:3f7:e48b:9752 with SMTP id m14-20020a7bca4e000000b003f7e48b9752mr917771wml.32.1686900671912;
        Fri, 16 Jun 2023 00:31:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d22-20020a1c7316000000b003f80946116dsm1317726wmb.45.2023.06.16.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 00:31:10 -0700 (PDT)
Date: Fri, 16 Jun 2023 10:31:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zhanhao Hu <zero12113@hust.edu.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [linux-next:master 8294/10546] drivers/clk/imx/clk-imx93.c:294
 imx93_clocks_probe() error: uninitialized symbol 'base'.
Message-ID: <9c2acd81-3ad8-485d-819e-9e4201277831@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: e02ba11b457647050cb16e7cad16cec3c252fade [8294/10546] clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
config: arm-randconfig-m031-20230611 (https://download.01.org/0day-ci/archive/20230616/202306161533.4YDmL22b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306161533.4YDmL22b-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx93.c:294 imx93_clocks_probe() error: uninitialized symbol 'base'.

vim +/base +294 drivers/clk/imx/clk-imx93.c

24defbe194b650 Peng Fan       2022-02-28  258  static int imx93_clocks_probe(struct platform_device *pdev)
24defbe194b650 Peng Fan       2022-02-28  259  {
24defbe194b650 Peng Fan       2022-02-28  260  	struct device *dev = &pdev->dev;
24defbe194b650 Peng Fan       2022-02-28  261  	struct device_node *np = dev->of_node;
24defbe194b650 Peng Fan       2022-02-28  262  	const struct imx93_clk_root *root;
24defbe194b650 Peng Fan       2022-02-28  263  	const struct imx93_clk_ccgr *ccgr;
bda7b7f396f94d Peng Fan       2022-10-28  264  	void __iomem *base, *anatop_base;
24defbe194b650 Peng Fan       2022-02-28  265  	int i, ret;
24defbe194b650 Peng Fan       2022-02-28  266  
e02ba11b457647 Zhanhao Hu     2023-06-01  267  	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
24defbe194b650 Peng Fan       2022-02-28  268  					  IMX93_CLK_END), GFP_KERNEL);
24defbe194b650 Peng Fan       2022-02-28  269  	if (!clk_hw_data)
24defbe194b650 Peng Fan       2022-02-28  270  		return -ENOMEM;
24defbe194b650 Peng Fan       2022-02-28  271  
24defbe194b650 Peng Fan       2022-02-28  272  	clk_hw_data->num = IMX93_CLK_END;
24defbe194b650 Peng Fan       2022-02-28  273  	clks = clk_hw_data->hws;
24defbe194b650 Peng Fan       2022-02-28  274  
24defbe194b650 Peng Fan       2022-02-28  275  	clks[IMX93_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
8178e245fa953f Dario Binacchi 2022-11-13  276  	clks[IMX93_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
8178e245fa953f Dario Binacchi 2022-11-13  277  	clks[IMX93_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
8178e245fa953f Dario Binacchi 2022-11-13  278  	clks[IMX93_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
24defbe194b650 Peng Fan       2022-02-28  279  
24defbe194b650 Peng Fan       2022-02-28  280  	clks[IMX93_CLK_SYS_PLL_PFD0] = imx_clk_hw_fixed("sys_pll_pfd0", 1000000000);
24defbe194b650 Peng Fan       2022-02-28  281  	clks[IMX93_CLK_SYS_PLL_PFD0_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd0_div2",
24defbe194b650 Peng Fan       2022-02-28  282  								    "sys_pll_pfd0", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  283  	clks[IMX93_CLK_SYS_PLL_PFD1] = imx_clk_hw_fixed("sys_pll_pfd1", 800000000);
24defbe194b650 Peng Fan       2022-02-28  284  	clks[IMX93_CLK_SYS_PLL_PFD1_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd1_div2",
24defbe194b650 Peng Fan       2022-02-28  285  								    "sys_pll_pfd1", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  286  	clks[IMX93_CLK_SYS_PLL_PFD2] = imx_clk_hw_fixed("sys_pll_pfd2", 625000000);
24defbe194b650 Peng Fan       2022-02-28  287  	clks[IMX93_CLK_SYS_PLL_PFD2_DIV2] = imx_clk_hw_fixed_factor("sys_pll_pfd2_div2",
24defbe194b650 Peng Fan       2022-02-28  288  								    "sys_pll_pfd2", 1, 2);
24defbe194b650 Peng Fan       2022-02-28  289  
24defbe194b650 Peng Fan       2022-02-28  290  	np = of_find_compatible_node(NULL, NULL, "fsl,imx93-anatop");
e02ba11b457647 Zhanhao Hu     2023-06-01  291  	anatop_base = devm_of_iomap(dev, np, 0, NULL);
24defbe194b650 Peng Fan       2022-02-28  292  	of_node_put(np);
e02ba11b457647 Zhanhao Hu     2023-06-01  293  	if (WARN_ON(IS_ERR(anatop_base))) {
e02ba11b457647 Zhanhao Hu     2023-06-01 @294  		ret = PTR_ERR(base);

s/anatop_base/base/

e02ba11b457647 Zhanhao Hu     2023-06-01  295  		goto unregister_hws;
e02ba11b457647 Zhanhao Hu     2023-06-01  296  	}
24defbe194b650 Peng Fan       2022-02-28  297  
6b60c3ae3e98d0 Peng Fan       2023-04-03  298  	clks[IMX93_CLK_ARM_PLL] = imx_clk_fracn_gppll_integer("arm_pll", "osc_24m",
6b60c3ae3e98d0 Peng Fan       2023-04-03  299  							      anatop_base + 0x1000,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

