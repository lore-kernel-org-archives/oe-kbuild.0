Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E3F1CCEF0;
	Wed, 19 Feb 2025 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958555; cv=none; b=jXTzg3xj8Mb4bODQdpd/6pEbjHphFV/03ArxEPV0vwtqR1hg/N2G44pEi+CYtNUeIVq/WbC7+6BEqPedgKaFn8peww8TThcFoQlnHgyZ4+o1bxkY6mKv4Eb1mFZt74Bg7oLjWf7aMiLekqdh7o/wNi/symu5QrEOT80SQbE9mq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958555; c=relaxed/simple;
	bh=IDdKOPjCrlEO+d9xrqCUMISosxj48iipqqT4b+hx/+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqJXxIn3DKwyDWCB5L0fTyWZhsebRgJkgKkI8Dof6JRcf1AtPHQy/KVbmeobwNOCRFOOFUsdwy9OL3JhIL/OUX6peq9Gx5j46pCVDCvuOxGEhcxZVEndUB3+9JQL5J+VoWg3DxxmlXoNtNAyxQ3RblDxy5CRXH8wA2Bn7Twb+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAZx5mCs; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAZx5mCs"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbdf897503so41864666b.0;
        Wed, 19 Feb 2025 01:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958552; x=1740563352; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38FDnIWBk/hMvvKZAZkdIWl6cijPdX14mYcohSV/aX0=;
        b=ZAZx5mCsZBrqo1rMRx/UtkRj0d5P4MoAaUvTKvzrk+v/bVSnDyxI35nsFQWfdgk+7q
         cwWmOe8MJAPXcv8dWwsXQSzOV3wTFtJU0xoANgPxdyRDFuAZo+kl7ikvsDdGkFO1gyuQ
         fB2phfCUJ63m2xFO/UfOdy5LXGMqAMY7w/amuPr78o8GnyVYiRUXX+65bj/co7xRIWdQ
         aIT9d49ZYiVLoOc7zauw78Ysi3EoG95xI4JHGtVV4BkrXrsuSi6CqsPLC0ThNX15pS//
         PTw17eCXmptyILPwwxCT0XRtU+7AMCa3UUbzAw39fmqr57PmUsOFYXElrZuPZtQgxeBM
         9ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958552; x=1740563352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38FDnIWBk/hMvvKZAZkdIWl6cijPdX14mYcohSV/aX0=;
        b=bAm0lDteq5tMVlN06AuFhcGQoGKE37chfgWF0jwB9tNUY5IZQgvzw+s+GcJ4EqeiAc
         bkkaOA+k4PWDjBXBCUAg0EjukPMMnMg+Jm/8mrGISitfWXA0Pa+wlyBjzYiO82CFHLWL
         +FskDLDjMtOdT7UbX0d/yxRXeu5PEx/w73TFtEUon4SPuv875rJ+CKsKMfKG4Dlbt1VK
         5VdDp8hol4zfmKsZrTjKOoQty2aCn5miTjS6DtLU8HE1L7nKfeQZKv/l5pGiSaiGBaoG
         nDkjB+itAUvxMZAi4nCSmYa4EdwSJXyqXsJryFmE9lsykpgNDEAsbz6dUM//cuumANXL
         2J2w==
X-Forwarded-Encrypted: i=1; AJvYcCUH4oZUv28S5kdhkk7qZh1MQXzBnH7XaClim3hSd+DHzIjwAd5QSzCKw/OJ1dVnUakSpDPQyxtR7ZZQuoq1@lists.linux.dev, AJvYcCVd7ySPi1QP0QHcNMuyZPOIL/dZgaGygQHWFCojjIsRyUIvSY3H6gW051YyrBu5fuqb54XPeU1BrUqZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyL2g8xH/0Z6eD1IdUssBADt6BucDklrUOVxGXuYj4nshkeocKp
	ybu70fVNsj8nKOCmWI7ZT1BDx4siV/AecSqT3cjL1BaPHonJAWUgMUscdg==
X-Gm-Gg: ASbGnctLYJcnLVixbYyjctC1TSk41iEWbAO4kCfnLL427kwSv2v2L08xH9DiJ7jSWUQ
	42C3F5ITro+66FlUIVQY11gy2G4P01cAl9In5a06/4oRiYn9cjcDnclcnQcTfDnffM2/C9kVCdt
	7yNXpLCsYJk/U72Aib7RDIMG+8DnAayJ/cB3Kcf15TYnvtCcz7rmr31mL/rQ2vG1YIIsmNeOX74
	CCcUrpa4Y2g5aitiYRQj0iqVXhnPmoytqJfmPa/AF9VXM27ofR+mle4G0yc56v9LsVLJwjsw0nS
	xmVUXTeGdofrxjzDz0tQ79fWRO3JPQq3ZS16a7ySE5dwNvsm
X-Google-Smtp-Source: AGHT+IGtNbC/AL8G7JwNITVBrH6AzXwe+c022KZdL3yHX+FgpnhCwb52Hpe3yeMpCZPU64H/OFWdvQ==
X-Received: by 2002:a17:906:99d6:b0:ab7:cf7c:f9ed with SMTP id a640c23a62f3a-abbcc7ef0a3mr263267566b.24.1739958551650;
        Wed, 19 Feb 2025 01:49:11 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:cfff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3624sm10318487a12.40.2025.02.19.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 01:49:09 -0800 (PST)
Message-ID: <e6f8ffd6-57f7-413c-9e45-8b68d3979278@gmail.com>
Date: Wed, 19 Feb 2025 09:50:15 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3999/4377] io_uring/zcrx.c:223
 io_register_zcrx_ifq() warn: missing unwind goto?
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, David Wei <dw@davidwei.uk>
References: <9123f4ac-233a-41df-b50e-9865e528bd60@stanley.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <9123f4ac-233a-41df-b50e-9865e528bd60@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 07:21, Dan Carpenter wrote:
> Hi Pavel,
...
> smatch warnings:
> io_uring/zcrx.c:223 io_register_zcrx_ifq() warn: missing unwind goto?
>  
> vim +223 io_uring/zcrx.c
...
> 035af94b39fd13 Pavel Begunkov 2025-02-14  215  	ret = -ENODEV;
> 035af94b39fd13 Pavel Begunkov 2025-02-14  216  	ifq->netdev = netdev_get_by_index(current->nsproxy->net_ns, reg.if_idx,
> 035af94b39fd13 Pavel Begunkov 2025-02-14  217  					  &ifq->netdev_tracker, GFP_KERNEL);
> 035af94b39fd13 Pavel Begunkov 2025-02-14  218  	if (!ifq->netdev)
> 035af94b39fd13 Pavel Begunkov 2025-02-14  219  		goto err;
> 035af94b39fd13 Pavel Begunkov 2025-02-14  220
> 035af94b39fd13 Pavel Begunkov 2025-02-14  221  	ifq->dev = ifq->netdev->dev.parent;
> 035af94b39fd13 Pavel Begunkov 2025-02-14  222  	if (!ifq->dev)
> 035af94b39fd13 Pavel Begunkov 2025-02-14 @223  		return -EOPNOTSUPP;
> 
> goto err;

Yes, you're right, thanks for letting us know!

-- 
Pavel Begunkov

