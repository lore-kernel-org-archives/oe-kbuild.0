Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD82F6911
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608769; cv=none; b=Ve17prUzx4EPpWpGqRznRZXirw8PwjurtYdGZGQbb3V78nHoOAhn+ybWUAEZlKncd6K/XMCgZB5JHS1s9PHlLtj4d6GvHwCrRPTj67aqGC/u4cNuGb0t5vy4D9LqcNyKs01jYKH9HDI+JjM6Mkl8R0nE43PyI2gLDGyzuitOPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608769; c=relaxed/simple;
	bh=cvlwbxmIeAAvLJrAFq5QpK+LSCHAkCYyPfpvjk2Yu/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s7DsApE29SUD8yHbgdMHuUhQHSXOF6S8FNT6l39vjyr1sYuEPqS7HkbU0YIFYod3UYW26X3ffNFSc17H81i5+uuro3VlbbotipE0Ew15bp7g1EN/BUHmtgP/v/VusXt//yoCUiyLnsUI4xZUbZINF0+X1B4YqKaxqZy/jsRW3iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1160H4v; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1160H4v"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so11556482f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 02:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608765; x=1768213565; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrKE3RtvwIXqgO/rTJsH4wddGdZnJd01QtpYZAosBLk=;
        b=A1160H4v0aiuc2bCAU1VlP++yKlLkA5gB52OETdJuStsZWQlNXG8pHuJYY9CURSfHQ
         r/7EQOkLX6V4pvJjqpyaexs+2PgvuonOgGHjpv1bYMbh5F2IMj90HTm3KUe5gPbhoy8s
         FVrjBcTiLDcDOYkQ1cLcHZvK9cD992RevBqkcqx3sWKN0VnSREwaxcWg5f3sW7VIp5pA
         NAPPtQF/r+jLGw+mQYLgJ2b60i2KP0Kxrp8mpJX23oxWtmEWQDbVu2O5itQ8o3nqwejl
         /ehyoxmOEelJzjQh97BMiRuU45SFbDBmsq7yOYRjIvkX85gd9IXMW4k3yFTg52xYs7ZM
         yyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608765; x=1768213565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qrKE3RtvwIXqgO/rTJsH4wddGdZnJd01QtpYZAosBLk=;
        b=hC+3DXkBb4OTk6dKCbQZi11anPLZiIGwl1olxEUJCMqkFPxZnugHwDbLTHwCuHpi6O
         u6wyINq+oqYUOtCjeWfuj3xv/vh3wfUq/qACAFxho0+lalfrrjuXWZxPgeBFVwzhTnuQ
         JLdHep9xvy+hwIGdQ7u6DpK3NHdNPL19jrERzphmWOK/V6cJJWSPJjsd3/PJwK1EoMXc
         dGvaKDZZqffa/cydC2fM48aU7kupMDbdiv6cvegjJyRV3Dedsxer4ZsN8LeEsnaRxVQp
         8dlx4prleyyb7EcqpPYQpUHZXzUyWL3BHBzsWhll+pqmanLUjtfPqBoZeTDMVfy/18PN
         maxg==
X-Gm-Message-State: AOJu0YwNlVE4IZPpKDb8IxSUxdwEZFX15NOS7djx4/3nJ8IozJArqGBK
	fzTdAFBY2tj1/eVNRIZqMzIzrdGizS/z2BKe/K/mP3zur9Y3aoHmMRyq//+IHJWh5nVO434njnB
	OTup6
X-Gm-Gg: AY/fxX7QqS5JMe/zYoCDKkvgqOVv5vW13RF/+HVB27MefsQRIHO06Twrfjhs/GuHuvE
	ZMTrgz95TYI4Ip148nNTqb+PBNnDXn029f0qRnEBHYlQl+/rA8CEZluTkDwT8TW/DZeW73m6AjY
	PAA+5sZmIb3MN7IMw7/ond1ZFxRA8GtGg48scLoE12KX60yuTgEQo0WX+FO8+EppbgQ+gmQm750
	M1T41Dpo7PDq3i0eYKaldNd20eOjWESkigUlXiLdGN9XteKeWJhBGDJYztPeE3jNZ/eOHszGwW5
	l9dQzRHzxRtjfczdpHZP7nlOc1XWbjwGFijtH3eaqGYLeUJiXLwA4R3Fl2VYasp4+/hUb6mG0r8
	of6kI9VhArI1IkiiOvu1VAa5XidX+GiMknaDMr/g8D9EUrV/xuEhexkj7JsAge3iHxFnxRnrJ1F
	Q5NePvwGkDpB8aBw/y31pbejqdJgI=
X-Google-Smtp-Source: AGHT+IGq4Muxh8/2+O3KRwbh3W9R0AA3hrTyGFKTq0/M0/9Q2+ICgXVn6qgIj/f4uMABpPQeMqPeTQ==
X-Received: by 2002:a05:6000:2503:b0:431:a33:d872 with SMTP id ffacd0b85a97d-4324e4c1219mr45539228f8f.8.1767608764916;
        Mon, 05 Jan 2026 02:26:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm99869153f8f.1.2026.01.05.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:26:03 -0800 (PST)
Date: Mon, 5 Jan 2026 13:26:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 5/5]
 drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of
 'gi->composite.gadget_driver.driver.name' (line 2048)
Message-ID: <202512221712.RohHSsdC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260105102600.70WIv25Zpzlpye717FeQUQdrGVboF_btJL9sRyjqwEE@z>

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3ce6827ad16244f83976f3267e13d63da0613660
commit: 957b40b3b769bc23db3d6491db267e3166f91316 [5/5] ANDROID: usb: gadget: configfs: Add Uevent to notify userspace
config: i386-randconfig-141-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221712.RohHSsdC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512221712.RohHSsdC-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/configfs.c:2050 gadgets_make() error: double free of 'gi->composite.gadget_driver.driver.name' (line 2048)

vim +2050 drivers/usb/gadget/configfs.c

88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2029  	gi->composite.gadget_driver = configfs_driver_template;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2030  
7c07553807c5125 Chanh Nguyen              2023-01-11  2031  	gi->composite.gadget_driver.driver.name = kasprintf(GFP_KERNEL,
7c07553807c5125 Chanh Nguyen              2023-01-11  2032  							    "configfs-gadget.%s", name);
7c07553807c5125 Chanh Nguyen              2023-01-11  2033  	if (!gi->composite.gadget_driver.driver.name)
7c07553807c5125 Chanh Nguyen              2023-01-11  2034  		goto err;
7c07553807c5125 Chanh Nguyen              2023-01-11  2035  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2036  	gi->composite.gadget_driver.function = kstrdup(name, GFP_KERNEL);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2037  	gi->composite.name = gi->composite.gadget_driver.function;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2038  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2039  	if (!gi->composite.gadget_driver.function)
7c07553807c5125 Chanh Nguyen              2023-01-11  2040  		goto out_free_driver_name;
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2041  
957b40b3b769bc2 Neill Kapron              2024-02-01  2042  	if (android_device_create(&gi->cdev.android_opts))
957b40b3b769bc2 Neill Kapron              2024-02-01  2043  		goto out_free_driver_name_and_function;
957b40b3b769bc2 Neill Kapron              2024-02-01  2044  
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2045  	return &gi->group;
7c07553807c5125 Chanh Nguyen              2023-01-11  2046  
7c07553807c5125 Chanh Nguyen              2023-01-11  2047  out_free_driver_name:
7c07553807c5125 Chanh Nguyen              2023-01-11 @2048  	kfree(gi->composite.gadget_driver.driver.name);

Freed.

957b40b3b769bc2 Neill Kapron              2024-02-01  2049  out_free_driver_name_and_function:
957b40b3b769bc2 Neill Kapron              2024-02-01 @2050  	kfree(gi->composite.gadget_driver.driver.name);

Double freed.

957b40b3b769bc2 Neill Kapron              2024-02-01  2051  	kfree(gi->composite.gadget_driver.function);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2052  err:
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2053  	kfree(gi);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2054  	return ERR_PTR(-ENOMEM);
88af8bbe4ef7810 Sebastian Andrzej Siewior 2012-12-23  2055  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

