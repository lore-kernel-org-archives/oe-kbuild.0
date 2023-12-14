Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569AA14F96
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hXqHLMhc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c2718a768so76312645e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 00:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702540850; x=1703145650; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejy3KRelhcsFDinti0drGVR8XYlKvUdp2PH4o5vy1dI=;
        b=hXqHLMhcXXNzXg9e+NvBrHClhp6+omF/kG/paWIGrij3TF7/MzmRbsQrwbTQtTCTz3
         2Qx9dOKsKyljrYOn1NLyGwhTR3jXVR9MQbMi26zjbb5ZLWE8IIKB3uMKrgqAxr85VDll
         Iphzumv/FAW0K/KOYmnE4KZqhzjRg+ZJcqEP+8cGhErxmGFvEoljfXi6YcaboEbRwD9l
         UjpZSsRaO3K+witZfJA2/SBm0BlEXb10F4PRhDym3ZFloARQpFwuu3WS017fQn1ecy76
         tgbPLcmeT1F5hzgcrM0qVjbMbBaG+NHKODgVT2e/uf6P0XNL6s8rMMC224Yq0aw8MZkW
         vRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540850; x=1703145650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejy3KRelhcsFDinti0drGVR8XYlKvUdp2PH4o5vy1dI=;
        b=kJF2TbsREConvs7v4Cf7dZuGBEB1rIEfhrr1Hz5YvS6UnTpfAsFzSUPmU00Qtp93EA
         AhAawyB8TtyyGSu6a4PgQIqhG4e3JkCxa3152V37+XkKeKWVftu1pX1hdg93PUsDcqX/
         RyphoC5Y+Y14MoAXWi1nppPiEiSrleNQ+Y4eaqJqp4u1wUWrvoppo4tx+TDvSdhGPYX8
         ySQMYryowbODRsN1zvALPyF3zEPx9cMHVctMxP9FQDSQMqMvJPY0maI8ORCzug3Ik9cZ
         RlYGtoHCdyiV8hgNaDgUQxj47phJio4kgfCnz29xEqVGcIOSLX7z6g3CoVBFzopnA+9A
         cNZw==
X-Gm-Message-State: AOJu0YxWx1eytOM+GsIIk2/yG1hA/cU/TgOnao8cfrJh1nMnFV/L3m1X
	c0x/wEBKyjJzyl/53JpXdBrahg==
X-Google-Smtp-Source: AGHT+IHQ4K6fG5UD2DRg9tvccj9wkjBFMvKHJ+iCR0tna4y5mXqNuX7X6s0KpISgg+aD5zV97RTFNA==
X-Received: by 2002:a05:600c:2257:b0:40c:314c:803e with SMTP id a23-20020a05600c225700b0040c314c803emr5582837wmm.106.1702540850506;
        Thu, 14 Dec 2023 00:00:50 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm25653160wmo.16.2023.12.14.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:00:50 -0800 (PST)
Date: Thu, 14 Dec 2023 11:00:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <a46f0c36-8fd2-4a85-880c-eb462d4a837b@suswa.mountain>
References: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>
 <ZXoFhu2TPXgrsInY@ghost>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXoFhu2TPXgrsInY@ghost>

On Wed, Dec 13, 2023 at 11:27:02AM -0800, Charlie Jenkins wrote:
> > 8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
> > 8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
> >                                                                                        ^^^^^^^^^
> > Can the list be empty?  Uninitialized in that case.
> 
> That's a tricky one, the list cannot be empty. Each bucket in the
> bucket_iter is guarunteed to have at least one rel_entry. I can probably
> resolve this by extracting this for loop into a do-while loop.

You can just ignore false positives.  It's not really a fix to change it
to a do-while loop.  I reviewed the do while code before reading this
email and I still wondered about empty lists, but just to hear that it's
not going to be empty is enough.  Just the email was sufficient.

regards,
dan carpenter

