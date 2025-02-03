Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3292A20E01D
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615899; cv=none; b=duBddOm/jsA4i3OtBzmAbDUwuRSK34z6Jmd9nmj65cttKU84edUxRxknueQ1sOdupqvnptOWtyhrcLMawg5Xo0MJSj4CDDAZhnPVPtQlcOu5w8vKTW7WFwHAwpTGybkUYtC5OqCHna1++r86q0Vp3twjsxMTx3wl6q2DEEaWQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615899; c=relaxed/simple;
	bh=P/HX7wIDAU2xX4W1l4RV/v/AM24ZtU3GxK5PxMLhmHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A+ok8sPJrXS5giKXc6wNCEEpJDL9LqfUdFtBaBk3eAk9jz0la8zRvjYLvrJ2kCSD/dQahYgpJAjHvA4IVnSTZla5uOzo3kBM6HKewQY7b93li+q8gnabzkbTG/S8/Vu677YaME+gHqGaOonMQlQVM/uW+N93dKxtF7tuOTqrSBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSTJ0ykH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSTJ0ykH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a03197b2so33545025e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 03 Feb 2025 12:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738615895; x=1739220695; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHC2EQBxGjARvnbE9dXhGX8VfihfJcgHA78XOH2cdX4=;
        b=sSTJ0ykH7brglW4Fan6c8Qzukm6eP4mRPwcEetoHqmXZRf9ZUImpc72n/B1JbEmrfQ
         DnCeVGNCZHvcLvwrvIYi/C+bwfhNXF1EQkyASRC+u3g5RRhF33CQYOVagIjWXx4RGJcF
         StV+wy8NJEqCx4Cdrm7euLDwq4tTqwvXCO1LW1W9Balfl+RRH0yh1Boo/F3e6f2YF/I0
         pY8nQ95p6aB1PCKULdfkwtPEV4aW9Ue+6H8fvp4+xuMyDfK4d7UC8UAPPZSayYBBvstR
         T1Xpb9J4leU/pivqlQj/Is6/dKba0Yu5pTUlxq9v7iQT4cxUwlkOp0IaELVsZM33xQud
         90wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738615895; x=1739220695;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHC2EQBxGjARvnbE9dXhGX8VfihfJcgHA78XOH2cdX4=;
        b=qZOIVzhklrWsi+rXqLlhs45r2ZGPmmkPoUZlG0mnq8ylb4kuef5Nr87hvm3wd+o+9f
         tZ8W0BgfaTOmc57Cc5n5NQr5uYfHoKCMY9jn2lGA3W14wwPJhDeV+5kdHMpJ5G74zBfD
         2JLWOJhHpo3hNANcBg9s20SIE7LeUdqf/jVemfaXiQLLYRktHv5o2TzGzW4kvQjU72Cw
         y01lWWByH+JzUKx3eHf9H8qMsPEfzUR/eEpSlUpSL12XzXPTgV7gVEXADGHwNn8+JKQI
         g4x4el4izeblSCDaJWvBP0VlwSZFTUmFelcQx1vl1hF/4+6UOP1UukOzZv393Tw6mFVG
         BuUQ==
X-Gm-Message-State: AOJu0YydkFRaJ9PrzCdSz2ymVYIgXUE0ro9v25wMGCXoSAdryD7vrwyC
	y/Ia5dUqymDEf1CT0mRpYe12NWZphApfcdyNhdb/P3abSnWxFGy3dUT/DjqopYJbNrmfRIlbOzP
	0
X-Gm-Gg: ASbGnctx3wGUHc7fAzSKpfPjieTw0qVqywW9IGfQDzSbY9I7ynVIqsKJNNylqe3TvCc
	Ta3Ls7AzIcCVIT7suevQukv9G0GsxBhZBrwSi1psD3XCavWm8IJd6/EyUYAoCrkvevlAUfi38P3
	B+PVuO+iACezfc3Xe8cm56bBCEjH6HrOzbnVcNJBvjh5E9gUooqXwGu5yFfB+CEKGs9KAXwLaNH
	mWr2UoxkU8PaA1XuLK4Y4ZuJmEKQy4RHGjXXvfA0UpApIxH19pZGEIDeP0redEAy6DUY5W5y5Ab
	/xPxGLbWCiBcWPYhqHCC
X-Google-Smtp-Source: AGHT+IEnNsjzkoLIpg1DRJM0PjhA7/0Znaf7xMr3+5gTkFkDmdbpM5qmI0J01tuOQ4aT57iImfBeBw==
X-Received: by 2002:a05:600c:c17:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-438dc3bd7e3mr219049445e9.7.1738615894791;
        Mon, 03 Feb 2025 12:51:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38da1ca14bcsm2607747f8f.95.2025.02.03.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 12:51:34 -0800 (PST)
Date: Mon, 3 Feb 2025 23:51:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Pawel Czarnecki <pczarnecki@internships.antmicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Gabriel Somlo <gsomlo@gmail.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:81
 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
Message-ID: <2d9d0dab-8892-43ae-bac5-213246705e31@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   e6c6fef5f6b404cbbbabf0039fbb30acd3b49517
commit: b6d2dbb4bbd797c6254403bdf67b3b200d08bfa6 [14/15] LiteX: driver for MMCM
config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040309.E3ppqhfo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502040309.E3ppqhfo-lkp@intel.com/

New smatch warnings:
drivers/clk/clk-litex.c:81 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
drivers/clk/clk-litex.c:539 litex_clk_set_filt() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:558 litex_clk_set_lock() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:942 litex_clk_calc_phase_normal() warn: inconsistent indenting

vim +81 drivers/clk/clk-litex.c

b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  66  static struct litex_clk_regs_addr litex_clk_regs_addr_init(void)
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  67  {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  68  	struct litex_clk_regs_addr m;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  69  	u32 i, addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  70  
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  71  	addr = CLKOUT0_REG1;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  72  	for (i = 0; i <= CLKOUT_MAX; i++) {

Presumably this should be < CLKOUT_MAX instead of <=.

b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  73  		if (i == 5) {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  74  		/*
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  75  		 *special case because CLKOUT5 have its reg addresses
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  76  		 *placed lower than other CLKOUTs
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  77  		 */
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  78  			m.clkout[5].reg1 = CLKOUT5_REG1;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  79  			m.clkout[5].reg2 = CLKOUT5_REG2;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  80  		} else {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22 @81  			m.clkout[i].reg1 = addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  82  			addr++;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  83  			m.clkout[i].reg2 = addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  84  			addr++;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  85  		}
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  86  	}
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  87  	return m;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  88  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

