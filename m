Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759F239524F
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054391; cv=none; b=Wbc5bXl+9QDQgwi4AVjx810o9+VZkH8RJoUyRKbkELOIJcQpMJmTCGULw9n9wjMxmit2D5Q0m7a64ZRtB0TDHd0Qfx5K2S0TlLsvA4tEGKPU3Nk65jikiZnHeA/Rj07pM6QiKpdPmF44C3JxzMEmeLN6FyQNZlsh8HN47k2NydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054391; c=relaxed/simple;
	bh=j/o1SQRHto7JtQYJ4YJqx3lMfkt8dgsZSqcLp2dy2vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FTu0+G5SyBkec6RxmTjHva/CaqCj9jszBy6an9gATnPgBAoftTIbywQMUrTcqcXEdLKjlW/YkNDyQ3FSFhCOgeif7H+jVrmAIddfDkQ8xReJ5hQQI/PPdclo5dGBYZYvTzqBKDK+ieQvJLyA90HEMLNmo9aLSH4CHvAA/FUx580=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUV2jHtA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUV2jHtA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso23362615e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Mar 2026 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773054389; x=1773659189; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYqNOLuJzMYK9d1ajstSf4XchF/ZWv9ReR1ssRMKIMw=;
        b=qUV2jHtAg6iaium6jDQkZd9UYSgqLNyxoY/quhNtK9MuoaSfy447Wr2IpDZ7wUVIjC
         8BS2XI94vT34V7bjnwtvUcW3XDVgX2Msx11lk9YIHSel5s5KroYtpZMvAFIQ6XH+/rPn
         wWvFbaDSo5NSfpS6yMuaiZMgeIJAJYcZfiZ/hNez4YUqPLCJK1A6xKTCyjfgQHI/v7bx
         owfomofP8kCPLSMguWj+TKyVFggQ5oU/oMQPQ9b/5hTcgXD1FonGISTJ0GG91C7YSdJQ
         XIOvItt0C9rTph/Y5et09y4JQ42ubJzjIky3D/sgN6sGgagcfAQnU1XOxVckEmRMrzHY
         ekkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054389; x=1773659189;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYqNOLuJzMYK9d1ajstSf4XchF/ZWv9ReR1ssRMKIMw=;
        b=Ub3VdkSXlQ81sUqyBHOGiEfdKCZmqQTAxSd1fubFCuF+tXfHlEJbaBz4PPm1/RD0Ot
         MM5ugckSrf9fNillb82BW1ccVUq2cKi2pA9OoI+HwDuf+XdMvkWlVYUKsr8bDMWA0hpt
         7Tum9bYknKVMs6Ac18cZ1J9K6EiHxAR2Iv/huRL4uXnWFa3GAYh6api77SwY4rkF+2Sc
         +LxKqq4t18lOtgiiJNQ0+BIi6hohH9HXiCGtdY4Lqa7H3N6QVacbpGp+iCVLkwAC11dg
         lDfuVt8xTESGF9xUPRFM8G9nYGYtM74O6M457pFnNmNb1KCUPi2SefTcdotOq1Fhae5m
         qBZw==
X-Gm-Message-State: AOJu0YzK3vur4AxQjuLJVO/KSRu5z6b3jdSpvQF/ehD4YA/sXot/4w7s
	0jLGeuh0XSQG3go4oS9rMQs7Z6JO6fcwN5KcZV6HfujwX+iJTDcGwbGqFllKFRuLw4YDf8bxYom
	cma3H
X-Gm-Gg: ATEYQzx3Hwdk9+aOdOxPNi+2dxrlDlVmj7kN725xj5d+zTorN0qJbUBaQrqQvGlhrU4
	nErByRHqedwP5KFpjaGRShAdJMJTW44UwXMSqPA65ci22LE09YPbTUtZrDwxsBLaMZsJ/t0oRHL
	pSEg6Rwkn5pigGQ9raKQco2JTgir4qImdUix1KMCPx+047oEwYRWo4oeHL5h7WIgdH6zaI0Vo+G
	0kTl26euN6nK/tmwOQBpD01TVFXI1dmMvX+W4jaQS4fcLqfnsmIlbvqEF7K/HFW7yogUwUXvTWP
	xrT5k4Sf3B4UXD9yW+Ex1FPOEk3OZIbLSrTC1GDzPDNqmWyJ+M2kCyvqp1o4ACC3kUDE80soBJL
	OByiFjbZwRGahsLkuvmFE8k4A4EI8JGnRQzEbpz9uq8l5IKM0+iGZzc0CyXr20Fn9ivJk2c6kZa
	Z4qllmSwg2P6qOenDv5cjuMlc+/SVt
X-Received: by 2002:a05:600c:310f:b0:485:390d:74f8 with SMTP id 5b1f17b1804b1-485390d7719mr62033515e9.25.1773054388509;
        Mon, 09 Mar 2026 04:06:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm86831215e9.14.2026.03.09.04.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:06:28 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:06:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Wunderlich <frank-w@public-files.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 6/87]
 drivers/tty/serial/8250/8250_mtk.c:436 mtk8250_runtime_suspend() warn:
 test_and_clear_bit() takes a bit number
Message-ID: <202603091856.CNiw1oL1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260309110625.A3v9s_wObxZAQY1s3XY519hgKLqGKHZZCsUmGX9sGvY@z>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: c3e74a9070cbe512e4879c15d680b41242680548 [6/87] serial: 8250_mtk: track busclk state to avoid bus error
config: nios2-randconfig-r071-20260309 (https://download.01.org/0day-ci/archive/20260309/202603091856.CNiw1oL1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603091856.CNiw1oL1-lkp@intel.com/

smatch warnings:
drivers/tty/serial/8250/8250_mtk.c:436 mtk8250_runtime_suspend() warn: test_and_clear_bit() takes a bit number
drivers/tty/serial/8250/8250_mtk.c:453 mtk8250_runtime_resume() warn: test_and_set_bit() takes a bit number

vim +436 drivers/tty/serial/8250/8250_mtk.c

9db669f14fd829 Arnd Bergmann    2016-02-08  431  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  432  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  433  	struct mtk8250_data *data = dev_get_drvdata(dev);
e32a83c70cf987 Changqi Hu       2020-02-26  434  	struct uart_8250_port *up = serial8250_get_port(data->line);
68e5fc4a255a7f Sascha Hauer     2015-04-27  435  
c3e74a9070cbe5 Daniel Golle     2023-09-11 @436  	if (!test_and_clear_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))

Don't pass BIT(X) to test_and_clear_bit().  Just pass X.

c3e74a9070cbe5 Daniel Golle     2023-09-11  437  		return 0;
c3e74a9070cbe5 Daniel Golle     2023-09-11  438  
e32a83c70cf987 Changqi Hu       2020-02-26  439  	/* wait until UART in idle status */
e32a83c70cf987 Changqi Hu       2020-02-26  440  	while
e32a83c70cf987 Changqi Hu       2020-02-26  441  		(serial_in(up, MTK_UART_DEBUG0));
e32a83c70cf987 Changqi Hu       2020-02-26  442  
d518314a1fa4e9 Daniel Golle     2025-09-16  443  	clk_disable_unprepare(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  444  	clk_disable_unprepare(data->bus_clk);
68e5fc4a255a7f Sascha Hauer     2015-04-27  445  
68e5fc4a255a7f Sascha Hauer     2015-04-27  446  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  447  }
68e5fc4a255a7f Sascha Hauer     2015-04-27  448  
9db669f14fd829 Arnd Bergmann    2016-02-08  449  static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
68e5fc4a255a7f Sascha Hauer     2015-04-27  450  {
68e5fc4a255a7f Sascha Hauer     2015-04-27  451  	struct mtk8250_data *data = dev_get_drvdata(dev);
68e5fc4a255a7f Sascha Hauer     2015-04-27  452  
c3e74a9070cbe5 Daniel Golle     2023-09-11 @453  	if (test_and_set_bit(MTK_UART_STATE_BIT_BUSCLK_EN, &data->state))

Same.

c3e74a9070cbe5 Daniel Golle     2023-09-11  454  		return 0;
c3e74a9070cbe5 Daniel Golle     2023-09-11  455  
b6c7ff2693ddc2 Chen-Yu Tsai     2023-06-06  456  	clk_prepare_enable(data->bus_clk);
d518314a1fa4e9 Daniel Golle     2025-09-16  457  	clk_prepare_enable(data->uart_clk);
c1c325d703d347 Sascha Hauer     2015-04-27  458  
68e5fc4a255a7f Sascha Hauer     2015-04-27  459  	return 0;
68e5fc4a255a7f Sascha Hauer     2015-04-27  460  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

