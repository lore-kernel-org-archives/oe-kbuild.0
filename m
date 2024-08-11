Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA7148FE6
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723383247; cv=none; b=VurBVBQQcWHV0g+no73Pnh/214KM1+S0ycrDJM7J8SyOR5IoDgw51cNjfWX9VIsYaGR4JWhaDLEKd+eReJXl1DvUkujF3KKBjqHJPd/HUASGFZjAukNNp7qJnFpOOloO6+BA8fNjSfXO2bAr6WdfPcdNtmPAHFe5R0RW8XEPF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723383247; c=relaxed/simple;
	bh=umii4WIp3+Lb/xyR+jLP90kxlvU5jG5k1OXK6zxobNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5QGpD0tLn7qzyfH2Z33Zn6EtQxg4IbND09VU63Y2S/SlkSYQaQ9Hh2GhMT4d+L33R/y8mhiyCF8gxvJ8KVWLQiKWFCtN3/nnGLlwN3E8dsXaHipXrSLlX49akBMkr1jiWGS/38PgkqSN4w4z0J1GjXUaDFF/LZL95SG/Ncdeug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Adq57bBR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Adq57bBR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52f04150796so4529212e87.3
        for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723383243; x=1723988043; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0/Z3vgL+juqE9NiEE9TGI8HmZuHcW1zMdx9sHXFqzw=;
        b=Adq57bBRnZ9g4Y3nA1+94TM3/Lvr11nSa743cPLmBJnBimk8I6MIjLLyURRCj8erWQ
         Lh6QMrbjjFL8VeUYXHzlmWbGyxpZf5iQO4hLifjAC9mV9km9SXXIcWcyXq0MSrKX06gM
         v3JLVZFuyGAHX5orbWyEyuVvnWMKNCUdBO/YdcgWMSD4+J0454i9fqt5LTPiKLqZcZSE
         fpNyvdQt3Q+qbshKGVmdTMXyo5GY3+a43kJtvvXp57DE7JcGbgEU+qfPeLhqBPLGkGe+
         oiHv4SlfYkpcS8pkf6TUQ7eez6mjMkHL8tDysIdcCYeQxIYsZ+rsknx6oQ9+gGmvNzcZ
         v0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723383243; x=1723988043;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0/Z3vgL+juqE9NiEE9TGI8HmZuHcW1zMdx9sHXFqzw=;
        b=H7eb8Fl+viY1yxZCRch/sV6SRS2D++HbYO/9+vET2AuyepaPoGVXTlq4VEF2m+32VB
         nKk2Uxjyc39SOGBSHvHkgtV23nBKqHtJAM+H4QEjj4As3M5oyPhkcpOKET3blXbcw1a3
         SPzNiywxa9gUypmYugEHbVIRUS8n2pJmz92gTGrL0au0uNPHxbrAjUtwbEk5ALDCtMew
         4UB9DrctXxw5WVELsVa5l2hodd05YAa98FxGU4aSbpnAXPeA0mff1dUBg4FyEnWhU9AS
         k0RoM58nXHfP2mYk7ArLM0uiOUBqWU5VQmiP4Oviz4I3WMIo7YU9waxSFAOy7nVMIy83
         RPCw==
X-Gm-Message-State: AOJu0YxswEpuUezYdlhrGA9VFF/NIwL44zPsKYiHLIpT7iRz/72bqNX9
	AV828Q0+eWOC4fQGBP+JmX0KOx4jPbny8jLFwFmzeUQAUyMqGFoJ9mD92+c6udYQL7Jg6oiVImL
	g
X-Google-Smtp-Source: AGHT+IFxoifPkm2k49zueoDi+pjk35TjT1miLHQSKqwjfRh2sk1EoyPj3xGy2BDeEYeUxnsV+7nsQg==
X-Received: by 2002:a05:6512:3d05:b0:530:ab68:2602 with SMTP id 2adb3069b0e04-530ee98dfa3mr4565196e87.29.1723383243252;
        Sun, 11 Aug 2024 06:34:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb2136easm147944266b.184.2024.08.11.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 06:34:02 -0700 (PDT)
Date: Sun, 11 Aug 2024 16:33:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 1917/3984] drivers/clk/qcom/clk-alpha-pll.c:2129
 zonda_pll_adjust_l_val() warn: replace divide condition '(remainder * 2) /
 prate' with '(remainder * 2) >= prate'
Message-ID: <abf45984-40d6-4f57-954c-f7267fcd0740@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: f4973130d255dd4811006f5822d4fa4d0de9d712 [1917/3984] clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110724.8pqbpDiD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408110724.8pqbpDiD-lkp@intel.com/

smatch warnings:
drivers/clk/qcom/clk-alpha-pll.c:2129 zonda_pll_adjust_l_val() warn: replace divide condition '(remainder * 2) / prate' with '(remainder * 2) >= prate'

vim +2129 drivers/clk/qcom/clk-alpha-pll.c

f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2121  static void zonda_pll_adjust_l_val(unsigned long rate, unsigned long prate, u32 *l)
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2122  {
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2123  	u64 remainder, quotient;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2124  
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2125  	quotient = rate;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2126  	remainder = do_div(quotient, prate);
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2127  	*l = quotient;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2128  
f4973130d255dd Satya Priya Kakitapalli 2024-07-31 @2129  	if ((remainder * 2) / prate)

Why not write it as: if ((remainder * 2) >= prate)?  Comparisons are faster than
divides.  It's okay if it's idiomatic.  In that case, just ignore this email.
I don't have any context besides this email but I was curious about it.

f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2130  		*l = *l + 1;
f4973130d255dd Satya Priya Kakitapalli 2024-07-31  2131  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

