Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917EF9DF
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 08:41:51 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so1170275e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 01:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804110; x=1696408910; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3avaBprYu+43ychYxLRbT6gVQ9C1A54ghz1t/5VqWt8=;
        b=nB9bIjpUUIDg8mMg9eipUQMfPz5CflMa7YrmYNPnoijZ3Di90czwF7QNpvN0lLD+Zf
         FrdP80UEhMl89Tw5csW34b6F5tlTB6ylCNttdbaQiLsnvV1yms+6DmnTwjjaEBb4h3LY
         dG0CHhjGH3Luy4e+NOHo67SpaC1jMCyhpjs6Nek+kypF0ohL53gqSYqr6naCYI7/d5Q0
         +wWhFvyLtzJhsW3n1idkQRnwJrofLTpeFWIwvM4fCk0PfFU+U08kTaok+Jy5rmfA1BY3
         aMqrF3qlgSWC6L/VPKGpg4ZsKl7b0hPF+8r4BhwNJrCIE8HEarHS2GwRgUTUuziFrjQ1
         c/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804110; x=1696408910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3avaBprYu+43ychYxLRbT6gVQ9C1A54ghz1t/5VqWt8=;
        b=UGZZV9UQVmtaYx7Rnuc2XQql+zWNGCBWBpTXwUHzRTNdJMJuFeQ0SsBh18iPnLUk7Y
         wYSdXNDRJNFN51GX3rTyvwRfve6IZGl+G8IBR1mbCOGVZnAb8atnkmkSEjlKOMzRX+OW
         uxEQGUpI+HvgFkgvKJZ1XMls4p69nwGxWD32DLkFUQwWfWlwwHt/fvvKSlFAcyzW21jZ
         MP/NAS2SMG8XVIQhFMwApkOmIef79SwBTLF2aHn/gCcIlxBc4/kEBaKKsxxkgEpeANEs
         Uv39eNMZSiFIfmLxkTMSdoH367KYDdj182ESNlYf5FATn/k3bJkR41tMbpiFvlPxN6tP
         je5w==
X-Gm-Message-State: AOJu0YxB2Mb7fCeXtekD0cj1dZ4X2MCRdtooRV4rnxeExGPI29G+aLJA
	d/Jbpei+FBf/DmBgg7ufBF5htA==
X-Google-Smtp-Source: AGHT+IEg8fwCRd/CdOSgkLlLdD+6IUQQTDQsA6DBT2eT5cgZwyQt4e3Wb7SPfEoZekd1KXbszSB8ag==
X-Received: by 2002:a05:600c:d1:b0:3fe:1f93:8cf4 with SMTP id u17-20020a05600c00d100b003fe1f938cf4mr1351176wmm.8.1695804109946;
        Wed, 27 Sep 2023 01:41:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h17-20020a5d5051000000b003197c7d08ddsm16557897wrt.71.2023.09.27.01.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:41:49 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:41:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Su Hui <suhui@nfschina.com>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line
 458)
Message-ID: <374b9ca8-1391-4c30-8c70-b788cb656a94@kadam.mountain>
References: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
 <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>
 <d41c7647-2085-4f80-9d7c-5f17eecb03ba@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d41c7647-2085-4f80-9d7c-5f17eecb03ba@kadam.mountain>

On Wed, Sep 27, 2023 at 11:39:09AM +0300, Dan Carpenter wrote:
> On Wed, Sep 27, 2023 at 11:16:12AM +0300, Amir Goldstein wrote:
> > > a0c236b11706cc Amir Goldstein 2021-06-19 @458   err = ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
> > >                                                                                                        ^^^^^^^
> > > Dereference
> > >
> > > cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459                            fh ? fh->fb.len : 0, 0);
> > >                                                                          ^^
> > > Checked too late.  This code is from 2021 though, so why is the warning
> > > getting reported now?
> > 
> > That is what I was asking myself as well.
> > The regressing commit is actually from 2019:
> > 
> > cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")
> > 
> > I am guessing that the report above was triggered by my change of helper
> > name (to ovl_set_origin_fh()) in overlayfs-next.
> > 
> > Anyway, Su Hui just reported the same smatch warning a few days ago:
> > 
> > https://lore.kernel.org/linux-unionfs/20230925045059.92883-1-suhui@nfschina.com/
> > 
> > I will apply Su Hui's fix to overlayfs-next.
> > It does not seem too urgent though, because setxattr with 0 length
> > would probably ignore the invalid value of buf.
> 
> I don't know if it's urgent or not, but that explanation doesn't work.
> This isn't an inline function.  So the dereference would happen at the
> call site and not inside the ovl_check_setxattr() function.

Ah.  Nope.   I'm wrong.  fb->buf[] is an array, so this is pointer
math and not a dereference.  Sorry!

Perhaps we did discuss this earlier and decided it's not a bug.

regards,
dan carpenter

