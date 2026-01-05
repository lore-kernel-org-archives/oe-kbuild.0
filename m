Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0418126B741
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 10:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607836; cv=none; b=Fs6yhBnAW18EsQESsRctvE5P8Df7bXU4Ixo7FGfZa6QkVx1eSDSrpF9YIHShoQPZaPp1vU9G/xY/PNXgIT8/wZ/e+/nqVKsZa20Kw/+oB1riz6Hjfmp7XvGD69PEyo/BDHhTcZaeL/j4kxQOYhl4CADcg1/RpqGHbA3UmPjP6jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607836; c=relaxed/simple;
	bh=PbGYj0RLG7CPYad+Rq+AEDImBjNt5TLUDiyB5JHGqmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nFAHQ+qqF+ewN3EKNUUaLc1/Cs1fcusuTxHf2xggozyw8jDY77CU77l0vI0gb1H9/fiOmURyO6lLC7kQvQ5YE55EXOTRNknnNeFBun2247PS0TI4tRzvXjzzK1ioxN6qOKkC5y9TaX2RsV1zT7Fyi+UcgYXDJfGd8yG5lIY1bYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TJKiuQzi; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TJKiuQzi"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-430f57cd471so6450568f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767607832; x=1768212632; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=TJKiuQziu0ZYEmfWO3aGVYVkpYg3rbOUwfsraBVxnT2uUEUPR+v8VYjPpw+LrRZjgO
         fgK2mZwz7sZZijxuhAxQr9Q9wVoIzPhzYExnZX4A6+2mlou/IID8Y1P70Z0jraICVhDO
         DSbh4ZrjvH1NFZRXUrzLLxLxxovZJjTXkUT8+yBZTEhC75SpfWL3z8Up1tFQ8Mjh/E40
         e0H1atJAiSfsmW2ENDGuiSd7zjsqU+rhEnOFLygF9OtFo4w3YQqa0EZwQ1YPA0bv8rGM
         ayfxtAMnUWpEkwnMBqxd5pReBg5UzXegEoxLzbfLatG9iWAUhapjixyxmbiSkvOaTpaX
         wzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607832; x=1768212632;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxNaBeHAJ/4EZ7JTOdnqwOVDyNniPg0HIAmiaHm6nBM=;
        b=sBV1C4s8lUK0Irm6qQ/hBAH4T3WLM2z9CCdjHSVH/0W7pJD0khfF9Gn2QOpTNrG3mV
         sg66xDHPemeGfObIoVzaRFWe+eg6LGNZqs3nGI1D1QqaETt61N0/Q6i1VicZBakOYyQs
         No7h1xTLBImTGanoE4lXclhS7jx2gJ9Bj7wurhalvX8xxLLDP5DhzExe0N/ChER++Ulq
         OVNFz1zpOnPG2257vaBjvFBCUhCZU8ZZs9QXMJn6+nZ66IxkbC7K+VqDfOpyEcePPLhH
         T1KUj7dVJAOBkkJDxp8sB4WRlWYftLnBFx4Czn5eFYsb+qgfJyg4TInrabhGE5nzHsiV
         iLsw==
X-Gm-Message-State: AOJu0Yz7TdCGgjc2uS5UInftAQD/Zd9VdeFXMmCB8E8dLEIj4TISTrUp
	2aikBqpuCtvupVGPitUgMnZrZ9vQbjnBkq7ra4vOShgRHja94hMTxGmlD1Wgv45hKEUQDqjaAs4
	LIdLx
X-Gm-Gg: AY/fxX4EOYgP9GpMUuhA7m0CFQLNuNgtaD5jwOIk2X716QJoNXmu98Ui0NXRFsJyzSL
	CYR46bQSdHhRnLc12RAjG236oU9w99+6jBN1VmW4KtA5GzHwahhtTcXBsTqxN0RTmHjjhPI3nB8
	le52FPHr5KjvVIzTMnLEeWD5PAy/ULe1T2+Yg6SaV7gf++pVvkjz/nswS6o8A29WkXfsIKiekkS
	ygtFUJ0XAhVHkL/7l7f3/KYr2RYxVM+TkRwsQhHx7ZGRwnDi7+U7PT9pMGCaaHusVT58nPorE3V
	kFqK1o8AV7whax75aASF4OG0AwXhMenjW9y2imCwF/BU6DajYGlc/3k9yJxh6KgjAvB8QO7XWTC
	jWW01GNBBfdFpp0wCGzmNHcJMT6SxXzhONmPGp3O/LjONCgKkkOxmj0PsF6WbhvWDWFUWl6OXOY
	FgxmtON8iR3SD8T83a
X-Google-Smtp-Source: AGHT+IFizN6ugrpoj6l/xyTx2wr6ugxEAzpdZgwgMGXWzIHWqKUPqfS+umP15OiFV+l/yYQfDLUJ0w==
X-Received: by 2002:a5d:4a11:0:b0:431:67d:5390 with SMTP id ffacd0b85a97d-4324e50d055mr58872716f8f.54.1767607831963;
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm100837339f8f.20.2026.01.05.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:10:31 -0800 (PST)
Date: Mon, 5 Jan 2026 13:10:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "benoit.masson" <yahoo@perenite.com>,
	jdelvare@suse.com, linux@roeck-us.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	"benoit.masson" <yahoo@perenite.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <202512300415.VRCQoZYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226203021.27244-1-yahoo@perenite.com>
Message-ID: <20260105101027.WrCgKIMSqiBdEZ9zkuRq9OrvtZ_yjF7uV7ZL3iZgkbI@z>

Hi benoit.masson,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmon-it87-describe-per-chip-temperature-resources/20251227-043108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40perenite.com
patch subject: [PATCH] hwmon: it87: describe per-chip temperature resources
config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/archive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/

smatch warnings:
drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced before IS_ERR check 'data' (see line 1691)

vim +/data +1694 drivers/hwmon/it87.c

94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_temp_map(struct device *dev,
94ac7ee616809d Jean Delvare   2010-03-05  1686  				 struct device_attribute *attr, char *buf)
94ac7ee616809d Jean Delvare   2010-03-05  1687  {
94ac7ee616809d Jean Delvare   2010-03-05  1688  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
94ac7ee616809d Jean Delvare   2010-03-05  1689  	struct it87_data *data = it87_update_device(dev);
c962024e306ed5 Guenter Roeck  2015-04-04  1690  	int nr = sensor_attr->index;
542f1e57c17849 benoit.masson  2025-12-26 @1691  	u8 num_map = data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
                                                                     ^^^^^^^^^^^^^^^^^^
Unchecked dereference

94ac7ee616809d Jean Delvare   2010-03-05  1692  	int map;
94ac7ee616809d Jean Delvare   2010-03-05  1693  
0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694  	if (IS_ERR(data))
                                                                   ^^^^
Checked too late.

0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695  		return PTR_ERR(data);
0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696  
0624d861983c2c Guenter Roeck  2015-04-06  1697  	map = data->pwm_temp_map[nr];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

