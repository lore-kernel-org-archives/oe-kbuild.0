Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25271DC98B
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736161236; cv=none; b=qvaW9ACy1gFZUhCFs2GxlCwX+M48C8HY85I2fQnIhah2I8rytRVgD9W/dZun1lvYYKYbeF5tsawuu8i7F4qOlJfOf3xftr8lW+wYpns6PNg7YLyw8z4eYFvuEv3sAPtGo6hJfgLlUZ9P4NYRY6bMW1/jXt++7tqN4vq2Ie/s2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736161236; c=relaxed/simple;
	bh=lh/ORYqUqQPBypRcMrlJ/jQ1FOJKC+DIQpRFKEQOn0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fp7QTB/+SnIAilGryRSvMii2MB0c3Fr2ApwV1GuOV5wrGf+AaRQychfdmXHKQmHL3Bx8QoStE2/3y6xs4NjTAsPG+4gic+YQgbJyHUTsKmQAWncCZeKSEGGss/9D4b7nCMmz+CL9H0uQ+fNdnWahkK8Ml4xxuuHeJ3GNzTxLSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=txlle3Pn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="txlle3Pn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso97491205e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 03:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736161232; x=1736766032; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8r5DvTTbSeaovka4UsuI6KgmOl0LLdaR15jf6X6Kjk=;
        b=txlle3PneB+r1R0zhWHwBmA+mj0ksuVvGqWC4zKEhc3xfrc9cw6V9HNX5u09KSeUSz
         mdrFgJ98C6TPAzUUIviw7eBGrXlJZBvbnCGKcO9hlpK0ZSaVCN9aiHLdcXre+hN0P1de
         oBw8BbZ0I+xuTZM8nCzig3AYvhan/nAN0XFL0bX+6Wdd9+8o02rCt4FH0JcfngwETkMq
         gzL7GYmKNmg3cgWJZsBz+YYpL6iePPkHJXZI8qT0oaVTAXAoBYUSWW5oK0W3NG5QI8SX
         IdTZc8suoPaNCtZ42ShNcH6gfTdW0itLyOWJCXtZwr36QFAOeBOqbmBFaRaP2CCjdZpp
         dI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161232; x=1736766032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8r5DvTTbSeaovka4UsuI6KgmOl0LLdaR15jf6X6Kjk=;
        b=aF0JO27r7BZseFslA2Fff4CesuLK0ZL2chTl15bfCMCOhwseBodGTYkETy0ylPeFAs
         KpuO6pZcwDqTbNRwLv4nnEq4Lit6hc3BUJEQcdofvDiyKMmAZKsh8v5Uh52DhUqnAhcr
         kW/pXjOG+3KsCxsy+yvUxX2c6JYmbXX9sQRHp9HlzmeBVnFoDIViQsl07k9I66W3dfqY
         ORqrNM8ZWWMORdmpM/4gBPrTtWzp81FoUycZq650x3eeNEJklFOCJo17CuIliNo/WvHH
         +D56NsIPvPQpkXabpcSRB+ztyUk05tOsocwHenNZH59y+WRyDw5QHtEqNzJljHwVb5lR
         4W4w==
X-Gm-Message-State: AOJu0Yww9RdL82HYEtQ6bBoBuAxquRIwkMPlWj3dkgBGgN1HWunArNpq
	hY7uU8iYt6U7IHOBPtTMrfZTxSOkz0OMD45J63MTxji1P2X//TBWusc0k8DVrk415kk+x877day
	S
X-Gm-Gg: ASbGncvkx9jrl6/vvMVXohKkBYWmpA1M9Hr0k2R4yGsb3U3H6kWWQSr13N9DxJMX+cG
	HWFVZUrCW3iI6T/7ZVY7lBqgDJfQkZ0OB8vsvH7tWzcCxFOw1t2ASQ00SgGEUhmlKsk6Vh59ZGY
	8jbxGiI/wul1h4woC9Y/y71E7ErMALZ3uHwQBhOrbZXT8SMPRYcg1cABdzGYtKz/zzivT7+BTgc
	RzNsIotBFmrvBQqDGQaZa0gfcA4th0WP/rKQZfMGKwQe39LawKbxn7Lu4+GXQ==
X-Google-Smtp-Source: AGHT+IGl2uXI9+gTO9L8MR8mKK4sPXtv9Rlne32FuJVrnlMQf6KfuvVpA/Trlp9iOqZ9m3U3FESElw==
X-Received: by 2002:a05:6000:4a0a:b0:385:ef39:6ce9 with SMTP id ffacd0b85a97d-38a221f1716mr57646915f8f.21.1736161232155;
        Mon, 06 Jan 2025 03:00:32 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8292adsm47258675f8f.19.2025.01.06.03.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 03:00:31 -0800 (PST)
Date: Mon, 6 Jan 2025 14:00:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 62/62] drivers/mailbox/mailbox.c:465
 mbox_request_channel() warn: inconsistent returns 'global &con_mutex'.
Message-ID: <34f1ff99-3dbf-43b6-b8c7-57ecdb69d839@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1dc73fc6a85fde80aea12b39fa2dba89e5e571bc
commit: fd3d96240b7afa9f0b63c70c175bcfe8d903aad0 [62/62] FROMLIST: mailbox: Add power_get/power_put API to mbox_chan_ops
config: x86_64-randconfig-161-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310234.doSHE0xj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412310234.doSHE0xj-lkp@intel.com/

New smatch warnings:
drivers/mailbox/mailbox.c:465 mbox_request_channel() warn: inconsistent returns 'global &con_mutex'.

vim +465 drivers/mailbox/mailbox.c

2b6d83e2b8b7de Jassi Brar      2014-06-12  388  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
2b6d83e2b8b7de Jassi Brar      2014-06-12  389  {
2b6d83e2b8b7de Jassi Brar      2014-06-12  390  	struct device *dev = cl->dev;
2b6d83e2b8b7de Jassi Brar      2014-06-12  391  	struct mbox_controller *mbox;
2b6d83e2b8b7de Jassi Brar      2014-06-12  392  	struct of_phandle_args spec;
2b6d83e2b8b7de Jassi Brar      2014-06-12  393  	struct mbox_chan *chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  394  	unsigned long flags;
2b6d83e2b8b7de Jassi Brar      2014-06-12  395  	int ret;
2b6d83e2b8b7de Jassi Brar      2014-06-12  396  
2b6d83e2b8b7de Jassi Brar      2014-06-12  397  	if (!dev || !dev->of_node) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  398  		pr_debug("%s: No owner device node\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  399  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  400  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  401  
2b6d83e2b8b7de Jassi Brar      2014-06-12  402  	mutex_lock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  403  
2b6d83e2b8b7de Jassi Brar      2014-06-12  404  	if (of_parse_phandle_with_args(dev->of_node, "mboxes",
2b6d83e2b8b7de Jassi Brar      2014-06-12  405  				       "#mbox-cells", index, &spec)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  406  		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  407  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  408  		return ERR_PTR(-ENODEV);
2b6d83e2b8b7de Jassi Brar      2014-06-12  409  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  410  
2d805fc1c6b2ec Benson Leung    2015-05-04  411  	chan = ERR_PTR(-EPROBE_DEFER);
2b6d83e2b8b7de Jassi Brar      2014-06-12  412  	list_for_each_entry(mbox, &mbox_cons, node)
2b6d83e2b8b7de Jassi Brar      2014-06-12  413  		if (mbox->dev->of_node == spec.np) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  414  			chan = mbox->of_xlate(mbox, &spec);
8ed82e23875e60 Mikko Perttunen 2018-11-28  415  			if (!IS_ERR(chan))
2b6d83e2b8b7de Jassi Brar      2014-06-12  416  				break;
2b6d83e2b8b7de Jassi Brar      2014-06-12  417  		}
2b6d83e2b8b7de Jassi Brar      2014-06-12  418  
2b6d83e2b8b7de Jassi Brar      2014-06-12  419  	of_node_put(spec.np);
2b6d83e2b8b7de Jassi Brar      2014-06-12  420  
2d805fc1c6b2ec Benson Leung    2015-05-04  421  	if (IS_ERR(chan)) {
2d805fc1c6b2ec Benson Leung    2015-05-04  422  		mutex_unlock(&con_mutex);
2d805fc1c6b2ec Benson Leung    2015-05-04  423  		return chan;
2d805fc1c6b2ec Benson Leung    2015-05-04  424  	}
2d805fc1c6b2ec Benson Leung    2015-05-04  425  
2d805fc1c6b2ec Benson Leung    2015-05-04  426  	if (chan->cl || !try_module_get(mbox->dev->driver->owner)) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  427  		dev_dbg(dev, "%s: mailbox not free\n", __func__);
2b6d83e2b8b7de Jassi Brar      2014-06-12  428  		mutex_unlock(&con_mutex);
2b6d83e2b8b7de Jassi Brar      2014-06-12  429  		return ERR_PTR(-EBUSY);
2b6d83e2b8b7de Jassi Brar      2014-06-12  430  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  431  
2b6d83e2b8b7de Jassi Brar      2014-06-12  432  	spin_lock_irqsave(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar      2014-06-12  433  	chan->msg_free = 0;
2b6d83e2b8b7de Jassi Brar      2014-06-12  434  	chan->msg_count = 0;
2b6d83e2b8b7de Jassi Brar      2014-06-12  435  	chan->active_req = NULL;
2b6d83e2b8b7de Jassi Brar      2014-06-12  436  	chan->cl = cl;
2b6d83e2b8b7de Jassi Brar      2014-06-12  437  	init_completion(&chan->tx_complete);
2b6d83e2b8b7de Jassi Brar      2014-06-12  438  
2b6d83e2b8b7de Jassi Brar      2014-06-12  439  	if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
33cd7123ac0ba5 Sudeep Holla    2017-09-28  440  		chan->txdone_method = TXDONE_BY_ACK;
2b6d83e2b8b7de Jassi Brar      2014-06-12  441  
2b6d83e2b8b7de Jassi Brar      2014-06-12  442  	spin_unlock_irqrestore(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar      2014-06-12  443  
fd3d96240b7afa Jason-jh Lin    2024-06-14  444  	if (chan->mbox->ops->power_get) {
fd3d96240b7afa Jason-jh Lin    2024-06-14  445  		ret = chan->mbox->ops->power_get(chan);
fd3d96240b7afa Jason-jh Lin    2024-06-14  446  		if (ret < 0)
fd3d96240b7afa Jason-jh Lin    2024-06-14  447  			return ERR_PTR(ret);

mutex_unlock(&con_mutex);

fd3d96240b7afa Jason-jh Lin    2024-06-14  448  	}
fd3d96240b7afa Jason-jh Lin    2024-06-14  449  
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  450  	if (chan->mbox->ops->startup) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  451  		ret = chan->mbox->ops->startup(chan);
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  452  
2b6d83e2b8b7de Jassi Brar      2014-06-12  453  		if (ret) {
2b6d83e2b8b7de Jassi Brar      2014-06-12  454  			dev_err(dev, "Unable to startup the chan (%d)\n", ret);
2b6d83e2b8b7de Jassi Brar      2014-06-12  455  			mbox_free_channel(chan);
2b6d83e2b8b7de Jassi Brar      2014-06-12  456  			chan = ERR_PTR(ret);
2b6d83e2b8b7de Jassi Brar      2014-06-12  457  		}
b7133d6fcd9a9e Bjorn Andersson 2017-05-27  458  	}
2b6d83e2b8b7de Jassi Brar      2014-06-12  459  
fd3d96240b7afa Jason-jh Lin    2024-06-14  460  	if (chan->mbox->ops->power_put)
fd3d96240b7afa Jason-jh Lin    2024-06-14  461  		chan->mbox->ops->power_put(chan);
fd3d96240b7afa Jason-jh Lin    2024-06-14  462  
2b6d83e2b8b7de Jassi Brar      2014-06-12  463  	mutex_unlock(&con_mutex);
fd3d96240b7afa Jason-jh Lin    2024-06-14  464  
2b6d83e2b8b7de Jassi Brar      2014-06-12 @465  	return chan;
2b6d83e2b8b7de Jassi Brar      2014-06-12  466  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

