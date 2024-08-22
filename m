Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1D1147C7D
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Aug 2024 08:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724402436; cv=none; b=UPCo93NqVhC18P0Szhz2XDqKVikUr+CkLzOtlQ1xl3vraHvyLT9F3DodvVI+ZbNiFYPQ+QlRPBXIVmy0mrCXxqCECQrgGXz8K5uqILPrIZSze0H7OW4EFe8+hAdR+JDegft7FHBAikpMcg/HEDhRq67l7in4vdDfrnAuyAs2ln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724402436; c=relaxed/simple;
	bh=MPpSvhXKREC/ElYnGUBquMdLOn7YSD6rY0F7dmj//Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eU4KnwirjxsX+Vi24nY1II51zPnmpVhG+VZ5Y6GwmaeNM2tlI4WueMmW0TqLF6jGTLYEs3RyJ7FHZu0VCB2uY/uDzmNdNAlnOimhu/HMBkKkJPRrtpYXHvWygMCszNVbHB//DSnFroqmMhAc22/tACNQcfgwD2Y8OgeYJIoJgsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkU0RX1f; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkU0RX1f"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86984e035aso171645566b.2
        for <oe-kbuild@lists.linux.dev>; Fri, 23 Aug 2024 01:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724402433; x=1725007233; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HkT+F4NQdxWdx9VAgSQrfQE4425V0dbc4KVL3cYctNg=;
        b=TkU0RX1f0ZYpgXzBER9WU82BTK7IuRhHn8iDXnDS8wsGiGwM7YM0V6mwKK0LR+EKWC
         JKN3W/sLP1gjECmkm3BNsVvq0VKsAl1EmQnGG6cAwsn5k2Riwx6gTOk2GRzEHZySaG8m
         qEHxiH++x+7sY473Nsck434q+/IlRs5+/ylQP9J2nK6VCpJoH4eJKMIRiYKFTNfYoFsl
         CyNPio52AGQLxwYFi7fCNHNmpwenatayfhe7KIjpFnp8NFV3ZGF/B3vUb+QWLi7NhtWS
         zpajbrLZ5n3I/85MJd/zXKqUelgJihRJlXc/jLRRj4C8Sk/lXwIo33RXTdkouJKBo1lG
         P7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724402433; x=1725007233;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkT+F4NQdxWdx9VAgSQrfQE4425V0dbc4KVL3cYctNg=;
        b=pr/a3fg9i3e6xAD6nT3YKaF2NQyaHCO1xhAgvacOQ4lPL5Cp9jb8tVh+vCqmMyiz+x
         3L1n8O+RIS9z/oKIy7NFlVv/IoYtAm92REKjbKM3c0xoFRNe8AmszdYX06EG07JOOAzn
         LZlDaLDyxCCLZ/hfzRTs4/k9+AhF8U7eHUUOovSA0i0gNtll6DG7vOZ0B+dMWrjUZHSN
         97j5b4nNgIdyNXNv66mo6slLHS7EV+FLQMjSu3I4Po+jm/KtI1IzDZgFpM+n4siJoeBP
         FiseH2cEsjw3eCpQhBMbxo0su+zsyQI0It/k88fiW9cZQuyoPY8Jx0G96Qb4xFHQj4gK
         Osww==
X-Gm-Message-State: AOJu0YyhmdxKOLTv/Rfl8/zluC0mqDGWO2lx8smXo/kyAt55D2xnvxh0
	hE6lxMfUISTFsrxU6Exn033NFB6EjrsBX5GyY0E2rzee3lkJkYRsKoZARjTFY1oDA1dZ1h5Vwll
	g
X-Google-Smtp-Source: AGHT+IH6IQRUkG0GF5SlfIgB5Ez1oe4Di4eEakTkc8stgAJ46DD67d9s1awHV5WebEgy7keS5wHNLA==
X-Received: by 2002:a17:907:6d25:b0:a86:a77e:83b1 with SMTP id a640c23a62f3a-a86a77e8669mr80780166b.47.1724402432724;
        Fri, 23 Aug 2024 01:40:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f21fe5esm228850466b.8.2024.08.23.01.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 01:40:32 -0700 (PDT)
Date: Thu, 22 Aug 2024 21:43:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5654/6069] drivers/thermal/testing/zone.c:189
 tt_add_tz() error: uninitialized symbol 'tt_work'.
Message-ID: <a01dc997-2fc8-4057-9cec-14d68cb2f23d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 707bc0f91a35b7bd0c139e0bf49b2b3d32a6d207 [5654/6069] thermal: Introduce a debugfs-based testing facility
config: i386-randconfig-141-20240822 (https://download.01.org/0day-ci/archive/20240823/202408230001.FacU2bQ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408230001.FacU2bQ2-lkp@intel.com/

smatch warnings:
drivers/thermal/testing/zone.c:189 tt_add_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:241 tt_del_tz() error: uninitialized symbol 'tt_work'.
drivers/thermal/testing/zone.c:337 tt_zone_add_trip() error: uninitialized symbol 'tt_trip'.
drivers/thermal/testing/zone.c:395 tt_zone_register_tz() error: uninitialized symbol 'trips'.

vim +/tt_work +189 drivers/thermal/testing/zone.c

707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  186  int tt_add_tz(void)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  187  {
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  188  	struct tt_thermal_zone *tt_zone __free(kfree);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02 @189  	struct tt_work *tt_work __free(kfree);

These need to be initialized to NULL

707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  190  	int ret;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  191  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  192  	tt_zone = kzalloc(sizeof(*tt_zone), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  193  	if (!tt_zone)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  194  		return -ENOMEM;

Otherwise tt_work is uninitialized on this error path.  The other warnings are
the same thing.

707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  195  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  196  	tt_work = kzalloc(sizeof(*tt_work), GFP_KERNEL);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  197  	if (!tt_work)
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  198  		return -ENOMEM;
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  199  
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  200  	INIT_LIST_HEAD(&tt_zone->trips);
707bc0f91a35b7 Rafael J. Wysocki 2024-08-02  201  	mutex_init(&tt_zone->lock);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

