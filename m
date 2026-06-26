Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4B30BB9B
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466988; cv=none; b=Z/8Y9tV2MRpeZpbDvXfSR2Rya6C9adfZjrVKOAM3DeaLTBTTmAVdurbKv1QBchkp57bC5eRsWdQxbQMgP9Y2cl7JeaLn/dgW/ojvHs5NbAedzZhQaxT/c7mrox0rbrDvpWC1WABX0w5p6Ea8j7yrswBNrkThz3/09UV6dfbm9DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466988; c=relaxed/simple;
	bh=ZHyD7fXlPkmq8qBmYMRn+jnw7L6dlDoxe45z5TNdASY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhJxyAfWIACpiVK8wpvlbJyqGLiTOXfRnz4My9mreZ7+W8UhFFtJe6zB9sIC2nsQ0ykkMLjgQB83WhDpjEDbCHSTqFFxx6VG+G7UIQ1ejaV3gTHOnvMTY3jRJMfRn4eI1Cvq6fgr4q/kORYO037kflYR3tGXkZ5J7z9OCEjDLYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXuG9veG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXuG9veG"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7e6e21c47e6so416592a34.1
        for <oe-kbuild@lists.linux.dev>; Fri, 26 Jun 2026 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466986; x=1783071786; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BEA6039rXQdzzbULZRZgWzoeHr96Z9YLKGML0slBm+Y=;
        b=mXuG9veGq9T6B/WduDS96KjBWZg7Fugurcl2wcrRfxfVs+9/OpBAtpMuXgaieSjVjm
         fSAgNOpCvM8F3affe6cbxF2xO8LzCLzdNco7NUg123vtjzRw1hvRyqu9nVAVi0PKTmTN
         v837u/6q1pXcCGzWfr6QGLhhnVnVkwHoCqoyiRl0tfaJtaW0UArL+6SOkfM6JFOtfgZG
         h7x5lpzq3A5nI+KTACaGPc9e/e1qBd0kJIFwJiyanzzZKtfJ53qyKzNtbyQPsVdrFY/t
         FBKqQNgo0enCOn6NFEQdnzBzV02j08jSvqfnHzSlpz2hrJGtwmIzMBGUJuavF3Cv/ehy
         xIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466986; x=1783071786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEA6039rXQdzzbULZRZgWzoeHr96Z9YLKGML0slBm+Y=;
        b=MM+C453xvwfdqO/64rnMuJlQw0CNhCzAhKrqfMFABG0aC2aG9ba0q5ZCsWmvGZtk26
         pBFXyzGWGq1qt6seGvSb3A7mlaDEYCPtLATb8h8btfwQlCICTsP68P2K7LQ5EZibWTVL
         mtEklBuNZ4frdBSTXztVGXtvNDIx8N+9gw6KdvBYryQ6xPDXVzPhUTOAGLCRZLH2FOSF
         CRowjf7QgylWYwnzAwgiDMQloewst/IldTPU06gjvqcEy2eQtHJEPvpGpOilIs+UCv/3
         QtuJuUtp/OK9M70ueFswV7HqwEQqcMlq8SPCDNyGRa22uJG7yjien04O4oio87sHlV+H
         Qa+A==
X-Forwarded-Encrypted: i=1; AFNElJ8miTZS6imAXOjq5BqbnFEvnrSvnWBKFyIjYsUF4tNXwxgOK0Y4+kcquG4DKlJOEBl4AazFfICoSwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgL26Cn4ALZha3dhO0SvNtlgsL2Q141vOADVNiM1kNX/nX3+E3
	5j0QT2gAubnA/6VWLMdCYaYEYc0hli8gPZYnDrGnd73NnqpnJA8+9vE4
X-Gm-Gg: AfdE7cm58pl56ykzYo3J0HVnFaxOqBBUNJ8Fh+7LFlPj0yuvFx1fU+vEul5sjwIlQ2e
	jsku/lXfVQhzz7pqnhcwY/dFaWw44DlNYPr5o2iJBUeE5VrhWme5Q++hQJE3rXUgJ4KTGboL7GD
	ipz4Y+5pkWMMx9lCnMebS7QFxyaR5hlimA22A2xXKku+7clyb0EZ7dfiLV01fod3oXtzZn3Dzd5
	NiCjlCgKlwEQtQox3b/28HxznbQ1fc94rAvZMB8QakPash7oXWRO3Pb9/qAc5wPesNx16GAnIfD
	KY/NHTcAGlFSUwtp99V2mlpwpozpbNQ6ZJdexnufPL3YvkpcJwb6gbc0vcfk/qeYpMoW8CyknjN
	5hKw8Ln4keW0VVkXjAlwdwI2FOHlvswvr+QS7Ho4/B7C3ZNO1aNtBByaMWbUolKofyqGFl9y4Pe
	n8l+Oj
X-Received: by 2002:a05:6830:6084:b0:7e9:8867:cb23 with SMTP id 46e09a7af769-7e99c257361mr6019099a34.16.1782466985935;
        Fri, 26 Jun 2026 02:43:05 -0700 (PDT)
Received: from localhost ([74.80.182.98])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa787445sm1201600a34.16.2026.06.26.02.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:43:03 -0700 (PDT)
Date: Fri, 26 Jun 2026 12:42:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Datta, Shubhrajyoti" <shubhraj@amd.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Subject: Re: drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer
 overflow 'priv->adec' 152 <= s32max
Message-ID: <aj5JoH5U2n1fOQGi@stanley.mountain>
References: <202606061200.j14yIFYw-lkp@intel.com>
 <96aa204f-8ad4-4f5b-a7ca-48df8c9eb187@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96aa204f-8ad4-4f5b-a7ca-48df8c9eb187@amd.com>

On Fri, Jun 26, 2026 at 11:05:11AM +0530, Datta, Shubhrajyoti wrote:
> 
> On 6/6/2026 9:57 AM, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > CC: "Borislav Petkov (AMD)" <bp@alien8.de>
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   8e65320d91cdc3b241d4b94855c88459b91abf66
> > commit: 62a9fc50e8d947601ea3484e732b1a65a0a54b96 EDAC/versalnet: Refactor memory controller initialization and cleanup
> > date:   3 months ago
> > :::::: branch date: 3 hours ago
> > :::::: commit date: 3 months ago
> > config: arm64-randconfig-r072-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061200.j14yIFYw-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller initialization and cleanup")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202606061200.j14yIFYw-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/edac/versalnet_edac.c:785 init_one_mc() error: buffer overflow 'priv->adec' 152 <= s32max
> > 
> > vim +785 drivers/edac/versalnet_edac.c
> > 
> > 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  774
> > 62a9fc50e8d947 Shubhrajyoti Datta 2025-11-04  775  static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
> 
> This is a static function called from
> 
> 865         for (i = 0; i < NUM_CONTROLLERS; i++) {
> 866                 rc = init_one_mc(priv, pdev, i);
> 867                 if (rc) {
> 
> The NUM_CONTROLLERS is 8 so the value of i at max can be 8.
> 

Yeah...

The zero day bot doesn't do cross function analysis.  It cann't
scale well enough.

These warnings are normally filtered by a human before being resent, but
since you're using lei you get the unfiltered patches that didn't go out
to the public.  As more and more people adopt lei, we should probably
stop sending unfiltered warnings to the list...

regards,
dan carpenter

