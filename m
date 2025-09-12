Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1A3321435
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695690; cv=none; b=HGy3AS/XwvXVQkJeZJDPsXILAqnBCoZAYqlMit9QBW5Q+MSzmY8e8gzbTeVIMZecwa4gmnrA9y8EiJS/LU7v2p3XYuF7ZjPGzMVUSPmAzocKCrm+7RUzoT1X2FlcB5S2Sy4uL3CWfO5ibenfwMV0FROOorEcwKyMOCUNofnl2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695690; c=relaxed/simple;
	bh=RvDEpeloizCGVbZM9h2TCHBDf+mfeFWHfJJ88MjWEOs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIHsQdGwYojz0mkpNcUXQuXbjdXTs7ALsIgGGEiVhIBCtrgKD6d+RZ5t5Y2RBUMoXvDWgce0BMt3jZ9xS0vYSfHDesY2s93nSd4bWBorpiF9WQQC3tua9Q67z0JBzwjhQAAFdPmVpJnUBIfrheI2s6a1pquYzfKo/MMWTQwEwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ettcUxyU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ettcUxyU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24c8ef94e5dso17385385ad.1
        for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695688; x=1758300488; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JojO/2M959zsBWVjUEkcgukb++2NDZNktHYDQOvCs0w=;
        b=ettcUxyUZhPo6lKdBERSTkkKnUNkci5RwRQUpDSjiCOLxHjCUpBaCbsXRxYoeHOiBx
         OU/OhRgh1XNcJjErVpPCUMzOYUjIGisAbM47lqMW78/9Cho6ZwhzAU1N3X5aEYi76Vam
         7hBx9DQSxVtvm8MHJXQYU9Dx50KBwdLj0787c0qVKRr1Yct98AxOMQYMkBT8FIxXuKhD
         B4L1/bQrMJB/K7jx3KFvDugJXspxQ/PxOj9/I5A63HDOIb8vRSFAeVebugW+yBkOt/oB
         jXZfZkcD4xFz0C/Z3fV2hR2utI4jSg8hp1J0u8CvNq9XD9QR07xupKZTkky8PyM5zhgN
         Kznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695688; x=1758300488;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JojO/2M959zsBWVjUEkcgukb++2NDZNktHYDQOvCs0w=;
        b=SUv8DCoUXVRlexNvZvTqx8OcsklCGta9bN4MrtUtTFMcsCkOH8Osa+LyRKVEAhAG3r
         vqei6w/1WIHbEqO3Qnj9UHAn2gd6dPU8W/AtopLQyFdq2hVYBVQMR1/u/gD258Zkaio7
         YXO4075AfFmJABZQKaL081fpryAXgX0C7Ff11k7B3w5P3D/2wlyh4dKpV8N36CHZVZpJ
         4W7JlV2Yk/w5KCzaDEJNoIV7SwM0grlKeC5Kv+AK9vQdrke/YMCFDakB1Mu94LzF+8yX
         sCiyzcnMprz725lfu/eu1yoabYAuCgg5gucKLIzDYWNGn4U+Qty7DqlkJR7JgLPu38Ff
         5nMA==
X-Forwarded-Encrypted: i=1; AJvYcCX9IkkHAvQie2DUbyvbx3/nkS5nWO8N42AA+CTM8j4xa5lnDmb0RpcZ3tw71L9CXOc7gL0wxNetotU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwROVgQjkxSdZGdGV+RUt5DhRw81IAacLZp6mOEXkOcZcl4T2o8
	CH4xjaIdiw6zO8E+BFDpS2jSxKIUWtxad3cJlnCzt8FttBbEf1L8MT0m
X-Gm-Gg: ASbGnctxMSiKH5blW3CjglADM0/8GH/Nv1NbN1m4F8WOzvuPIWPk7CQ9Cm9oK+3vfCq
	DSOeGpca3xOBmgqu3lz1QRMDJbn4uIaih6ou/BFTJJxGLrRikm3rqKj/kl0D/A/b7I5xFE7vJQh
	OFrBjPsCD75HuaHP2w184HLqOvNQdW96du89/LOeaxXkhHy2n2Coz0gaDgxsfhAcLH+qEqISMOj
	hGrrE4UJ83TZjbl+2KmClo3WTtDggI/ur9m5iUA8OL2JoUtGYK8ecMgd1HOIklP444rkGKOMnWe
	ST0cckP54jrY2IYIcFM7L0qSBCUJn2UyrXCQClukduFSmxE42fFf03efAYUkM4SIET0qdt2zrxG
	5ChI2sohZ7cP8IIWxggAkbigIOt9SWdROLKvHlu1FsyuvHOgrbZFGaKJSZsM=
X-Google-Smtp-Source: AGHT+IFbLPULombToQlgoB3lZt9f0p06h3JKUzxWJplHYpXNn/n7w1mHGDTg8MpZyVqCQim7jQ46fg==
X-Received: by 2002:a17:902:e750:b0:24d:34:b9e7 with SMTP id d9443c01a7336-25bae8f39c5mr81665195ad.29.1757695688481;
        Fri, 12 Sep 2025 09:48:08 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:c48c:3b10:7546:af9b? ([2620:10d:c090:500::4:ca20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a35b7e31sm5111359a12.11.2025.09.12.09.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:48:08 -0700 (PDT)
Message-ID: <b620881ec86c8074731c1ff414dbb7aa8bade3a5.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers
 chain based liveness
From: Eduard Zingerman <eddyz87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, daniel@iogearbox.net, 
	martin.lau@linux.dev, kernel-team@fb.com, yonghong.song@linux.dev
Date: Fri, 12 Sep 2025 09:48:06 -0700
In-Reply-To: <202509120205.YfzyI2gp-lkp@intel.com>
References: <202509120205.YfzyI2gp-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2025-09-12 at 11:17 +0300, Dan Carpenter wrote:
> Hi Eduard,
>=20
> kernel test robot noticed the following build warnings:
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/b=
pf-bpf_verifier_state-cleaned-flag-instead-of-REG_LIVE_DONE/20250911-090604
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20250911010437.2779173-10-eddyz8=
7%40gmail.com
> patch subject: [PATCH bpf-next v1 09/10] bpf: disable and remove register=
s chain based liveness
> config: arm-randconfig-r071-20250911 (https://download.01.org/0day-ci/arc=
hive/20250912/202509120205.YfzyI2gp-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2=
1857ae337e0892a5522b6e7337899caa61de2a6)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202509120205.YfzyI2gp-lkp@intel.com/
>=20
> smatch warnings:
> kernel/bpf/verifier.c:19305 is_state_visited() error: uninitialized symbo=
l 'err'.

Hi Dan,

Thank you for the report, kernel test robot already notified me here:
https://lore.kernel.org/bpf/20250911010437.2779173-1-eddyz87@gmail.com/T/#m=
103a269f4c096b34043bef16fa5f1d629b794968

Thanks,
Eduard

[...]
