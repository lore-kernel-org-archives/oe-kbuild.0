Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B01DF982
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Apr 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501888; cv=none; b=teW0mNCFZF4OToXmcqz6F7eqPxfkdo5dCRnDjwcJvC9RdWjXUPijKwek5EueI2q6q+s0DfKkym0s+ldpiJ7n2WRHLPomXaSPd+um57yRtGHWHHrB19dSAWM5AKq1BoCOCpq6ecsWkK+grkG2AOI5S3BXdUN1hsLtlQNEZvJBfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501888; c=relaxed/simple;
	bh=yLVThYYA6cNY9PUGPSW4FSYUx9C5pZJnEK45ZxDswes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7daUx5xyGTgL3lB0WzfrXzLzWOewoQtaDash5Z4Xnr72pKp+sYBw5hfRMd2Dc2vmkOSKtZ0WnLxIGchjQiK4uzJavo84wk2AgBobFZcNq/nl6VCg7ugHNJeflkXDAUNiRyyC7zwcisqcn34UstTpNgNK9oaPs07QSpofNfUxWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QB+q3rnQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QB+q3rnQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efc4577so725032f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 01 Apr 2025 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743501884; x=1744106684; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQo23aXh6Enj5fdA9qEy1GpUeWFTdLXEwF6NE7m3mJA=;
        b=QB+q3rnQkpOx+LzoMW9nuNOCW0XBt90Mzwhs6ud9ifB310fSxrgobGmA8Rihdtu7Zl
         o3N2JHlSGu91A4iXuVxpV0ZQhfxJTXdQBbngxrF5HTu3c8RA3fYsLd1+1qCJdLd6awy5
         SKXUETfsoejCB0/Zk8NWQlv38FuqL8xDDUDjfv7n52ZeSkXieAunxgimnGnYAYhmEPbV
         W6JAycbl48X4XVDVF2qu851SmzccDqRcwEHAZc51fdCIYUB8OMxus51so7ErQAFcW1/b
         Tn4MsYU+PjPbgQYM6V+rVpvIoOnV5xEATS5rB5ZygA6gjsWCxm2msCyCXxHa3jCPfu3E
         vqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501884; x=1744106684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQo23aXh6Enj5fdA9qEy1GpUeWFTdLXEwF6NE7m3mJA=;
        b=dODC2kWXe6jEuihrG7k4nk9O823oupnX3AfKHI2JMCEM46niv+9IfJPhjkTb/Gg4X0
         Dbywk72DPX+Kp0GHSY2XpvVqJu2dnpij+Gq6wnBqZInzkhHHiJgGJIGU50py4naQ9/ye
         E8y4g4h+oEIRJcJSi1Ls4nKAcLuQVhIVZN8jo8cOpYlFcWyzac5lBZB/Ydwk/h7rBUFt
         rZ/q0FRC12HdFzOAMknPCyQtuh8ZjUZDfqNJGtoszwC+FoF/15uXRkjkTAKKMk72/fuN
         uNGbePV/qzNKTXm1NRRYyURqxKBmVTfq+bTpguZl4BS4J956dwmWYrhgrOboTcFXRmMX
         ZlwQ==
X-Gm-Message-State: AOJu0YzW542awzXrID9A7S4gqeRJhNhAOEPEl2IMoz+U6mqJcCYM4r7d
	jOIhryEoBKTT8Wla1xzmeYuuwOinv5kpdXN8hgrfnfdE26IOieLRU1KQpGNniWKDoRSNBgoXisW
	k
X-Gm-Gg: ASbGncsbzmyC0fikALDUohsAeu7ETa5Bk/pGH/U27uK+ehYJGCw4N/alpLUOCkNufx3
	Udw5PGP/opd0cRTLzBXqNtbvDguHKcHAhfzoFEmaeEXx8P5sln8G1qFQ0sa8lMjcAGvn4lSdarH
	z9lTu7XzmaUe7ROcST+yAu1Z6Ds7RWU+NPykDmAwlpFi9FPFMiJmgsxB6TvZ33ucSwiRJrQnoi5
	BW7ofT0hjehqCl7+Jg00HRuKkmTAobwiE9UQlUTvo1RSknH+s1P+LWXiF1oTksADLgm5NScnVpX
	F7nCVUZHLoZaCYUtmJHDGLvc9SqZI2E1x/sQamy9wrbuugvjBg==
X-Google-Smtp-Source: AGHT+IGKH3+YwFpScbDFlONwMqvW6JZG47d1awQxbTH0GHEPJL6z6wmrXivexFM6D28nOH+YD/pWrw==
X-Received: by 2002:a5d:64e4:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39c2364ffa7mr1429075f8f.29.1743501884293;
        Tue, 01 Apr 2025 03:04:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d90001413sm151945485e9.39.2025.04.01.03.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:04:43 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:04:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/channel.c:307
 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check
 'mlink' (see line 305)
Message-ID: <9d01c307-e61c-49b4-8d0c-692b72b5d968@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 3ba20af886d1f604dceeb4d4c8ff872e2c4e885e wifi: mt76: scan: set vif offchannel link for scanning/roc
config: x86_64-randconfig-161-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011739.HvUKtUUe-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504011739.HvUKtUUe-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/channel.c:307 mt76_put_vif_phy_link() warn: variable dereferenced before IS_ERR check 'mlink' (see line 305)

vim +/mlink +307 drivers/net/wireless/mediatek/mt76/channel.c

e411b8190fe7c9 Felix Fietkau 2025-01-02  301  void mt76_put_vif_phy_link(struct mt76_phy *phy, struct ieee80211_vif *vif,
e411b8190fe7c9 Felix Fietkau 2025-01-02  302  			   struct mt76_vif_link *mlink)
e411b8190fe7c9 Felix Fietkau 2025-01-02  303  {
e411b8190fe7c9 Felix Fietkau 2025-01-02  304  	struct mt76_dev *dev = phy->dev;
3ba20af886d1f6 Felix Fietkau 2025-03-11 @305  	struct mt76_vif_data *mvif = mlink->mvif;
                                                                             ^^^^^^^^^^^
Dereference

e411b8190fe7c9 Felix Fietkau 2025-01-02  306  
e411b8190fe7c9 Felix Fietkau 2025-01-02 @307  	if (IS_ERR_OR_NULL(mlink) || !mlink->offchannel)
                                                                   ^^^^^
Too late

e411b8190fe7c9 Felix Fietkau 2025-01-02  308  		return;
e411b8190fe7c9 Felix Fietkau 2025-01-02  309  
3ba20af886d1f6 Felix Fietkau 2025-03-11  310  	rcu_assign_pointer(mvif->offchannel_link, NULL);
e411b8190fe7c9 Felix Fietkau 2025-01-02  311  	dev->drv->vif_link_remove(phy, vif, &vif->bss_conf, mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  312  	kfree(mlink);
e411b8190fe7c9 Felix Fietkau 2025-01-02  313  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

