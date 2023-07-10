Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ECB5239
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Jul 2023 07:26:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31441bc0092so3956919f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Jul 2023 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688973973; x=1691565973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MpIFr8CBbAEE/ZVXXqmsOCs9taRKCqLSnP5eop8lso=;
        b=HjBV7kkA1W03Pe16OX8LLr78TyBLdU2DPqs4casG4EsnahbaEAGvByNXW56iQ1EwRv
         DW717tc0GpqXElkLC9R23fxb9NHa8RAc7NesGR83ZI1bLviuRJSMxbeSSVCvACUaEbsR
         axiuxBuKboPmiBt6nA9Q/uZ4UbdMtxAqKFHN/NAjggP36nTWxtXXyKsudp/3/Uab7RgH
         zvNWB/0NBP1vLjJOySbXZfTIOrdANDo+AS88kN+z2MV18DGxadGpNma5FSSYexGwV4ik
         VMTYlsWfI+ITz2v5vzThhrRBr9neUFdxVWoJDF4CNeUBE0u/2keQ/JFp0vrAn2kll3ou
         NFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688973973; x=1691565973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MpIFr8CBbAEE/ZVXXqmsOCs9taRKCqLSnP5eop8lso=;
        b=YlpTm8DdBcK4xE5vNVE0pmnAcMDk/vFf3MPdTivJmZv/dbptNxJqe26IDZhBobUEsp
         5Eoa4HD2TUy9vxAaYU8cVkF2y5GzAsPOIEs8i3I5R+c+ii76d5VGyLrNXCcS++v/t2A+
         8f6P73WnoxcpmQ0LvXFFd7GxQcwe3RAHxcmtpz+ToPAnsM/o3lQw96OuAeRNn//WUuDQ
         W2Xa4eZCNyIBuJKd/AR2/JVXRSAHIa9Xkpmzg0Q3qGi7M+P+G9kDr5Fh4UgXHZXEDprp
         yMZ9f0WVWPeFhWvovvPFs7qRuSw89cj3+N3EIZvirbokBCJUGci90wStYe32jClquSMD
         JkdA==
X-Gm-Message-State: ABy/qLaejCcozyHfP0NZDgCGDZQXBi2trAGwTypULyYHfShCwgvdN2Oz
	UgcnTcNBmgBJZ+QvrURckteW2Q==
X-Google-Smtp-Source: APBJJlH+arxF6hEmagBTDTI0C6x76IzZztJ+6PfnbP11P5phlAB60JPJrDNLhIYH5Ny6OpPtOpEnjw==
X-Received: by 2002:a5d:5683:0:b0:314:c9c:94dd with SMTP id f3-20020a5d5683000000b003140c9c94ddmr9936361wrv.20.1688973972858;
        Mon, 10 Jul 2023 00:26:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b0031128382ed0sm10857934wrq.83.2023.07.10.00.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:26:11 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:26:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: suijingfeng <suijingfeng@loongson.cn>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_plane.c:199
 lsdc_cursor_plane_atomic_async_check() warn: variable dereferenced before
 check 'state' (see line 180)
Message-ID: <d152ccb2-555f-4954-aec2-71ced694fda2@kadam.mountain>
References: <ff8f09e7-d8c3-4b02-ae76-47dbac830cdb@kadam.mountain>
 <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfaa947b-0388-2464-6379-8b7ac2c57757@loongson.cn>

On Mon, Jul 10, 2023 at 03:02:05PM +0800, suijingfeng wrote:
> Hi,
> 
> 
> Thanks for testing,
> 
> What do you means about tell me this?
> 
> I means that would you like to help fixing this warning?
> 
> Or otherwise, I will fix this someday.
> 

These are automated emails from the kbuild (zero day) bot.  I just look
them over and hit forward.

regards,
dan carpenter

