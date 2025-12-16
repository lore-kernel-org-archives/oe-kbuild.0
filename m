Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6E9296BC0
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892603; cv=none; b=sqz/Nsi8vS9oB00v6kDlfdKK/YlWbj9OF1RTtsagQ2CsebpTAhRnNtKNmr6XbHQUb8YY9aIBABb/oIu2poxtu/zuP9ISBCPrjfPm5YPPrgVzR4ZXoqbcvvtLPhB4tLKqtpit/NAlJUyLzFj9LmhtfClrD+FfTnCdkGePMfSnoQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892603; c=relaxed/simple;
	bh=tR+5COm7Aajr+rhTyJR6KwpBfk87Pud1IWaOcJU8NXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhXgbNuT0+pJENJzB9j7l5XyPod2+bxpvyis2GZTqgJk2y/0rwNP6xBEr7VOa9idlqpQpehIxJb2KtMuLqZaa4D2V1DqGIxjVCVE+M0PkZH4VgnSHB2+ROzUyzZMtD7kNcgUZ1ptnkwTyT8KWoz21/xsOfpd9mchU89/0LtXrm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bR0JdTuR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bR0JdTuR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so3043956f8f.3
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765892597; x=1766497397; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUlPjK/WuIqN2nCcCkf3I8wavxJP1d7TYelnQJd0+CY=;
        b=bR0JdTuRqnvvEQNDJ3fUIN6Pf+0yBlnx0jY/VBhIldVfojf3eivrQRtBQJbfrip8KS
         RbvJHf831IcrbC+SrSaw7r8kVDrPfq/+vvYQBPYP4vXBvWorwvAV1vXgHNl4cRTNYlp9
         qJ7wTiKbeRS1gnaZ8Zs6DOE5ilBatRpV4gJmcQmfHeE1K2hT97FxhddZBcTFXOCctrjD
         4j5rx4YwWJ6/r3Uxb7ebrZa2gu3hRRmFZQYLE266hE30KjZUUP7N/5csa7fPZabaeamm
         gREsjJad8gkuLfZT/h7XTCWE2bQk+rBE+PJzxjJV9SV+lq79RghQK2XdPBfz/qc9/3V8
         z1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892597; x=1766497397;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUlPjK/WuIqN2nCcCkf3I8wavxJP1d7TYelnQJd0+CY=;
        b=qXuRwjBoKvGFbx1cRSYEyh3ND00t6oLKlIqDCrgsWmObqdS1fnckW1RiWE5fvuXE1m
         HOJVIiQuNi9/ejp/Jrmx7tF5AeNJJudVCC+pmgag3X7wrMrR0uA9kazWN0o4cqm/szM5
         DfIx6dqR0w4nIshIl2g90xPc3LgtUAD7JFHorqd51QAKrudUcO2HnKQTxl405l9DM8/V
         gHGi68/r2GmYQ6FpsErfvkteRlqGI9oJL58bk9ESMWgpoNgVnSCPOkK998RX6wUmPUhR
         7VOS5gGGnZzZEz391+yzdEhsDxY1rVMQOfiG+/slHXJCuspQyajXbc9Q+dETFkuvJh+7
         2z+Q==
X-Gm-Message-State: AOJu0Ywm/KwzFzujRjOpYYA3cpUfxPZMMahBlZJpMkDVdZBjK5tsOy4D
	dcDDyPRG4PWsTohQmnHq4XX24IknO9zC+lH/xWThscqRF5My6i8ZI0Fh+wvZZUs/ualb4rGaQAX
	86Oug
X-Gm-Gg: AY/fxX7kSSrRkA6+i406P5ML2OodaxO0FJjWw7YAkxCY+LYQP+YceuHvCi1Y7FO1Gni
	Pui+c9Jd4k5USJrW4T1iX7vBD5pbLw8vRjA0wY7PYgu//8FtkBu1DBaVn0JRXbpLWx3f6DA5iwF
	tXwDjw/OfVh4t2GjrnWyHDDtS8pdKkE2WuRP62x89ToTjee9ipsgpsbE2UYvk9omARZdFto5bUV
	70pr85Ajb/2H8cErMkoc/kSa7Sg61CXgV04EWXgbc9SHNoWFhz3JCxz1eC8x8/GqpRSjEyZUp1U
	WknP0gGXRWVDXrsvjlimlyesNqb+ePIbBn9UI+OqHX/yI8qig/HMneLGyadbAKXUl7eghnJ34To
	R0LF+j8/nfzIQhDpi4i1R+VrKOPoGha23434O0QxexikJEojEpyEvrpiAT70kUt434JriVE4f66
	3PuexzFrNHfS+wS3nz
X-Google-Smtp-Source: AGHT+IHuvJ59Z1jzIkZ6nejGnOwd19Br4R1Mgp+JiGBQm8dkLJ8TPIA85El0Ts/AzaUTzTNPgPcHrQ==
X-Received: by 2002:a05:6000:2909:b0:42f:a025:92b3 with SMTP id ffacd0b85a97d-42fb44d4395mr13448992f8f.2.1765892596798;
        Tue, 16 Dec 2025 05:43:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f38d01d6sm20782702f8f.8.2025.12.16.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:43:16 -0800 (PST)
Date: Tue, 16 Dec 2025 16:43:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andreas Kemnade <andreas@kemnade.info>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: drivers/power/supply/bd71828-power.c:469
 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.
Message-ID: <202512161012.YCn72zq9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251216134313.UoxtFg7T-WL4OFDyAQ6Ir8950ZKmJ8iO0zlS3_C7Ck4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5bff79dad20a51fed3ff6d78f6b60321cd145a99 power: supply: Add bd718(15/28/78) charger driver
config: openrisc-randconfig-r071-20251214 (https://download.01.org/0day-ci/archive/20251216/202512161012.YCn72zq9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512161012.YCn72zq9-lkp@intel.com/

smatch warnings:
drivers/power/supply/bd71828-power.c:469 bd71828_battery_get_property() error: uninitialized symbol 'tmp'.

vim +/tmp +469 drivers/power/supply/bd71828-power.c

5bff79dad20a51 Andreas Kemnade 2025-09-18  437  static int bd71828_battery_get_property(struct power_supply *psy,
5bff79dad20a51 Andreas Kemnade 2025-09-18  438  					enum power_supply_property psp,
5bff79dad20a51 Andreas Kemnade 2025-09-18  439  					union power_supply_propval *val)
5bff79dad20a51 Andreas Kemnade 2025-09-18  440  {
5bff79dad20a51 Andreas Kemnade 2025-09-18  441  	struct bd71828_power *pwr = dev_get_drvdata(psy->dev.parent);
5bff79dad20a51 Andreas Kemnade 2025-09-18  442  	int ret = 0;
5bff79dad20a51 Andreas Kemnade 2025-09-18  443  	int status, health, tmp, curr, curr_avg, chg_en;
5bff79dad20a51 Andreas Kemnade 2025-09-18  444  
5bff79dad20a51 Andreas Kemnade 2025-09-18  445  	if (psp == POWER_SUPPLY_PROP_STATUS ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  446  	    psp == POWER_SUPPLY_PROP_HEALTH ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  447  	    psp == POWER_SUPPLY_PROP_CHARGE_TYPE)
5bff79dad20a51 Andreas Kemnade 2025-09-18  448  		ret = bd71828_charge_status(pwr, &status, &health);
5bff79dad20a51 Andreas Kemnade 2025-09-18  449  	else if (psp == POWER_SUPPLY_PROP_CURRENT_AVG ||
5bff79dad20a51 Andreas Kemnade 2025-09-18  450  		 psp == POWER_SUPPLY_PROP_CURRENT_NOW)
5bff79dad20a51 Andreas Kemnade 2025-09-18  451  		ret = bd71828_get_current_ds_adc(pwr, &curr, &curr_avg);
5bff79dad20a51 Andreas Kemnade 2025-09-18  452  	if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  453  		return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  454  
5bff79dad20a51 Andreas Kemnade 2025-09-18  455  	switch (psp) {
5bff79dad20a51 Andreas Kemnade 2025-09-18  456  	case POWER_SUPPLY_PROP_STATUS:
5bff79dad20a51 Andreas Kemnade 2025-09-18  457  		val->intval = status;
5bff79dad20a51 Andreas Kemnade 2025-09-18  458  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  459  	case POWER_SUPPLY_PROP_HEALTH:
5bff79dad20a51 Andreas Kemnade 2025-09-18  460  		val->intval = health;
5bff79dad20a51 Andreas Kemnade 2025-09-18  461  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  462  	case POWER_SUPPLY_PROP_PRESENT:
5bff79dad20a51 Andreas Kemnade 2025-09-18  463  		ret = get_bat_online(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18  464  		if (!ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  465  			val->intval = tmp;
5bff79dad20a51 Andreas Kemnade 2025-09-18  466  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  467  	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  468  		ret = bd71828_get_vbat(pwr, &tmp);
5bff79dad20a51 Andreas Kemnade 2025-09-18 @469  		val->intval = tmp;

Smatch complains that we don't check until ret after we assign the
uninitialized variable.

5bff79dad20a51 Andreas Kemnade 2025-09-18  470  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  471  	case POWER_SUPPLY_PROP_TECHNOLOGY:
5bff79dad20a51 Andreas Kemnade 2025-09-18  472  		val->intval = POWER_SUPPLY_TECHNOLOGY_LION;
5bff79dad20a51 Andreas Kemnade 2025-09-18  473  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  474  	case POWER_SUPPLY_PROP_CURRENT_AVG:
5bff79dad20a51 Andreas Kemnade 2025-09-18  475  		val->intval = curr_avg;
5bff79dad20a51 Andreas Kemnade 2025-09-18  476  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  477  	case POWER_SUPPLY_PROP_CURRENT_NOW:
5bff79dad20a51 Andreas Kemnade 2025-09-18  478  		val->intval = curr;
5bff79dad20a51 Andreas Kemnade 2025-09-18  479  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  480  	case POWER_SUPPLY_PROP_CURRENT_MAX:
5bff79dad20a51 Andreas Kemnade 2025-09-18  481  		val->intval = MAX_CURRENT_DEFAULT;
5bff79dad20a51 Andreas Kemnade 2025-09-18  482  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  483  	case POWER_SUPPLY_PROP_TEMP:
5bff79dad20a51 Andreas Kemnade 2025-09-18  484  		ret = pwr->get_temp(pwr, &val->intval);
5bff79dad20a51 Andreas Kemnade 2025-09-18  485  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  486  	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
5bff79dad20a51 Andreas Kemnade 2025-09-18  487  		ret = regmap_read(pwr->regmap, pwr->regs->chg_en, &chg_en);
5bff79dad20a51 Andreas Kemnade 2025-09-18  488  		if (ret)
5bff79dad20a51 Andreas Kemnade 2025-09-18  489  			return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  490  
5bff79dad20a51 Andreas Kemnade 2025-09-18  491  		val->intval = (chg_en & BD7182x_MASK_CHG_EN) ?
5bff79dad20a51 Andreas Kemnade 2025-09-18  492  			POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO :
5bff79dad20a51 Andreas Kemnade 2025-09-18  493  			POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE;
5bff79dad20a51 Andreas Kemnade 2025-09-18  494  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  495  	default:
5bff79dad20a51 Andreas Kemnade 2025-09-18  496  		ret = -EINVAL;
5bff79dad20a51 Andreas Kemnade 2025-09-18  497  		break;
5bff79dad20a51 Andreas Kemnade 2025-09-18  498  	}
5bff79dad20a51 Andreas Kemnade 2025-09-18  499  
5bff79dad20a51 Andreas Kemnade 2025-09-18  500  	return ret;
5bff79dad20a51 Andreas Kemnade 2025-09-18  501  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

