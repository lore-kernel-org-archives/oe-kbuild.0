Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A8D70CDE
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431331; cv=none; b=LiCGkMGge4fWlfKg/DEgjztJJsi4nV4mpuOAOczy4kNu5HlT9CL9ls7Q6TyleApKDZx4vh78K6/Kenv12WZFiF15R2ezHzgs5KW87+TvXm32LuYrl69GSfWcp39Mg0h8A47zM1JkVpBhnmoFfeU3oOi+0o28HH6oFCBX8tjZma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431331; c=relaxed/simple;
	bh=Dk/9HlllThqIzDIeiK/1eoemfr6ZXqHuG7o93nOIV08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOQiWLLydyEQ00lqiXtV+AyTEjRz0CmILX5mi94ftoWUJTFuTGypsCbJocggJraM+dBkrlWnSTY0oi4dsMY5cRMv4emOPBxlYgm9VgChMBeISnEE8D0TgaFmm2PKmBe3cL8DehoDrGCsFBA4fsOtqEps0wL75Xdj7J57Lz41GiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=p5sBZM2W; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="p5sBZM2W"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-366427fa029so1691065ab.0
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1710431329; x=1711036129; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rOjSZjzJYxeE4LWdxcDuKO6Le2r7zWZAB4RLLIoIWqU=;
        b=p5sBZM2WBqBLJxlPc6cbfAAfM6/hykBaoCwBDSIO3gNaYPnP0q8SVLOLMSOIl5Kkgy
         07IDP/y6Q1lm5BWmeBSA1ALuXkydtLwhJIn0KDSivLVdcBnGkzOPgSGbC4lBJX2KSnXk
         CoQtb11wN4PwWrmJyFwgrR2OLdF8V8RqyDRqreJfaYQ1emOsl62v1Fdt3uvM2frWKrF1
         EU0KDoRWo4UdTkUDZYnrMx4e4R+JSpnQOiOBQzKORNjrKotGr+4uBcJci4Q57IzPYPog
         R57sdpcRmB1qBKeTAsGco9mg3cvVBD5WrkbPyIyMpN3IsfS1lR0SFbc7eFUo5IxkMdYI
         qwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431329; x=1711036129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOjSZjzJYxeE4LWdxcDuKO6Le2r7zWZAB4RLLIoIWqU=;
        b=h3M7uCdm16DIClEy9amGwpIxeSleykBKIFFvqGQQuIfetcYk3ETLpLym3saj+D1b0S
         kbMCz83Z7XVqRHKJeVDQrq2hBYoMBXYYRoacFIKw+PbPo/V9OZv9hRYuX9i+VxaFr9JD
         U3LZoqp+gzRT8Bm/Lj6U9M2Vkn9hmHgBWi9CexIWGCCsWhya/YQFzGohFixCi6ZN1Vdy
         IHOgcEfRTe27HOCcHwNw//WeV1yvY+JxGOua1ZsYDkJQuQ6dCliiKDbDjTQhZ9pfVj3y
         ihkaD0SB/8oYSebg0LGbC92G93S7LAyuQ5Yqa498EAkE1LjAYNFkOEmIhW/o86EOZ+ow
         5r4w==
X-Forwarded-Encrypted: i=1; AJvYcCVmNheNUp1fAnapMAFtZUY7dz3YOtea4lKvCIrI7fsgJJYR2cHbLZiAyDGFfuu8m/Qadxi5WaLHMYtoBOjA7DIDEqBzTKETGqJu
X-Gm-Message-State: AOJu0YxWqRm6cgvMkb8ko4el2VwkOrZUZuSU4Q8mbhAoFW766lqw592c
	qENKIbO/P4kVp64IZ83TGNOwXGB44GjOWSkmaegNovZUq4teFXVxCJqlzLYnb+I=
X-Google-Smtp-Source: AGHT+IFTp9jv4vqR8aLIkKpbRnmB0wJ5sCR6UpoSsag9C6xkmK4gOPYTJXJ3h8G/2Ezu6CaZ6BjTdQ==
X-Received: by 2002:a92:de0f:0:b0:366:8c5d:95e6 with SMTP id x15-20020a92de0f000000b003668c5d95e6mr218849ilm.0.1710431328912;
        Thu, 14 Mar 2024 08:48:48 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id g14-20020a056e02130e00b003639d3e5afdsm207892ilr.10.2024.03.14.08.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:48:48 -0700 (PDT)
Message-ID: <423c51f8-e571-445e-8c02-4b9d9a29dbd3@kernel.dk>
Date: Thu, 14 Mar 2024 09:48:47 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:io_uring-recvsend-bundle 16/16]
 io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or
 valid
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <ce235fec-0ad9-4d13-a92d-3bba53847793@moroto.mountain>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ce235fec-0ad9-4d13-a92d-3bba53847793@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/24 9:46 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
> head:   57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45
> commit: 57fd6bfcfb482b2e57219118e3a9a2c0c95b0f45 [16/16] io_uring: alloc ring memory as a compound page, if possible
> config: i386-randconfig-141-20240314 (https://download.01.org/0day-ci/archive/20240314/202403142336.zEgQS4hl-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403142336.zEgQS4hl-lkp@intel.com/
> 
> New smatch warnings:
> io_uring/io_uring.c:2878 io_mem_alloc() warn: 'ret' is an error pointer or valid

Thanks, but this is just a hacky series - and I did spot this one and
fixed it already!

-- 
Jens Axboe

