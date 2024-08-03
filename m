Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AB1BC44
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722714080; cv=none; b=ssZBkhpQ9K4SiJW8dq8fI/54ndz1Zn1nbQ1YL9y+U7PHOyACq/Jx0c08lfw8Xz+C2oa/uW4CJ8V+aku9pAg+kvKvi8ZZCpnnTTeaGFV4r090VBBm4laRX7qmAFtUQqIwQN41PkfmfHWCTGI/1jHUg1TZ+gD7s7VLMaPcV2ytgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722714080; c=relaxed/simple;
	bh=QPRArO0MuBSL6Ptc7Qttul93uAgP87NlNurKfzODOU8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQVlhOGbdKDB3Rw06ZmoA4UZZK+GMN5e5mK3sT8KF3z7N629Q+DguV4GG32ghlIrY69SxMudtbq/jP6iumVvCwRSbziLzpn/FzFJC3++inUWZhCz/sLQHkMtWjjmMxQuDkn7+28KqXQB2z/KJwW+PJR5jtpOB8gwAskLb/oTVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IItvZSQt; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IItvZSQt"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-70944d76a04so2134256a34.0
        for <oe-kbuild@lists.linux.dev>; Sat, 03 Aug 2024 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722714078; x=1723318878; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXi4FDi/lG1ua7pG911h3uQhY5wW6bTIlHOV/7MkZHY=;
        b=IItvZSQtH3r44P3WCKcTIL2nKCDsVrUigOgzuIddtQ5hGOXNvLZ9qMyxEiOURljeJG
         3cNqSDvvnXOqHKjhksNxSf/maMKFXa2AoJT2iEKiFc46ksUQIHyTm7zeCCGc3KwmTnZM
         zJHk4QwZ41BYZa9FoVYfzL/e4rIUrVqY/F4QRLbExpwhb/dtHCSY+DS9Vkmrp9qf5tcu
         /4n62KJNbfsYGPu0wKP7Gn01NrNHFvMRWoiOPbFoYB5U0eSZM5jUZnCki6GRYW2Qf4vd
         SeGt994/J5uPsYbhpdKmdZeV76fOOOuM2Dd52/y2aE9KxzL9gTOctbLdRKUFcB9hkqkT
         PacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722714078; x=1723318878;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXi4FDi/lG1ua7pG911h3uQhY5wW6bTIlHOV/7MkZHY=;
        b=j/fZHc3DnSP6PV/5Sm5hKAchL591pDPP9uSjb63abCdurJC/EjcIiW+p51I5mD3TZH
         qmmS5u1KyJDSTN+S5vt/oKzpejP3HYslYyxXShf4l5ti2D+umbfGbW4uoxwz97M4YHYv
         27XCox3HtLd10A9loU8eHWxT3c1OgGFGdvgqz5lQjL7ocTm8XL/mcBHjbkL59T/n7ctV
         3NnoUFK9C3+uPYm3tK93Ekq22JSjzmYcDCpc9NQQkFRIfd4lvUkpTclKp8K1v+FBP/mQ
         SjuOIyUfb5XiQE/ZN1ZJ0cLPIBfRu5J1Lu6Zo40r2we3F+/tMcOQwXjukKvwTHDSQn/Z
         M+XQ==
X-Gm-Message-State: AOJu0YwmyQ0g2sr0p4SE8vGJ8dCjE3UjpmkFmdsIIO4WdCzKPA8rzafk
	oObMJKt1VvuzIDQGm+9eC7WqaBBIHpg6OTfcOzIWxDitBwtNNUPxCMjHsbhkvhNoroEGtqevtTJ
	h
X-Google-Smtp-Source: AGHT+IHlbBi5iVPhTtzyHdf7wzm9eydZUeT0S3ljF/oaqIpQWZBEUb0XOM4K2jmDFZ8rks469IDnKQ==
X-Received: by 2002:a05:6830:6b83:b0:709:373f:fc92 with SMTP id 46e09a7af769-7096feb4f8bmr3742311a34.1.1722714077688;
        Sat, 03 Aug 2024 12:41:17 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9579:8eb1:34ef:d5d7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70a3a769072sm1585908a34.68.2024.08.03.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 12:41:17 -0700 (PDT)
Date: Sat, 3 Aug 2024 14:41:14 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:renesas-clk-for-v6.12 28/29]
 drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn:
 passing zero to 'PTR_ERR'
Message-ID: <5256b88a-63e1-4e32-9383-5fc9f9bee0d4@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk-for-v6.12
head:   42b54d52ecb7a81998592c2b40f8a963e82ed02e
commit: dd22e56217495e2d392ded86a1e11a908e424e64 [28/29] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
config: parisc-randconfig-r081-20240803 (https://download.01.org/0day-ci/archive/20240803/202408032025.ve2JMaoV-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408032025.ve2JMaoV-lkp@intel.com/

smatch warnings:
drivers/clk/renesas/rzv2h-cpg.c:269 rzv2h_cpg_register_core_clk() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +269 drivers/clk/renesas/rzv2h-cpg.c

dd22e56217495e Lad Prabhakar 2024-07-29  220  static void __init
dd22e56217495e Lad Prabhakar 2024-07-29  221  rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
dd22e56217495e Lad Prabhakar 2024-07-29  222  			    struct rzv2h_cpg_priv *priv)
dd22e56217495e Lad Prabhakar 2024-07-29  223  {
dd22e56217495e Lad Prabhakar 2024-07-29  224  	struct clk *clk = ERR_PTR(-EOPNOTSUPP), *parent;
dd22e56217495e Lad Prabhakar 2024-07-29  225  	unsigned int id = core->id, div = core->div;
dd22e56217495e Lad Prabhakar 2024-07-29  226  	struct device *dev = priv->dev;
dd22e56217495e Lad Prabhakar 2024-07-29  227  	const char *parent_name;
dd22e56217495e Lad Prabhakar 2024-07-29  228  	struct clk_hw *clk_hw;
dd22e56217495e Lad Prabhakar 2024-07-29  229  
dd22e56217495e Lad Prabhakar 2024-07-29  230  	WARN_DEBUG(id >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  231  	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
dd22e56217495e Lad Prabhakar 2024-07-29  232  
dd22e56217495e Lad Prabhakar 2024-07-29  233  	switch (core->type) {
dd22e56217495e Lad Prabhakar 2024-07-29  234  	case CLK_TYPE_IN:
dd22e56217495e Lad Prabhakar 2024-07-29  235  		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
dd22e56217495e Lad Prabhakar 2024-07-29  236  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  237  	case CLK_TYPE_FF:
dd22e56217495e Lad Prabhakar 2024-07-29  238  		WARN_DEBUG(core->parent >= priv->num_core_clks);
dd22e56217495e Lad Prabhakar 2024-07-29  239  		parent = priv->clks[core->parent];
dd22e56217495e Lad Prabhakar 2024-07-29  240  		if (IS_ERR(parent)) {
dd22e56217495e Lad Prabhakar 2024-07-29  241  			clk = parent;
dd22e56217495e Lad Prabhakar 2024-07-29  242  			goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  243  		}
dd22e56217495e Lad Prabhakar 2024-07-29  244  
dd22e56217495e Lad Prabhakar 2024-07-29  245  		parent_name = __clk_get_name(parent);
dd22e56217495e Lad Prabhakar 2024-07-29  246  		clk_hw = devm_clk_hw_register_fixed_factor(dev, core->name,
dd22e56217495e Lad Prabhakar 2024-07-29  247  							   parent_name, CLK_SET_RATE_PARENT,
dd22e56217495e Lad Prabhakar 2024-07-29  248  							   core->mult, div);
dd22e56217495e Lad Prabhakar 2024-07-29  249  		if (IS_ERR(clk_hw))
dd22e56217495e Lad Prabhakar 2024-07-29  250  			clk = ERR_CAST(clk_hw);
dd22e56217495e Lad Prabhakar 2024-07-29  251  		else
dd22e56217495e Lad Prabhakar 2024-07-29  252  			clk = clk_hw->clk;
dd22e56217495e Lad Prabhakar 2024-07-29  253  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  254  	case CLK_TYPE_PLL:
dd22e56217495e Lad Prabhakar 2024-07-29  255  		clk = rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
dd22e56217495e Lad Prabhakar 2024-07-29  256  		break;
dd22e56217495e Lad Prabhakar 2024-07-29  257  	default:
dd22e56217495e Lad Prabhakar 2024-07-29  258  		goto fail;
dd22e56217495e Lad Prabhakar 2024-07-29  259  	}
dd22e56217495e Lad Prabhakar 2024-07-29  260  
dd22e56217495e Lad Prabhakar 2024-07-29  261  	if (IS_ERR_OR_NULL(clk))
dd22e56217495e Lad Prabhakar 2024-07-29  262  		goto fail;

Generally when a function returns both error pointers and NULL, the NULL
should not print a dev_err().  I feel like in this case, the Kconfig
rules should prevent a NULL return so this bug is likely harmless but
I haven't investigated outside of looking at this email.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

dd22e56217495e Lad Prabhakar 2024-07-29  263  
dd22e56217495e Lad Prabhakar 2024-07-29  264  	dev_dbg(dev, "Core clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  265  	priv->clks[id] = clk;
dd22e56217495e Lad Prabhakar 2024-07-29  266  	return;
dd22e56217495e Lad Prabhakar 2024-07-29  267  
dd22e56217495e Lad Prabhakar 2024-07-29  268  fail:
dd22e56217495e Lad Prabhakar 2024-07-29 @269  	dev_err(dev, "Failed to register core clock %s: %ld\n",
dd22e56217495e Lad Prabhakar 2024-07-29  270  		core->name, PTR_ERR(clk));
dd22e56217495e Lad Prabhakar 2024-07-29  271  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

