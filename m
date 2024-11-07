Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4841F4FB8
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978645; cv=none; b=g2FAyrknylt7/9ZY0JIalMeT9bVCDhRT7uQyP8chffWKbtLsXAFfU2ToHQcGGOLueeFevm93o16PvNxRf8vwntg8AQSfW2R1dKhLBEfesdKRkQj6eI6siFDn7aMFMrP1q2cKtQ59wqk5IwLinK5i7axyny1gRWFsZ0zhQzMb0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978645; c=relaxed/simple;
	bh=2GsD4FM0iXQ9ZQgHNEDuqIySpEr5mZ0z+3AwGF26ZN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZUE4Qt4blIaJ57+OYhnduBIdlULcDc9pfyfiZ5+G12ZsxPR8r1CNvtI8bk4bV1h3zU3qFrQJxOXXGIux2K7hae5l5+O+dlz0TXf798p0HUfGuXhnwHQV0kvzwYYVN8ycEn0IBq/jnRQ1iPeFNqoeBV+g5dxcILjesP+KnIwwF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yfhLrFSl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfhLrFSl"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so7331905e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 03:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730978642; x=1731583442; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YI7D6pYZ3MPTsBn2X/3v3EZ17avH4kCX3waBbepnJPk=;
        b=yfhLrFSlJfDDA1JtnzmjZXHtDzbq5czqEx5P6kNhM6sSJtHsntD8QLk/3KaJ50rnzy
         uGThkLRixDS8yCFJ/pZuzJCwbw5vdhVlf/FakRG6ZICPtBGdQFJnI7Tf8GP2Q+zgFEW5
         QIuFOZuyIAUjTUiQry1NXd4pFse0fmEypgAdirspDqdHVixznGoHm9r9Vy2clHavtrXD
         xszUeaOZK+7/dkjr1rb8m3x/SvZi0eQoVIti+e5xp43lZ2fhwpZXFJAiSsyrlVL5IV7O
         Wiwx8FxUZw+X3ItAEiasPMMxCsKknf401NPxDeTQOvvcC/inEAPIWKroEs0riVtq206I
         W/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730978642; x=1731583442;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YI7D6pYZ3MPTsBn2X/3v3EZ17avH4kCX3waBbepnJPk=;
        b=U0U/0tmryLTNQNERS0sSX3VS2HErxXEUqjbZGhv/sHUOf0+GiyWacLG/b4jIVPaoc0
         7FLQPM5Q+NoysUGgbRotMyJooAF9FlSZefjshtUvLvJXjRBU5wWRIULZsOZfo9bk02ID
         Ri8V7xiHSXoiCL4Ddsv0ILGNPz2e/7rK+yOy8p33GVduwvHQLwJw3uq51lWwlLT8y9NR
         bsP3CO75uZdMm/jpAftlsuHKk3EgCgkxZcTuVQTLXl0Tyw9ojVA9KYCyBrnBZKa5TG7j
         IC5v1GFdVurfqv2V0h0r9Uax+qm1+RyS883wzNXLBu00qRIJf32ttG+8YeXl3tVWKM82
         s4FQ==
X-Gm-Message-State: AOJu0YyTUzRjGLdCxwTXFOieo1qRM1vhd+GJz0L5ngUnXkjs50SJr0qA
	XFOqMOjXKZaS1MbU/yT7fnn12/IK97kDMI7lZGfw3sxFuldRwGM9rz4j2ziluFt87hXQ5Go4b3y
	ocrw=
X-Google-Smtp-Source: AGHT+IFBpowv+bSWYC6j4VAMIQVR8u8yrWok5kaYTtpzwW5CbfWm5qUgpBko8chZf+PgyCz8MppP4g==
X-Received: by 2002:a05:600c:348e:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-432b30a15femr7963805e9.32.1730978641744;
        Thu, 07 Nov 2024 03:24:01 -0800 (PST)
Received: from localhost ([154.14.63.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e56sm59261885e9.2.2024.11.07.03.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:24:01 -0800 (PST)
Date: Thu, 7 Nov 2024 14:24:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cindy Lu <lulu@redhat.com>,
	jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/9] vhost: Add kthread support in function
 vhost_worker_destroy()
Message-ID: <ed23b4b1-1aa8-414a-856c-15e072541dee@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105072642.898710-7-lulu@redhat.com>

Hi Cindy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20241105072642.898710-7-lulu%40redhat.com
patch subject: [PATCH v3 6/9] vhost: Add kthread support in function vhost_worker_destroy()
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071945.ExiEHgoX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071945.ExiEHgoX-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:721 vhost_worker_destroy() error: we previously assumed 'worker' could be null (see line 721)

Old smatch warnings:
drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)

vim +/worker +721 drivers/vhost/vhost.c

1cdaafa1b8b4ef Mike Christie 2023-06-26  718  static void vhost_worker_destroy(struct vhost_dev *dev,
1cdaafa1b8b4ef Mike Christie 2023-06-26  719  				 struct vhost_worker *worker)
1a5f8090c6de99 Mike Christie 2023-03-10  720  {
e4dec2edddbd54 Cindy Lu      2024-11-05 @721  	if (!worker && !worker->fn)

Same thing.  && vs ||.

1a5f8090c6de99 Mike Christie 2023-03-10  722  		return;
1a5f8090c6de99 Mike Christie 2023-03-10  723  
1cdaafa1b8b4ef Mike Christie 2023-06-26  724  	WARN_ON(!llist_empty(&worker->work_list));
1cdaafa1b8b4ef Mike Christie 2023-06-26  725  	xa_erase(&dev->worker_xa, worker->id);
e4dec2edddbd54 Cindy Lu      2024-11-05  726  	worker->fn->stop(dev->inherit_owner ? (void *)worker->vtsk :
e4dec2edddbd54 Cindy Lu      2024-11-05  727  					      (void *)worker->task);
e4dec2edddbd54 Cindy Lu      2024-11-05  728  	kfree(worker->fn);
1cdaafa1b8b4ef Mike Christie 2023-06-26  729  	kfree(worker);
1cdaafa1b8b4ef Mike Christie 2023-06-26  730  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

