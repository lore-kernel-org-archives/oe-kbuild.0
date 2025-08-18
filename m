Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6293451B8
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755544769; cv=none; b=A42aGtiyVzMEbZLh9tWaC4Zozs6sdTa1GmiN8iqDbnAT1Qho3L2Njz04G507WEnXaioa+8gOVyy9TX/9guQUNEuXRcxQ4ezszhdcNZTk+V3GZyTxuBDZFgZmDz0iUGqDll3RDdR1lN6+bTIl+M1ooDoaXFzE5hy6NYnCsokz2sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755544769; c=relaxed/simple;
	bh=tY6vFDPT5J+UHKClld2vk3D4cPFzFWtftUIMkfzOQt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7YZF3STiOX5n5L0bV+2Z10TZAPemgLaPSMT2e+kCwV35HaNdDtA+qnzTsBkh6kK2TJTOubHi/Mr01ySH55LM4B5m/KglBmWpFZzkrfFUtx32+/13VQhYWDD/NvHO2LLmcLnAJVGrrwUis/ZDMoc01U+zSFTZtzv4S8aOyaacUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zAttasz8; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zAttasz8"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9edf36838so2861592f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 12:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755544766; x=1756149566; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9hweCp+yuiy4UnE8tu0U5cdLSxNtzeXo3c5udQqFt3s=;
        b=zAttasz8ucr+xWJv8a8Ka6Nj52AW1/Z42LGVYnBEa4xuxndpqmpZqMT2jPKcVIfmo+
         A+BzWprIQMP1jdvWVFez0W0uRJWK3CSCWSgaHhm2iGtlm6u1Kc/emCQe2a7NbcMnaHoj
         8BaPqiJR+qHkRhrAt+/0iU/P8oUJ+t5IcOmMziD/krLwrd1qAHBEsK6W4DsXrn3xkj3p
         1gXr5G32JUBNm1C7hp/V2Sj0qNu0TptBKdgE+qt3OMnJI+xcnojOmxsaTCHW4LcuGFZW
         WpL+RFPODeV5IHlNUdSu0B1fPxphvNX05m9ATl2N8EU0vc/0bNkZXEoXz1iA9AIM4lII
         4yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755544766; x=1756149566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hweCp+yuiy4UnE8tu0U5cdLSxNtzeXo3c5udQqFt3s=;
        b=nRjAXmMlTm+4XIAc2okXoUpm/8ICKBacCgy+aB0OLma4KptY0fp93heKB98D8cjoof
         dGPsyxePyZplWwrgc5s73Nq7t9hq26fqXNjwMdrVuhDfie+YAS5fIPt2ziZN0ulRvyo8
         ouVGo38yVmEG3Ht33pwImEqAMrIQSfgn+TAtHGyxMHRlaEczaCjYlzavSsuVgoU7U2wl
         UW9FoEUxEWuefaAg8LE9hvjg/9qQs3kS9SVU1DcTy5IZwWDGJx28oLOIzmRUi7dCoOdf
         6d0a/IMsrzRXR7Rz/A4JtF9cVMXQ8C/NCHvhn4j8yVyPvYoXvvhZM0txzPDAOU7gh/rG
         V9vQ==
X-Gm-Message-State: AOJu0Yz9h0cs8O5j6ee9sAF/As8g+3Ki32ZkmP3nuyP40S9d8bvDksCy
	T3t/2QjX3vkSZAF0aAb0/65WBlB9m05siFWVi91qsalWU8VAMhu1Z9m/ZyubGZo1xrw=
X-Gm-Gg: ASbGncsEs7nuwGRDu8o4X8Hp2bTkubZLLQ+Ih3R2rCN1GU8D+TmTjEv5hy+g5bimFv3
	7ujPIW18uCx5m0MREGd9+2Y9yucwveTahtYiofk9PMxrAx6vTl+NT8JYrNHxBoiPzmnEp6yAvLE
	HK5PoyvKPFElJGzfb4fDP0xQY1+0RYvslzKZNe/MWySzSZw4t53MrYEc1Rp8kJfWxT8qQZor37S
	nCy+KZaNO4Aj/HUhI0SHFF6XrPlvf3/X37mgCBNg8+6CCND2rrnaO56hjrvnT6gI1Eueali2LoA
	sGC7KJdA29ywUT7ibcjPLqZW/QdQXui9bK7v35tqGZT/SaJnXf+HdS16JJ5LosHzTJpc/W6prsp
	RrveT8mW9YlKrIIEOrmsDtxJzJ9d1lKovOVm+7VFavi8=
X-Google-Smtp-Source: AGHT+IEQrkh28DTI0SiPzPg5aApeFJHSZV4MplQJwQE3tUQojVdNtlatmnBQ7z7o9bG5dBtMzxbKUQ==
X-Received: by 2002:a05:6000:2903:b0:3b6:1630:9204 with SMTP id ffacd0b85a97d-3bb66e167femr11091052f8f.19.1755544766221;
        Mon, 18 Aug 2025 12:19:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a1c6cfed5sm178233615e9.7.2025.08.18.12.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 12:19:25 -0700 (PDT)
Date: Mon, 18 Aug 2025 22:19:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: oe-kbuild@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
	linux-rockchip@lists.infradead.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	lgirdwood@gmail.com, sre@kernel.org, heiko@sntech.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH V6 3/5] power: supply: bq257xx: Add support for BQ257XX
 charger
Message-ID: <aKN8uvsN-uiJgjFp@stanley.mountain>
References: <20250812214300.123129-4-macroalpha82@gmail.com>
 <202508181503.GrRD2T4C-lkp@intel.com>
 <aKNGCg2rWT7GLNnt@wintermute.localhost.fail>
 <DM5PR19MB4646929CD183E2B110B6AD5AA531A@DM5PR19MB4646.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM5PR19MB4646929CD183E2B110B6AD5AA531A@DM5PR19MB4646.namprd19.prod.outlook.com>

On Mon, Aug 18, 2025 at 11:43:00AM -0500, Chris Morgan wrote:
> On Mon, Aug 18, 2025 at 10:26:06AM -0500, Chris Morgan wrote:
> > On Mon, Aug 18, 2025 at 11:22:35AM +0300, Dan Carpenter wrote:
> > > Hi Chris,
> > > 
> > > kernel test robot noticed the following build warnings:
> > > 
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Morgan/dt-bindings-mfd-ti-bq25703a-Add-TI-BQ25703A-Charger/20250813-054704
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> > > patch link:    https://lore.kernel.org/r/20250812214300.123129-4-macroalpha82%40gmail.com
> > > patch subject: [PATCH V6 3/5] power: supply: bq257xx: Add support for BQ257XX charger
> > > config: parisc-randconfig-r072-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181503.GrRD2T4C-lkp@intel.com/config)
> > > compiler: hppa-linux-gcc (GCC) 8.5.0
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202508181503.GrRD2T4C-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > drivers/power/supply/bq257xx_charger.c:392 bq25703_hw_init() warn: potential ! vs ~ typo
> > > 
> > > vim +392 drivers/power/supply/bq257xx_charger.c
> > > 
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  365  static int bq25703_hw_init(struct bq257xx_chg *pdata)
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  366  {
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  367  	struct regmap *regmap = pdata->bq->regmap;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  368  	int ret = 0;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  369  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  370  	regmap_update_bits(regmap, BQ25703_CHARGE_OPTION_0,
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  371  			   BQ25703_WDTMR_ADJ_MASK,
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  372  			   FIELD_PREP(BQ25703_WDTMR_ADJ_MASK,
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  373  			   BQ25703_WDTMR_DISABLE));
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  374  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  375  	ret = pdata->chip->bq257xx_set_ichg(pdata, pdata->ichg_max);
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  376  	if (ret)
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  377  		return ret;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  378  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  379  	ret = pdata->chip->bq257xx_set_vbatreg(pdata, pdata->vbat_max);
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  380  	if (ret)
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  381  		return ret;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  382  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  383  	ret = bq25703_set_min_vsys(pdata, pdata->vsys_min);
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  384  	if (ret)
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  385  		return ret;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  386  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  387  	ret = pdata->chip->bq257xx_set_iindpm(pdata, pdata->iindpm_max);
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  388  	if (ret)
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  389  		return ret;
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  390  
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12  391  	regmap_update_bits(regmap, BQ25703_CHARGE_OPTION_0,
> > > 7f3b6f1e51a925 Chris Morgan 2025-08-12 @392  			   BQ25703_EN_LWPWR, !BQ25703_EN_LWPWR);
> > > 
> > > Yeah.  This really looks like it should be bitwise negate ~ instead of
> > > logical negate !.
> > 
> > Since BQ25703_EN_LWPWR is defined as 1 and I want to write 0 here (to
> > disable low power mode) I was under the assumption either should work.
> > That said, I'll happily switch to the bitwise negate (~) and resubmit.
> 
> Sorry, hadn't drank my morning coffee yet before I sent the last
> message and should have attempted it first before replying. When I
> make the requested change I get a compile time error of "conversion
> from ‘long unsigned int’ to ‘unsigned int’ changes value from
> ‘18446744073709518847’ to ‘4294934527’". What I'm really trying to
> accomplish here is to simply write a 0 to turn off low power mode, and
> do so in a manner that's easy to understand. I think since a bitwise
> negate gives a compile error and a logical negate throws a smatch
> warning, the most sensible thing to do is simply express this as a 0
> instead of a defined value and write a comment why I'm doing that.
> 

Yeah...  Or you could do "#define BQ25703_DISABLE_LWPWR 0".

regards,
dan carpenter

