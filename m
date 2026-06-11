Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE53B9DAB
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168618; cv=none; b=InhwkmgN7Jpx8lQrelQ/6s71BO6iK89jL6wJi+Zu/HBCJ5+wZ/XL/YGmX/H0Gsipx/vEHg0nHjTjRc7vUyBpasmHkYhXjqEjjy9PflLWS4dx5DIqxSOx0Ldix7JXnvubGgC0X8Dv8UnPbT/n8bKKb7MK6XD/C+jNKslSu17hVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168618; c=relaxed/simple;
	bh=pyFP8rEsuhRSBav3/vbueGdQhuXe4DppYtiuEmfeMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D5anvaA5L1PK4k6g8wcRli5Iw0DdgpBcNdBiVQYrjKoq7+rnsDOjb6cQac/VEpUaUEx+z0kKiTILwJaoUQn05ywIHjWg9yNRYJHDLuBbkeFKjyA0Wtt2gRwnlk6id9Rc3Yji11ezZYtQuGvx8qQRoYu/ukpBoc7A/co4rv9iseM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4roMyWJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4roMyWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781168616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94ZuSq5C8+JntXJociCbJ2ZeSl1NXVmpyu/CZrm5Jlk=;
	b=e4roMyWJbcWF9mMwvKtje8kYLGLBxSAsUCyD2TO80KBMGehLlaaXLZYTTVX58A+45co476
	Ubb5c0x9RswzUoaFBNL6aHvt1iuUh/EiJkEH32OHVNobgvCQO+FCX6DmcQ0HDh2wA+wzAW
	JApPnGZDdES1PC2UIn1qc5l3QorEIJA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-nBaBsIA8O1eAjfFuEk3KyA-1; Thu, 11 Jun 2026 05:03:30 -0400
X-MC-Unique: nBaBsIA8O1eAjfFuEk3KyA-1
X-Mimecast-MFC-AGG-ID: nBaBsIA8O1eAjfFuEk3KyA_1781168609
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4600cf05f07so5069482f8f.2
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 02:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168609; x=1781773409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94ZuSq5C8+JntXJociCbJ2ZeSl1NXVmpyu/CZrm5Jlk=;
        b=aDdwj5NkkaybDt/wZ7iEgbRvIEPvgzaae3VQwgz/A6QzJQj24oAHWw/AksPmZlWMed
         evN9R6Y0lto8g6ix1jeyIiYir5H9eOkaqQvY2kOjge22raNRaJFh9CgJC5vWQ5l14hxq
         J7TWXf8pwKG35gqpkSwWNSVOU7Gi5dlM6MUTA79isLrdrVQQY0ss9whBGuvAF1F1bmyS
         b4ejkQfTpZ+S9Nx54VM17EtFVo1ia2qUZBzF3r8SEasdp82UQTSWzVQOLI0xoh6IfhmQ
         97/hjgeoS27jPRvJhc94zOvFS7dYAKGmOjOoiZeappDFtH3C35PB/BEgW6UyLa/hLLlZ
         C71Q==
X-Gm-Message-State: AOJu0YxLMdQDpW57uDQU0tpc+4AbZwTBkAMXpXNCeWvb6rH6iyS81Kjp
	Gs2nVBQNd6oXSU8qzu98QdrIF6NKJ+0Kbh/4qFyku+IoHuvKyvXCOsWo+3FThNV1PypdFMfGNAY
	CbwQzLlCuaUcFD7PGfqjLYcr8B+DhKsvhzFBAVCOOW0ADZ8M9QcReZVRQSL3ZcQ==
X-Gm-Gg: Acq92OE09bO6oNMcwdT/PaiQbhve2i3d+E1EVjIE34smn7Kla+pmOhA7vm6s/UXj2km
	+IHVywdqRfUqcCNooxu0mP+7iaKikBiQL6DTYKtwJnR6gaf+7tfVOk4AXfmdzUxKuQzgVu5MVEz
	ogFW0wE3v9tHwhm4gKstBn1ePZzac1CDCf9Ld1iYFGScUT5p9mIlToG7e23lsvY2R+gD/T71Yz3
	7KGclj52IrOTaSx5EoT8zAr6NAHfmhInzYxFVOu2m8Z4ngHyLCQoEWW3m60lvAoDQYt30FzU2jr
	PSM1GIzboeqoAJlkPQrYtrL3ZzHcFQHoY2bVVzFmly2+2cEMl9ksQ3s3trgoftLCTVXEyzZIaNR
	O6SN3yNi0m3SR/zfJieb6T5WEX6cglxpKvY6j9+od1l0LWQYm1n8tfg==
X-Received: by 2002:adf:e005:0:10b0:460:3233:66fd with SMTP id ffacd0b85a97d-460677c2fc0mr1828632f8f.40.1781168608637;
        Thu, 11 Jun 2026 02:03:28 -0700 (PDT)
X-Received: by 2002:adf:e005:0:10b0:460:3233:66fd with SMTP id ffacd0b85a97d-460677c2fc0mr1828570f8f.40.1781168608034;
        Thu, 11 Jun 2026 02:03:28 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm75472219f8f.18.2026.06.11.02.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:03:27 -0700 (PDT)
Date: Thu, 11 Jun 2026 05:03:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	virtualization@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Cindy Lu <lulu@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>,
	Yongji Xie <xieyongji@bytedance.com>,
	Maxime Coquelin <mcoqueli@redhat.com>
Subject: Re: [PATCH v3] vduse: Add suspend
Message-ID: <20260611050140-mutt-send-email-mst@kernel.org>
References: <20260610083452.477759-1-eperezma@redhat.com>
 <202606111115.tKKe1qCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202606111115.tKKe1qCE-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jRLsEvMPECVm6xlX-Ur-4Nw7UaeMQo1anu6OZoWEYPI_1781168609
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> Hi Eugenio,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-Add-suspend/20260610-164534
> base:   next-20260609
> patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eperezma%40redhat.com
> patch subject: [PATCH v3] vduse: Add suspend
> config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> smatch: v0.5.0-9185-gbcc58b9c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.com/
> 
> smatch warnings:
> drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsistent returns '&vq->kick_lock'.
> drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() warn: inconsistent returns '&dev->rwsem'.
> 
> vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> 
> c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_vq_kick(struct vduse_virtqueue *vq)
> c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> c8a6153b6c59d9 Xie Yongji        2021-08-31  564  	spin_lock(&vq->kick_lock);
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^
> c8a6153b6c59d9 Xie Yongji        2021-08-31  565  	if (!vq->ready)
> c8a6153b6c59d9 Xie Yongji        2021-08-31  566  		goto unlock;
> c8a6153b6c59d9 Xie Yongji        2021-08-31  567  
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  568  	guard(rwsem_read)(&vq->dev->rwsem);
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  569  	if (vq->dev->suspended)
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  570  		return;
> 
> unlock before returning?
> 
> 9c4307e82fa1dc Eugenio Pérez     2026-06-10  571  
> c8a6153b6c59d9 Xie Yongji        2021-08-31  572  	if (vq->kickfd)
> 3652117f854819 Christian Brauner 2023-11-22  573  		eventfd_signal(vq->kickfd);
> c8a6153b6c59d9 Xie Yongji        2021-08-31  574  	else
> c8a6153b6c59d9 Xie Yongji        2021-08-31  575  		vq->kicked = true;
> c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> c8a6153b6c59d9 Xie Yongji        2021-08-31 @577  	spin_unlock(&vq->kick_lock);
> c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }


I think this is fixed by:

commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-next-vhost/linux-next, kernel.org/vhost, kernel.org/test)
Author: Nathan Chancellor <nathan@kernel.org>
Date:   Wed Jun 10 12:16:49 2026 -0700

    vduse: Fix error around jumping over a __cleanup() variable
    
right?

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

