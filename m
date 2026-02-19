Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8431A2F1FFE
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483369; cv=none; b=Pj4ZrgFIDPTnMp6uGlTFOgtmr64DGHqi9Kfq7GFlNin4U23D2KnewfwB3Jrbv2UJo91ZnyNO+iIFNLlU5o443JJkp/8r/P2+7i+msArBNLGDUBLuuCFWhjMfRAxTxvmscTaWJX+tuM2Nm2s+XqPgos9aEFO/1CTG9CHTTy+qEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483369; c=relaxed/simple;
	bh=Xv5tPnOd85bFHhVpV9Q4SWpKSydmdaSKUXEHVBB9p8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eTxRh7Jiaf2X96kCr7amqIdR2Rx0vrGmCtIU5uAMAuDcbuJHiyk+nnUEMLNSoagntQRd8EpGy5SGuxC/vHYVGzKATw6TCNaS9H3nKcPkQuxsnZLazD2edDMDsQ2/ccktpGT1GoF4jKn5Io+zebToBREATMvJeRcn9RNJCShSqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ac82hYHc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ac82hYHc"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4807068eacbso5014185e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 22:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771483365; x=1772088165; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dOFTgXyRfXc13ca2FqDNmr5YmI+fRqA0RDibyTNOH8=;
        b=Ac82hYHcIx2BWjVj1tMx5wZ06LaDGJmvmG6XdmZcfI4daMVcWLu0JazBh+rICDK4e8
         C6MooOSqWtaChvrDlgRCXl2VHKo0x56aaU4JgVLmSv1fzMvoCSfVept4Vshq1DnRkCYs
         WtDC45rBSYM57BHkOGVsvy4vuxDulnJp3hgl3NWPakGH4HXMggQG193ShUmFdSoW+Jty
         euWrhqz22lxVenIOfgkas2waehYZeOZAkS5Sq2GY7bsudWUx7HpVqy4eJOQH4dcVW4zw
         SQN1/Fuw8gY/KPV4f67/AmyKXmRm7FVG6XWi0kCGVjavQs/ephplQb6K4Ln/CUHZCpYB
         xS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483365; x=1772088165;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dOFTgXyRfXc13ca2FqDNmr5YmI+fRqA0RDibyTNOH8=;
        b=ZCjAXWVdwISnaXkg+72QnbcrGZaG+yYaiVBeCOXV3HjerXYP8rFWAK1rAMh0G+g3zS
         xc2jO/nPa5NNiQEHJX9UrhwsSAHxVXI0IQK1e/jMcFiZplL2iREGbkcjIqtIh/c8QW/S
         huA2VMsh2YVzTGldO1TTkU8DLgUYILh/lAWKhvkrwdM1AP/ol10vICtZoZY0VXyg3wpW
         lHMDYmsI6tggZRDBs/Cwx3atTMOcHBYqPCNU2+1qsES0CXlvA8uGD6pQJ8AUGFnBq8Pq
         J15Pwg+Tn3xT+QcxISGrFDFV/mQUzv2zpj9R8txBpiltAiVjYAg4Ilzn4yhwZit4Oz58
         jHvQ==
X-Gm-Message-State: AOJu0YxIAdH/2htu5a27Ng614WKNIVysrgWEe7vLbhNAhszhRNyNMySr
	rbRY1mkzDlCmRyvTyfHd2oEV0+7JNKJaM5tPjcNjE6LaNamMHgtMf7kU8R0irVMpL2prmBtUy3x
	nz8l8
X-Gm-Gg: AZuq6aL719LGvvc1AcZx+EKZomy2y1SHJfSz0UVSe8Mg5eLkFYspcP4hpYeeEtffZva
	4vD6uqKLQOFaJFiZZ+Ij9wgnGU3+4bRt7b8isOd/4mzsJW5y9MFGwwzM2TVxibIGVovsktQysdx
	N+ISu4k+6lMBuEz+DVgSD6q4btfdAqR/5JJkAv0xkGBo6ZW3eY3n4sqOWpX+GYj21+OG9Ah82SE
	xy4+VxswNaQFpesA+tMZYFUxaO8tjBDZWrMV8lo7YQMeO5cs2FHICzU2nx9hUIOgl8J/duh/CU5
	Ijw8fUUUk8jd99m1omyncqTqXwWFOY/Vzp22KgjAB4b5yhq8foJupU2p+2ZQNZLgCONLmLSS891
	kW9OvmZ7x94bIbwP8fW/ih5/P57oaGU8qbTDHmTlnwSlmGNdYS69Qhj/Gcjh2Qb7qa5aGt/UdUO
	CIe1FBiyBdI9NY+QfSn0+1jECX5E5c
X-Received: by 2002:a05:600c:3b11:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-48398a52be1mr86346975e9.9.1771483364488;
        Wed, 18 Feb 2026 22:42:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm739339205e9.3.2026.02.18.22.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:42:44 -0800 (PST)
Date: Thu, 19 Feb 2026 09:42:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] wifi: mac80211: Add the capability to offload
 MLO link reconfiguration countdown in the NIC fw
Message-ID: <202602141535.yS6STaer-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-mt7996-link-reconf-v1-1-2b110340d6c4@kernel.org>
Message-ID: <20260219064240.tW2Wbzt4PIQg9WD0SyHUHxucBvQr74syP1D6Donpwhk@z>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/wifi-mac80211-Add-the-capability-to-offload-MLO-link-reconfiguration-countdown-in-the-NIC-fw/20260212-074113
base:   4eefc435c985f4dfdba9afb1c705f0e17377c084
patch link:    https://lore.kernel.org/r/20260212-mt7996-link-reconf-v1-1-2b110340d6c4%40kernel.org
patch subject: [PATCH RFC 1/2] wifi: mac80211: Add the capability to offload MLO link reconfiguration countdown in the NIC fw
config: nios2-randconfig-r071-20260214 (https://download.01.org/0day-ci/archive/20260214/202602141535.yS6STaer-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602141535.yS6STaer-lkp@intel.com/

New smatch warnings:
net/mac80211/iface.c:1787 ieee80211_ap_work() warn: clear_bit() takes a bit number
net/mac80211/cfg.c:5329 ieee80211_mlo_reconf_complete_notify() warn: test_and_set_bit() takes a bit number

Old smatch warnings:
net/mac80211/iface.c:1940 ieee80211_setup_sdata() error: we previously assumed 'sdata->dev' could be null (see line 1896)

vim +1787 net/mac80211/iface.c

5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1779  static void ieee80211_ap_work(struct ieee80211_sub_if_data *sdata)
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1780  {
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1781  	if (!test_bit(IEEE80211_IF_AP_RECONF_LINKS, &sdata->u.ap.flags))
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1782  		return;
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1783  
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1784  	cfg80211_mlo_reconf_complete_notify(sdata->dev,
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1785  					    sdata->u.ap.reconf_links);
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1786  	sdata->u.ap.reconf_links = 0;
5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12 @1787  	clear_bit(IEEE80211_IF_AP_RECONF_LINKS, &sdata->u.ap.flags);

Presumbably IEEE80211_IF_AP_RECONF_LINKS is a BIT(x) where we should
just pass x.

5d2949a9c9ba19 Lorenzo Bianconi 2026-02-12  1788  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

