Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7891B215F42;
	Fri, 18 Jul 2025 17:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752860921; cv=none; b=LPJEcGTfTC0Od8uThkwBM0cW2XEZdGA4/gKUQgEPslbwA0vFSHWQuYYx92/FAwcD5NT1+KOWu66qmdQYbKCJsGxGA0UF/9DSFsD1BxUlBuFz3DvEGk1qE6BtANrIXSlIYouxDG7ORIVAlpd2cDBM/DFyyisxXTPuCSk+9L27yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752860921; c=relaxed/simple;
	bh=v8T5FRW9a5xWeorlEEbTsdAktZOw8gv58Y8173uidTs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qWuhYek3o2Zt1osCEyZqUlCjdJdBVyQYEhfjQJw+eFoYXiy282uu71Bw7mToh9LytDZKqzVtMxdWqjmGRosSZXgGfhF+hIzhTVcjHTano9WzgVr5LHoYB+oxjc3TTVsWQKwTelw3CdS1xEMU8gWCh/8eARNq4wZFWQz+dEOVfBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMn+id/V; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMn+id/V"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so3539546a12.1;
        Fri, 18 Jul 2025 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752860918; x=1753465718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQsinGGb0R8L8jJTwwJcnr/G5uqejjnQRvAkIBc3hoI=;
        b=bMn+id/VuyAHY7a+dRKrFfSPGPJr3Ch4iuFfSJ9saEKKcSI85xbXp1jvSgABk2VBWJ
         bjIG7A1kYwirR+nH7CjQq6ZysLtemL/JW+BU9hX940tfUxQYFbw6fIPhHq/RosJONthV
         UDtBcaZE2M3fDkH+JgrqoTKkcFYKtQx7ZwdTaUFWAcgJ9PjBW5WqDiRimrDGwZvso7N8
         R6PNM5ictmpSS8IWWQsEQYezn8cpUjQdIQHeQt7PcHicxDTXeXN8HxlFm+oFBmSp+yRe
         6EyMiClOQtDBWSWDS7VtrS4CAutXgSFc2dJ9o4f+eSdgzRgolwpp3MC+3gqtfGohr/KX
         OFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752860918; x=1753465718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQsinGGb0R8L8jJTwwJcnr/G5uqejjnQRvAkIBc3hoI=;
        b=vR+/ChOVeyphc2x718RC9N2tj/Rz9Rtyo+ieNnopBJN+zbIJkVzooxkRQv8fEwoBLG
         +L5mSMNW0GuiF5dqZWUeaGQlSTyJBwUEgM/QcXAtq2LHL1Zr1MtqEurf5yW47Rp2jJhP
         iWZkKrRhmDbsUqPlBHpCjDwfcqjCJzkOQZzP4SMHk/U4VNQaM8J8Rop6C3wTKaso4MAg
         nzjFMkdWbyOqwKjlh2DmNeY4ykeEYjmivxXH3PjJcLFmy0M8KwqkHRFTS7qV9L3Rtx9S
         QLySfH658nXqTG8wX4NMue5zW9k24RmeKracUitSqpRUJeXoB7qgYHS5Eqb1c97qWDZQ
         p9rw==
X-Forwarded-Encrypted: i=1; AJvYcCVSTunG/kOEKVTJVAB9WkejPjA8bHJJL9DJ0I5YTcfCS59Ie6nqbPJVZ85vsKmxZTbWqjL32mE4y3P55WpV@lists.linux.dev, AJvYcCVbGyC50lOpSV9Si0cXLdoGgjWLOb4XfC/iXxOSD/yANvaPLDcks+1fbqAFmlKGBOnBpIvXYHmbJlnD@lists.linux.dev
X-Gm-Message-State: AOJu0YwUpmxJWLKrLGFLEJfa6FhrpjHw3DJMHYD/rbaoKUI4Il15jHXO
	osDCiGOxCU3Y2sOuR/NTThpgMUHl0ywAeILFtsyqkRyknvqBd4eAHffu
X-Gm-Gg: ASbGncufSUlO8RAr4MvcJ/hjcJt5QEMwly6CjzY10qzN1OOdAVENpvW3+NH68Ws3w/w
	yTFgpMyutipXL84Zvz1OqYDCo9I0dgAIVYHYO/Kh0QIxi4bgqkagFo8Bo4bOvlPtl69bSpHpnin
	ByLodMMRfByGlRCjI8FvC+6xsIheMngWmyE1QRHUCaspnnsylV25tsRnyzo0xjJx1G9udfSF1p/
	ewt2A0GJhqakCj07xMdT4K0o+NKT3azz+KMPuQZl7drfvu0veRAMqAAFYJoAW7Q0oTFvzbBJPGG
	DrvbCMak1vzJueTNd6ml7CnjctqCPtBx/mtr6Wrysk8ZNO8lgLgH/l0Qq+SSoqH1HUxeElCvbP4
	ft/4b7FctArRInqRAcS29EZkHuiktOsnj
X-Google-Smtp-Source: AGHT+IEdM6+onEmsU7XdOhEVtfxGMk4LyeudtD8g5JVVTPTxNh44h7uxUcCQajOPjyfxtKx3jQfoqQ==
X-Received: by 2002:a17:907:3e9f:b0:ae3:a812:a780 with SMTP id a640c23a62f3a-ae9c9ba7b98mr1109642166b.61.1752860917506;
        Fri, 18 Jul 2025 10:48:37 -0700 (PDT)
Received: from [192.168.8.100] ([148.252.141.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d469fsm157859666b.55.2025.07.18.10.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:48:36 -0700 (PDT)
Message-ID: <c269f7e1-25fc-47dc-82a5-ec331f8b7961@gmail.com>
Date: Fri, 18 Jul 2025 18:50:05 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 10555/10823] io_uring/zcrx.c:385
 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null
 (see line 380)
From: Pavel Begunkov <asml.silence@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <f07001e5-021c-4695-8116-07b1a71665fb@suswa.mountain>
 <54d5026a-3563-4b49-9395-0c8ee3d71e18@gmail.com>
Content-Language: en-US
In-Reply-To: <54d5026a-3563-4b49-9395-0c8ee3d71e18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/18/25 09:56, Pavel Begunkov wrote:
> On 7/18/25 02:56, Dan Carpenter wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
>> commit: 262ab205180d2ba3ab6110899a4dbe439c51dfaa [10555/10823] io_uring/zcrx: account area memory
>> config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180628.gBxrOgqr-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202507180628.gBxrOgqr-lkp@intel.com/
>>
>> smatch warnings:
>> io_uring/zcrx.c:385 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null (see line 380)
>>
>> vim +385 io_uring/zcrx.c
>>
>> cf96310c5f9a0d David Wei      2025-02-14  378  static void io_zcrx_free_area(struct io_zcrx_area *area)
>> cf96310c5f9a0d David Wei      2025-02-14  379  {
>> 0ec33c81d9c734 Pavel Begunkov 2025-05-27 @380      if (area->ifq)
>>                                                      ^^^^^^^^^
>> This line assumes that area->ifq can be NULL
>>
>> db070446f5af8c Pavel Begunkov 2025-02-14  381          io_zcrx_unmap_area(area->ifq, area);
>> 782dfa329ac9d1 Pavel Begunkov 2025-05-01  382      io_release_area_mem(&area->mem);
>> db070446f5af8c Pavel Begunkov 2025-02-14  383
>> 262ab205180d2b Pavel Begunkov 2025-07-16  384      if (area->mem.account_pages)
>> 262ab205180d2b Pavel Begunkov 2025-07-16 @385          io_unaccount_mem(area->ifq->ctx, area->mem.account_pages);
>>                                                                           ^^^^^^^^^^^
>> But here it's dereferenced without checking
> 
> That's fine, the "if (account_pages)" above protects it. Nevertheless,
> can be improved a bit.

Taking another look, it's actually not fine. Thanks for the report,
I'll patch it up.

-- 
Pavel Begunkov

