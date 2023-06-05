Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F94194
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jun 2023 07:44:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso38648605e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jun 2023 00:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685951046; x=1688543046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IIAm/QGH5D34mPOrZ0A7kq9U8fRJWOS1vfhra1EiAg=;
        b=Ail3x848jzNrgAm+lkmozQHROIaPSUYq7BTEXa0JxBOWs53+eReFWae8flpur1cCYw
         3BihlaAg69E8z8OP0QnU+kPciJ5yvHBaynn56p5LR7hEc/0YlhuXl5hBZxTJ0Gyh0I5v
         1u/MeMweiWdwapRep9Z/jqnvFKq/OfOF3+YwjzIUoYczQva1kPuYn5S2+buy+0wPfcmE
         NsuSqcm76SxuY/LwtdcMZbOD2fdv2MneAthAWDKkBMwso5/5VmzZLMu1FpT/DpqtalMm
         gsQBFAk1X/ByFfpr+ukZbWcfXgSxMHT3IIVbC23kSkCHLCvnciYP6hICRbmvTTRtTgg4
         zsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685951046; x=1688543046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IIAm/QGH5D34mPOrZ0A7kq9U8fRJWOS1vfhra1EiAg=;
        b=ekc52KjfBI8xCdXkRvzvfkho0wD3nad9X7jZhi1E3MX7nYxy4JaE0g343t1hOV7NMz
         51hmZd5S16KJF3VJe3ZNYNEQpgur+klc8oitMvc+JUBmYYH1H1HXjGjTd+xgvzqkgW7C
         IMYIVzzwyWeLid2S18/2SFJJrjjeyXPKTs9PvsJBTYtKTXa/xrTVGTRBPDK8Wx9L7QL4
         9gjBnv6biU1BCDGr7+VQs8BFO7quu6V/PUDCYg6+dIoMr5cs2Bu+1fYGV8WQ2qqbQr89
         1FQRdUJp6ajoQhO0dvB2ftBrXCgVR/dcKwuvALC6RtvyeOodctPgVwKienTnApn2R4xc
         e8PA==
X-Gm-Message-State: AC+VfDw4+BAi9gibNpgzlLqoa6XS8yWne1nlJ/5Ub8hyCObN4NiU6KfD
	pdZb5BJpf5fzn51hkwJ+44wki68rsbf63sX8EAQ=
X-Google-Smtp-Source: ACHHUZ7aR3uBe/aIXeteicbDiRnfCAHYnhLZ5OgqnDklU03uBbyhNTIpK+fRXL+oVsR9Ltbt6rwAFA==
X-Received: by 2002:a05:600c:24e:b0:3f5:fc21:5426 with SMTP id 14-20020a05600c024e00b003f5fc215426mr6610806wmj.41.1685951046262;
        Mon, 05 Jun 2023 00:44:06 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003f31cb7a203sm9998668wmh.14.2023.06.05.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 00:44:05 -0700 (PDT)
Date: Mon, 5 Jun 2023 10:44:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: The robot is broken (was: Re: [PATCH 1/3] USB: serial: return
 errors from break handling)
Message-ID: <dae2eacc-23f6-43d6-8238-c633090d67b2@kadam.mountain>
References: <202306031014.qzAY3uQ6-lkp@intel.com>
 <ZHyGd5BRjUaOdYyF@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHyGd5BRjUaOdYyF@hovoldconsulting.com>

On Sun, Jun 04, 2023 at 02:41:27PM +0200, Johan Hovold wrote:
> On Sat, Jun 03, 2023 at 10:40:42AM +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > In-Reply-To: <20230602124642.19076-2-johan@kernel.org>
> > References: <20230602124642.19076-2-johan@kernel.org>
> > TO: Johan Hovold <johan@kernel.org>
> > TO: Johan Hovold <johan@kernel.org>
> > CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
> > CC: linux-usb@vger.kernel.org
> > CC: linux-kernel@vger.kernel.org
> > CC: Corey Minyard <minyard@acm.org>
> > 
> > Hi Johan,
> > 
> > kernel test robot noticed the following build warnings:
> 
> > New smatch warnings:
> > drivers/usb/serial/io_edgeport.c:1601 edge_break() error: uninitialized symbol 'status'.
> 
> Thanks for the report. Now fixed up in v2:
> 
> 	https://lore.kernel.org/lkml/20230604123505.4661-1-johan@kernel.org
> 

I'm only seeing this now after I had already forwarded the report.  I
removed the old indenting warning because that's obviously intentional.

regards,
dan carpenter

