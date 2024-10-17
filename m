Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A531DC1A4;
	Thu, 17 Oct 2024 11:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729163355; cv=none; b=aHuBeE6Tou4m2bu9cb5Qi9isxJxdFEJWpZDmM034r5Uv2QoLve3Nbl6KlLq7OfErMP2wWdorerixJP2QzTI+57NgeRxLlqoaxuiErpMAQdohmhbXfYhSptZzVX53JoVmw2IGyXVfUB21UvXEUJhddlVMt1Qm48FemviPKynXoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729163355; c=relaxed/simple;
	bh=2FNuYyeHMQ8JKGGNhq1qu5oZuY5ADJyF92IWL7xTkUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKZ5klzGTRknwIeP0J4eow+2UCq7qaltCvU1yZepiC9IS416N7B7mog6Dmp23e9tmpMuOebhXPWlldzAPsQas+9NPpQAI4pWgASZa7YDSIlKZ59mMOJEWoGA/1wZcuxEsCzsPLepNEPVybBhDKzpJOfjiKjqcKxifPK87ZAFuiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzbZZBDE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzbZZBDE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so990100a12.0;
        Thu, 17 Oct 2024 04:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729163350; x=1729768150; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3douvtpLsUx3AakEC5m5aR6A7p1Pr4kaWKKKD9KYE+Q=;
        b=FzbZZBDEyP+wr9arFSCwmmT2PfIl4spbUh+qKo5UeITux5KhTBtrVq1VPyOxsZyrFF
         xZ+FLDsL1xq2/Kq1jTCJT30GHAt0D7ReOfbafrwdVzhk+ucwVEUlOqpp++Glzh+agUGi
         NzAz3DvvsaxagLAk2VOO/7bz5rEFPWMEhY3vXqd3BB5hfBKZDBhCT9yANT24SzMzefSs
         Q0CEcAECXFZBWQDWR3TX5dOtOaQGOueLoJ0fC1nMNAym6ilMBxUubo2fFgH97AGqgZfI
         nusRkXOowrrBGhwzE7rbOLiO6BMZUMky5VS/tcn6BvBgmorUnzwgnjzJ9V2aKhfNuV56
         OkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729163350; x=1729768150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3douvtpLsUx3AakEC5m5aR6A7p1Pr4kaWKKKD9KYE+Q=;
        b=qj7aKmxdvH/iY9Ag8aOJYfesxvuj5BhSses72d1sVO8k7u5/99QfPSeHG+0Z2SnvSi
         DW9d+4Z2VXNZdgoXa+cxSDVIm3W41O2s2RvPHgPRgHRT1UDS1rAioIM9sjSTz0/Ycwjg
         7R0vHRCSWFAN/ssneMAbucsgUfDtaXTqCsjvn5XJV3aBMUwYtKIKZNU0SxJNLl+ZfSqv
         0RUn4VWhUQeRn/lfUspzGZ16bSfxcE77n0ig/iqjyPoociTBMqpX0aJ5cwWN/sza+GG4
         BsGWWzL7yxZe0x7DwW6SzZT7jArtk6MmoK4hQYCvIeKaSxaG/cJOei+leThwBEcDqg3K
         fL/A==
X-Forwarded-Encrypted: i=1; AJvYcCVAQOab/2Hv0MsbpaCcH9uZvMrCqSdBIMCp98K80xual7qEVpwu/Q/PjKXcpuHqCuacurp9ZpRmEtFNo44T@lists.linux.dev
X-Gm-Message-State: AOJu0YwOzO9XMnDFuholEIOA8IDBElPjRBCzRzZnwyTzFHYUrO52Vexe
	QN5BXEb4+rMIbziqRprcvzHzcsE//5v9nYQpVUE9tKOwzjnq/E2Kaqh21foYHkDyin4OnRa/peA
	1f/xZrIq1CljfDzFgVc6SKBiuT4w=
X-Google-Smtp-Source: AGHT+IHd22yNSgtHkexQd1qDKDJ44tq/+TpDvOZkbi+jKQMsmVZa3qkBv3TtbZgQcG7pUZABbm9JOkq2QMZ3n20X13o=
X-Received: by 2002:a05:6402:520e:b0:5c8:9f81:43e4 with SMTP id
 4fb4d7f45d1cf-5c99501c722mr6352803a12.7.1729163350172; Thu, 17 Oct 2024
 04:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014131416.27324-1-vimal.agrawal@sophos.com> <f38e017e-40ef-4241-8701-fc56c5c2d06d@stanley.mountain>
In-Reply-To: <f38e017e-40ef-4241-8701-fc56c5c2d06d@stanley.mountain>
From: Vimal Agrawal <avimalin@gmail.com>
Date: Thu, 17 Oct 2024 16:38:58 +0530
Message-ID: <CALkUMdSzeH-7=jXsGV1+ubzfqHVOC3z0RbN9BG08HTKwFoAWeg@mail.gmail.com>
Subject: Re: [PATCH] misc: misc_minor_alloc to allocate ids for all
 dynamic/misc dynamic minors
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, linux-kernel@vger.kernel.org, 
	gregkh@linuxfoundation.org, arnd@arndb.de, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, vimal.agrawal@sophos.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Both warning and missed case for return from this function for static
minor are already fixed in the v2 version of the patch. I will be
sending out the v3 version shortly ( after splitting it from kunit
changes).
Thanks for pointing this out.

Vimal

On Wed, Oct 16, 2024 at 7:52=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Vimal,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vimal-Agrawal/misc=
-misc_minor_alloc-to-allocate-ids-for-all-dynamic-misc-dynamic-minors/20241=
014-211915
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20241014131416.27324-1-vimal.agr=
awal%40sophos.com
> patch subject: [PATCH] misc: misc_minor_alloc to allocate ids for all dyn=
amic/misc dynamic minors
> config: sparc64-randconfig-r072-20241015 (https://download.01.org/0day-ci=
/archive/20241016/202410161811.aIPEJHOt-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410161811.aIPEJHOt-lkp@intel.com/
>
> smatch warnings:
> drivers/char/misc.c:89 misc_minor_alloc() error: uninitialized symbol 're=
t'.
>
> vim +/ret +89 drivers/char/misc.c
>
> d52c84545e305b Vimal Agrawal    2024-10-14  66  static int misc_minor_all=
oc(int minor)
> ab760791c0cfbb D Scott Phillips 2022-11-14  67  {
> ab760791c0cfbb D Scott Phillips 2022-11-14  68          int ret;
> ab760791c0cfbb D Scott Phillips 2022-11-14  69
> d52c84545e305b Vimal Agrawal    2024-10-14  70          if (minor =3D=3D =
MISC_DYNAMIC_MINOR) {
> d52c84545e305b Vimal Agrawal    2024-10-14  71                  /* alloca=
te free id */
> ab760791c0cfbb D Scott Phillips 2022-11-14  72                  ret =3D i=
da_alloc_max(&misc_minors_ida, DYNAMIC_MINORS - 1, GFP_KERNEL);
> ab760791c0cfbb D Scott Phillips 2022-11-14  73                  if (ret >=
=3D 0) {
> ab760791c0cfbb D Scott Phillips 2022-11-14  74                          r=
et =3D DYNAMIC_MINORS - ret - 1;
> ab760791c0cfbb D Scott Phillips 2022-11-14  75                  } else {
> ab760791c0cfbb D Scott Phillips 2022-11-14  76                          r=
et =3D ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
> ab760791c0cfbb D Scott Phillips 2022-11-14  77                           =
             MINORMASK, GFP_KERNEL);
> ab760791c0cfbb D Scott Phillips 2022-11-14  78                  }
> d52c84545e305b Vimal Agrawal    2024-10-14  79          } else {
> d52c84545e305b Vimal Agrawal    2024-10-14  80                  /* specif=
ic minor, check if it is in dynamic or misc dynamic range  */
> d52c84545e305b Vimal Agrawal    2024-10-14  81                  if (minor=
 < DYNAMIC_MINORS) {
> d52c84545e305b Vimal Agrawal    2024-10-14  82                          m=
inor =3D DYNAMIC_MINORS - minor - 1;
> d52c84545e305b Vimal Agrawal    2024-10-14  83                          r=
et =3D ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
> d52c84545e305b Vimal Agrawal    2024-10-14  84                  }
> d52c84545e305b Vimal Agrawal    2024-10-14  85
> d52c84545e305b Vimal Agrawal    2024-10-14  86                  if (minor=
 > MISC_DYNAMIC_MINOR)
> d52c84545e305b Vimal Agrawal    2024-10-14  87                          r=
et =3D ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
>
> What about if minor is >=3D DYNAMIC_MINORS (128) but <=3D MISC_DYNAMIC_MI=
NOR (255)?
>
> d52c84545e305b Vimal Agrawal    2024-10-14  88          }
> ab760791c0cfbb D Scott Phillips 2022-11-14 @89          return ret;
> ab760791c0cfbb D Scott Phillips 2022-11-14  90  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
