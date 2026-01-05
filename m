Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960933CE92
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767611720; cv=none; b=JRDwaxl+qfv9GFDyJA7RZ2MFkwNn6ROxyO0TBIp73sOUAtO2If64M5GR3U90mbPYPpQHGcxcWsuxJPw63QUfNdzQrbrpB/dzjRKCPWuGiTPZU3YmKwzae6IR4cKfBBgf8iCoAYY6hLia4JAhLEonNIigwFzIdH2BsnmRCZuIgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767611720; c=relaxed/simple;
	bh=0kDcymjq+o/D1vvB6qbAMa4ADp5xiX6lMJecLvFNBBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TnbwQ5n3geDd9wFYJZRcrSueOfydAPOiCF5B2jrd0U7RcIOi9rrKLGp3hEnnl33uS39YNAqR9ZlQiClby94/MIbTXUZmhDrt35fCnU/xsvP3pQekfmjlcQI6F33inLE3ZHDOwWlAR3KPCWICwIGNYDwcg13WRDXmYrhhCyAzBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aPsNB1bC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aPsNB1bC"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d3ba3a4deso46846755e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 03:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767611717; x=1768216517; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKVmfhHjbGUvqsnpsCY/VLq6NWt+vGOrMbqRldfQg/Y=;
        b=aPsNB1bCW642v+MIcLxuOX04aYo+xV4AnMao4+0+dygRbskDDjSNJbFyIFbQ9O5QPZ
         nMNUIvn974nwdO6Nk4stp3BgYoIOy8dNNYxGsL/D7RkhJVI0dumSomzmdGQmmajcdYGD
         Gx9waUA1d+grr83tQ2pDFLKdUWXBxdBsU3+009cXcKhyeHcTh8daS7eQGkTDrWreC+VQ
         x2Z1TOCDo7OBTqwXyFbZhgmJn3S/Fru7Wf6hzmq1QardArNxFzGuSZuIyyEidERTi55X
         IafI+iEFfKvroPcnhOtqJA7m2t2a6ZyVpygqOOO42hxUkafKE8g71nzOBTSO/VLMgY0m
         7apA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767611717; x=1768216517;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKVmfhHjbGUvqsnpsCY/VLq6NWt+vGOrMbqRldfQg/Y=;
        b=ibtWBoc0p0TwV82Ju0VYkLWwmoFBczt4ui6mNlwyoOE41tUKJjTs16X9ghnRZeqVSF
         CktjoGva8SNfIuGOMzX8L3veafxcBJlEdVe424Zg+lRZq3VAcxdLLncQX+6Jx9ofbosT
         HIS4T4GKh1tA/rN04h2eh9xLrNghvy/SwmRogetXt4KfVf0bOobHDSqA5ueLi+od6qw+
         FnMWBOjH91nm/2Rii7xBYcYw/5F+SR7FcQ9PYqwe0mMDG2URp7oh5moGm76onp63qpah
         VWNba2tHgajsR+fuQKOIvA6OdiY2FfJgHHVnwBQZN/P5SNsvW38iBBpqeWRyQJLK+iuC
         2edg==
X-Gm-Message-State: AOJu0Yxqsg6wYbI4X0CUrN1CupAHDt177an6KiIMFDaQ1glvFahkRM4z
	tScQGPoQWzeGZ10lfR/CYvPGFRlgdUberEU5QpZzbryMHXTprRglp2lnoGWw7hihxx/W88rdL38
	mbGA6
X-Gm-Gg: AY/fxX6eWtfegqWooZtSflkait0F/8NaVJ/I3LgdT8Vd9zbzaRwB6uOBx5uwORLTbDI
	Tqr/DxN9CRkNeEJdv+5f6ep5npGpC2Eyl2cagDERtIyU9TC3iAzWuM2eAzDsuVOJY6n79RL2q07
	5uMtybC1ilhPu7U/UAsSXtos71lbtP9eWtg5MOrO1DjGZZsuWov0frrF5jS7yg7aCcapzTAJgDY
	IHzeKBFTAP0uU0nNCg5LYALoMKL2SSclNQNJdRMeNxaqhHNMbav9B8dqw8UpFM/ZvVO3a5W1yQX
	Es5drwe3fswno/ISJz6MlCDQMBfL82+siETuI4bggAG+pTP+tCRIWIrFXCs2ZU6KAyDJWQozZHZ
	wB9viJOtlfXeEHFccZtUPukU8wPYbAlPAslF7eeVdSu13bIj0Ka1p/0NtXOPsLJvdx6JT5eknml
	oO/R7aH8z2UISXBNdq
X-Google-Smtp-Source: AGHT+IFLXEfSuIwnX/Qmm1uj6voVgb9TFrw3CDh1dWAe0goYosUym3lJQPWCK99UqpsGSqfrzBVHfg==
X-Received: by 2002:a05:600c:1d0b:b0:477:b0b9:312a with SMTP id 5b1f17b1804b1-47d195498a2mr529711545e9.7.1767611716735;
        Mon, 05 Jan 2026 03:15:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d33e2f4sm144597345e9.11.2026.01.05.03.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 03:15:16 -0800 (PST)
Date: Mon, 5 Jan 2026 14:15:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [vkoul-soundwire:next 5/7] drivers/soundwire/bus_type.c:102
 sdw_bus_probe() error: Calling ida_alloc_max() with a 'max' argument which
 is a power of 2. -1 missing?
Message-ID: <202512240450.hlDH3nCs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Message-ID: <20260105111513.6CC_DUzbarKmU8iUY9erG49npdbuND8nk-5uo7OuSzU@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git next
head:   c6f1e99ab03c5a94ed6389f5930e91f274b3ba67
commit: 866160a51f5586d53e17ceab36029c8805ffea28 [5/7] soundwire: Use bus methods for .probe(), .remove() and .shutdown()
config: i386-randconfig-141-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240450.hlDH3nCs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512240450.hlDH3nCs-lkp@intel.com/

smatch warnings:
drivers/soundwire/bus_type.c:102 sdw_bus_probe() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?

vim +/max +102 drivers/soundwire/bus_type.c

866160a51f5586 Uwe Kleine-König     2025-12-15   75  static int sdw_bus_probe(struct device *dev)
9251345dca24b6 Vinod Koul           2017-12-14   76  {
9251345dca24b6 Vinod Koul           2017-12-14   77  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
9251345dca24b6 Vinod Koul           2017-12-14   78  	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
9251345dca24b6 Vinod Koul           2017-12-14   79  	const struct sdw_device_id *id;
9251345dca24b6 Vinod Koul           2017-12-14   80  	int ret;
9251345dca24b6 Vinod Koul           2017-12-14   81  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   82  	/*
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   83  	 * fw description is mandatory to bind
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   84  	 */
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   85  	if (!dev->fwnode)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   86  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   87  
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   88  	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   89  		return -ENODEV;
fcb9d730be1d30 Srinivas Kandagatla  2020-09-24   90  
9251345dca24b6 Vinod Koul           2017-12-14   91  	id = sdw_get_device_id(slave, drv);
9251345dca24b6 Vinod Koul           2017-12-14   92  	if (!id)
9251345dca24b6 Vinod Koul           2017-12-14   93  		return -ENODEV;
9251345dca24b6 Vinod Koul           2017-12-14   94  
9251345dca24b6 Vinod Koul           2017-12-14   95  	/*
9251345dca24b6 Vinod Koul           2017-12-14   96  	 * attach to power domain but don't turn on (last arg)
9251345dca24b6 Vinod Koul           2017-12-14   97  	 */
d42c7c6fd66a6e Claudiu Beznea       2025-07-03   98  	ret = dev_pm_domain_attach(dev, 0);
29ffcc88f2065f Ulf Hansson          2018-04-26   99  	if (ret)
29ffcc88f2065f Ulf Hansson          2018-04-26  100  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  101  
aab12022b076f0 Charles Keepax       2025-04-29 @102  	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);

SDW_FW_MAX_DEVICES - 1

aab12022b076f0 Charles Keepax       2025-04-29  103  	if (ret < 0) {
aab12022b076f0 Charles Keepax       2025-04-29  104  		dev_err(dev, "Failed to allocated ID: %d\n", ret);
aab12022b076f0 Charles Keepax       2025-04-29  105  		return ret;
aab12022b076f0 Charles Keepax       2025-04-29  106  	}
aab12022b076f0 Charles Keepax       2025-04-29  107  	slave->index = ret;
aab12022b076f0 Charles Keepax       2025-04-29  108  
9251345dca24b6 Vinod Koul           2017-12-14  109  	ret = drv->probe(slave, id);
9251345dca24b6 Vinod Koul           2017-12-14  110  	if (ret) {
aab12022b076f0 Charles Keepax       2025-04-29  111  		ida_free(&slave->bus->slave_ida, slave->index);
9251345dca24b6 Vinod Koul           2017-12-14  112  		return ret;
29ffcc88f2065f Ulf Hansson          2018-04-26  113  	}
56d4fe31af77f6 Vinod Koul           2017-12-14  114  
3dca1f89ae3455 Richard Fitzgerald   2023-01-23  115  	mutex_lock(&slave->sdw_dev_lock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

