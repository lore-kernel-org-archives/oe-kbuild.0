Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58184A490;
	Thu, 10 Nov 2022 15:33:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso4412850wmb.0;
        Thu, 10 Nov 2022 07:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zeYphl7lBZ5hIGppp1mwTv7T3IKyvqmSt3rYHk9f3fw=;
        b=gAowFuVLueyw4SHm/QaYWTWVZ4odtRKR5jvqIDjxpxfIqk9hMSdwdEqa9SDiciIGpZ
         o7DC478k1f0CBa/hzEmHsK6PILrXn7N+/fc/Qj3p7Qm1qJjvl42l9jlv8z99OT8wteyz
         pY05c8fgA1PusoUagg7K0HJ+28pK385L13H9BV/jXxSeJLUa7Cuue//H/8zkxERyfjgG
         vu3XXVIBxSh7H/f6cePqFokGm7X8B10A4cGllbvIkpTaIE/w3JF8cBh/XPSf8gp/QWtA
         qisQzrRErnBrh6LwLqwhrg78ICm5q+U/YMOTaTiCgp54UUpd0bJiQiFiEg8ulo4Ay6pA
         8r0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeYphl7lBZ5hIGppp1mwTv7T3IKyvqmSt3rYHk9f3fw=;
        b=DvI8gxklT4x2fojrto2P7KwJwgYmQe1NA/tQHy8R/AA5ziSNCU1K5H0Cad1taSQmIp
         DlU9kjCHwwetrmm0r8t9qd0EI2bH7PVMD8sdCMzPrrQeBsNruD/tz9q12JWr5rpMzInE
         H9lwXZRXvWSEYQyj3/zfBdm614LtMt1FMvtc9hwck1fKfYSVhZw2Ss9Jncde/Cqv5ln2
         11odoMEheYB7NibajIR5ZJKlwxurlhEx9DbD06ljD9GOHi2z62Ty3/yNeyaaa3qBjZlo
         oWQEfIuhOXEZe/muJzvGUmk8CYX97INPj3hpmuB/BJTvk9dFB4MlxdHNHE1JWTKp6UAq
         NALg==
X-Gm-Message-State: ANoB5pkIGONyw/oR4sMmwa+zlsyKruXWS56mM1Vn23oNt3uwDGf9ItWx
	E/s1aHERr11IsoNSTpL+jWQ=
X-Google-Smtp-Source: AA0mqf4VYQCyZ+IsRLoL152scLLasmY1W9nrn0BwQ2/PBVIML30CIO12/OThHIdIV2JhN/DXCnbz2Q==
X-Received: by 2002:a05:600c:13c5:b0:3cf:a972:d809 with SMTP id e5-20020a05600c13c500b003cfa972d809mr15147141wmg.122.1668094416356;
        Thu, 10 Nov 2022 07:33:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bj19-20020a0560001e1300b002302dc43d77sm16639575wrb.115.2022.11.10.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:33:35 -0800 (PST)
Date: Thu, 10 Nov 2022 18:33:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [sailus-media-tree:master 17/47]
 drivers/media/i2c/st-vgxy61.c:891 vgxy61_apply_gpiox_strobe_mode() warn:
 impossible condition '(reg < 0) => (0-u16max < 0)'
Message-ID: <Y20ZzOkfAov8KoHU@kadam>
References: <202211091255.jCcREh11-lkp@intel.com>
 <fcb1fc9c-df59-aefd-93f7-9acd2df44f91@foss.st.com>
 <Y2z4n8b+tEtzNR/4@kadam>
 <Y20ErxBkDVVGzYim@kadam>
 <Y20FWdCTPiKWOdNd@kadam>
 <2cb3af44-8624-ded7-a904-5261f619f436@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb3af44-8624-ded7-a904-5261f619f436@foss.st.com>

On Thu, Nov 10, 2022 at 04:04:34PM +0100, Benjamin MUGNIER wrote:
> On 11/10/22 15:06, Dan Carpenter wrote:
> > On Thu, Nov 10, 2022 at 05:03:27PM +0300, Dan Carpenter wrote:
> >> On Thu, Nov 10, 2022 at 04:11:59PM +0300, Dan Carpenter wrote:
> >>> On Thu, Nov 10, 2022 at 12:43:30PM +0100, Benjamin MUGNIER wrote:
> >>>> After running smatch on my tree I couldn't reproduce this warning:
> >>>>   warn: pm_runtime_get_sync() also returns 1 on success
> >>>> I'm using the latest smatch cloned from github. Do you append some
> >>>> options to kchecker to get this output ?
> >>>
> >>> TL;DR: Thanks for the report!  I will fix it later this week.
> >>>
> >>
> >> [ snip ]
> >>
> >>> It creates a fake environment to test what !ret means
> >>> for uninitialized variables.  The check_pm_runtime_get_sync.c check sees
> >>> the "!ret" condition and says, "Nope.  That's supposed to be "ret < 0"".
> >>>
> >>> Smatch shouldn't be printing warnings from inside the fake environment.
> >>
> >> Nope.  That's not it...  It already has code to not print from a fake
> >> environment (unless you're in debug mode).  It's a mystery how the
> >> kbuild bot triggered this warning.
> >>
> >> :(
> > 
> > Ah...  Seeing your patch helped me figure it out.  The kbuild bot does
> > not have the cross function db built so when it sees:
> > 
> > 	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);
> > 
> > Then it doesn't see that "ret" is modified.  On my system I have the
> > DB so I don't see the warning.
> 
> I also have the DB, so that explains why.
> 
> However, 'vgxy61_write_reg' does not always modify 'ret'. In fact it's
> worse, at the beginning it checks if it not 0 in 'vgxy61_write_multiple'
> and returns if it's not:
>   if (err && *err)
>     return *err;
> with 'err' being an alias to 'ret'.
> 
> I did this to avoid checking all my i2c writes. I just send a bunch of
> them and check the return code at the end. But if one i2c write fails,
> 'err' is filled and all following writes are aborted due to the code above.

Yeah.  I could have written the way you are saying but the way it's
working now is the Correct Way[tm].  ;)

> 
> To summarize: if 'pm_runtime_get_sync' ever returned 1, no i2c write was
> performed. That's why I needed to set 'ret' to 0 in my patch.
> 
> 
> The warning spared me from debugging this, thanks a lot.

Yep.  It's like a stopped watch which is correct by mistake.

> Could this warning be produced even with having the DB?

The problem is that there isn't a way to tell whether "if (ret < 0) " is
intentional or not.  I've actually modified it now to warn about that so
I'll look at those tomorrow and hand audit them.  But I'm not optimistic
that there is a way to tell bugs from features in this case.

regards,
dan carpenter

