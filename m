Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3088F6A
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkxMvM7P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c0e7b8a9bso383775e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Dec 2023 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701672922; x=1702277722; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWZ3xHevBq7/IxqTa8ww23Un8tQbcWbjjl38PMj7wwE=;
        b=xkxMvM7P4z5Stonnc3gD6Q24vmgZrqfKtr6CQ6hIMl9WJQ2A3mO75haM216sdlRetH
         4bHubozXEOau5p5jABDAvfRxai/lULauGq6SzSK42nyqG4oA/mG7EOrWP3vtr1U382wO
         4//8hTDDjU3tGqxWR+XOgk1hsWjdkaUP21755H5g2JUI0JuMiswFoznFw6CuWkMJrlnU
         FYh/cJo7BpjNaQ6VdLnEc1I54urscI9XD4uMcZoqxEsUFaCeQ/Z+ttGrQOkmACVLvVZt
         12cW04cwZxVgKnfkjqRdlVafS4CgTjQFiXGrEOxJ4JQ++/djGngf5YxQcD0ZAZP6X6CJ
         Kiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701672922; x=1702277722;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWZ3xHevBq7/IxqTa8ww23Un8tQbcWbjjl38PMj7wwE=;
        b=s2iH0+lryc7CML8olF5EAxSdnjEKPiojf6uiBIm5Kd3deBcvaXeUuvzp9SfqU0QmOA
         szsMzdNqVOzMKxZEq57F4k23tu2/Kz6bHUSNB9frAaKy4N3mPp5n52TJSfy0mTRjKd0R
         +xtyaUhTNHt96nqqpInHfpWeFnhtxcTkx7q3tj5uznN+0E2tDk6CvFm+HCG5hSzYTbc/
         fCtbLboFWSv4oOtRlO60pGsouCIWAM16LCRS9NtePY0bIGonJvMnN+dC5xOZ+zgWkqZS
         +Nt7AG+hyhoXb+vHL51JPaL739sNREgJknGMqP7KbDdmzZAZxk2tPF2Ucqc0Ke9cQ6Sm
         iEjw==
X-Gm-Message-State: AOJu0YyloU6DEm1UNwiKMEEYjZ2bY80Mo7MPvUT+UGhHwyN4G6CloppW
	0aueYxPcYTGzXsnsKecopXe6f+JL9VAO4+o2q6A=
X-Google-Smtp-Source: AGHT+IFiOHRh6KgggrgE9oHGoBI0IKj+Fa+i1jkpxKqSlUGD/Fc2nUUAsmd23wu7naHM5HjvVzS9Qw==
X-Received: by 2002:a05:600c:4e8b:b0:40b:5e21:dd1c with SMTP id f11-20020a05600c4e8b00b0040b5e21dd1cmr2258397wmq.74.1701672922626;
        Sun, 03 Dec 2023 22:55:22 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bd22-20020a05600c1f1600b004090798d29csm13892825wmb.15.2023.12.03.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 22:55:22 -0800 (PST)
Date: Mon, 4 Dec 2023 09:55:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: arch/nios2/kernel/time.c:223 nios2_timer_get_base_and_freq() warn:
 '*base' from of_iomap() not released on lines: 220.
Message-ID: <49db8904-e10d-4c91-be72-3dc182fb6e39@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: dd1364a7439be4d20f87637a72eb7bd4553827f0 clocksource/drivers/nios2: Convert init function to return error
config: nios2-randconfig-r081-20231120 (https://download.01.org/0day-ci/archive/20231204/202312040334.l78lahzX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040334.l78lahzX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312040334.l78lahzX-lkp@intel.com/

New smatch warnings:
arch/nios2/kernel/time.c:223 nios2_timer_get_base_and_freq() warn: '*base' from of_iomap() not released on lines: 220.

Old smatch warnings:
internal error: arch/nios2/include/asm/irqflags.h:25 SQL error #2: near "and": syntax error
internal error: arch/nios2/include/asm/irqflags.h:25 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
arch/nios2/kernel/time.c:139 nios2_timer_config() warn: inconsistent indenting

vim +223 arch/nios2/kernel/time.c

dd1364a7439be4 Daniel Lezcano 2016-06-07  209  static int __init nios2_timer_get_base_and_freq(struct device_node *np,
4182de9e6356c0 Ley Foon Tan   2014-11-06  210  				void __iomem **base, u32 *freq)
4182de9e6356c0 Ley Foon Tan   2014-11-06  211  {
4182de9e6356c0 Ley Foon Tan   2014-11-06  212  	*base = of_iomap(np, 0);
dd1364a7439be4 Daniel Lezcano 2016-06-07  213  	if (!*base) {
dd1364a7439be4 Daniel Lezcano 2016-06-07  214  		pr_crit("Unable to map reg for %s\n", np->name);
dd1364a7439be4 Daniel Lezcano 2016-06-07  215  		return -ENXIO;
dd1364a7439be4 Daniel Lezcano 2016-06-07  216  	}
dd1364a7439be4 Daniel Lezcano 2016-06-07  217  
dd1364a7439be4 Daniel Lezcano 2016-06-07  218  	if (of_property_read_u32(np, "clock-frequency", freq)) {
dd1364a7439be4 Daniel Lezcano 2016-06-07  219  		pr_crit("Unable to get %s clock frequency\n", np->name);
dd1364a7439be4 Daniel Lezcano 2016-06-07  220  		return -EINVAL;

Over the weekend the kbuild bot started going through some truly ancient
warnings.  Apparently we're supposed to iounmap() on this error path.

dd1364a7439be4 Daniel Lezcano 2016-06-07  221  	}
4182de9e6356c0 Ley Foon Tan   2014-11-06  222  
dd1364a7439be4 Daniel Lezcano 2016-06-07 @223  	return 0;
4182de9e6356c0 Ley Foon Tan   2014-11-06  224  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

