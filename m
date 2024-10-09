Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEE1917C2
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728472606; cv=none; b=ajgD/e/2ojuXvATlzInuYzxCibq1a9LP+YREEM9K3s2qDrui6mz4ztq3eZLNLyspQUjQ4HqCX6hI4EdA5KHKK0vxNPKNzsnXVM6EqonD/k1vDjSdvu79Io2rGwJgDjhfoS0VyOsd24P0G8gJVZxZuowI+IL7s9QMx7KLdAMiX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728472606; c=relaxed/simple;
	bh=61HpX0ck9H9BodxaKFYP8vFavr4LivTDW/PIxRJ1lT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bh6aypjRJfSNep/lNPEGOZZRzW3IUlWvKxZawm71oyvKfEGwAUfpDa5f1CwdFT9mNkfrdKpPjaC14EVUTurdxaVlmv99o862CM2VkpLM/KQhkoneW9RCEu/W/6uoqP1LsAWgjhbH5k1fiocASSElaNub/HEhOw8dts2rBlV/H18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYB6vNzO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYB6vNzO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so69014785e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728472602; x=1729077402; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=;
        b=GYB6vNzO8n2KjpjrtnMDgC2k9csZzAY+xjbuRXnTuXgJ6WyAHM9B1wxfatRh/oBItT
         qeim6ZmjNemE2wy1m43N5ze4jcgabnfMkJ3fG32h2d6fwONCX7c79Wm+0bA3LmDqbM8f
         fijhU/kS05o236JqQ8z5NvzjnqculleRzbyt0noSZZU9yBKC2A2ZX5nJ6/W1t8sqY1/D
         AexcgSAeb7Ow719aUAXBV1cGzlGHRk0EYADFa+9tGUhv9U8foNf4CprIpunEU6cII42x
         +AW+ff0TOCQd0k++vG1r0We6H67OqNTDYkhoNl77KZZO53ywBEbldOWE++aVLMR33OBQ
         ZjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728472602; x=1729077402;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zo4Qcw3djWHD4Z1aaSZ/XNj7I2Fhmna3RsP+3TSIirw=;
        b=tqOxwpwawblbNN6Pi1AHRsCFr3Lfpb5MpVOaJAKroMNmfW5gNTpfXaJxXTk9gbov+f
         Qk/KlbvVM1/N8ULqCfcgLEIB1vghUSiqzw9tt6Ai7HtyuiYZSbx/mJMYerwENG5uMiMY
         8kcm3N78I9KJOiKKdWqoHm8EatcciIDs8TvNL2eEfrTYjwhyg2KzMu6yszE3cHGsxjpT
         tLMvJqk53MkyKq8iZicj3LnOwB7nnvmoGQZgT2SZLQdSZnw2R2j0A+w+2POyQAPpbf/V
         9uqvU7wyULiJv5nhfTOHAL86I29EnQ+5jOvJZky6DBB2aW/VH0OJd8j841M4+7iax6P/
         iJyw==
X-Gm-Message-State: AOJu0YxUqxtTMiU5RQf2pyJ2BHzPahr4uG2bv4R6g7OUwZxAJL2qY8Ms
	Kjz7qyF00FShdKTOD5XhqEEKP9fNtX5O9aHJIJ+xH+TeHimaUlrMUjiU/UosokqSVxhHKVpaj00
	O
X-Google-Smtp-Source: AGHT+IHvWT1NZaDAYpOFE6XOARp8UJFehWVLhiaZckCgbM41Wn4hRYyoWn/Wn6AnhRYH7Mi8oneIZg==
X-Received: by 2002:a05:600c:4ec7:b0:42c:d74b:eb26 with SMTP id 5b1f17b1804b1-430ccf48471mr15939835e9.21.1728472601971;
        Wed, 09 Oct 2024 04:16:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf4f8desm16759585e9.13.2024.10.09.04.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:16:41 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:16:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sriram R <quic_srirrama@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 65/81]
 drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error:
 buffer overflow 'sta->link' 15 <= 15
Message-ID: <8f50a85a-b09a-421b-ab02-55b4f3b6aa18@stanley.mountain>
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
commit: d50d85ea8574956b273faf4cb2493a98c6548b04 [65/81] wifi: ath12k: Use mac80211 sta's link_sta instead of deflink
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410091157.eMoYClhc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410091157.eMoYClhc-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:534 ath12k_get_link_sta() error: buffer overflow 'sta->link' 15 <= 15

vim +534 drivers/net/wireless/ath/ath12k/mac.c

d50d85ea857495 Sriram R 2024-08-16  522  static struct
d50d85ea857495 Sriram R 2024-08-16  523  ieee80211_link_sta *ath12k_get_link_sta(struct ath12k_link_sta *arsta)
d50d85ea857495 Sriram R 2024-08-16  524  {
d50d85ea857495 Sriram R 2024-08-16  525  	struct ath12k_sta *ahsta = arsta->ahsta;
d50d85ea857495 Sriram R 2024-08-16  526  	struct ieee80211_sta *sta = ath12k_ahsta_to_sta(ahsta);
d50d85ea857495 Sriram R 2024-08-16  527  	struct ieee80211_link_sta *link_sta;
d50d85ea857495 Sriram R 2024-08-16  528  	/* ieee80211_sta->link[]'s are rcu objects which requires rcu_read_lock()
d50d85ea857495 Sriram R 2024-08-16  529  	 * to be held for safe access.
d50d85ea857495 Sriram R 2024-08-16  530  	 */
d50d85ea857495 Sriram R 2024-08-16  531  	if (arsta->link_id > IEEE80211_MLD_MAX_NUM_LINKS)

Was >= intended?

d50d85ea857495 Sriram R 2024-08-16  532  		return NULL;
d50d85ea857495 Sriram R 2024-08-16  533  	rcu_read_lock();
d50d85ea857495 Sriram R 2024-08-16 @534  	link_sta = rcu_dereference(sta->link[arsta->link_id]);
d50d85ea857495 Sriram R 2024-08-16  535  	rcu_read_unlock();
d50d85ea857495 Sriram R 2024-08-16  536  	return link_sta;
d50d85ea857495 Sriram R 2024-08-16  537  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

