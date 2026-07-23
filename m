Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25595470EA2
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784768314; cv=none; b=lIyxP5sYj3uhy+MzPTMHxigPHola3ioatDncYigGBMElKly5t5z+TEA3Wnzc7KtbkRobUhubEjPhWA//sog3MgwZzLbOp7vGCwn3kYRzBC4aVQAfkXhRBxdmIVmqgcbiBD1sJyxDVG2gn7Prrxr+MKJ/yJ6LCSGgVGIaI0i9Uqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784768314; c=relaxed/simple;
	bh=D6kJ6HfRM8u52NLbOFJRVCdDh5MvMk0FUrqcWRLq+1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZhkPtSh3N8mjN2KWwUtuoRUNwhOn1MnukGdDeXko+zuwCso5+T0kPvqYepcEtGGm1SPzAKobGuxWGM7ObV22i/qEcc7K9JdbCGW8e0tm2FN9EVbr+1lXh9pGdxYhKInP9FKwXScn3LwYUBdVPb9xSlnCzwj3s0B0/avDgx28ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYMbR7pT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYMbR7pT"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so70342a91.3
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 17:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784768311; x=1785373111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojb7uXMLTtLntegvAbcLhdGBEA/zo23qUn4SlLGRyVQ=;
        b=LYMbR7pT8iAJOmq028k61E5ptIePzQrksemdH6fxwxc6fXRvx6cI/PL5SqapaMHvIW
         xQpmeiRIiJMfV9Ac0ib4AzIFCdkT+H+PwnnCeADYVxGDJYsEgi9Q5lrDNa80s3U2XHG2
         j4jKNg4bt4SMIkFcqb/LmPZpUyrwpwg1b3zFXI8HVEexv9Y2dIGNvg/ZPNcA1EhdKoT+
         7EL5AExMyc1LGFG43eoNZ5j96fSw8s2ZUdW8Oi4guHlNbwo3Upy2qxlcHE0PbN8AbFiK
         vn7aKIKsAregTaFrNYpuWCZZYBuXFUj0UlWmIFSUdX4h1ZF6p11PANzzGZCkK2+9r9A6
         mhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784768311; x=1785373111;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojb7uXMLTtLntegvAbcLhdGBEA/zo23qUn4SlLGRyVQ=;
        b=rd8ic9bg05M3whbOynmqGHROADMXcJMTTYOv7FEhtqEyg3rXmVeHm+D3w7EQx9fHnW
         R/UMkg9HxtigLtGRjkyjlP851mHf+KUhG9YtjVYeI8zEi+ZBjiBonhCyB3qabaGguVCx
         8AplEwbm95/ROWh2oBbSiz2ipUi3C9EDcMxO662dEDo/9qdpIxlXNqo+TO2Gwvj9AdsZ
         wFqbs8ESYgrAq/JEAYzWEVJ/lWlzi/HEa9+Da5W+sOij0FODbAzM1yDiekhRLEgVUgTD
         vWMyfStSB6QpnNrCAc0IaHigkryCebp3pti/Qt0N4AipfXcrCAcHAMU3wUnCqaD2TECW
         CfiQ==
X-Forwarded-Encrypted: i=1; AHgh+RrR30Zr7+eZpPBE2PCJVFg148bDwYAzVQ1UhxGKfCEt3nczWUAxZKPH08L9uCGOcNwfKHh/rJLsj8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKnFVwVAsW3p4oT/KBtXPoWjN965BGDX9A8S+jRAodoo+ASned
	3QQ4UAF02oM9bzgfGAhYgdUayoj6YQxwzgTZXQSE14Wjhm9iViPxSEKZfQQS/mo/a2NwPw4PceF
	ybCrPJR2j
X-Gm-Gg: AR+sD13wSGGBnk/w6NlQU/NeqtXNnBCcaR3FsfgbFNBdR8eu+9RcBnzf+hVAIM0QoMg
	+qIZVQbPBxdTJsWC+8cnSlu8w5GX/FHCac2njBypOGrM0ud3i02BzYkJfnICzePszXU49X+oJzV
	XisA0zOHVn8rkIzfYFPBTmoui12pEwlO87HCnd46y4UoEOkxEJUSv/VC5H3nRwQ1AItyo3spVHn
	kKDCqEqNuLXc7WgwmkqmXwJcDlFEffxDKV5t/Cpvqr+6UKhCcXoQ8USO1SowbYL31jQiURSKeH2
	tchk3g6YsuxiULw0FKUFsdva7RZyvzEIoZDI581CmSVhpP7sLnrAw7Het/92rSfZHkL3fyBWvtu
	g95QsR9HLshIObivyArveJMyeBDwvTTGUI7kH5dekqF2K+HifXpVg3+7IRMomeOpZK3CWm8YJJx
	auEjbmVdXmJwcRjhbEGU/M0nP8Rj5iFk6Syw75JG/WmRV6OnhNjzbSJy788uYxMgxvPfjgv8Q/2
	3jKDV9uSv4026zACRA4J4W+e762u2/VV5PVassVcbUSYls=
X-Received: by 2002:a17:90b:2d46:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38ec645ef7bmr916363a91.1.1784768310517;
        Wed, 22 Jul 2026 17:58:30 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:12b6:1edf:5a83:d13b? ([2a00:79e0:2e7c:8:12b6:1edf:5a83:d13b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm9619659c88.11.2026.07.22.17.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 17:58:30 -0700 (PDT)
Message-ID: <0b6cb0d3-58e1-4cf8-b7f8-63d4b2c0a618@google.com>
Date: Wed, 22 Jul 2026 17:58:26 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/power/supply/max77759_charger.c:533:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Cc: Julia Lawall <julia.lawall@inria.fr>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <202606060122.MH7UDsNR-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202606060122.MH7UDsNR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 6/5/26 10:37 AM, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Amit Sunil Dhamne <amitsd@google.com>
> CC: "André Draszik" <andre.draszik@linaro.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
> commit: 70d7dd27f6dc9bada652c3a84ba7e6688a96f8db power: supply: max77759: add charger driver
> date:   10 weeks ago
> :::::: branch date: 20 hours ago
> :::::: commit date: 10 weeks ago
> config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260606/202606060122.MH7UDsNR-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202606060122.MH7UDsNR-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/power/supply/max77759_charger.c:533:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
> vim +533 drivers/power/supply/max77759_charger.c
>
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  504
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  505  static int max77759_init_irqhandler(struct max77759_charger *chg)
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  506  {
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  507  	struct device *dev = chg->dev;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  508  	irq_handler_t thread_fn;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  509  	char *name;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  510  	int i, ret;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  511
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  512  	for (i = 0; i < ARRAY_SIZE(chgr_irqs_str); i++) {
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  513  		ret = platform_get_irq_byname(to_platform_device(dev),
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  514  					      chgr_irqs_str[i]);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  515  		if (ret < 0)
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  516  			return dev_err_probe(dev, ret,
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  517  					     "Failed to get irq resource for %s\n",
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  518  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  519
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  520  		chg->irqs[i] = ret;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  521  		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", dev_name(dev),
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  522  				      chgr_irqs_str[i]);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  523  		if (!name)
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  524  			return dev_err_probe(dev, -ENOMEM,
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  525  					     "Failed to allocate space for irqname: %s\n",
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  526  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  527
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  528  		if (i == BAT_OILO)
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  529  			thread_fn = bat_oilo_irq_handler;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  530  		else
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  531  			thread_fn = irq_handler;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  532
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25 @533  		ret = devm_request_threaded_irq(dev, chg->irqs[i], NULL,
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  534  						thread_fn, 0, name, chg);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  535  		if (ret)
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  536  			return dev_err_probe(dev, ret,
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  537  					     "Unable to register irq handler for %s\n",
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  538  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  539  	}
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  540
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  541  	return 0;
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  542  }
> 70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  543
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>  From mboxrd@z Thu Jan  1 00:00:00 1970
> Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
> 	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
> 	(No client certificate requested)
> 	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BA73ACA7A
> 	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 06:34:14 +0000 (UTC)
> Authentication-Results: smtp.subspace.kernel.org; arc=ne smtp.client-ip2.198.163.18
> ARC-Seal:i= a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
> 	t84702057; cv=none; b=n0kwz9pz3RT90aQg+l4ajuzAbEwabWHfolRGbrn/mhIzDVqHXUeJEtPL6qThNhEmF0lG3TIxFnFTzk2x5+Y8K0560Tc08G3mqykhCiZtInLAD2pLmTpzyEjEdbo8HYC3Zsz0udIz9NPNc2yrG9REZzleTOtuVI4BRQ8eXAcBEGgARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
> 	s=c-20240116; t84702057; c=relaxed/simple;
> 	bh=49DpW+q/2tIK5uUDs1yXMX4vQXsfweYhXlLPkv6kg=;
> 	h�te:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uSvmvizUwOGh18cC2wTWazsp2LgJcow/FavpQ95gFVBeyHlxGYDi1Hq0B+FXKzza/MroECpi/6XAp+aXrRD4Qz4zd8nuWctDLEmWfvuO+gP8OBLgYPqOJ5K+eRR8aoCatjI1pV7OJcOS8eE+O0/8AjInIci857dk7tY5bECs8SYARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifzNVmSY; arc=none smtp.client-ip2.198.163.18
> Authentication-Results: smtp.subspace.kernel.org; dmarc=ss (p=none dis=none) header.from=intel.com
> Authentication-Results: smtp.subspace.kernel.org; spf=ss smtp.mailfrom=intel.com
> Authentication-Results: smtp.subspace.kernel.org;
> 	dkim=ss (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifzNVmSY"
> DKIM-Signature: v= a=rsa-sha256; c=relaxed/simple;
>    d=tel.com; i=@intel.com; q=dns/txt; s=Intel;
>    t84702055; x16238055;
>    h�te:from:to:cc:subject:message-id:mime-version:
>     content-transfer-encoding;
>    bh=49DpW+q/2tIK5uUDs1yXMX4vQXsfweYhXlLPkv6kg=;
>    b=ifzNVmSYwbF9wi7hKHOun2C8cBBwbJ9bmwZ0QlAW975RlEXXwr4Dmcgy
>     CuXmYYe7kXjayYjdcGjCYh1NH1+gkIsyEyvhFZwONe+ZknN5Dmjda3KZa
>     WQb3AF1ZGo/BGX1AMu4++u3ahntUdJ77/ZGvT3RJBZf5kNHscTynxMA5L
>     RZCDSvHLXZHR4AOy+O5rUHHvqxyu8FKg0BmuKCyILha7Q+PC14d+QSzUB
>     pVk240eiPg5BkH9uzFIlJdLrzfkoJhQwtKpdOs0zg6nd7ooEfhFhKXKHo
>     ed5szAmdlZoiMcnn+nbdQ/05Bm1zvGPI6tIrsnujhYBIqulci5VtOqhnu
>     g=
> X-CSE-ConnectionGUID: 0LxKW371SXiKMRQlym7nPQ==X-CSE-MsgGUID: qpLbslLnTouY3we6stFgZQ==
> X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84451865"
> X-IronPort-AV: E=phos;i="6.25,178,1779174000";
>     d=can'208";a="84451865"
> Received: from fmviesa006.fm.intel.com ([10.60.135.146])
>    by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 23:34:14 -0700
> X-CSE-ConnectionGUID: Bd0/Spj4QGKJZzB55Me8yQ=X-CSE-MsgGUID: 22mAerj0TbuQ8sckAuKP2g==
> X-ExtLoop1: 1
> X-IronPort-AV: E=phos;i="6.25,178,1779174000";
>     d=can'208";a="253622254"
> Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
>    by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 23:34:13 -0700
> Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
> 	(envelope-from <lkp@intel.com>)
> 	id 1wmQWx-00000000YVp-0Xzj;
> 	Wed, 22 Jul 2026 06:34:11 +0000
> Date: Wed, 22 Jul 2026 14:34:00 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: drivers/power/supply/max77759_charger.c:533:8-33: WARNING:
>   Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
>   it is nested IRQ)
> Message-ID: <202607221416.dzApaL2T-lkp@intel.com>
> User-Agent: s-nail v14.9.25
> Precedence: bulk
> X-Mailing-List: oe-kbuild@lists.linux.dev
> List-Id: <oe-kbuild.lists.linux.dev>
> List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
> List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
> MIME-Version: 1.0
> Content-Type: text/plain; charset=f-8
> Content-Transfer-Encoding: quoted-printable
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Amit Sunil Dhamne <amitsd@google.com>
> CC: "André Draszik" <andre.draszik@linaro.org>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   248951ddc14de84de3910f9b13f51491a8cd91df
> commit: 70d7dd27f6dc9bada652c3a84ba7e6688a96f8db power: supply: max77759: add charger driver
> date:   4 months ago
> :::::: branch date: 15 hours ago
> :::::: commit date: 4 months ago
> config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci/archive/20260722/202607221416.dzApaL2T-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202607221416.dzApaL2T-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
>>> drivers/power/supply/max77759_charger.c:533:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

This is a false positive. The IRQs requested in max77759_charger.c are 
virtual IRQs (vIRQs) allocated by the regmap-irq chip 
max77759_chgr_irq_chip registered in the MFD core driver. regmap-irq 
marks all its virtual IRQs as nested IRQs (irq_set_nested_thread). Thus, 
a oneshot flag may not be necessary when no primary handlers are 
registered in this case.

Regards,

Amit


> vim +533 drivers/power/supply/max77759_charger.c
>
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  504
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  505  static int max77759_init_irqhandler(struct max77759_charger *chg)
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  506  {
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  507  	struct device *dev = chg->dev;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  508  	irq_handler_t thread_fn;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  509  	char *name;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  510  	int i, ret;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  511
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  512  	for (i = 0; i < ARRAY_SIZE(chgr_irqs_str); i++) {
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  513  		ret = platform_get_irq_byname(to_platform_device(dev),
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  514  					      chgr_irqs_str[i]);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  515  		if (ret < 0)
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  516  			return dev_err_probe(dev, ret,
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  517  					     "Failed to get irq resource for %s\n",
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  518  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  519
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  520  		chg->irqs[i] = ret;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  521  		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", dev_name(dev),
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  522  				      chgr_irqs_str[i]);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  523  		if (!name)
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  524  			return dev_err_probe(dev, -ENOMEM,
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  525  					     "Failed to allocate space for irqname: %s\n",
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  526  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  527
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  528  		if (i == BAT_OILO)
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  529  			thread_fn = bat_oilo_irq_handler;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  530  		else
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  531  			thread_fn = irq_handler;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  532
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25 @533  		ret = devm_request_threaded_irq(dev, chg->irqs[i], NULL,
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  534  						thread_fn, 0, name, chg);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  535  		if (ret)
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  536  			return dev_err_probe(dev, ret,
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  537  					     "Unable to register irq handler for %s\n",
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  538  					     chgr_irqs_str[i]);
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  539  	}
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  540
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  541  	return 0;
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  542  }
> 70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  543
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
