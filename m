Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE50C376BDD
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105745; cv=pass; b=o6NdgaVg2k5AJZ+uvVEacLh7I3phe360PWQvcEuPScEh4bWy0j8fpzZQBUenUcSxtR+4WYtvBRoTGZwnCdXwM4Hgy4P2agOGWraZqwSZg6ftWxeUUdi6KoglGnF9UsBFyx9KvcNX4v1XATErG5XJJU0JzWjEisszC6DVfRGjXTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105745; c=relaxed/simple;
	bh=PmHPMv+0IVVZWQVR8YcLFHLTKICYt5ZaBTe7s/+0FW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzURUefzXNDP42D3eq4YFKCueWiRzLek6x+e4zVEJyqhuic9MXbtHZQxYDdCfgEHVhbDvF5xYR/STGVvMnK8xxEKq+J7+zihRqZgNcw/0xmNl6Yl+F6f7CLgkQB2cMBikuxg6W3LQHBGXOZD6rB3bpLXAT37Lxlk4/GGq29a/0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DqH2yg53; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DqH2yg53"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65812261842so3870671a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 22 Jan 2026 10:15:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769105726; cv=none;
        d=google.com; s=arc-20240605;
        b=a5+Y+v8XSXIFX7/pPbdvmeKmc2nBMF6KjU25jBPJuGp3KNzcOGnS1xGfwdJEOg/7qz
         uZ4ZRwcw5LBR8ZlPUMecYmZ+HE60XQjOvvE5mx9+ExA/25EOl1usLOPTUAIZh/0qsWvW
         wWdhIXUqx0dEeJb7lmooQxR2UBe0+WbwxTWAspq28xR2dNfAPE+KQTlK3ahrxlMMbfmr
         xUmTGG/Ws6KHUkWSQaSRSGxwdVcALa5cPF4IDGWcQbkFJMcS4XtM5942be7FZFCpWwmD
         KFilEHkVUY8z93L/MWhTe0I2Bq5+Oyge4IuiQIZyp0Qtx2OOSjycGohI6v+bmLJd1/dB
         m5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        fh=PaPwIlRB94ixE2RrD0Cs0R4XKToc+RZjGKPhN+LSVgs=;
        b=bVOr+glqxGQCBv0cNssEFagC2+LUDmyXaSvD2rkALMq9lCU80+UNL5Lveq1324c++8
         Ob2IseEvUfOCm7lAxwZ7WTaCNrGWuVR8r5BOA4uYuU35cjmibweuclnCX4t4pMRmQqRX
         HsONoUmK36qLaiyE7gYX3cpUQtkYD8uLqB9TGjyVZWqseolM0Xf5W/8dRj2PXkEj5wnx
         Jrbem9SHtUkSpCdNnqZ6GTxlWxOdMaYyD9GH2MiTsdmahFnK6JhFKIOUJXi3G3Zg44Gc
         JYUWI8g+stKde0y+SmPCNvPTLtSq7fXPp4Y5mfpIl3f0acv5gPOEvKJf1r9lMrTmKbar
         8zsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1769105726; x=1769710526; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        b=DqH2yg53WCqWwIf3Rz+kGtgrquFFztfom0WtzBZQWxEGwAL/gGD+49n93AhBHveGmL
         UZ/XIlVM4urLyxeXemAKnMxerLZtnkKiXszSOfwVjTzbE2EYNkRrtB+Kf/yITvkNOprB
         OKZPtn4HysdmD/rup2NyyvSkBjvMW8UIXNwuSMT5hHn3XpxrmKKq1IoIXDhXFXG0LqOG
         0albPvIJwVkQiSRGJqHMsSGUSp2EnH7s82GfBnyBxGcVWdbH/iWn2GVWfzdZ60C3ur0r
         sVxEtmhh8e4Y76fxzZQ08g+gzKm2sp8APHopJXF5BcOovofSw4CfxVMkaqd2U+WWoCZ4
         9rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769105726; x=1769710526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azOk63yV7A5TybPiH/Lg4nzY0I8Pa0E2B+WL4X7922E=;
        b=ZQZhnH9ivS/3OrEaV73zltGiddtymLfBrW9PkmiLwvbxQHc0N3q/hLuGOoRVM8HU6x
         JXtI6r3IP/l/q+9umTyM1QeHwZlYJBo1+dnoEHmYTd1hSE8pcE3MTpbJRA5At1+PV5Ey
         +P0lVUtRTzZYx/4nutsvYlgLArebCRGqrdu7IHA8SRdTyAJBpP9QJXFrNqbDOQJdIi+U
         skBGOqRoiqVdBOdOGAZ4fmmEmPnTNfiqAnrrY+Rjxgol5EH8k1NgBZttDsFX0DFier+0
         C4z5KQCvWeMTv+8TvXG3H69l6ubdiZ31L+rigSH3w6PEoeBc27b5tjM9G9Exn4Xlbh0q
         NH7A==
X-Forwarded-Encrypted: i=1; AJvYcCWxqn7uRG6zmU5YrLLqZ7RAp8pG3ES7I3GhTtLX+SToKfDThpHhdkxD5rk610NBFL9eU+obkaEReHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+7GdqU1hmYQRGaB7UGV+PdGnHkN2Ml3GY2W9PERJK59byHle
	ZJAGjaJStJlmdDIgQIXkBqTMKVpPtMzNGXBXOuvDjuVwV5Q4ILgjgOFeIcCOvPPdKJqK5aXUVx6
	d5YQ7UMYVJstEuqI0JntbNJl25TdcLtJgsNGLbc1X+t3PXucohSo5
X-Gm-Gg: AZuq6aKd5JgzjsgNT1Glzb3MPhkun3v8Gg+hd6ZSc5h5RegUm1E7fDXaozR9gSoA2p8
	ZzjcnZYIRdROBOxSthNnFmofb0Rk0diFzpVgxZ0BBP+PUZZYv5/b6fX7aA69xQwterEQ4lVeiTS
	sB4b9/M5wlp2SX+OxdM8JwoSn3TU6vjqpCpkwukdk4WCpVNHnHKoK6bTiY5PJ7bfEXhhv+h/V2/
	osP3yDNyGTZWWreX8eV1U/VgWeykYClYg9xwPxC1dJJk3azcBKnpTT3plK5l57myFrM66OwiTfy
	9HajS9BPQ24yssKMvo2wTvDO7w==
X-Received: by 2002:aa7:db50:0:b0:658:1350:1fd2 with SMTP id
 4fb4d7f45d1cf-65832eb76a5mr1835496a12.13.1769105726405; Thu, 22 Jan 2026
 10:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601211636.IRaejjdw-lkp@intel.com> <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
In-Reply-To: <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 22 Jan 2026 13:14:49 -0500
X-Gm-Features: AZwV_QjkOt8rryPZqYSqx98LQ60wO70s9K8cucBSZwSM5UYoS1ViJ13uHLsVIOo
Message-ID: <CA+CK2bAyHHoUaT_4dTNK6AH2oyMMhs2sNhuW97hV4yRw7ie9Tg@mail.gmail.com>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> --- a/kernel/liveupdate/kexec_handover.c~a
> +++ a/kernel/liveupdate/kexec_handover.c
> @@ -1011,8 +1011,10 @@ int kho_preserve_vmalloc(void *ptr, stru
>                 chunk->phys[idx++] = phys;
>                 if (idx == ARRAY_SIZE(chunk->phys)) {
>                         chunk = new_vmalloc_chunk(chunk);
> -                       if (!chunk)
> +                       if (!chunk) {
> +                               err = -ENOMEM;
>                                 goto err_free;
> +                       }

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you,
Pasha
