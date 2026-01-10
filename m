Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F972631
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768007518; cv=none; b=XtZZi/qQnpqH9vvl/juDcTJG17utKZV+2nM9Tj7SsfKay94bf/Km6Sm8F6u1gI2tWm+4+bR9MLqX0Zcq0WGfwGITkNsOgtV3voNBbCkhXzg7N1Lq5nihahVMxgL8Ab5v3IxZDeobGzx7LgY7kTRG+8jcD4uANSQdt8NsxL/YZPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768007518; c=relaxed/simple;
	bh=F2r/6BzR6nUAMCBxppjoC6zczv9YEZsWI5hUQyqWdvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLj8bInCmTWQHE3NTjvCjQMAdd9VoKN+tLXGPfKvT4oCqrscDLPE6ezn6uiGDyMDR7EuaziRzCepZGqnbjmpkVEDK/9IQFsc2JbklUcoVEWxr5uPwGhTZDMBjnmUYGdqsiq2MRgJw0B0C1IyOSstv+yedzCHDizgpqT/vTjeUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdVNMyaC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdVNMyaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E3AC16AAE
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 01:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768007517;
	bh=F2r/6BzR6nUAMCBxppjoC6zczv9YEZsWI5hUQyqWdvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qdVNMyaCFAkyvWINwlBUAMTc1c9+A1vBCxb3omySLPs7rZi9r3+M5vugcKzm8VOOz
	 bUMYRRGvxFbEoD+HM61bFMrO7+ALqstL4Osa3o5KHv8RQBzrr28U9DfSato8+1dRP0
	 amNBksfi5ZD6CXhJmOPYGu2tlT2a588W3cFiAjX3tW79ZfB0oH3bqG4Pqys4aTRCzs
	 YeMNoDb4KbaNZUr0zmO2WZBh9NQyVdiLa8ezbEaOTURonpr41pDLayclaWzq0svweF
	 cavJy+Bo0bClGJyHA0QEUq+5hpmlPNkXXJoKOBYJhfbmtaiJWHn/hmi31Jqjh2Ie6H
	 BzqBUArLrrU3A==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73161849e1so943314366b.2
        for <oe-kbuild@lists.linux.dev>; Fri, 09 Jan 2026 17:11:56 -0800 (PST)
X-Gm-Message-State: AOJu0Yz9C2GHPtjfJj+FLg3iXi/QHRu4zyLJ/IN1V4XbXk52WCg8h1Vw
	2D/dUf//1uo55Cwmd0WYLQ4N92Nwt39RKLuNpJM0vmbuaAom2hrmc/4RJ1rIsYvO2p+tb0F4rdi
	HJUlXmSOUTftrVdKfMMY3omK3/ICf518=
X-Google-Smtp-Source: AGHT+IGVh86eplXQNq/AjUN6fgk8t1APrpPC8dCwcwv8ADhQSuZS/gP6G5dr9u8BTCnYJ4ux1XJysH3DKlDKCvXr2C8=
X-Received: by 2002:a17:907:3e18:b0:b7d:3728:7d11 with SMTP id
 a640c23a62f3a-b84453d8cfcmr1124041766b.50.1768007514586; Fri, 09 Jan 2026
 17:11:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601092100.xwQaZK8C-lkp@intel.com>
In-Reply-To: <202601092100.xwQaZK8C-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 10 Jan 2026 10:11:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9AGr_d3vBYfc7aQLPzZeAqN_Aq9bM3DLN16BxOMOa+6A@mail.gmail.com>
X-Gm-Features: AZwV_QjmvD5IO_Z1QmUqPVd9BiuGn94a9dD1sEF4G84YPO39HTRd7rY0QI9JSF0
Message-ID: <CAKYAXd9AGr_d3vBYfc7aQLPzZeAqN_Aq9bM3DLN16BxOMOa+6A@mail.gmail.com>
Subject: Re: [linkinjeon-ntfs:ntfs-next 13/14] fs/ntfs/mft.c:2588
 ntfs_mft_record_alloc() warn: inconsistent returns '&mft_ni->mrec_lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 11:06=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi Namjae,
Hi Dan,

It=E2=80=99s fixed now, thanks to your analysis.

Thanks!
>
> First bad commit (maybe !=3D root cause):
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/ntfs.g=
it ntfs-next
> head:   c9fb91b2b8b4c46188b1a280187d41e9ebb93cb2
> commit: 4816227dce428c85178afc885b301780d1da7bda [13/14] ntfs: add Kconfi=
g and Makefile
> config: i386-randconfig-141-20260109 (https://download.01.org/0day-ci/arc=
hive/20260109/202601092100.xwQaZK8C-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch version: v0.5.0-8985-g2614ff1a
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601092100.xwQaZK8C-lkp@intel.com/
>
> New smatch warnings:
> fs/ntfs/mft.c:2588 ntfs_mft_record_alloc() warn: inconsistent returns '&m=
ft_ni->mrec_lock'.
> fs/ntfs/attrib.c:5157 ntfs_non_resident_attr_collapse_range() warn: incon=
sistent returns '&ni->runlist.lock'.
>
> Old smatch warnings:
> fs/ntfs/mft.c:1054 ntfs_mft_bitmap_find_and_alloc_free_rec_nolock() warn:=
 mask and shift to zero: expr=3D'bit >> 3'
> fs/ntfs/mft.c:2554 ntfs_mft_record_alloc() error: we previously assumed '=
*ni' could be null (see line 2132)
> fs/ntfs/attrib.c:176 ntfs_map_runlist_nolock() error: uninitialized symbo=
l 'ctx_needs_reset'.
> fs/ntfs/attrib.c:4909 ntfs_attr_remove() warn: variable dereferenced befo=
re check 'ni' (see line 4908)
>
> vim +2588 fs/ntfs/mft.c
>
> 63adbe420afd6b Namjae Jeon 2026-01-06  2114  int ntfs_mft_record_alloc(st=
ruct ntfs_volume *vol, const int mode,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2115                       struct =
ntfs_inode **ni, struct ntfs_inode *base_ni,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2116                       struct =
mft_record **ni_mrec)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2117  {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2118     s64 ll, bit, old_data_ini=
tialized, old_data_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2119     unsigned long flags;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2120     struct folio *folio;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2121     struct ntfs_inode *mft_ni=
, *mftbmp_ni;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2122     struct ntfs_attr_search_c=
tx *ctx;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2123     struct mft_record *m =3D =
NULL;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2124     struct attr_record *a;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2125     pgoff_t index;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2126     unsigned int ofs;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2127     int err;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2128     __le16 seq_no, usn;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2129     bool record_formatted =3D=
 false;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2130     unsigned int memalloc_fla=
gs;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2131
> 63adbe420afd6b Namjae Jeon 2026-01-06  2132     if (base_ni && *ni)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2133             return -EINVAL;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2134
> 7bfba19057c055 Namjae Jeon 2025-12-30  2135     /* @mode and @base_ni are=
 mutually exclusive. */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2136     if (mode && base_ni)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2137             return -EINVAL;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2138
> 63adbe420afd6b Namjae Jeon 2026-01-06  2139     if (base_ni)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2140             ntfs_debug("Enter=
ing (allocating an extent mft record for base mft record 0x%llx).",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2141                             (=
long long)base_ni->mft_no);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2142     else
> 7bfba19057c055 Namjae Jeon 2025-12-30  2143             ntfs_debug("Enter=
ing (allocating a base mft record).");
> 63adbe420afd6b Namjae Jeon 2026-01-06  2144
> 63adbe420afd6b Namjae Jeon 2026-01-06  2145     memalloc_flags =3D memall=
oc_nofs_save();
> 63adbe420afd6b Namjae Jeon 2026-01-06  2146
> 7bfba19057c055 Namjae Jeon 2025-12-30  2147     mft_ni =3D NTFS_I(vol->mf=
t_ino);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2148     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2149             mutex_lock(&mft_n=
i->mrec_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2150     mftbmp_ni =3D NTFS_I(vol-=
>mftbmp_ino);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2151  search_free_rec:
> 63adbe420afd6b Namjae Jeon 2026-01-06  2152     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2153             down_write(&vol->=
mftbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2154     bit =3D ntfs_mft_bitmap_f=
ind_and_alloc_free_rec_nolock(vol, base_ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2155     if (bit >=3D 0) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2156             ntfs_debug("Found=
 and allocated free record (#1), bit 0x%llx.",
> 7bfba19057c055 Namjae Jeon 2025-12-30  2157                             (=
long long)bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2158             goto have_alloc_r=
ec;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2159     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2160     if (bit !=3D -ENOSPC) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2161             if (!base_ni || b=
ase_ni->mft_no !=3D FILE_MFT) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2162                     up_write(=
&vol->mftbmp_lock);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2163                     mutex_unl=
ock(&mft_ni->mrec_lock);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2164             }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2165             memalloc_nofs_res=
tore(memalloc_flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2166             return bit;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2167     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2168
> 63adbe420afd6b Namjae Jeon 2026-01-06  2169     if (base_ni && base_ni->m=
ft_no =3D=3D FILE_MFT) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2170             memalloc_nofs_res=
tore(memalloc_flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2171             return bit;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2172     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2173
> 7bfba19057c055 Namjae Jeon 2025-12-30  2174     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2175      * No free mft records le=
ft.  If the mft bitmap already covers more
> 7bfba19057c055 Namjae Jeon 2025-12-30  2176      * than the currently use=
d mft records, the next records are all free,
> 7bfba19057c055 Namjae Jeon 2025-12-30  2177      * so we can simply alloc=
ate the first unused mft record.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2178      * Note: We also have to =
make sure that the mft bitmap at least covers
> 7bfba19057c055 Namjae Jeon 2025-12-30  2179      * the first 24 mft recor=
ds as they are special and whilst they may not
> 7bfba19057c055 Namjae Jeon 2025-12-30  2180      * be in use, we do not a=
llocate from them.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2181      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2182     read_lock_irqsave(&mft_ni=
->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2183     ll =3D mft_ni->initialize=
d_size >> vol->mft_record_size_bits;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2184     read_unlock_irqrestore(&m=
ft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2185     read_lock_irqsave(&mftbmp=
_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2186     old_data_initialized =3D =
mftbmp_ni->initialized_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2187     read_unlock_irqrestore(&m=
ftbmp_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2188     if (old_data_initialized =
<< 3 > ll &&
> 63adbe420afd6b Namjae Jeon 2026-01-06  2189         old_data_initialized =
> RESERVED_MFT_RECORDS / 8) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2190             bit =3D ll;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2191             if (bit < RESERVE=
D_MFT_RECORDS)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2192                     bit =3D R=
ESERVED_MFT_RECORDS;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2193             if (unlikely(bit =
>=3D (1ll << 32)))
> 7bfba19057c055 Namjae Jeon 2025-12-30  2194                     goto max_=
err_out;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2195             ntfs_debug("Found=
 free record (#2), bit 0x%llx.",
> 7bfba19057c055 Namjae Jeon 2025-12-30  2196                             (=
long long)bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2197             goto found_free_r=
ec;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2198     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2199     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2200      * The mft bitmap needs t=
o be expanded until it covers the first unused
> 7bfba19057c055 Namjae Jeon 2025-12-30  2201      * mft record that we can=
 allocate.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2202      * Note: The smallest mft=
 record we allocate is mft record 24.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2203      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2204     bit =3D old_data_initiali=
zed << 3;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2205     if (unlikely(bit >=3D (1l=
l << 32)))
> 7bfba19057c055 Namjae Jeon 2025-12-30  2206             goto max_err_out;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2207     read_lock_irqsave(&mftbmp=
_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2208     old_data_size =3D mftbmp_=
ni->allocated_size;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2209     ntfs_debug("Status of mft=
bmp before extension: allocated_size 0x%llx, data_size 0x%llx, initialized_=
size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2210                     old_data_=
size, i_size_read(vol->mftbmp_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2211                     old_data_=
initialized);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2212     read_unlock_irqrestore(&m=
ftbmp_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2213     if (old_data_initialized =
+ 8 > old_data_size) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2214             /* Need to extend=
 bitmap by one more cluster. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2215             ntfs_debug("mftbm=
p: initialized_size + 8 > allocated_size.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2216             err =3D ntfs_mft_=
bitmap_extend_allocation_nolock(vol);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2217             if (err =3D=3D -E=
AGAIN)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2218                     err =3D n=
tfs_mft_bitmap_extend_allocation_nolock(vol);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2219
> 7bfba19057c055 Namjae Jeon 2025-12-30  2220             if (unlikely(err)=
) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2221                     if (!base=
_ni || base_ni->mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2222                             u=
p_write(&vol->mftbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2223                     goto err_=
out;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2224             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2225  #ifdef DEBUG
> 7bfba19057c055 Namjae Jeon 2025-12-30  2226             read_lock_irqsave=
(&mftbmp_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2227             ntfs_debug("Statu=
s of mftbmp after allocation extension: allocated_size 0x%llx, data_size 0x=
%llx, initialized_size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2228                             m=
ftbmp_ni->allocated_size,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2229                             i=
_size_read(vol->mftbmp_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2230                             m=
ftbmp_ni->initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2231             read_unlock_irqre=
store(&mftbmp_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2232  #endif /* DEBUG */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2233     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2234     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2235      * We now have sufficient=
 allocated space, extend the initialized_size
> 7bfba19057c055 Namjae Jeon 2025-12-30  2236      * as well as the data_si=
ze if necessary and fill the new space with
> 7bfba19057c055 Namjae Jeon 2025-12-30  2237      * zeroes.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2238      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2239     err =3D ntfs_mft_bitmap_e=
xtend_initialized_nolock(vol);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2240     if (unlikely(err)) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2241             if (!base_ni || b=
ase_ni->mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2242                     up_write(=
&vol->mftbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2243             goto err_out;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2244     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2245  #ifdef DEBUG
> 7bfba19057c055 Namjae Jeon 2025-12-30  2246     read_lock_irqsave(&mftbmp=
_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2247     ntfs_debug("Status of mft=
bmp after initialized extension: allocated_size 0x%llx, data_size 0x%llx, i=
nitialized_size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2248                     mftbmp_ni=
->allocated_size,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2249                     i_size_re=
ad(vol->mftbmp_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2250                     mftbmp_ni=
->initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2251     read_unlock_irqrestore(&m=
ftbmp_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2252  #endif /* DEBUG */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2253     ntfs_debug("Found free re=
cord (#3), bit 0x%llx.", (long long)bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2254  found_free_rec:
> 7bfba19057c055 Namjae Jeon 2025-12-30  2255     /* @bit is the found free=
 mft record, allocate it in the mft bitmap. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2256     ntfs_debug("At found_free=
_rec.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2257     err =3D ntfs_bitmap_set_b=
it(vol->mftbmp_ino, bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2258     if (unlikely(err)) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2259             ntfs_error(vol->s=
b, "Failed to allocate bit in mft bitmap.");
> 63adbe420afd6b Namjae Jeon 2026-01-06  2260             if (!base_ni || b=
ase_ni->mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2261                     up_write(=
&vol->mftbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2262             goto err_out;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2263     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2264     ntfs_debug("Set bit 0x%ll=
x in mft bitmap.", (long long)bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2265  have_alloc_rec:
> 7bfba19057c055 Namjae Jeon 2025-12-30  2266     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2267      * The mft bitmap is now =
uptodate.  Deal with mft data attribute now.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2268      * Note, we keep hold of =
the mft bitmap lock for writing until all
> 7bfba19057c055 Namjae Jeon 2025-12-30  2269      * modifications to the m=
ft data attribute are complete, too, as they
> 7bfba19057c055 Namjae Jeon 2025-12-30  2270      * will impact decisions =
for mft bitmap and mft record allocation done
> 7bfba19057c055 Namjae Jeon 2025-12-30  2271      * by a parallel allocati=
on and if the lock is not maintained a
> 7bfba19057c055 Namjae Jeon 2025-12-30  2272      * parallel allocation co=
uld allocate the same mft record as this one.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2273      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2274     ll =3D (bit + 1) << vol->=
mft_record_size_bits;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2275     read_lock_irqsave(&mft_ni=
->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2276     old_data_initialized =3D =
mft_ni->initialized_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2277     read_unlock_irqrestore(&m=
ft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2278     if (ll <=3D old_data_init=
ialized) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2279             ntfs_debug("Alloc=
ated mft record already initialized.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2280             goto mft_rec_alre=
ady_initialized;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2281     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2282     ntfs_debug("Initializing =
allocated mft record.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2283     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2284      * The mft record is outs=
ide the initialized data.  Extend the mft data
> 7bfba19057c055 Namjae Jeon 2025-12-30  2285      * attribute until it cov=
ers the allocated record.  The loop is only
> 7bfba19057c055 Namjae Jeon 2025-12-30  2286      * actually traversed mor=
e than once when a freshly formatted volume is
> 7bfba19057c055 Namjae Jeon 2025-12-30  2287      * first written to so it=
 optimizes away nicely in the common case.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2288      */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2289     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2290             read_lock_irqsave=
(&mft_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2291             ntfs_debug("Statu=
s of mft data before extension: allocated_size 0x%llx, data_size 0x%llx, in=
itialized_size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2292                             m=
ft_ni->allocated_size, i_size_read(vol->mft_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2293                             m=
ft_ni->initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2294             while (ll > mft_n=
i->allocated_size) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2295                     read_unlo=
ck_irqrestore(&mft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2296                     err =3D n=
tfs_mft_data_extend_allocation_nolock(vol);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2297                     if (err =
=3D=3D -EAGAIN)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2298                             e=
rr =3D ntfs_mft_data_extend_allocation_nolock(vol);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2299
> 7bfba19057c055 Namjae Jeon 2025-12-30  2300                     if (unlik=
ely(err)) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2301                             n=
tfs_error(vol->sb, "Failed to extend mft data allocation.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2302                             g=
oto undo_mftbmp_alloc_nolock;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2303                     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2304                     read_lock=
_irqsave(&mft_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2305                     ntfs_debu=
g("Status of mft data after allocation extension: allocated_size 0x%llx, da=
ta_size 0x%llx, initialized_size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2306                              =
       mft_ni->allocated_size, i_size_read(vol->mft_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2307                              =
       mft_ni->initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2308             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2309             read_unlock_irqre=
store(&mft_ni->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2310     } else if (ll > mft_ni->a=
llocated_size) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2311             err =3D -ENOSPC;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2312             goto undo_mftbmp_=
alloc_nolock;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2313     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2314     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2315      * Extend mft data initia=
lized size (and data size of course) to reach
> 7bfba19057c055 Namjae Jeon 2025-12-30  2316      * the allocated mft reco=
rd, formatting the mft records allong the way.
> 63adbe420afd6b Namjae Jeon 2026-01-06  2317      * Note: We only modify t=
he struct ntfs_inode structure as that is all that is
> 7bfba19057c055 Namjae Jeon 2025-12-30  2318      * needed by ntfs_mft_rec=
ord_format().  We will update the attribute
> 7bfba19057c055 Namjae Jeon 2025-12-30  2319      * record itself in one f=
ell swoop later on.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2320      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2321     write_lock_irqsave(&mft_n=
i->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2322     old_data_initialized =3D =
mft_ni->initialized_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2323     old_data_size =3D vol->mf=
t_ino->i_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2324     while (ll > mft_ni->initi=
alized_size) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2325             s64 new_initializ=
ed_size, mft_no;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2326
> 7bfba19057c055 Namjae Jeon 2025-12-30  2327             new_initialized_s=
ize =3D mft_ni->initialized_size +
> 7bfba19057c055 Namjae Jeon 2025-12-30  2328                             v=
ol->mft_record_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2329             mft_no =3D mft_ni=
->initialized_size >> vol->mft_record_size_bits;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2330             if (new_initializ=
ed_size > i_size_read(vol->mft_ino))
> 7bfba19057c055 Namjae Jeon 2025-12-30  2331                     i_size_wr=
ite(vol->mft_ino, new_initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2332             write_unlock_irqr=
estore(&mft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2333             ntfs_debug("Initi=
alizing mft record 0x%llx.",
> 7bfba19057c055 Namjae Jeon 2025-12-30  2334                             (=
long long)mft_no);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2335             err =3D ntfs_mft_=
record_format(vol, mft_no);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2336             if (unlikely(err)=
) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2337                     ntfs_erro=
r(vol->sb, "Failed to format mft record.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2338                     goto undo=
_data_init;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2339             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2340             write_lock_irqsav=
e(&mft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2341             mft_ni->initializ=
ed_size =3D new_initialized_size;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2342     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2343     write_unlock_irqrestore(&=
mft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2344     record_formatted =3D true=
;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2345     /* Update the mft data at=
tribute record to reflect the new sizes. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2346     m =3D map_mft_record(mft_=
ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2347     if (IS_ERR(m)) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2348             ntfs_error(vol->s=
b, "Failed to map mft record.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2349             err =3D PTR_ERR(m=
);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2350             goto undo_data_in=
it;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2351     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2352     ctx =3D ntfs_attr_get_sea=
rch_ctx(mft_ni, m);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2353     if (unlikely(!ctx)) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2354             ntfs_error(vol->s=
b, "Failed to get search context.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2355             err =3D -ENOMEM;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2356             unmap_mft_record(=
mft_ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2357             goto undo_data_in=
it;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2358     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2359     err =3D ntfs_attr_lookup(=
mft_ni->type, mft_ni->name, mft_ni->name_len,
> 7bfba19057c055 Namjae Jeon 2025-12-30  2360                     CASE_SENS=
ITIVE, 0, NULL, 0, ctx);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2361     if (unlikely(err)) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2362             ntfs_error(vol->s=
b, "Failed to find first attribute extent of mft data attribute.");
> 7bfba19057c055 Namjae Jeon 2025-12-30  2363             ntfs_attr_put_sea=
rch_ctx(ctx);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2364             unmap_mft_record(=
mft_ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2365             goto undo_data_in=
it;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2366     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2367     a =3D ctx->attr;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2368     read_lock_irqsave(&mft_ni=
->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2369     a->data.non_resident.init=
ialized_size =3D
> 63adbe420afd6b Namjae Jeon 2026-01-06  2370                     cpu_to_le=
64(mft_ni->initialized_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2371     a->data.non_resident.data=
_size =3D
> 63adbe420afd6b Namjae Jeon 2026-01-06  2372                     cpu_to_le=
64(i_size_read(vol->mft_ino));
> 7bfba19057c055 Namjae Jeon 2025-12-30  2373     read_unlock_irqrestore(&m=
ft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2374     /* Ensure the changes mak=
e it to disk. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2375     mark_mft_record_dirty(ctx=
->ntfs_ino);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2376     ntfs_attr_put_search_ctx(=
ctx);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2377     unmap_mft_record(mft_ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2378     read_lock_irqsave(&mft_ni=
->size_lock, flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2379     ntfs_debug("Status of mft=
 data after mft record initialization: allocated_size 0x%llx, data_size 0x%=
llx, initialized_size 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2380                     mft_ni->a=
llocated_size, i_size_read(vol->mft_ino),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2381                     mft_ni->i=
nitialized_size);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2382     WARN_ON(i_size_read(vol->=
mft_ino) > mft_ni->allocated_size);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2383     WARN_ON(mft_ni->initializ=
ed_size > i_size_read(vol->mft_ino));
> 7bfba19057c055 Namjae Jeon 2025-12-30  2384     read_unlock_irqrestore(&m=
ft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2385  mft_rec_already_initialized:
> 7bfba19057c055 Namjae Jeon 2025-12-30  2386     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2387      * We can finally drop th=
e mft bitmap lock as the mft data attribute
> 7bfba19057c055 Namjae Jeon 2025-12-30  2388      * has been fully updated=
.  The only disparity left is that the
> 7bfba19057c055 Namjae Jeon 2025-12-30  2389      * allocated mft record s=
till needs to be marked as in use to match the
> 7bfba19057c055 Namjae Jeon 2025-12-30  2390      * set bit in the mft bit=
map but this is actually not a problem since
> 7bfba19057c055 Namjae Jeon 2025-12-30  2391      * this mft record is not=
 referenced from anywhere yet and the fact
> 7bfba19057c055 Namjae Jeon 2025-12-30  2392      * that it is allocated i=
n the mft bitmap means that no-one will try to
> 7bfba19057c055 Namjae Jeon 2025-12-30  2393      * allocate it either.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2394      */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2395     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2396             up_write(&vol->mf=
tbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2397     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2398      * We now have allocated =
and initialized the mft record.  Calculate the
> 7bfba19057c055 Namjae Jeon 2025-12-30  2399      * index of and the offse=
t within the page cache page the record is in.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2400      */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2401     index =3D NTFS_MFT_NR_TO_=
PIDX(vol, bit);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2402     ofs =3D NTFS_MFT_NR_TO_PO=
FS(vol, bit);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2403     /* Read, map, and pin the=
 folio containing the mft record. */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2404     folio =3D read_mapping_fo=
lio(vol->mft_ino->i_mapping, index, NULL);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2405     if (IS_ERR(folio)) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2406             ntfs_error(vol->s=
b, "Failed to map page containing allocated mft record 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2407                             b=
it);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2408             err =3D PTR_ERR(f=
olio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2409             goto undo_mftbmp_=
alloc;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2410     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2411     folio_lock(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2412     folio_clear_uptodate(foli=
o);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2413     m =3D (struct mft_record =
*)((u8 *)kmap_local_folio(folio, 0) + ofs);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2414     /* If we just formatted t=
he mft record no need to do it again. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2415     if (!record_formatted) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2416             /* Sanity check t=
hat the mft record is really not in use. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2417             if (ntfs_is_file_=
record(m->magic) &&
> 7bfba19057c055 Namjae Jeon 2025-12-30  2418                             (=
m->flags & MFT_RECORD_IN_USE)) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2419                     ntfs_warn=
ing(vol->sb,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2420                             "=
Mft record 0x%llx was marked free in mft bitmap but is marked used itself. =
Unmount and run chkdsk.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2421                             b=
it);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2422                     folio_mar=
k_uptodate(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2423                     folio_unl=
ock(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2424                     kunmap_lo=
cal(m);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2425                     folio_put=
(folio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2426                     NVolSetEr=
rors(vol);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2427                     goto sear=
ch_free_rec;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2428             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2429             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2430              * We need to (re=
-)format the mft record, preserving the
> 7bfba19057c055 Namjae Jeon 2025-12-30  2431              * sequence numbe=
r if it is not zero as well as the update
> 7bfba19057c055 Namjae Jeon 2025-12-30  2432              * sequence numbe=
r if it is not zero or -1 (0xffff).  This
> 7bfba19057c055 Namjae Jeon 2025-12-30  2433              * means we do no=
t need to care whether or not something went
> 7bfba19057c055 Namjae Jeon 2025-12-30  2434              * wrong with the=
 previous mft record.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2435              */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2436             seq_no =3D m->seq=
uence_number;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2437             usn =3D *(__le16 =
*)((u8 *)m + le16_to_cpu(m->usa_ofs));
> 7bfba19057c055 Namjae Jeon 2025-12-30  2438             err =3D ntfs_mft_=
record_layout(vol, bit, m);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2439             if (unlikely(err)=
) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2440                     ntfs_erro=
r(vol->sb, "Failed to layout allocated mft record 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2441                              =
       bit);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2442                     folio_mar=
k_uptodate(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2443                     folio_unl=
ock(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2444                     kunmap_lo=
cal(m);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2445                     folio_put=
(folio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2446                     goto undo=
_mftbmp_alloc;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2447             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2448             if (seq_no)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2449                     m->sequen=
ce_number =3D seq_no;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2450             if (usn && le16_t=
o_cpu(usn) !=3D 0xffff)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2451                     *(__le16 =
*)((u8 *)m + le16_to_cpu(m->usa_ofs)) =3D usn;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2452             pre_write_mst_fix=
up((struct ntfs_record *)m, vol->mft_record_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2453     }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2454     /* Set the mft record its=
elf in use. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2455     m->flags |=3D MFT_RECORD_=
IN_USE;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2456     if (S_ISDIR(mode))
> 7bfba19057c055 Namjae Jeon 2025-12-30  2457             m->flags |=3D MFT=
_RECORD_IS_DIRECTORY;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2458     flush_dcache_folio(folio)=
;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2459     folio_mark_uptodate(folio=
);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2460     if (base_ni) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2461             struct mft_record=
 *m_tmp;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2462
> 7bfba19057c055 Namjae Jeon 2025-12-30  2463             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2464              * Setup the base=
 mft record in the extent mft record.  This
> 7bfba19057c055 Namjae Jeon 2025-12-30  2465              * completes init=
ialization of the allocated extent mft record
> 7bfba19057c055 Namjae Jeon 2025-12-30  2466              * and we can sim=
ply use it with map_extent_mft_record().
> 7bfba19057c055 Namjae Jeon 2025-12-30  2467              */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2468             m->base_mft_recor=
d =3D MK_LE_MREF(base_ni->mft_no,
> 7bfba19057c055 Namjae Jeon 2025-12-30  2469                             b=
ase_ni->seq_no);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2470             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2471              * Allocate an ex=
tent inode structure for the new mft record,
> 7bfba19057c055 Namjae Jeon 2025-12-30  2472              * attach it to t=
he base inode @base_ni and map, pin, and lock
> 7bfba19057c055 Namjae Jeon 2025-12-30  2473              * its, i.e. the =
allocated, mft record.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2474              */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2475             m_tmp =3D map_ext=
ent_mft_record(base_ni,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2476                              =
             MK_MREF(bit, le16_to_cpu(m->sequence_number)),
> 63adbe420afd6b Namjae Jeon 2026-01-06  2477                              =
             ni);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2478             if (IS_ERR(m_tmp)=
) {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2479                     ntfs_erro=
r(vol->sb, "Failed to map allocated extent mft record 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2480                              =
       bit);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2481                     err =3D P=
TR_ERR(m_tmp);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2482                     /* Set th=
e mft record itself not in use. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2483                     m->flags =
&=3D cpu_to_le16(
> 7bfba19057c055 Namjae Jeon 2025-12-30  2484                              =
       ~le16_to_cpu(MFT_RECORD_IN_USE));
> 63adbe420afd6b Namjae Jeon 2026-01-06  2485                     flush_dca=
che_folio(folio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2486                     /* Make s=
ure the mft record is written out to disk. */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2487                     mark_ntfs=
_record_dirty(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2488                     folio_unl=
ock(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2489                     kunmap_lo=
cal(m);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2490                     folio_put=
(folio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2491                     goto undo=
_mftbmp_alloc;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2492             }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2493
> 7bfba19057c055 Namjae Jeon 2025-12-30  2494             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2495              * Make sure the =
allocated mft record is written out to disk.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2496              * No need to set=
 the inode dirty because the caller is going
> 7bfba19057c055 Namjae Jeon 2025-12-30  2497              * to do that any=
way after finishing with the new extent mft
> 7bfba19057c055 Namjae Jeon 2025-12-30  2498              * record (e.g. a=
t a minimum a new attribute will be added to
> 7bfba19057c055 Namjae Jeon 2025-12-30  2499              * the mft record=
.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2500              */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2501             mark_ntfs_record_=
dirty(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2502             folio_unlock(foli=
o);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2503             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2504              * Need to unmap =
the page since map_extent_mft_record() mapped
> 7bfba19057c055 Namjae Jeon 2025-12-30  2505              * it as well so =
we have it mapped twice at the moment.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2506              */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2507             kunmap_local(m);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2508             folio_put(folio);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2509     } else {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2510             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2511              * Manually map, =
pin, and lock the mft record as we already
> 7bfba19057c055 Namjae Jeon 2025-12-30  2512              * have its page =
mapped and it is very easy to do.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2513              */
> 63adbe420afd6b Namjae Jeon 2026-01-06  2514             (*ni)->seq_no =3D=
 le16_to_cpu(m->sequence_number);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2515             /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2516              * Make sure the =
allocated mft record is written out to disk.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2517              * NOTE: We do no=
t set the ntfs inode dirty because this would
> 7bfba19057c055 Namjae Jeon 2025-12-30  2518              * fail in ntfs_w=
rite_inode() because the inode does not have a
> 7bfba19057c055 Namjae Jeon 2025-12-30  2519              * standard infor=
mation attribute yet.  Also, there is no need
> 7bfba19057c055 Namjae Jeon 2025-12-30  2520              * to set the ino=
de dirty because the caller is going to do
> 7bfba19057c055 Namjae Jeon 2025-12-30  2521              * that anyway af=
ter finishing with the new mft record (e.g. at
> 7bfba19057c055 Namjae Jeon 2025-12-30  2522              * a minimum some=
 new attributes will be added to the mft
> 7bfba19057c055 Namjae Jeon 2025-12-30  2523              * record.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2524              */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2525
> 63adbe420afd6b Namjae Jeon 2026-01-06  2526             (*ni)->mrec =3D k=
malloc(vol->mft_record_size, GFP_NOFS);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2527             if (!(*ni)->mrec)=
 {
> 63adbe420afd6b Namjae Jeon 2026-01-06  2528                     folio_unl=
ock(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2529                     kunmap_lo=
cal(m);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2530                     folio_put=
(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2531                     goto undo=
_mftbmp_alloc;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2532             }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2533
> 63adbe420afd6b Namjae Jeon 2026-01-06  2534             memcpy((*ni)->mre=
c, m, vol->mft_record_size);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2535             post_read_mst_fix=
up((struct ntfs_record *)(*ni)->mrec, vol->mft_record_size);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2536             mark_ntfs_record_=
dirty(folio);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2537             folio_unlock(foli=
o);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2538             (*ni)->folio =3D =
folio;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2539             (*ni)->folio_ofs =
=3D ofs;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2540             atomic_inc(&(*ni)=
->count);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2541             /* Update the def=
ault mft allocation position. */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2542             vol->mft_data_pos=
 =3D bit + 1;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2543     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2544     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2545             mutex_unlock(&NTF=
S_I(vol->mft_ino)->mrec_lock);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2546     memalloc_nofs_restore(mem=
alloc_flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2547
> 7bfba19057c055 Namjae Jeon 2025-12-30  2548     /*
> 7bfba19057c055 Namjae Jeon 2025-12-30  2549      * Return the opened, all=
ocated inode of the allocated mft record as
> 7bfba19057c055 Namjae Jeon 2025-12-30  2550      * well as the mapped, pi=
nned, and locked mft record.
> 7bfba19057c055 Namjae Jeon 2025-12-30  2551      */
> 7bfba19057c055 Namjae Jeon 2025-12-30  2552     ntfs_debug("Returning ope=
ned, allocated %sinode 0x%llx.",
> 63adbe420afd6b Namjae Jeon 2026-01-06  2553                     base_ni ?=
 "extent " : "", bit);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2554     (*ni)->mft_no =3D bit;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2555     if (ni_mrec)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2556             *ni_mrec =3D (*ni=
)->mrec;
> 63adbe420afd6b Namjae Jeon 2026-01-06  2557     ntfs_dec_free_mft_records=
(vol, 1);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2558     return 0;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2559  undo_data_init:
> 7bfba19057c055 Namjae Jeon 2025-12-30  2560     write_lock_irqsave(&mft_n=
i->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2561     mft_ni->initialized_size =
=3D old_data_initialized;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2562     i_size_write(vol->mft_ino=
, old_data_size);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2563     write_unlock_irqrestore(&=
mft_ni->size_lock, flags);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2564     goto undo_mftbmp_alloc_no=
lock;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2565  undo_mftbmp_alloc:
> 63adbe420afd6b Namjae Jeon 2026-01-06  2566     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2567             down_write(&vol->=
mftbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2568  undo_mftbmp_alloc_nolock:
> 7bfba19057c055 Namjae Jeon 2025-12-30  2569     if (ntfs_bitmap_clear_bit=
(vol->mftbmp_ino, bit)) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2570             ntfs_error(vol->s=
b, "Failed to clear bit in mft bitmap.%s", es);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2571             NVolSetErrors(vol=
);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2572     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2573     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 7bfba19057c055 Namjae Jeon 2025-12-30  2574             up_write(&vol->mf=
tbmp_lock);
> 7bfba19057c055 Namjae Jeon 2025-12-30  2575  err_out:
> 63adbe420afd6b Namjae Jeon 2026-01-06  2576     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT)
> 63adbe420afd6b Namjae Jeon 2026-01-06  2577             mutex_unlock(&mft=
_ni->mrec_lock);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2578     memalloc_nofs_restore(mem=
alloc_flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2579     return err;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2580  max_err_out:
> 63adbe420afd6b Namjae Jeon 2026-01-06  2581     ntfs_warning(vol->sb,
> 63adbe420afd6b Namjae Jeon 2026-01-06  2582             "Cannot allocate =
mft record because the maximum number of inodes (2^32) has already been rea=
ched.");
> 63adbe420afd6b Namjae Jeon 2026-01-06  2583     if (!base_ni || base_ni->=
mft_no !=3D FILE_MFT) {
> 7bfba19057c055 Namjae Jeon 2025-12-30  2584             up_write(&vol->mf=
tbmp_lock);
> 63adbe420afd6b Namjae Jeon 2026-01-06  2585             mutex_unlock(&NTF=
S_I(vol->mft_ino)->mrec_lock);
>
> This is a false positive because Smatch doesn't know that
> "&NTFS_I(vol->mft_ino)->mrec_lock" and "&mft_ni->mrec_lock" are the
> same thing.  But still, it would be better to use "&mft_ni->mrec_lock"
> consistently.
>
> 63adbe420afd6b Namjae Jeon 2026-01-06  2586     }
> 63adbe420afd6b Namjae Jeon 2026-01-06  2587     memalloc_nofs_restore(mem=
alloc_flags);
> 63adbe420afd6b Namjae Jeon 2026-01-06 @2588     return -ENOSPC;
> 7bfba19057c055 Namjae Jeon 2025-12-30  2589  }
> 7bfba19057c055 Namjae Jeon 2025-12-30  2590
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
