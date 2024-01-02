Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686514F81;
	Tue,  2 Jan 2024 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aN/2YosY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so3975366b3a.1;
        Tue, 02 Jan 2024 08:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704213963; x=1704818763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFiPjkhGGbeMqydoL4yKAQZdGeHCA8x/zJtgOPFQfu0=;
        b=aN/2YosY8ZnX2dWvv2O0XgVZyQO2qqt0H9bxlugCCFuEPnA3klHR+gJuUXw+MspYMX
         PHe1GIdVufqkcyts0KwSZzr9mUMdbh00uatqZ2t7TlJ4aE07FxVnwnKbuxUBYa2fBlTW
         IlxU8WgE8Tm2l6Nirjfy+TmSwHn/0Ckvh9rmQ575pRQynz/D/E0wdY2bI3EtLvkk7RIX
         BZAOLo1sleH/K6lRCBYDslxwd+jgC9VizftLE9FTa4NftdZuXBeIHfBy8XmOqD40Lxl7
         1b70uu3n/n2YHoUmANv2CYaG9X+Sm5lVzuftFApcwjcyItcLvXoF+3+pbH8hbOwmBujK
         xbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704213963; x=1704818763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFiPjkhGGbeMqydoL4yKAQZdGeHCA8x/zJtgOPFQfu0=;
        b=GMKUbdZVKVVUC3NGXowvPHVl4F2JkuPtU8Z52Om335dedrUsIbm0RU5vwafn9LjDd2
         dw75SViwXJ90MJPw4BJU34cTjH2HcG1bFSFYQrWPVdSveKh1KxW/K3X36XxAYoV4F29A
         pfK2jlUzW00eEKlyntql5lmRty7RtzdRVKASaoXDEWHlBGwXUdVovSdImhWWGCWI6/pB
         RCt4QEISQbO5NXYVucV19IpwtEV+IlCdLSXFT9kLZwWaClVixJhnK9zPtxSWdghnaFv3
         a43p0TDa5YCE6PtrJ7HZpeIAFj9aYr1WDjHm8V2uN6eJlN4yiEWjrfeh5jU9oD75aUQV
         QJdA==
X-Gm-Message-State: AOJu0YzXfU9/nB7NSbFjeigbwQi+b3xf0AmJqHwrRkPzMvIJEZiO4AfN
	LWTggC/EWR+yZbaoaAvv4O4=
X-Google-Smtp-Source: AGHT+IHTl16pSW/nSb+engYrBEXqr4sTSkS6njNYMBj2YyoBHAbyBy5C8IzaObuV0f8yJtedCqDWRA==
X-Received: by 2002:a62:ee0b:0:b0:6d9:ce76:1fdf with SMTP id e11-20020a62ee0b000000b006d9ce761fdfmr12181194pfi.2.1704213963086;
        Tue, 02 Jan 2024 08:46:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b30-20020aa78ede000000b006d9bf501c52sm14922065pfr.144.2024.01.02.08.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:46:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 2 Jan 2024 08:46:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [linux-next:master 6418/8213] drivers/hwmon/pmbus/ltc4286.c:88
 ltc4286_probe() warn: passing zero to 'dev_err_probe'
Message-ID: <982247f3-6bba-4023-a45d-745697d5ca72@roeck-us.net>
References: <fe2b4d4b-b650-4366-a649-3438fb3d4dae@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe2b4d4b-b650-4366-a649-3438fb3d4dae@suswa.mountain>

On Tue, Jan 02, 2024 at 05:25:01PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
> commit: 263835c7e3879a2bfa33fe86711349b30af0b0cd [6418/8213] hwmon: (pmbus) Add ltc4286 driver
> config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170449.GymH8cUN-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312170449.GymH8cUN-lkp@intel.com/
> 
> smatch warnings:
> drivers/hwmon/pmbus/ltc4286.c:88 ltc4286_probe() warn: passing zero to 'dev_err_probe'
> 
> vim +/dev_err_probe +88 drivers/hwmon/pmbus/ltc4286.c
> 
> 263835c7e3879a Delphine CC Chiu 2023-11-23   67  static int ltc4286_probe(struct i2c_client *client)
> 263835c7e3879a Delphine CC Chiu 2023-11-23   68  {
> 263835c7e3879a Delphine CC Chiu 2023-11-23   69  	int ret;
> 263835c7e3879a Delphine CC Chiu 2023-11-23   70  	const struct i2c_device_id *mid;
> 263835c7e3879a Delphine CC Chiu 2023-11-23   71  	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> 263835c7e3879a Delphine CC Chiu 2023-11-23   72  	struct pmbus_driver_info *info;
> 263835c7e3879a Delphine CC Chiu 2023-11-23   73  	u32 rsense;
> 263835c7e3879a Delphine CC Chiu 2023-11-23   74  	int vrange_nval, vrange_oval;
> 263835c7e3879a Delphine CC Chiu 2023-11-23   75  
> 263835c7e3879a Delphine CC Chiu 2023-11-23   76  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> 263835c7e3879a Delphine CC Chiu 2023-11-23   77  	if (ret < 0) {
> 263835c7e3879a Delphine CC Chiu 2023-11-23   78  		return dev_err_probe(&client->dev, ret,
> 263835c7e3879a Delphine CC Chiu 2023-11-23   79  				     "Failed to read manufacturer id\n");
> 263835c7e3879a Delphine CC Chiu 2023-11-23   80  	}
> 263835c7e3879a Delphine CC Chiu 2023-11-23   81  
> 263835c7e3879a Delphine CC Chiu 2023-11-23   82  	/*
> 263835c7e3879a Delphine CC Chiu 2023-11-23   83  	 * Refer to ltc4286 datasheet page 20
> 263835c7e3879a Delphine CC Chiu 2023-11-23   84  	 * the manufacturer id is LTC
> 263835c7e3879a Delphine CC Chiu 2023-11-23   85  	 */
> 263835c7e3879a Delphine CC Chiu 2023-11-23   86  	if (ret != LTC4286_MFR_ID_SIZE ||
> 263835c7e3879a Delphine CC Chiu 2023-11-23   87  	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> 263835c7e3879a Delphine CC Chiu 2023-11-23  @88  		return dev_err_probe(&client->dev, ret,
>                                                                                                    ^^^
> Use -EINVAL instead of ret.
> 

I fixed it up, using -ENODEV to match other drivers with the same problem.
No need to send a patch.

Thanks,
Guenter

> 263835c7e3879a Delphine CC Chiu 2023-11-23   89  				     "Manufacturer id mismatch\n");
> 263835c7e3879a Delphine CC Chiu 2023-11-23   90  	}
> 263835c7e3879a Delphine CC Chiu 2023-11-23   91  
> 263835c7e3879a Delphine CC Chiu 2023-11-23   92  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> 263835c7e3879a Delphine CC Chiu 2023-11-23   93  	if (ret < 0) {
> 263835c7e3879a Delphine CC Chiu 2023-11-23   94  		return dev_err_probe(&client->dev, ret,
> 263835c7e3879a Delphine CC Chiu 2023-11-23   95  				     "Failed to read manufacturer model\n");
> 263835c7e3879a Delphine CC Chiu 2023-11-23   96  	}
> 263835c7e3879a Delphine CC Chiu 2023-11-23   97  
> 263835c7e3879a Delphine CC Chiu 2023-11-23   98  	for (mid = ltc4286_id; mid->name[0]; mid++) {
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
