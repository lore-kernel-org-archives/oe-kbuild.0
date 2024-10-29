Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0082876
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730221425; cv=none; b=fYfXtDRVfS1CURCn5neguQpyhGoUUVfHLLn99ZD35bYYXOm6ArGL665OW03ImsInxIpopeJh1qQ2mMOL8O+66sUJmvCqJ1fpLGX5xrHQ+3q04wLo6KqdFa6OMMef7sD9dkgI8P7TwO/EP/LgDoZMvYnDc0O4O8e1PHVQfrF+NBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730221425; c=relaxed/simple;
	bh=cndgThwCRKYDmkJ4IOysDIvGRup4a8wjPzQR9TPE9IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ugj9oW66ow80Q6iPJWFBiDMNQD914oCT/QkAYq/6w5knYk3Lfo9yCVyyqspt7men2ZMgWRzVK96NI54bgt+T36FAvxhK5Cn9Q9QBeq2nyo1Xihf72Bjhr1Yd8Bjpj+ndjNDUIM2holRxOTnsVtYewd5BWelYL2OqfeXEfJgd4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RhCRkzXv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RhCRkzXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730221422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgDDqHgwK2vnx9vpFandCAj8GwkYbm2fjxiXRjakfu0=;
	b=RhCRkzXv+gi+by0bVyhNafGKI2HrecRoWFi+y0dU5J+RdUwmXhina/VJRZ21Vj7uucbNFo
	nJDGWEz8y5A4TXiifvlwETBNvtM3/rMo4sAFycCUS8dHEPyzF85SyWMNvncjfEQ5fxaCmY
	9gLYIbco4XgP7iE8FW2ToFtvbOHVG3w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-6zTlr0EYOT-i0DfWY6_KlQ-1; Tue, 29 Oct 2024 13:03:41 -0400
X-MC-Unique: 6zTlr0EYOT-i0DfWY6_KlQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbebfc1725so94943436d6.1
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Oct 2024 10:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221420; x=1730826220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgDDqHgwK2vnx9vpFandCAj8GwkYbm2fjxiXRjakfu0=;
        b=W+1lz+UeAaU1jHi7qzCQBhYGi++L7IsaI8gKJYyo/uKEAO/ErynmY+kbxMjvV/Nvah
         Xpiswdt2fk02dUtMfDIIdF/HuBCJNbLEki9TXCXlx7TtdXQ/xbc9YoGz45O5Bt3WfeQ0
         l4ECOBubaJr917mau8RZmGeQyK7s9+xXn2veEo+1RZ9xGoIZz1S4Siq8bA+Hqa+Tf9jv
         ow1UoUsyPsClJFoOyao49d065rk0mewepsl3OGtYBvLJuRmIFBGd5oqv7fbvyJN+NLuO
         r7uYpyXFkluNhF/lPOtzcXK6unvygKrTwDHfArmixWXNa8fh8KBVWVq8BX59NfTyuqWZ
         7Cug==
X-Gm-Message-State: AOJu0YyfZ0esgQiiDay/LTAq6y8NLxJA7TiQQjJrUc0wKh8S3mM5dBPU
	QfHNwKsS7VvkIRHUMoh6Fgx6whvzFp6x8G0vR5dSdIpkg9Xiqled1ZpGpKvmxAXFqGNTY92uhQZ
	Jbqvv+DGMhmW/9l6ROLfkdxIJduQWFaIZkctrH1TMUVB4ANLet1ECP3yGfQ==
X-Received: by 2002:a05:622a:199c:b0:460:9ec3:1b80 with SMTP id d75a77b69052e-4613c0305a2mr204013651cf.27.1730221419177;
        Tue, 29 Oct 2024 10:03:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFnEdmHELhucGC4RMoKvtlOdJj1FTZxMhoHHfkOL0T1MnusgnPAKgrKNr4PWgjCRPPI7Jvww==
X-Received: by 2002:a05:622a:199c:b0:460:9ec3:1b80 with SMTP id d75a77b69052e-4613c0305a2mr204012071cf.27.1730221417287;
        Tue, 29 Oct 2024 10:03:37 -0700 (PDT)
Received: from [192.168.1.165] ([70.22.187.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613213a2besm45942891cf.29.2024.10.29.10.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 10:03:37 -0700 (PDT)
Message-ID: <1c0beb9b-6b90-4c92-a4f3-f228dc0aa527@redhat.com>
Date: Tue, 29 Oct 2024 13:03:35 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/md/dm-vdo/data-vio.c:976 vdo_launch_bio() warn:
 inconsistent returns '&pool->lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>, Philip Li <philip.li@intel.com>
Cc: oe-kbuild@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <717e8949-55c4-4461-8951-3e582e9b77ef@stanley.mountain>
 <f074f848-5a26-473b-ae98-1932e9a8cbd1@redhat.com>
 <ZyBQa45RTWXiXJke@rli9-mobl> <ZyCLo51ZyjxX7eQK@rli9-mobl>
 <13937d22-46ac-480a-8956-f89a0fd295ac@stanley.mountain>
 <68866f17-f327-4df8-ae17-dfcc50362d4a@stanley.mountain>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <68866f17-f327-4df8-ae17-dfcc50362d4a@stanley.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Okay. Just to restate, what I took away from this thread is
1) The current code provokes a warning.
2) When bisecting, the bot found a (different) warning from the patch 
introducing this code, and so the mail points out that warning instead 
of the warning in newer code.
3) The warning is showing up now because new checking allows the bot to 
notice problems it didn't notice before.

The commit I cited fixed warning from sparse, but I don't think we 
looked at smatch. This particular code does not have a locking problem, 
but the way it's spelled makes it difficult for static tools to 
understand that there is not a problem. I'll take a look and see if 
there's anything further I can do address the actual current warning.

Thanks for your explanation. I think I have a much better understanding 
of what this bot it doing now, I'll keep it in mind when we get warning 
in the future.

Matt

On 10/29/24 4:19 AM, Dan Carpenter wrote:
> On Tue, Oct 29, 2024 at 11:07:07AM +0300, Dan Carpenter wrote:
>> 3) The kbuild bot detected the bug, but unfortunately the cross function DB
>>     doesn't scale well enough for the kbuild bot to use so it didn't detect the
>>     fix.
> 
> Aw crud.  It does still print a warning on linux-next actually.
> Smatch says that we lock "&pool->lock" and unlocked
> "&pool->discard_limiter->pool->lock".
> 
> Anyway.  Points 1 and 4 that we were running new checks on old code and that
> the code in the email did have a bug are correct.
> 
> regards,
> dan carpenter
> 

