Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B117C224;
	Mon, 21 Oct 2024 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526468; cv=none; b=ApDA/e17xZXDpoYdSu90n2rnqr5h3NXxY5xrRiQQiFrIJlAxoPd611DLaYbig6kUflGznsP0vaN6mkjyB0ORqOn8M/JeWCVCjj6LTNQnKQIQwmSyTvYktFgAZu4JbgbizHitTv/JGqlmjmVWiyl77EKETcH71JQ7VqVnXvu7oio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526468; c=relaxed/simple;
	bh=4PF6mwsDUUo9SFNfiAjBIgF4MXplmny0kcl+FaetC6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZR0/uWIiNjTOCrcjIlf+XUI1eUEraYUVCG9CVkN1YKNLzWVk6oafUAOe/NDdDrjh1VvPd+rGHULCCZCumQxph7A1y/GAigefhAp3ovCaruRD3xv3LBVe1gKULPPMRs6wcUjsQ4ZbYvvUpNrZmsqhjO5pq1YeyxRFwDIQ1ZGbq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVxqbDL2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVxqbDL2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4fd00574so3222391f8f.0;
        Mon, 21 Oct 2024 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729526465; x=1730131265; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQTOWbPoy+MKgirbFxcxTIi4Kd0ioSbhFONSqxxabM4=;
        b=SVxqbDL2Wf8US40MeDOc/ikLv4i60VATT55LRbuhxgHqLzk0xJxT+qTeWWs8hLaSTd
         dElVmB8kWKS/gJXM1Jti3U+zj1aBNTysVEi7VQRHgG37y+OmZ31aKCIvGl44RsFwCfM0
         UtAbsx1C59nWN/YjEGgb+oP56GHCfRJJPnebagdlMv6UVEGjTkl2EDz/2BSgiXWDEqIo
         hj/4/GIzY1eLEp48mP3f2wT+ShUj1Pk5UgsZn3zMpPjrXGpJqShU+9mE4Rj7BizTPiny
         9RDsRbSi/KpLbEU8kSHQuC+N1L2fRuv8h/9sYhom/extkGQ6R6BbK4ZSjJS2hvaVxE1y
         C1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729526465; x=1730131265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQTOWbPoy+MKgirbFxcxTIi4Kd0ioSbhFONSqxxabM4=;
        b=n7GWKKDdjyv33rzerwTzeMIs73P/7Bv4qK8QBN2Dcq7jiLf5rlE/kmqN+msNyeuc32
         /DPZ9ZqP4WTt6ml2Erewev7eKaxzTGRjdPYfF+BTA4HvHI8oq08ddff10DT5lcKIT8KP
         w3lo4cQWuP/6Mc0mB47mxgiQchBteIYuBme6NophsVDtTtEfZOBeaE31Z0kT2eHXIbZz
         Qr3pQXMT1krn1MqCnCtsE0N8pEoWKZayWvcO7vEyXog5f0VVnQtAKU2jiouBqJ2/aHfi
         t/0ohL6ynVwW13dcCmr/49nj6wfHMEq7YVa3KxXATmQwZgcMCQ5/teV+EEcLj8RBCiqH
         bKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+naUW2uBobpWH5MR311bT0XHappo5gtW5ha6mS2EvAHCTI6wGdl/UXc+j4ylq3/EG4LaoID3eXt/8tawl@lists.linux.dev, AJvYcCW3OAbp7ihk+O9hsJL0rc/oCZitM5HREf2AgmSCeBC7EXllao39DJriOP+RNBkgsDtYWUThbg+TRQau@lists.linux.dev
X-Gm-Message-State: AOJu0Yx33UdpbhzELFbqdJ9z/ztHkewwk6fTR1TATgVu7nZ6IJH5gtJu
	7/Kvksvwha31SUOsnDBQTH80Eo4BgqevHvvDFdjKHcv5lgWT2O6b
X-Google-Smtp-Source: AGHT+IFVnIUXNAdtBd7e6AGSzRgW96LCfwCR9ZC/ML2/fLTcD09hDfNftfM9tPyf337OILkmUXBZeg==
X-Received: by 2002:adf:fd85:0:b0:374:bf6b:1021 with SMTP id ffacd0b85a97d-37ef150098amr53550f8f.27.1729526464817;
        Mon, 21 Oct 2024 09:01:04 -0700 (PDT)
Received: from [192.168.42.158] ([185.69.144.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58ae9bsm61171955e9.21.2024.10.21.09.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 09:01:04 -0700 (PDT)
Message-ID: <d8f84697-56b9-412d-9387-b8b480abae48@gmail.com>
Date: Mon, 21 Oct 2024 17:01:49 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zcrx/next 12/19] io_uring/zcrx.c:411 io_pp_zc_init()
 warn: variable dereferenced before check 'ifq' (see line 408)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <540d5e5f-5251-4ba4-b5e9-2c11420a0b8e@stanley.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <540d5e5f-5251-4ba4-b5e9-2c11420a0b8e@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/24 08:58, Dan Carpenter wrote:
> tree:   https://github.com/isilence/linux zcrx/next
> head:   2ddeede97bba995798be3e7a1ae9ac3340bec129
> commit: bcb187b21fdb59e9ddaaf2a179a5e2044336e198 [12/19] io_uring/zcrx: implement zerocopy receive pp memory provider
> config: x86_64-randconfig-161-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210918.7CYUHUaU-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410210918.7CYUHUaU-lkp@intel.com/
> 
> smatch warnings:
> io_uring/zcrx.c:411 io_pp_zc_init() warn: variable dereferenced before check 'ifq' (see line 408)
> 
> vim +/ifq +411 io_uring/zcrx.c
> 
> bcb187b21fdb59 Pavel Begunkov 2023-12-08  405  static int io_pp_zc_init(struct page_pool *pp)
> bcb187b21fdb59 Pavel Begunkov 2023-12-08  406  {
> bcb187b21fdb59 Pavel Begunkov 2023-12-08  407  	struct io_zcrx_ifq *ifq = pp->mp_priv;
> bcb187b21fdb59 Pavel Begunkov 2023-12-08 @408  	struct io_zcrx_area *area = ifq->area;
>                                                                              ^^^^^^^^^
> Dereferenced
> 
> bcb187b21fdb59 Pavel Begunkov 2023-12-08  409  	int ret;
> bcb187b21fdb59 Pavel Begunkov 2023-12-08  410
> bcb187b21fdb59 Pavel Begunkov 2023-12-08 @411  	if (!ifq)
>                                                      ^^^^
> Checked too late

True, thanks for letting know. This check is not needed, I can
just kill it.

-- 
Pavel Begunkov
