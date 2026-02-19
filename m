Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E188327797
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483947; cv=none; b=alTlOWz3SHQN8ro2rypHomwWuSQbedVqhMrEoaxTxyPd/kL7NzpVOgzyODXNFsSvNsfZ8d77+NP5BCXnxS9JjFmzT5a+Tmq8e35Z5wPIx49jIcidOC937OSHssYXcDM5UUB3561M5qVrrbR5MvrH5fou3652OL6PtlZMvddYz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483947; c=relaxed/simple;
	bh=a9gIIuUbYtr3xbL1BkLiyFYBOn2YLV4QKHmbdYOIfKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f9bhVqtEfNE1Uc+W8KjE1BZU8CyzSFCqZ6Z119vOiZHX6Gv6+b7uluJeCfzeWTbuwQmXnfsF7/GB0NPSVgacRcQKejWelTjypL6HCQ/qS58f6yrl/ax56in1Qn4roVMrtM8vAQwHf90jFgP6OzTkXBO62tWhM9OFMO3EBZVI+dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtUFAxBp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtUFAxBp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43626796202so512805f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771483937; x=1772088737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=FtUFAxBp8UuvlCHECwtpfYKhZz2zqyYtRn+OnjEPbRi3MMf5DN0VcOW9DzadBxHmY+
         hnS8c9f0V26CZMsJPCKhkpunl7ruxrNG/Y2B1VMYh8SCgjK4pQfXVbCywMgXS3zz6A81
         GmykAa1qruxyqBu6kXD211rezRlBLDcY8SPOA716nLswHLBEEERsJgKHNyqKe2tIb3Nv
         hAGbHeZyVSACNod5iFKDrMISBJ9j8s/yXR0jmXDIe9LHUbZROZe6+G0ZR0rYqa/momJQ
         g9U48+Pr887cPLedux8KZ4o1LQ3X6xuVZNoRr/3+7We/hldjD1x/G5kDyCF4T82Wpvbm
         mcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483937; x=1772088737;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EBP5eZrSw5SNu4AKLCAw7ge8STkhI5WlLpg3XWzOaM=;
        b=OI8sgHbY1VUduIaZo8XSWWOM6Pd9VbcmyvRpWxHe5Dr3fTRQ5HciOnCp+MyRbXpp5+
         7vD4ZL778eYuHh2LtjPOlSOchvdazY3e0yqo32C92Sav2JsVTp9mTgnYAqPG1uuATTqN
         2V2W9AoYugvJZfwJXgjG3ZiXMnVLWer72qhbxjeLYskO5uMqzWpkLsVmpff/O3zB97OZ
         0GLpyNbJ+SwiIzYCgmmceHlL8p5LGHE6BPFnX9MUoosnS64GOLsENC/NPHoUJqGGhTU1
         MTWh2h4k0L/tpWH6eygEVQkDdtk5lN1zoY27ZC6nMk5u6erUysbhkrZhu33IJPImteBV
         +poQ==
X-Gm-Message-State: AOJu0Yw3VpXO2Exn0TlI92U4nG1oUE1p+APSPsY5u44ISyOeRI1wdn9h
	pzFktcLowjCx2itRe2V2JKZXc7Ne9ouPE3Dey+kXBfAgssyQBMX5fbnhMMilfn7WRkabcLRv7r0
	L8AF7
X-Gm-Gg: AZuq6aLP55SfqxUDiRkOX4pQcXsh53D5xC0Rm3x81JwnNfvyrkajmGmtcvQi7dwx5WM
	/A8wfByZyUy1CtLhV+nr2wLcDKg8wvpZppk8Gchb5HSFMuzx8l+cLr/nnluHPvj488fgHXY+E4p
	tt55ahoz+/nyXBv/KtUCWprjXiMr0IASyC/pb520SCpnT1lZdLfM8FQTNb0Ks6ne4snKvhaaLn1
	RjYrT072rSU4RtCWVkTvnqFPiRLdkd3NZ4G1ykuWlheXxGOE8CsqKUhAhg5bywomGfF8JQEYe8u
	xBm938uWmIbKzn1RFykQ46pT9NNDqTuXqeBuC704kaKTK5xAEBF+d5zmLm3D+QXM3X4sLARoBZx
	ytFI5JRwSGZnXiFKJTmQ+cz8l7sawgQT9Ar3vCY3KpFtab8GiC/LV6gGH9aNjFwkkLlfQTy4DV1
	cpjDp5p8005dWyiWkW+wvY9tN+29gjzqyF6s/1Xh0=
X-Received: by 2002:a05:6000:401f:b0:430:f5dc:d34a with SMTP id ffacd0b85a97d-43958e4a636mr7655865f8f.29.1771483937384;
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796acf5b9sm45905510f8f.34.2026.02.18.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:52:17 -0800 (PST)
Date: Thu, 19 Feb 2026 09:52:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Harry Austen <hpausten@protonmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <monstr@monstr.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Harry Austen <hpausten@protonmail.com>
Subject: Re: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor
 support
Message-ID: <202602151704.qepyfVlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214180933.42143-3-hpausten@protonmail.com>
Message-ID: <20260219065214.VN_T5BQBTXJdGavYt24SZmGwLLKmFZGBxwEdx5CIcIk@z>

Hi Harry,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Austen/dt-bindings-clock-xilinx-add-description-of-user-monitor-interrupt/20260215-021554
base:   ea7282e99ead6d2a294cef40acd2a29ada3ab71d
patch link:    https://lore.kernel.org/r/20260214180933.42143-3-hpausten%40protonmail.com
patch subject: [PATCH v4 2/2] clk: clocking-wizard: add user clock monitor support
config: microblaze-randconfig-r072-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151704.qepyfVlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602151704.qepyfVlc-lkp@intel.com/

smatch warnings:
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:1183 clk_wzrd_user_mon_work() error: dereferencing freed memory 'dump' (line 1182)

vim +/dump +1183 drivers/clk/xilinx/clk-xlnx-clock-wizard.c

68614f228e6cbe Harry Austen 2026-02-14  1176  static void clk_wzrd_user_mon_work(struct work_struct *work)
68614f228e6cbe Harry Austen 2026-02-14  1177  {
68614f228e6cbe Harry Austen 2026-02-14  1178  	struct clk_wzrd *clk_wzrd = container_of(work, struct clk_wzrd, work.work);
68614f228e6cbe Harry Austen 2026-02-14  1179  	u32 *dump = vmalloc(WZRD_NUM_DUMP_REGS * sizeof(*dump));
68614f228e6cbe Harry Austen 2026-02-14  1180  
68614f228e6cbe Harry Austen 2026-02-14  1181  	ioread32_rep(clk_wzrd->base, dump, WZRD_NUM_DUMP_REGS);
68614f228e6cbe Harry Austen 2026-02-14 @1182  	dev_coredumpv(&clk_wzrd->pdev->dev, dump, WZRD_NUM_DUMP_REGS * sizeof(*dump), GFP_KERNEL);
68614f228e6cbe Harry Austen 2026-02-14 @1183  	iowrite32(dump[WZRD_INTR_STATUS / sizeof(*dump)], clk_wzrd->base + WZRD_INTR_STATUS);
                                                          ^^^^
dev_coredumpv() can free dump.

68614f228e6cbe Harry Austen 2026-02-14  1184  }
68614f228e6cbe Harry Austen 2026-02-14  1185  
-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

