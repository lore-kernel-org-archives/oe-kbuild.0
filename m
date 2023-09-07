Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE63568E
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Sep 2023 11:47:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31c7912416bso968094f8f.1
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Sep 2023 04:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694087243; x=1694692043; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rd3g14aq0Z17dL7uhkaawHdoYkXsMOdf9lkrn2VBQN8=;
        b=dYQBMhkFT0RxardBGaxIm6U5QS4rShkoBaGMeSNKqBUrVC9SA/sNCrYc7hSSQzi7Du
         7YxguFBbn77cH1ONlYnh6mCo2/HW9t3tU3g+UK6HMcIwMOWGeAuHQxYI6wAEgsOKTMkS
         BueTB9+8h428ZR4m+wtnIlWe4LrgXHancZsOhuabbu+WEnKSuhg8KKCBsmH5acTw4+UF
         Jg66N2XOgYI6jbghwm2S2Z/eT56CdhWZ2iSrPpRuQXFCFaXVzXtNF3bYZqV8ugc3DYy3
         kDleqTTiHymIExsa8/R33JazIKKkOuojJ9zZRDiHCUyiKk18z+2LBlUT+qNwRcdFO+P2
         3CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694087243; x=1694692043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd3g14aq0Z17dL7uhkaawHdoYkXsMOdf9lkrn2VBQN8=;
        b=QRwLNrj4GZuW7HiUye+n2pcKPDKlEWVnwlCGTkQtiLjYAF5OB30x0QWLN9dJbgjgvI
         hIq+9YIU5fACXgtpNSJGb8MqgyiHy9ctI6ZuJv5Jc8E5mpbv5uEtd81ibu7+qhzt6spm
         rJabzuM6z/3NHrN8uUhRnMOgjMab9jsGrqZm7GA2cVB1voCcyVqwhXm26AOmAGwLOul2
         RUi7snDyFlaXFKA2oOYO+hRYsNpo313d88jpKZAhMEenRnax1bfinlB0oxEqefI4I+e8
         3wSVYjgeWtuLqLC4jZCr9JQspJ6eVFLu/sbbvZh5+1XtLxJZfCb4RO7c668EY7PVpi8M
         Qc7A==
X-Gm-Message-State: AOJu0Yx/OJFo01sBfIc7RZZirjGs4x3DgG+GHhDrAIVYyd+1s9z/klK+
	JTWvRPBP96XC6bufF0wkwRKGiA==
X-Google-Smtp-Source: AGHT+IGglI0RO6vx8D5x0p1s9L/ra8iOSpCNNTG2ytt6fbbSiSjyPJglvq7Yl3BORRm775/WPHbEig==
X-Received: by 2002:adf:f749:0:b0:314:748:d59d with SMTP id z9-20020adff749000000b003140748d59dmr4553606wrp.27.1694087243431;
        Thu, 07 Sep 2023 04:47:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bp5-20020a5d5a85000000b0031f07d1edbcsm20553045wrb.77.2023.09.07.04.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:47:23 -0700 (PDT)
Date: Thu, 7 Sep 2023 14:47:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild@lists.linux.dev, Rob Herring <robh@kernel.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: drivers/of/dynamic.c:935 of_changeset_action() warn: possible
 memory leak of 'ce'
Message-ID: <e902e684-5953-4e71-82b3-28166666bc6d@kadam.mountain>
References: <eaa86211-436d-445b-80bd-84cea5745b5a@kadam.mountain>
 <CAMuHMdUgTKfk0DdzS1ZtKuij1NE-nTEBdgnnS0o2uy8RbtagmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUgTKfk0DdzS1ZtKuij1NE-nTEBdgnnS0o2uy8RbtagmQ@mail.gmail.com>

On Thu, Sep 07, 2023 at 01:30:09PM +0200, Geert Uytterhoeven wrote:
> Hi Dan,
> 
> On Thu, Sep 7, 2023 at 12:52 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   99d99825fc075fd24b60cc9cf0fb1e20b9c16b0f
> > commit: 914d9d831e6126a6e7a92e27fcfaa250671be42c of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
> > config: x86_64-randconfig-161-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230901/202309011059.EOdr4im9-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202309011059.EOdr4im9-lkp@intel.com/
> >
> > smatch warnings:
> > drivers/of/dynamic.c:935 of_changeset_action() warn: possible memory leak of 'ce'
> >
> > vim +/ce +935 drivers/of/dynamic.c
> >
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  925  int of_changeset_action(struct of_changeset *ocs, unsigned long action,
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  926                struct device_node *np, struct property *prop)
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  927  {
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  928        struct of_changeset_entry *ce;
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  929
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  930        ce = kzalloc(sizeof(*ce), GFP_KERNEL);
> > 606ad42aa3b1fe Rob Herring       2016-06-15  931        if (!ce)
> > 201c910bd6898d Pantelis Antoniou 2014-07-04  932                return -ENOMEM;
> > 606ad42aa3b1fe Rob Herring       2016-06-15  933
> > 914d9d831e6126 Rob Herring       2023-08-18  934        if (WARN_ON(action >= ARRAY_SIZE(action_names)))
> > 914d9d831e6126 Rob Herring       2023-08-18 @935                return -EINVAL;
> >
> > No kfree(ce).  Probably we move this check before the kmalloc()?
> 
> Yes, moving up sounds great.
> Care to send a patch?
> 

Sure.  I can do that.

These are zero day bot warnings from Intel.  I normally just look them
over and hit the forward button.  Quite often the zero day bot will find
the warnings before the patch has been apply.  But in this case, it's
simple enough to patch.

regards,
dan carpenter

