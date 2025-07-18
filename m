Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BB042A82;
	Fri, 18 Jul 2025 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828919; cv=none; b=hL0gJGah2pbBFAeWqtrPLTauknJ+yOpnED7hShyosgMmy664mVKALa1GNOGI6b9RIkeZoD5ct8KZJ1zz3GT/bqrZ20LgU3yhz2RSiC/SuEORm8ARxTePMpsQAKYusnnY2xMxcVA7I3ljLs61DLi+aPR09b8vdddNvTsJGO2Aw8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828919; c=relaxed/simple;
	bh=hRHAiBxFVfjY2lRKKd3/1EimYY/WbAsY5SdTbUgd83U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VN6Fms9N5cWUZ/M/zKGZ7Wd55BcZ72fjUJz1yaYOq4hoh0pKvyjCMWeCUf7t6O9Pr1Xyppx91/hCQrahlE6rUrXBsNqOALfE1DlXvng6DudNZ4E0Ty5x3BQu2eBtDwBS5h08Mls+xEI0d/wG5QP5kRUaKhEgMg8QHgnMZRIszy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8KI+9YP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8KI+9YP"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so3634039a12.0;
        Fri, 18 Jul 2025 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752828916; x=1753433716; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cl6NW/VJbC89Zuqkuhe+2EODRlo26sbOTMU5y4bZLUg=;
        b=L8KI+9YPZsmvUjyp1FDqsI+4V7+v+EvAGtOpDuLDUWDMnnPU13aOPc+cX3GuscQMJ0
         sXl6H+Ul+tjC7d+p5bPGKFPT2W9lcn32C1hae5eVQChVjtC2YVvMuIDa+7UXfzxYQ3CU
         rG+ydHnRrXH/Bg6yHxAqeut5IVZ2iJgWjtAFub0JOGVjdKdV0AwBy1Rk0IshbkPY01rT
         /WNFKtgyUT/O/fPueKuYViET+ERDt6pMEtuL2EtPleCGLne6EzBdNIvPxWEhmKPAkFqE
         pJXfeQbXUNUSkymJaNcNikO3YITtIAdDjrmfgnIyenzncCPcaorueIcTjEBCzOfNHV4F
         ERJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828916; x=1753433716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cl6NW/VJbC89Zuqkuhe+2EODRlo26sbOTMU5y4bZLUg=;
        b=GNhi742cQbV6UQ3oFSNoSypf4hA1IWt5zXL75Vh4+gq4Ao1C0pu3+Vf88rMZ3hhkvt
         1qlyBRCF2EbC0rwsPsVa0KJwUaT8B7r5+DxdOkYIXKARiMCrn8aLL3a+BbWb4+hwjuGv
         gFukmZcK2Y6rZRM8ydRAUvNk5P8nmrO+3+dk9FIHU6ZERm13D77H1gjGoOnRIVi0yxsh
         AD7V/pA3q7PLAK9a8VgUCyuQ4pplgxy1+/+S9sG9H8jtBPqMOPoeUhdtzv2yzbG0oRAB
         Gc2vUTfbPnqH2E8fhUhjRCD3iCZ9R6GwiyTAhn2LOUZtDTtx8WtEV2dCKAfTFgvQifX+
         FWzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCOePRT2M5iUH901PdWPxhEtep8cnJZkDmft0O9uzSSDkVAt8teL/FipPxyEipOun9MlrW1Ov5Is0T@lists.linux.dev, AJvYcCWz40AhVNbz8sNaHDodiDgtaLII3gYsgmPrWgr4EEHWhzipRHmZ5Zqi6l5wM1d86Q9Ih+UF84EaXOHYN1an@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+cvoH9Y13UOoVwflkxlXU76GxQEP7R1KBg4P099Pd70sMOvU1
	Gwz9zXKizz+z+b8kkOASOf2tEB/7vcZwRftSO6BB91f96excU4P6rvuA
X-Gm-Gg: ASbGncvIieKhaSOZa/70hKGxnPLuvPDymdV5ku4hOV3LEf/0D3o4Fr8mwcm+f/gjTVr
	OIaCya0WzqBDcq5x9HM0MoqtB0e+JeV1TNa9PCkrWniR6XY2xA3JGPeU0bUGc7uXFdZqXydaIGP
	Ex4uvGsNeZI7ehRDICkpo1hSAhe3a3LSyZ17fjhc8k7x7KmNeMgPuAv54bw8/lDkPuzb1RWHsrw
	1a5nt10vUNJmkV3V6Rcd/ZKq2/ONmhChXxGk8FMhiBG+mnF0ISG+TsGeYQKyElG3dx+kx7GqDbw
	frjlc2VDRfZcqszMw0oB0evFqVzqq7IrskwCDaOAkmXOt70V/HveS2YfPpyyH5iHNYH2Nvi/sjs
	sgLn/yC03bfC1wYX04HIyPE9tPHP08DAG5dI=
X-Google-Smtp-Source: AGHT+IFccn/g7YGP4lzEqqBF0FQG0n0gBYALfhzXamFtdTD80h8ih8zn0mKSg81ifNO9n8Vb90qblA==
X-Received: by 2002:a17:907:971b:b0:aec:4cb3:d10b with SMTP id a640c23a62f3a-aec4cb3ea6fmr570511766b.43.1752828915604;
        Fri, 18 Jul 2025 01:55:15 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1ac? ([2620:10d:c092:600::1:6915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d7b9csm82332966b.61.2025.07.18.01.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:55:14 -0700 (PDT)
Message-ID: <54d5026a-3563-4b49-9395-0c8ee3d71e18@gmail.com>
Date: Fri, 18 Jul 2025 09:56:45 +0100
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
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <f07001e5-021c-4695-8116-07b1a71665fb@suswa.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <f07001e5-021c-4695-8116-07b1a71665fb@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/25 02:56, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> commit: 262ab205180d2ba3ab6110899a4dbe439c51dfaa [10555/10823] io_uring/zcrx: account area memory
> config: x86_64-randconfig-161-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180628.gBxrOgqr-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202507180628.gBxrOgqr-lkp@intel.com/
> 
> smatch warnings:
> io_uring/zcrx.c:385 io_zcrx_free_area() error: we previously assumed 'area->ifq' could be null (see line 380)
> 
> vim +385 io_uring/zcrx.c
> 
> cf96310c5f9a0d David Wei      2025-02-14  378  static void io_zcrx_free_area(struct io_zcrx_area *area)
> cf96310c5f9a0d David Wei      2025-02-14  379  {
> 0ec33c81d9c734 Pavel Begunkov 2025-05-27 @380  	if (area->ifq)
>                                                      ^^^^^^^^^
> This line assumes that area->ifq can be NULL
> 
> db070446f5af8c Pavel Begunkov 2025-02-14  381  		io_zcrx_unmap_area(area->ifq, area);
> 782dfa329ac9d1 Pavel Begunkov 2025-05-01  382  	io_release_area_mem(&area->mem);
> db070446f5af8c Pavel Begunkov 2025-02-14  383
> 262ab205180d2b Pavel Begunkov 2025-07-16  384  	if (area->mem.account_pages)
> 262ab205180d2b Pavel Begunkov 2025-07-16 @385  		io_unaccount_mem(area->ifq->ctx, area->mem.account_pages);
>                                                                           ^^^^^^^^^^^
> But here it's dereferenced without checking

That's fine, the "if (account_pages)" above protects it. Nevertheless,
can be improved a bit.

-- 
Pavel Begunkov

