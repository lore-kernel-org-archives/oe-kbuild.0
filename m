Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5CE55E53;
	Mon, 10 Jun 2024 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718007705; cv=none; b=ZGz5glmvYgfgAMXC1WcY1zFq7GYHleEupl7VPCpRpj77f8dhdjbCs7+/RWq3PKa6XTMAAjvh/An3X+CWk8YsApmSRJHauY/62/Qrr4b2OrBGOD5pKlDu/bgHt+gSuNE/auJIyyKG7dXzP3FGPbrLbLIzOBoQnHs/ICabjDIffJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718007705; c=relaxed/simple;
	bh=68qVpkivRPu/UqBy8a5aM/GcH3KxSp5sMnJQNIuc4FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAnVIOkLeTdxTC9XrNjddvIfr/5z7VXTFSUWEEF80VZkf7BV1+mHKLEMXMvfwLAwUbDSQsZqIutR0TFnX0hJX233xfqeJ0pwSV+Q/LnuEdl/+4k9X37P6mh2D/S9RGC6QzhaYePhSgZ8pm7YH5NcazxetC+z0XAlpB+1Qssz8Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwjk+5AG; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwjk+5AG"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57c76497cefso1370984a12.1;
        Mon, 10 Jun 2024 01:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718007702; x=1718612502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwKWNr3+SkhJYsnRjSQdpuuiDdqh1Y+N1jlC0TkNGnY=;
        b=hwjk+5AGjbw3zaXUIj08TQ7sCTTFvxo3V3qW2tRXE2XfSRs3hVjVCR4wRfU0bjjZxL
         sq5jqelqTpMLdzlgj4D1XwYXCdVEAYmGvgsLXvmN/HtnUkIFyfWGs3wD3XqZEz3EEJ+v
         jS9QEMDZyPtN+wHMWS+1jmfR5ZBHp9AAIbyWBzfcFgZSowFjaY5oFXuQrgIWWKpAHXC9
         sAvnw/A/JF+LJ5AnswtV77xexKy4bDcxn9YPWPPCYx35/ZeAKtwA0Bc2yXLSvsJgKcRZ
         qxVea+NCfvWfjCuk03E/Xo1jzPn+lUihPcI3bKUXSjxpqzuoDv72R1qWFMyjqURUjpBD
         GBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718007702; x=1718612502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwKWNr3+SkhJYsnRjSQdpuuiDdqh1Y+N1jlC0TkNGnY=;
        b=oRM8fYRcmk1xFPR5ZfB/06Eirj9AONpFkU4rG8qlmEYujSPzjbmlX1xo6YjZNlUSPG
         VS1+abx+uoRaDX6N/zvVSrFnN6Mz0xdUAbBuoYsBTpDvlNqaPfXL1iKHowRisTnwtmE8
         I7DpzsLFYYPC8nNq5QOkWQTg8uCJhi3CWtSMuhjbz6x6E3xLfXNqqxYHT2SaSK2FWvDw
         MZyc2R6XRgSdakwg/h2Q7Xx6onpCKC6/0bYWIrPhPexqUc0NNXfDRbu7E7wWuex3XPM7
         BaFlgU/7uDkqDiX5uETH8GNPtRWEvlnuTxDcDdqY6L4yBNAol0IDQTZm85zbk8W6Keu7
         D3xg==
X-Forwarded-Encrypted: i=1; AJvYcCUcdhuaXKWp28DzjPOR4HRVLa8xSrqg5afGguuHIcJW8/ylTJj0DCwUD5JJ+pFyc/26Nx83vTW20QaAI/uDESmaH7RtLqgnG73+Vf2Z1Q==
X-Gm-Message-State: AOJu0Yzvjas2giQrygn4+6S2yqrtzkrAf8pWCTadVhAysZAWzLCsweYz
	ocCYUZzHQs+QU1FFWq7odYLnU7sn5ez4NkK+UMHsgJIjLYzRPjk7zVKWwrRWPlxRlwLcl30fQhZ
	u6IM4Ze76uT5PVU2tH93EzR6xB/U=
X-Google-Smtp-Source: AGHT+IFoeL0ZvocmrGv43whyPh4WdDBovgyiR6rzdf6LIdVEfBJkv89u568WYmQekhY/GtCxdAuSJSZUaxZnt6i/1Cc=
X-Received: by 2002:a17:907:174d:b0:a6e:f8d6:f61d with SMTP id
 a640c23a62f3a-a6ef8d6f7e5mr399407866b.50.1718007701813; Mon, 10 Jun 2024
 01:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607190955.15376-3-fgriffo@amazon.co.uk> <714268da-d199-4371-8360-500e7165119c@moroto.mountain>
In-Reply-To: <714268da-d199-4371-8360-500e7165119c@moroto.mountain>
From: Frederic Griffoul <griffoul@gmail.com>
Date: Mon, 10 Jun 2024 09:21:31 +0100
Message-ID: <CAF2vKzPWANE8DBcN8mvpk2fwRRL2kF0-VXP5EygY2tBGJgDjrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity support
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Fred Griffoul <fgriffo@amazon.co.uk>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Waiman Long <longman@redhat.com>, Zefan Li <lizefan.x@bytedance.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Jeremy Linton <jeremy.linton@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	Eric Auger <eric.auger@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Ye Bin <yebin10@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pff. Thanks Dan,

I will post a v5 to address the two issues you mentioned.

Br,

Fred

On Sun, Jun 9, 2024 at 4:29=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Hi Fred,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Griffoul/cgro=
up-cpuset-export-cpuset_cpus_allowed/20240608-031332
> base:   cbb325e77fbe62a06184175aa98c9eb98736c3e8
> patch link:    https://lore.kernel.org/r/20240607190955.15376-3-fgriffo%4=
0amazon.co.uk
> patch subject: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity suppor=
t
> config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/ar=
chive/20240609/202406092245.Hgx6MqK9-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406092245.Hgx6MqK9-lkp@intel.com/
>
> New smatch warnings:
> drivers/vfio/pci/vfio_pci_core.c:1241 vfio_pci_ioctl_set_irqs() warn: may=
be return -EFAULT instead of the bytes remaining?
>
> vim +1241 drivers/vfio/pci/vfio_pci_core.c
>
> 2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1190  static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *v=
dev,
> 663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1191                                  struct vfio_irq_set __user *arg)
> 2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1192  {
> 2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1193       unsigned long minsz =3D offsetofend(struct vfio_irq_set, cou=
nt);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1194       struct vfio_irq_set hdr;
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1195       cpumask_var_t mask;
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1196       u8 *data =3D NULL;
> 05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-=
12  1197       int max, ret =3D 0;
> ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-=
17  1198       size_t data_size =3D 0;
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1199
> 663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1200       if (copy_from_user(&hdr, arg, minsz))
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1201               return -EFAULT;
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1202
> 05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-=
12  1203       max =3D vfio_pci_get_irq_count(vdev, hdr.index);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1204
> ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1205       ret =3D vfio_set_irqs_validate_and_prepare(&hdr, max, VFIO_P=
CI_NUM_IRQS,
> ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1206                                                &data_size);
> ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-=
17  1207       if (ret)
> ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-=
17  1208               return ret;
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1209
> ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-=
17  1210       if (data_size) {
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1211               if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY) {
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1212                       if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1213                               return -ENOMEM;
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1214
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1215                       ret =3D copy_from_user(mask, &arg->data, dat=
a_size);
>
> copy_from_user() returns the number of bytes remaining to be copied.
> This should be:
>
>         if (copy_from_user(mask, &arg->data, data_size)) {
>                 ret =3D -EFAULT;
>                 goto out;
>         }
>
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1216                       if (ret)
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1217                               goto out;
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1218
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1219                       data =3D (u8 *)mask;
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1220
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1221               } else {
> 663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1222                       data =3D memdup_user(&arg->data, data_size);
> 3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-=
07  1223                       if (IS_ERR(data))
> 3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-=
07  1224                               return PTR_ERR(data);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1225               }
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1226       }
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1227
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1228       mutex_lock(&vdev->igate);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1229
> ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1230       ret =3D vfio_pci_set_irqs_ioctl(vdev, hdr.flags, hdr.index, =
hdr.start,
> ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1231                                     hdr.count, data);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1232
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1233       mutex_unlock(&vdev->igate);
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1234
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1235  out:
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1236       if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY && data_size)
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1237               free_cpumask_var(mask);
> 66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-=
07  1238       else
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1239               kfree(data);
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31  1240
> 89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-=
31 @1241       return ret;
> 2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-=
31  1242  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
