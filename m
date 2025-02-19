Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D1F1BCA19
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Feb 2025 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739949942; cv=none; b=jrktDUkepPSdCpqcLX5Q9e17P4D+J79uVv10f27WXM35OUXtdPaK4D7YlzCBB4UWNxnvEim5SVT19uMJ15rMYnn9FA24Lormg2u8BnWRE5gkms3B7uf1V4miEuzuF98Jj2PKmCJ6nr4NpIgcE4Hm+fOLtdDvoBIio3bK/0KShl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739949942; c=relaxed/simple;
	bh=GKHD7pycGyC4VpX6u+lp8ObPpzywYSsF54CZ2Bf6uvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/H3GxciFmt4AH9Pp5fic0TjUrz5gH1sRtAnNlT8yCucmer3J66uz1TsNTKluH6LOCya+yURdDtIRfsABpV4ywyYRcNewC438GxlfUEUh2WA/ARDhTHNxzZypb0x0ltC/ieWGLV3rWeJSGepiQfeZu5OqhkQjcb+CEIDR64J/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYFM1sFh; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYFM1sFh"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb79af88afso707104066b.1
        for <oe-kbuild@lists.linux.dev>; Tue, 18 Feb 2025 23:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739949938; x=1740554738; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vgjFNxDvFnqKq0XzeP/mA+njytVUD0g2LEKwHJkgX0=;
        b=lYFM1sFhUfXHSEr9pDJib3A7IYhM8Fx8BIlvWWLXcmRXG7A6/weDEQX9qISs5OoZ++
         YetQWYZltEvbpYFRp/lRw6vjRV5op96PaobPqKWREoz5fa7LVtuBmDqqbILDEX3L7ONs
         zCv6sbnaUDvnfpUD1rqLQo2aseqrySYUZP2p74bvGJX5t3skPROw1gy6ZIWrVa/W/eQ6
         yzDNy2Q8sa5vxWDlQ8Dp5jaReIOHZer8Erpmft5UoFzMKALcmp31vJ6Mz4jzKg6PzEqJ
         Acwbmddrb+QHFBM4vrrrFkfLqRmuBeFUU5uTZBU3iMg0LLyLSXmlmSk+AS5Ha+NTWCwI
         SuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739949938; x=1740554738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vgjFNxDvFnqKq0XzeP/mA+njytVUD0g2LEKwHJkgX0=;
        b=dEBVerQQ0+jJDOXWdeIJngWc2W55gleH6z+5JDQ3YqZJVxbTnqJqOg4qQd6+wStUDb
         xNMU+UzdycygAoOP0LFUuSbIZVNRNyTfqF3Ud19mNoYwVf8uETcIY6lMdHlC6Qw6j9TP
         +9jwR9M+swkrtw38/CTP4gr7XTvvR6FSDJRAeXlvZWdT+5svseWKBEAPpocOaG2YkqM0
         jpqr/iMtlDf6eeUCD96TXNm2UBXX75z7euDGjvz1NvbQVA6cA6zTsWUQmeXZUcZXPQBS
         cEGLk7cMCmuajl4OaLO3kDXFuuaS6EpvC6+fc/fTObP9xWAKE/L6YDcS7MI3KbiYmqub
         8EDg==
X-Gm-Message-State: AOJu0YxSfDMlGGfmtyNu1m6zUCErPxl5DXmUc7/KIc9VLKmUsSkfUZIJ
	tPmAJhJaRPng5IcezUIQLuN5f2wqZo2BDsXRRy90lAOHky6QIEXQ8y9ZaMIldisBM8Y+y7Velee
	C
X-Gm-Gg: ASbGnctBZ0iNhPkUKwmXCizOj+DFPLi+ingFJB4ANaC7A7jUSkvu+9gYLCQnEGala3l
	jo5PP9ELgj/UfCL5frV1Ozgd4wWztmpvTLc5KNKZwYL8MdpjMjnPaO44O8U31KUKKuZLzn3sMr9
	/0R6+7YPbZlXs1oJnaxH/t9pAHL8vRYary4Kl5nWJQQwruQUtz6jZORw4k0MWnF50aiSc3ShoNT
	VN0k/s0/DEpoxqQa63Ug5hLu48HoOUHiV80eIVggoHNug5c9GGBq1gnNu27Vs6iQqJEoinyFukv
	VGHqBMyvzm2z5Ft9QUZW
X-Google-Smtp-Source: AGHT+IHGTmbr/lO1Te/jKG4jDSNzj0mmFwRx7uJ0H0FTMudx0Gb3qlrjQsPfEx+7UOZ6ZIxz6htZvQ==
X-Received: by 2002:a17:906:4794:b0:ab7:6369:83fa with SMTP id a640c23a62f3a-abb70c32194mr1862836166b.33.1739949938148;
        Tue, 18 Feb 2025 23:25:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbac3242dcsm390503766b.107.2025.02.18.23.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 23:25:37 -0800 (PST)
Date: Wed, 19 Feb 2025 10:25:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sven Peter <sven@svenpeter.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/170-atcphy 5/16] drivers/phy/apple/atc.c:2156
 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) =>
 (0-u32max > u32max)'
Message-ID: <46fb5538-5fcf-4a81-9f22-70d85414e669@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   d9133ae802014bca51082790e834546f42d21231
commit: 6dcc9a0b2ca8beb8f112cdf4a06be2a70b83111b [5/16] WIP: phy: apple: Add Apple Type-C PHY
config: sparc-randconfig-r071-20250218 (https://download.01.org/0day-ci/archive/20250219/202502191004.5HCUpXEb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502191004.5HCUpXEb-lkp@intel.com/

New smatch warnings:
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(offset > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2156 atcphy_parse_new_tunable() warn: impossible condition '(mask > (~0)) => (0-u32max > u32max)'
drivers/phy/apple/atc.c:2157 atcphy_parse_new_tunable() warn: impossible condition '(value > (~0)) => (0-u32max > u32max)'

Old smatch warnings:
drivers/phy/apple/atc.c:1609 atcphy_usb3_power_on() warn: inconsistent returns '&atcphy->lock'.

vim +2156 drivers/phy/apple/atc.c

6dcc9a0b2ca8be Sven Peter 2022-11-30  2114  static int atcphy_parse_new_tunable(struct apple_atcphy *atcphy,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2115  				    struct atcphy_tunable *tunable,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2116  				    const char *name)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2117  {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2118  	struct property *prop;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2119  	u64 *fdt_tunable;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2120  	int ret, i;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2121  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2122  	prop = of_find_property(atcphy->np, name, NULL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2123  	if (!prop) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2124  		dev_err(atcphy->dev, "tunable %s not found\n", name);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2125  		return -ENOENT;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2126  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2127  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2128  	if (prop->length % (4 * sizeof(u64)))
6dcc9a0b2ca8be Sven Peter 2022-11-30  2129  		return -EINVAL;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2130  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2131  	fdt_tunable = kzalloc(prop->length, GFP_KERNEL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2132  	if (!fdt_tunable)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2133  		return -ENOMEM;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2134  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2135  	tunable->sz = prop->length / (4 * sizeof(u64));
6dcc9a0b2ca8be Sven Peter 2022-11-30  2136  	ret = of_property_read_variable_u64_array(atcphy->np, name, fdt_tunable,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2137  						  tunable->sz, tunable->sz);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2138  	if (ret < 0)
6dcc9a0b2ca8be Sven Peter 2022-11-30  2139  		goto err_free_fdt;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2140  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2141  	tunable->values = devm_kcalloc(atcphy->dev, tunable->sz,
6dcc9a0b2ca8be Sven Peter 2022-11-30  2142  				       sizeof(*tunable->values), GFP_KERNEL);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2143  	if (!tunable->values) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2144  		ret = -ENOMEM;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2145  		goto err_free_fdt;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2146  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2147  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2148  	for (i = 0; i < tunable->sz; ++i) {
6dcc9a0b2ca8be Sven Peter 2022-11-30  2149  		u32 offset, size, mask, value;

This should be declared as u64.

6dcc9a0b2ca8be Sven Peter 2022-11-30  2150  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2151  		offset = fdt_tunable[4 * i];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2152  		size = fdt_tunable[4 * i + 1];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2153  		mask = fdt_tunable[4 * i + 2];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2154  		value = fdt_tunable[4 * i + 3];
6dcc9a0b2ca8be Sven Peter 2022-11-30  2155  
6dcc9a0b2ca8be Sven Peter 2022-11-30 @2156  		if (offset > U32_MAX || size != 4 || mask > U32_MAX ||
6dcc9a0b2ca8be Sven Peter 2022-11-30 @2157  		    value > U32_MAX) {

The current code truncated invalid values instead of returning -EINVAL.

6dcc9a0b2ca8be Sven Peter 2022-11-30  2158  			ret = -EINVAL;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2159  			goto err_free_values;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2160  		}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2161  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2162  		tunable->values[i].offset = offset;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2163  		tunable->values[i].mask = mask;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2164  		tunable->values[i].value = value;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2165  	}
6dcc9a0b2ca8be Sven Peter 2022-11-30  2166  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2167  	trace_atcphy_parsed_tunable(name, tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2168  	kfree(fdt_tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2169  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2170  	BUG_ON(1);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2171  	return 0;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2172  
6dcc9a0b2ca8be Sven Peter 2022-11-30  2173  err_free_values:
6dcc9a0b2ca8be Sven Peter 2022-11-30  2174  	devm_kfree(atcphy->dev, tunable->values);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2175  err_free_fdt:
6dcc9a0b2ca8be Sven Peter 2022-11-30  2176  	kfree(fdt_tunable);
6dcc9a0b2ca8be Sven Peter 2022-11-30  2177  	return ret;
6dcc9a0b2ca8be Sven Peter 2022-11-30  2178  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

