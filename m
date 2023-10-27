Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDC1A703
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3kNf2gb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso15184415e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Oct 2023 05:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698409646; x=1699014446; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShpExnipWNoGHM8TmERMpEvZiu9LbbtWo0359LRRBpg=;
        b=q3kNf2gbMj4XPcyMzYsPTcgTxsOpXCZxpRFYaX+PIEIAzGxBNQh+BNqP2L7ALNnESN
         NAFPG2wFLnPKKssuwnch/GF+DjIwY89yh7MHyb3FlFXHMkTTWKBzIMkN4LxTbsqkeOB/
         oNsWFnRH96aWwgLIXdwoKM0nRZwYA4U6DBdrCmtCt93QEjOCfmF1LrgbiX42M7Ar+XjA
         2rYD6+9O3MA0mRB7bQNAFtgnbD1mt9taauucYWap3Mz/JP0Lpv1G7u8y/aYni3BHSHZ2
         Ykycw4bJahQhkYlwaAMoNqBnyaNAHBSMcqgxolgA3BRPV73s1QZ3wfiISfongC+rkwxe
         xabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409646; x=1699014446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShpExnipWNoGHM8TmERMpEvZiu9LbbtWo0359LRRBpg=;
        b=ic82zFnMRhvUPq3i/xUDBG6HltlkZrkNNLAou9BOX8QbQ5aiydtN19ZMPyQqv03L6R
         DihBr0NDvWZdN7VRKgpFq8pRxw5IUdxNzPgaHvRLiQYLr4rxrpkokC9HRzDdnLEo1emc
         AY8csSVG853uJeHnXyjtEK/e+zvRtGshwbz/4OhrFh8Dqf/URogSx8azgC3zEqKU7v90
         +GoUnvzLymiOOAYZixDX7w7Ebkk/RQfB+vuyDDeiAN0nuRX6sMjFoz6K/cH/OAjB3AcB
         l0z07bm68hK8iLKy+lHh4X+QVzsapdxm8rXuxFaSxSkD/eavcTokcbh4mu5WwKQgHO1n
         ICCg==
X-Gm-Message-State: AOJu0Yy++nZAMmYGSdzhMqTnFnG3hZBiivagXjos5ZXj6C5RfX8WZy7G
	JC9SwJ/A75yOhsUpcR+B4qZ5a4apwoJxM9iKROk=
X-Google-Smtp-Source: AGHT+IGePza+z4TfX66FZcDIf8/JNx8JVqKKHGbjY0Df9benTN6EIO45xrAYlVcVOsPga6unZ62FpA==
X-Received: by 2002:a05:600c:474f:b0:405:359a:c965 with SMTP id w15-20020a05600c474f00b00405359ac965mr2195472wmo.4.1698409645782;
        Fri, 27 Oct 2023 05:27:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b00401d8181f8bsm4981081wmn.25.2023.10.27.05.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:27:25 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:27:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Joey Jiao <quic_jiangenj@quicinc.com>,
	linux-modules@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, quic_likaid@quicinc.com,
	Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] module: Add CONFIG_MODULE_DISABLE_INIT_FREE option
Message-ID: <a57e4eb8-329b-4503-bcd8-892ef44d8194@kadam.mountain>
References: <20231013062711.28852-1-quic_jiangenj@quicinc.com>
 <b2b20956-d80e-462c-8261-a41802996197@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2b20956-d80e-462c-8261-a41802996197@kadam.mountain>

On Fri, Oct 27, 2023 at 03:00:00PM +0300, Dan Carpenter wrote:
> 607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2579  #ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> 607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2580  	/* .BTF is not SHF_ALLOC and will get removed, so sanitize pointer */
> 607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2581  	mod->btf_data = NULL;
> 607c543f939d8c kernel/module.c      Andrii Nakryiko  2020-11-20  2582  #endif
> c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2583  	/*
> c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2584  	 * We want to free module_init, but be aware that kallsyms may be
> 0be964be0d4508 kernel/module.c      Peter Zijlstra   2015-05-27  2585  	 * walking this with preempt disabled.  In all the failure paths, we
> cb2f55369d3a9e kernel/module.c      Paul E. McKenney 2018-11-06  2586  	 * call synchronize_rcu(), but we don't want to slow down the success
> 1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2587  	 * path. module_memfree() cannot be called in an interrupt, so do the
> 1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2588  	 * work and call synchronize_rcu() in a work queue.
> 1a7b7d9220819a kernel/module.c      Rick Edgecombe   2019-04-25  2589  	 *
> ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2590  	 * Note that module_alloc() on most architectures creates W+X page
> ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2591  	 * mappings which won't be cleaned up until do_free_init() runs.  Any
> ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2592  	 * code such as mark_rodata_ro() which depends on those mappings to
> ae646f0b9ca135 kernel/module.c      Jeffrey Hugo     2018-05-11  2593  	 * be cleaned up needs to sync with the queued work - ie
> cb2f55369d3a9e kernel/module.c      Paul E. McKenney 2018-11-06  2594  	 * rcu_barrier()
> c749637909eea5 kernel/module.c      Rusty Russell    2015-01-20  2595  	 */
> 36022a47582048 kernel/module/main.c Joey Jiao        2023-10-13  2596  	if (!IS_ENABLED(CONFIG_MODULE_DISABLE_INIT_FREE) &&
> 36022a47582048 kernel/module/main.c Joey Jiao        2023-10-13  2597  	    llist_add(&freeinit->node, &init_free_list))
> 
> Let's not allocate freeinit if CONFIG_MODULE_DISABLE_INIT_FREE is not
> enabled.

Wait.  It's the other way around actually.  freeinit isn't used if
CONFIG_MODULE_DISABLE_INIT_FREE is enabled.

regards,
dan carpenter

