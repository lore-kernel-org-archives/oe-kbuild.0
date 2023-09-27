Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0412DEAF2
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 08:39:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-405361bba99so102074365e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695803953; x=1696408753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5fO8vr6yPX8c9lZQb4Sz61y9ZVT/SmBGsjDU7I4Wv4=;
        b=wSWrGq/it9hzWEu4e9GRC1ZOzecozKfDpEBDwDmyCEpikkS6PVeAunrKcQR5IcLX6e
         fJ3BjscUPSrPBuXwdxu7CIXxaMNaB4x6usnDeMUgZjoD9zsEzKpnY57dFiV1TnmM/kq0
         ih6N1JdzrAK5nZnue6ZCahi7F+13jRqSenQhFqPBcaajcsa1tqvkOJOvl/2KkTESTsxs
         O4+vD6p5pDd1VLaXjEbH7U1JJBMnDWPyXmkGaYDJuzUuOn+SzdRdQ8gGK40Praym0LMI
         lg5YTYrDVOsuflgkpoSxtfWAK18Y+yyhU/1DpH8L3sPa/5bhHYmx5g+4Ty2eZ4El9oTI
         nYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695803953; x=1696408753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5fO8vr6yPX8c9lZQb4Sz61y9ZVT/SmBGsjDU7I4Wv4=;
        b=wcQOAoGZkQorxbXMzVkQhjJLLG8VZEdlrtqGz43y5Tr9AFYGoxThyw9VUej2n9Chg6
         cVAec5G4LY5tQKJos1KvJ/fgih7EPpjdunFUQvQMpl8+FMNR1WNR2QAUaA7VKsgsY8df
         5Zwg4Nn3vEMtIS1PWiaLbl6a4Pgdcp8m3WC9wURzrMAQF21YKOfllncjE2ujoglSh9lb
         4dBFDHcFSQTTipt4I81R4lx7y1Tkl+BIlYWivabYo23odm2enYG3/yOIy2np0mEVLHLi
         f/PjEe239e+Hbz6UAwjGXbOkDxFW8+n58NDE4CAJdIR6A+qXXE1wSZmUqM7d3ThXdl+N
         p0Zg==
X-Gm-Message-State: AOJu0YzvbIJOgzmYRV/bqfH47YS0RRT7CO6w7V09E9hM7Tk24Y9u+0Pd
	yWm9JfsY2T60XjDiBS89FRjtiA==
X-Google-Smtp-Source: AGHT+IF1vat8vxY76e4i7kztI+MrQZlFYloNoEu+qtTy08Q9lr9tQZFFDO/1Y/ix/IWSitAulTJy/g==
X-Received: by 2002:a05:600c:cc:b0:401:aa8f:7566 with SMTP id u12-20020a05600c00cc00b00401aa8f7566mr1206249wmm.26.1695803953060;
        Wed, 27 Sep 2023 01:39:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c160800b00405588aa40asm11598119wmn.24.2023.09.27.01.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:39:12 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:39:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Su Hui <suhui@nfschina.com>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line
 458)
Message-ID: <d41c7647-2085-4f80-9d7c-5f17eecb03ba@kadam.mountain>
References: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
 <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ4uxizw5ogqcehJcmuZTDBNLM=hx=jZpdQZ2fsTyVdMZHf1g@mail.gmail.com>

On Wed, Sep 27, 2023 at 11:16:12AM +0300, Amir Goldstein wrote:
> > a0c236b11706cc Amir Goldstein 2021-06-19 @458   err = ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
> >                                                                                                        ^^^^^^^
> > Dereference
> >
> > cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459                            fh ? fh->fb.len : 0, 0);
> >                                                                          ^^
> > Checked too late.  This code is from 2021 though, so why is the warning
> > getting reported now?
> 
> That is what I was asking myself as well.
> The regressing commit is actually from 2019:
> 
> cbe7fba8edfc ("ovl: make sure that real fid is 32bit aligned in memory")
> 
> I am guessing that the report above was triggered by my change of helper
> name (to ovl_set_origin_fh()) in overlayfs-next.
> 
> Anyway, Su Hui just reported the same smatch warning a few days ago:
> 
> https://lore.kernel.org/linux-unionfs/20230925045059.92883-1-suhui@nfschina.com/
> 
> I will apply Su Hui's fix to overlayfs-next.
> It does not seem too urgent though, because setxattr with 0 length
> would probably ignore the invalid value of buf.

I don't know if it's urgent or not, but that explanation doesn't work.
This isn't an inline function.  So the dereference would happen at the
call site and not inside the ovl_check_setxattr() function.

regards,
dan carpenter

