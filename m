Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976621347
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2LTb7If"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e9e5c97e1so453610e87.0
        for <oe-kbuild@lists.linux.dev>; Thu, 04 Jan 2024 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704368290; x=1704973090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aSj2Wvbjbi5E5bDKrVHlCSPZkdk0j/7KkRsBSDvxsw=;
        b=j2LTb7IfOoMc8/3V6i6r2fJz4Q9T8/OA4ndDkb7GQSlss3X8VzGD3IPU+TyR0EIyz1
         OBeTNdxJ9Laxo+Nwk07eGg5QJisMAdJB6jbk6G7CF6MUqiuotEC6+CC1hoYtTgbZJs78
         fwlikzrUchecww33Q6nh17KAU0myMtsFv1AsSgWEcZJsPOaud1wmKBl3xNFXJUq4hM17
         Smr5iWfrjbS7a+EyHsW4zf/3SHpBgwS1CkRaGSje/mFiZdTcuqXJgTl+MA3+93Ozwvqa
         MWo0adpd3BBPuCrG4pjDq/eluEIkEXfTQajkDoyv9Jpn/nSMB8457eOxuIbLIas8kZv/
         dEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368290; x=1704973090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aSj2Wvbjbi5E5bDKrVHlCSPZkdk0j/7KkRsBSDvxsw=;
        b=rs0ACL+JgSRm6TloXNDSZsfekNE5wFGv22pHC7In2XKK7VBGEJ6uSW4zMXgJXg2EzD
         PG2lsC5mcWo5KHYj3Xn0VMwthgpV63SfipPIF9E6ClEXtNUX+ZCVTAY2ADrAcBUIXpPB
         Y93RPvQh0dKEFXPIdb2OlA8zGLX1Pg0zTSzmu93JPdGkiwfeIS9ELwQS8UQlz6wIs/d2
         dCpl2+YlvpZKNr3iBpl1YRTYRaOZN52MlWVNK9MHX/zHzbUDOEbvgOE5YnS1d64JvJ7q
         gpTFuSKngnWYf/ChW6YHvkXnUnGNxnRzAm4RA0+7tcp8w6FQn49OqiIiMSv1zDSCJ7zf
         s1bw==
X-Gm-Message-State: AOJu0YxPg4EZrZSpbsZkj85dj54+4QOjVK46gfUmbAIVcyBwodLWpK/P
	6hXTB1HY2qIIKZoyjoUsy4B6me/KiNHeRg==
X-Google-Smtp-Source: AGHT+IEvl/qWWM+TJNFvW9USIRn2xPrQUlGgqQcM8IEfQZNkvJzxQiI8+wx96bRXJq5GGPpxXAf35w==
X-Received: by 2002:a05:6512:3050:b0:50e:7718:d4b8 with SMTP id b16-20020a056512305000b0050e7718d4b8mr319633lfb.96.1704368289559;
        Thu, 04 Jan 2024 03:38:09 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id zz16-20020a170907351000b00a26e0236191sm10694696ejb.208.2024.01.04.03.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 03:38:09 -0800 (PST)
Date: Thu, 4 Jan 2024 14:38:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Airlie <airlied@gmail.com>
Cc: oe-kbuild@lists.linux.dev, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
Message-ID: <da677c9a-1863-4ee7-904f-5226276c4102@moroto.mountain>
References: <20231222043308.3090089-9-airlied@gmail.com>
 <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
 <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>

On Thu, Jan 04, 2024 at 10:41:50AM +1000, Dave Airlie wrote:
> On Thu, 4 Jan 2024 at 00:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Dave,
> >
> > kernel test robot noticed the following build warnings:
> >
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
> > patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
> > config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
> > compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/
> 
> This is a false positive, I think the code is operating like I'd
> expect, we maybe could restructure it to avoid this warning?
> 
> The idea is you send an rpc msg, if there's a reply you get a reply,
> if no reply you get NULL and if an error you get an error.
> 
> So in the case you get an error or NULL you just want to return 0 for
> the NULL as it's successful, and error otherwise.
> 
> Would using PTR_ERR_OR_ZERO make smatch happy? (even if it's not
> really what we want).

Hm...  You're using the API correctly.  Linus has complained about this
warning before but in new code over 90% of the warnings are correct.
It's a high quality warning.

I looked around for an explanation to see what the NULL meant but
couldn't find it documented in the code.  The NULL vs error pointer comes
from a function pointer and it's not always clear where the
documentation should be with a function pointer.  So perhaps I missed it.

Let's not use PTR_ERR_OR_ZERO.  Perhaps I should introduce a
PTR_ERR_OR_NULL() macro to silence this warning.  But most of the code
which does this correctly is in fs/ and they probably are like Linus and
would be surprised to learn that people get it wrong...

regards,
dan carpenter

