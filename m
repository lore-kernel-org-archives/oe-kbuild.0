Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6D1C2E5
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 08:07:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so6690905e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 27 Jul 2023 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690445222; x=1691050022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9FYxBpzPpC5O6YqpkIvrfnMVqesGcNf08sa9kAENUdY=;
        b=DPHqd4jJ4aCJ/ldSJMSi2jpGa9mD88lGm346gmWtivG/pxsYPMaWip1zoYbH/a4coT
         1u6SknFx4FWBaUj+1vMwJ0oZicCLV8K9PG7TQkgYkxQyICErAjNTPFvGWLAh8lWw6dpY
         q+i1F4j2Lf4KXij+sw2p6q2WkpVclXZTptS/Vr7lgFgU8IJs+YeRZair63x655FFyIBR
         ScsonJm1JrPcdavl7kjoD49RAbj77BQVPfADOUA8GYdLyC88Ie3tCCgUJKFBVfxWjBLR
         FibTVEScPEX8iUoEtf3jR3zNd61RhU4cxrNaGtBGbfjpcE8O8saA1d41XdwB/xiGsrZZ
         1SLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690445222; x=1691050022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FYxBpzPpC5O6YqpkIvrfnMVqesGcNf08sa9kAENUdY=;
        b=BnpPUlrkv6p6KrRXM6dM+Ks8jUxeg3ACKm5Fgiit2aL03aqH2ydiy8YeIEYgpbJFUV
         ss9wHgQKMoy3Di5DMbRV11LphTDJDQyhiU8JNDGBsAr9fhELscosShQeO9EJpgBo/gjd
         POVCEVf10zAwkQlMkPmNfZ/Vtr1O05R0/46nemgXMeBQfh/uTh3u8VIqcDjbztIBBobm
         JEAaPO6fSGReTz2d6Opzu9Xt511TrYRmaGIz8sVFS3lm26Mkt0v0XI9V09EmFikItInY
         5HTG7+15MvGYIzR+/mQgoTBLxKFmjPwe+96g6iDWt2rm0fEkeuXNzlhWBi/pri3qR+UN
         gmyA==
X-Gm-Message-State: ABy/qLYM75ak9IJxolAQYbv9938xoKNAA2DfA8TuB+4xQ9coQ04voRIX
	FL2Z+AEYCKou3nWsssTrM6dtZRJV/Hyoe5DnuhL2ew==
X-Google-Smtp-Source: APBJJlESVm3o8EnthSnO0wSdv89jxTgM1e60N2vrTcCIowIo43OPkYeplR8UZwVzk03vqs4NZslRBGLk21TmdRmjyEM=
X-Received: by 2002:a05:600c:ad6:b0:3fc:2dfb:3cd3 with SMTP id
 c22-20020a05600c0ad600b003fc2dfb3cd3mr1012433wmr.41.1690445222226; Thu, 27
 Jul 2023 01:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <9e72b7ea-9598-415d-bc55-f2f42b7fcb3b@kadam.mountain>
In-Reply-To: <9e72b7ea-9598-415d-bc55-f2f42b7fcb3b@kadam.mountain>
From: Marco Elver <elver@google.com>
Date: Thu, 27 Jul 2023 10:06:25 +0200
Message-ID: <CANpmjNMWqcseZAijhVP_TDORXxBTgj0GWbTzq5ive2e+0Xto+A@mail.gmail.com>
Subject: Re: mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here
 instead of GFP_KERNEL?
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Helge Deller <deller@gmx.de>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jul 2023 at 06:51, Dan Carpenter <dan.carpenter@linaro.org> wrote:
[...]
> smatch warnings:
> mm/kfence/kfence_test.c:287 test_alloc() warn: use 'gfp' here instead of GFP_KERNEL?
>
> (Just included these for the LOLs)
> mm/kfence/kfence_test.c:395 test_double_free() error: double free of 'expect.addr'
> mm/kfence/kfence_test.c:671 test_memcache_typesafe_by_rcu() error: dereferencing freed memory 'expect.addr'

Nice! ;-)

> vim +/gfp +287 mm/kfence/kfence_test.c
>
[...]
> bc8fbc5f305aec Marco Elver     2021-02-25  278          do {
> bc8fbc5f305aec Marco Elver     2021-02-25  279                  if (test_cache)
> bc8fbc5f305aec Marco Elver     2021-02-25  280                          alloc = kmem_cache_alloc(test_cache, gfp);
> bc8fbc5f305aec Marco Elver     2021-02-25  281                  else
> bc8fbc5f305aec Marco Elver     2021-02-25  282                          alloc = kmalloc(size, gfp);
>                                                                                               ^^^
>
> bc8fbc5f305aec Marco Elver     2021-02-25  283
> bc8fbc5f305aec Marco Elver     2021-02-25  284                  if (is_kfence_address(alloc)) {
> 8dae0cfed57357 Vlastimil Babka 2021-11-03  285                          struct slab *slab = virt_to_slab(alloc);
> 588c7fa022d7b2 Hyeonggon Yoo   2021-06-28  286                          struct kmem_cache *s = test_cache ?:
> 588c7fa022d7b2 Hyeonggon Yoo   2021-06-28 @287                                          kmalloc_caches[kmalloc_type(GFP_KERNEL)][__kmalloc_index(size, false)];
>                                                                                                                     ^^^^^^^^^^
> I feel like using gfp might be correct but I'm not sure?  This code
> is from prior to this commit.  Let's add Marco to the CC.

It's not a bug today: If we were testing something other than
GFP_KERNEL, then yes, we should use gfp here. But the only reason
"gfp" is a function arg at all, is that 1 test case also uses
__GFP_ZERO, but that's irrelevant in getting the kmalloc type (at
least today).

The cache is used to test the below "helpers return the right values
even for KFENCE objects".

I think when I wrote the test I just chose GFP_KERNEL, because none of
the test cases use something else, and didn't give it a second
thought. Not sure it's worth changing, because functionally it doesn't
matter.

I'm open to changing it, if it makes this warning go away. Preferences?

> bc8fbc5f305aec Marco Elver     2021-02-25  288
> bc8fbc5f305aec Marco Elver     2021-02-25  289                          /*
> bc8fbc5f305aec Marco Elver     2021-02-25  290                           * Verify that various helpers return the right values
> bc8fbc5f305aec Marco Elver     2021-02-25  291                           * even for KFENCE objects; these are required so that
> bc8fbc5f305aec Marco Elver     2021-02-25  292                           * memcg accounting works correctly.
> bc8fbc5f305aec Marco Elver     2021-02-25  293                           */
> 8dae0cfed57357 Vlastimil Babka 2021-11-03  294                          KUNIT_EXPECT_EQ(test, obj_to_index(s, slab, alloc), 0U);
> 8dae0cfed57357 Vlastimil Babka 2021-11-03  295                          KUNIT_EXPECT_EQ(test, objs_per_slab(s, slab), 1);
