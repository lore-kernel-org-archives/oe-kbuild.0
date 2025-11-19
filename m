Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC0314B69
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555769; cv=none; b=KPkIht52mtjtsNxoVyFZb7s6r1mtcCa3w2EPuekXQPLG/eo9YeATykaTjgTMHVex2OdPg7XX5yuUbb65y2QeyvLBtEOjL8d3Ui9Vax3FUXaorjKze/uWc/LCyNS0wlXD+bYWFz7ybSVfYt/8E/MR6BWkCB7jbDKGx4N0LE18bzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555769; c=relaxed/simple;
	bh=EnMfEZ4QkIAdynBjiahHjs3Z6HB/axdMWtZKOM/vCas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQePevixY2RBup2uPyYutRZBWOOHfTGbLBJXCZ5+mYJ8is5pYoxNPF4jjokOPr0WYWM1M+tqUHWfghjnKL6wzszktu41wRNhYumAn6SdhTPcbtSXRGMWTv0KSgxu/etBdpc3vxC3IfEQxFI6w7cTbzECE4fHixpL3Uz7J9rm/Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVxdLG4y; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVxdLG4y"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso34936475e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 04:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763555765; x=1764160565; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12KHTdCj9uQ2KXxVz6vWKPRafgjTPXAyRlFxqpBHLk0=;
        b=tVxdLG4yLcCW5O4pS+P+g2h2Efj1IApFDer0Mn/5dMF3cax1YpSXvrpJFdxPeJ7bok
         4MYRqcikPL3mdgEQdoDUhQIkfdjG08qEJv5hbGQI0HtVwl6769AisyaEWEqm6jI5v6Vm
         GLgid8z4fGu1BLRTGRvEZg+HEWNwdYbV4zM0vJ4ob3FPKuIP1UPovHVHj4mc22tVy58d
         2YHmGo+8QNGtLtW4E21IIvjIXp0QJg9NdVAI7Emt8DzM252w0cFZ8UuVPYVJhF36iyK2
         vBwaDOJsMADHUESc60OW2pyieUi4rjm2F3mmNp/sx0dXJPCfNjcEAPtylwRHHvigINdT
         4aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763555765; x=1764160565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12KHTdCj9uQ2KXxVz6vWKPRafgjTPXAyRlFxqpBHLk0=;
        b=BjnocvgkHDmFal6ESqA0WNRqENSXlet0k2iwTKs06yfN3cQbS4ecStzl/9bVvfuWgJ
         Cewuc5jYiSLfP6Xn5xij+SrcedVoXdDibXUinfZ/gbQMCr2teQrKcwPA80e2Gge2FdDI
         c/VNg1zWtazaGG5+uTWrK1SJskKvM6N2UZlQmIM69+1l/6scTETEuStuT8UoRjtveOyS
         7m8g+NwQTcwb2EgQiyPbXeVeWXBaU3kiNmWfxITIG1BeGPrOWkode663OOWzp6kd3V7x
         BATOIjKnHfED8hnHkZLMopRYpEbtZdh17onjqQYUc4lb1awcCRegZ+7/Z2JurpgJ9DWE
         OArQ==
X-Gm-Message-State: AOJu0Yyv00svp0S9d18EZF8OOcaZMc64jh5RHg8vvpdwEI4EnCmdJeXB
	tJwJPsUvet2lVohyiNLWT/Ybt/c4r2EoSFr0g86rsNf+LL6BGQtd/0ZY7lnt1MSdKRNrkBDvybx
	eeV9Q
X-Gm-Gg: ASbGnctYXt1wva4dab/0ailA/m0GJj9gY4H5+Q2ogpl2oVWFy/XqxSCH1bUJ3Xfbeu6
	hoRqeXNUrKW513VTVG1SyYuigU2Qrpmwz6IWJyWESeVo6UCU9Z8RGWklEcyk8CYkuOdo+yAi+UC
	2d5PdRbZL4aHJZaFLlTXO1zCm4A08bXIayobcYgYFnPmLU93GDrOe3wQ0U8yKQZOaxdkNOZGVaN
	WzJD3r7ccMGr4FKpowMMyY+CrEkG8kbckIFyYKJS9w4nBQ/1Gj+wdBsPYUDWHHL8RyUOwjJ/oI9
	NUkm6Yd9VJND8sl2eIOIsZw1fjINCYfNGGhRRPg4D1whLYet/qJyvYUn6BuFwMmVw5e1u1u7p34
	RG+MdBAK3ig1KPX7VKggKR6SZYGrwLzeqz7d0mzKKi37tyh9We0Evt+2KJRh/eSpGqNiLF95gJv
	vx3FSW9LQmLlLic4D6n7t3x7oNMecV0+Zt0TbPXw==
X-Google-Smtp-Source: AGHT+IFWB53ZXOS4PvwKC7P6NjsFE5FiZi+2vXWb0i5n9X/h6mk/TDgvGSLdIXDkxsKDnEKsOWeDPg==
X-Received: by 2002:a05:600c:8b22:b0:477:7a1a:4b81 with SMTP id 5b1f17b1804b1-4778fe57115mr186037325e9.9.1763555764772;
        Wed, 19 Nov 2025 04:36:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42c9628ebacsm24992839f8f.30.2025.11.19.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 04:36:04 -0800 (PST)
Date: Wed, 19 Nov 2025 15:36:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Wunderlich <frank-w@public-files.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc_new 42/108]
 drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error:
 uninitialized symbol 'changed'.
Message-ID: <202511151513.Hnqzn6wc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251119123600.j8pVLAAlKoY6t5irS0zZYzj5uG_G8gi9EW2kPjnBVl0@z>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc_new
head:   eb43ba8536a5d22d51b0f384a239728b30ede362
commit: d16e92f56bf7e04bc87f39d34d70b47969767b11 [42/108] net: phy: as21: try the driver from mtk-sdk
config: nios2-randconfig-r071-20251114 (https://download.01.org/0day-ci/archive/20251115/202511151513.Hnqzn6wc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511151513.Hnqzn6wc-lkp@intel.com/

New smatch warnings:
drivers/net/phy/as21xxx.c:1176 aeon_c45_an_config_aneg() error: uninitialized symbol 'changed'.

Old smatch warnings:
drivers/net/phy/as21xxx.c:549 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.
drivers/net/phy/as21xxx.c:557 aeon_ipc_send_cmd() warn: unsigned 'val' is never less than zero.

vim +/changed +1176 drivers/net/phy/as21xxx.c

830877d89edcd83 Christian Marangi 2025-05-17  1148  
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1149  static int aeon_c45_an_config_aneg(struct phy_device *phydev)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1150  {
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1151  	int changed, ret;

changed is never initialized to false, only true.

d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1152  	u32 adv;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1153  	linkmode_and(phydev->advertising, phydev->advertising,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1154  		     phydev->supported);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1155  	//changed = genphy_config_eee_advert(phydev);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1156  	adv = linkmode_adv_to_mii_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1157  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1158  				  ADVERTISE_ALL | ADVERTISE_100BASE4 |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1159  					  ADVERTISE_PAUSE_CAP |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1160  					  ADVERTISE_PAUSE_ASYM,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1161  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1162  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1163  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1164  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1165  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1166  	adv = linkmode_adv_to_mii_10gbt_adv_t(phydev->advertising);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1167  	ret = phy_modify_mmd(phydev, MDIO_MMD_AN, MDIO_AN_10GBT_CTRL,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1168  				  MDIO_AN_10GBT_CTRL_ADV10G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1169  					  MDIO_AN_10GBT_CTRL_ADV5G |
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1170  					  MDIO_AN_10GBT_CTRL_ADV2_5G,
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1171  				  adv);
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1172  	if (ret < 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1173  		return ret;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1174  	if (ret > 0)
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1175  		changed = 1;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11 @1176  	return changed;
d16e92f56bf7e04 Frank Wunderlich  2025-10-11  1177  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

