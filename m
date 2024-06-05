Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C518C07
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Jun 2024 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717565077; cv=none; b=Q719mdnP4kgdDrQsF8uWiMgDK90bAMsEIqe5kawLK1FahVGYFPmZSJJtFzoPZKlciZaX3KrskLN4R0LnW4QV86bDgxBliPPCY+dathw9uksWTlV4KgK/9yMvW8OAP4iR/T+bK4jHGzKn2+VHy7VzK5TWdYjh52hA1+1YgaEVi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717565077; c=relaxed/simple;
	bh=poqzOnjxKvuZhOVVP2vCDTAj8Ttrx5WnbLuYUT/fyCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lQJy2c07kiaHVllW5hPtaF/9GHiaShcQgnKGhDz75tQmOvEib1eqTTnVaAgG43BYwj0ndWCKW7EuE3sAtFkyK2mqlJqhG/tTurcErjzgOb7qd/FNru644PASZoRrLClnR+8+Nr8lqE/Rbew6+0wj3ECqm1CcA6UOrC+7LxEtXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d9HnUnAF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d9HnUnAF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a7dc13aabso2250500a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 04 Jun 2024 22:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717565073; x=1718169873; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieXpxhBBWSSEFA3ad/RzGLUGCP/3ui0qmyCSm+SXO/M=;
        b=d9HnUnAFKJrW3TXM6eJK+Js4bVPyvDhyhsbtr/WBd6YwjY4LmYBohm7q3ua8jk2e3g
         yTMIRKnvzS4ODn/h0blBBc/abFNMEhzgvyUYLt+/8Y662LNITmhNqrgemMBIXyqnPcH8
         rN8UFz6bmrVf+HI33nCctYCmLH/ltI5m48WD1uwoK3GQwcSx55NP/+m8T1tkKRgEKf9/
         7qfoblIczV2z8ilqT+s6JNY7OQoxtw0edTqUwtzqliz5y+807TwHafR2l2wsOO6URp0U
         gj1QWTiYsKVV6JSHiJPOEpH+OZvJF4Rapk94Br9/4XuE7Wrm1iLg4DM21DsWPf0Z1q9J
         3XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717565073; x=1718169873;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieXpxhBBWSSEFA3ad/RzGLUGCP/3ui0qmyCSm+SXO/M=;
        b=Z31hoaGacMWhnS0qCmYr+Y6DRMyjeDryw51ibZeC2kx5srPCYlt68iVtLqL8hxUPPD
         hJrmwf6NfUmpBe9XFXpeE6WpDfwt2vW+skGhT0KAHIeOU/gZSIaNCm+9Cb4iQQ1q42NO
         o2tQZzk41pEzcgX4w9iBCMjpmBoim8udct8pDH/mv5+3LReSvgZulWUqTESXB9c3v8ap
         FZUJkGb6mCRtx0PySg0PkU6fChF6KY17iMkEWmZTWhXkKwl2RCCOhj2t2FHrSIFbwCmQ
         PY1TKI5NBYK3m+dLw+GC64S6ifxn0V8g6wat/ClFt7AMMHVDgXWe15Wx2A26TXyAiLh8
         OR1Q==
X-Gm-Message-State: AOJu0YyZpFIfa/UdCpe8a7aalticbtUIuuIJS/CsXsu3iAWT/jIMd6qW
	7gBFZ73XTvqXaxtVZRoVdz5NIanCrlzt+tzBYVWT1S/p5cfW811RyEo1WTyOynlMtATlU+DSSxb
	c
X-Google-Smtp-Source: AGHT+IGblo21HwWBJITrF2Lq0wtl7QLdAO0pjSkQJ1yY4jTCAGyNBZoCeBT+Grw2RfWlVYwmCDGV8A==
X-Received: by 2002:a50:d6dd:0:b0:572:6846:b899 with SMTP id 4fb4d7f45d1cf-57a8bccb341mr692996a12.41.1717565072709;
        Tue, 04 Jun 2024 22:24:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c6d301sm8526348a12.76.2024.06.04.22.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 22:24:32 -0700 (PDT)
Date: Wed, 5 Jun 2024 08:24:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xiu Jianfeng <xiujianfeng@huawei.com>,
	akpm@linux-foundation.org, muchun.song@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next 2/3] mm/hugetlb_cgroup: prepare cftypes based on
 template
Message-ID: <87bca9ca-0c3e-449a-b121-eee7b84dc2ed@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603120506.1837322-3-xiujianfeng@huawei.com>

Hi Xiu,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Xiu-Jianfeng/mm-hugetlb_cgroup-identify-the-legacy-using-cgroup_subsys_on_dfl/20240603-201513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240603120506.1837322-3-xiujianfeng%40huawei.com
patch subject: [PATCH -next 2/3] mm/hugetlb_cgroup: prepare cftypes based on template
config: i386-randconfig-r071-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050210.OWthxCFt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406050210.OWthxCFt-lkp@intel.com/

smatch warnings:
mm/hugetlb_cgroup.c:828 hugetlb_cgroup_cfttypes_init() warn: this array is probably non-NULL. 'tmpl->name'

vim +828 mm/hugetlb_cgroup.c

66bcc9ace99241 Xiu Jianfeng 2024-06-03  815  static void __init
66bcc9ace99241 Xiu Jianfeng 2024-06-03  816  hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
66bcc9ace99241 Xiu Jianfeng 2024-06-03  817  			     struct cftype *tmpl, int tmpl_size)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  818  {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  819  	char buf[32];
66bcc9ace99241 Xiu Jianfeng 2024-06-03  820  	int i, idx = hstate_index(h);
66bcc9ace99241 Xiu Jianfeng 2024-06-03  821  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  822  	/* format the size */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  823  	mem_fmt(buf, sizeof(buf), huge_page_size(h));
66bcc9ace99241 Xiu Jianfeng 2024-06-03  824  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  825  	for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  826  		*cft = *tmpl;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  827  		/* rebuild the name */
66bcc9ace99241 Xiu Jianfeng 2024-06-03 @828  		if (tmpl->name)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  829  			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);

tmpl->name is an array so it's non-NULL.  Just do the snprintf().  No
need for the if statement.

66bcc9ace99241 Xiu Jianfeng 2024-06-03  830  		/* rebuild the private */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  831  		if (tmpl->private)
66bcc9ace99241 Xiu Jianfeng 2024-06-03  832  			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
66bcc9ace99241 Xiu Jianfeng 2024-06-03  833  		/* rebuild the file_offset */
66bcc9ace99241 Xiu Jianfeng 2024-06-03  834  		if (tmpl->file_offset) {
66bcc9ace99241 Xiu Jianfeng 2024-06-03  835  			unsigned int offset = tmpl->file_offset;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  836  
66bcc9ace99241 Xiu Jianfeng 2024-06-03  837  			cft->file_offset = MEMFILE_OFFSET0(offset) +
66bcc9ace99241 Xiu Jianfeng 2024-06-03  838  					   MEMFILE_FIELD_SIZE(offset) * idx;
66bcc9ace99241 Xiu Jianfeng 2024-06-03  839  		}
66bcc9ace99241 Xiu Jianfeng 2024-06-03  840  	}
66bcc9ace99241 Xiu Jianfeng 2024-06-03  841  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

