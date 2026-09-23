Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C734519AE
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 07:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148972; cv=pass; b=S7hK4Fgrz429/i0lrPTLkMheF9HAtQqNWiUekqbSSvzAniRWKz2RikZ6jsJATwaMdCuQCJJwBCJQgI8pDrJVVyaXLVjsfy5nKEnvZi8rF5UqulFVZFMhZ3d8+naJpVDL1BL5D03J0oewB+lM1U/iadchB5qa9VrHKclc23RcANw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148972; c=relaxed/simple;
	bh=a23ZZKTScOgNsAHgR+4PgxxRfDvdi6u4hQaxkldtEbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkLFoQ7p4tg70dC+Q4uBj7I/xhwzkofWTHGsGkgsJyH2jD6DQeT0v1T/z/w/4rFhcdW+QszIfi4/VGjhuIdJvZT/Sirw8U/oACb9dQJhDNQIbDIKPuZzU/wII3BPHYTx2L4BZhWKiZNvtyzXttyJQasbTkbnX2Fe931gidRON2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg7Wy5qR; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg7Wy5qR"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2dd88a115ebso3485555ad.2
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 00:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790148970; cv=none;
        d=google.com; s=arc-20260327;
        b=skhBq86zUzU9HmVoXNTJEHIRBGXPwpqn/vD9QrJmLr8jV3nJXuYGMYk4N9GYrjU87j
         PZ1kfQy3YyekWCoLSCeV3lZaS8AaD6J/9HSHV6ldnsCw1SNCHSPwa6PkvEK0b/99oDKK
         o57d+ldz1RvrYarUzSH/HsL6H4YIUkE0C7jOwAdU5si+s9d8HCXKeHCrqUc0a2flwM6f
         QUyE/806lM0vwpo6g8n39lzzDs3flCPC3hZZvtz7GMp7f37UHVG3fh/MwS61LClXsB47
         Zrk4D6pV+G6HZpt+XS3g/kyITBstPO2gW1JYedWuiHmM0rdtpt2FN7/JfhZC8S/lI0JH
         wRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        fh=YFDRHGSXwEvxHj1Zs2GpjzJQSLG7NzsQdbQlaKNGOdg=;
        b=IdOgQkB5W5aNpLmJ6aLYFZQX4P6MeJVbcTzyDx97/7g07TS1enI2qpkopkupcGO0p6
         1Q/Nv9zCXZYblviQqpD8LOBYLkw2mDzUJ3xQzS4B5IluvruFwd8Yg/syzjFisWTq8VV7
         SisLccyhcAT2kktDibPI4gXhwfwpLg+qEgHKIfAQK02TKVuAKESewAtRApahgVCecoUe
         6Biil80g2Ag9O6ub4NSmlNSBxBBs01jP+9lvCvW18k2hesrosfYn15D05nUxLg3uDo1W
         4uLkZXrNvorEIoQxYVx5/id0zZrcSgCsViybPbMb25ZNCp1dkwU+MuZln9FoGIiD19/P
         ytxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790148970; x=1790753770; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        b=Vg7Wy5qReZ0rVwsLO6qzouN6M6GSKzqyE7sFnu+Hd0Ap/Hd3Qa7KScwYC+hp1CU8ma
         upK4XKcKd5PKfaFZngwg3qrwdl1O9iAlw3SLvAVOMttLHn9BrtBmGWTHNkszdZGYTT0y
         kF3m4k3ryMu+dNNQTCAcLXuKwla0zBCt+2qC3ds3hyn9UfN5kFAkgMc12sKHUeRVF3Sk
         N/LvMt45Z5QUpdscryBkdOCk2hMhzfFfZZwzAhwXKq+4v47SvS3PcOy7fnYhwKAUsRwx
         lfvPEfCPT3HNt9GjjUq6QRBpMldWjzvCT3VJ/O43wzWC9tLuOGj0MjUo3OtQljDQDYC8
         /gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790148970; x=1790753770;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SkYyGyb7z/lWsAu8Sjl8TsKGXsmkYRLIrQI3QJXImNA=;
        b=i/HIpsrA0noEprdZjyF3861/e0v+eGJKapLurP0vXvg1RsB4+TVocWtj/OYpt/POjF
         mPDMXHcDjf2JeaZEag/Rk+KYdATNRWQOH2JyoCect0NTC2Tmrww00yxa0Y4paLzDd/8R
         +FY55boSJTZiomVeEXZUlgwICcMwq0hcut8qc6F1ZBvbBbyj0MZMVUdg3LUL+qHHZeeO
         dHV2ZxyvLUWgQB//yTM3s8hIN1lvckuF5ZjOUrxZ0wZ7iw6+8OeIFmE+r5bmuPaI8lAs
         iPiYdQahYuEpYki3sZfKNErn3zb3I0sNC/w0mYeJkyBuqsaK3j1BlilBzhjNpVWt8gNr
         d35g==
X-Gm-Message-State: AFuF++ncxWu67WtsXrWGxNG1GSz+l9lGq7e09FVyznuJHYb4qv7StggG
	pOu/nwMh1XJyqrkKKpQpRr26RABkZWY7NBCj6Xsn+/4MY7PdBMFNwkKkodHoVSFX5hf+1NhoBbB
	r/gncflY16WViEqTrTwuteg5ENzA2ovg=
X-Gm-Gg: AYBFou1mtDgYfCO1Mh0gC93JsT+pjv4FtXapzmkOVC8yc1e/EvrGBkRTPmbFTmIDJPd
	qCyPi06jNNBml10l3Nn1ALHyab5S2Hc7zjBkJBAm437HBjFs0cuP67uTFtWosEK0RHg9uV0HhrG
	Amm6bbGT46gyZEfGHjgttUwcJjF6OZae3ESAWsr+GyuaTvCmXaai1er9iH1JVoEn2u+0h2w8ZcC
	t7Z3hmJRmmZGNYluOet+MgoRGbL44nkEprJoh/SFfGSJR2fYKuX88ltmAOT3ybZnPWKhsyWBaXv
	nWsEb3/dxSOBzVmUx+wfq3VfuCi3DFTV3Y1+Fx2QQVWsTfu+0FhwApLltadaI3CoXOXpY7l/aIv
	nllSDw6O+yJmLKBlE2yqBlmk1ZHDNoDBjuLvXlBbsSWxWI2gQE2rJZsYzAQfhZ0OlTcsZf+wMAO
	DPrg==
X-Received: by 2002:a17:902:f60c:b0:2dd:c100:4256 with SMTP id
 d9443c01a7336-2df69e0980amr16461265ad.58.1790148970165; Wed, 23 Sep 2026
 00:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609230734.R1jtbjb4-lkp@intel.com>
In-Reply-To: <202609230734.R1jtbjb4-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 23 Sep 2026 14:35:58 +0700
X-Gm-Features: AcwNN1UFdjoqjrKiQ_nGicFvqanf9D0avKGQtoAWIF7No9uPNmRvBXKiwSAcU1s
Message-ID: <CAABR9nGwX8v2sdRCe1+NBVTS2O+7s3GiJpTVJ-0mK23p1YLUCA@mail.gmail.com>
Subject: Re: [linux-next:master 4776/8910] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974
 axienet_probe() warn: platform_get_irq() does not return zero
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>
Content-Type: text/plain; charset="UTF-8"

It seems the analysis tool may have been mistaken in this case.


> bb2b71024976a39 bui duc phuc             2026-09-09 @2974               if (!lp->rx_irq || !lp->tx_irq) {
>
> These should be checks for negative instead of zero.
>

The check is intended for the case where rx_irq and tx_irq are obtained from
irq_of_parse_and_map(), which returns 0 on failure.

> 95219aa538e11d5 Srikanth Thokala         2015-05-05  2975                       dev_err(&pdev->dev, "could not determine irqs\n");
> bb2b71024976a39 bui duc phuc             2026-09-09  2976                       return -EINVAL;
> 8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977               }
> bb2b71024976a39 bui duc phuc             2026-09-09  2978               if (lp->rx_irq < 0)
>

This check handles the error return from platform_get_irq()
