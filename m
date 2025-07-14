Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E76229B13
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521986; cv=none; b=nzUeitUGbZ0vAFonj4O9euOm5evJc+gmWr7HvwjyCEoEGrjGMkV9UF12rxHZ5WEumL3SbUAtedii4Fsmv3Svo8huP1b6k/IkA4Iesh43fdu8ZHDwcNU9AnEkqnTB3Gq3ZWPjAi44tmGeIWQv3Mikjk7t6qUn/wt+2cCrBkFtSk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521986; c=relaxed/simple;
	bh=5cSCYdKyaKnlsB59d7LA/sqcozRwuYbnW6S02DziChQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P9k1Jc6sulWZibZQPlOyH+koekLd0fr1M46PWrxeyAER2YrKgD0To1TqYu9FtnR+seoW0WPeowQ2Ji/ewMoSazM3xzJMnRJVf0RvYNfgWknS8YxD3ZjxMDUtzHvl5JAG44KTnj7yS4Ph4Az+YKeN5kzr3pr4WIMU6eEnqbMBY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h0PTH806; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h0PTH806"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2eff5d1c7efso2979013fac.2
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521983; x=1753126783; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=h0PTH8065YgOXUSeFbRHheB72np9GCT9IWm27DMNAmZYWUQRxx/FsC5WFmKB7Ci/hY
         vWNwkVBmhPC2v6S0XN8624CxkaUaxeKBCW1UKmpglJAXl4Syeu7t/3GnJwq/VqHi5d5k
         eqD89j57XYcAkmAcOLvfE/srJ6vWpwwW89Pmg1ybxUxYxv/ASZjOiNjZIE20WHt/pdKu
         ilOIr6Sm0IgR+0wLFbBcj0HW9erlQaMh8R7007giZJSOM59/0GuaHKoBCm5/0M973s2D
         mCC3/84tlYepUVkIEOEe/GhGpe45HvzJ3SxocwohDzBg7gR4KWEqBVIH4GcmSAPFbtAK
         82IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521983; x=1753126783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=urOya2QD0PAv3aRyUi92qVBccHFN0GyUQM4mpsavCC0=;
        b=OyROz+4hYbPy9E+5B4ayNR1ApaVkY719yofpvx+hPeJK3tcikA1pfk0/0S01SIbJL1
         xajhpT5YOhQR7rnpzQSOru8h1RbqcjN5nlD0nJOgid0V1cC29hOmV9OeJZLlzgf3q031
         Eyibl4mYjIFbwqk+Kndz3tzrlOLSBAJjF2j6MTUdRmD5u2PAqY9r9tazULe4WbYtuWXG
         15M+9mGrkqJckWQk7jnLfKuW8o44j7wNPHjw6TqSIdj+kW/aDt6flC4vtam6R1FN4XtH
         Egis4OKOf854oBjTruSvcPDAsAHyppiwib1gcV3716MVd0ImmnonI2M0j6uDuLC2yZRr
         iT8g==
X-Gm-Message-State: AOJu0Yy2/fJjDePlc8sbnKj/DMjYyGu43A0rU0FUTR34S9GSMGLA/LXr
	vcoVWozpuM/rH26Etgy85sarLrINtKF/GnxIl8PQ6kdKvBl2n/FrfhZjS4j0rd7YP04lJ19I467
	AOAKK
X-Gm-Gg: ASbGncsvXIgIpwesuT5S2xUcnhCKHIg5rNN9dG2LI1G2Kny/cf5e8BH7AJTs3KZe6mP
	83a85JzzmRmux+ycx4VF/F7x6UTBZE2S3bnUcXwRJR/TEGckOTSD3MIa5/UQwttvN64VhX0DRAV
	kMrvarI9oRg0nQHhLXEWTrQyEB31Z9EtOxvXscEYdfr1jc7f5+UcGMJdqq/rTAi2BydSx56SJko
	19IfCnMC7pJ3D+YsKATMldBBYlolfo9LnZYrr519+w92jevmKU+9lEeNDwninu+RcgY3uJEY5Xn
	JBPD9D+T3v72Mjn5rG8MaDoIOsoMIsl9FM1B6xIpGYT8yUHNWfmhpcNEdo1fVF7ZXxlAQ87+evl
	xHJf07WXZ99ykAnm1xwSOGNDwn94OOA==
X-Google-Smtp-Source: AGHT+IG9YCfy/a8BjNGBo1GzQjJuR8GmP8UR9cv+uwP5yDJexmfxPdWGAOu8EtDFH9IyIV9EN6mZeg==
X-Received: by 2002:a05:6870:c03:b0:296:bbc8:4a82 with SMTP id 586e51a60fabf-2ff2706c894mr10579426fac.27.1752521982792;
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf12b62e8sm1674368a34.60.2025.07.14.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:39:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Le Goffic <legoffic.clement@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
Message-ID: <1fd92742-0958-4f64-8e50-4d0595fe74eb@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711-ddrperfm-upstream-v2-9-cdece720348f@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-9-cdece720348f%40foss.st.com
patch subject: [PATCH v2 09/16] perf: stm32: introduce DDRPERFM driver
config: sh-randconfig-r071-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122125.eve8lg60-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507122125.eve8lg60-lkp@intel.com/

smatch warnings:
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'pmu' (see line 376)
drivers/perf/stm32_ddr_pmu.c:380 stm32_ddr_pmu_get_counter() warn: variable dereferenced before check 'event' (see line 377)

vim +/pmu +380 drivers/perf/stm32_ddr_pmu.c

73af3c4ba702d7 Clément Le Goffic 2025-07-11  374  static int stm32_ddr_pmu_get_counter(struct stm32_ddr_pmu *pmu, struct perf_event *event)
73af3c4ba702d7 Clément Le Goffic 2025-07-11  375  {
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @376  	u32 time_cnt_idx = pmu->cfg->time_cnt_idx;
                                                                           ^^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11 @377  	u32 config = event->attr.config;
                                                                     ^^^^^^^

73af3c4ba702d7 Clément Le Goffic 2025-07-11  378  	struct stm32_ddr_cnt *cnt;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  379  
73af3c4ba702d7 Clément Le Goffic 2025-07-11 @380  	if (!pmu || !event)
                                                            ^^^^^^^^^^^^^^
Checks are too late.  The variables have already been dereferenced.

73af3c4ba702d7 Clément Le Goffic 2025-07-11  381  		return -EINVAL;
73af3c4ba702d7 Clément Le Goffic 2025-07-11  382  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  383  	pmu->selected_set = GROUP_VALUE(config);
73af3c4ba702d7 Clément Le Goffic 2025-07-11  384  
73af3c4ba702d7 Clément Le Goffic 2025-07-11  385  	if (config == TIME_CNT) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

