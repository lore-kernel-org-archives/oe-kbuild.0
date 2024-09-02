Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED992185B7D
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276199; cv=none; b=t0a+a6HPNCeDIP5srkOeoAGxsaNXN6byShdfPf2ZBQdlQR8G0Sb7WB9gf0pwtBB/Uz7TEjFLYQcQHqNnhxDgbtctv0ZtA44fpbfitncZAyFpl1X8FCY06eTGfLwp+36s+e5wbJt+GtUzkDbfi656rzVNkgc3DH+0YwnODh4kXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276199; c=relaxed/simple;
	bh=FpetsQ5I1CDSi8wtSlI1e+AMgn3cH3BIUkkDyXHtNqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx+g5krPGjkrsjjPxpt0/MWhPHQoxVRsMGUdIO7dUCSslSPDJ8McP6hy437bs3j8K8bqQWddTHNBtchUWIZlWqZ8WWnzAllWPB4fZkxCCONt6+oXjhPIX9NtLBUxN9sZBnhGkW3ZSWf4BEOQzH+Z+TAavRVhXApo8zXX7qAMLxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sM+7O5m3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sM+7O5m3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42c7a384b18so14981385e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 02 Sep 2024 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725276196; x=1725880996; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QEt0+dc1LSyQIyl13xdTGJyLQn3oDUp5kW96ysZGY3w=;
        b=sM+7O5m3ZWDY5o8tFa+HTxrYVEoN9ZXzJ3A2TlOQOzAlR6i+u39ZmBDsY2ZDN4hRfC
         qoMhAnGH+2ORN59wsdpn4YOLMR92Dxw+lnHEJHV8V2cGicR/q1+wBUwMFEWa9/1tJQs+
         QGx6VZJZWNKQ5MhUZkRzvWLETSsN91nAUEvfeOrGtHKazeiuKZ6i/Q36qMoAJBT/H3AT
         gf62a1WGlOZV4ZlHp9yQaoYnMVHF+Yloron+/C0QRCdU81nEfx/EIusdg3WgpIZL6Lyl
         gorddOKIRsH2cMyYaJl1z5Fwei0eDr8WHlH5m68ZDO31Wu80qG6a5E7q7mNyFbLgO6+X
         IJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276196; x=1725880996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEt0+dc1LSyQIyl13xdTGJyLQn3oDUp5kW96ysZGY3w=;
        b=GtxprE+cnsdqh77w+aDaEry850Qbfs1aZR7GtxLkDZVYIe46Som/UJ5TLYePRPQKhL
         XlwxJLeHqdrcL0cc6jF1oQFevm1Oq2K7VbSK9aRjS1RxmvOezzsUb88M/RQYnf7R1/rF
         Sr0uHyX1BIXcsMJMwfhf5oBvxoYK4sGD7PPIhyLclj3lTJilAMGAKkp6PmMuPekQM/Ug
         xIwUc3/yhT6k2gFO8DRGId/5pYYi0GzVtTvGVdAl2/xtWQNPP667X0XV4+Ryd8TH5wfY
         8yMqgYUHaaF3Ffp3EOlN3GleFov6hthXHBpGvrGCkIsOW8ICO3c7ICwqDxPRzXITPklN
         WrJQ==
X-Gm-Message-State: AOJu0Yy05hlTiE8OBPjF3rj6gd29xNJ3SmNyqyyH+cedThJIw56tLq1T
	mGfH5x5lFiV48f76KshpwMgn6WLcMIpLj2CiBXHNK7/lM1N4ddB4mH1zF4pC1Iderq8UHeOvYWB
	i
X-Google-Smtp-Source: AGHT+IFxJcCTvoMwpH+tvEwVOkWpvLSMuNdbuHPGieP5ISOoCAVIM3ROhsGt3PZ8voU2RxcgHG86EQ==
X-Received: by 2002:a05:600c:4452:b0:428:1090:cfd4 with SMTP id 5b1f17b1804b1-42be48faa4emr44328095e9.33.1725276196265;
        Mon, 02 Sep 2024 04:23:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42baf1b0c18sm151736775e9.37.2024.09.02.04.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 04:23:15 -0700 (PDT)
Date: Mon, 2 Sep 2024 14:23:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
Message-ID: <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
References: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
 <20dd56f0-78ea-4255-86ac-32151160b83d@stanley.mountain>
 <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>

On Mon, Sep 02, 2024 at 01:17:51PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 31, 2024 at 11:31:53AM +0300, Dan Carpenter wrote:
> > Hi Andy,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
> > base:   driver-core/driver-core-testing
> > patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
> > patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
> > config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
> > drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'
> 
> Okay, I might agree on the err_msg, which is good to have to be passed anyway.
> In such a case it might be good to have a dev_dbg() in the dev_err_probe() to
> say that it is likely a bug in the code.
> 
> Would you accept that approach?

ret is 1.  We have to revert this patch.

regards,
dan carpenter

