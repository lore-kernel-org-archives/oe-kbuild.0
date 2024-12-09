Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89866216E25
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733743158; cv=none; b=kTf+idDaXkdIstJ+iiDw9B4K/RlQXyw/culx/n8xalQOwO3uUXTaHeFRmPUxRsmS4VFdXfIDEpagMz+PfVH5msjt6l3EA4OQADApx85UI7W0co2/logan+EW77SCaiorEqJE8nr4j4IGKaHBfA7Y7DVhf2VjdcwxdNObIlhfYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733743158; c=relaxed/simple;
	bh=EvNBtcuq66wlU4z6cIC7cBgd2PLoedbD/n/wBA3pDus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSl0xNbil4p/b1w+KyBxVWgTENcEdMPc8ILZRhfhc6KMMVrEL9mcHOI2gSgW5lKl3loWA9gpehhC6f5saodePUYMTSwkn6jn/l0spfjIP1P/WpgvHaUQu0kZZzhf7ZKKhiid2hgGz7RP4+8toflb9s70dE4ygFOP2WDHRz8C9dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpwe8oqg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpwe8oqg"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434f3d934fcso6800305e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 09 Dec 2024 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733743155; x=1734347955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WEaS0oTkc/etYl+1hpLKLxIspdSSIIqHv8Jv//XY3V8=;
        b=vpwe8oqgvsDzuCSGVTq7u1mHiGuxkv0pSC3MrHNFCGLwjCng5S7xjChMVCwji27fFA
         jiEPOWCIjr2u7k3eTFdXyzRGkK/nw10jtnmoWHPOHDBLv9XhEoGUHCmg7W1SuwmvGqQp
         n6wLUqgih8WbqaFJx/jdvJXT6yqPTjXB43wSEouUhtGcweaznScfWC0I00dJlyvsr874
         XD+mN8Vd8gCGII0qwLIySrgMDbPOL47A8Il76sKPPb2r5r9sh6IKfaQb2kWD27ZNnX0H
         ntxRq5rlgNVkoSmeGyckO/Qp0bGvTXqSFDPLnY4uNAuFKCeDO7zUbVjzwUtji7PMXZMs
         aLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743155; x=1734347955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEaS0oTkc/etYl+1hpLKLxIspdSSIIqHv8Jv//XY3V8=;
        b=ImfozffnZVMEnzEH/Nu2HCd4HlSfJhw6JoDbVxAH60HkpxirI2tO96JEA6dSt58X4F
         bTMhi3FAdMnLfirqtAV13zfhN8eag8U6XP+bUXDCiD431O6t1jZ7rcPLHqWaf5ne7MrC
         mAaJR60zPRuX62f+bAyKEqF8H4apI2/jCHoAyf4kxsYYeLkPhNoF2jlu0mXrbJaHWabQ
         nmvzpoSpVumSyVkfeKa7ixs4xl/13BiTyo5wU8+963rKr6GktE2MCpS9firiVBgyn+qW
         hEijtg3BQoz2kgagT52kr1ez0CLCyp4/tbTn1RCRiqP+oEt+ywilqIw8NGtU8V/WDorE
         ukbQ==
X-Gm-Message-State: AOJu0Yw0Zlet9qUul0o9jpnmduPOs4QOCleEtqTrQ1Bs5cv4cVXHcAjf
	cRBxj1RQ45mbrkoDgX/q0PF+cQuutjYVsCKyX3VxIKGGIKSHw5rdJelbBtkIdGQ=
X-Gm-Gg: ASbGncuX4yM66Pt/6dDE7K8NPNAlHkIpB2Ukbt8CCJYgpMtDlv7AkDHjApsHAbo2G3K
	+O8vrnmT3GmN/bWATdQl1j7wQ6SqLlpTSrLmoBQMFkOA0tyQndIMpiRwxfIwDy4rCNBcSFVQFsS
	WhfpJwNTCvgpmOtgcXcIjkfvEifvl7pWaPMahvTMO86/Kqks2RFkPUnicl1nWWHlwqLLBkeDbxC
	gkA1DlAsHPY4d+FMonnbbFW7SBBcdIIsa9Tykzrue2mfdAKPGdTvXs=
X-Google-Smtp-Source: AGHT+IEOw6Y2qfshQI8PWqV2AbSlpXw9I5f7b9iOiCuMN6pqeJhfrRidRhlF2d20YiBeUwISSDGC+A==
X-Received: by 2002:a05:6000:1a86:b0:386:2aba:a7f6 with SMTP id ffacd0b85a97d-3862b3e752fmr6170429f8f.49.1733743154863;
        Mon, 09 Dec 2024 03:19:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434faba810csm24283085e9.18.2024.12.09.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:19:14 -0800 (PST)
Date: Mon, 9 Dec 2024 14:19:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cosmin Ratiu <cratiu@nvidia.com>
Cc: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
	Tariq Toukan <tariqt@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lkp@intel.com" <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"kuba@kernel.org" <kuba@kernel.org>
Subject: Re: drivers/net/ethernet/mellanox/mlx5/core/fs_counters.c:173
 mlx5_fc_stats_query_all_counters() error: uninitialized symbol
 'bulk_query_time'.
Message-ID: <c90846fa-7296-4d68-9d1b-81de0b6a611a@stanley.mountain>
References: <1ce44712-7b81-4ace-aae8-7284974b11f1@stanley.mountain>
 <59b9f96ace8fe9b6fc1de39ff060e4deeb712ff6.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59b9f96ace8fe9b6fc1de39ff060e4deeb712ff6.camel@nvidia.com>

On Mon, Dec 09, 2024 at 10:09:59AM +0000, Cosmin Ratiu wrote:
> 
> Hi Dan,
> 
> Thanks for the report. But this came up during the submission and the
> conclusion was that this is a false positive from Smatch.
> See the discussions:
> https://lore.kernel.org/netdev/0dce2c1d2f8adccbfbff39118af9796d84404a67.camel@nvidia.com/
> https://lore.kernel.org/netdev/66ccbb841794c98b91d9e8aba48b90c63caa45e7.camel@nvidia.com/
> You were also part of that thread and you reported no issue on your
> side back then:
> https://lore.kernel.org/netdev/fcecb18a-1a30-400d-b8ec-1806d856d145@stanley.mountain/
> 
> I am not sure what the conclusion was on the Smatch side, whether there
> were planned fixes or the whole thing was just forgotten.

Ah, yes.  Thanks.  I have written a patch to silence this in Smatch, and
I'll test and push it later.

As a human reader it was the unlikely() annotation which confused me.

regards,
dan carpenter

