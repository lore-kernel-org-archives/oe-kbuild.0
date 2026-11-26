Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677403;
	b=XqyQRkOE+WgBU2EaXK9ml2JET4UKrfwcOe0h+Lly+M0RNRvbMrku3edJsZUgbbnNhIG+
	 NgE9NdBkYuH2Cpf4MCsv6E/+L4015mCQDiQ4isi5GoRUsH6+4TOW5eAgDhT7dzCukX99T
	 cPBMFiVH/f4kIgSeeb5ESe45VVJwfLt55PrmyA1PRAEZEM4A7GOBzBQDeSODbweMaP21y
	 cnTAGi3fQ46wegb8lLjW0Pahe3TUv8QY+9knmMuX22WI2uw41Du3eOQ7e+3P1vIBRR0ne
	 y0P17RMZh4jDjSq69RUBv7lbQkASRzqIslXXs8MXOiXrvCc5g/7wNR71JWai7wpB8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
	b=eo8Nb4sPDSgKJhEsYNScnFVBGw4Re4KeDDZYpoxHWqTETh2/Lt+hmO3pgz/fk9JzqUD3
	 1cWltTzk9isG7kkhpgnAJL6GRdWIh8azjvWsASIly5mqu/KVPuOn/OxoHo5/Jf9VHNDxB
	 D+CLAssGN/ga+GKJ/MztawoND/lmQbR5+FRRL5BCYDfnc/rfTvrjrCZrvi/R6XO8n6b2O
	 fpkJswW+88xsCB6xhutWsxEhTqmAsXeTwAcPrXqe32TpHpqEl1/98qJE8ERNOLyAi3T2u
	 +hMxJGGUfu0CgTDSeDvN16mxxF0UsbZdd/fGxrgCpVMAokRT/TNQUT3kmRt6299aqiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FeD6/V6B";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A8606A32D
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3A8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeD6/V6B
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f02f04a426so54839415ad.1
        for <oe-kbuild@lists.linux.dev>; Wed, 25 Nov 2026 23:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677402; x=1796282202; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
        b=FeD6/V6BiuN8kq0CQy9JdfeBHxZacsPpA47jqIPrBZeMiQPoVk9Ame67KstVRJmq6N
         TBfaU8eqHv3s83luS++UurOpJFPbAneSK77MXOAUZgeyAiZPQ8cDrW4q/iX1K6ms+igf
         gaAhlIKjGYsBcpOaOgGCSkOVYaaMCThSJm+ZtTMfYweWPfY1ktg/xV4oopf7FHmhwobi
         +IorCLWWjMSwWlheBiGsNg9aLDNeeTtzKGJdyopLxle88AGXcFVDA9mFjwBR2yYojM3R
         ej6DsrVUZglQ4dOiocqbODbuyVU1cShuvOzssKXGeKSD1q89xTvf7+6E3YpfjjmXdc5D
         NmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677402; x=1796282202;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B/4dI4VDUiuBLYef5Gi0z/nywGDePP/HCtFfonWUuI=;
        b=zNmLxTGURgHOWd6GYJ8uakp899drMDoQ1XxIUUxZs5gnWwzcCaJK3/u7UHWwWju3GB
         WzhJayg8fBzYL8OjcBU8icdX1TB1y8vgvmu6KHiLP9DEqq1KKV0L3sCQ4dvcGe3efF99
         ELYOnLhMrmborWkqgzcG0MSgsMzxL0zDc4ccdDjITIego7m5FanTYEeX9gy+iURONDJY
         hi03gvTRwcrEntwZ90EAOAVj0gSU0dAI6c2OJluYUdnUvgycpivTfanLokJigMnqWaN/
         enSGj0f8ayTBCZDIDPlfck5Jkl3CEcdM3CajVNoZSU04tUcEfB8ibQZMqOJY/vGqat/b
         oJ8w==
X-Forwarded-Encrypted: i=1; AL+hErGz8VP9aFck21PcV9ZrdggMpWvQLfbs5dyNdSjUwLoSmlZvkRN85RJeHWFCxGvWaOHw9CvtWcwQfYg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8akDuELdXHJCq9UnPG4PkPpgGXxZ51L5uT+muYDs9bf5VDeAoY
	vlHiVlPPTfHsgE7kNB0rmAblmbEzIinlbQfq8maQoRtFCoxaNc52N1Bh
X-Gm-Gg: AZFdTZeBQeQC8Tdh4PAOPKk4GOf3gDPik2/aFJEjsZ78kSkD39QHZaFRtu/jjwQNgKJ
	b1WDPg5vtEbnKXfVMUsqA4Y33/xfwt2nbAOSXBcDeI9kzVJ6CeIi5x/CoRXOeuTMZFShiQJgS5E
	9s8fGvMtuXj+zzvZahdvP38qWUmJ14OaZZTfIsR4BClvRlO4ZUCmwZ6LbZ7VrSqs3Q/q1gdyXii
	iPKoSM3ftc/4HknOShF07ZVQniTAxfymotQXKSGUfVXhLHzZC/IObpphc7HsQ18Mz3pjPM0Z7DF
	kpKrd59LqVyJDvwyhNyKgU8skNR4Ge8ylxLlZuIvIPTwVGL2t2LIDQR/aj0L/JWWQL9zvd234Db
	QxcgSMpE6AKMfZtSoNzcDmn+gcw6mZw/OebSd2dPdcWrYqfmKygaeSqKXfkJMqcKMBW9FWh/be/
	XWrY3W2DVIuVIXtBrm9y+mX+A1LHYtGWiPh0muORwKPnSBZ9zwyTPvO9BMAyT/N+4AZIpE0Et+0
	S35g6QSj3HyGFaHZrv/HFuvSZCX4UqpeVvsvtpGbFWN6JPlIMW0ruBujZyDs9OUZA5MGnAgNHG/
	L30i0WAfMejJGYlsfAjMCih8IR954wf1mRQBluJq5dpGunNp3Cap4DUbV2RGck82uCf+PR1nHnN
	M3oY3jG6GxjUOIj+Bac0Zs9LO
X-Received: by 2002:a17:902:d4c2:b0:2f0:8799:415f with SMTP id d9443c01a7336-2f087995606mr144752925ad.44.1795677402208;
        Wed, 25 Nov 2026 23:16:42 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm97624275ad.20.2026.11.25.23.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:16:41 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, oe-kbuild@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines: 444.
Date: Thu, 26 Nov 2026 15:16:37 +0800
Message-ID: <179567739729.2548149.711673218230357357@gmail.com>
In-Reply-To: <20261125184601.R647t8Sj-lkp@intel.com>
References: <20261125184601.R647t8Sj-lkp@intel.com>
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

Thanks for the report.

Keeping the IRQ registered if qcom_labibb_ocp_hw_enable() fails is
intentional. The devm cleanup action, qcom_labibb_stop_works(), is
registered before qcom_labibb_setup_ocp_irq() can request the IRQ. Once
request_threaded_irq() succeeds, ocp_irq_done is set.

If the failure happens during probe, devres runs the cleanup action and
frees the IRQ. If it happens during a later set_ocp() call, keeping the
IRQ registered allows a retry without requesting it again. The cleanup
action still releases it on unbind.

qcom_labibb_setup_ocp_irq() also runs under ocp_lock, while the cleanup
action calls free_irq() after dropping that lock.

I agree that the hardware-enable error handling could be clearer. The
helper clears the interrupt latch before writing INT_EN_SET, and the
caller currently attempts to disable the source if either step fails.
I'll check whether that cleanup would be better handled inside the
helper, taking retries and the existing hardware state into account.

Please let me know if I've missed a path where the cleanup action would
not run.

Thanks,
Yaohan
