Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B880154652
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757618526; cv=none; b=PsJbz0mLX5mFOoOVWT2/QaByf2ZOsP9xbSuvUDByi25LhZG3BB4HMNuJr1M9L1DSEMZOgmg6fr+zsFbLOUmbLcc+TwoX8e4BQNtB9J+OFBKo07vhb30ZqcFSeFpYQCYOUy9eDrQKn3lcrn3Pki3MiVxx1tvBjp7vnJ+HiZ+BO2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757618526; c=relaxed/simple;
	bh=lJSKtlCdSA8FR4fOHvIrXDNpM7SmVa3VC+s7wmRjvzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfYzNpjXGxzREARA4K0yuCI4cDOCRx3cCdmbwu8HWd/lte5+f+Mt2XJOGyju0pAzNslZKdxGHtWKTzJmN0YLq2MCSPP8h/tKLS+Fv/i8dVSFRIGFEWVYEOYrVjGKVOIOOEjB8rAiaQJGV8cmkb9tagyhAupLqY8wBfuP3EagVx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jLuF665d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jLuF665d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757618523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vPAAIBSdPkpUMbvgdCZ5DvLOlR8DyORx2hSMbeOUIlA=;
	b=jLuF665d+/Oh5aBwAhrqex3ISUEdqSUB7DxjVYjVSqx/WhBvym1IuQz1Ho9w131QGv9oo6
	J2nPE6B7j91k2h725j0OxbL6gBlThkHmcltoPPbZ9Q6qI1pbf7RA8i8JC9CfNEN4pLJUoB
	sDZYz1QL2Pz0Ih8fKPLbn0aqrnwXHQM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-JluEmu89NzeZgBSHSeUVDQ-1; Thu, 11 Sep 2025 15:22:02 -0400
X-MC-Unique: JluEmu89NzeZgBSHSeUVDQ-1
X-Mimecast-MFC-AGG-ID: JluEmu89NzeZgBSHSeUVDQ_1757618522
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e96d57eb1d0so1309391276.3
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Sep 2025 12:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757618521; x=1758223321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPAAIBSdPkpUMbvgdCZ5DvLOlR8DyORx2hSMbeOUIlA=;
        b=Rm4LVje4VKzqpGbohtC9uvHIEI6X0pmLxUvslT+k8xaLyaDyHanbAxOCJfmwKNMfgc
         fSapDaAxbXToF2PsHdqAhCXiB6ajebmhqB/buwyZgLJBQmI73E4quv9G+zw7tO1PMQEN
         1Tgiv4wv9BtCMx/ZN3qgfdqpj0p5iMdOp9tIWddmTDPPRmQNqsMAUaOQSzDwJaIZOZf0
         wCyhUj5dIPEoz0zKiOl97LVHo4rP5KyieLqOLwhOtLT4K3ykAfmIIJZf36n8licrw0eO
         t6ZYOyur/Tyu38112RAPl1cfLKTQo9QZPWikb+iD0UwscuskM8ikbvladn5uf4dvICqK
         /biQ==
X-Gm-Message-State: AOJu0YxJgDjLnmd2COqdSQO45RdDuK3Avq6YJfz/Ryo04JIAgkxGzQPH
	BGuFdV4Zs0zDCmrcRrb4mYehaI1ppvKnYwXPEQ/weYqE6j/AmEjCXkq5Llf1heDE5f+f71FB18M
	OHipGsX6+6HOiWIN0BkJQAeNJZcu4l+ri03w9r+zeOkSNgje/9E3hEwOb0HvE63zGq7RVaSipyq
	6FaVoMM+EUKkBeZ5FMDZB9QTPbQwnVIw9Kz76xvif4EaNPlDY=
X-Gm-Gg: ASbGncvgFrkkLJ8VIvnG9v8V+rFYBYo1cQvbcjSuex8ek2/npTanO0IrKU/HAZmTanR
	YIrj8UY0o7XqMn6J8X/btEl775dnag5sLhMCQTQGMKZ6NrpT61I3GsOoG1+oJP4ODdWkqy5yqZS
	Z9knVgX7bxGEFilywWUt8jYDjEftr+PZrRRBk22GT9SItqCnnemkKJhA==
X-Received: by 2002:a05:6902:6184:b0:e97:84b3:96d0 with SMTP id 3f1490d57ef6-ea3d99eef8fmr304021276.11.1757618521302;
        Thu, 11 Sep 2025 12:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVuQF6GFPmwF+PLi/eB0mkl/3ba9Iz7OdiTzhjWOSJbmY/G6DWp00LZmh091qOxLmVftjW+ssS7c6q051r8ms=
X-Received: by 2002:a05:6902:6184:b0:e97:84b3:96d0 with SMTP id
 3f1490d57ef6-ea3d99eef8fmr304001276.11.1757618520791; Thu, 11 Sep 2025
 12:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202509120229.YpG1CcD3-lkp@intel.com>
In-Reply-To: <202509120229.YpG1CcD3-lkp@intel.com>
From: Denis Aleksandrov <daleksan@redhat.com>
Date: Thu, 11 Sep 2025 15:21:49 -0400
X-Gm-Features: Ac12FXwf_L1AGGZDpDhox13jXjFaaf_nkx5ME2J1foFJp4pRfqdXkBY6CcHANhI
Message-ID: <CAG+gbFc=hxHSGxh5fFBSfs7GB1Z2aS-b0MkmyQaCP-o9P7Xw8g@mail.gmail.com>
Subject: Re: [linux-next:master 7959/8263] drivers/char/tpm/tpm_ppi.c:349
 tpm_show_ppi_tcg_operations() warn: inconsistent returns 'global &tpm_ppi_lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Jarkko Sakkinen <jarkko@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ri2acdxA1Ybkh7L_S3feCvfejBdpF3nC0XurIdQ3iN8_1757618522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 2:56=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> commit: 18aada46edf7f79dba1ab89a100d0fc350d4a5c8 [7959/8263] tpm: Prevent=
 local DOS via tpm/tpm0/ppi/*operations
> config: x86_64-randconfig-161-20250911 (https://download.01.org/0day-ci/a=
rchive/20250912/202509120229.YpG1CcD3-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509120229.YpG1CcD3-lkp@intel.com/

Jarkko, would you like me to send a separate patch or a v5?

>
> smatch warnings:
> drivers/char/tpm/tpm_ppi.c:349 tpm_show_ppi_tcg_operations() warn: incons=
istent returns 'global &tpm_ppi_lock'.
> drivers/char/tpm/tpm_ppi.c:378 tpm_show_ppi_vs_operations() warn: inconsi=
stent returns 'global &tpm_ppi_lock'.
>
> vim +349 drivers/char/tpm/tpm_ppi.c
>
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  323  static ssize_t tpm_show=
_ppi_tcg_operations(struct device *dev,
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  324                         =
                  struct device_attribute *attr,
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  325                         =
                  char *buf)
> f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  326  {
> 9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  327        struct tpm_chip *=
chip =3D to_tpm_chip(dev);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  328        ssize_t len =3D 0=
;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  329        u32 ret;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  330        int i;
> 0dc553652102c5 Jarkko Sakkinen   2014-12-12  331
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  332        spin_lock(&tpm_pp=
i_lock);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  333        if (!ppi_cache_po=
pulated) {
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  334                len =3D c=
ache_ppi_operations(chip->acpi_dev_handle, buf);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  335                if (len <=
 0)
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  336                        r=
eturn len;
>
> spin_unlock(&tpm_ppi_lock) before returning.

Hi Dan, thanks for the catch!

>
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  337
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  338                ppi_cache=
_populated =3D true;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  339        }
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  340
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  341        for (i =3D 0; i <=
=3D PPI_TPM_REQ_MAX; i++) {
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  342                ret =3D p=
pi_operations_cache[i];
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  343                if (ret >=
=3D 0 && ret < ARRAY_SIZE(tpm_ppi_info))
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  344                        l=
en +=3D sysfs_emit_at(buf, len, "%d %d: %s\n",
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  345                         =
                               i, ret, tpm_ppi_info[ret]);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  346        }
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  347        spin_unlock(&tpm_=
ppi_lock);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  348
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10 @349        return len;
> f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  350  }
> f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  351
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  352  static ssize_t tpm_show=
_ppi_vs_operations(struct device *dev,
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  353                         =
                 struct device_attribute *attr,
> 81198078d7da42 Xiaoyan Zhang     2013-08-29  354                         =
                 char *buf)
> f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  355  {
> 9b774d5cf2db4b Jarkko Sakkinen   2015-04-14  356        struct tpm_chip *=
chip =3D to_tpm_chip(dev);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  357        ssize_t len =3D 0=
;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  358        u32 ret;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  359        int i;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  360
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  361        spin_lock(&tpm_pp=
i_lock);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  362        if (!ppi_cache_po=
pulated) {
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  363                len =3D c=
ache_ppi_operations(chip->acpi_dev_handle, buf);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  364                if (len <=
 0)
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  365                        r=
eturn len;
>
> Same.
>
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  366
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  367                ppi_cache=
_populated =3D true;
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  368        }
> 0dc553652102c5 Jarkko Sakkinen   2014-12-12  369
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  370        for (i =3D PPI_VS=
_REQ_START; i <=3D PPI_VS_REQ_END; i++) {
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  371                ret =3D p=
pi_operations_cache[i];
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  372                if (ret >=
=3D 0 && ret < ARRAY_SIZE(tpm_ppi_info))
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  373                        l=
en +=3D sysfs_emit_at(buf, len, "%d %d: %s\n",
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  374                         =
                               i, ret, tpm_ppi_info[ret]);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  375        }
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  376        spin_unlock(&tpm_=
ppi_lock);
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10  377
> 18aada46edf7f7 Denis Aleksandrov 2025-09-10 @378        return len;
> f84fdff0fdcda7 Xiaoyan Zhang     2012-08-22  379  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Best,
Denis

