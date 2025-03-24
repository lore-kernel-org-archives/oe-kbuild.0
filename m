Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FB9202C22
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799109; cv=none; b=SbZqMaOurG/UNCR0acvOTaF/MDRWLCzpm7jz7vuIUDF+DOv84mHTm/FLb/BqT93L1+7MhTYlNPPsSrUy6+UYTxrz36TDFFrQTC4ZHr6OOoPxZk8ILlkuxJbmkj8QTR8ptTBa1lLGsIT+ftiWlBr1g5u1DMdPGwpFgeDYktc4TN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799109; c=relaxed/simple;
	bh=DoNq7mL0WX4FCM+tE0Bum0x/YvU+JeSeY8Am7PowGR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVqdAJhIPjsgj7eBqRu2qwk1XvOHoKgi+iVfLjvlvIVK+stjrHVfVftN8fLyHFxRQLXzqoBHUB08MGiFCqjnbTg5Llteva8mTgm0KWM66ihtAt/3B4m6a2H7QegpjFO4bt9ONfffKyge6WsJD7shbll6I2x5v0w+8wPwYkyOlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7XeUN7C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7XeUN7C"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so21886395e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 23:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799105; x=1743403905; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2HYgulQwPxEnOb3mWh0TIcqunnJLO/LyYSHwrTZdsY=;
        b=U7XeUN7CbL9TPOU5f3YMpLe+IqJdmOLWnoivO/Jf5knpamYyR3dg5QtoUNbPFXOeuy
         orIuDNoxlrKyCJVL8bdUEGh9qemFU7LI1UmZ8af6E6SSOuGBRZDKpqO/pzsmdCAQ2QB5
         07TvG39AGmkqZSPdzHv8GqAefzhC1giPidjAaLupNwI86s7HoPttR/FZsCEnx35ZT4xo
         dQfK5DXSaB5tNBDRUfM5MP2GHaXYED7VWoOA5Ehpm159Bh6gqoNKyW1NLu78sH4O92zS
         RcHN0DrAWZxRZ1Pzp8yI1aC2JkIhdzAMsFXv9SgBl905qMX3Cv1x3c95bsRLUpiuqE87
         T3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799105; x=1743403905;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2HYgulQwPxEnOb3mWh0TIcqunnJLO/LyYSHwrTZdsY=;
        b=Mb6eHw8mBdqGxAAnDbwKm8XVUcFfP7EkyNZHARFEMmavhJiH7FlV5CU9H4uccBz21U
         RTShinzLBsU45y+WzzwAnXZSK7vAHrmR8WmG8w6LwAko908kFJ7qb4Jq0nBUJ3PqwBc3
         o8geyEpitN0gApmpndaR8/0bYTCEHW95uuMND9oPDOJ+16ve3C1vvJwbId01994jgC15
         lvDT7Fc+gvMXJS+Rwm1kdUWG9eB7ti4D8ApKHFQFXuVJ/qcZuSu3MX9/joy2ToeIzYO0
         HTBJX1UBLKmJIo4RGPJ5J65mPcjUysJGQnyqbprW9sgQQU2PnzWRmaOjy3o1Oj3sqzJ7
         ZUfw==
X-Gm-Message-State: AOJu0Yx4rbPFAdngDIavDcj9OXQThIVaEpscTcID6uKk7hc0sDOTEcyJ
	jiI9/GoudZ0KO928MRwqvVLJC8xXgH/mHGIa0twgG/WWBNSw5nzGOYYqYo/puWTGrYQWlfqrRrD
	eI7I=
X-Gm-Gg: ASbGncuDWQLZyFprER46ow5kJvzI9t7eTD2oI3G6BreTUhzqXWREXLeZwPnNd1fxjlh
	qTb1T6PVPPbXy3Ke/aWa9cc6Il2uAWcKXgwJf+GySxk7rVnMyGyg4z7lxDaGJmXTLyIbSswFX3X
	tFBqw5tUrNwyZVJ4JaG43NTwA58GZOO7XVgoR03YNyeD+xWkzt5DcC7A5ugiUGTtLaLtlu9qjQS
	sHvGo78CNgEeC5RalqvHz5Zilr0ikwiUW5wwWiRoI4k3szlI4nBeWVYjfm46HcUqljY2w5RfO6K
	BLcTmTAHMnDhb2oPWlXYYPoZw4cfw3IaPVNedOiZii/dzyMIUA==
X-Google-Smtp-Source: AGHT+IGqbBeMGSdr0jl/CMLk9FKN2M7Nueoy8Q8p2ZdyOZBftLTXR6LTDzG3e7k9YDISs845CQ162w==
X-Received: by 2002:a05:600c:5488:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-43d50a219a4mr113894885e9.23.1742799105479;
        Sun, 23 Mar 2025 23:51:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f47196sm159921835e9.16.2025.03.23.23.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:51:45 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:51:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yizhen Fan <fanyizhen@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 drivers/ub/urma/ubcore/ubcore_cmd.h:134 ubcore_copy_to_user() warn: maybe
 return -EFAULT instead of the bytes remaining?
Message-ID: <aac718c5-880e-4763-8b31-12b66f4bb3cb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a7973281031cedabf6c66de13ffc2c313a71695f
commit: aeda8188894b2ed9ecf04dabaf5e147bce811725 [2818/2818] ub: change name in kconfig, and kconfig content of ub
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250323/202503232011.rximxwnv-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503232011.rximxwnv-lkp@intel.com/

New smatch warnings:
drivers/ub/urma/ubcore/ubcore_cmd.h:134 ubcore_copy_to_user() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/ub/urma/ubcore/ubcore_main.c:506 ubcore_query_res_arg() warn: returning -1 instead of -ENOMEM is sloppy

vim +134 drivers/ub/urma/ubcore/ubcore_cmd.h

95c713224477ac Yizhen Fan 2023-09-09  128  static inline int ubcore_copy_to_user(void *args_addr, const void *args, unsigned long args_size)
95c713224477ac Yizhen Fan 2023-09-09  129  {
95c713224477ac Yizhen Fan 2023-09-09  130  	int ret = (int)copy_to_user(args_addr, args, args_size);
95c713224477ac Yizhen Fan 2023-09-09  131  
95c713224477ac Yizhen Fan 2023-09-09  132  	if (ret != 0)
95c713224477ac Yizhen Fan 2023-09-09  133  		ubcore_log_err("copy to user failed ret:%d.\n", ret);
95c713224477ac Yizhen Fan 2023-09-09 @134  	return ret;

copy_to_user returns positive values, should we return negative error
codes?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

