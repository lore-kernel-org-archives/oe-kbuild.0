Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED7727ECE
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 13:08:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31ff985e292so10626804f8f.1
        for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695820122; x=1696424922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QdVOA/aq5JkSKJGgI5bK4SRqTQ/yVTjIHBO44KR+OKc=;
        b=DbQW6xa2/tI9ZGps5mPkcQ64pBXGmJ0PRY0Xhy2crrDSO8HtGQW+/bbvfGHxfz3TIl
         hXrrHaSdUGPRYl5DvQa/pqpISK/L/CnmM8qepnkUU1PNl/raNYEZSdf0eGv0CxEwsLWR
         +Q6/JbWE5TP4aOeKHCgnCrhLRPXGKL5r0e24gvEBfyOYsiA2nIWB/4V4zttXdzyqwEsP
         T4p5xHfTdq8rW+6bxm2ccdLrs2JuosGcSDPXvRht6nIj6yDK3AzXiSO3jXWj+oe1oC6p
         Mkbp0ql8MhGwFyMKodqpGOyyxsOQPaqhjpWJd3HFbyx5jwHjd8DsXGrrvgQ9Uh7GO1Db
         1MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820122; x=1696424922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdVOA/aq5JkSKJGgI5bK4SRqTQ/yVTjIHBO44KR+OKc=;
        b=oddOU70eOBajE8FdGHRh1e9NhUnxPsLUzFLKsSQQc3UyjVfszrD2O6aaDvvBMUcvQn
         9HPgnOrFezRpjs8st8mdaKPEB2LcR5Zj5GGgPERIa9qoNDsjl4LtAECixctp1cmR5Gcr
         STlYnrkshJndWtsrZCStrxF2Vk42rAPXMRlkS5yjb7j0WLWwnN1WalFJ0+f5SGilSZfG
         7djk6Q3Rtzu9D7z05Auor54LuQURTqfZxQ3tjXPR6jfw/wfEDJ94Lpi94u2S8Zdac98I
         WiwUH5Wv0AmbisqxcdU6WEvFNfEGRCPdT71YEYr4VFesQFJlKzjHYtoY19TcinIf6A7V
         HyWg==
X-Gm-Message-State: AOJu0Yyt8vFRSSe5e2OWtrYPUfbQEL/ccuJS0OniTGbruguR1dF9HHcn
	umy1Lplp8afcv5Jg/ZE/rKJcRw==
X-Google-Smtp-Source: AGHT+IGMfRHK1WjljFK41O4BF3DjSvdhbDESVgABGKMrS1tvfer3+IYk5kyekAOKBlohWVvYZdZzJw==
X-Received: by 2002:a5d:444e:0:b0:320:a19:7f87 with SMTP id x14-20020a5d444e000000b003200a197f87mr1763257wrr.18.1695820122005;
        Wed, 27 Sep 2023 06:08:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d26-20020adfa41a000000b003247d3e5d99sm1004740wra.55.2023.09.27.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 06:08:41 -0700 (PDT)
Date: Wed, 27 Sep 2023 13:56:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Su Hui <suhui@nfschina.com>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line
 458)
Message-ID: <9675c618-0bc3-44b6-b3aa-a127fd2c80fc@kadam.mountain>
References: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
 <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>
 <d41c7647-2085-4f80-9d7c-5f17eecb03ba@kadam.mountain>
 <374b9ca8-1391-4c30-8c70-b788cb656a94@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374b9ca8-1391-4c30-8c70-b788cb656a94@kadam.mountain>

On Wed, Sep 27, 2023 at 11:41:46AM +0300, Dan Carpenter wrote:
> On Wed, Sep 27, 2023 at 11:39:09AM +0300, Dan Carpenter wrote:
> > On Wed, Sep 27, 2023 at 11:16:12AM +0300, Amir Goldstein wrote:
> > > > a0c236b11706cc Amir Goldstein 2021-06-19 @458   err = ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
> > > >                                                                                                        ^^^^^^^
> > > > Dereference
> > > >
> > > > cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459                            fh ? fh->fb.len : 0, 0);
> > > >                                                                          ^^
> > > > Checked too late.  This code is from 2021 though, so why is the warning
> > > > getting reported now?
> > > 
> > > That is what I was asking myself as well.
> > > The regressing commit is actually from 2019:
> > > 
> > > cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")
> > > 
> > > I am guessing that the report above was triggered by my change of helper
> > > name (to ovl_set_origin_fh()) in overlayfs-next.
> > > 
> > > Anyway, Su Hui just reported the same smatch warning a few days ago:
> > > 
> > > https://lore.kernel.org/linux-unionfs/20230925045059.92883-1-suhui@nfschina.com/
> > > 
> > > I will apply Su Hui's fix to overlayfs-next.
> > > It does not seem too urgent though, because setxattr with 0 length
> > > would probably ignore the invalid value of buf.
> > 
> > I don't know if it's urgent or not, but that explanation doesn't work.
> > This isn't an inline function.  So the dereference would happen at the
> > call site and not inside the ovl_check_setxattr() function.
> 
> Ah.  Nope.   I'm wrong.  fb->buf[] is an array, so this is pointer
> math and not a dereference.  Sorry!
> 
> Perhaps we did discuss this earlier and decided it's not a bug.

The truth is that these are not supposed to generate warnings.

Previously Smatch handled dereferences in an awkward way and that code
was duplicated in a bunch of different checks.  So I would maybe silence
something like this in one place but forget to update the other five
places.

I've cleaned up that code now and centralized it.  It's more user
friendly and also just better and more accurate.

So I've written a patch today to silence this warning in Smatch because
it actually was not supposed to print a warning.  I'll test it out and
push it later.

regards,
dan carpenter

