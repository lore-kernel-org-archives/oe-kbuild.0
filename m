Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C3358D3D
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170264; cv=none; b=KzDK+iGjepqnZVhWlk6cGP0i/W0Rkl2NDPMxXwxfgW/ktCnXedLHTXDQuN1vGhw65Pympk/14UCGkhlsj7cNn64wrdZM9Mm0OCBEuf7LshkDTH9EM3lq7255z9enkLMvL+2ieNyGaiBCebH7p9FtfugugZqNf3fQSkcqCgaYfaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170264; c=relaxed/simple;
	bh=w89Gt/JtXX8ZT4RIyRt8rc6bOLcjvGb33ot1aJe6Ls8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCmHmc78HBFtcL1JBKAViPCMQJhYCxWJcQBc9UEcOLRYGQuujZ+d/wqg1NRRRjkBrQNZQAvP5iF1zp5D5t8YAQ9kpNEWImhItw6MT+LF4C/bXzcB2GQVK4V2nQmTT3reIQnYYLzedbxBYYdt5dD3QAauIzvUx/oDk4qhVm1ME8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IovT7oVf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IovT7oVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781170262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2hNPvYgf0iD8PvTepkvC82FmAqCAzcD0YMkTYIhG0I=;
	b=IovT7oVf45WBUOCa5fCQtLpN6pgAfStdrW0oJ9DWCtlwd347Sr6sysAw9wacy+tIlqCEAK
	ElQmcgtpmSIFWix46sf3+FHnZfxdY1j7FkKmGk2HlKbOIEwOFnuVzHazJXWzKh6nxyLLSi
	8XINUSc+aXwUagumDSrykiKcn9mBQ9I=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-yDUW--hNNQCTV_4vnT9YmA-1; Thu, 11 Jun 2026 05:31:01 -0400
X-MC-Unique: yDUW--hNNQCTV_4vnT9YmA-1
X-Mimecast-MFC-AGG-ID: yDUW--hNNQCTV_4vnT9YmA_1781170261
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66073c7c2f1so12054588d50.2
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 02:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170261; x=1781775061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2hNPvYgf0iD8PvTepkvC82FmAqCAzcD0YMkTYIhG0I=;
        b=muBMmnIogEuNS2R/U02mABE/KA2GuCBmoq5r8QboAmfjSdcSlk0+C+K781tZfidCEh
         dupQkrKXvNifL+HKIXA9QKsO3Kq1MtJdPwIf19d9CmPQGUZRHWc2piMWqxsTwLVXhaBc
         Wi7RUYUXQaOGiFU2YNFgGgJxklUvwfzcddL81MwU9ah0pa1XGYleYW1BT35EnqCQQJaq
         +95A0VavnWF+23mEk5j+LH+efwBKUgb3j1SdOoTV1T598IbGnK9EuW7QZiTfCVrN+Gqb
         DjjCIkbjPK/pmi4zl5nCAybfA9sSgDGIxxF2Cnd95rzNmh9qdyD34Fbmo2k8/AhKJ/LN
         QnSA==
X-Forwarded-Encrypted: i=1; AFNElJ+5l5KkfxULq97C6/TQf6WT4JJGI/QNnemuqOFxbYGrNz466UoZEF+hYOmerq2ObNp3Q+pz3FOnkFg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoDoEwW6i5WZPpN3a4A7udUxmNdqoRWIlJF41rCKoSISXd92it
	FCaX5dnd0+iT5oEEEV+gV3YRr2QEc9Z6EU97JijJdAyo7MVj+TYLBQBTH/K85cDgoVERAhmZOUA
	yz9ai3A8UkdTTSknYcmh7g2DhSPl1+0n1ibwOZlN9tv1aS0Y9/YDS+deIMDiW5jhKyZPd09saE4
	yVRhhmm5WlqY2Ka6gJfJ0r4MnhEuDd1FjF8V5Z
X-Gm-Gg: Acq92OG9Megw4Rdldp2ZVJUdqpH8kQ8pObhEIWaYnuI0Zqtp67f4qyF89qCrbQkQ0ck
	OzeOqe45YuBnlFtmMfCjJUeSb5G7u4f8q2dC16iwiALwUxlt6Rl2taDvOkUHFRKUHk13L7hOpoC
	P407L3Ye8N+JsgRjPbZIo325WhCwNvOMDgtXhA4VqDrPIp2LmzxONtV3el6IYLkWLGVoticNhGS
	8QYz/bgvgLFvR9r
X-Received: by 2002:a05:690e:d58:b0:660:a41d:d166 with SMTP id 956f58d0204a3-662699f02e8mr1204727d50.58.1781170260569;
        Thu, 11 Jun 2026 02:31:00 -0700 (PDT)
X-Received: by 2002:a05:690e:d58:b0:660:a41d:d166 with SMTP id
 956f58d0204a3-662699f02e8mr1204700d50.58.1781170260036; Thu, 11 Jun 2026
 02:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610083452.477759-1-eperezma@redhat.com> <202606111115.tKKe1qCE-lkp@intel.com>
 <20260611050140-mutt-send-email-mst@kernel.org> <aip9tNOx6WHIq22p@stanley.mountain>
In-Reply-To: <aip9tNOx6WHIq22p@stanley.mountain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 11 Jun 2026 11:30:23 +0200
X-Gm-Features: AVVi8CcR7__V5dwFrJc4_VvqCsOvRovXP1-XMWBLvqXqHGl62B4egwzD06z7cuQ
Message-ID: <CAJaqyWdQ7_1zYcfNVF_vQrrLHf_TRAbqS0X1kMQm7QMZ4UY+kA@mail.gmail.com>
Subject: Re: [PATCH v3] vduse: Add suspend
To: Dan Carpenter <error27@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, virtualization@lists.linux.dev, 
	Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	linux-kernel@vger.kernel.org, Laurent Vivier <lvivier@redhat.com>, 
	Yongji Xie <xieyongji@bytedance.com>, Maxime Coquelin <mcoqueli@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cwgPh5y6DcwlatsRBvBcvonaZzCMItFY1sv3R_8hxRI_1781170261
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 11:20=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Thu, Jun 11, 2026 at 05:03:24AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jun 11, 2026 at 10:18:51AM +0300, Dan Carpenter wrote:
> > > Hi Eugenio,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/=
vduse-Add-suspend/20260610-164534
> > > base:   next-20260609
> > > patch link:    https://lore.kernel.org/r/20260610083452.477759-1-eper=
ezma%40redhat.com
> > > patch subject: [PATCH v3] vduse: Add suspend
> > > config: arm64-randconfig-r072-20260610 (https://download.01.org/0day-=
ci/archive/20260611/202606111115.tKKe1qCE-lkp@intel.com/config)
> > > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > > smatch: v0.5.0-9185-gbcc58b9c
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202606111115.tKKe1qCE-lkp@intel.c=
om/
> > >
> > > smatch warnings:
> > > drivers/vdpa/vdpa_user/vduse_dev.c:577 vduse_vq_kick() warn: inconsis=
tent returns '&vq->kick_lock'.
> > > drivers/vdpa/vdpa_user/vduse_dev.c:1302 vduse_dev_queue_irq_work() wa=
rn: inconsistent returns '&dev->rwsem'.
> > >
> > > vim +577 drivers/vdpa/vdpa_user/vduse_dev.c
> > >
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  562  static void vduse_v=
q_kick(struct vduse_virtqueue *vq)
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  563  {
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  564    spin_lock(&vq->ki=
ck_lock);
> > >                                                         ^^^^^^^^^^^^^=
^^^^^^^^^^^^^
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  565    if (!vq->ready)
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  566            goto unlo=
ck;
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  567
> > > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  568    guard(rwsem_=
read)(&vq->dev->rwsem);
> > > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  569    if (vq->dev-=
>suspended)
> > > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  570            retu=
rn;
> > >
> > > unlock before returning?
> > >
> > > 9c4307e82fa1dc Eugenio P=C3=A9rez     2026-06-10  571
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  572    if (vq->kickfd)
> > > 3652117f854819 Christian Brauner 2023-11-22  573            eventfd_s=
ignal(vq->kickfd);
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  574    else
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  575            vq->kicke=
d =3D true;
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  576  unlock:
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31 @577    spin_unlock(&vq->=
kick_lock);
> > > c8a6153b6c59d9 Xie Yongji        2021-08-31  578  }
> >
> >
> > I think this is fixed by:
> >
> > commit e4a249d15eb2d4b28213bebb1eefaf2e6d99de0b (HEAD -> vhost, linux-n=
ext-vhost/linux-next, kernel.org/vhost, kernel.org/test)
> > Author: Nathan Chancellor <nathan@kernel.org>
> > Date:   Wed Jun 10 12:16:49 2026 -0700
> >
> >     vduse: Fix error around jumping over a __cleanup() variable
> >
> > right?
>
> These things haven't hit linux-next yet.  I found the email.
> https://lore.kernel.org/all/20260610-vduse_vq_kick-fix-guard-usage-v1-1-0=
ce02c08006e@kernel.org/
>
> That only fixes the bug in vduse_vq_kick(), not the bug in
> vduse_dev_queue_irq_work().  I don't see a fix for that
> yet on lore but I may have missed it.
>

No, I can test & send a fast patch for that.

Thanks!

