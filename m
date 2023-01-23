Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9133C0;
	Mon, 23 Jan 2023 15:47:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g10so9372741wmo.1;
        Mon, 23 Jan 2023 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2xgEEjXrW2lbu5MpNlLjABQ+7E1/MT4wNU2nwaef9vI=;
        b=Kt3pT582myGeFi/97kQnKAexk3ywU6roMYBJ2ygVFJim8h+xpOVfdaO41qjzhtJ0Sz
         zvqhzMxr9C42+GQke42JlIhYWKctrUdtalMd65GrY4/utVq6xQXZAd/hoSQDkQmwKIFZ
         ihEsobREny3WwDAGu2uksDeQNm7veEaO1C3ep33lBj2ZsP7Lv12JhhQ+pcfwwpabeEwW
         2RK9g+W+DZLr4PGXF1K/gHYe1lG/Xmu4466x+QsZVfGzA8sqonBZr4FIhCeyDflhrLtI
         BLcZJWM5PJfIkKmeMM4+voe7yc3FM/Wpx7QfoxtRNmusmuiBERHEgSNQ/J8E68Ya51O2
         8Q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xgEEjXrW2lbu5MpNlLjABQ+7E1/MT4wNU2nwaef9vI=;
        b=RGmMHDwqV+OUzryRiEqXzXZf3mL8WCKluCuxVBN6Ew0VB4XbnFuCrPMQo9EZDVyddX
         vfXh1bSbu98eGknChfLPJQ69DwiM70Fv1QSVf50HS+tXTtebTFK1EsLjfFlVk8xjv3fv
         xCRtiQi0kF4JUzyCLVhcU6/zIoZGy03kcUBGwBKUGXUgnWoFzgCqHED469Mgv3wJmczu
         QcjdsAtMy4iV8aZPAuIOeuU1Y8IhCTjCqjzRzxBLNwOVm7SJyz6ozrJndChNA5RGSBBG
         E5z6htav+NippgN5ujwBKKVK1/6exyxomvVQw6D3yPFNIJfyH2l74nG6F8f4mWWlzCg6
         w/Ug==
X-Gm-Message-State: AFqh2koCYnQeJGLxDt6PpAo3rvx8apARCdCXAKAKTKnbzBJY78WmnUs6
	gtQfzUnNtT5y0+8u6Ds5iaQ=
X-Google-Smtp-Source: AMrXdXt0Nm3pTHNspcprTRWX8uHoMzHpbZY5sB9M/E2IPudxPwZTsKYcte6yCvHiQbF6uESqJuuj1w==
X-Received: by 2002:a05:600c:35c1:b0:3db:1424:e781 with SMTP id r1-20020a05600c35c100b003db1424e781mr19349102wmq.23.1674488820252;
        Mon, 23 Jan 2023 07:47:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b003c6f8d30e40sm12223314wmq.31.2023.01.23.07.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:46:59 -0800 (PST)
Date: Mon, 23 Jan 2023 18:46:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:x86/core 3/3] arch/x86/kernel/static_call.c:98
 __static_call_transform() error: uninitialized symbol 'op'.
Message-ID: <Y86r8GaOYdvGlPq9@kadam>
References: <Y853bqEhA5NDC3Ar@kadam>
 <Y86maRy5ILlUBo/9@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y86maRy5ILlUBo/9@hirez.programming.kicks-ass.net>

On Mon, Jan 23, 2023 at 04:23:21PM +0100, Peter Zijlstra wrote:
> On Mon, Jan 23, 2023 at 03:02:54PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
> > head:   700f4c6d925823018a2d09f92de5405065d2ffec
> > commit: 700f4c6d925823018a2d09f92de5405065d2ffec [3/3] x86/static_call: Add support for Jcc tail-calls
> > config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230121/202301211834.noGVyk06-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > arch/x86/kernel/static_call.c:98 __static_call_transform() error: uninitialized symbol 'op'.
> > 
> > vim +/op +98 arch/x86/kernel/static_call.c
> > 
> > c27c753ea6fd12 Thomas Gleixner 2022-07-12   53  static void __ref __static_call_transform(void *insn, enum insn_type type,
> > c27c753ea6fd12 Thomas Gleixner 2022-07-12   54  					  void *func, bool modinit)
> > e6d6c071f22de2 Josh Poimboeuf  2020-08-18   55  {
> > 3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   56  	const void *emulate = NULL;
> > 452cddbff74b6a Peter Zijlstra  2020-08-18   57  	int size = CALL_INSN_SIZE;
> > 452cddbff74b6a Peter Zijlstra  2020-08-18   58  	const void *code;
> > 700f4c6d925823 Peter Zijlstra  2023-01-20   59  	u8 op, buf[6];
> > 700f4c6d925823 Peter Zijlstra  2023-01-20   60  
> > 700f4c6d925823 Peter Zijlstra  2023-01-20   61  	if ((type == JMP || type == RET) && (op = __is_Jcc(insn)))
> > 700f4c6d925823 Peter Zijlstra  2023-01-20   62  		type = JCC;
> > 
> > Smatch is concerned that type can start as "JCC".
> 
> It can't. What's the normal way to shut this kind of warnings up?
> 
> Something like BUG_ON(type==JCC); should squash that value I suppose,
> but it does seems a bit crude.

We could just ignore it.  These are one time only emails.

This code hasn't hit linux-next yet, so I don't have it on my system.
It may be that using the cross function DB silences the warning.

regards,
dan carpenter

