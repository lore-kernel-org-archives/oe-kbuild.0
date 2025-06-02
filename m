Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154319ADA4
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Jun 2025 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844515; cv=none; b=czRK2SkHR2vD7SFKRMyJSMtp1pgycGOAW5Zy29awaK3kmTSjPq+3Mvcpog6hMPNCGQuKTgmwUCIcvr76MtIgLK6aJ5C0bqLFv4mfvXrWi5GnIpbLQCbnOuPTm6eGMbGDmQIFnUwSLTDsZ/0hNoTpkpMqbybf0BKLSJtGMt6WHkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844515; c=relaxed/simple;
	bh=Xh9WnzSfgu+m0GMDti5P07SLsI9o4jWrD0yuJ3eYVjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=at3XAcv7j2JouYfbTn4eDr4Kcl5PabsXH6bjKGKUTOZ4+K5zLk4qJwf0ExdEgdZVaqQ0gafyORfWQ+WeeDn5IHmzXjHUr7m/dSr4/G5TeAh31dp81s5r6kqf/07Vpjr7XpwWBrzX/CiNGj3WH8Z5IXhYF2JbhYIGNo6XG1hUD1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkMseh88; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkMseh88"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso741697f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Jun 2025 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844512; x=1749449312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nUg394UUqvjb/oidDzwm9pG7XoUFy0Z+jw1O2ucewGg=;
        b=xkMseh88zSvYoW1uDMsHTTCsxdd0qC1gd5THCJZ/fkI/TVih1kXTaD7fuERfsImWr4
         2G9CYiYlpq5n7qobYN30SZMcp7tEfMTvsObppLj0ILneFVpIq3CI/F2qt8jIgG4HwEbi
         1H+nQJxlOtEloBwtNG2fjHTI7b9AMHzFlGttzCvy/xMSqRaqoCpT8/quzgt3G5Zv7dvB
         GsLznY1g5mqhvHrMBjn4H6sOhwG2l5FZV5Furv4cBQHPGh8DQhXzLn+BePIMdOzIowDG
         Fx7uJWx69Y/Fes3EYOpDP4trWH5OwjqNzKiMUrXrAMUycwTxZs8Pd66dUFLMRXnH5MKx
         7McA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844512; x=1749449312;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUg394UUqvjb/oidDzwm9pG7XoUFy0Z+jw1O2ucewGg=;
        b=HS0PT4Zklg+MW0nk9ll+ugnDxiTltABWZKpQ3WuInHh39Hw1U5EN4KZv5vGXKg77zu
         iXJtO8w68RyIs0sJ7s0okigZq3OerbErDR74g6lM29Ugt/FMJUb7fxaOJvwU4iVQwfU2
         amzs1tmMelu+tMAW1Si/UojBEDHleoWLcacdpl4Kjkhey/wKcpu9FqBSgpID8zavk/cn
         dRmoKJHkz7LmDTsGMhra0PH24Agt4iD/4bJaIt4xS4KyVHEvoQv6hTV4wXwuTjPvUfk6
         U0ZFxM3jDuUver1muuJQOTAVjpwYt6BNlwZoCJe3fSmaA6GWJO/TwGu1BinJLvuAO0D+
         AavA==
X-Gm-Message-State: AOJu0YwuuyKV4QKtxlkiqRwmMfL01zBs3hUz9fVUX9ZKsREw1tTbTiUj
	9qvJovQT59JTmnDbB+HTW3eR2J+t/kwoUTYWr66UpA3cg+zOAy41ugUj+xjJ0D3b1tQdNbgyWhG
	i/VEV
X-Gm-Gg: ASbGncslIoVwzLJUmbmbmydQcOsUfjDEVudAqpOXvUcapmQzMMKMwwg7ss1k8TnEvJW
	MzogAwlTnALnB6Ig11/XZo2L0ISamH6b17xfzziFVesHiZOQL6KNUeYgo7MRuYiYGJNiAy5nLa/
	rbBPg+ntaMPorroHZqmNW9eqeOdPthuDpkhwWzZkkrS9AkyNjsOpI9riCJWULS5HBJdhjMgyCnS
	eAXPGsP8PsahlSiyOnyRVtQhgQ16upAxfuPpIi6BDYD1BiFFrapg8v1jCXIBMCcFqwUEUWHbuqN
	GoiDyQab3khRCI1KAICQrK1EE3hGdmi5WpRCLOItYmMEHimreF8TsQeGXWz9YC2HNA==
X-Google-Smtp-Source: AGHT+IECaagk3g9nLoafLTcr2Co0rEQWyMHI31p8lTu8Ivf/YK9+vSssiruussNYu28rBIZV/D4I1w==
X-Received: by 2002:a5d:5f54:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a4f89a482fmr8521278f8f.8.1748844511667;
        Sun, 01 Jun 2025 23:08:31 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f00a02cdsm13745291f8f.94.2025.06.01.23.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:08:31 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:08:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Samuel Kayode via B4 Relay <devnull+samuel.kayode.savoirfairelinux.com@kernel.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
	Samuel Kayode <samuel.kayode@savoirfairelinux.com>,
	eballetbo@gmail.com, abelvesa@linux.com, b38343@freescale.com,
	yibin.gong@nxp.com, Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 2/6] mfd: pf1550: add core mfd driver
Message-ID: <202505290859.CKZrTkZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-pf1550-v3-2-45f69453cd51@savoirfairelinux.com>
Message-ID: <20250602060827.aoRvryDvxOr10XtS8GfLKCgDjwshy5sfG04tluaYPxk@z>

Hi Samuel,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Kayode-via-B4-Relay/dt-bindings-mfd-add-pf1550/20250528-062840
base:   0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
patch link:    https://lore.kernel.org/r/20250527-pf1550-v3-2-45f69453cd51%40savoirfairelinux.com
patch subject: [PATCH v3 2/6] mfd: pf1550: add core mfd driver
config: nios2-randconfig-r072-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290859.CKZrTkZu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505290859.CKZrTkZu-lkp@intel.com/

smatch warnings:
drivers/mfd/pf1550.c:162 pf1550_i2c_probe() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +162 drivers/mfd/pf1550.c

fc62e32ad9eb64 Samuel Kayode 2025-05-27  140  static int pf1550_i2c_probe(struct i2c_client *i2c)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  141  {
fc62e32ad9eb64 Samuel Kayode 2025-05-27  142  	struct pf1550_dev *pf1550;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  143  	unsigned int reg_data = 0;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  144  	int ret = 0;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  145  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  146  	pf1550 = devm_kzalloc(&i2c->dev, sizeof(*pf1550), GFP_KERNEL);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  147  	if (!pf1550)
fc62e32ad9eb64 Samuel Kayode 2025-05-27  148  		return -ENOMEM;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  149  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  150  	i2c_set_clientdata(i2c, pf1550);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  151  	pf1550->dev = &i2c->dev;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  152  	pf1550->i2c = i2c;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  153  	pf1550->irq = i2c->irq;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  154  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  155  	pf1550->regmap = devm_regmap_init_i2c(i2c, &pf1550_regmap_config);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  156  	if (IS_ERR(pf1550->regmap))
fc62e32ad9eb64 Samuel Kayode 2025-05-27  157  		return dev_err_probe(pf1550->dev, PTR_ERR(pf1550->regmap),
fc62e32ad9eb64 Samuel Kayode 2025-05-27  158  				     "failed to allocate register map\n");
fc62e32ad9eb64 Samuel Kayode 2025-05-27  159  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  160  	ret = regmap_read(pf1550->regmap, PF1550_PMIC_REG_DEVICE_ID, &reg_data);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  161  	if (ret < 0 || reg_data != PF1550_DEVICE_ID)
fc62e32ad9eb64 Samuel Kayode 2025-05-27 @162  		return dev_err_probe(pf1550->dev, ret, "device not found!\n");

return dev_err_probe(pf1550->dev, ret ?: -EINVAL, "device not found!\n");

fc62e32ad9eb64 Samuel Kayode 2025-05-27  163  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  164  	pf1550->type = PF1550;
fc62e32ad9eb64 Samuel Kayode 2025-05-27  165  
fc62e32ad9eb64 Samuel Kayode 2025-05-27  166  	ret = devm_regmap_add_irq_chip(pf1550->dev, pf1550->regmap,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  167  				       pf1550->irq,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  168  				       IRQF_ONESHOT | IRQF_SHARED |
fc62e32ad9eb64 Samuel Kayode 2025-05-27  169  				       IRQF_TRIGGER_FALLING, 0,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  170  				       &pf1550_regulator_irq_chip,
fc62e32ad9eb64 Samuel Kayode 2025-05-27  171  				       &pf1550->irq_data_regulator);
fc62e32ad9eb64 Samuel Kayode 2025-05-27  172  	if (ret)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

