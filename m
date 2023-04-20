Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E33E23A5
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Apr 2023 06:03:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n31so75400wms.3
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Apr 2023 23:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681970594; x=1684562594;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmEgFBfwchfzHgz+eMAJeJBu9FrtDqhNCfW3PWW2tr4=;
        b=DHXHYFuyoix40cp3/QHR+tBOlX9bWNjYMx9sIlCygICzlfDms6ktKuLynD8FqNINDv
         XX/xRE5FPYBKhOgXEWk6s+DAAPPLigAfqHyrBJQDA2UvDOhcVeiEFUFNK0cGoKTssXAh
         ygQJwiHzDL/aHg/3yctQZCRkNm8oyXco2yQ2Yrn6cG1chpkLGut4bwwmTuze88r+5Kmp
         lPydwTV8VvHhyyYYu5n94ZqbKWFBDTSuhgUs4PkPNOq+yA3mlT0ww5d8TK13e7BQcbE4
         okM5ij785jTHiLLqpiG19/2zic9Tvk5dSMhVL+az/P8+zalXCWS1EJpeJ301AOFHlDQJ
         vTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681970594; x=1684562594;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmEgFBfwchfzHgz+eMAJeJBu9FrtDqhNCfW3PWW2tr4=;
        b=gfEfjn+jTrU89twLKdjKmawN0AeIvjnY0UjNzcbqh2O661AnH1+EmWciZJyb807U5h
         lFX3iROWgmcpLIjWF6vOdrKYAhP1JfxjMGicTQt2KHsFBsRlPNQDAQYpGRf0NuDJHIag
         3fynOvr8bKtQzHyLBIs056vVABsZvZLpw0dcql6BXpVON0DtxTzlJxsF8VW/vR5jRlXC
         dmBt56zDBCDVM4+ZpI7g4Oo+uHeqJh/i1cPxG8ZQD4XuwPcBWL376GQd0tXu3+kzhWZK
         FqasuibW11jXRCA3PNUlJnsrRPxsXIT8fI670UNbluJz+XJX/zu308vzg0SGNeFgQUI0
         xofA==
X-Gm-Message-State: AAQBX9canzeLb47YG5glfoa3CcsPmmT+2/MmdiISWSEMzQkLHY+rRgYV
	4cYjXMYAeOHoD8yQlQlY4tAZpBCKF9+avtJTHNV60mUB
X-Google-Smtp-Source: AKy350Y73yJ7I1goujlTCZpSrMGHG6Grd8Kujl+B3MPQmCzKGTcIqPKroUH+nusoqb5DaiwR3B+vuQ==
X-Received: by 2002:a7b:c38c:0:b0:3eb:42fa:39d5 with SMTP id s12-20020a7bc38c000000b003eb42fa39d5mr211675wmj.29.1681970593576;
        Wed, 19 Apr 2023 23:03:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w9-20020a1cf609000000b003ede06f3178sm869079wmc.31.2023.04.19.23.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:03:13 -0700 (PDT)
Date: Thu, 20 Apr 2023 09:03:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Etienne Carriere <etienne.carriere@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [linux-next:master 6897/13075] drivers/tee/optee/smc_abi.c:1021
 irq_handler() error: uninitialized symbol 'value_valid'.
Message-ID: <d9b7f69b-c737-4cb3-8e74-79fe00c934f9@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3cdbc01c40e34c57697f8934f2727a88551696be
commit: b3b4ced12c1bc829888803ce07fff317e590ec1c [6897/13075] optee: add per cpu asynchronous notification
config: arm64-randconfig-m041-20230419 (https://download.01.org/0day-ci/archive/20230420/202304200755.OoiuclDZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304200755.OoiuclDZ-lkp@intel.com/

smatch warnings:
drivers/tee/optee/smc_abi.c:1021 irq_handler() error: uninitialized symbol 'value_valid'.
drivers/tee/optee/smc_abi.c:1028 irq_handler() error: uninitialized symbol 'value_pending'.

vim +/value_valid +1021 drivers/tee/optee/smc_abi.c

b3b4ced12c1bc8 Etienne Carriere 2023-03-22  1011  static irqreturn_t irq_handler(struct optee *optee)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1012  {
6749e69c4dadd3 Jens Wiklander   2021-06-15  1013  	bool do_bottom_half = false;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1014  	bool value_valid;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1015  	bool value_pending;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1016  	u32 value;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1017  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1018  	do {
6749e69c4dadd3 Jens Wiklander   2021-06-15  1019  		value = get_async_notif_value(optee->smc.invoke_fn,
6749e69c4dadd3 Jens Wiklander   2021-06-15  1020  					      &value_valid, &value_pending);

The get_async_notif_value() function can return zero without initializing
*valid_value or *value_pending.

6749e69c4dadd3 Jens Wiklander   2021-06-15 @1021  		if (!value_valid)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1022  			break;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1023  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1024  		if (value == OPTEE_SMC_ASYNC_NOTIF_VALUE_DO_BOTTOM_HALF)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1025  			do_bottom_half = true;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1026  		else
6749e69c4dadd3 Jens Wiklander   2021-06-15  1027  			optee_notif_send(optee, value);
6749e69c4dadd3 Jens Wiklander   2021-06-15 @1028  	} while (value_pending);
6749e69c4dadd3 Jens Wiklander   2021-06-15  1029  
6749e69c4dadd3 Jens Wiklander   2021-06-15  1030  	if (do_bottom_half)
6749e69c4dadd3 Jens Wiklander   2021-06-15  1031  		return IRQ_WAKE_THREAD;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1032  	return IRQ_HANDLED;
6749e69c4dadd3 Jens Wiklander   2021-06-15  1033  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

