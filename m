Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113D1FBE;
	Mon, 14 Nov 2022 08:23:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id i21so16131408edj.10;
        Mon, 14 Nov 2022 00:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5NyLkbWhfILIE8EtOAuuezNl1T8bvwtCVKCJ8eXTs0o=;
        b=hnFXmWq3yQsFaDDQ6qEyLXq09hP95wiTzJQi37WwBYJ41e1T+R/+x2rzSjD8wqEPer
         GtPvD1l8+2+6a7FeuBz72Rdop02QrmK36zSxWjoLPadTMTBLtRArs7d55263G7gFza/R
         rEE5bsD7l2TCooLq4A0oNHqrS1zCWHGF4VNEJ9PRoCQn1kw/BCXJdI4XZ7AYFQRD/Sj/
         XGgbE4pfNsxhb47y0q4IWeQnMluiNpTkK2SIw9Jsw/8zk7/Z31K4j5T2RS4K8Yb64OGh
         aQKU8Gv2rqzRIuTSk1G8WHX63ssbV3xRDEnI8+tZ2JZvsXgL4OvrrICA4EzbkiMiUggF
         Hgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NyLkbWhfILIE8EtOAuuezNl1T8bvwtCVKCJ8eXTs0o=;
        b=x6dGH0OZUUwe1sJ3eOO7t9fbadpKqczEaEP9VdBB37/gEdVgOoOF4lg1CUvsPig2tS
         T+Up1XA4WzfmP3zsfQBJVXI70bN8CXlcVv+dSmGntF0nrpw2iMviv5E1CW8DiboQE3CS
         usMSAZX5IR3VVUo2pjEVmokSX2JGc7fZRK0ydxVA6Dw5GHerrx6JiP3gKMiAivBhH+In
         MGTGnOg5c75XEZiAbQ31hnnohPgp3TW5rgzVV4SFQXADQ2KppO6BmJkcV7U+4ywTVuWE
         ctCVeszN27/vuPWIO2aiT8POJVsUJF0G+bIjiHP0bbd6vVTXcVDjabhdiNElJaOF+gSh
         78aA==
X-Gm-Message-State: ANoB5plEE2jW9lP96xv1+KO811dpQ13vdSdAiBTB7SPCBXPRCgG+D1gP
	/srAJIlE+ZK6cs+2NDfuSEU=
X-Google-Smtp-Source: AA0mqf5YMt/EOrdzTjQgsblTwHC9S1V8gvRBZUxIbGAK0AkHWzI8eTpcBMyqmU691oRviIvs8IFf2A==
X-Received: by 2002:aa7:de88:0:b0:458:b42e:46e6 with SMTP id j8-20020aa7de88000000b00458b42e46e6mr10426885edv.375.1668414215273;
        Mon, 14 Nov 2022 00:23:35 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b3-20020a170906728300b007a559542fcfsm3850643ejl.70.2022.11.14.00.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:23:34 -0800 (PST)
Date: Mon, 14 Nov 2022 11:23:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild@lists.linux.dev, Qais Yousef <qais.yousef@arm.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip:sched/core 3/19] kernel/sched/fair.c:7263
 find_energy_efficient_cpu() error: uninitialized symbol 'util_min'.
Message-ID: <Y3H7AcgnGMq5p+nn@kadam>
References: <202211121723.P4V3w801-lkp@intel.com>
 <20221112174705.pymjyzr4nqhkqfoc@airbuntu>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221112174705.pymjyzr4nqhkqfoc@airbuntu>

On Sat, Nov 12, 2022 at 05:47:05PM +0000, Qais Yousef wrote:
> On 11/12/22 13:16, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> > head:   52b33d87b9197c51e8ffdc61873739d90dd0a16f
> > commit: 244226035a1f9b2b6c326e55ae5188fab4f428cb [3/19] sched/uclamp: Fix fits_capacity() check in feec()
> > config: riscv-randconfig-m031-20221111
> > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > 
> > smatch warnings:
> > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_min'.
> > kernel/sched/fair.c:7263 find_energy_efficient_cpu() error: uninitialized symbol 'util_max'.
> > 
> > vim +/util_min +7263 kernel/sched/fair.c
> 
> [...]
> 
> > util_min/max not initialized if uclamp_is_used() is false.  (I thought
> > I had reported this earlier but I don't see it on vger).
> 
> Thanks Dan!
> 
> It's harmless since util_min/max are ignored in util_fits_cpu() too;
> uclamp_is_used() is checked there as well.
> 
> I couldn't reproduce, I need to get GCC 12.1.0, but the below ought to cure it.
> Let me test it a bit more and send a patch.

In that case it's fine.  This is inlined.  I guess, generally, we are
going to only consider passing uninitialized variables to functions as
bugs when the functions are not inlined.  I believe that one of the
KMsan things will trigger a warning at runtime for this as well but it's
the same situation, where it's considered a false positive because it's
inlined.  (Technically it's undefined behavior either way according to
the C standard, but the standard is sometimes useless).

It's not a GCC warning, it's from Smatch.

GCC uninitialized warnings were disabled by defualt because they have
too many false positives.  Use "make W=2" to enable them.  GCC will
complain.

regards,
dan carpenter

