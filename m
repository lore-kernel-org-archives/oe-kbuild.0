Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A10D3148A1
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766755376; cv=none; b=T5SxL5kpyGW5Aynr8sTm9JUdb31dZYt9RgW7Rr3dvdXzFzGTHp96edOZVCPC4aUzPjnK3t4THRXRfnc5vgvsDEmAYAhQp4UKkzFxZpvLcipNtzbX0i3W9XZvvf+9tMzlVUk1WSFpjfCxAjr9RpWCt+1otOYS8aYmQNxDMny6zoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766755376; c=relaxed/simple;
	bh=sdWTGo4OaNt22nmWPtpcoHVI7/BhTyNzY+Rh659PxOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGAXvPAN67WaWXybBKqBxCORdrbqdbzxDqhpC8gnvKzmEScKKh8D4axHK5ZylJR4DX8NIlr7sFLTOTZA/YnprzCdPcvijDz8+mHrKHZfmiFnEVYoWM0XPBXE5gdJLhV1HFo5DhqxhR51ZJQfuliBJintviT9gUDDqJnDjy6r+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WP41+we+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WP41+we+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4775ae77516so68603805e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 05:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766755372; x=1767360172; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGWMaAEgQZliYQZ1cD4kQtI0ZSBxBdHcIZa9v5FZ6Ak=;
        b=WP41+we+/ZekSxjQ2EuRyFe+bV4HEQxOBF8fzF9448piNHSgwyuIIHkIwr2cg+Sva6
         zUurYNH8FGZawuh/8h+QlZt3lTfor6wEiPWs6DfvCFzx3jhvpecRLOMz2wsnAl1xCHcu
         6ewy6d70ngnvuPnRMnGh8kdCtzpSGPenO4FmMsBrJYp7xa5vd2WVvKVU4okTm3nQcx5z
         jw+OwMq7LzSKwRIHR9BFkLY7VvudpIEWcq4QguEWBKL71cUVhhNwJNvV2jKV9zgVflmT
         HJrg+p1cn2ACLxCIa0h6M3qPzbuwyi3RNx0uRXEKpg/wMsDy/W/FIQFlwVL5AO+2vkEa
         hjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766755372; x=1767360172;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGWMaAEgQZliYQZ1cD4kQtI0ZSBxBdHcIZa9v5FZ6Ak=;
        b=tVPMUtXTW9U+YRDjHx1L0Undm0Ajr7oLwKTBZ9zYtczoyS3VhgsONxPe90LLaRM6bI
         87Qjn1FBCwOmMu7UP2rSgSE1WsbLmLfHOUVGLm1j3O/1lSyYbQJ3VlageMyONiSKDoHL
         22U673uczmuHkMSRDMo8GJMQORFqQtjigw/M4CPy4nx7nAHZUCEKjBv7+ZZNTQmTLZyE
         qONsEnFtKFGGoZNz1d6fnJCCpHOBKCyhVoj8cfkI/JbkibZ2NEC6EsIp8tMyMv2QCOb5
         9PYaqO9PQB15/TWnLCSw+4/UJ3Q5yx/uOxpNmC1VoZoSXSwLQOVQMvfkaqx7WT4NBZa+
         zGqw==
X-Gm-Message-State: AOJu0Yy6ZqGMvHk8jY5J47CmMdwMmaBH6BlGO5/3GOfffBNG8e6O5b13
	WuJLCXd8UoraSbk5/hfds56HJ7LFyIrAXCItHLPUufZBCR7uA/RltFSoh6dA/xrYI1ySJtR4rno
	jS97F
X-Gm-Gg: AY/fxX7Xje1BPvRpyd4T3dNc39+rNj9Df0gXIfYgPXxmmqnxp6CT8JsYUiYzpGrYzt1
	z6S94rjho00wXGVE261RuIZZzP52sA7PMCwTyWWmSBKFHthG7UGf3O9C1p2aIvM5/vLdlG2mx7n
	OR3URiHI3jkqhYxfjy5+NgTbfsCArkVb1mI8MK18oY2yBcllHaJVslkjsVa4FPHTVEvV3Q9LFUf
	IEYGzQaNtaMGBVnLm2W7VnGB1SWeVmfrxZlOd+6CIOONa0vJUCjXafBJ3XfcBA6bptbCc2z7vcw
	gcVhmSXhYXd8wTERbFxzlrtk2ANjt3Nf0DvVjK2qrC3XqFGuge+qKBJU0+BNz1/WZ3E0mMRwL8/
	3UYkQWBhmrN5v2ZW+k4wgPXUaQLWYOyTENkJHe1/gz5MqioOXXlHB1Yxgv/96BHOF+z0R8k+5S2
	yH4gR0+/3uvuYUsUzF
X-Google-Smtp-Source: AGHT+IFQXpFnJsaK/UAPmWW2cjqzzGXd6Tigkio3ZzpvP9HLLwg8b+q/x/EIRyRBH1w7tTOMU+kyqw==
X-Received: by 2002:a05:600c:1c1a:b0:477:5cc6:7e44 with SMTP id 5b1f17b1804b1-47d195780eemr271414305e9.11.1766755372267;
        Fri, 26 Dec 2025 05:22:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be396c909sm172320975e9.0.2025.12.26.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 05:22:51 -0800 (PST)
Date: Fri, 26 Dec 2025 16:22:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shuming Fan <shumingf@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:fileYYQrvG 21/41] sound/soc/codecs/rt1320-sdw.c:1575
 rt1320_rae_load() warn: 'rae_fw' from request_firmware() not released on
 lines: 1575.
Message-ID: <202512260826.74LvGsju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251226132248.8p4u343NSVqtG0F2RxFyYi88VfVIV1CY5VHbw31-Sb8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileYYQrvG
head:   8db50f0fa43efe8799fd40b872dcdd39a90d7549
commit: 22937af75abb3260c2d563739181f4b61ddac2c1 [21/41] ASoC: rt1320: support RAE parameters loading
config: i386-randconfig-141-20251224 (https://download.01.org/0day-ci/archive/20251226/202512260826.74LvGsju-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512260826.74LvGsju-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/rt1320-sdw.c:1575 rt1320_rae_load() warn: 'rae_fw' from request_firmware() not released on lines: 1575.

vim +/rae_fw +1575 sound/soc/codecs/rt1320-sdw.c

22937af75abb32 Shuming Fan 2025-12-16  1426  static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
22937af75abb32 Shuming Fan 2025-12-16  1427  {
22937af75abb32 Shuming Fan 2025-12-16  1428  	struct device *dev = &rt1320->sdw_slave->dev;
22937af75abb32 Shuming Fan 2025-12-16  1429  	static const char func_tag[] = "FUNC";
22937af75abb32 Shuming Fan 2025-12-16  1430  	static const char xu_tag[] = "XU";
22937af75abb32 Shuming Fan 2025-12-16  1431  	const struct firmware *rae_fw = NULL;
22937af75abb32 Shuming Fan 2025-12-16  1432  	unsigned int fw_offset;
22937af75abb32 Shuming Fan 2025-12-16  1433  	unsigned char *fw_data;
22937af75abb32 Shuming Fan 2025-12-16  1434  	unsigned char *param_data;
22937af75abb32 Shuming Fan 2025-12-16  1435  	unsigned int addr, size;
22937af75abb32 Shuming Fan 2025-12-16  1436  	unsigned int func, value;
22937af75abb32 Shuming Fan 2025-12-16  1437  	const char *dmi_vendor, *dmi_product, *dmi_sku;
22937af75abb32 Shuming Fan 2025-12-16  1438  	char vendor[128], product[128], sku[128];
22937af75abb32 Shuming Fan 2025-12-16  1439  	char *ptr_vendor, *ptr_product, *ptr_sku;
22937af75abb32 Shuming Fan 2025-12-16  1440  	char rae_filename[128];
22937af75abb32 Shuming Fan 2025-12-16  1441  	char tag[5];
22937af75abb32 Shuming Fan 2025-12-16  1442  	int ret = 0;
22937af75abb32 Shuming Fan 2025-12-16  1443  	int retry = 200;
22937af75abb32 Shuming Fan 2025-12-16  1444  
22937af75abb32 Shuming Fan 2025-12-16  1445  	dmi_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
22937af75abb32 Shuming Fan 2025-12-16  1446  	dmi_product = dmi_get_system_info(DMI_PRODUCT_NAME);
22937af75abb32 Shuming Fan 2025-12-16  1447  	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
22937af75abb32 Shuming Fan 2025-12-16  1448  
22937af75abb32 Shuming Fan 2025-12-16  1449  	if (dmi_vendor && dmi_product && dmi_sku) {
22937af75abb32 Shuming Fan 2025-12-16  1450  		strscpy(vendor, dmi_vendor);
22937af75abb32 Shuming Fan 2025-12-16  1451  		strscpy(product, dmi_product);
22937af75abb32 Shuming Fan 2025-12-16  1452  		strscpy(sku, dmi_sku);
22937af75abb32 Shuming Fan 2025-12-16  1453  		ptr_vendor = &vendor[0];
22937af75abb32 Shuming Fan 2025-12-16  1454  		ptr_product = &product[0];
22937af75abb32 Shuming Fan 2025-12-16  1455  		ptr_sku = &sku[0];
22937af75abb32 Shuming Fan 2025-12-16  1456  		ptr_vendor = strsep(&ptr_vendor, " ");
22937af75abb32 Shuming Fan 2025-12-16  1457  		ptr_product = strsep(&ptr_product, " ");
22937af75abb32 Shuming Fan 2025-12-16  1458  		ptr_sku = strsep(&ptr_sku, " ");
22937af75abb32 Shuming Fan 2025-12-16  1459  
22937af75abb32 Shuming Fan 2025-12-16  1460  		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
22937af75abb32 Shuming Fan 2025-12-16  1461  			vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1462  
22937af75abb32 Shuming Fan 2025-12-16  1463  		snprintf(rae_filename, sizeof(rae_filename),
22937af75abb32 Shuming Fan 2025-12-16  1464  			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
22937af75abb32 Shuming Fan 2025-12-16  1465  		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1466  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1467  		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1468  		return -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1469  	}
22937af75abb32 Shuming Fan 2025-12-16  1470  
22937af75abb32 Shuming Fan 2025-12-16  1471  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1472  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1473  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1474  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1475  
22937af75abb32 Shuming Fan 2025-12-16  1476  	request_firmware(&rae_fw, rae_filename, dev);
22937af75abb32 Shuming Fan 2025-12-16  1477  	if (rae_fw) {
22937af75abb32 Shuming Fan 2025-12-16  1478  
22937af75abb32 Shuming Fan 2025-12-16  1479  		/* RAE CRC clear */
22937af75abb32 Shuming Fan 2025-12-16  1480  		regmap_write(rt1320->regmap, 0xe80b, 0x0f);
22937af75abb32 Shuming Fan 2025-12-16  1481  
22937af75abb32 Shuming Fan 2025-12-16  1482  		/* RAE stop & CRC disable */
22937af75abb32 Shuming Fan 2025-12-16  1483  		regmap_update_bits(rt1320->regmap, 0xe803, 0xbc, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1484  
22937af75abb32 Shuming Fan 2025-12-16  1485  		while (retry--) {
22937af75abb32 Shuming Fan 2025-12-16  1486  			regmap_read(rt1320->regmap, 0xe83f, &value);
22937af75abb32 Shuming Fan 2025-12-16  1487  			if (value & 0x40)
22937af75abb32 Shuming Fan 2025-12-16  1488  				break;
22937af75abb32 Shuming Fan 2025-12-16  1489  			usleep_range(1000, 1100);
22937af75abb32 Shuming Fan 2025-12-16  1490  		}
22937af75abb32 Shuming Fan 2025-12-16  1491  		if (!retry && !(value & 0x40)) {
22937af75abb32 Shuming Fan 2025-12-16  1492  			dev_err(dev, "%s: RAE is not ready to load\n", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1493  			return -ETIMEDOUT;

Smatch is confused because generally people check the return value
of request_firmware() instead of if (rae_fw)...  But this error
path in this doesn't call release_firmware(rae_fw).

22937af75abb32 Shuming Fan 2025-12-16  1494  		}
22937af75abb32 Shuming Fan 2025-12-16  1495  
22937af75abb32 Shuming Fan 2025-12-16  1496  		dev_dbg(dev, "%s, rae_fw size=0x%lx\n", __func__, rae_fw->size);
22937af75abb32 Shuming Fan 2025-12-16  1497  		regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1498  		for (fw_offset = 0; fw_offset < rae_fw->size;) {
22937af75abb32 Shuming Fan 2025-12-16  1499  
22937af75abb32 Shuming Fan 2025-12-16  1500  			dev_dbg(dev, "%s, fw_offset=0x%x\n", __func__, fw_offset);
22937af75abb32 Shuming Fan 2025-12-16  1501  
22937af75abb32 Shuming Fan 2025-12-16  1502  			fw_data = (unsigned char *)&rae_fw->data[fw_offset];
22937af75abb32 Shuming Fan 2025-12-16  1503  
22937af75abb32 Shuming Fan 2025-12-16  1504  			memcpy(tag, fw_data, 4);
22937af75abb32 Shuming Fan 2025-12-16  1505  			tag[4] = '\0';
22937af75abb32 Shuming Fan 2025-12-16  1506  			dev_dbg(dev, "%s, tag=%s\n", __func__, tag);
22937af75abb32 Shuming Fan 2025-12-16  1507  			if (strcmp(tag, xu_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1508  				dev_dbg(dev, "%s: This is a XU tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1509  				memcpy(&addr, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1510  				memcpy(&size, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1511  				param_data = (unsigned char *)(fw_data + 12);
22937af75abb32 Shuming Fan 2025-12-16  1512  
22937af75abb32 Shuming Fan 2025-12-16  1513  				dev_dbg(dev, "%s: addr=0x%x, size=0x%x\n", __func__, addr, size);
22937af75abb32 Shuming Fan 2025-12-16  1514  
22937af75abb32 Shuming Fan 2025-12-16  1515  				/*
22937af75abb32 Shuming Fan 2025-12-16  1516  				 * UI register ranges from 0x1000d000 to 0x1000d7ff
22937af75abb32 Shuming Fan 2025-12-16  1517  				 * UI registers should be accessed by tuning tool.
22937af75abb32 Shuming Fan 2025-12-16  1518  				 * So, there registers should be cached.
22937af75abb32 Shuming Fan 2025-12-16  1519  				 */
22937af75abb32 Shuming Fan 2025-12-16  1520  				if (addr <= 0x1000d7ff && addr >= 0x1000d000)
22937af75abb32 Shuming Fan 2025-12-16  1521  					regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1522  
22937af75abb32 Shuming Fan 2025-12-16  1523  				rt1320_data_rw(rt1320, addr, param_data, size, RT1320_PARAM_WRITE);
22937af75abb32 Shuming Fan 2025-12-16  1524  
22937af75abb32 Shuming Fan 2025-12-16  1525  				regcache_cache_bypass(rt1320->regmap, true);
22937af75abb32 Shuming Fan 2025-12-16  1526  
22937af75abb32 Shuming Fan 2025-12-16  1527  				fw_offset += (size + 12);
22937af75abb32 Shuming Fan 2025-12-16  1528  			} else if (strcmp(tag, func_tag) == 0) {
22937af75abb32 Shuming Fan 2025-12-16  1529  				dev_err(dev, "%s: This is a FUNC tag", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1530  
22937af75abb32 Shuming Fan 2025-12-16  1531  				memcpy(&func, (fw_data + 4), 4);
22937af75abb32 Shuming Fan 2025-12-16  1532  				memcpy(&value, (fw_data + 8), 4);
22937af75abb32 Shuming Fan 2025-12-16  1533  
22937af75abb32 Shuming Fan 2025-12-16  1534  				dev_dbg(dev, "%s: func=0x%x, value=0x%x\n", __func__, func, value);
22937af75abb32 Shuming Fan 2025-12-16  1535  				if (func == 1)  //DelayMs
22937af75abb32 Shuming Fan 2025-12-16  1536  					msleep(value);
22937af75abb32 Shuming Fan 2025-12-16  1537  
22937af75abb32 Shuming Fan 2025-12-16  1538  				fw_offset += 12;
22937af75abb32 Shuming Fan 2025-12-16  1539  			} else {
22937af75abb32 Shuming Fan 2025-12-16  1540  				dev_err(dev, "%s: This is NOT a XU file (wrong tag)", __func__);
22937af75abb32 Shuming Fan 2025-12-16  1541  				break;
22937af75abb32 Shuming Fan 2025-12-16  1542  			}
22937af75abb32 Shuming Fan 2025-12-16  1543  		}
22937af75abb32 Shuming Fan 2025-12-16  1544  
22937af75abb32 Shuming Fan 2025-12-16  1545  		regcache_cache_bypass(rt1320->regmap, false);
22937af75abb32 Shuming Fan 2025-12-16  1546  		release_firmware(rae_fw);
22937af75abb32 Shuming Fan 2025-12-16  1547  
22937af75abb32 Shuming Fan 2025-12-16  1548  	} else {
22937af75abb32 Shuming Fan 2025-12-16  1549  		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
22937af75abb32 Shuming Fan 2025-12-16  1550  		ret = -EINVAL;
22937af75abb32 Shuming Fan 2025-12-16  1551  		goto _exit_;
22937af75abb32 Shuming Fan 2025-12-16  1552  	}
22937af75abb32 Shuming Fan 2025-12-16  1553  
22937af75abb32 Shuming Fan 2025-12-16  1554  	/* RAE CRC enable */
22937af75abb32 Shuming Fan 2025-12-16  1555  	regmap_update_bits(rt1320->regmap, 0xe803, 0x0c, 0x0c);
22937af75abb32 Shuming Fan 2025-12-16  1556  
22937af75abb32 Shuming Fan 2025-12-16  1557  	/* RAE update */
22937af75abb32 Shuming Fan 2025-12-16  1558  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x00);
22937af75abb32 Shuming Fan 2025-12-16  1559  	regmap_update_bits(rt1320->regmap, 0xe80b, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1560  
22937af75abb32 Shuming Fan 2025-12-16  1561  	/* RAE run */
22937af75abb32 Shuming Fan 2025-12-16  1562  	regmap_update_bits(rt1320->regmap, 0xe803, 0x80, 0x80);
22937af75abb32 Shuming Fan 2025-12-16  1563  
22937af75abb32 Shuming Fan 2025-12-16  1564  	regmap_read(rt1320->regmap, 0xe80b, &value);
22937af75abb32 Shuming Fan 2025-12-16  1565  	dev_dbg(dev, "%s: CAE run => 0xe80b reg = 0x%x\n", __func__, value);
22937af75abb32 Shuming Fan 2025-12-16  1566  
22937af75abb32 Shuming Fan 2025-12-16  1567  	rt1320->rae_update_done = true;
22937af75abb32 Shuming Fan 2025-12-16  1568  
22937af75abb32 Shuming Fan 2025-12-16  1569  _exit_:
22937af75abb32 Shuming Fan 2025-12-16  1570  	regmap_write(rt1320->regmap,
22937af75abb32 Shuming Fan 2025-12-16  1571  			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
22937af75abb32 Shuming Fan 2025-12-16  1572  				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1573  	rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, 0x03);
22937af75abb32 Shuming Fan 2025-12-16  1574  
22937af75abb32 Shuming Fan 2025-12-16 @1575  	return ret;
22937af75abb32 Shuming Fan 2025-12-16  1576  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

