Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902D2376EA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665926; cv=none; b=Zu1Kb2jDqA+rl4wB83cgl6V8phCMhga6A2fKrr34x2k23MIeogbuKATEJ5m8FzlZ+FHOp9ym/btZeRP2O9n+LfV5DzUXZQIlU/F3JIK26u9Z30cqZQncC6dBK5xFl5xIvKo3PRoyairKp8pan4tlrZl1XsIrTscq6W5LhouL59U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665926; c=relaxed/simple;
	bh=r8S7xG/GXaPn5Om2tkbwP+KT4PKKlCCa4/xSKilbANM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gytLKMDMTPTUyoP36jE8GVmecwcPomtE+ePqtH7+rIBwKgSAVqYVVQ6c6nrA/Z6jmKGdhCX6rN95H5RuQjwxq6Tptv5TCSGisDIMDguZB1yTIjSqNjbuzpRSaPAPgkDEyt1ll4vg7hhYXHK9krWe2uGi4B0QNxvZWO7aof9SKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=nZCHrVLg; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nZCHrVLg"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso4478275ab.1
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1740665921; x=1741270721; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNJanwav3a8wFADrKZ+oCG5dk4BZX7AUlFcgnar0a5o=;
        b=nZCHrVLgE2EHsVzHP410cgPh7BELnDbi3vgc/8U749+hlZPD52PBD717/k9NXF+KM8
         v2+woO6eFYiE8Knns2vcZ25+TKTro79/mxoPntISgcn2+xluWjRvbkIIr3HUsdmIPhQM
         771iGs0rUtPBHVWNxcVevG8knYJIt+9aYrwdTLvZh9MVdvEihewMHey1bPaNfTg3B7o1
         dnacqOjkALWCz1SPkLlpKaJZCvp3/05WL5Qu441LFSsbJWDrhwEisdU+z+yn/Ri4p3aL
         ItZaNUHhdstxv8oS7hfrZa8QF2+94McK4mt0xYEJ5jNXsBpmVMJNsz2cr4JcwCo2MsZT
         LpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665921; x=1741270721;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNJanwav3a8wFADrKZ+oCG5dk4BZX7AUlFcgnar0a5o=;
        b=Cn+zYQgz/D6wOqdEsTPGeIQISvNpQEPmk0kyw5IUOyG9hzhXKkpJyH79puj7WpvrIL
         iPq0PYnV/eEoHTLXc7ytghGvAYE+ygO3sHGliCly/TN0Kt/wLTAiA9qdWjo2iOQ5sw5L
         UOHDWU4cSIC1CGzmkPgfFnsphz9XuqXwrkr2Ne9HOhkXzWN7B2FS4TcvdbH/NZVUhFLH
         2T43yfjMnfZTa8xt+8n4FmYAHaC0zlOiCSLJii6sTtPyjZviDYHcRYvk+rHBB8qjRH6m
         L6Gd/oCx+UKSMSxlIucPmFAqEmgjS3Ovrp0FoyzivauqmACgHuup+Rh82R1mVN6buYk5
         wZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmVKy1MPiuy7QErrglEbY7aHukSKj7OTRkOBoBJw2WLrDkvFJ1n9EMxqeJG8edCyRqsn3iqtVGvOM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw19dJUQGvQxRmbMRrG5TWzf711oScRztdGWFWpYGc4F6BLRUQ8
	jxa5N2ItY0XlSP09OMwWhnnapUVP3XAcvgy3ajRSmHeRDc/mOySTL0Cm4h5zAfvFPbn2xvSTXoE
	q
X-Gm-Gg: ASbGncvAEpgxfHj9SkgA150La0vYy2q4FMPq4ve79fEhkrthHxlC87vLqYBWxXgsRxG
	XZahR9gPkMM264twUEbDjNgxequ8zwE6sMTtBW9pKjsu5c3BFhaW98Ienst+kb4K8oHLsQOko+H
	wZZgtap9ZWkhXa6Uty2FNdrS0fquOxmtUbpgevF2N6mGyJxNEq47itW0B8ZA2Kr3A5J5Iu8Lgi0
	rRxe8Q7yT15PuDcXhKI1q1q41oWevu3ilgKJDldeoqWBIsCkstvPjZM/wiswpOdnHQlVNpdl2VM
	gHIO1TsZtAyZqY7rjVqbYw==
X-Google-Smtp-Source: AGHT+IFaqZ3whCItmy6RW103VrhoKk3IQiM/Mvv8AZZcmFo8vP/FBPn1in3bLWUleZWrKCTF237izA==
X-Received: by 2002:a05:6e02:491b:b0:3d3:ced4:db9b with SMTP id e9e14a558f8ab-3d3ced4de09mr93462075ab.5.1740665921305;
        Thu, 27 Feb 2025 06:18:41 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d3dedbaf03sm3437855ab.0.2025.02.27.06.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:18:40 -0800 (PST)
Message-ID: <5ec35d4b-bf0f-4dcc-876a-40c64793d25a@kernel.dk>
Date: Thu, 27 Feb 2025 07:18:39 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [axboe-block:for-6.15/io_uring 43/57] io_uring/rw.c:299
 io_prep_rw() error: uninitialized symbol 'ret'.
To: Pavel Begunkov <asml.silence@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <e14911d2-c648-4738-84e4-48af3fcfdd9c@stanley.mountain>
 <56e35d8d-b102-430a-8c94-dbc14b8fb9ae@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <56e35d8d-b102-430a-8c94-dbc14b8fb9ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/27/25 3:08 AM, Pavel Begunkov wrote:
> On 2/27/25 05:56, Dan Carpenter wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
>> head:   047fa0ba8f1bed6b1c5d88e31c4fd187de16dbc1
>> commit: 61ed48b5fc63d1c6d9c3eb59ed2b46a2cbfc6039 [43/57] io_uring/rw: open code io_prep_rw_setup()
>> config: i386-randconfig-141-20250226 (https://download.01.org/0day-ci/archive/20250227/202502271201.3Eaa0Ych-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202502271201.3Eaa0Ych-lkp@intel.com/
>>
>> smatch warnings:
>> io_uring/rw.c:299 io_prep_rw() error: uninitialized symbol 'ret'.
> 
> Thanks for letting know

Folded in a fix.

-- 
Jens Axboe

