Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DF01B5EB5
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757760027; cv=none; b=brQ1I2aLK+r990aNft7KxNCuex9O4/MRu2CNZNIa22ylzMGQT5iDQ0/uQAIgJI3BreFxJVYM9zn7GDWZlmGZHx6TZri7rDC+U+fQQfT5Vb26+XHG0VRj690AgnCXROaeIM+v7JgQf4QEY6gzCXW5Rp87elldZnKXX9p6ZRwZwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757760027; c=relaxed/simple;
	bh=kLtfXPmYB+KuknDSpxhRC0+QZLQkjemtqDVqdfuRcDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GkZsxWaSlCCqWqXEA/4CjDlRIuILPuVw3taLKaWSN28UYrjtf1es0y9auSGetdkWV6PV46VJypnb7omS16eqv1zofw5LXK6kig9JU7XQAQBBAiE6aH/3nLcF1XTmJXDUVVXIZUA+NT4D5Csakx9P3GEa1epsfE9wIABpqGfE+88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CxpEv6qp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxpEv6qp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso22087465e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 03:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757760024; x=1758364824; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5BKHucIFgOXz7a9j2WPAjvN/qO0vCK/Y//j+sYjdTs=;
        b=CxpEv6qp8+5XzKoE0eH94mgVB8eopsf1ZEb3zQBM9/xlyMHoLgP1LsaCz2lyt0fiZp
         6xB3V6FrQmjk8rmi/83PHx2hldc5bFTRnRGWkHIJen3Or6hxKhprtKcsz0+vjwqsd6yz
         0S1Xqrwwc/dGnXhG3xzg9UWtT2Uy6phtWEnGaiQfUcXJ2d9R/4r3btd/fbEazHYLcKIU
         Ov8P93ZNnpHVKejCA5IzyjkJ4k0CseyzgURfNQrGuXVfA0B4BTQRaDjbm44jX6R96+fj
         CZTBt3BkNGFoghslodYPbB/bmMcHrMqaWJ1FL8U93pNZwcv5CDLwtcgSBKxwnON2Vjc5
         h13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757760024; x=1758364824;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5BKHucIFgOXz7a9j2WPAjvN/qO0vCK/Y//j+sYjdTs=;
        b=IqLaHHhnGfH2bTiZ9lJjqApW1xLJYpKLXWsBufRuZA6pY9YJxMNrYvGFCx5GIiKP03
         QDEVQA9PMqoD90DURtgbn6IsQaVFPTm3WsjFMILo7ycFAMbm1WUxFoT0DpMe7hrz/Vcv
         Vpxwh13FlScUXuVCyaOxFgJj70/plSD27P2RzBQqGRif+cj0Ky3yt9gwKRpq1KxqvqoS
         wSGQPLXVNzXuVvRutNGC5N6ZNKbGjddGOVlPWKgDQbdSrW8jlRFGDq2bz7KP2bW7wrII
         Jd0DCXzYztF7YQ7wO5+uSO0gaGOKDHSSwQNktFEZIcUUZ4W/gbLAkye/Wsy6rZTHF/W+
         5wkg==
X-Gm-Message-State: AOJu0YzdvV0QrNWG+dd3kXASA4wApTZMT2ElFS8A5Me2lVrkA3Nso9Jx
	6Utk14Dg22BN+bDMdt2RMMiaVClEunPjaKUASJEJOOOiTlT0Zzrq4Mz+O6kj1GaJ4K0oT8jIgLP
	MYGBa
X-Gm-Gg: ASbGncsYsYETSMrJZoduOfpYZxWi0VCnlhyviM54tprJ53e1x5R6gnDbxwAvu5jK9Fk
	nDFalZ/r3YFtQRSsVDDUrF3dp9S+jIahFaDobmgcFmtTaf9blsXIgJWxOu2f2LRz7gwmoNK1LBh
	wt9zjlW0VhVy9cSP4Ce2OhF7uplw4qmZp5a28Fjflq2fbC8iJ8QGGTCQK/9y0L8K/NF1VbqMTIk
	JKk8SC/JV9PawUUOI20dEh4EF3MxM+dS/eqffLxrvChhRYO6uOEQIYCQMHgkLgBPqD7efT816zJ
	hXfLE7OMdTIkNGAKzhwkPo7xmi6SsTnpxn2efGgZ6+O4dYr2zpgGQzwbcxJtfxQj4wfdC/XwUBh
	nGEBPnxqkXmE8WNXmrV+QZfrBf8cT/YMxoIr6GQ==
X-Google-Smtp-Source: AGHT+IHFJxrzI0YL0T7zVE7ndW1CIlLUCogNKauwgyVBmxPQ6MPyzkLA+lkEvAB7y7kgI/P1W/YdPg==
X-Received: by 2002:a05:600c:3b87:b0:45d:dba1:b4d3 with SMTP id 5b1f17b1804b1-45f2576b108mr32072105e9.0.1757760023963;
        Sat, 13 Sep 2025 03:40:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607cd6absm9944380f8f.34.2025.09.13.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:40:23 -0700 (PDT)
Date: Sat, 13 Sep 2025 13:40:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Stefan Binding <sbinding@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:20250912_sbinding_support_reading_subsystem_id_from_device_tree
 2/2] sound/soc/codecs/cs35l41.c:1163 cs35l41_get_system_name() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202509131704.J6ztKjC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250913104020.14ok00Te_U4AoXtbtzEoHv24ugKtNPBnBWqvlXeWgUQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250912_sbinding_support_reading_subsystem_id_from_device_tree
head:   6a7fa83fafcf594a3d2454b15afbae4e09c804fc
commit: 6a7fa83fafcf594a3d2454b15afbae4e09c804fc [2/2] ASoC: cs35l41: Fallback to reading Subsystem ID property if not ACPI
config: i386-randconfig-141-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131704.J6ztKjC1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509131704.J6ztKjC1-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/cs35l41.c:1163 cs35l41_get_system_name() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1163 sound/soc/codecs/cs35l41.c

6a7fa83fafcf59 Stefan Binding 2025-09-12  1151  static int cs35l41_get_system_name(struct cs35l41_private *cs35l41)
c1ad138822a1be Stefan Binding 2022-07-07  1152  {
1d44a30ae3f919 Stefan Binding 2025-02-05  1153  	struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1154  	const char *sub = NULL;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1155  	const char *tmp;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1156  	int ret = 0;
c1ad138822a1be Stefan Binding 2022-07-07  1157  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1158  	/* If there is no acpi_device, there is no ACPI for this system, skip checking ACPI */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1159  	if (adev) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1160  		acpi_handle handle = acpi_device_handle(adev);
c1ad138822a1be Stefan Binding 2022-07-07  1161  
c1ad138822a1be Stefan Binding 2022-07-07  1162  		sub = acpi_get_subsystem_id(handle);
6a7fa83fafcf59 Stefan Binding 2025-09-12 @1163  		ret = PTR_ERR(sub);

It's strange to me to see this warning that "sub" is NULL...  That seems
wrong since as far as I can see it's always valid or an error pointer.
But also the code is wrong.  This was supposed to be PTR_ERR_OR_ZERO()

6a7fa83fafcf59 Stefan Binding 2025-09-12  1164  		if (ret) {

In the current code ret will always be true.

6a7fa83fafcf59 Stefan Binding 2025-09-12  1165  			sub = NULL;
1d44a30ae3f919 Stefan Binding 2025-02-05  1166  			/* If no _SUB, fallback to _HID, otherwise fail */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1167  			if (ret == -ENODATA) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1168  				tmp = acpi_device_hid(adev);
1d44a30ae3f919 Stefan Binding 2025-02-05  1169  				/* If dummy hid, return 0 and fallback to legacy firmware path */
6a7fa83fafcf59 Stefan Binding 2025-09-12  1170  				if (!strcmp(tmp, "device")) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1171  					ret = 0;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1172  					goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1173  				}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1174  				sub = kstrdup(tmp, GFP_KERNEL);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1175  				if (!sub) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1176  					ret = -ENOMEM;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1177  					goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1178  				}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1179  			}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1180  		}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1181  	} else {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1182  		if (!device_property_read_string(cs35l41->dev, "cirrus,subsystem-id", &tmp)) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1183  			sub = kstrdup(tmp, GFP_KERNEL);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1184  			if (!sub) {
6a7fa83fafcf59 Stefan Binding 2025-09-12  1185  				ret = -ENOMEM;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1186  				goto err;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1187  			}
6a7fa83fafcf59 Stefan Binding 2025-09-12  1188  		}
c1ad138822a1be Stefan Binding 2022-07-07  1189  	}
c1ad138822a1be Stefan Binding 2022-07-07  1190  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1191  err:
6a7fa83fafcf59 Stefan Binding 2025-09-12  1192  	if (sub) {
c1ad138822a1be Stefan Binding 2022-07-07  1193  		cs35l41->dsp.system_name = sub;
6a7fa83fafcf59 Stefan Binding 2025-09-12  1194  		dev_info(cs35l41->dev, "Subsystem ID: %s\n", cs35l41->dsp.system_name);
6a7fa83fafcf59 Stefan Binding 2025-09-12  1195  	} else
6a7fa83fafcf59 Stefan Binding 2025-09-12  1196  		dev_warn(cs35l41->dev, "Subsystem ID not found\n");
c1ad138822a1be Stefan Binding 2022-07-07  1197  
6a7fa83fafcf59 Stefan Binding 2025-09-12  1198  	return ret;
b19181638182d1 Stefan Binding 2025-02-10  1199  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

