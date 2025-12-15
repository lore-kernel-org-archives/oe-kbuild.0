Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D232A3C8
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 08:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788967; cv=none; b=QT8yyal3CPn5STeMJv3L35ajWmgxouBY9Rrw4CdsoiiOsAu8ZAiAdPyrGK2amc5fW6AsYN3bw2Pbi1c/jQdsfM3YxibHxNjPkBkyMTUAukQ7d2TwCy/WweBNcONxWbcJKG+sruHMor6DYwrbXPuOIZ6MvRZliki3N5IZg2+9soQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788967; c=relaxed/simple;
	bh=g/2Wxfy4EvsBb8UMJq1GZ6pC8hScpvDATZW2h+f56hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbjCDm04/yoOAWEhY3J43scn1B4IHWSgFbT14wWhciBvTzc6Z0A3/BICnLmRnKVBz1E5Q8bYyWmfwWtYxbbadgnyxhypiRyF0zAXkA0P89mPGGnDVGX9vjpZ2uXvK/ucKaB/oVBLdcdtaI2wFLzr95o9xI80DbALFyKzqJuFDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q19p+33e; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q19p+33e"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779a637712so21067765e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 15 Dec 2025 00:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765788961; x=1766393761; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpxYPL0HdtCrqLqGF5zUwqpO5ote7rY6HHFj6ESSu4k=;
        b=Q19p+33eBGwAzD4YVUeasn2IDuTRQUz+gQxxtNVXeMC4SUXX6BF0psyC/bIuobUPKI
         ESWhPLZbRz0EaNjCg3xAC5zX+Xe92qv5f9AMgP+0bP5ZWKJ7W8BHXpvFXiVC+Q3PDvxA
         NCpv/alJSXQrc8fynarC0N4IzhQe49Vq2VOFdYBD+pLTE+f90UePik304TAmaY7FaYWO
         dItM9ruOe7urlH8p0yd6xoFmWyY/lyXd3MlvgfKZ2bxP5sYt4Ej5Cw/zYxKCxjK7K7kA
         oIgTdaG/29vH0leVCo6FcxQuqbrq9F2jlOJNDr5fZZZaFhARa0lyLF1MicMiBIMwejBt
         G6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788961; x=1766393761;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpxYPL0HdtCrqLqGF5zUwqpO5ote7rY6HHFj6ESSu4k=;
        b=BfufnkWByn7jH0zhVTUZr0Wsl7KfWxLBeIaARmfljusCyXWIBXCrhCZHXpluRjIZf3
         QDPZDrwWhigAGBxbggmhEv/093a+wkShPvdviIre5nbGh54CsuGygJGUD96Zy+/xX1UZ
         BO7T9QdrwdVPOfLmdek41in1hoogIKtdLAfymVFD3mHSKDbRvbRuSIB1IH3aEfbB3F5r
         TN9n204iSVT0zelrP8UDjgjRiMELKJlIiPhuHcabDiNnzU2WtEo4nc0LET1U2htN4jqF
         ERb1KP296ERfhKdo9wtdWv8BUT9XksHg/KGWz4fML+UgAH1C6Niz1s5C1CHRUwoHllCO
         OCZg==
X-Gm-Message-State: AOJu0YxN619yUKBUHJuzeEZev5+rdHNza/oELxYvUieqOzTv4spXdVaw
	OFzwhE03XNpIs13jJ+SkqdqzDUIc3FH+ed898C9xovLNuFNxCFSXi/vHoT7zHRRK3Ej0DHWi9TN
	MgimK
X-Gm-Gg: AY/fxX54bVFUfj4PMg+XNIJNgPLwrsg0ACn3FzIxXrBOyxsXn4ok6phrNVNBMkO8cRg
	mXqm0HbriLW+9E4rArIl1+NmNWSfRPsJa4BDZzhXojDyJhyEiM/bwBvObtOfEdkSLmDfErFDKIb
	2OhBS9zB1BiA9Ag8/RkW5fQeUD/ChdWnlfgniVtEvDIQzdmmGuhkQ06gP7H5a1Tw2kHM4YC3+0j
	qwnhCWNy6Q+m6ApAM8XUQpJWvvYAT4UMEdlef5TuDYwwp25LecvfbyXPnGLpSOnqb7CUJZRt1hO
	/VHoLgIYQsK2wPMuZjm0Ekouv/DLXOBdp+iAiHGoqp+sVrmUyH2gfllVZkuutkb9IeiUGLRsevq
	0QMzTalUuyMGrk2Ry9apEMi1FYfHr1djSSoHQHkRb9HyIvFCb4KrvotvvMLhnlZUG260k8DDC1P
	B+CyJrkERCksSiDYe7jT47PhiuwiU=
X-Google-Smtp-Source: AGHT+IH9Vx9lRYuyM4i2CiUhArv9FtRXYRfsNl/RiYjV6a4nRnO+2fem7eDPYCjb74HIPXI2vc9U0Q==
X-Received: by 2002:a05:600c:4f90:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-47a8f9055bfmr92419345e9.19.1765788961213;
        Mon, 15 Dec 2025 00:56:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f721a61sm62296135e9.20.2025.12.15.00.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:56:00 -0800 (PST)
Date: Mon, 15 Dec 2025 11:55:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling
 ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
Message-ID: <202512131339.LMMvaF5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251215085557.C1cQ0-sCmoRH3qSMBTDucRo8JoeQC5gCvhF6rS3O1vE@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9551a26f17d9445eed497bd7c639d48dfc3c0af4
commit: aab12022b076f0b385b7a9a78e1161bd2df5d1e3 soundwire: bus: Add internal slave ID and use for IRQs
date:   7 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131339.LMMvaF5G-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131339.LMMvaF5G-lkp@intel.com/

smatch warnings:
drivers/soundwire/bus_type.c:108 sdw_drv_probe() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +108 drivers/soundwire/bus_type.c

9251345dca24b6 Vinod Koul           2017-12-14   81  static int sdw_drv_probe(struct device *dev)
9251345dca24b6 Vinod Koul           2017-12-14   82  {
9251345dca24b6 Vinod Koul           2017-12-14   83  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
9251345dca24b6 Vinod Koul           2017-12-14   84  	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
9251345dca24b6 Vinod Koul           2017-12-14   85  	const struct sdw_device_id *id;
9251345dca24b6 Vinod Koul           2017-12-14   86  	int ret;
9251345dca24b6 Vinod Koul           2017-12-14   87  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   88  	/*
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   89  	 * fw description is mandatory to bind
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   90  	 */
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   91  	if (!dev->fwnode)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   92  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   93  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   94  	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   95  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   96  
9251345dca24b6 Vinod Koul           2017-12-14   97  	id = sdw_get_device_id(slave, drv);
9251345dca24b6 Vinod Koul           2017-12-14   98  	if (!id)
9251345dca24b6 Vinod Koul           2017-12-14   99  		return -ENODEV;
9251345dca24b6 Vinod Koul           2017-12-14  100  
9251345dca24b6 Vinod Koul           2017-12-14  101  	/*
9251345dca24b6 Vinod Koul           2017-12-14  102  	 * attach to power domain but don't turn on (last arg)
9251345dca24b6 Vinod Koul           2017-12-14  103  	 */
9251345dca24b6 Vinod Koul           2017-12-14  104  	ret = dev_pm_domain_attach(dev, false);
29ffcc88f2065f Ulf Hansson          2018-04-26  105  	if (ret)
29ffcc88f2065f Ulf Hansson          2018-04-26  106  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  107  
aab12022b076f0 Charles Keepax       2025-04-29 @108  	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);

The SDW_FW_MAX_DEVICES macro is used here and also in sdw_irq_create().

	bus->domain = irq_domain_create_linear(fwnode, SDW_FW_MAX_DEVICES, ...

The ida_alloc_max() function an inclusive max so probably this should be
"SDW_FW_MAX_DEVICES - 1".

aab12022b076f0 Charles Keepax       2025-04-29  109  	if (ret < 0) {
aab12022b076f0 Charles Keepax       2025-04-29  110  		dev_err(dev, "Failed to allocated ID: %d\n", ret);
aab12022b076f0 Charles Keepax       2025-04-29  111  		return ret;
aab12022b076f0 Charles Keepax       2025-04-29  112  	}
aab12022b076f0 Charles Keepax       2025-04-29  113  	slave->index = ret;
aab12022b076f0 Charles Keepax       2025-04-29  114  
9251345dca24b6 Vinod Koul           2017-12-14  115  	ret = drv->probe(slave, id);
9251345dca24b6 Vinod Koul           2017-12-14  116  	if (ret) {
9251345dca24b6 Vinod Koul           2017-12-14  117  		dev_pm_domain_detach(dev, false);
aab12022b076f0 Charles Keepax       2025-04-29  118  		ida_free(&slave->bus->slave_ida, slave->index);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

