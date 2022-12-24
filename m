Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253DB3D61;
	Sat, 24 Dec 2022 19:37:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id h16so7214637wrz.12;
        Sat, 24 Dec 2022 11:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QD23sbwH8r0k8Mg6nLVRzWsdSmM875tPfpoqYqTuCc0=;
        b=D/ZL92Ok+p9CEJDf2BZhwcyvi2CpZbNqxS6WyQtG9N8AfUrWKKSNrsdG7VclOKgsce
         xR/bvHwnChLhNeowok7Z5V+nSQigDNV/b0JOJe5aaNIvPBNx7L057WZYJy7g23jjOFiC
         EdcAXnl6zXy6OCyHIxzZEPTeB5c5Th4LMzeRAbmzPaq+biwJImd3nCv0nwjekRz6pmNu
         qi2kL2VLStw2KDKqTpXChp+Thlubo+ICzQ7pgRP5pgzMnwWnsu8sFr8YGI7zkHWn+liv
         1Ylw5r9W0nDUPFLZdSD51Tvunj1tHtKVLoB4vqw2rp/b0YqIVoYjrj1FzqVyeAWZ3Fjl
         yDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QD23sbwH8r0k8Mg6nLVRzWsdSmM875tPfpoqYqTuCc0=;
        b=2aABrsalBuMYgGwU+2h2ENMpeZBM3nhIYDhW0C034o+B56eDYOB26/JTvocch3YRyB
         yMm0VHs8KgwfPel5VMgLYgpGlvoh63YzBvFuG2ICoNB/sUgX4Oe6ijAdaGtI+GooEPYI
         tiThsDzAo1DcO31ok3z0hoj9PfM5yMpx3e+8FOqw4oI2Lt25auvzHYNLd7Hf1UH5z+b9
         r2tJQIoayxh1iDSRiW2Ama4bs4K3J6UB058ivTwvU4OMs7J29EW4DkbZQuYi/WCI004E
         BANwPKZpBcW8B387M9Bn1QOlO/aZLKItZ42uJcVi3FeEvoEM4YxP8j0EVgeamhGZzdy6
         9ktA==
X-Gm-Message-State: AFqh2korbPboO0u1rWecC9y738pr0ek3ZJeXU6y/nGdAcCncQmyAs8rf
	8f50ZmCQ+zPut/wv6l7FCNpTFS6b7z+BOUAg
X-Google-Smtp-Source: AMrXdXu34vx3L2agFvuyAzhKsrsjLoXzZBURtkE9N1+fMXFNvQF1t0YqYXLlXAqQ/LxgA8jZN8xPxQ==
X-Received: by 2002:adf:9b99:0:b0:241:fa2d:dea0 with SMTP id d25-20020adf9b99000000b00241fa2ddea0mr8806061wrc.3.1671910620379;
        Sat, 24 Dec 2022 11:37:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020adfc787000000b002238ea5750csm7530886wrg.72.2022.12.24.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 11:37:00 -0800 (PST)
Date: Sat, 24 Dec 2022 22:36:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Qingtao Cao <qingtao.cao.au@gmail.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn:
 replace divide condition 'pin / 8' with 'pin >= 8'
Message-ID: <Y6dU14Smv0Zh6/rP@kadam>
References: <202212181140.EAWl7FKx-lkp@intel.com>
 <3D147284-AF8C-4414-9BE1-C83032B6C15D@gmail.com>
 <Y6dTX2wx/SXlswGC@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6dTX2wx/SXlswGC@kadam>

On Sat, Dec 24, 2022 at 10:30:39PM +0300, Dan Carpenter wrote:
> On Sat, Dec 24, 2022 at 05:19:27PM +0100, Andy Shevchenko wrote:
> > 
> > 
> > Lähetetty iPhonesta
> > 
> > > Dan Carpenter <error27@gmail.com> kirjoitti 23.12.2022 kello 11.54:
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   f9ff5644bcc04221bae56f922122f2b7f5d24d62
> > > commit: 5134272f9f3f71d4e1f3aa15cb09321af49b3646 gpio: exar: access MPIO registers on cascaded chips
> > > config: ia64-randconfig-m031-20221218
> > > compiler: ia64-linux-gcc (GCC) 12.1.0
> > > 
> > > If you fix the issue, kindly add following tag where applicable
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > 
> > > smatch warnings:
> > > drivers/gpio/gpio-exar.c:52 exar_offset_to_sel_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'
> > > drivers/gpio/gpio-exar.c:62 exar_offset_to_lvl_addr() warn: replace divide condition 'pin / 8' with 'pin >= 8'
> > > 
> > 
> > 
> > 
> > I don’t think this is a good advice. If we want to limit that, we need
> > to check also upper limit. But. The GPIO framework does that. So,
> > changing / to >= is bogus.
> 
> 
> How is checking pin / 8 not mathematically equivalent to pin >= 8?
> 
> I don't understand this code at all.  The divide is inscrutable  Is it
> storing something in in the lower 3 bits and something in bit 4?  In
> that case it might be nicer to just check (pin & BIT(4)).
> 

Or a macro which does:

#define GET_UPPER_BIT_THING(pin) ((pin >> 8) & 0xMASK)

regards,
dan carpenter

