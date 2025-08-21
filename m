Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFA12797AC
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755760105; cv=none; b=W+34154cUgZy3NtQzxsQQn60nzpkF3bh8WfYqDk2XCDVhXhKqD8q9qFKWa3NhxP1GCufUCLiVxVK8Q4GG74TQ4CBrVfF30ojOLgR6eKaLvTz+RuLOCUsKcOPGO8NGfhudapBW6Q5V21Kmd9R+6THhUQdQoZdz6thAoGPi8TBQ84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755760105; c=relaxed/simple;
	bh=ZCxONQxrCUP/S67geZUXdCRt79/EldDfyyxESse9P5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Mgt6CI4QG2CYVEJlmtKD09rw10X5+VQRrqAnFwovEctsYhtAbVREkjlPFXwsyxkml9fLNQnUs8utjdZ0/6MwZHJdtMiuN/UwkL6LdGswDD4TPMt8n22o1TKflYv3AwdB9L8rMxSloLl4KiI3mg+FC61tw8u1fs+frYPnuRvnDJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzQn2JPf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzQn2JPf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9dc55d84bso651710f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755760101; x=1756364901; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5dFFpBJkDJIzVB2v06DsZG1x2Vfn3FJLmSjQNn252A=;
        b=KzQn2JPfjtLQ/L5ODKx63jhozV5kdcwDs4ZVvYLcb+G4C6Gw32JGeSkO7A28Hlf/2t
         ex9RqEg6cWxiLyM0Rb9AdxpGjHLyAHlvyt9TkKJVoF4PVdmC4MiFPl9Klj9QKGwCck/A
         fKBYB0i8uDIC+2EhD4cpoH+9MLRfT2SJzR4zgMqmse+6E3pBxOT6sOEMgUIL3kC+3kBc
         7SRPlAdtDhHq9FBYIzU0JLmC941N3Ub+AzFJAjrxWq0Iu59fBRvw11Gj9TEscRIHwZU5
         nolwQH065G55DSIdHIioT2T9i7L3dSeFx+IOgab11Cza289XZo8pFyndfz2HAhVP6dhC
         bkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760101; x=1756364901;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5dFFpBJkDJIzVB2v06DsZG1x2Vfn3FJLmSjQNn252A=;
        b=EaIpgGpicHNy6r8GM0n5OGxHng8ZejctYmSl0LOEbE7wrjwGm26y9FbXW/N4oxGtI8
         vgd1r22oZ2hqA/AYyL8ZZirjhvggwhPviMrAUn+c1sx5NZUKxNU3FQpNF90M66naaH0T
         3eDOxsZXs+KcoWZ2yKkICJLMrM5IB60Nc1YHlOk42MVoAovCBzBUoSDdc5BFxXWet46Y
         5kYMJHx4Pu2tMMlE7/p3LKTTpcqv/J4ozUICNnqlRc6Iy4pMV/g/KDXGeBC+qj2EXNnM
         PZIM482AcuuGb6ZkWlk1YJpCQh8a1iikxGwp/w8TP+CfmaYPI84/NUZf/wDUnRL4iJZi
         zl5w==
X-Gm-Message-State: AOJu0Ywrea0y/arN281qrvnwckXGZ7eQmgPzDkVI21jigyGIBXeBZAMB
	u9GlWMdDD/7lCEOt32EspebhJJ2Rf2+V0AAbeQFLqLglOGI4bxD4qkpoiHhAjpqcdT6sJgR4Drz
	KogiR
X-Gm-Gg: ASbGncu0d2xSxEeG9IINTARvomck8Q62xidZtOmXmdNouxWswWlEbp+2Mnk+Ht1LBMR
	795ompmdy5UP20d+6VlXV4q4vNh+EEqlincjUNp08YLxU/CLiX4ehS4snVCjHyHF1Ig+W+70EUs
	SgU1lSKvLrX0+IjGT95vpoYRq4iybG8bV1NRpEDGGETSacA1/b456Aoim7CZm0OCEHiFnV0LI1M
	ZO1DwSD+s4hLjoZcVn/Y4nDobOR6s+HYZSL7Te/Uo5rL8Oio/NwLhQMVj64v1wnYGemM5qck6Wd
	JX5vCRL4FhKozCHEFBbmtCZCTvVrfUAGvpK7PxOf2CkFEDkQWFIP/bNlnDurSO0zOcaaVJ3HozY
	IrjzTxoexB7AMskSQADG+q3BmvAE=
X-Google-Smtp-Source: AGHT+IExPc1JTzW/1siA2DUdhTqJRYiZcNLJAGd22k94vc7c2Tz1Q/mdScQ7HsVKRyfP9FE1+uWN1Q==
X-Received: by 2002:a05:6000:1a8d:b0:3c3:5406:12b8 with SMTP id ffacd0b85a97d-3c497836ba0mr1067684f8f.60.1755760101158;
        Thu, 21 Aug 2025 00:08:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db2aff9sm14763585e9.10.2025.08.21.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:08:20 -0700 (PDT)
Date: Thu, 21 Aug 2025 10:08:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Kurz <akurz@blala.de>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: Re: [PATCH 4/6] Input: mc13783-pwrbutton: convert members to array
Message-ID: <202508210551.VzAtE5re-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817102751.29709-5-akurz@blala.de>
Message-ID: <20250821070816.VCrfuKjTmw9yWxz4CxwGPVFjp-anHiS92bkUFg1k2lE@z>

Hi Alexander,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Kurz/Input-mc13783-pwrbutton-fix-irq-mixup/20250817-182649
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250817102751.29709-5-akurz%40blala.de
patch subject: [PATCH 4/6] Input: mc13783-pwrbutton: convert members to array
config: i386-randconfig-141-20250820 (https://download.01.org/0day-ci/archive/20250821/202508210551.VzAtE5re-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508210551.VzAtE5re-lkp@intel.com/

New smatch warnings:
drivers/input/misc/mc13783-pwrbutton.c:185 mc13783_pwrbutton_probe() error: buffer overflow 'pdata->b_on_key' 3 <= 3

vim +185 drivers/input/misc/mc13783-pwrbutton.c

5298cc4cc753bb Bill Pemberton    2012-11-23  108  static int mc13783_pwrbutton_probe(struct platform_device *pdev)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  109  {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  110  	const struct mc13xxx_buttons_platform_data *pdata;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  111  	struct mc13xxx *mc13783 = dev_get_drvdata(pdev->dev.parent);
739ba46c8b2ddb Alexander Kurz    2025-08-17  112  	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  113  	struct input_dev *pwr;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  114  	struct mc13783_pwrb *priv;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  115  	int err = 0;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  116  	int reg = 0;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  117  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  118  	pdata = dev_get_platdata(&pdev->dev);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  119  	if (!pdata) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  120  		dev_err(&pdev->dev, "missing platform data\n");
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  121  		return -ENODEV;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  122  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  123  
173a22b931fb1b Alexander Kurz    2025-08-17  124  	pwr = devm_input_allocate_device(&pdev->dev);
173a22b931fb1b Alexander Kurz    2025-08-17  125  	if (!pwr)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  126  		return -ENOMEM;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  127  
173a22b931fb1b Alexander Kurz    2025-08-17  128  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
173a22b931fb1b Alexander Kurz    2025-08-17  129  	if (!priv)
173a22b931fb1b Alexander Kurz    2025-08-17  130  		return -ENOMEM;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  131  
739ba46c8b2ddb Alexander Kurz    2025-08-17  132  	/* ONOFD3 is only supported for MC13783. */
fc0cc88dc308bc Alexander Kurz    2025-08-17  133  	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE &&
739ba46c8b2ddb Alexander Kurz    2025-08-17  134  		chip != MC13XXX_CHIP_TYPE_MC13783)
739ba46c8b2ddb Alexander Kurz    2025-08-17  135  		return -ENODEV;
739ba46c8b2ddb Alexander Kurz    2025-08-17  136  
fc0cc88dc308bc Alexander Kurz    2025-08-17  137  	reg |= (pdata->b_on_flags[0] & 0x3) << MC13783_POWER_CONTROL_2_ON1BDBNC;
fc0cc88dc308bc Alexander Kurz    2025-08-17  138  	reg |= (pdata->b_on_flags[1] & 0x3) << MC13783_POWER_CONTROL_2_ON2BDBNC;
fc0cc88dc308bc Alexander Kurz    2025-08-17  139  	reg |= (pdata->b_on_flags[2] & 0x3) << MC13783_POWER_CONTROL_2_ON3BDBNC;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  140  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  141  	priv->pwr = pwr;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  142  	priv->mc13783 = mc13783;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  143  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  144  	mc13xxx_lock(mc13783);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  145  
fc0cc88dc308bc Alexander Kurz    2025-08-17  146  	if (pdata->b_on_flags[0] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17  147  		priv->keymap[0] = pdata->b_on_key[0];
fc0cc88dc308bc Alexander Kurz    2025-08-17  148  		if (pdata->b_on_key[0] != KEY_RESERVED)
fc0cc88dc308bc Alexander Kurz    2025-08-17  149  			__set_bit(pdata->b_on_key[0], pwr->keybit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  150  
fc0cc88dc308bc Alexander Kurz    2025-08-17  151  		if (pdata->b_on_flags[0] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  152  			priv->flags |= MC13783_PWRB_B1_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  153  
fc0cc88dc308bc Alexander Kurz    2025-08-17  154  		if (pdata->b_on_flags[0] & MC13783_BUTTON_RESET_EN)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  155  			reg |= MC13783_POWER_CONTROL_2_ON1BRSTEN;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  156  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  157  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD1,
4eeb8abb43c2b7 Alexander Kurz    2025-08-17  158  					  button1_irq, "b1on", priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  159  		if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  160  			dev_dbg(&pdev->dev, "Can't request irq\n");
173a22b931fb1b Alexander Kurz    2025-08-17  161  			goto free_mc13xxx_lock;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  162  		}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  163  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  164  
fc0cc88dc308bc Alexander Kurz    2025-08-17  165  	if (pdata->b_on_flags[1] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17  166  		priv->keymap[1] = pdata->b_on_key[1];
fc0cc88dc308bc Alexander Kurz    2025-08-17  167  		if (pdata->b_on_key[1] != KEY_RESERVED)
fc0cc88dc308bc Alexander Kurz    2025-08-17  168  			__set_bit(pdata->b_on_key[1], pwr->keybit);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  169  
fc0cc88dc308bc Alexander Kurz    2025-08-17  170  		if (pdata->b_on_flags[1] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  171  			priv->flags |= MC13783_PWRB_B2_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  172  
fc0cc88dc308bc Alexander Kurz    2025-08-17  173  		if (pdata->b_on_flags[1] & MC13783_BUTTON_RESET_EN)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  174  			reg |= MC13783_POWER_CONTROL_2_ON2BRSTEN;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  175  
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  176  		err = mc13xxx_irq_request(mc13783, MC13783_IRQ_ONOFD2,
4eeb8abb43c2b7 Alexander Kurz    2025-08-17  177  					  button2_irq, "b2on", priv);
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  178  		if (err) {
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  179  			dev_dbg(&pdev->dev, "Can't request irq\n");
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  180  			goto free_irq_b1;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  181  		}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  182  	}
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  183  
fc0cc88dc308bc Alexander Kurz    2025-08-17  184  	if (pdata->b_on_flags[2] & MC13783_BUTTON_ENABLE) {
fc0cc88dc308bc Alexander Kurz    2025-08-17 @185  		priv->keymap[2] = pdata->b_on_key[3];
                                                                                                  ^
fc0cc88dc308bc Alexander Kurz    2025-08-17  186  		if (pdata->b_on_key[3] != KEY_RESERVED)
                                                                                    ^
fc0cc88dc308bc Alexander Kurz    2025-08-17  187  			__set_bit(pdata->b_on_key[3], pwr->keybit);
                                                                                  ^^^^^^^^^^^^^^^^^^
Smatch thinks there are only 3 elements in this array so it's off by one.

30fc7ac3f62945 Philippe Rétornaz 2011-09-18  188  
fc0cc88dc308bc Alexander Kurz    2025-08-17  189  		if (pdata->b_on_flags[2] & MC13783_BUTTON_POL_INVERT)
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  190  			priv->flags |= MC13783_PWRB_B3_POL_INVERT;
30fc7ac3f62945 Philippe Rétornaz 2011-09-18  191  
fc0cc88dc308bc Alexander Kurz    2025-08-17  192  		if (pdata->b_on_flags[2] & MC13783_BUTTON_RESET_EN)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

