Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766176;
	b=woiENHEjaKw+Vc+QPXF7+zelbtUzZ6xjoGnoy+BjwTFp8a2Z4RVBs34wt5wPgSrkn8Cr
	 x5helWvAvDPvNFVtRbMWeaRzNRZOTwsYaaiqxjKSSelqiBsW0GkFiLwh3zqJuqQ2wO8wI
	 s/aXhJ/IewRZ55l9NtnEwBnrAHkWQt3qMq3znN/8xgxQWvqbJhrxfHiwiHIb+xdSrs/gs
	 xnsaj21OItXeMRr8uZDBamiB9xw1euPuzu2f1Qiu93IMkFeG0zQ64B83jV3s+4G9zc4tO
	 1CPSikZDGNbowinrZwsCdx3FW9L8xJZ0fJNkYvYPgxltJLNvPsZ/4OGi2s9dB3x83ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
	b=s9vgTuiTIJ7XyW2zHWAIlCITeqZ+TUHWSN26szPlI1RSDi+hYxCquxlp4NQSuS7/BP3U
	 oIdebU8KiynZ81MC30dl1Vt7Qgvs+0OLEEDxszU+825yxx9Ad+wxz0iRWBdO1ZLNOP6fT
	 XUJRk8BomaVxSSvq9p9phq/6F3kxXbUVxe1HaNPtN/x7cHbqSKvj/3Iuc0OX/kBoSOkMj
	 5muWfdmFW64WiLswpW9Ac/18xQnMY/XPm3+ploD4ogYvX2bp/1Mr+s0irNpn0Z0wct2Mm
	 moqaPqQ3N1eoQJb9wtmZF3cugdOoolFj1zxpdOu50KTsIzVNEMct2BY48t3b2XCWMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FF2ZM7Xj;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08B606A33A
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 07:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D08B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FF2ZM7Xj
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04bea9a93so68210235ad.3
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 23:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795766176; x=1796370976; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
        b=FF2ZM7Xjzdsp+zbwEh9YRtM5YHz9ba7KbliulwALAG+Iss/7bD3aD3vQETuqK+qoM0
         gtXvnnltI+gD3Kp8e4Y1wZcwe/hq+suQoYyx+Za+neohTACcEbLQXhGsLoTSWzD9UUdE
         oc/eUkjUf4z7g24QhzdssP69q3x21+PKOuCAO7M6wRhPWFxb9jfDFQutsDqSgyHbZq+I
         6scEct2/rNI42VvkvmpbUPcdl37H9omzGxWRZ9PPrI24JSRYTgpMSsqe93OHPaC6f3l+
         Lbnqo0wyaSsxY6PdBhCnIjbbQ72FGosRd09JKbnnzcRxZdLaRqYyJk2gmpBTX0TDS0XT
         D+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795766176; x=1796370976;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1moggd1iRJXchYi3IM1BXadcDP2xscjRLIrFEHuwYA=;
        b=XW6CDeY213sGWWTNqlreG9VDMigitputbbpbvmioY7t63eBY+EKNDckP/MYcVmpWYf
         RNCnMuGQWlgzsPEA+UBVgLMjBHLU313urWBDiGYIPcRbKygAtati1jXWxISI3eVaqqE2
         9wbGo+p5c/Q86+unUOq+mo8awYpd+lD8xhCebJFyQibnzYZ5KvJ+jwzmhTZeSycnXt9Q
         fk9Ufk5UO1T2bstu/CrFMU6ON048W/4qqpeh7xrRnLk4AYH26fFr446Pgac3FF8t1Xdf
         CyFGHoRgc0feZtrp/Tjgk2RTWAoCRx0ejZak2duGvRZ9ctkFjU/b+Givg+1eB+tlTP1G
         9brg==
X-Forwarded-Encrypted: i=1; AL+hErH+VGBKIh4ha9gZhsZxoMYc3N+p26nGY0snma/FtmYwLhmHfk2AlNBuyP8L5W0ppvYLuLQDoO5rqNU=@lists.linux.dev
X-Gm-Message-State: APuU4Z++g4uTAX9rZfOVSKFprTbZI3nPx3y+kuTe6s4GiIm4k9gDYe+D
	coMfNYtRusLsVcibP3IoBgzXFxYJJai6WhRBRSFAVW4kw7IGNJV69xTF
X-Gm-Gg: AZFdTZcKwo0dMU4yz+/V1Y9oVs+lZrnJBDhm2t1rD1YE3qv+Mj0RRVFJtP2QZK9dlSP
	DS03t5QzI1twya75KtVCkvrrir4N07E5+ja0aken1OPj5PMW2wykNpi0w5SpBxUPb6FGzQOubRR
	ywy27q46KYo716DRTRjk13LQ2cLobWnVD0ok8quKaEaK2xVLo0EZNFbki8kmq67GtzbdAcBHN7O
	+3ANtS+aQRj/1Js5t4mNFnBRpmRbp25qLCtEfzsLPDWmppGWqhItA4dEsiObkL+UdlYE/u/IDZD
	W65ULSJNbPSPPjViCn9hohDG9eFQPs891HbY0WCTWXBEtIGEXT0tvZfpudfXGg5unBHrqWyYXUi
	cBjFgt5YbTA/EqEqpEcztDdma5yXqslxSpPNL60BCiErd5nF/ralPgrcR+PlC6oYhdDA749xWRV
	iBiKtoj5/OzZ0mSm9cSAL94fGev6mv7Het48rtLLep5A9g4XvyQvRs8B8yp3f+jn9sRep8hdd4g
	6R6L1Cyi1+cEqViN0fxRmTKUnzAFMvXMiNL4eIl7UzqB6L7ZsWEJiI3kaSvw/5K8XeLh7Vhy0id
	4asTthAfsUjxuHddlvG0oI6+ZiFSW0+LmZ5C4F2kVtgZRXPg0yq0ioevFUsfRER9gRDl3Z0jTDm
	hTmjJkY09CSKVU+HDP1FsWVIug/R4aClgs2BXG6ZKoIVj
X-Received: by 2002:a17:903:4586:b0:2ed:fd82:e905 with SMTP id d9443c01a7336-2f03f207db7mr255674895ad.31.1795766175642;
        Thu, 26 Nov 2026 23:56:15 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc4f2sm118968555ad.30.2026.11.26.23.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:56:15 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Dan Carpenter <dan@pereq.eu>
Cc: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>,
 oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.
Date: Fri, 27 Nov 2026 15:56:10 +0800
Message-ID: <179576617048.3953440.16752646728304372112@gmail.com>
In-Reply-To: <awkf4CNhSPz-lcEk@stanley.mountain>
References: <20261125184601.R647t8Sj-lkp@intel.com>
 <179567739729.2548149.711673218230357357@gmail.com>
 <awkf4CNhSPz-lcEk@stanley.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Dan,

Thanks for pulling the tree and taking a closer look. You're right that
the state flags and split error cleanup make this harder to follow.

One catch with tracking ocp_hw_enabled only in setup_ocp_irq(): the OCP
ISR disables the hardware interrupt and ocp_recovery_work re-enables it
later, so a flag maintained only there would go out of sync.

The regmap writes can fail, and an error doesn't necessarily tell us
what state the hardware was left in. I'll look at moving the failure
cleanup into qcom_labibb_ocp_hw_enable() and whether IRQF_NO_AUTOEN
would allow the initial IRQ setup to unwind locally, without breaking
the recovery and retry paths.

If I can verify a simpler and safer error path, I'll send a focused
follow-up patch rather than reworking all the state tracking at once.

Thanks,
Yaohan
