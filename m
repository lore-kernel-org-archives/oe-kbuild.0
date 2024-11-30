Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FA4436E
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732982503; cv=none; b=Ns1XIJXIGZ6EYvAAconIAqx6QVih3gfoG3OkB+pGaxA64OO96OkJ+ndfKvDs63k/27ZSnKHpwaGZZP/FD+cYTAyHmXZfgBmFLFvdaDtua8h2kerhtNQdV0azvCmE4hmKERcNbOySA+toLL7kR1UJWsmPkrNJGPFFeywK9gn4bE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732982503; c=relaxed/simple;
	bh=8PQ17UtHKWEWFc8bUqxcYRYZlrzIaoJKvd4SBh+fboA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rnh/AX0dwMRZ/ikuV+1zcc+tpHjpY2t5Z/uWR1ZR+0LBVlNKI5UO+WZZGHTNiTv9gv8YW7Sl660m2XwNamarsyZ63ZxKrychT2cNIP/j5lQvQtIiGkcVwXqPHmdeUB7z3fpgsBVUnqKBfIO+0K3GIs0CqOMCMHhDVOuDIUcRmlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vr315uNS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vr315uNS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d0bfa52bd9so1315863a12.2
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 08:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732982499; x=1733587299; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LcX4f2MqHn8HzczBZ5vJerxCPkOipukcFDGbVXHsyGE=;
        b=vr315uNSLIQ28liYaAxc25kPLxkLcUUdB+xqSqOgevkSV4l/lvoXWyfl0Yq9s21qYI
         ddM1j89RUDjHrTNGnZqCejkE5fkM0XOna8CtS4Dm6a2fTnNLYzPRUOEQ/NnatrxTTV5/
         Vaaz93mb6qsTy/DrYfZdIbSqmd1+qTnpOFmQJPQZR8JMWuvjHOybr0xKfiiqi1HaqTAC
         1+giQMl/BXAFzSA/f8F6tGEWoCF/nMWLtkRx1AzemeT/7jM/Dnb1N8lxZwyRHa+rSfOW
         lnGGxTfehosP+zV+vFR2sZJhXjjOv73uQ7GzmdnkPPmMLNxDE4jkBe5ncAWw8FfstRuB
         N94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732982499; x=1733587299;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcX4f2MqHn8HzczBZ5vJerxCPkOipukcFDGbVXHsyGE=;
        b=RZ2T8P5Ys5kvPwVKjWucDNrbF+pIxV81EaP4WbM0Ye7sQoSSHnDckV9DWlgzisoMyG
         tDf44dqpfJ1lLYK/MJtM8ObwGg51IF4odWdA9z4oRYunrOJhoi9pKg7pgyE2nF5u6SnD
         iY4CN1YtJzruLyDgIqAvLmEDhn45DwBFC3SIToBoWCoCxQOX4LOXWKe1oze5o4FswOLZ
         qymeuP/J/IZ6wvCv2vzarq9gI959TKGb67hk03zdHQ6SB6FiwyyqRBALDYsMepL3+ONN
         +NCGkajYePT2vcGOH8g9mAMmb911bg+lr1obBlngCVY+mwH4v9PYaxelbOUUoznNRIEP
         sPjw==
X-Gm-Message-State: AOJu0YxsKeOdEhe1y9gWhojPw5ZzIIV6TzyoEUhD0MOf6qIKWYNflTKB
	xbjw+UG5zOEtVcoxyNQncuG0ooGlExlAB31ydNXF8/sYjDizixSJrbE+h+BD6PlC4Xxv7+Dbc/i
	B
X-Gm-Gg: ASbGncvYKk6zhohbRiibnI/SFeNUKXl/3ydSS/ZRE9ODs6Lwb/iv7RlR0jT+iMkHjA8
	DOV2EMTaXc4I03PNCOdIVq1LGBhtmzpbAPCQrJP9oSNgYyfy813WmcIZXj/yG1c5IackUst5CfB
	e4owd2/uHq24wh/WmrmoYMYjopUuOcK49Q3IXHiA14P++J01ATW/vNaCMrNDIjDlGANwqZkGp9V
	yPeHKa2EtLmyFzuei5bwXHDSR632pWfZqBtx/WEBDpbBj/H+llbBtK4eAhvz5r9Twx65Pas
X-Google-Smtp-Source: AGHT+IG6IKVMxCoqilw91nUdTOtT6PRScXP1YSV7J8UmVDlgsGAp6lswVKcs9LxQNnoyLJYl0yidKg==
X-Received: by 2002:a05:6402:2354:b0:5cf:d5ad:2809 with SMTP id 4fb4d7f45d1cf-5d080c47a10mr13715822a12.24.1732982499332;
        Sat, 30 Nov 2024 08:01:39 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0bf49f159sm1320085a12.0.2024.11.30.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 08:01:38 -0800 (PST)
Date: Sat, 30 Nov 2024 19:01:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [linux-next:master 11908/12916] drivers/i2c/busses/i2c-xiic.c:932
 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg'
 (see line 930)
Message-ID: <37f714bf-bd1a-4a97-9881-1d1ed2cbb20c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
commit: 8bba86687c0b6a22f05ed4a7398c519d3796bc74 [11908/12916] i2c: xiic: Add atomic transfer support
config: i386-randconfig-141-20241121 (https://download.01.org/0day-ci/archive/20241128/202411281318.Ami4hwE8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411281318.Ami4hwE8-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-xiic.c:932 xiic_recv_atomic() warn: variable dereferenced before check 'i2c->rx_msg' (see line 930)

vim +932 drivers/i2c/busses/i2c-xiic.c

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  928  static void xiic_recv_atomic(struct xiic_i2c *i2c)
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  929  {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @930  	while (xiic_rx_space(i2c)) {
                                                                             ^^^
The xiic_rx_space() macro dereferences i2c->rx_msg.

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  931  		if (xiic_getreg32(i2c, XIIC_IISR_OFFSET) & XIIC_INTR_RX_FULL_MASK) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11 @932  			if (!i2c->rx_msg) {
                                                                            ^^^^^^^^^^^^
Inconsistent NULL check.

8bba86687c0b6a Manikanta Guntupalli 2024-10-11  933  				xiic_clear_rx_fifo(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  934  				break;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  935  			}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  936  			xiic_read_rx(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  937  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  938  			/* Clear Rx full and Tx error interrupts. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  939  			xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK |
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  940  					XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  941  		}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  942  		if (xiic_error_check(i2c))
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  943  			return;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  944  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  945  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  946  	i2c->rx_msg = NULL;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  947  	xiic_irq_clr_en(i2c, XIIC_INTR_TX_ERROR_MASK);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  948  
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  949  	/* send next message if this wasn't the last. */
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  950  	if (i2c->nmsgs > 1) {
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  951  		i2c->nmsgs--;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  952  		i2c->tx_msg++;
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  953  		__xiic_start_xfer(i2c);
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  954  	}
8bba86687c0b6a Manikanta Guntupalli 2024-10-11  955  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

