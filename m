Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1041D1F4B;
	Fri,  2 Aug 2024 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722599996; cv=none; b=FCeLtd6Hvc+6yedB5vtUw47TL33QPrE228meROf9FGSAp5yL7e+3ryO2NRw0cEd7aEg6rjEzDQQtHoeBazlmYqU5h3AdlKh97WnguZjbi5HxgXC3O3MNhoFLxLmBqgWBEV5e+GBpOVmIBHlC8jVq0FHO5XyaKUwRb91w1Vxl6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722599996; c=relaxed/simple;
	bh=C5mwRpitlorxNv2ldLVzYOjmeynEb2Fmz19iATKAZxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4uDEpTUa2ZlA5feOZ8gAeApKAtnX6kEdKxkFbwN2doBJM6z0QOEePbF2pzNWd3uPtWV+SMlNUExD8cAj2kIZsjtuiXRCL77w0gOEx5zBEtCH1yCyq+4sC3SkVgrzpXnQY6hMdj/GDtRN37D5ss+xUSWtqkQDyYWddgSVSageSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EETUlG/6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EETUlG/6"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52f025bc147so11284755e87.3;
        Fri, 02 Aug 2024 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722599993; x=1723204793; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buAb0wO3Wh4GZPQM6ht7ZGQGYSJfAaXg0eHEDMv2nhk=;
        b=EETUlG/6BEeZZQnRySWu94waYs+/VyL62nrjfbcdN/iVspoUmhFNcRTI/r3r22lWMW
         JaDBF8jSOID7FqRrIL35PI0tICLLZXqVUmBxGTUiLXXlLsWzbF9G1dlEKGz/Gt+K8rq6
         /OVBUBxxOfcKaWYPddJxIcry6sfRIBVzVcNP3qlLbMo3HZmHZGdNrDyJk5wsbM+SQvBE
         MDEtV+z7T0L63u86Kw2OCRLYCXaleeBksWYoaVYK6z0iJYUYqv9DB9zI4etEnZD2dcon
         vsewZyt0eNr+H8DgXxjlQkFDxucb+HNo1TWZoEDcG3PMSrTHxXNLbv1y6vEE6mJCzDPE
         x36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722599993; x=1723204793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buAb0wO3Wh4GZPQM6ht7ZGQGYSJfAaXg0eHEDMv2nhk=;
        b=SE6uiotZe25g3keMc7W+bp64rCvHlBWWdrqbgTSR2jnZaSB7YeeMXzVmnYcLSAnSt0
         ScF/kEJwKMjTP9fAWvGBfMDTDx6l21+GkY4QzVfKYkh9wSxugGb5vTnCWjKPwGFyM8Wb
         6mO/FykkuI9SFfA8as4udMQ2fFr8vtQgElbQ9F+kenj6vjfDPMKPRVrlt0fOosFO9RKL
         R08hCfX8QoA7G/6pC29ber15QutT9eLXkuy/ZwbJosmlrJNFI5ZM4jNMMioMUjKKHD1L
         8Fl7HLpRIcCW/eRbOqM0U2DFFjo3y2tD7pKwMSbEj8jfXmBPv5UZYNJf3IUfoImlqZHG
         0Y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfSr8nhni32+KQvVeMyOP02BffJE6Wxt1iiMVMPWgAXf+w0PLZV1aZdp3Erm2KiBs+kz9ocSomAlX1590oWPU94k6YR3/AciRyrI1Pqo1KtBVzM6RRKwadNPavKNBBsX3YVqQjHGqftA==
X-Gm-Message-State: AOJu0YzJ++kfp8fvSdvQxC1aUJs5/Bp1130Yn9v8qyy5YUY6fr4hxEL/
	InjJsBLXwV1xXWVu0WgUnpKmXSch3rbRVttPY48x2coU2CE0fky/
X-Google-Smtp-Source: AGHT+IE041cHvdrW/M3bvEr/ZuxkdpfVQTsWfKLNdEABqHcajPnsXCyT4B2hSk2w47zVhHGSNofE4w==
X-Received: by 2002:a05:6512:31c1:b0:516:d219:3779 with SMTP id 2adb3069b0e04-530bb39ba4emr1894849e87.58.1722599992575;
        Fri, 02 Aug 2024 04:59:52 -0700 (PDT)
Received: from [192.168.42.49] ([163.114.131.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83c23025esm1013408a12.93.2024.08.02.04.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 04:59:52 -0700 (PDT)
Message-ID: <4fd1416a-8bf3-460a-9ee5-e6b81092cc98@gmail.com>
Date: Fri, 2 Aug 2024 13:00:25 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:iou/discard 13/13] block/ioctl.c:206
 blkdev_cmd_queue_discard() error: we previously assumed 'bio' could be null
 (see line 199)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <57ef3d11-2560-4e3c-b312-63e535027dce@suswa.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <57ef3d11-2560-4e3c-b312-63e535027dce@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 17:05, Dan Carpenter wrote:
...
> 444b80e47399c0 Pavel Begunkov  2024-07-20  196  	while (1) {
> 444b80e47399c0 Pavel Begunkov  2024-07-20  197  		bio = blk_alloc_discard_bio(bdev, &sector, &nr_sects,
> 444b80e47399c0 Pavel Begunkov  2024-07-20  198  					    GFP_KERNEL);
> 444b80e47399c0 Pavel Begunkov  2024-07-20 @199  		if (!bio)
> 444b80e47399c0 Pavel Begunkov  2024-07-20  200  			break;
> 
> If we hit this break
> 
> 444b80e47399c0 Pavel Begunkov  2024-07-20  201  		if (nowait)
> 444b80e47399c0 Pavel Begunkov  2024-07-20  202  			bio->bi_opf |= REQ_NOWAIT;
> 444b80e47399c0 Pavel Begunkov  2024-07-20  203  		prev = bio_chain_and_submit(prev, bio);
> 444b80e47399c0 Pavel Begunkov  2024-07-20  204  	}
> 444b80e47399c0 Pavel Begunkov  2024-07-20  205
> 444b80e47399c0 Pavel Begunkov  2024-07-20 @206  	bio->bi_private = cmd;
>                                                          ^^^^^
> We are dead

Right, thanks for letting know


> 444b80e47399c0 Pavel Begunkov  2024-07-20  207  	bio->bi_end_io = end_io;
> 444b80e47399c0 Pavel Begunkov  2024-07-20  208
> 444b80e47399c0 Pavel Begunkov  2024-07-20  209  	if (nr_sects) {
> 444b80e47399c0 Pavel Begunkov  2024-07-20  210  		bio->bi_status = BLK_STS_AGAIN;

-- 
Pavel Begunkov
