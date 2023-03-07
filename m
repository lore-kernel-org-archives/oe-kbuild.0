Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D9625;
	Tue,  7 Mar 2023 07:00:51 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id cw28so48385453edb.5;
        Mon, 06 Mar 2023 23:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678172450;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OllWu/x0YS4IDyiEOBxjIGHj9Rwgxd9t7kuEaBnnn2A=;
        b=AtnN0aEcuukaA7JJL6bRVsTaKgHKxjE/WWKr51lYDTkcnJtB+wFDyZAz+Z29+VPRbZ
         mUNOgX4V9jjJkr8/dd8iyV/SH5WKB668dz94N65NOsQBJtqUbT0Dm+zN1VLYvHKqDHyN
         IBG0h/5A9i6qgJQAgMmWiQTTIQGAotlYAqpr/VEzjJmt2Hls0PSSWMVEqhlF5OJPB+EA
         T7+HVrjBo0vzh1QrPw4pGXTpp3Pz5a3AFRt/PQD86p+kVoYfKtVEtaQ2VA+DUxOjNxqI
         psjIYjoaldQ5jBu8CXgAA3SCzaCNA5LgAYvC1zne/biU6bxL3bepqPFxByVYPixL2LuF
         gbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678172450;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OllWu/x0YS4IDyiEOBxjIGHj9Rwgxd9t7kuEaBnnn2A=;
        b=izV9NkYnqy7Ajg+6G+eMdAT3a9/Y2NiZTBcPn2LOjjVVGW/jBT4Q0eo9c2cOcguLX8
         lxixUiSrW0DbOIOr0e4KAlIQ/OKL12DivyrjZNeZn686PwukpujGk0+g7c4wHJBZxdQp
         EAZq1qH8weXMY+VmF2IFORa9VsPHtfQ2KUKsTLBjCVEzgWhJ1sDvpLurFf5/LcrsMatA
         8e0KOeLadQsiNf71eogSe6cByiCcVQauNMG/zgGhrqzKSZfD9HBa4kBgI/FVV18OS2xt
         Nxuy5X9sq+P4nm+wVoYzU3ANTWed20gd1j6VWz1mbuVwPvRrMrL0Tbi6u3LOcr9yFyZq
         hpCA==
X-Gm-Message-State: AO0yUKXdUccQeUjNY/oLQzzucpOj9D4GsHidhTs6TxbRPbuiN/tuqxvr
	AAjFyFIwZVAgLv0CejDP5O+bk50R3v4=
X-Google-Smtp-Source: AK7set8eOf5f3ly9d4Y2tK0fzarAMT/WCgjUjCGgf63PPf90Dz6aNKNvWatx22KAH9xZfLlmw+ly5g==
X-Received: by 2002:a17:907:9713:b0:861:7a02:1046 with SMTP id jg19-20020a170907971300b008617a021046mr18778561ejc.37.1678172449732;
        Mon, 06 Mar 2023 23:00:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a8-20020a17090680c800b008cd1f773754sm5551939ejx.5.2023.03.06.23.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 23:00:49 -0800 (PST)
Date: Tue, 7 Mar 2023 10:00:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: drivers/clk/mediatek/clk-mtk.c:573 mtk_clk_simple_probe() error:
 uninitialized symbol 'base'.
Message-ID: <45712506-eea6-4ac9-950f-aea5bcb30e46@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: 7b6183108c8ccf0dc295f39cdf78bd8078455636 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
config: microblaze-randconfig-m031-20230305 (https://download.01.org/0day-ci/archive/20230307/202303070308.4CPgt9yI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303070308.4CPgt9yI-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mtk.c:573 mtk_clk_simple_probe() error: uninitialized symbol 'base'.

vim +/base +573 drivers/clk/mediatek/clk-mtk.c

c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  466  int mtk_clk_simple_probe(struct platform_device *pdev)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  467  {
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  468  	const struct mtk_clk_desc *mcd;
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  469  	struct clk_hw_onecell_data *clk_data;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  470  	struct device_node *node = pdev->dev.of_node;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  471  	void __iomem *base;
                                                                              ^^^^

7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  472  	int num_clks, r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  473  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  474  	mcd = of_device_get_match_data(&pdev->dev);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  475  	if (!mcd)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  476  		return -EINVAL;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  477  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  478  	/* Composite clocks needs us to pass iomem pointer */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  479  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  480  		if (!mcd->shared_io)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  481  			base = devm_platform_ioremap_resource(pdev, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  482  		else
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  483  			base = of_iomap(node, 0);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  484  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  485  		if (IS_ERR_OR_NULL(base))
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  486  			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  487  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  488  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  489  	/* Calculate how many clk_hw_onecell_data entries to allocate */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  490  	num_clks = mcd->num_clks + mcd->num_composite_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  491  	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  492  	num_clks += mcd->num_mux_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  493  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  494  	clk_data = mtk_alloc_clk_data(num_clks);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  495  	if (!clk_data)
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  496  		return -ENOMEM;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  497  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  498  	if (mcd->fixed_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  499  		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  500  						mcd->num_fixed_clks, clk_data);
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  501  		if (r)
6203815bf97eea Chun-Jie Chen              2021-09-14  502  			goto free_data;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  503  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  504  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  505  	if (mcd->factor_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  506  		r = mtk_clk_register_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  507  					     mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  508  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  509  			goto unregister_fixed_clks;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  510  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  511  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  512  	if (mcd->mux_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  513  		r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  514  					   mcd->num_mux_clks, node,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  515  					   mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  516  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  517  			goto unregister_factors;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  518  	};
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  519  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  520  	if (mcd->composite_clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  521  		/* We don't check composite_lock because it's optional */
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  522  		r = mtk_clk_register_composites(&pdev->dev,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  523  						mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  524  						mcd->num_composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  525  						base, mcd->clk_lock, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  526  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  527  			goto unregister_muxes;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  528  	}
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  529  
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  530  	if (mcd->clks) {
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  531  		r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  532  					   mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  533  		if (r)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  534  			goto unregister_composites;
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  535  	}
6203815bf97eea Chun-Jie Chen              2021-09-14  536  
609cc5e1a82394 Chen-Yu Tsai               2022-05-19  537  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  538  	if (r)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  539  		goto unregister_clks;
6203815bf97eea Chun-Jie Chen              2021-09-14  540  
2204d96b191912 Chen-Yu Tsai               2022-02-08  541  	platform_set_drvdata(pdev, clk_data);
2204d96b191912 Chen-Yu Tsai               2022-02-08  542  
b27a604a579310 Rex-BC Chen                2022-05-23  543  	if (mcd->rst_desc) {
b27a604a579310 Rex-BC Chen                2022-05-23  544  		r = mtk_register_reset_controller_with_dev(&pdev->dev,
b27a604a579310 Rex-BC Chen                2022-05-23  545  							   mcd->rst_desc);
b27a604a579310 Rex-BC Chen                2022-05-23  546  		if (r)
b27a604a579310 Rex-BC Chen                2022-05-23  547  			goto unregister_clks;
b27a604a579310 Rex-BC Chen                2022-05-23  548  	}
b27a604a579310 Rex-BC Chen                2022-05-23  549  
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  550  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  551  
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  552  unregister_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  553  	if (mcd->clks)
2d18b7e31aa804 Chen-Yu Tsai               2022-02-08  554  		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  555  unregister_composites:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  556  	if (mcd->composite_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  557  		mtk_clk_unregister_composites(mcd->composite_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  558  					      mcd->num_composite_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  559  unregister_muxes:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  560  	if (mcd->mux_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  561  		mtk_clk_unregister_muxes(mcd->mux_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  562  					 mcd->num_mux_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  563  unregister_factors:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  564  	if (mcd->factor_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  565  		mtk_clk_unregister_factors(mcd->factor_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  566  					   mcd->num_factor_clks, clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  567  unregister_fixed_clks:
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  568  	if (mcd->fixed_clks)
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  569  		mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  570  					      mcd->num_fixed_clks, clk_data);
6203815bf97eea Chun-Jie Chen              2021-09-14  571  free_data:
6203815bf97eea Chun-Jie Chen              2021-09-14  572  	mtk_free_clk_data(clk_data);
7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20 @573  	if (mcd->shared_io && base)
                                                                                      ^^^^
"base" is either valid or unitialized.

7b6183108c8ccf AngeloGioacchino Del Regno 2023-01-20  574  		iounmap(base);
6203815bf97eea Chun-Jie Chen              2021-09-14  575  	return r;
c58cd0e40ffac6 Chun-Jie Chen              2021-07-26  576  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

