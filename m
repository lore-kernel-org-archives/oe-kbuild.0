Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC018E2E
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHvj6o5B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3316bb1303bso1776556f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 04:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700482213; x=1701087013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS36oLotij0tVUHAFPCkN5+chgBCtn4SQxZS9m139l0=;
        b=IHvj6o5Bj3Sp1UIrT2AyETFzhznP1xPkOtKPdIeH8oKjbap7Ji6OzSvGrlMNAYUmgI
         dKJR+t/O8HOqYsriclnaFECqGuvIOqNmUtTXXOp+q6KOLdY8Uk8t9NGNLVZo1dh0sgtE
         22xBnmzN2U8VZAEeEFU6vP6j2HSoIGjR+OvbuM75DTQUAKC8EsOtCI6jwQ+IFDQIyfep
         Qj2rsXccP+lBrfTqHhuOXEeQrUJHSktibM51dBc3hwtAAGufsralDVio/8H42m62eaY9
         cYiSrJG8B/TulBuYzuq2MqqCmj8sVvXAy7xpELEI1zDmPOjc0mz5Ak6dGT3t+JWh04qS
         5DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700482213; x=1701087013;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS36oLotij0tVUHAFPCkN5+chgBCtn4SQxZS9m139l0=;
        b=p9mtqM4fpnuU4QrRN02DDjHXA4yRFY2yhdIyo9Qn6S/fYS8InVt4w0tNMqrDQt2BCX
         +6cg2fsVgawe5tsKO6AIGy6MhYowQ/QgHMJvVHD6kv6sOp/0mDal0mf461WxYq2fYgpp
         k/Triz/fd9Dnco8rh2HZbtjBv5Tg5RxESplpOjaD1NSUHmkBoe+mdt1TYOkZKSYRcOqT
         Cy8ElLxCLIu4UVwfVEiDJC8miFnMQ5WMqAIML/lfex6KjGJB/rg7w4tgHL8wilisWPT8
         3A3vguLcGt7PCFyxqHQZWdONrSRLQmsBR6W/Y4IpbldYsQmtYMyQvt///o78ntqfI6eY
         eXtA==
X-Gm-Message-State: AOJu0YwumZ2Jhb9XnTaUykfc8JaJcwD2+Pww6sDiNJSLiA40zg2MVCdc
	x7i5Lij0xnDxLQoR0lPqE0YcpFHnAqZbibdrmFw=
X-Google-Smtp-Source: AGHT+IEAc+7DnU+zQRiFX6lokbetp4JWQwWelJ6KkGXdipUCH1OQi/JBnWUP/lNPhPgciIgsW0sYsg==
X-Received: by 2002:a5d:47ce:0:b0:332:c31b:249e with SMTP id o14-20020a5d47ce000000b00332c31b249emr2904421wrc.55.1700482212756;
        Mon, 20 Nov 2023 04:10:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d4a8d000000b00332cbd59f8bsm393192wrq.25.2023.11.20.04.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:10:12 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Nov 2023 07:10:09 -0500
To: oe-kbuild@lists.linux.dev, Nuno Sa <nuno.sa@analog.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, Nuno Sa <nuno.sa@analog.com>,
	Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <63effee3-359b-48a5-b5a4-36b0478f6045@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110151905.1659873-3-nuno.sa@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa/dt-bindings-hwmon-Add-LTC4282-bindings/20231110-232017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231110151905.1659873-3-nuno.sa%40analog.com
patch subject: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
config: i386-randconfig-141-20231112 (https://download.01.org/0day-ci/archive/20231113/202311130219.YBiF8Xu3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231113/202311130219.YBiF8Xu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311130219.YBiF8Xu3-lkp@intel.com/

smatch warnings:
drivers/hwmon/ltc4282.c:859 ltc4282_is_visible() warn: signedness bug returning '(-524)'
drivers/hwmon/ltc4282.c:1143 ltc4282_gpio_setup() warn: passing zero to 'dev_err_probe'

vim +859 drivers/hwmon/ltc4282.c

31ea069ddf481b Nuno Sa 2023-11-10  844  static umode_t ltc4282_is_visible(const void *data,
31ea069ddf481b Nuno Sa 2023-11-10  845  				  enum hwmon_sensor_types type,
31ea069ddf481b Nuno Sa 2023-11-10  846  				  u32 attr, int channel)
31ea069ddf481b Nuno Sa 2023-11-10  847  {
31ea069ddf481b Nuno Sa 2023-11-10  848  	switch (type) {
31ea069ddf481b Nuno Sa 2023-11-10  849  	case hwmon_in:
31ea069ddf481b Nuno Sa 2023-11-10  850  		return ltc4282_in_is_visible(data, attr);
31ea069ddf481b Nuno Sa 2023-11-10  851  	case hwmon_curr:
31ea069ddf481b Nuno Sa 2023-11-10  852  		return ltc4282_curr_is_visible(attr);
31ea069ddf481b Nuno Sa 2023-11-10  853  	case hwmon_power:
31ea069ddf481b Nuno Sa 2023-11-10  854  		return ltc4282_power_is_visible(attr);
31ea069ddf481b Nuno Sa 2023-11-10  855  	case hwmon_energy:
31ea069ddf481b Nuno Sa 2023-11-10  856  		/* hwmon_energy_enable */
31ea069ddf481b Nuno Sa 2023-11-10  857  		return 0644;
31ea069ddf481b Nuno Sa 2023-11-10  858  	default:
31ea069ddf481b Nuno Sa 2023-11-10 @859  		return -ENOTSUPP;

This function returns umode_t (which must be unsigned and smaller than
int for this warning to trigger).

31ea069ddf481b Nuno Sa 2023-11-10  860  	}
31ea069ddf481b Nuno Sa 2023-11-10  861  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

