Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03992328B4B
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 07:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786174533; cv=none; b=sxAPcsmuNCeq8wa3mMCVLIzRTSmxUiYzO30CjIRxH1UMU9euDP+kTIDDaQSaGWzzsAjIbZ6PnVcbqNB/v/jhqSrXVsYLbteukSpqWH04wbQ5PumCPTO8ZPKlGph4y87CrLnBbnek1NxVnbtrLAu19C1W7BZM+KK0Tw63OmC1NgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786174533; c=relaxed/simple;
	bh=TMkTgTwdDNYbcxD74Uto7x9YaDeli9iE+fXtDrvBAmQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EnZx9p2GDagbf/J/brf4EX+rreaPt6lrRZNm4myWapo8MQ8uDs02imDjsuWX+HKqQGLQdVDcU7MPhk4qdkYfof0vRAKjTYZTITZpnHUYBw1JDTkSkqF+3q69buin/1AGjgBIZnCDfWefaHk7o3YFivkDaS45S72PNI/36lmQHL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbaRU+/J; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbaRU+/J"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c197e7e4e94so35362566b.2
        for <oe-kbuild@lists.linux.dev>; Sat, 08 Aug 2026 00:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786174530; x=1786779330; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7ny+tvaw/RzOPizGWG4ERvF232HiO2/WaSKudACq8M=;
        b=QbaRU+/JxGuA6C5r2TcLCuOYeCIhFTnoBKk4wJxUOlY+7hCSrCZ3r28EsUCvvVyouz
         HUjBtR1dY6QPnEZSO3KH4bsSHpn8CJckjOJiaFVmVE5SPOa5gpRHcBrJc2/m7jUCwzLl
         KEZfZ6yli2BZfsN1M46Y3CWbib+zN0IQf3ct2iN4JstNEocfGJGGOYcG+47JD6C8jjGz
         sXCVboKG9rvcoK+1DbRVKpYBweWQA0RSVHwJtBZTk7Aq2HteDNZ6URJlpJEhIOY3wvH+
         LX3bPlCfGfX4VKptxx0AW9T4SU4fv/Q+qXwyjw0nF1CaTaIxjsozK1+iNod8n82hnwgD
         VsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786174530; x=1786779330;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7ny+tvaw/RzOPizGWG4ERvF232HiO2/WaSKudACq8M=;
        b=K3l2/XZofs3nTiHFoiRAwJQHo02anETF+230P+fca2AvGhxAA9EJVQfEnhgh8KtrO7
         /Tw+W9Vup8JwMQ9AhLqEFLQOnQpFDWQYBEY6Apjw3nzYvgJ6hxuflAYesH+UMLOCPKPT
         oiWa/WkKlAEBGjwZRIgOSZTRDDGkC/o/WaTcako6yO8UqObERJyanTZN1n0rWQxiQhse
         rx1Mk/4mXHJSqO8h95SnthCrDvkmZ/AfotVaTgxeld7G3wDdCIA46pOHBtvW4Oy8cRVt
         2GVIFBUgDKKgo/709+vfzguny/sDQdHaEiUH74i+PX0ugFO91BaSRk+2Ida3N/9Gzkyb
         oQcQ==
X-Forwarded-Encrypted: i=1; AHgh+RozxMYu62MlpdMEtVGna+7Ez3S6twQKwoGJaB9CRShTUa8CxFv+lQjb32HdvIGoYp2znrmlECXHFZY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpS/hp55wd1T3ETXd/Ve+lLFepFaynWIr2g59j+NJ01QlHEdHE
	eqq0jFUAQjAj0EtGcaB1AELTiQCxg7PMYncLvaL6+1iRY2V5Z2hVIWki
X-Gm-Gg: AR+sD11usnlGvK36m6CEXfZVxgM15oBvFEbKd/tivfOxs6VPvp5BrgXMv5awKd/h0iQ
	dEPOk6rfyesa/TvSUN+1CS/DMCSqPiwfOUmUX8Bp3acC0cravwpL88Ln6CxfeM2h656E77vYdWX
	jRbv7fzE9GPGHuQAiqwDImnJTrwTbOTvRxHWJpbf+LKZXaxkvrebCvEijkdhUuzVERbY5d17Wt/
	en8I3beq8eNn87NeUPg0wT9JAbDfiCW83vHUr2+F3Wt3+11LtscCvC2OiStnfpdyUPuISpXx05W
	dGBJOyyHKXhjjCDN/Ks3IPno8XcJvhYnyNlDYVzIOBYRfdXCC9xeZyUFPE2/2Gq8KXufiM6HK9R
	agUcUpsY8Xi96Mf92rrrXjyOTdHUVyz7OcYh2Phnz7FWl8I+ApWT6QA9/bVxnMGkLYgMhJnSL7J
	MQG6zpyGhMtozaG+etsy9NumLH8aoaoD2YTNah0PDEzGBxag2Vblwx7YaOt1B/pGbXNXkUDktDJ
	+/XHGpt/x1Uhs5UF2sgnuM=
X-Received: by 2002:a17:906:f5aa:b0:c16:2dc0:e1ef with SMTP id a640c23a62f3a-c20873d1e67mr329761166b.14.1786174529874;
        Sat, 08 Aug 2026 00:35:29 -0700 (PDT)
Received: from [192.168.1.89] (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a84sm140914566b.3.2026.08.08.00.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 00:35:28 -0700 (PDT)
Message-ID: <f5dc4a77-b697-cf40-c125-9b1a1e9301cf@outbound.gmail.com>
Date: Sat, 8 Aug 2026 09:35:26 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Eli Billauer <eli.billauer@gmail.com>
Subject: Re: drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode()
 warn: variable dereferenced before check 'inode' (see line 226)
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202608072246.Ee6OOcT6-lkp@intel.com>
Content-Language: en-US
In-Reply-To: <202608072246.Ee6OOcT6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thanks. The warning is correct, and applies to the first version of the 
patch set referred to. This was however corrected a couple of weeks ago 
in v2:

https://lore.kernel.org/all/20260722102307.49090-1-eli.billauer@gmail.com/T/#m2d3b975e15a454ef4455e6b28fc7cc905dcdbc2d

Regards,
    Eli
