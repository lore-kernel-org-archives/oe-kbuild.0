Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CF61E2601
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977981; cv=none; b=iLYwvsOnie2VSvIxk8K3eGo+GaRxteIkhksGg3j5wb4Qj8gxD1/Cxjj3FWheC5UEmqvcKo3mR9R0zU+QocoFVu0vWKU+2PZsrQM0+uDrecEWRWtyYPJy1ynmbuOaf7ubAhYkEUgawSrAHGzSNbmlp4g6u6+dhwsk30oBRZWT5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977981; c=relaxed/simple;
	bh=FAssYMuT3g1UCnr1f1768ULjkSWodEn3Mogao3a8VUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sb4vArjs/hZakp5cHf9fmhAcC/CHTkTJPT32Akd4UXiwD+3XIZandOnovcK2nlgGVgx+Lly7a3hk8Hy7qn7KuqxKp5rlc+qOp4rWiqgo+MW9cOYI/v4JKYbV2X/i18Qo1Yr+WKs03rR3uIIhB7DhwUPbsSSkKeiMrEhgp/KZrGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9FrVVIg; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9FrVVIg"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9ed49edd41so141938466b.0
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977978; x=1731582778; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bxTnaansLsGwyX4X1dG26PErwNbDYPOXaZq2IphXvjY=;
        b=g9FrVVIg34n8rlhbFATVsc7ikeoMwdNlSa9MK5RS0DJiYsWGMV2MfpDwMF1LfMuvGI
         WwYG07/Bt+3HpAedTThMnjZP+X+KdIAS9od3sA6S2xtIkvgvRBAlGV3ubHHlEXwa8Phn
         kzGAWC0i46UXEbPuP4cDOOXi+JbOXWR8Rr700medzpOYVwMQqBiS+zmec5jjCqN0sfoy
         GgxTPQ1RT/svvJk4ZKK08pjIL/NNDB6xOKB9TV3NSSNMioNTn2sjJnxd6JMdTlGUAjD8
         kYk5+BiMyNxF8AQYiQ4ZIp7tSyw46CdShIdMfwfTdT5GCGE/wjL+Xk/J0rD2iKqqc7AX
         Lqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977978; x=1731582778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxTnaansLsGwyX4X1dG26PErwNbDYPOXaZq2IphXvjY=;
        b=qWX1raKv/7VNgD63wYBNfKHT4y4OFR34cgTGG4s2F4qybA82+xRoukh1mXvFfcs7bg
         HkktU/4SKujLO01vWtPq0+QsATPgDoj4sMENPzoIAGt4C3JGd+3pja5Rp6yRkFDIniK9
         cSCUmqDfs7SVHdb7ET2nMMM1nkIAgGcj/lL/N4zAKV5we5wSCpuRgFnxOjtsVzb4KBx0
         b+osHpx6UjTIbPPDctPS0Y4PRd2WX7tkrAj8SiHB4t6hqScCSEt1ZkGDepY8zk5S4l9C
         aQfiuBP4sMSDq1BClEQYIuWOtl2B/MV3myfCX5nkLNfDFuk42KzwT24ZiZPFMMbV/PFR
         8+zQ==
X-Gm-Message-State: AOJu0YxNa6t4OK7M8jY6AhS3ftaa2gVGbB9FWEjR1qVBipgrcYpDEhwK
	NOOFXU7SQrD+q913ErMXV6K8hF5OsqQqRENno/5ay5VMhnlTKa2nKMivOfYSnZelMTJmTJbnKuz
	TBV8=
X-Google-Smtp-Source: AGHT+IFphj611143VdJsImYjeAH+pxPMUc82CFGVDH/4iqS20JWIIoXXYG/sr/hULPByHmo8QW5suw==
X-Received: by 2002:a17:907:7d8d:b0:a9a:1e4d:856d with SMTP id a640c23a62f3a-a9de5edb084mr4352238366b.22.1730977978083;
        Thu, 07 Nov 2024 03:12:58 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e0fabesm77450566b.174.2024.11.07.03.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:12:57 -0800 (PST)
Date: Thu, 7 Nov 2024 14:12:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cindy Lu <lulu@redhat.com>,
	jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/9] vhost: Add kthread support in function
 vhost_worker_queue()
Message-ID: <e55d4e60-37ed-49ad-a8cc-f7b6adb03b09@suswa.mountain>
References: <20241105072642.898710-6-lulu@redhat.com>
 <247f4cd6-5653-4eef-9436-5699b44c4b82@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <247f4cd6-5653-4eef-9436-5699b44c4b82@suswa.mountain>

On Thu, Nov 07, 2024 at 01:38:56PM +0300, Dan Carpenter wrote:
> Hi Cindy,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
> patch link:    https://lore.kernel.org/r/20241105072642.898710-6-lulu%40redhat.com
> patch subject: [PATCH v3 5/9] vhost: Add kthread support in function vhost_worker_queue()
> config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071251.tQLG8K6C-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202411071251.tQLG8K6C-lkp@intel.com/
> 
> New smatch warnings:
> drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)
> 

I only meant to send this warning.

> Old smatch warnings:
> drivers/vhost/vhost.c:311 vhost_dev_flush() warn: iterator 'i' not incremented
> drivers/vhost/vhost.c:678 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
> drivers/vhost/vhost.c:673 vhost_attach_cgroups() warn: iterator 'i' not incremented
> 

Not these.  I need to fix these for systems without the cross function
DB...  #embarassing.

regards,
dan carpenter

