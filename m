Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9761E833A;
	Thu, 27 Feb 2025 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650857; cv=none; b=W26AGe1NNVIKNjHMyrweSrnJ32Ij6wqWCHrMCF5FDi3Izf9f4j4Fuwsve/+nmuw3RaI0x0K145yAPB6CYxMk7scMyUIfJ7T5bfhQsTbPFh1wkHF3KMOfi+raCSd3yCH9cGrIqKF5vHf1XniLP2DFrhFGwmlQaXRp/CUreMdjGMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650857; c=relaxed/simple;
	bh=25AivAUSvCEf3k06j1vCXgNr+g4zSoKIgNY4YItFLL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VpWYWcvOhyDBoZfOq+tGSmCt6uC9zuVBcTSqdZMH0xTbW/507UCtsaBvBtnOYP6HssgY6DJyYph8CsQC5y6Sxw6up8sYEV3BL6CQDxNc6BATRAgUDY8/bFnfcj/R6u1eIPP//mjAYuHt3MpMiwDNK9E+Qg3f6N02IodFLCKyUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2o2diJR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2o2diJR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5deb956aa5eso1030819a12.2;
        Thu, 27 Feb 2025 02:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740650854; x=1741255654; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+INPPkr+1+hyLnbOM4nFLYBv/yXQBwHtKoY78+S188=;
        b=l2o2diJRKkwb9EkhGvPE/zGNcP4bIueilvhHEjLCwD0QzLRkrcHGV0t2m5yXY+9hV9
         c2tTqBZUrzPbSWORfj9I4PtIXGyTx1Z+AgWUbmipoApoZfC5l0vYOysYPcHqU4WTgSOA
         OBxcsS82lZDCuBnZmg9Lo+qOYo0u542mtfYDFrFCFkTKIxoDsp0XZP5+cRx9mNtibuSA
         4MwmTkl+96b91NE0r09Jnl4ZFr0pjLhyIyR7oSa0GEtZoSNUj+9LlHOyWVxq7i+W1S32
         sRG7voQe0kJNs0MkCjKMkxXwh8dqbAhCF8Z1n+e/zL/nMHglfMxHIAum7yyJc/RurkTx
         N3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650854; x=1741255654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+INPPkr+1+hyLnbOM4nFLYBv/yXQBwHtKoY78+S188=;
        b=lex3ZH+10leWSgLEIzxoiZbfqFsZSIbue7xbBM3Mqls0sD3xeZ83A/kuSra6hsGA5f
         YK/U7jkyD8HBWKDsiEr/QqOYpXT/9BTdfj3aPZtQ9EzDgvV7B3UbPhZZp9o9fTk4Yvap
         +ykhSidGKGNVzq7BbJ6ehTa/cLI2mdNu1pGtziYkZ7swIW43s7Xg1QBCmG7ecO4anYRQ
         oLNl7omqsUPGXd3JLa8+d49y7zKpzMpGZEEvUBgftcCZfkdAvJXHLPya4eUTCU8nDQaQ
         ysjLTSY2p1jNXLAJDMtK7QO7HZvCe1rvi7jbsfEzxRh+0cni2VSkwlx+4Gl3JxORWAZh
         45cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1TLH7ou54YSB9hL/cpV3aPGUiWY9au16diQVAtvjaB/JmiX/+fi/HpSBey16gM9AMxgBZO4FNHpgL9hX6@lists.linux.dev, AJvYcCXQi/AY13QuaqOZKFtR8ZQD0kc4JkAESgipnneMowAr04NyFI9rYijWZeTaKqVSK3GUW0nOZmZ/urtt@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0mbMd5wxSQrHtBwzYYj2NqzXy0lRmp3hHKm1FaYQ7nePPwkbf
	iO9veTd+RAjellmjPcBY13nu2TjI1CCuuvjLSAcYvPbrmX5xxUjn
X-Gm-Gg: ASbGncvT6f0Hybvc4dW4yPHziUY41BrmwmMcOzjIn7Ta8mQpQhiAVNLaGjnusBCE17r
	6v8jV59ye+Htyfv8HBm3PZqQabvgzIGsJ5DIQJxbyDmtZ/vJA+WGtTk4oidEcDgIfRDaH9yyS6E
	mG1uka1TwN/BczmIgoRN1Z2U67MJgVn5TAbWu8noIgEN97XG/Kx19nh0A3h81L/wAGDkvNMdL5R
	sE2/pjRurM1DhK+vSpoTw/CUmwMbIFfDubdFDq2vcZ/ROYDB7NgwQxXsxezgnFmLxZbNu4jF26/
	hQBpRexJ7seGPTfB1aM+C8GG8GObIRtrFBU3xAwpInvQhbSVQWsmti90jG8=
X-Google-Smtp-Source: AGHT+IHsdnuMGZ2V0JQpivxQUHXap4MMXyopMhxfRmth4qJ9gT44KWMGtlLgkkeOVbtHCogz8bTdPQ==
X-Received: by 2002:a05:6402:50c8:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e44475f4d3mr27786390a12.3.1740650853870;
        Thu, 27 Feb 2025 02:07:33 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:4215])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7c0811sm97313366b.177.2025.02.27.02.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 02:07:32 -0800 (PST)
Message-ID: <56e35d8d-b102-430a-8c94-dbc14b8fb9ae@gmail.com>
Date: Thu, 27 Feb 2025 10:08:29 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.15/io_uring 43/57] io_uring/rw.c:299
 io_prep_rw() error: uninitialized symbol 'ret'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
References: <e14911d2-c648-4738-84e4-48af3fcfdd9c@stanley.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <e14911d2-c648-4738-84e4-48af3fcfdd9c@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/25 05:56, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
> head:   047fa0ba8f1bed6b1c5d88e31c4fd187de16dbc1
> commit: 61ed48b5fc63d1c6d9c3eb59ed2b46a2cbfc6039 [43/57] io_uring/rw: open code io_prep_rw_setup()
> config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271201.3Eaa0Ych-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202502271201.3Eaa0Ych-lkp@intel.com/
> 
> smatch warnings:
> io_uring/rw.c:299 io_prep_rw() error: uninitialized symbol 'ret'.

Thanks for letting know

-- 
Pavel Begunkov

