Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AF6AB7
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jan 2024 02:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706668650; cv=none; b=Z8eFUtdMrDNZqkdZUm0qzSFUxGvfKYkyzRoPciwddJ2pgHfbBVZdZoJxKd/8HNo4WRcRHee9IQoJr3MmsU9sgT4EihXnTO6UjqGBZx9I4RZcPVqK2bfmrPdQuhmXWm8g5tsmAejpwivPmrkDHV6NpRhVO/VUHZMle+jQSCpS4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706668650; c=relaxed/simple;
	bh=nZ4XNSmcSbdyCrid9JVdVBT0uPDRbopwRW1lY70TWwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPyr2ZwnqvKxqma9F/O9t1g5akjlGDEI5mCJlVS95TsLLLvCciud+7blRCcEfb8sQI6Xlc7xQwU1OpFQxWKnL/h6pPLNe6LS6FI2giHdAQZTyypxX6BMVY9ECvs944Iq1VhFbhBM8dTXTSe4Mk+7cN+N+UhQxmJ2BlTV3tEiSCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lKm9hJVJ; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lKm9hJVJ"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc24f395c84so389071276.1
        for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706668647; x=1707273447; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFtM9M9RNSsCscdub7UbZbmrBPSDwKReEdWaEJLTDYQ=;
        b=lKm9hJVJyW39lhNpQvk6hrr9MI5JeUYHKktYB0Fv4FCbEC5w/uLvQrS1IzoiJxl05R
         h9pvt4B+I+RN/hV5E/fnvsUGq7NcLklls9p3osb5k+Q2Hdj02Kb7Qy2Q5dtcXeNT8P4Q
         +lFHcdSMTjaozrS94Wk3x5Ap7X51eVdrvoP6M9EodgZC8dcfco7X+elW9DZmSXty+Y8a
         PZLc+pwqzF0bRTcDVT2LDUYQak94K/HT80CnXC5GT9LR0AB62+AwPcSnwV3SnBTxcaai
         mVzoPw3FWfjBXbPz0hM1yK7ldisibpBjl+TUrj371zR/foKj0hxHYUqzoDmvpsL3Hh+F
         /1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706668647; x=1707273447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFtM9M9RNSsCscdub7UbZbmrBPSDwKReEdWaEJLTDYQ=;
        b=Eh0VO2EvgG8ccaKTBOToKjR360O7elggij8c1K2B5TrHledQj8ZHWQztwxkA9JlAyq
         fGET2GX9+FXlr4rWTZqO6B5Yt9MSDuxxPidJyCmMkMyh8QERTD+1EjibSaC1YzLPfhuw
         Amu5p8czcItUDrpaoo05gvRxgeoni49/m0dULo726Op6kw7IewRso9RBpkGPX7mfxqG7
         EtSKRSsyuxkA7qbLItWIO1QzL0mLSZX+WNZq+MHw/oa2gbZhboQON2Rg8yKhuOWjxHDj
         72vH9WuEomnSGTVb1IzC2maMhFPZFR2nMRYZAJVUW4LzXWu0hm6O5uRUCCBfrAOAFCEF
         80Mw==
X-Gm-Message-State: AOJu0YzrLaGWLM/mAhEmEg1Rdnbu6Wj4Ne7ZvLr5UirR+w6j41DGT3zA
	Y97V784/C2n3VnKo72e18k9UZZHGWfx9UG7YBNRYUkhwjW8lNQXMn4zaeTPGN0SXxHJYtiXSqoM
	EGC9EcKcLCAag0jOhwppR72h3HYgsKYrCJHJm
X-Google-Smtp-Source: AGHT+IE77UGX6zv+fYOMSYQRTJt+PvgbckZGS4IXQT+4e4FP2JpLR8KrluHFwd7mJg3X2O21apLZ9k4ePAaltmt0Pps=
X-Received: by 2002:a25:c3c7:0:b0:dc2:5044:70e with SMTP id
 t190-20020a25c3c7000000b00dc25044070emr1649328ybf.46.1706668646968; Tue, 30
 Jan 2024 18:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1a42e4fc-54a0-49f1-94ba-f075e0ef29a8@moroto.mountain>
In-Reply-To: <1a42e4fc-54a0-49f1-94ba-f075e0ef29a8@moroto.mountain>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 30 Jan 2024 18:37:14 -0800
Message-ID: <CAJuCfpHyTjB+HKEZn+ddkQOCdHZJMgG4bYOfJM=NOBcGBkYeew@mail.gmail.com>
Subject: Re: [linux-next:master 2565/2825] mm/userfaultfd.c:983
 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 9:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   596764183be8ebb13352b281a442a1f1151c9b06
> commit: ea4df6a5ea81105879ca5549555e231c4596fbc4 [2565/2825] userfaultfd:=
 handle zeropage moves by UFFDIO_MOVE
> config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/a=
rchive/20240130/202401300107.U8iMAkTl-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202401300107.U8iMAkTl-lkp@intel.com/
>
> smatch warnings:
> mm/userfaultfd.c:983 move_zeropage_pte() warn: inconsistent returns 'dst_=
ptl'.
>
> vim +/dst_ptl +983 mm/userfaultfd.c
>
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  962  static int move_zeropa=
ge_pte(struct mm_struct *mm,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  963                        =
    struct vm_area_struct *dst_vma,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  964                        =
    struct vm_area_struct *src_vma,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  965                        =
    unsigned long dst_addr, unsigned long src_addr,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  966                        =
    pte_t *dst_pte, pte_t *src_pte,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  967                        =
    pte_t orig_dst_pte, pte_t orig_src_pte,
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  968                        =
    spinlock_t *dst_ptl, spinlock_t *src_ptl)
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  969  {
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  970       pte_t zero_pte;
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  971
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  972       double_pt_lock(ds=
t_ptl, src_ptl);
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  973       if (!pte_same(pte=
p_get(src_pte), orig_src_pte) ||
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  974           !pte_same(pte=
p_get(dst_pte), orig_dst_pte))
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  975               return -E=
AGAIN;
>
> double_pt_unlock(dst_ptl, src_ptl) before returning?

Thanks for reporting and sorry for the delay!
Yes, this is definitely a bug. I'll post a fix tomorrow morning.
Thanks,
Suren.

>
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  976
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  977       zero_pte =3D pte_=
mkspecial(pfn_pte(my_zero_pfn(dst_addr),
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  978                        =
                dst_vma->vm_page_prot));
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  979       ptep_clear_flush(=
src_vma, src_addr, src_pte);
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  980       set_pte_at(mm, ds=
t_addr, dst_pte, zero_pte);
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  981       double_pt_unlock(=
dst_ptl, src_ptl);
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  982
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24 @983       return 0;
> ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  984  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
