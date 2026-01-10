Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752A72631
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768007545; cv=none; b=f6pmvgetIg71EOjsjELuJWDU+l2ZN/hn4OYShQD6zHPNr7LH46+AVcYfSN6E3vLlOj8GWr8iY03hz8RW6bUhNUrQT2jja0jSzYPeZqr8us3ots4GD/HuvDB8XQr1ciDmVqKkKjeEuJy7Niejv5/JBtd47OaBY67D0IIkPPE0PJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768007545; c=relaxed/simple;
	bh=Sq9qifdHJxQbUBHHte2xnIv5yGKKE3nKMyicjZMzCiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEo9y2e6dD79CColUPaHeZryQCogk6B28Fyjv3qbdBpy3rwuvus487HOdCAD4DmusgBPMcBhYTgNsvk3FW0FfAZ9WfNwN2yW+TwW3QI9CJBY7vARJfQLGKGZxFJy/QIBBAzDmaLnvJkloqf6SXdw4YY0nIpUyO4toel28j4AoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFkvozR+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFkvozR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C55C4AF09
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768007545;
	bh=Sq9qifdHJxQbUBHHte2xnIv5yGKKE3nKMyicjZMzCiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFkvozR+MmVKEY5EnW06JSsmg5J5Eo+tk1PQrPiji9j8DZvld6onqvLlLBJjmK/GU
	 4c5gIEgZw7P9lkm5JvTlOqH/hxWuDLcRunD5QEUTzI9CwMZ3/hvJcWjGlaFZ0kOQT0
	 VS234FzIwjF+Dlv4MCZ5WsYXDe5Lz+2yIohfvGnp15u+nW2QimvnBkzzG062ij3OsT
	 pFWg386loBIJW23B3rj8VjQ837O334yK7xUbt58E+Nq3oUJdnyW0uDvFEqjXn5L1ms
	 YMlUacsfBMT8k4Kl+ebeTQ9qy7xOVb+aRGd7f4N6f7m+E2aakPoRp9tfCzpH/Udroe
	 U2miGklRRTpbw==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so6989423a12.0
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 17:12:23 -0800 (PST)
X-Gm-Message-State: AOJu0YwkRq0MfZvAjABcRyfUTucQ0rhUvFPebdhYKVo1gFLp4cgeLNGs
	/HQrGAxQtv8kq4+hgKYF+qMvPsVKj3R2VsD/0OJb6Z+myqBluXIpQfGPR21Bhj9OX6i4+hhWMMv
	0eDs/82BhbHlYfgpzVTx07HjEkcycTSk=
X-Google-Smtp-Source: AGHT+IGw0V367vJIq/C/nGyiWrOD/UUf9PQbiK6l38ap7kLbzTjZFV14OKuVyYfEYKQIT8EVg3JcxEmzJEOErV45ieM=
X-Received: by 2002:a05:6402:210c:b0:649:9159:2432 with SMTP id
 4fb4d7f45d1cf-65097dce0efmr11115207a12.3.1768007542623; Fri, 09 Jan 2026
 17:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601091748.orF9z9Bx-lkp@intel.com>
In-Reply-To: <202601091748.orF9z9Bx-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 10 Jan 2026 10:12:10 +0900
X-Gmail-Original-Message-ID: <CAKYAXd96_3hrFYkv_+K6jZDJBz5bs_8tMit3_SAvX=QF4oD3=g@mail.gmail.com>
X-Gm-Features: AZwV_Qjqh9AXFNuweKQKYY9ekEGfp_NjGJpYiuJi40FAKn1azGTb3ekkFezUTZA
Message-ID: <CAKYAXd96_3hrFYkv_+K6jZDJBz5bs_8tMit3_SAvX=QF4oD3=g@mail.gmail.com>
Subject: Re: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/mft.c:2614
 ntfs_mft_record_free() warn: variable dereferenced before check 'ni' (see
 line 2612)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:58=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.g=
it ntfs-next
> head:   c9fb91b2b8b4c46188b1a280187d41e9ebb93cb2
> commit: 4816227dce428c85178afc885b301780d1da7bda [13/14] ntfs: add Kconfi=
g and Makefile
> config: openrisc-randconfig-r071-20260109 (https://download.01.org/0day-c=
i/archive/20260109/202601091748.orF9z9Bx-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 14.3.0
> smatch version: v0.5.0-8985-g2614ff1a
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601091748.orF9z9Bx-lkp@intel.com/
>
> New smatch warnings:
> fs/ntfs/mft.c:2614 ntfs_mft_record_free() warn: variable dereferenced bef=
ore check 'ni' (see line 2612)
> fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferen=
ced before check 'ni' (see line 120)
> fs/ntfs/attrlist.c:124 ntfs_attrlist_entry_add() warn: variable dereferen=
ced before check 'attr' (see line 120)
> fs/ntfs/runlist.c:692 ntfs_mapping_pairs_decompress() warn: unsigned '' i=
s never less than zero.
> fs/ntfs/attrib.c:2095 ntfs_resident_attr_record_add() warn: variable dere=
ferenced before check 'ni' (see line 2091)
> fs/ntfs/attrib.c:2217 ntfs_non_resident_attr_record_add() warn: variable =
dereferenced before check 'ni' (see line 2212)
> fs/ntfs/attrib.c:2776 ntfs_attr_open() warn: variable dereferenced before=
 check 'ni' (see line 2773)
>
> Old smatch warnings:
> fs/ntfs/mft.c:1054 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn:=
 mask and shift to zero: expr=3D'bit >> 3'
> fs/ntfs/mft.c:2554 ntfs_mft_record_alloc() error: we previously assumed '=
*ni' could be null (see line 2132)
> fs/ntfs/runlist.c:1586 ntfs_rl_insert_range() warn: variable dereferenced=
 before check 'src_rl' (see line 1583)
> fs/ntfs/attrib.c:176 ntfs_map_runlist_nolock() error: uninitialized symbo=
l 'ctx_needs_reset'.
> fs/ntfs/attrib.c:4909 ntfs_attr_remove() warn: variable dereferenced befo=
re check 'ni' (see line 4908)
>
> vim +/ni +2614 fs/ntfs/mft.c
>
> 63adbe420afd6b Namjae Jeon 2026-01-06  2602  int ntfs_mft_record_free(str=
uct ntfs_volume *vol, struct ntfs_inode *ni)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2603  {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2604     u64 mft_no;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2605     int err;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2606     u16 seq_no;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2607     __le16 old_seq_no;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2608     struct mft_record *ni_mre=
c;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2609     unsigned int memalloc_fla=
gs;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2610     struct ntfs_inode *base_n=
i;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2611
> 63adbe420afd6b Namjae Jeon 2026-01-06 @2612     ntfs_debug("Entering for =
inode 0x%llx.\n", (long long)ni->mft_no);
>                                                                          =
                             ^^^^^^^^^^
> Dereference
>
> 7bfba19057c055 Namjae Jeon 2025-12-30  2613
> 63adbe420afd6b Namjae Jeon 2026-01-06 @2614     if (!vol || !ni)
>                                                             ^^^
> Checked too late.
It=E2=80=99s fixed now, thanks to your analysis.

>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
