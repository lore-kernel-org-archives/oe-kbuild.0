Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298DC79C2
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713314189; cv=none; b=RULaqJRHqZiO4Z5DAA9c4SG1oNuUc7cvIdY4DW1o176V0yFVDs+AzTUQnDqkj+YqPfiJu82QaPtszt3dAL5QzMX0Ka02iyd+up1ZEEmDOKnG8ljV1pt1JgECcqyMjO9wcG3pfLmrlPBXGgHo7d0/BjPSs5isPCSg33uY9MFTJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713314189; c=relaxed/simple;
	bh=nZFcDUxsywflBa7UwNdu2ilJwX971YfCrzDwbmQT60Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QM2qNjb3w7+PLX2YhbxkROAqDiVC8NTtOXXhO+g6Fzzfj3AC/ePFMEloeTpH8D8k4KVN3F2mXEhT+GKPTehElqTgOfL/fo+3x4zd7fAzaqHIRVsXsbOF5+LupS/opBVauJ6SI72wP8MRLQjeKEfCkHreKA/A4MEMQx5bAGeCjjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ku6vnCzV; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ku6vnCzV"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so4828974276.1
        for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 17:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713314185; x=1713918985; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzuAMB5kZ9cysqwT31amJunolyCfXrs4TaDWxUZblGY=;
        b=Ku6vnCzV57MxxzUA+6A5UagQYIby+xNNc5/6izyf46iTeWDxOMycr4BiuDaSkUIwYR
         nfObUb71dNkUxEM+dYp5SipZfjxAWhb9lNfj0I+tYgmO1OeAvcvp1cXyU/YkqZoNb1tB
         erhxawPRsr6m7NVOitdk1M7qdVjrFYjJbt9AQ2KBosvLGXd7w2ibp0onvdmmyct24BUB
         YCi0V9Y+Cqi8V4Mhp6VPEVd6rf0i9KM+dcVYmdTh1dIms7xsvRhGTWUU+wW6Jf6tBM6p
         HrZbVsgcO55z7A/b6Yr9lzApgToUIUsaCrc+ZkZbuKNurXa2gO8hKCdwo1bgTOd4stRm
         phhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713314185; x=1713918985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzuAMB5kZ9cysqwT31amJunolyCfXrs4TaDWxUZblGY=;
        b=Zwo9U9Mh15zEuFMQP+HcObFBf/owDzwNh253I63u4wtLcH+k7QimMy49CspiMZ8Fsx
         RDCrTLWgeLFGrl4GD7ayTlZw2+wg0s+OGizc7DPmQOFiF+SHR4xXiAWAX1OBy0K8i+LJ
         ooDX+YoytD3ZOpeE+qMNNliE4/Kk6jEI+8pbzWg2XAlWKXXb/iuHnH7LoVz/kYRRKoHo
         APP3DpbG0GP6cTRuE2yNoPy0C4yFA+ZLe2AqoemyEMCb+Bpv7dtFWhqFUiFR2++FoWex
         9Y46kngfLNbiUlkh12VwrqusankxIk1/QpYj+ffSuLmDTPpD/gg2wGCTMXAYSsKwk1Rk
         BpvQ==
X-Gm-Message-State: AOJu0Yyd+Oa3/ifkB+z6Ot7Si4p9UdJ8GdKR0ubD0hHSLcxnDm3+21R4
	ZAdbru7x6b86diUzTIMWruoXrHMIjFBzmak9qGKUWEqXmuOb9EPLbSPdCdhRetnKpTrVqrQKdoG
	PQkpiBhBEYdprqnZCgPkTeHGVqi8j7hyN7kqoczk70kC57RlrQPKs
X-Google-Smtp-Source: AGHT+IHgn07Z06Nwink4x6GpgSvdH2TFVsTS0zKEIHaEjvyb68QnH4/vtJXPZ+SZXScI7OmGqUJnNFUrvaYTXdZz0w0=
X-Received: by 2002:a25:be8f:0:b0:dc6:23ac:9ef2 with SMTP id
 i15-20020a25be8f000000b00dc623ac9ef2mr13818240ybk.19.1713314184854; Tue, 16
 Apr 2024 17:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6b5281d8-2998-4e66-b65e-45a0e68e5780@moroto.mountain> <CAJuCfpE-YoTONXC-SYPfcjiMbfN64s9XScO_v-SAo0brB=6i1A@mail.gmail.com>
In-Reply-To: <CAJuCfpE-YoTONXC-SYPfcjiMbfN64s9XScO_v-SAo0brB=6i1A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 16 Apr 2024 17:36:13 -0700
Message-ID: <CAJuCfpH5VfxT+JNK9DmhDwYYiOVCxAuRvPgGnLVRK-=nt6TfuQ@mail.gmail.com>
Subject: Re: [linux-next:master 2720/3921] lib/alloc_tag.c:142
 alloc_tag_init() warn: passing zero to 'PTR_ERR'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 4:57=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Apr 5, 2024 at 6:51=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> > commit: 9e2dcefa791e9d14006b360fba3455510fd3325d [2720/3921] lib: add a=
llocation tagging support for memory allocation profiling
> > config: microblaze-randconfig-r081-20240405 (https://download.01.org/0d=
ay-ci/archive/20240405/202404051340.7Wo7oiJ5-lkp@intel.com/config)
> > compiler: microblaze-linux-gcc (GCC) 13.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202404051340.7Wo7oiJ5-lkp@intel.com=
/
> >
> > smatch warnings:
> > lib/alloc_tag.c:142 alloc_tag_init() warn: passing zero to 'PTR_ERR'
> >
> > vim +/PTR_ERR +142 lib/alloc_tag.c
> >
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  132  static int __init al=
loc_tag_init(void)
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  133  {
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  134       const struct co=
detag_type_desc desc =3D {
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  135               .sectio=
n        =3D "alloc_tags",
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  136               .tag_si=
ze       =3D sizeof(struct alloc_tag),
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  137               .module=
_unload  =3D alloc_tag_module_unload,
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  138       };
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  139
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  140       alloc_tag_cttyp=
e =3D codetag_register_type(&desc);
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21  141       if (IS_ERR_OR_N=
ULL(alloc_tag_cttype))
> >                                                             ^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
> > This should just be IS_ERR().  I have written a blog that has more
> > details:
> >
> > https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-a=
nd-null/
>
> Sorry for the delay, I somehow missed this report. You are absolutely
> right about the fix. codetag_register_type() never returns NULL, so
> IS_ERR() should be used here. I'll post a fix shortly.

Here: https://lore.kernel.org/all/20240417003349.2520094-1-surenb@google.co=
m/

> Thanks,
> Suren.
>
> >
> > 9e2dcefa791e9d Suren Baghdasaryan 2024-03-21 @142               return =
PTR_ERR(alloc_tag_cttype);
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
