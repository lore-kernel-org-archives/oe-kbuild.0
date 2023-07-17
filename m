Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0436D19
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jul 2023 06:00:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fbc12181b6so43281465e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 23:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689573607; x=1692165607;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jR/dupx8mC1I46jhuzPnpri9B0UsHY1hY1EG5f0NLnY=;
        b=VHJ2NZOmGA+KZTv6RJE8z+dewcN3Wh5ptQab4kmV/C/lDy4Ahf7hxoi0wmgFxCzGrN
         W+b2ic8OnATV53IohB1EfKawxXLbrOO2ozX72hDlDpbvJXJXqOtR4IeS6WRflqwKTy3+
         iPlnSnWerp7etSbhF6pFF5qUEfWvL+WZ2nkCrJWBoji+M7sDyNu3PVG0zuzVekwE9bi1
         d6DAlczQMMhTTeDUqJz9zhS26WMBIeaqZXExxcHUlMhcjGYya82XS2q/fT2k+pxpq8WC
         o6zO5dF6b+r8W3v0+nPW+20Fs8yJiSxZ8m/ShV7NwbelE1xZRKqQxvSIuNtcRhXbRpWU
         hxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689573607; x=1692165607;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jR/dupx8mC1I46jhuzPnpri9B0UsHY1hY1EG5f0NLnY=;
        b=AoBscEtQ7kdW6WHCKBweheVcAqvGAkX64la22GA7iYixHI++qvf8WsNNfqo98+PYmu
         DGQcAXcFOiWFehrkxCch/FKoIYQzcr6QUEcLtgprjaUw464yuBCHFeucm3uT0Ew29N4y
         ivg7sl/y87VqRhpzBUyOGHs1jzy1cg7uNvGQtAPHU++O6HNzb/SThFYAhMxkLdvNLKcd
         S4w9phrpBsL4nCeFxf5dxkGSrMwZjG+3HpkCWQ2tcEad5VYnTMCtl6C35oiZVfVRKaLz
         v+edVho8G2Bp1p3HV3lXSHumSDHrOJfd/HuskAakIwB90V6AoUIEk6vzfh79hbNK2kuB
         We2w==
X-Gm-Message-State: ABy/qLaim4IudQPVTk5vpELwFHnLfjSec+a4NAljwr+oEkJAGGZWB7nH
	Bd93rEcLwcy8mUBkJzUisrAC0QYC8NlMj+wPxcc=
X-Google-Smtp-Source: APBJJlGC0KdNpIs447ArX68218HlhVP7mOa9xQT8cyDtlC7IM8vwJsCTYfJElQHYehK3KqGjyGXpzw==
X-Received: by 2002:a5d:4145:0:b0:314:11f3:ca94 with SMTP id c5-20020a5d4145000000b0031411f3ca94mr10320131wrq.41.1689573606754;
        Sun, 16 Jul 2023 23:00:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d6790000000b003112ab916cdsm18297215wru.73.2023.07.16.23.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:00:05 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:00:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chris Lew <quic_clew@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Deepak Kumar Singh <quic_deesin@quicinc.com>,
	Sarannya S <quic_sarannya@quicinc.com>
Subject: [remoteproc:rpmsg-next 2/4] drivers/rpmsg/qcom_glink_native.c:1074
 qcom_glink_handle_signals() error: we previously assumed 'channel' could be
 null (see line 1069)
Message-ID: <6a5b5198-5fb1-4059-a23b-40c569e83857@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
head:   b5c9ee8296a3760760c7b5d2e305f91412adc795
commit: a2b73aa512a4a90dda7dd5bb38b26b4f1381adbb [2/4] rpmsg: glink: Add support to handle signals command
config: sh-randconfig-m041-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160800.sb7gMnL6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160800.sb7gMnL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307160800.sb7gMnL6-lkp@intel.com/

New smatch warnings:
drivers/rpmsg/qcom_glink_native.c:1074 qcom_glink_handle_signals() error: we previously assumed 'channel' could be null (see line 1069)

vim +/channel +1074 drivers/rpmsg/qcom_glink_native.c

a2b73aa512a4a9 Chris Lew 2023-07-07  1059  static void qcom_glink_handle_signals(struct qcom_glink *glink,
a2b73aa512a4a9 Chris Lew 2023-07-07  1060  				      unsigned int rcid, unsigned int sigs)
a2b73aa512a4a9 Chris Lew 2023-07-07  1061  {
a2b73aa512a4a9 Chris Lew 2023-07-07  1062  	struct glink_channel *channel;
a2b73aa512a4a9 Chris Lew 2023-07-07  1063  	unsigned long flags;
a2b73aa512a4a9 Chris Lew 2023-07-07  1064  	bool enable;
a2b73aa512a4a9 Chris Lew 2023-07-07  1065  
a2b73aa512a4a9 Chris Lew 2023-07-07  1066  	spin_lock_irqsave(&glink->idr_lock, flags);
a2b73aa512a4a9 Chris Lew 2023-07-07  1067  	channel = idr_find(&glink->rcids, rcid);
a2b73aa512a4a9 Chris Lew 2023-07-07  1068  	spin_unlock_irqrestore(&glink->idr_lock, flags);
a2b73aa512a4a9 Chris Lew 2023-07-07 @1069  	if (!channel)

check for NULL

a2b73aa512a4a9 Chris Lew 2023-07-07  1070  		dev_err(glink->dev, "signal for non-existing channel\n");
a2b73aa512a4a9 Chris Lew 2023-07-07  1071  
a2b73aa512a4a9 Chris Lew 2023-07-07  1072  	enable = sigs & NATIVE_DSR_SIG || sigs & NATIVE_CTS_SIG;
a2b73aa512a4a9 Chris Lew 2023-07-07  1073  
a2b73aa512a4a9 Chris Lew 2023-07-07 @1074  	if (channel->ept.flow_cb)

Followed by unchecked dereference

a2b73aa512a4a9 Chris Lew 2023-07-07  1075  		channel->ept.flow_cb(channel->ept.rpdev, channel->ept.priv, enable);
a2b73aa512a4a9 Chris Lew 2023-07-07  1076  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

