Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F730DD1E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624429; cv=none; b=uWJNq5hNQXQaQWUQddxIvnsNsx1y/HdeF4uFvZeMEhk2cx5KOhA0DPcZvW1HgZs77ffjfHkRMwHFqHdVpOmOnDV7K/FWrRlgf0oiyWQy/acdpFLmRLKC/DnMxB4id5e2oJ7CplhHbQSe1Pd3q736SnKHnk+FIUVYTc57baUYDXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624429; c=relaxed/simple;
	bh=aZTIOazBOjOE0KqMAGuDLAvGUKYPwDBJBDR/C47UmNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8hx1ZKPmIspVs028uouEaHpYV+eE6s6n6UVu/OuVBMVSTWF1zx04uWc6I9duNzA56NUNREtnzVokRjWuaItd/SSwP5MXLS3IhgWRW8Snr8dFPpzTeQNwx2FwmTmdUoeuZ5EWBVGg9GwleBmdR9H3NVdRkCqVabb44rALUrocIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=z0PbN0eN; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="z0PbN0eN"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-467e044082dso855299b6e.1
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 08:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774624426; x=1775229226; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8rRXVqh1SAwiLT8iMgdXmcqlBZbSii7YK+16tzmAI8=;
        b=z0PbN0eN8mrw0tSYIoNzjTs7+o0IIksrnQKORhmYPOKcYakpxROtyEj8CGVsjoizQs
         Q9zHw1cX7HYui6eF7yuiqLuVN6W/SA+492thQEjV5TAHnRCmQFFmuXCpNO6g7nK4sMan
         +StCCaXlNe3XYew+MoP6/eJWVsjOsep+qtfZYMbDkRIc67gxAN778TipA2a/QdhRm2En
         Q5XHpoVXIvPBeI56XTDjyqu4KlO9knt3uGXpsaJXllRTjwNj11nPnfUfnkHPNiMWF38b
         AQaJdpmVIXO1p7DqlCi8INwIw5O2azZIfv7AYn15GT1Fj6YjFcUEQ0VZ97taFg8lT+5Q
         0Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774624426; x=1775229226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8rRXVqh1SAwiLT8iMgdXmcqlBZbSii7YK+16tzmAI8=;
        b=Hzn8p61MjUs8bzeEHCw5s8xU460EZxT2UPNh+4Ydxq3fjGgQOk/IK8alt+SetgHmdI
         8wMyR3DeWXhWky1OLXyYqXV/cVm7aS2Xmau7hFwuX1N5ypTBwAEsCdfDbmzpZd9o/6B6
         Bzm6e+rXUFUss9kDadJYaBshxR5I478j+Fuoz3Vt7XSBbbvd4y2gqfraWQZHCkDnKewg
         ++vDhefMRJUXYjb3JBSrf8gQEhnZ9HZPVxNN3luhB4NrA9aAKoT89bD0EgvTO9si/srY
         7y1Mupmbn/qCqUn1G0qUXq05Zy4RzH0WuiWdJ6v/3Pc/BX0DpWI3BKYUBSTWMlSp0kDy
         7wdA==
X-Forwarded-Encrypted: i=1; AJvYcCVWLwcRTN2+oeJmREJBqqFCQ8lgqSZIY5kj9ZIvtQeHaXph+5msz3/mwNPMvNdMebqnaZIIE7IkTnY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRMQrzycsAXMgNSDbh6KQHAsHEzOvQNLq8VprAGH7sW4A7Vyly
	StM4vK1jlK4no+Rcz2/WHYNSAb9ErlGPfhIWzkwMhuCqO9gIvBJHrFN4FHngyumfTBE=
X-Gm-Gg: ATEYQzwEUzJeZOYjT7MXw75Tg2KDdx97h3raLW3N4bs8N7vOzloW9MP5ZTNo2UiL8Z/
	yB4hC/2DDg1j81dmXfymFhz/WCVAwT/tTLUQGITj1A6O5h9kZMhJIZEvtOEXkgs+WRAVjc+F0CY
	ft9luXtCFJ5h3nXgZGO8UbcadpCS17VVfSDz53JW/ACpTgxhVhmswTE2WCekXK3wEuTl2x6gJXQ
	sJ111cSudNVDRUlAZSyDyvSZK6Ns3eKSyGn4Pbvt/GIOWFTEqzQ6SZZB2Z3/2cC0Twkdgijj/+P
	BgOAvtTZJq/Pr7fcbH92B947OfEzrM5x0xMZstznsJ8ohgsI4R3qWNzF+JlGuur19jxE/fpviQO
	ljN8cddJohwX7fMQKuFsucSn0ZTveca1KYaM11axAijaNJ3TbKCClU99bwJRK7IRJY6c/NWP/+F
	kW6iuRg1jkUUSJyhTrW2mXT1qY/Aidx/3X5JcBvtxOwsho+Zment0oAaBmbs6O2ydBSeljQGDoT
	khHFp/m
X-Received: by 2002:a05:6808:6786:b0:467:fd2:69d with SMTP id 5614622812f47-46a8a3d9441mr1284227b6e.17.1774624426397;
        Fri, 27 Mar 2026 08:13:46 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41cc775b12dsm5147255fac.3.2026.03.27.08.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:13:45 -0700 (PDT)
Message-ID: <292b324e-2532-48db-9632-2e1a8d912ca2@kernel.dk>
Date: Fri, 27 Mar 2026 09:13:45 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe:rw_iter 204/525] drivers/misc/bcm-vk/bcm_vk_msg.c:1054
 bcm_vk_read() error: we previously assumed 'entry' could be null (see line
 1045)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202603271746.xX5EENwP-lkp@intel.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202603271746.xX5EENwP-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/27/26 4:59 AM, Dan Carpenter wrote:
> 
> This was fixed in ba75ecb97d3f ("misc: bcm_vk: Fix possible null-pointer
> dereferences in bcm_vk_read()").  Why are you working against a 2 year
> old tree, Jens?  :P

I'm not working against a 2 year old tree, the tree is current. But it was
_originally_ against 6.12-something, and it looks like that commit had a
terrible merge resolution that ended up backing out the fix from
ba75ecb97d3f. I'll take a look.

rw_iter is just a toy branch so far, it's not like this is going anywhere
anytime soon.

-- 
Jens Axboe

