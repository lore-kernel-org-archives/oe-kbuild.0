Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2FD2F2C65
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752685239; cv=none; b=enigQD3w101ZVXDMeTfYSWzfuCErEDqLNCDyV9GMKoL4vDmP7HG/LWXa0n0Er6A9tIj0pH1Xc5/6GJ7TPaoKrwKllwURIqcl3zAYUcE+oHowbdlVBy0fxPFk9R1wdZoF2z1NUV3iOMLChmG8ii9VhnOc5YsZoYZdPPnZpwWZM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752685239; c=relaxed/simple;
	bh=VT2e/D8TNHzCkI96xQbHOMePD40bqojitO9TYfZwJRU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9vlC68YLW3GK9m78Q+5d08U6ertMparZ56tDeqV7qdrHDKHDAC9rsV5YtqwiK3+PAB8ArWref83Dj1nhxbvJB/K8l9mQikX54nIHMKheWrgvxqNvfSf0AgOBzGk3NCS6CwEGahTZPlt6ZwXfuCpi1UypFpzq7NqYf+yx9Dlp6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGW2SqND; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGW2SqND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752685232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9bKE/0cNtoQ/CuczzprbbV3beLrr2MpjH/0TxwAvYDI=;
	b=EGW2SqNDS+bbvfZeAe7m0XkeSE/5InZp+3e8Cm9971xBLykYMr0Id2ZKD6lhZf2L14cb7E
	m/7j21puwycBSAL1z5yPa+WPPIcNV7qCtSSmndOl4e2MIfmaQBvEJL0v9ZDdhcEouARXw7
	N1R7nTs676nXIO0KAIF44/eoIk4Gb3s=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-9eNrbLtVNjKwWl0fENrLNg-1; Wed, 16 Jul 2025 13:00:31 -0400
X-MC-Unique: 9eNrbLtVNjKwWl0fENrLNg-1
X-Mimecast-MFC-AGG-ID: 9eNrbLtVNjKwWl0fENrLNg_1752685230
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86cf803792dso23839f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 16 Jul 2025 10:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752685230; x=1753290030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bKE/0cNtoQ/CuczzprbbV3beLrr2MpjH/0TxwAvYDI=;
        b=Rz5ONlNgilhdEUbxRulLrVKnbRKPi5FcnW2UnLNKYIcLRhlYlP5aO7GrvUrwKvf/An
         AnACb4N7lTdBDIuwl0C9roJdc0DmepK7PE9t/X4vzuVt8QF61ZtrEHKJJgJQQB0SF9Zi
         KzXKFvHvuQhqnzy1Y7nGU0vSaxzQS5Y0mxVdzsGeDiQRQExtIreBDSL0Q+yeM00/GSU6
         yr3H59sfQYW0uF4nKDZbq8e6AByV42+t7mnU/g2EpH3lciMYgLPMkdhegqKcYjyN37R+
         2k0m2zUqH+QS8e1Qd7i05kiDfktnNW/wB4lsMAcVrerBIUB/77GoNZ18v92iGrSaeUET
         hB4w==
X-Forwarded-Encrypted: i=1; AJvYcCWOKKockzpENfnQC6RC/MpsIjN6fEvk3vcgd5Foo/I3euCdzDnx7LoL5ghK8cun7QktqtAEOBBBcpw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzGrpj1491XYqLA7/MtrMIZ3SkWzj1WsCAw9CxgGivOb1gDX+r
	Teh3m46AO7svEzYx7zY7moeyckaSba21eEGFjCrbSAc43BdvDK1CkB54J/+wue6qLqQfO9Q/9km
	VBn+iVYyfBAepEIpoy9lZB9rLsyEML7ll9IR/+WbsNNzIq2C7yGl6NdXD/OxD+Q==
X-Gm-Gg: ASbGncvpZ+igtlFeYfswERtD7iRPl6l5dNsUXqYFWgC8ZiHW1Tx4kZbNQ8qJCi13H8f
	DU8Dl6RVB9WH3/fvEj4ryNS1ROifGLhL/uEQ3QOGLtWjreLua4h6gFUWopGQWLibzhIaYXKwpBY
	gRS/p+dZ7Fx28hFelxX5HIevytbNyrbSR6/T62TG7rS2IPXVaJsYcdZdSAKXUGSMJIRZ/9cPw5s
	0gGs9V5eUpgupvmzDlltInwq49byVL8oBhwo0ugpzSvs3CgGCt8s0oiQ6AYaTdJxt+GqoMwWrSl
	zHxLPJKxFHxOkkbUr8d9iHgBPvelCJ0ywIyIh7jOYdw=
X-Received: by 2002:a05:6602:1690:b0:85e:12c1:fe90 with SMTP id ca18e2360f4ac-879c096efeamr126747239f.5.1752685229879;
        Wed, 16 Jul 2025 10:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tZmWUIYwitvuBgGnxfswO12NMpp8mD2icMHkWg5+YtIZRRU8sqVvx4qLf0KrRuHgGBPToA==
X-Received: by 2002:a05:6602:1690:b0:85e:12c1:fe90 with SMTP id ca18e2360f4ac-879c096efeamr126745539f.5.1752685229362;
        Wed, 16 Jul 2025 10:00:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-505569d0e42sm3119302173.101.2025.07.16.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:00:28 -0700 (PDT)
Date: Wed, 16 Jul 2025 11:00:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, kvm@vger.kernel.org, Longfang Liu
 <liulongfang@huawei.com>, qat-linux@intel.com, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, virtualization@lists.linux.dev, Xin
 Zeng <xin.zeng@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v3] vfio/pci: Do vf_token checks for
 VFIO_DEVICE_BIND_IOMMUFD
Message-ID: <20250716110027.7e94129f.alex.williamson@redhat.com>
In-Reply-To: <20250715230618.GV2067380@nvidia.com>
References: <0-v3-bdd8716e85fe+3978a-vfio_token_jgg@nvidia.com>
	<76f27eb9-7f56-45e7-813e-e3f595f3b6e9@suswa.mountain>
	<20250715230618.GV2067380@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b9R4ryj8-IOwCjvCeGF0gRJd8HOxHoNhyfiaPIJKyKs_1752685230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Jul 2025 20:06:18 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Jul 16, 2025 at 01:55:45AM +0300, Dan Carpenter wrote:
> > 5fcc26969a164e Yi Liu          2023-07-18  117  	mutex_lock(&device->dev_set->lock);
> > 5fcc26969a164e Yi Liu          2023-07-18  118  	/* one device cannot be bound twice */
> > 5fcc26969a164e Yi Liu          2023-07-18  119  	if (df->access_granted) {
> > 5fcc26969a164e Yi Liu          2023-07-18  120  		ret = -EINVAL;
> > 5fcc26969a164e Yi Liu          2023-07-18  121  		goto out_unlock;
> > 5fcc26969a164e Yi Liu          2023-07-18  122  	}
> > 5fcc26969a164e Yi Liu          2023-07-18  123  
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14  124  	ret = vfio_df_check_token(device, &bind);
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14  125  	if (ret)
> > be2e70b96c3e54 Jason Gunthorpe 2025-07-14 @126  		return ret;
> > 
> > This needs to be a goto unlock.  
> 
> Oop yes, thank you
> 
> Alex can you fix it up when applying?

Yes, I'll apply with:

diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
index 53a602563f00..480cac3a0c27 100644
--- a/drivers/vfio/device_cdev.c
+++ b/drivers/vfio/device_cdev.c
@@ -123,7 +123,7 @@ long vfio_df_ioctl_bind_iommufd(struct vfio_device_file *df,
 
 	ret = vfio_df_check_token(device, &bind);
 	if (ret)
-		return ret;
+		goto out_unlock;
 
 	df->iommufd = iommufd_ctx_from_fd(bind.iommufd);
 	if (IS_ERR(df->iommufd)) {

