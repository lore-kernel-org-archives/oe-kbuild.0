Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535F158524
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Nov 2024 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730536648; cv=none; b=fB5guJX3oNBaBd6w/rK1cDv4JW0gWaBy1avvW92g3zl5HSGgzKy6Sp9nfIl5mdvZqMyVdodDGNoehVcYfv2gP4Z58Be+1boxT0d7fEiai2ZuuFUrIYgYCy//UTCs4bjPoKm0RfpOaUUC0X85bmbXAoIRBFOACpt42j/9cnPSvDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730536648; c=relaxed/simple;
	bh=dUFHckRJ9ilGqoDPaa2PWgH6gnUR89FL98Ke20jbZDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HBvPBxf1O8ZYak18cY/WuyRsn8z6cXBYeTAknEh371lbBsccrC67gcODTQlEEnOet1c2wLokk7P3VDhkBV/sm5O7jIuWDPAkp1pUk/7HgaI6Z5oHcN5FDNKVJ9FJU+vAs9WgnVzHBe5auHllSKavtvS+QKe1LQnvy+LPqWbEUD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DJuoCKlh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DJuoCKlh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4fd00574so1633516f8f.0
        for <oe-kbuild@lists.linux.dev>; Sat, 02 Nov 2024 01:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730536643; x=1731141443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1wLSM24+3PvyH7ej2g+4G+UpBE6rJoDJskNxC1aAWA=;
        b=DJuoCKlhbsNu45LuwYgJRLPccRNSsb8lzUPiR7KjcxZ1QcmL4MEe1Y0hX2fw8xD2zq
         OPDCGRRUxI/y6sFxNegfSCxG1959I8s7XzhxjnkocbgqPEv7ye20dyRV+dVpgcqY1aDx
         ih6x4y8V4rlOzassCpJj0mDCpZfryJVvr3Ym7Tzg82pvrI0PxAf9bfCXbNGTOcEKV1LL
         X6PMR8ZuSG5nMlkKWGYKEH8aWEc/CWzFuI9l9RO9Wn2kmB0yCvQ6yqEsDxZpcaqXoEun
         2I8KHbggqk4fWE00eE0T+qd4ExEkllJN60IKodM/lajGLRolIyO+xG0AzCnAmlFx50hZ
         Yn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730536643; x=1731141443;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1wLSM24+3PvyH7ej2g+4G+UpBE6rJoDJskNxC1aAWA=;
        b=Uen6lV4P6f66F9xOhQlI3n2zhR1vq01wHt5C+a4lGLx6phgCTUqei0wubj9n7GT64C
         6KtUHtRRRxukiPNpHaj9yWcBeFcC/lmhOhWGMlJevnvjkfqSnPp6CvE4AwhQbcX9zh31
         OJYkwB8ERTH94GaaNM8vakUfc5SxY0l389qBhX8teGlh57Q/HwYGNQcmc+JLMk4SZu+d
         oQmopWPGFcEcazVT2Tn28TZkPUVUODYeupQ5KMSDrPVnr3tEzBoS9z2BdmZxaf8sQU9B
         56oRsnapR9d/kBRwcuxZ0XgfSClWjZxxIUsL8YPASSdvrSJ9FSnp0zN6rgLyHYos9PyZ
         6ziQ==
X-Gm-Message-State: AOJu0YzIN7Pc5T7kCC3d4MralBOpMzPOcFU4hOnUCBfKm94jbZ7Yj8Pn
	hQI32qMKssNsLxyOHqtZDEMTimoRY+byORMkSwQBY3SiouoqUFEv7pQQuzMlIdd+n6OukjB7z2u
	v
X-Google-Smtp-Source: AGHT+IH44ILAIvwuI9zYhtmAcV7RoQNrvn7NrERInPHKHUhKGWu6xeRArhlwj9NNXrDVF25LJw7gNw==
X-Received: by 2002:a05:6000:18a9:b0:367:8e57:8 with SMTP id ffacd0b85a97d-381c79e3b75mr5719372f8f.19.1730536642787;
        Sat, 02 Nov 2024 01:37:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5c65c7sm86574345e9.19.2024.11.02.01.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 01:37:22 -0700 (PDT)
Date: Sat, 2 Nov 2024 11:37:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <48498f47-1601-432b-bde5-f487668d1e85@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-3-andrei.stefanescu@oss.nxp.com>

Hi Andrei,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrei-Stefanescu/dt-bindings-mfd-add-support-for-the-NXP-SIUL2-module/20241101-160940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20241101080614.1070819-3-andrei.stefanescu%40oss.nxp.com
patch subject: [PATCH v5 2/7] mfd: nxp-siul2: add support for NXP SIUL2
config: csky-randconfig-r072-20241102 (https://download.01.org/0day-ci/archive/20241102/202411021431.282g2yZy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411021431.282g2yZy-lkp@intel.com/

smatch warnings:
drivers/mfd/nxp-siul2.c:311 nxp_siul2_init_regmap() error: uninitialized symbol 'ret'.

vim +/ret +311 drivers/mfd/nxp-siul2.c

5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  267  static int nxp_siul2_init_regmap(struct platform_device *pdev,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  268  				 void __iomem *base, int siul)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  269  {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  270  	struct regmap_config regmap_configs[SIUL2_NUM_REG_TYPES] = {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  271  		[SIUL2_MPIDR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  272  		[SIUL2_IRQ]	= nxp_siul2_regmap_irq_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  273  		[SIUL2_MSCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  274  		[SIUL2_IMCR]	= nxp_siul2_regmap_generic_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  275  		[SIUL2_PGPDO]	= nxp_siul2_regmap_pgpdo_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  276  		[SIUL2_PGPDI]	= nxp_siul2_regmap_pgpdi_conf,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  277  	};
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  278  	const struct nxp_siul2_reg_range_info *tmp_range;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  279  	struct regmap_config *tmp_conf;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  280  	struct nxp_siul2_info *info;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  281  	struct nxp_siul2_mfd *priv;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  282  	void __iomem *reg_start;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  283  	int i, ret;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  284  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  285  	priv = platform_get_drvdata(pdev);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  286  	info = &priv->siul2[siul];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  287  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  288  	for (i = 0; i < SIUL2_NUM_REG_TYPES; i++) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  289  		if (!s32g2_reg_ranges[siul][i].valid)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  290  			continue;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  291  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  292  		tmp_range = &s32g2_reg_ranges[siul][i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  293  		tmp_conf = &regmap_configs[i];
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  294  		tmp_conf->name = tmp_range->reg_name;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  295  		tmp_conf->max_register =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  296  			tmp_range->reg_end_offset - tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  297  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  298  		if (tmp_conf->cache_type != REGCACHE_NONE)
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  299  			tmp_conf->num_reg_defaults_raw =
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  300  				tmp_conf->max_register / tmp_conf->reg_stride;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  301  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  302  		if (tmp_range->reg_access) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  303  			tmp_conf->wr_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  304  			tmp_conf->rd_table = tmp_range->reg_access;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  305  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  306  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  307  		reg_start = base + tmp_range->reg_start_offset;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  308  		info->regmaps[i] = devm_regmap_init_mmio(&pdev->dev, reg_start,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  309  							 tmp_conf);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  310  		if (IS_ERR(info->regmaps[i])) {
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01 @311  			dev_err(&pdev->dev, "regmap %d init failed: %d\n", i,
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  312  				ret);

Do this like: dev_err(&pdev->dev, "regmap %d init failed: %pe\n", i, info->regmaps[i]);

5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  313  			return PTR_ERR(info->regmaps[i]);
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  314  		}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  315  	}
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  316  
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  317  	return 0;
5c0b3edcf6df17 Andrei Stefanescu 2024-11-01  318  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

