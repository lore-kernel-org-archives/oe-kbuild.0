Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FA9248F72
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765464988; cv=none; b=nqYSzvNfwRpNJExGxwm/+2IdjBnsYQh3XP/qB72edjZAiqyYbToXzq5J1TuuQPQmKRhC8hUPaiXiVaUKFShJknghVyHWjdaG2UMHW+ya3ywFfHU7eC3gk0aHSi52ccxIANIHWSf3QO0LSy8t9MRftopNBBcDN//zX587+UmJ8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765464988; c=relaxed/simple;
	bh=4StT57WiSzHu2WNN0vPI02pEHpv8NGUA5IG3gMjLvlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UCu6QcHM/mY8ixwK69xbTsZOvKgti8xHs99CmGtnLW8HVaNy8LbuxIxFkDOujTg8a90dpIG81hgPzeQb4dGXDJivLARyuvauea4DWsKPWDOkq8CMRxc/+V7wuYKTkvkLgNl0AnY9K8Kof/9WDW2h5597fUlLr7yIlx13NeMBrLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4RCA4u2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4RCA4u2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so127544f8f.3
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 06:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765464984; x=1766069784; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0PClchWHQKu2MxTuVa84xvGnmuXYGitevmgouVKhJI4=;
        b=x4RCA4u2DhPYcjfYTsx1G00UW8JR2ptD/NM+x7ak2AWvPhMU1gu4/0KClu6tcYd2xb
         uI9gfJ1bdvamJaqvHSERcwyCbSsSGlgJ3IyVchRHM5IBFfPx0MyE3Geldjl2/gVkZN5D
         xtOwfdXgOfSvBGnpMQFjop5XF44+4M5N+BNtISYDN6Le/NfwrEaVLusEhNW4DmaddJIn
         jKq/UYI+9psrhWbUfU7pnfKQmNV9i3gQoKwI134nNgklOC2auUYt2rQCtZFg59ht1lFw
         mrzKhiNYR19MIvWyS/IMhlxXBpc1pj71Ay/n29UQxxDDnCa6hKMaqCr9bFHX3038wFgT
         U57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765464984; x=1766069784;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PClchWHQKu2MxTuVa84xvGnmuXYGitevmgouVKhJI4=;
        b=POg2j86KJJDIUd9fOImsJ20vVObwVldv9H3RrPdXmqJqk6zTrr5q0WspmNI9x2ruso
         Wb5A2BLH7etUpbrlMRUNNB3ycl2qENpEpEDjvz16m4PHmvL/g6qWCxHvCF/EyMrMFzt0
         Gdync3lnhgQYFbRTBTAE0TgFlkZn4zRwHf1xjONRvRrMEMnHojch3RZ1/nmd3PNeD7CS
         ca83iGxM3lwILSNePWQl4V0q9+rR2AW81yMMn5kRSryxE7a/nf6fzuPVPxVjzRGJbQkM
         VG68Fg5Dtz2wNOiOGEh7pYAmBElEMeptNdPbabel+KX5+l3obdeFH/+toDBNPTAsQdPT
         YXug==
X-Gm-Message-State: AOJu0Yyg/PGC59+Jzieky3dNr3YfYP9pbBClObjLd+01jIeZ8fNPJD+N
	nmOXhe5I+/wvEJs3HzbA0iWBWF2q4ENFENjW5vHNgRwn6zf0/k+M+z71w64V0ZQFwtz8KWomjqF
	WFxpv
X-Gm-Gg: AY/fxX40XbhmfVLLyGbINJFdXL1b5oPg3h0rX3v4VVKj3J8uz5M2wUzPR0IqJRJxD2Y
	Zhf6mPM38gXCMLqNrlwqDElvjUPYR2HOwfbqCAhyz4gWF/AwKFETOL6uBIc9jbsuQiIIgbVgJo+
	6cViU3frOSKmaFENutLPjrRcLlg2G9Hym//KdhHWy7Da4xiFWt/EVTUEW2PpHMwI+t7edEOw+E6
	0PuToMg2tKVWvmNG1IcLOTCaDXMfMn5Y9otnUo/Yaob3Fw9neNyRQXub2/XUIHVTB47GmqO5g24
	W/4Bo66XCb3lWZZXhdeVKi0J/wCs41x339YFle05IEAzR2L98WQUHcxXAEl2urRyBm9lcJWU+pt
	E9Jd4o8pBM6IR2h00EqGx2gdSNVzDqbTZH3q8LCu+QQH5tSFLN9bJtIZNhZeVt+ZFIjyZi6vJiI
	I3S8wvuxNvlxCdHMLV
X-Google-Smtp-Source: AGHT+IGusbO0JoeuC8oJP5v7mG1MiK8mwfhyvHd8p+pXWjuoe2OBL/zILPEnhf86BhqqrWSB05titg==
X-Received: by 2002:a05:6000:2584:b0:42b:3090:2683 with SMTP id ffacd0b85a97d-42fa3b05389mr7574365f8f.53.1765464984091;
        Thu, 11 Dec 2025 06:56:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a950sm6849128f8f.32.2025.12.11.06.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:56:23 -0800 (PST)
Date: Thu, 11 Dec 2025 17:56:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anna Schumaker <anna.schumaker@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Benjamin Coddington <bcodding@redhat.com>
Subject: net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn:
 passing zero to 'PTR_ERR'
Message-ID: <202512112218.13vaWK3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251211145620.H0E8Fk9pOIE48X9JvLJhPFolLFmQMH92NiFGzaEBAXc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: df210d9b0951d714c1668c511ca5c8ff38cf6916 sunrpc: Add a sysfs file for adding a new xprt
config: x86_64-randconfig-161-20251210 (https://download.01.org/0day-ci/archive/20251211/202512112218.13vaWK3b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512112218.13vaWK3b-lkp@intel.com/

New smatch warnings:
net/sunrpc/sysfs.c:343 rpc_sysfs_xprt_switch_add_xprt_store() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +343 net/sunrpc/sysfs.c

df210d9b0951d7 Anna Schumaker 2025-02-07  315  static ssize_t rpc_sysfs_xprt_switch_add_xprt_store(struct kobject *kobj,
df210d9b0951d7 Anna Schumaker 2025-02-07  316  						    struct kobj_attribute *attr,
df210d9b0951d7 Anna Schumaker 2025-02-07  317  						    const char *buf, size_t count)
df210d9b0951d7 Anna Schumaker 2025-02-07  318  {
df210d9b0951d7 Anna Schumaker 2025-02-07  319  	struct rpc_xprt_switch *xprt_switch =
df210d9b0951d7 Anna Schumaker 2025-02-07  320  		rpc_sysfs_xprt_switch_kobj_get_xprt(kobj);
df210d9b0951d7 Anna Schumaker 2025-02-07  321  	struct xprt_create xprt_create_args;
df210d9b0951d7 Anna Schumaker 2025-02-07  322  	struct rpc_xprt *xprt, *new;
df210d9b0951d7 Anna Schumaker 2025-02-07  323  
df210d9b0951d7 Anna Schumaker 2025-02-07  324  	if (!xprt_switch)
df210d9b0951d7 Anna Schumaker 2025-02-07  325  		return 0;
df210d9b0951d7 Anna Schumaker 2025-02-07  326  
df210d9b0951d7 Anna Schumaker 2025-02-07  327  	xprt = rpc_xprt_switch_get_main_xprt(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  328  	if (!xprt)
df210d9b0951d7 Anna Schumaker 2025-02-07  329  		goto out;

I would have expected an error code on this path.

df210d9b0951d7 Anna Schumaker 2025-02-07  330  
df210d9b0951d7 Anna Schumaker 2025-02-07  331  	xprt_create_args.ident = xprt->xprt_class->ident;
df210d9b0951d7 Anna Schumaker 2025-02-07  332  	xprt_create_args.net = xprt->xprt_net;
df210d9b0951d7 Anna Schumaker 2025-02-07  333  	xprt_create_args.dstaddr = (struct sockaddr *)&xprt->addr;
df210d9b0951d7 Anna Schumaker 2025-02-07  334  	xprt_create_args.addrlen = xprt->addrlen;
df210d9b0951d7 Anna Schumaker 2025-02-07  335  	xprt_create_args.servername = xprt->servername;
df210d9b0951d7 Anna Schumaker 2025-02-07  336  	xprt_create_args.bc_xprt = xprt->bc_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  337  	xprt_create_args.xprtsec = xprt->xprtsec;
df210d9b0951d7 Anna Schumaker 2025-02-07  338  	xprt_create_args.connect_timeout = xprt->connect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  339  	xprt_create_args.reconnect_timeout = xprt->max_reconnect_timeout;
df210d9b0951d7 Anna Schumaker 2025-02-07  340  
df210d9b0951d7 Anna Schumaker 2025-02-07  341  	new = xprt_create_transport(&xprt_create_args);
df210d9b0951d7 Anna Schumaker 2025-02-07  342  	if (IS_ERR_OR_NULL(new)) {

xprt_create_transport() can't return NULL so this should really just be:

	if (IS_ERR(new)) {

If you have the cross function database then Smatch ignores this, but
the kbuild-bot doesn't have that so it assumes xprt_create_transport()
can return NULL.

df210d9b0951d7 Anna Schumaker 2025-02-07 @343  		count = PTR_ERR(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  344  		goto out_put_xprt;
df210d9b0951d7 Anna Schumaker 2025-02-07  345  	}
df210d9b0951d7 Anna Schumaker 2025-02-07  346  
df210d9b0951d7 Anna Schumaker 2025-02-07  347  	rpc_xprt_switch_add_xprt(xprt_switch, new);
df210d9b0951d7 Anna Schumaker 2025-02-07  348  	xprt_put(new);
df210d9b0951d7 Anna Schumaker 2025-02-07  349  
df210d9b0951d7 Anna Schumaker 2025-02-07  350  out_put_xprt:
df210d9b0951d7 Anna Schumaker 2025-02-07  351  	xprt_put(xprt);
df210d9b0951d7 Anna Schumaker 2025-02-07  352  out:
df210d9b0951d7 Anna Schumaker 2025-02-07  353  	xprt_switch_put(xprt_switch);
df210d9b0951d7 Anna Schumaker 2025-02-07  354  	return count;
df210d9b0951d7 Anna Schumaker 2025-02-07  355  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

