Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7027A107
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 20:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629313; cv=none; b=ICPLy13hfN8VQZUcqs2TNRdotyRFMgL0nNCkkIGIuKcpyRtn2H5fEHMdtC7iVNyvBhY5SXuvJAjLJzcr7vf0XmHknxX018cHoFSLhZ/fuqewjGrsbAXD2gyrnY2f50IdZ/NyKyQxy7L8uw5N7+qfeeUmfupFUBTctjXBwvDEAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629313; c=relaxed/simple;
	bh=vxGXjnm7ECnqftUoLxdN9KihorJFVvx830Mk0vEDIjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVxXLDdAtKMeblXNUovKA6Nj6XmgrU864ZENEVe19P8NiU0JhnP9lfrD99/VqskJCOalwkDvWkqApSD39uQ2J6yQD0/hq3lUU7SEOFFh/kFg3msjTwR/8T1GE27wRSODdfFc6lGt8zGW/VFjeJw7+HxUuBfw5IiQcU8fvQmbw70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=X15ZRlZd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="X15ZRlZd"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso1293915e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 09 Jul 2026 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783629311; x=1784234111; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rfEaA74kGgKkkpi1XdBp5kuyuDOHJYs0HpveYPGqvTA=;
        b=X15ZRlZdSI8Y0+Tih5LmUSQ6TJ1VeoUxoTI8A1RqKJLax8cuisarhNfsPS4IXzjdU6
         +AsbJTyOSyOsCWAntmHPw19Gy7XMXpR2U3RyHZ9bEVHTVivtITYXjjWAi+xjQVAN+5Sh
         EuDbcQ7TaKX3ua3HMNxDj57HIhpkAuj0wwBj9fP04U/VhPcwCkLn3IB79GRSchQin6Tk
         teLLUgj3DCEo72S+J2je7Xn4uC3Cg9AAHNalj+UDZQP/GPW7fkVe9Vt+3T6pUhUUZ4j+
         NH9PLspJFExloTgIEBcCZ5CPE1yBKRlb9O7+Yr+cQrmggea5ZfKrOe4pOOWWD9jqFIUd
         89Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629311; x=1784234111;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rfEaA74kGgKkkpi1XdBp5kuyuDOHJYs0HpveYPGqvTA=;
        b=rgpvGu8PttGzWdwfgqmDxXY+kHWqtgQA7ob6pGE+9sOTazVq+HQVeFkY3Qa0ZtjT9/
         Jd1zE1NeUkOGqtrpWFAvmK/qolw8+klYUbg97PEFzQ0kSgoWV4eQz9yLB8PjLvFNkXZ/
         f01bcOsB6CkzttUOQJ5IgAW22y5HkHeePu7W0hyLziISBwFdsiJLuVLa34xCTuSXz6i9
         sLXzfz7JysT4TFBpUP9sdpeeloil+IL6RX0kTXjHvHoT+ciYCk7ufMJMjg4+8h5Yew7a
         2NAwHJ9l5yASfnwxZOyXYJMToOvbsRwm1R4fV6ZDyill9EIkjzf73xMzSf8CJvIMSKM3
         epbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpG641IT2RkLde/XUiI1jz8wGQtscvOrEng4SN2HrRySke1hJe99OAnPKo3bMJf6tk43cP6VKXWtp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL+lwzg2z3onGcNeKHcvLb5ptAkap7eCA0seyTR2GkwEkyLwYW
	pNC8ZnXSjMkSOiPKnyP5aFDlhNhAxe89J3dsKSQ3kse7RI3S5Gpa3u3wPlwwHw4JfYw=
X-Gm-Gg: AfdE7clwBEibYArRHETJvHwVQhhHEKhH8vGXbv8ZZ+d9i0cPt+DDvrKti2QFJOVYux0
	JAP7tck03feBBhGd/tfj1lK/sbLfzeMFgXLBiPZ//Tn1+LrqREog1KU6zW7H6Cdaen9iBF6t1AR
	LkegJZ2TL7peqA9FDjd7NXsgVHyptsgfp640hSRSoZCU3gXELXIlLqvqymi+47sW8wD+4Nc9Sa/
	X3L+VMz9FqjAFOLmU1tDzIFARUWOxpKgrG/pyZt7jsNngNRwSGcsi2Wmud8oVU2+BNGF+wDRt7M
	OmjkX+EF5ghz2iIbqMfO/b0mtBgYAVyhZI7wuVZSveNrPVPQP/+c/psHOGYF4BbWiQpf04LiaVQ
	AYvitVckNz+wGCcFJ6u8QtCWttaLj0WBwmPdoC46yoqm2rpfZkIz3PJnQp6/XxJaEHmr/oNuMHk
	uC04Fxz3q/sgX2+Ld2b5HO/subOw==
X-Received: by 2002:a05:6000:2482:b0:475:f0d1:eb63 with SMTP id ffacd0b85a97d-47df07b9671mr9630515f8f.48.1783629310665;
        Thu, 09 Jul 2026 13:35:10 -0700 (PDT)
Received: from [192.168.3.100] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm56246880f8f.21.2026.07.09.13.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 13:35:10 -0700 (PDT)
Message-ID: <32d12651-66ee-4d36-891d-b375d1f75a93@baylibre.com>
Date: Thu, 9 Jul 2026 22:35:09 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1679/3422] sound/soc/meson/aiu.c:313
 aiu_probe() warn: missing unwind goto?
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
References: <202607031022.4wWDCjAs-lkp@intel.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <202607031022.4wWDCjAs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/9/26 12:34 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6eb8711ece2ce27e52e327a5b7a628ed39b97f45
> commit: 83b83024cdbfdddee104f4a84c2c2f1f8e6659f3 [1679/3422] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
> config: riscv-randconfig-r071-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031022.4wWDCjAs-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.4.0
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202607031022.4wWDCjAs-lkp@intel.com/
> 
> smatch warnings:
> sound/soc/meson/aiu.c:313 aiu_probe() warn: missing unwind goto?
> 

Thanks for the heads up. I think that a fix for this issue has already 
been proposed in [1] a couple of days ago.

[1] 
https://lore.kernel.org/linux-sound/20260707012424.1661733-1-ethantidmore06@gmail.com/

-- 
Valerio

