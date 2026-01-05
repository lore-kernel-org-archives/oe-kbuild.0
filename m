Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22B3376B0
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614662; cv=none; b=nVaTbgbiKEkKnYku031qjvzpKd2VWSIu4hc/VFh36m1y+FOJixQ5lPS6eOVTyE8HE2OYm0fhMvCN98rvZJUrccpqIfA2q0vAEcsEgrGSb2juMGP9RzwMMUHiUUALao+N+VaUcNI3/QplXqhQHuRrT8QMJXSu7jsgtwykHg8JIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614662; c=relaxed/simple;
	bh=HGphxYDgwPpJOyCv+3RoVjNHHGj+TTQU/3r4/k523Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q6vsaCCiP7ALGUnDXAISR5LBygas/gIATaBfONlw99l0XJoalZdCQIG12Ul8FJynpBw6CSt6opn+ZNaHHBE1BvMU7zeWC9Qivn9/yz3HCZTE2yPZvG6f8hsYrld42NflIVU0W/rHT0ga1BeoN+TRb09Zn19NKS5ojNhxeUV7z0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agm5+uaS; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agm5+uaS"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso9962095e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 04:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767614659; x=1768219459; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iAqNTTZl4XxJFY09eQkKsMLXLhSWhPw/RgBg90Ddzz8=;
        b=agm5+uaSkxxhihDdLk0Jb+XKZ4zWZywt8Z0rxw6IXa6sUfHDs3mHJh2+pNyxZAmocJ
         2MNlO1Ho6nUUanQeUyJ7ChENkcB7MRN2QcQxsJXk1Zz74w6eER+2OC09ip/zCeJXfnz1
         x6Vzsh1Yrfpho1X0i21djoCKyauOq71BXR4DhF/v7Nsiakj7qSn6rS9bo6tQqmiYWW9U
         aHOx9HxMqzP5Xifk7fnLITHdLrC7xEtJxT/y1h1lIztkIdu1HRDswS83dgQAPhYJWDP0
         s0lnN6tv7gfweLwAkxC9b6Udoam5toZNjZqUD2vqfMSCHFTtULvF2MZIIUGvbinlIwqv
         zJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767614659; x=1768219459;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAqNTTZl4XxJFY09eQkKsMLXLhSWhPw/RgBg90Ddzz8=;
        b=FZQczidVVEUwXx0yTiolrcWtSg3Bdz8m6ixL0SmO2whwy/FjMNOmuWTa1mcfZQbd4q
         NuHg48Qm4d3gZyDbA5q8d2o4AfuE4S8GrNIOvJUe2Fwc3BW8bmo3/IU/LHMVeaVo1W7e
         pBQgLtcEONPBJuRBqhjJBq45dn5CxWGZUX3kCAiceRwoevxhjznvz0IEXEUVMA/Jl+g2
         HDm4O41bXB+CqfEj7E9EElKk3amtbn4Iv8GSQMaPnDtjktjtpZKmoEHyrDQs5BSnJiMA
         uODU6DC4LnwB9HrzzTmi6mx7LLqvscTFbSp7DPZ9kiaMELvc+HLnc0JHV/GHKnscUazG
         KzLg==
X-Gm-Message-State: AOJu0Yz3UhDNPltH3+Zx05FDa37yLeCEQSB/5wJqEDRmdo6Ii/YxrBin
	m8p730nq6W73BtVW/8tU4yXalPCJTmbhxaAXC0mp1KUMpYwDIx/TbYnWMTKq0Kxi5kmWrrVTyv/
	RgQFE
X-Gm-Gg: AY/fxX7dyEGVDz2wk+HS0U9PkVjj+e6Gyus+02+5+5NVacLZfk0uIhV7zP0GXL9QxtB
	x+QLad2U/E9jzliOYaufYZKkjabzTVT7i1RSPcGPV7FooQNzsgRs5Cg3QiTXXvjL9ymIt3Op8Ga
	i1qrIn5K0PpnUvyRz8x8c89tEhMPWHkLXzFIfX69h+yYDCIT8z3C/y3KPsEtzq+6lrjlscJkLgx
	dAvL5lgKpV5VZVcz7xYpYV1L6xndXVyKDOESpLdIuoTogWQzKy4iyhp1NAbJjKXVvFW517YpOBw
	0zt6sDpH0VDptuRYup6Rgkzs7RUNXJZuIufklO5SGV/OVKxt8TSqAYsRUlNnxpPzPYHnu75Mimg
	Iu2CVemGUp3JTab6yiNwc622gcBVvqHj4/jmy6qjHhN7j8AYBmAeUwzD6+HvwItAnsVva3LEmYV
	CYgK51oSBL4v+/t6Bd
X-Google-Smtp-Source: AGHT+IFbi0j/vNdxfH/mBHODZsP5f/kPvrCzx0fxoQCCcx6Xdp5Oym4jRSP/et3DTSTSOHpScvtwoA==
X-Received: by 2002:a05:600c:4e8e:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47d1957b120mr629644115e9.17.1767614658422;
        Mon, 05 Jan 2026 04:04:18 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d13e2e0sm184586775e9.1.2026.01.05.04.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:04:18 -0800 (PST)
Date: Mon, 5 Jan 2026 15:04:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yu-Chun Lin <eleanor.lin@realtek.com>,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: Re: [PATCH 6/9] clk: realtek: Add support for mux clock
Message-ID: <202512310307.swVDgnPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-7-eleanor.lin@realtek.com>
Message-ID: <20260105120415.BVi7cs4OOTm28k8ywaaqlp2N-G9owOsPHbiundSMQKY@z>

Hi Yu-Chun,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Chun-Lin/dt-bindings-clock-Add-Realtek-RTD1625-Clock-Reset-Controller/20251229-155549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20251229075313.27254-7-eleanor.lin%40realtek.com
patch subject: [PATCH 6/9] clk: realtek: Add support for mux clock
config: loongarch-randconfig-r072-20251231 (https://download.01.org/0day-ci/archive/20251231/202512310307.swVDgnPU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512310307.swVDgnPU-lkp@intel.com/

smatch warnings:
drivers/clk/realtek/clk-regmap-mux.c:23 clk_regmap_mux_get_parent() warn: signedness bug returning '(-22)'

vim +23 drivers/clk/realtek/clk-regmap-mux.c

f53de7a7df69f0 Yu-Chun Lin 2025-12-29   9  static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
                                                  ^^
This function returns negative error codes so it needs to be type int.

f53de7a7df69f0 Yu-Chun Lin 2025-12-29  10  {
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  11  	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  12  	int num_parents = clk_hw_get_num_parents(hw);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  13  	u32 val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  14  	int ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  15  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  16  	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  17  	if (ret)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  18  		return ret;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  19  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  20  	val = val >> clkm->shift & clkm->mask;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  21  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  22  	if (val >= num_parents)
f53de7a7df69f0 Yu-Chun Lin 2025-12-29 @23  		return -EINVAL;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  24  
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  25  	return val;
f53de7a7df69f0 Yu-Chun Lin 2025-12-29  26  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

