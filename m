Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE77364;
	Mon,  3 Apr 2023 04:31:25 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i5so112284761eda.0;
        Sun, 02 Apr 2023 21:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680496283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PkRESlJbZe0LvYDM0XBspGnFIPtDURNWtIWiJ2X5SjE=;
        b=ZbHv2r8Ktd5QiZrnBtOxT7Mk+h1xwmbWqaCifz8aaEuh5wVoqBA3W6yZ9UfuBVK1Jm
         qkeuc3aOOr2M8WsZeH3v9Jy7EdpZ0UojMHZwwsMK2rdNs+wIFqdBiZGPGtEY9wj/xCxZ
         zRFRAI17/IeJf2hoLgbX87BCRHpQQV5tGYxe0bxJu4TRumN2Muk7u0Mq4eiQ8H8s1cpq
         utvDWACs6rQQrKMdDH3wZ839QjPyGXoIQHbQbgs1fBAjUOCqrJq2/oDX2+UPMCKMVpM3
         dgDxUYQ8LYQcCM5oG1W/FLwuAIQK6Hdi+nfrlQLi6U1tqp9ekAlolwF80LnMiJU1ZGb2
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680496283;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkRESlJbZe0LvYDM0XBspGnFIPtDURNWtIWiJ2X5SjE=;
        b=gU1OzcFV2UN/+6JVRPP6TXan0meWYpXuED/9fkbck1dm2llplhiyGLkR1q+83TbmBa
         ZOuCh+KFFA3Q5p6OIZ9L4QsoiRfaCDq7w/TezmbcO1ldrVLp67NTDYnl6j+nU14czXf2
         uWp6O4xJ4w046NAykxcogCwYUV79Z8qsRpJvERLt86ds6UTnADgbJOmzyD1zucOVtrcW
         WLa3Wy2r6ejT4nmaEuaCcHnuIBRN7PvwHAt3hDJaMv0S0QU4mQh4TbcUunnZ6Ux9Eed6
         gtHRXaC/UdQEgJSX5MXtSHTs8qpal0lkuHzEWUlxzDYa08rDEDa5KOy8tlNcKGBgGYAu
         6/8w==
X-Gm-Message-State: AAQBX9e7zIcyHMv7jqU862tWqi0y7wNrx9C33NK3xG2n98obtCosQ0A6
	N0ypkjKqF0TP34SXODbYTcX45QB3afs2OA==
X-Google-Smtp-Source: AKy350aSFhOtVydWaJqjb11e28VLkg7kXSNCAvSug1OMlJ64zoMZT5BufdmLmdwKcl6y/x15x+6TqQ==
X-Received: by 2002:a17:906:5646:b0:930:7d8f:15a4 with SMTP id v6-20020a170906564600b009307d8f15a4mr34497884ejr.53.1680496283252;
        Sun, 02 Apr 2023 21:31:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709063ac800b00947ed087a2csm2829652ejd.154.2023.04.02.21.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 21:31:22 -0700 (PDT)
Date: Mon, 3 Apr 2023 07:31:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: drivers/clocksource/exynos_mct.c:635 mct_init_dt() warn: missing
 error code? 'ret'
Message-ID: <20bf4e9b-c78d-4e6a-a5af-6accdd20a499@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: e8550f0e7bde9bd31697e3c534d386f7f3b5787b clocksource/drivers/exynos_mct: Support frc-shared property
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304021446.46XVKag0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304021446.46XVKag0-lkp@intel.com/

smatch warnings:
drivers/clocksource/exynos_mct.c:635 mct_init_dt() warn: missing error code? 'ret'

vim +/ret +635 drivers/clocksource/exynos_mct.c

5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  613  static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
228e3023eb0430 drivers/clocksource/exynos_mct.c Arnd Bergmann      2013-04-09  614  {
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  615  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  616  	int ret;
36ba5d527e9567 arch/arm/mach-exynos/mct.c       Thomas Abraham     2013-03-09  617  
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  618  	ret = exynos4_timer_resources(np);
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  619  	if (ret)
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  620  		return ret;
3a062281129229 arch/arm/mach-exynos4/mct.c      Changhwan Youn     2011-10-04  621  
7cd925a8823d16 drivers/clocksource/exynos_mct.c Marek Szyprowski   2021-11-01  622  	ret = exynos4_timer_interrupts(np, int_type);
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  623  	if (ret)
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  624  		return ret;
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  625  
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  626  	ret = exynos4_clocksource_init(frc_shared);
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  627  	if (ret)
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  628  		return ret;
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  629  
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  630  	/*
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  631  	 * When the FRC is shared with a main processor, this secondary
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  632  	 * processor cannot use the global comparator.
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  633  	 */
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  634  	if (frc_shared)
e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09 @635  		return ret;

This is zero, but it looks like it should be a negative.  Changing this
to either "return 0;" or "return -EINVAL;" would clean up the ambiguity.

e8550f0e7bde9b drivers/clocksource/exynos_mct.c Vincent Whitchurch 2022-06-09  636  
5e558ebd3d88d3 drivers/clocksource/exynos_mct.c Daniel Lezcano     2016-05-31  637  	return exynos4_clockevent_init();
30d8bead5a3094 arch/arm/mach-exynos4/mct.c      Changhwan Youn     2011-03-11  638  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

