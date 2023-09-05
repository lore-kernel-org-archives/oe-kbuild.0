Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46F6AAB
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Sep 2023 09:43:39 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31c8a710545so2181580f8f.3
        for <oe-kbuild@lists.linux.dev>; Tue, 05 Sep 2023 02:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693907018; x=1694511818; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UpiUtwEG57yUoUMIPXKn2jZSIqj4kFtR6v5M6IQNh7k=;
        b=GZpBXIN/0E1yRYJH65DNimevv0/n2MrZaEtWDdFZD/gh1aeK7B+8XL99sEtHaSmMfq
         N+S6Fv3oFoVm7DMp/4a2dX3DH6UKetTnPRqpNOFFkCw/j87c2iHbQ/92XIDUNZjjZDLB
         rYdYxMyUiqbCqDRmtrrXjpHsE5sR44YgppQNx683cn7Dh4hVh3UMSbO/h//CNix8sP8C
         ucvbNrVp3UggIH8ghJg7dG7lx0GwjuviCzf0WY7y6d4bTgw/KHcsdz/pso/bHN8Xq+Rs
         OAdGA3n1jEnssT1Wx/RdBMGsqNUJiq33a5Hxb/7JJ7ERo663nmXSF5G0lVj4QWf5VAoO
         jvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693907018; x=1694511818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpiUtwEG57yUoUMIPXKn2jZSIqj4kFtR6v5M6IQNh7k=;
        b=hDGnHL45GgOCAaAv+LFOOYg+KOFaqfJuY1pgXEYZ7D1mc18LqX9w/SbXAc6d0sRg/Q
         mybLjPhBamESDDhg9q9GKaAEvikW9eTspQXzNVDNcjVe4jUSunxEhR4zxYqNz4QlNpiv
         Agy46lZhx3QdVIJXWSfX1EMamuJutBRYm24j0ttSsULDHUPtx7KCd7KBVN59RqTRGCfC
         k3QUeNEgMn0zfEVFdSIq0s2BXIJiUFIcqyBGCzUiUSG7xdKtdcmsQLwfNA4BHK9hhwf3
         55MbpUuKwpWvCnun+0nwkhrU+zRqSIzWp29Jh8GGnpVdJu5CrmESBybTNQdJ2GgaTjBK
         vtpQ==
X-Gm-Message-State: AOJu0Yw4r4c8+eQjrYPryFYrSoas4tqWRmxZqUZbeF734CAm75VTe9ut
	0nGCWv9/2glXeJlbjLWvNdpfQsyA1afcFiVe+Hc=
X-Google-Smtp-Source: AGHT+IFrk8CSDJHjZZRmgRNQU/EKHumlSYneDTJ1kNNl71v+EXW2nz83To0uIg8+JDqcpVyVfdCk2A==
X-Received: by 2002:a5d:678b:0:b0:319:71f7:2427 with SMTP id v11-20020a5d678b000000b0031971f72427mr8638419wru.66.1693907018036;
        Tue, 05 Sep 2023 02:43:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q20-20020a056000137400b003142c85fbcdsm17036908wrz.11.2023.09.05.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 02:43:37 -0700 (PDT)
Date: Tue, 5 Sep 2023 12:43:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, John Ogness <john.ogness@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.1.y-rt-rebase 21/51] kernel/printk/printk.c:2468
 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy
Message-ID: <a6fa0763-b82f-4eff-9e50-06519db5722d@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.1.y-rt-rebase
head:   90d96fee668dc306dd748393383c0fc74b798eee
commit: cf8dd889ea20ae7091d3b27029b07bef13298291 [21/51] serial: 8250: implement write_atomic
config: i386-randconfig-141-20230828 (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308281100.1LIdaKaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308281100.1LIdaKaP-lkp@intel.com/

smatch warnings:
kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy

vim +2468 kernel/printk/printk.c

09cbc4e64a7546 John Ogness 2022-02-04  2464  static int __alloc_atomic_data(struct console_atomic_data *d, short flags)
09cbc4e64a7546 John Ogness 2022-02-04  2465  {
09cbc4e64a7546 John Ogness 2022-02-04  2466  	d->text = kmalloc(CONSOLE_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2467  	if (!d->text)
09cbc4e64a7546 John Ogness 2022-02-04 @2468  		return -1;

Just return -ENOMEM.  Even if it doesn't get passed back to the user,
it's just better to do things in a normal way.

09cbc4e64a7546 John Ogness 2022-02-04  2469  
09cbc4e64a7546 John Ogness 2022-02-04  2470  	if (flags & CON_EXTENDED) {
09cbc4e64a7546 John Ogness 2022-02-04  2471  		d->ext_text = kmalloc(CONSOLE_EXT_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2472  		if (!d->ext_text)
09cbc4e64a7546 John Ogness 2022-02-04  2473  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2474  	} else {
09cbc4e64a7546 John Ogness 2022-02-04  2475  		d->dropped_text = kmalloc(DROPPED_TEXT_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2476  		if (!d->dropped_text)
09cbc4e64a7546 John Ogness 2022-02-04  2477  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2478  	}
09cbc4e64a7546 John Ogness 2022-02-04  2479  
09cbc4e64a7546 John Ogness 2022-02-04  2480  	return 0;
09cbc4e64a7546 John Ogness 2022-02-04  2481  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

