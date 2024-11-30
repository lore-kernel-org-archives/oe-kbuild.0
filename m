Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC51448F2
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732958696; cv=none; b=eBItNxxu1LF/peZlwdrJosqtzLKTDgmJn+OijiVDU56TFUuCtTap/t95H6Nzeh8SgVhvy2+siDGnvFXrSF3SoiUDkiX8o1IaN3lnl36VBuT1mEgUH44U1sUYRmbjW+OFozolU6hMozzmiR4Dk5HO1b+yoQ6oGzL/Kf0nnZ8SSuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732958696; c=relaxed/simple;
	bh=HbyTlHacIF7ESRhHkiMm3Pg6bGHGh6s8UClqCIm6sRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/lnaw3nYJ7KQOD31ur+mqgvvI0siqj3NFi1CZ4gyDWHYs3bvjfJdcFCxsghF/OCZd/RBX6RsL+Ux7EZDbH2Xj6iUocD8QOIan3Hjzl5iNs16ZFkkDQLek4rX9HMTI6T/1Dzrz2Cdzq0BWASZCebnoCJPhVUoENfFmffPPz/W30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCEIvmZi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCEIvmZi"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa545dc7105so366143566b.3
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 01:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732958693; x=1733563493; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBKQeX9WoFlcA72LF37ZhjxVMlvafgzJRaLuktpAivM=;
        b=uCEIvmZiDleGmLrH76M7YL4wTtwjCGKOWjhZRAJdd7gBZTzkxHjp+oJ0dnFABk303T
         JjvbS2cq4NbS44KP8pM81qTMdxUy3QgyJtLyZjRalAZZQlEPedlhe3+f93d/o4YytBjf
         CUVZZPHkH4U1Wf1GZEYkiGvvyDZiykGwIzdX55FRhB/4AXw8lqx16jZS5YNKmyzqguIf
         qgVOZ0ZlR8kNb6tBtz1OjhmjFMWyHAvs+kkN/ZPYX2z+HDkzuKAWL4ODMXIkQyjCOjM3
         Gj8iZgVw7Wln3nWHCoXTfZfUf9Vivt9JYIcneE7wAJ6p3/6Pcs0ng+HY7ic47qfHTFou
         7w1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732958693; x=1733563493;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBKQeX9WoFlcA72LF37ZhjxVMlvafgzJRaLuktpAivM=;
        b=i+rrfJ4VyJhqa8OLE1BuGpTymAHEzja6R20oWXqz7idyfhLVwymehNTWl7+FU+3bxj
         DuGlHXQJPQphwileqckiPMJstZvUZPcGt4/t0sny6K8zHfa4inhZfFCloqFjMOZrLKHy
         Luu8yM2cXopda60OPbaoergMJqsW5ffan4UxQSm7N122LDLIIHJlziCUsEToAWKAa2hx
         D5X/E5UYpTbEo/EWmxBvQqbtas+bomQmgHlN2EqpO8hBMvWSsPSaFGuuqqjydMugzAye
         OUv13I9E0thUlq+joKRyO2eWjpac/NUEXwi1Oi0Z4B9eSBpduMXL4qksLfFTrl8AQdoO
         4dGA==
X-Gm-Message-State: AOJu0Yyro6ghK3SlMEmjCgb+x6kyykY0tWszNaEqniC6lkVAHifkxiR2
	eUNuJrXtm1iT8ohm5wV2h9GSEF+Fr55TAOwB16rZs6kWefpm2FnVlqV3JHxW5kysM/8xFFsBOap
	eroe6zA==
X-Gm-Gg: ASbGncsnMhiXuShpObXvAPB/JHvMVVkcCEGT7hCWoBq854KFbpbUFVje4emuoFToyLj
	JhLJi8FFk3f4gTE2MJ7jOg3UeyP6WZqWG6NOCPx8ya8P6tm6rStS1P/1c/mGyR5tg9N1gYAXm2u
	+EuiRXeFdEZHMwkyB+HoE5BHIDsXfr9X16CNSiODbLt9DLiP3lU/J8cSYwfj3yStjqn71RGCV36
	fLBsHec4x5C/0qEmLtl0He6L0fAL5D2UFHdNxv8dn2XZ2BseUI=
X-Google-Smtp-Source: AGHT+IFVxbvidkIoO9xdzabYAyZqZQzJuzIiiHR9a5pqqVPGzl38AuW2Tgqcr+Yp7U6QVM9d6kWvqQ==
X-Received: by 2002:a17:906:1daa:b0:aa5:4d96:ec7 with SMTP id a640c23a62f3a-aa581033592mr1090258766b.44.1732958692443;
        Sat, 30 Nov 2024 01:24:52 -0800 (PST)
Received: from localhost ([41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6f99sm261480666b.131.2024.11.30.01.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:24:52 -0800 (PST)
Date: Sat, 30 Nov 2024 12:24:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Igor Bagnucki <igor.bagnucki@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Simon Horman <horms@kernel.org>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 16/69]
 drivers/net/ethernet/intel/ice/devlink/health.c:95
 ice_tx_hang_reporter_dump() warn: variable dereferenced before check 'event'
 (see line 93)
Message-ID: <b1453276-9043-49c4-a603-9b6bb41306c7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   4b8b07968dc902d751d23a775c1a02220db267c9
commit: 9f889e8ffb48536622852fbe2501dc8b75887239 [16/69] ice: dump ethtool stats and skb by Tx hang devlink health reporter
config: microblaze-randconfig-r072-20241124 (https://download.01.org/0day-ci/archive/20241124/202411242101.qlvmbfLB-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411242101.qlvmbfLB-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/intel/ice/devlink/health.c:95 ice_tx_hang_reporter_dump() warn: variable dereferenced before check 'event' (see line 93)

vim +/event +95 drivers/net/ethernet/intel/ice/devlink/health.c

f19878b2a2e6e4 Przemek Kitszel 2024-09-30   86  static int ice_tx_hang_reporter_dump(struct devlink_health_reporter *reporter,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   87  				     struct devlink_fmsg *fmsg, void *priv_ctx,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   88  				     struct netlink_ext_ack *extack)
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   89  {
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   90  	struct ice_tx_hang_event *event = priv_ctx;
9f889e8ffb4853 Przemek Kitszel 2024-09-30   91  	struct sk_buff *skb;
9f889e8ffb4853 Przemek Kitszel 2024-09-30   92  
9f889e8ffb4853 Przemek Kitszel 2024-09-30  @93  	skb = event->tx_ring->tx_buf->skb;
                                                              ^^^^^^^
Dereference

f19878b2a2e6e4 Przemek Kitszel 2024-09-30   94  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  @95  	if (!event)
                                                            ^^^^^^
Too late

f19878b2a2e6e4 Przemek Kitszel 2024-09-30   96  		return 0;
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   97  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   98  	devlink_fmsg_obj_nest_start(fmsg);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30   99  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, head);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  100  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, intr);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  101  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, vsi_num);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  102  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, queue);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  103  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, next_to_clean);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  104  	ICE_DEVLINK_FMSG_PUT_FIELD(fmsg, event, next_to_use);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  105  	devlink_fmsg_put(fmsg, "irq-mapping", event->tx_ring->q_vector->name);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  106  	ice_fmsg_put_ptr(fmsg, "desc-ptr", event->tx_ring->desc);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  107  	ice_fmsg_put_ptr(fmsg, "dma-ptr", (void *)(long)event->tx_ring->dma);
9f889e8ffb4853 Przemek Kitszel 2024-09-30  108  	ice_fmsg_put_ptr(fmsg, "skb-ptr", skb);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  109  	devlink_fmsg_binary_pair_put(fmsg, "desc", event->tx_ring->desc,
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  110  				     event->tx_ring->count * sizeof(struct ice_tx_desc));
9f889e8ffb4853 Przemek Kitszel 2024-09-30  111  	devlink_fmsg_dump_skb(fmsg, skb);
9f889e8ffb4853 Przemek Kitszel 2024-09-30  112  	ice_dump_ethtool_stats_to_fmsg(fmsg, event->tx_ring->vsi->netdev);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  113  	devlink_fmsg_obj_nest_end(fmsg);
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  114  
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  115  	return 0;
f19878b2a2e6e4 Przemek Kitszel 2024-09-30  116  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

