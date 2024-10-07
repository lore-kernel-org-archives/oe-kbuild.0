Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1FC6F30C
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 06:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728280996; cv=none; b=WaD4KUYLJDtZCgvmsSTm6YVTU6qy6XkXJXj9zbxeJGSKOCTmxrsV8YJuYlA5IrRVUqhfTaKsuP4969Zw4DDyETm+JdG2AMGc6cArah0w06mgFqNijuNnOTGO+DOQuKgHoD13CVVUBRWzyTxNFR3raBROdwOWAmPfGwPA0yY/gKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728280996; c=relaxed/simple;
	bh=g1WY7q6mnYmOmDCgecZj2+nXjq+skjc7Yi+38HVy9PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syv/Q6erQIhNF1olm94MceW2OJxfCH2PEjncV2xiDAFoOKEPOa5HgqJYpFgTlz3q2JaXeF/9USdi1yiwJPcHgVspxU2GVOiJ/yU/mao6SHYPMlV1h9/8nInZV4awAPDcJTUEhfe1oauL9cEVR7tAg4Q5nuMVdDQu1hoIRZvM1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Js1zuBMn; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Js1zuBMn"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so40206275e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 06 Oct 2024 23:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728280992; x=1728885792; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KR3vE2b8QAogg/p7AyZUxtHGXFdt8SOrkkrohHvblvQ=;
        b=Js1zuBMnIw3sZCD8kj0ql5zINb0pvXV541GDb0Di9H8ROCMp/VAWdQdcg0dJpxRyRN
         aNaJeeGVthGLmZJCzbD4SXiu2HRNk1xINI8C+Qb14jpu6qu7Hw/l9OjmgJPk/lrf7yvv
         umaQuOt6rk4CVswpW9pTPdcGtAB02avxN7bPcBw5fVz3rpEMqgO5PMOJlz71wMzpVCku
         oVl+6KCeTGxajiatj7i6Y5Gh8W3uTVRlrfhNhEFN1FG+YyucWJcZ2lKBkDrcCITDdY1M
         29YradcuIpZ5FpXsgSTla/tkm39R4Si+GMuwZmSFZD9DvURYAb7FHk2PkAejbVW2IfAo
         kF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728280992; x=1728885792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR3vE2b8QAogg/p7AyZUxtHGXFdt8SOrkkrohHvblvQ=;
        b=ikYpNv6J8GrLdtUMZFkE8y8QoNi/5J1G2gBktn3hrzr7aultQbtPIwgpGWsaRbUPUj
         WVfwvpNQtRWluNS3lPwsxujA6krdm2geeHSvIQu7j+zpxB2YJKfC7+lw2HChQVV2QeRw
         2HLgEj4iVyL1AM4cpCDxSSsmB+0pkAySUvohNhoYvwNkEN7D4p/+klXeZq9l9xi4gTcr
         he2VS1I4QK6nmze54HVPoqdT3a5CXLsM1igU9CROnzad3DxRGyRxUHFsLDbmy8m+nBL6
         IVWcxKOYh3OkjoO5HuqU6Ddb/2IziTUWlWI+JLJHCFRYmbimi1d+4IYb4FkOLMDexUeC
         GAXg==
X-Forwarded-Encrypted: i=1; AJvYcCXkT0qK0n/z2Jmn8/MU1NlBn50EEJAn4xFvsXFQhgwDkydmdBnkGd/ZzJQkrV4LBHU652f60XpCenQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxourWludgBuoNQygk8GprdxM1BqXl1pVtPm7qY4jDXpMYLvR4a
	lukPDl8/8S3vIxdA5AV6cD1X3IPV0f/HtvvSDAGnxmorFkjLq5RB319UMB91GrVATsQ0ZeWBm/N
	K
X-Google-Smtp-Source: AGHT+IHWDMkSR4I+tl3g5xv5Ixq/VGI3qcpGBbd2FLv2lhbxKjQLVquAsKt4Nn5usIuHvqWf9A8MUQ==
X-Received: by 2002:a05:600c:35cf:b0:42c:aeaa:6aff with SMTP id 5b1f17b1804b1-42f85aa9dbemr85568075e9.10.1728280992288;
        Sun, 06 Oct 2024 23:03:12 -0700 (PDT)
Received: from [192.168.0.157] ([82.76.204.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ed957asm64018415e9.44.2024.10.06.23.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 23:03:11 -0700 (PDT)
Message-ID: <2748e6c0-b8e0-4959-8a64-884d78cb0840@linaro.org>
Date: Mon, 7 Oct 2024 07:03:09 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ambarus:mailbox-request-v1 1/1] drivers/mailbox/mailbox.c:543
 mbox_free_channel() warn: variable dereferenced before check 'chan' (see line
 540)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <381b8465-2432-4fc7-9314-b14dd57bc017@stanley.mountain>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <381b8465-2432-4fc7-9314-b14dd57bc017@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/7/24 6:43 AM, Dan Carpenter wrote:
> tree:   https://github.com/ambarus/linux-0day mailbox-request-v1
> head:   1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf
> commit: 1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf [1/1] maybox: add simple async mechanism to empower controllers
> config: sparc64-randconfig-r073-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060657.bzHprVZf-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410060657.bzHprVZf-lkp@intel.com/
> 
> smatch warnings:
> drivers/mailbox/mailbox.c:543 mbox_free_channel() warn: variable dereferenced before check 'chan' (see line 540)
> 
> vim +/chan +543 drivers/mailbox/mailbox.c
> 
> 2b6d83e2b8b7de Jassi Brar    2014-06-12  538  void mbox_free_channel(struct mbox_chan *chan)
> 2b6d83e2b8b7de Jassi Brar    2014-06-12  539  {
> 1f2e24358cc2d3 Tudor Ambarus 2024-10-03 @540  	struct mbox_controller *mbox = chan->mbox;
>                                                                                ^^^^^^
> Dereference
> 
> 2b6d83e2b8b7de Jassi Brar    2014-06-12  541  	unsigned long flags;
> 2b6d83e2b8b7de Jassi Brar    2014-06-12  542  
> 2b6d83e2b8b7de Jassi Brar    2014-06-12 @543  	if (!chan || !chan->cl)
>                                                      ^^^^
> Checked too late

oh, yes, thanks. I'll fix it in v2. cheers.
