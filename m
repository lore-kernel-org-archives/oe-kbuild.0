Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1ED18FDC2
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472477; cv=none; b=LIqjlbqfMfm4PrAFqsSmOWDZxHGCHRShWyLRlf5VrW2EP2v3+6Kef8g5qEX1k67WGU25V61zowGHJKWAp6B9RLr5az6CepUWuIsKlwT+aTKK6AI5sVSQCQIbbNV9L+7bkOtV+T76KIlMAJL+ReIvpPw4CUk5WbHy5DmxXz+uaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472477; c=relaxed/simple;
	bh=CAmv0Xim+xMr1NZeZF1P0KchUNfz99ISCrokOBF3hfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSFxqQuV5zNR0l1jYB8JzTbzVxtFNGb5/rCMwlFyjmVi7xDfmYIEI3YDXozTTeLL5Bfa5r2lAzaYwcOd4y4tnbuBLslDX7HTf4punwWgYnpH7EqUuM34crPOeITgP3AOlHfzsulsoOdSuDigoQV4RlASmc/vHZoGqNIMdJWS7YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un7Uk1uK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un7Uk1uK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cb57f8b41so89623375e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472474; x=1729077274; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHLwSCLcZXg/gdhfM+vK/9uemK5Mgu0oDNtBVH1UslU=;
        b=Un7Uk1uK9pIyQ3oTL+h4fwfRB1MSOnWPoFYUHUoQiAF8VmUNqbWmJSmW++DK4xHEWp
         EUwd+9GzKTZQSlgN9ZS0UHdJsUtIE29AmnOE2T/Os51mkrgaWVBFKi9bY/vhDI2dxT3X
         96suG/8+uSJ+CWjJAlv7waF+yCI1/iXvYHHHM64wm9HARKb6gmS6nBZykUEhvjv/uicJ
         NhGU7SyurRsxsPIDhElPtrM2nJ8vQAJkkxBb1CEGKz0quMdpMRSj/FDLLd67fBWNPxVR
         IWY8e7COSRwYRH2gQd78VpXu6M6hRBoB10EgmV0yWud68w9cUVVpLg/MmOCaUsnB4RjF
         4U7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472474; x=1729077274;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLwSCLcZXg/gdhfM+vK/9uemK5Mgu0oDNtBVH1UslU=;
        b=cYDIQERLTCIW3LpqNLqz413kWC/DgOp00+ayWNCAtwgjYDEdzyNGPCk8XtSoX7XSFw
         zixUAVAdoHVfTdxjH/q6paHyo9vegWQBG5NwIYRbOHZQd9kSVdQ5Srz66U9krzGLM3Py
         jGV2LrBLTI7VoiXP5GTQWpttavNQ+rPhoOV14NgMGVEaD/eY2biptauUHK+1uwfzcslx
         5VBZKZMs0O49HywNzTrIUyUxyeEtolkQUojFaEVffcBlsmT8SI84WZk3UeaIl+kYSXYV
         dkOxzKRdcNYEe0vMFeG2MvGi+ZBpDEU54hcD1yPy0r07k7nu3J4gZ0sZcBN6AXgkp9L4
         2yow==
X-Gm-Message-State: AOJu0YxZnXI4aoW7OnKc+YL1djnIxWSWHPTy4rWi8Syjvlv55Zdm0Cuv
	bymTuNfETsQ9r+9WQJNlxHvOMcTbtzKCIW9iT1LzWIPVXNCpkmkjV5VLfmEegkNMwGGegZqMp8Q
	u
X-Google-Smtp-Source: AGHT+IGIEbqnkdGIESJVOB3X7Tf9Mb14gCY489tPwNixMt2aKA2pzW3NrKHU/JAEfwRyXZstXJkfKQ==
X-Received: by 2002:a05:600c:384c:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-430d70b3c4dmr19803405e9.26.1728472474129;
        Wed, 09 Oct 2024 04:14:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690fc53sm10193150f8f.4.2024.10.09.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:14:33 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:14:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sriram R <quic_srirrama@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 64/81]
 drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error:
 buffer overflow 'vif->link_conf' 15 <= 15
Message-ID: <207e7634-4390-47ac-bc62-c888f9dc34b4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: 8e3d460d4c16e52a70ebfa7e1dd0bd20bf739888 [64/81] wifi: ath12k: Use mac80211 vif's link conf instead of bss_conf
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090633.yjfmlMkr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410090633.yjfmlMkr-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15

vim +517 drivers/net/wireless/ath/ath12k/mac.c

8e3d460d4c16e5 Sriram R   2024-08-16  507  struct ieee80211_bss_conf *ath12k_get_link_bss_conf(struct ath12k_link_vif *arvif)
8e3d460d4c16e5 Sriram R   2024-08-16  508  {
8e3d460d4c16e5 Sriram R   2024-08-16  509  	struct ieee80211_vif *vif = arvif->ahvif->vif;
8e3d460d4c16e5 Sriram R   2024-08-16  510  	struct ieee80211_bss_conf *link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  511  	/* ieee80211_vif->link_conf[]s are rcu objects which requires rcu_read_lock()
8e3d460d4c16e5 Sriram R   2024-08-16  512  	 * to be held for safe access.
8e3d460d4c16e5 Sriram R   2024-08-16  513  	 */
8e3d460d4c16e5 Sriram R   2024-08-16  514  	if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS)

Seems like this is an off by one.

8e3d460d4c16e5 Sriram R   2024-08-16  515  		return NULL;
8e3d460d4c16e5 Sriram R   2024-08-16  516  	rcu_read_lock();
8e3d460d4c16e5 Sriram R   2024-08-16 @517  	link_conf = rcu_dereference(vif->link_conf[arvif->link_id]);
8e3d460d4c16e5 Sriram R   2024-08-16  518  	rcu_read_unlock();
8e3d460d4c16e5 Sriram R   2024-08-16  519  	return link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  520  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

