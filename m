Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80FA34A78E
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 10:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769163516; cv=none; b=NxW3aL8AjXQxjMKyucswAobj2jofCfLokzqc1d0H+ROfiwv6tq0rSgucX7CotANi7LEutHHADcI6VVPTGWd/UHmOfEgI0LN1i99Ji2JdVt24DJP8Jv5st/tpzV7lW+2y73s+7P76oYP+t4inyf+OdZBW1UMgcMkoT8lwnW84m4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769163516; c=relaxed/simple;
	bh=U2r65y0/QOYBLtjuWr/ClQtfCRil8+sfT9hgRvIR8fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADUFcTbfF5nR9mRQ744RAuiejqMxzk/r0f02tFladTK4u/kzPtBUEMU/CJ3jeWNtgNgBxw0fvbMDM6xhTQbN9S0FyC+YAQzO/H3zvDbFYgfobbiW9E6NL/ETK2XpEed9iKd9ftst2JX6q+d2ycIwZ96558yMThSwX6eO6+OOfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJAcBit5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJAcBit5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801bc328easo23186725e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 02:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769163513; x=1769768313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dgi6FhsphtkTCHE826+RbFMGVK96GRZAG4Z7WF56k5w=;
        b=UJAcBit5IPQ3QqYRKSOnLptSIDKG2ZVH6KnRpgyzCiAhhcsy6r8RScR5a5MtQblvOA
         HQfSJRizbNLFY3Sw0ALGoiFvV7gXSDUvi8O+DKhVrEHAxLElqNkKvKJE/u5jwWVcxgL/
         GdX/WRnUIEZQPqRVH0zciYpcRarODHy4JzrfnxhzqAIcAIkYEfof7bh073HQ4xLilNN+
         MXP/Robd+aETw+E4E1nr74YRjK+90falTDfEgYfWHj32TfmqsKzYctcx2O7IQbTA++mn
         83HIcYS+vsR70uXAemRRSxFN+PNOGQtwGHsNVqzMuwUv1fLILQ+NtmeeAR2X6XIIfX4C
         MeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769163513; x=1769768313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dgi6FhsphtkTCHE826+RbFMGVK96GRZAG4Z7WF56k5w=;
        b=VvmrVPa741hU047X5E1AgI/o9xRk86fRrL86DeX2LxVsHZhYjUaSb8mMibpsrO0wzR
         rCGxk9BD/zjciW9/aoFj5UWeGrzrgv8R/wSVNGSLaW5DMZl/itQuX3TanXSQ2pObSrVI
         BjiE7XP9Jp3dFSyqqLrW9fPS6NVchg9iwR4Yf6h1E1R8QL+Myj31qU1Kvd+7MImPxnXQ
         m+O2H65rceGDbeJtBHeHQAb+LmX16jWbYHBiuJFq+dGBX97CDg2swTVanSdpT7QgSv6U
         f9jbub4YwQCzEg2sTkduP8MyJpIspEKvYFmfT1hzGmJrYjvemJN8Tht2WX6B0Z1MUsMn
         8hvA==
X-Forwarded-Encrypted: i=1; AJvYcCWP38Fj4qpHBC4Eoqo38HbTqzn/hIdoTj8G/Dt7dstLmM8nx47UF3DNf2fTbjpLwAg7kGp5jsJtQow=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGgF1P/xYpUyaQLynyQorgMYASnyORLQ6zFEE4Z466TolVHerj
	BjnrHAMG38Wp/4Pd/AYJNJy5Ak17NxEJGomk5b/EXEtRjeHHpLWLTypc
X-Gm-Gg: AZuq6aKIeqbUbproM1cl2THr5BmftLWVznTgwL05PLx88344b29TunF/kpNcxCV1SJu
	VuO0P42K3w3/bD2bMavPd1U26F0UUKgOeipOdlRHUqoTbtDJKj42fRUwR6zUpIxSKd1eG8xs0u2
	U4r2B4BgKYsx8+tromy930TdVXAEx6dm0kA8FeiY6RAr1yOW35ClRCSXvZABe3/zkfLnEH44q1T
	EgdWX6T9fBy1gYQgh/gGhU6CDOfpTiEjyOkMOpc1qeLLDhUMFols+8ObU2nbKd7771Fo4CshEbu
	mYXVl67YjSiMhWz/NS2781KDQwcShhOuW83qbySMt5PrtevY7Q4JNqexMrE+bywdFTsM7KQtBOG
	BIHVZ7RtSNoQ73mRrKMasJqpMxFr/Yq42UDuLn256NTCsefks4t3JpCqI2ZD1dR+uYBy81L1RVA
	7otcmgvrp2FlPx2y7193jZ1+a+ApiZlWCAq7h6s2bj8cgy76TtsAJs9eQOOuTmVZALnvB8upzd0
	pQ+HeJFi9eQmAXIk8G81Bj3wLjW5hR3qY1zC9AhHyG0z2biLEQimveq3Q==
X-Received: by 2002:a05:600c:a08e:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-4804c9b1fa2mr36941905e9.21.1769163512725;
        Fri, 23 Jan 2026 02:18:32 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:b9f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd8696sm17481235e9.8.2026.01.23.02.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 02:18:32 -0800 (PST)
Message-ID: <a59bc8fb-6fb1-4efd-b545-010459f7e5db@gmail.com>
Date: Fri, 23 Jan 2026 10:18:29 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:for-7.0/io_uring 20/21] io_uring/io_uring.c:2741
 io_uring_sanitise_params() warn: if statement not indented
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <202601231651.HeTmPS8C-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202601231651.HeTmPS8C-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 09:03, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/io_uring
> head:   82dadc8a494758093e775336390cb31033c6f9a3
> commit: 5247c034a67f5a93cc1faa15e9867eec5b22f38a [20/21] io_uring: introduce non-circular SQ
> config: alpha-randconfig-r071-20260123 (https://download.01.org/0day-ci/archive/20260123/202601231651.HeTmPS8C-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601231651.HeTmPS8C-lkp@intel.com/
> 
> smatch warnings:
> io_uring/io_uring.c:2741 io_uring_sanitise_params() warn: if statement not indented
> 
> vim +2741 io_uring/io_uring.c
> 
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2733  static int io_uring_sanitise_params(struct io_uring_params *p)
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2734  {
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2735  	unsigned flags = p->flags;
> 92a3bac9a57c39 io_uring/io_uring.c Pavel Begunkov 2025-01-31  2736
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2737  	if (flags & ~IORING_SETUP_FLAGS)
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2738  		return -EINVAL;
> 712fbe97c3322c io_uring/io_uring.c Pavel Begunkov 2025-11-10  2739
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2740  	if (flags & IORING_SETUP_SQ_REWIND) {
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20 @2741  		if ((flags & IORING_SETUP_SQPOLL) ||
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2742  		    !(flags & IORING_SETUP_NO_SQARRAY))
> 5247c034a67f5a io_uring/io_uring.c Pavel Begunkov 2026-01-20  2743  		return -EINVAL;
> 
> Something missing here?

Just botched indention. Thanks for taking a look

-- 
Pavel Begunkov

