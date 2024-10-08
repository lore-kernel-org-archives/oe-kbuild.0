Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2FD189910
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392324; cv=none; b=QKVoaBiewg2Di+tzf+ObFDdrxb1IMMoT/1EW3nMMwSlel49ugTHJso8vWOwbV6dIWmClUPiHloQEU9YGfuaDxqLYDJn9BcuGZZgp2/88C4prNxy8VkWHKUeTLW4hzAGe9Z/JVtdwAEeHsihnqyz/IjvG3lzbzReExihElkQcM9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392324; c=relaxed/simple;
	bh=/nieu7z8LOjuc62qXswgEh6PpSA0lMo0HKnzRbUTzWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GVsPLSKKpVAPL592Vm2MJuLmjFD+9gAuo8HEHgPn6t7u9lbIGfq1LL8NYhcUkZ09P5A8TU6r6I+j/fmKDWY0C/+6MJN4CMwe4LAFN0LlGiKz9LQKkVTcJOViPW8g2UF2lNB510FouhIULjatM+/NjWuskygRGrMY7TmcfgCxy5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uV7EHfMu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uV7EHfMu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so5077204f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 08 Oct 2024 05:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728392320; x=1728997120; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReMHXzy/xLyFkDD6JkM3P5c6crcWMdhbVuAZ58vbNl4=;
        b=uV7EHfMupCtKVkqoitRW9soWKTTO7Fc3JI5WKQT4Mq8SL0lMrkZIN7Y5jfmi2kTlvP
         3+VAemsdWBc5t1NexUjuuBvHjvK6xCi4C/39WDehFvu+GgDSqJjdCaX/BeWS+dmHUSZK
         252+ayQIS5Cn0By+GWwEumH7MDZy1ueKA0BSdvOZ50NXueg2daCku7FaeJzvi0VEpFa2
         6KceZKq4l6yUa2GnzOQ43GTn414i+XlW+Q9Ki61rvrr2/Pj5Y3/ChkCozJ3NSQACocGG
         Y4NyvXj5EhxNwptqQTfIjp76j5WzfrRY2VdgZFL5F+zi8YPGvuSxu1thFOkzbSpCpB5z
         s9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392320; x=1728997120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReMHXzy/xLyFkDD6JkM3P5c6crcWMdhbVuAZ58vbNl4=;
        b=fhBdOIj3rxoC/cUsDcmdpCNSCk24ltxtDyQaoxmPT3PawqCAZMNFA9bkRD/yOhoKhg
         9bfMxLCgcmd241EFOFj1fhR5K8wVsXqjzZGPM1ai81N7FJIGyvuDU9Xo6FRqYTo5mwY/
         Wgutt0oWpjULq9mlr53D0TxfkQrGmx9vVcrKU81f//mu7OGsh6oTJxW5i2LoQWaPyRan
         cderXBj10dtD4bJlar7VWj7XwuxDkiO4DbTAz3m8tXVkQCZItMmUnjDlmq3HLbHzSz1Y
         oCwETK/vvHkc2rGz3Xx/ognX1g0/ZeBOwkOXTHrbreStl9HkRy6KZaHvBRJG3WbVwQsf
         wNPg==
X-Gm-Message-State: AOJu0YxlvpLIEArRCW32YGUlBRYjILnDoICv483ggvU0X/FYcA5wAVaj
	M9f38yS0trvxyL3Q9RPpB/7Favcgs2XrlOKuCKFdur7FiX3a5gSXIeVnUaDMJzuz54wLENGi+G/
	I
X-Google-Smtp-Source: AGHT+IHQ2iBxXrIrseZ96mgtxzYQp8FfKJjmT9um9xPqnI+veUBTlMl3+aPZrS4hSFMmULIIpLA0lw==
X-Received: by 2002:adf:a447:0:b0:37c:cce6:997d with SMTP id ffacd0b85a97d-37d0e72f6damr12739368f8f.20.1728392320204;
        Tue, 08 Oct 2024 05:58:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16920be2sm8085548f8f.60.2024.10.08.05.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:58:39 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:58:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>,
	Harshitha Prem <quic_hprem@quicinc.com>
Subject: [ath:ath12k-mlo-qcn9274 22/81]
 drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we
 previously assumed 'ab' could be null (see line 9389)
Message-ID: <d5ea9564-f66d-4d55-9c93-7d088c4a3ac4@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   4ad14f50820745f9c2f425ba07ca8431bf2409ed
commit: 6c252823bedb7f8f34d53dddadd65761f85bd3c4 [22/81] wifi: ath12k: move ath12k_hw from per device to group
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410081858.ShABiCCT-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410081858.ShABiCCT-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 9389)

vim +/ab +9400 drivers/net/wireless/ath/ath12k/mac.c

6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9380  void ath12k_mac_destroy(struct ath12k_hw_group *ag)
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9381  {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9382  	struct ath12k_pdev *pdev;
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9383  	struct ath12k_base *ab = ag->ab[0];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9384  	int i, j;
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9385  	struct ath12k_hw *ah;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9386  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9387  	for (i = 0; i < ag->num_devices; i++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9388  		ab = ag->ab[i];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12 @9389  		if (!ab)
                                                                             ^^
ab can be NULL

6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9390  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9391  
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9392  		for (j = 0; j < ab->num_radios; j++) {
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9393  			pdev = &ab->pdevs[j];
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9394  			if (!pdev->ar)
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9395  				continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9396  			pdev->ar = NULL;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9397  		}
6c252823bedb7f Karthikeyan Periyasamy 2024-04-12  9398  	}
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9399  
e46d266981a601 Karthikeyan Periyasamy 2024-04-12 @9400  	for (i = 0; i < ath12k_get_num_hw(ab); i++) {
                                                                                                  ^^
Dereferenced inside function

01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9401  		ah = ath12k_ab_to_ah(ab, i);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9402  		if (!ah)
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9403  			continue;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9404  
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9405  		ath12k_mac_hw_destroy(ah);
01f062770f9740 Karthikeyan Periyasamy 2024-04-12  9406  		ath12k_ab_set_ah(ab, i, NULL);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9407  	}
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9408  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

