Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21AC1EF941
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 10:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975943; cv=none; b=iA9PWbZtYBO87fjpGPVpaLru5rIET7od48QzA1d0BrxgCVjh+q2KV4MnXGFgkrD+owNw2irpLlHuIhDVfQs21khFKxmYIZEtAubpCYJkvCcJ5Oh8yFDpm/iJB22PaCGCYIjj2zwdvB2Nw0gSsL+EBP/NTFybi6llEkF0ZBFo3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975943; c=relaxed/simple;
	bh=lJMdumzOaAkNiNGo6zimgII+G/snXw0TvT8mnuAxvk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V37PQgUHDFgIZG/n5zSzSp0g1xWcYKWqd3UyYYuWjR4lzRjmq5AClyDFnJKtZ5UqHYAwMpDrUaNkXEEI4U8Xt11DIof8CDnJpNjpWffGxu15phaX0vVTt3OyghNvKWQKzjcp9wbTCaG3MjMGboJeHxBEacVHVzZYi9NUTUHUC6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjbmX+IC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjbmX+IC"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53c779ef19cso832277e87.3
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 02:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730975939; x=1731580739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JH98gemjJTaUPfUlmHX1OFqIrt84z9GbUn53JGi6HVE=;
        b=HjbmX+ICJyKD5jrBhXLUHV5Mfd50A/Hey+cRRyybt65Na2kCy/P4ye27TpYPG1sJVC
         fyh51aFQNdH05Qt6lFfTeyjj3SfHnUOIJyFcgfgd5RFp+nVM3nZQqLYAcWDK+VocIi7/
         JTpZ5msq0Eo0YpNG57VUbGhaERajHBnvxO5MnoBQzmBsOxI8Lp6P58/cd6W13TU5mTbC
         MjR0p9lp7gKBl1MS08bH5i/Vu6j7PVYGC9cOCUBh7lr69M/VfjspJ5Ulcvgba3isqxY5
         MBDl145GxfeUJeHN01nFMfZom4AaJpa4KXJhXNphkwnOYXLU3RwWmUEiXMX/nEd4Rc4y
         VTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730975939; x=1731580739;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH98gemjJTaUPfUlmHX1OFqIrt84z9GbUn53JGi6HVE=;
        b=FAUDlYkV4z/tI5aeCXSwr58f3f5VGzGutf9Rm4DBBPm5BJib7V1tziMn+PYCYKAG14
         TWxvxzObOKZ/jYOnCHFfBgWmqYi06fvVHo/XzAXJmhkGHiopjZ2Vl7z53sHU8hOUXl4e
         ktRkMQyq21tSEV09MoTxoRSLPuIlF/Le+56Y6QsYr9a5bwC7LvmXaJ6rt/jyVqt4mjyc
         SmA5Oj3Lez+itm5Wm4S5Fid+twiKpAnE6q3LmchsWlrZgcTbYMkmJuwANMJXzwSHbyjN
         rngpCsjorF1DjeuGKI4k9Ttnhxy1aodUbOO/xzAZkZ3gmIls3aawJWqLlThQ+LpdaTEQ
         IugQ==
X-Gm-Message-State: AOJu0Yy0w5PgVsFhBI4Zse9293/8GVoQymFQi3/92iuIzgfSahnrjoCz
	vAxtRw4ry2mcaqISMD39g/CWp/PaWaBu9XaA72azYEwtpNYfZzN1KUb+2NiQpUikOINaOHlf9Og
	11rM=
X-Google-Smtp-Source: AGHT+IGso3elzbiaDw8i00w0KjqQ5KFuPi/CIIkjajhtEha2FDZ5ZKCSRCL4vAbs4WzAVjhcuNJGcQ==
X-Received: by 2002:a05:6512:158f:b0:539:8a7d:9fbf with SMTP id 2adb3069b0e04-53d8409e39bmr376911e87.46.1730975939310;
        Thu, 07 Nov 2024 02:38:59 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa70a2ccsm58130555e9.31.2024.11.07.02.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 02:38:58 -0800 (PST)
Date: Thu, 7 Nov 2024 13:38:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Cindy Lu <lulu@redhat.com>,
	jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/9] vhost: Add kthread support in function
 vhost_worker_queue()
Message-ID: <247f4cd6-5653-4eef-9436-5699b44c4b82@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105072642.898710-6-lulu@redhat.com>

Hi Cindy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20241105072642.898710-6-lulu%40redhat.com
patch subject: [PATCH v3 5/9] vhost: Add kthread support in function vhost_worker_queue()
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071251.tQLG8K6C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071251.tQLG8K6C-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)

Old smatch warnings:
drivers/vhost/vhost.c:311 vhost_dev_flush() warn: iterator 'i' not incremented
drivers/vhost/vhost.c:678 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:673 vhost_attach_cgroups() warn: iterator 'i' not incremented

vim +/worker +241 drivers/vhost/vhost.c

228a27cf78afc63 Mike Christie      2023-06-26  238  static void vhost_worker_queue(struct vhost_worker *worker,
0921dddcb589803 Mike Christie      2023-06-26  239  			       struct vhost_work *work)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  240  {
001268765c12bbf Cindy Lu           2024-11-05 @241  	if (!worker && !worker->fn)

|| was intended instead of &&.

001268765c12bbf Cindy Lu           2024-11-05  242  		return;
001268765c12bbf Cindy Lu           2024-11-05  243  
04b96e5528ca971 Jason Wang         2016-04-25  244  	if (!test_and_set_bit(VHOST_WORK_QUEUED, &work->flags)) {
04b96e5528ca971 Jason Wang         2016-04-25  245  		/* We can only add the work to the list after we're
04b96e5528ca971 Jason Wang         2016-04-25  246  		 * sure it was not in the list.
635abf01918157e Peng Tao           2016-12-07  247  		 * test_and_set_bit() implies a memory barrier.
04b96e5528ca971 Jason Wang         2016-04-25  248  		 */
0921dddcb589803 Mike Christie      2023-06-26  249  		llist_add(&work->node, &worker->work_list);
001268765c12bbf Cindy Lu           2024-11-05  250  		worker->fn->wakeup(worker->dev->inherit_owner ?
001268765c12bbf Cindy Lu           2024-11-05  251  					   (void *)worker->vtsk :
001268765c12bbf Cindy Lu           2024-11-05  252  					   (void *)worker->task);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  253  	}
ac9fde2474d04bd Qin Chuanyu        2013-06-07  254  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

