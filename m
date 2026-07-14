Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD6836921E
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027203; cv=pass; b=f83DnZtXQx1L8lqGUuDqneQQUbLhW4U8Q3c9iFUxlnSyn7tdByt1VvSj9+EYm0CGdusj50B5+5oysUByZlxZ5y2Fh/TO9wtqdsvWoJtWKlUuN44RF1aRV/kr0LUEGgdM3lwDRzGGSFh58RfUK2zRATI6ZtuhotcmIgDLSlY/K9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027203; c=relaxed/simple;
	bh=Het9ihQl/VJT9xqzwtJWeYTAgX6+xn+zNF245R9sMG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SLI15WCibT4Sxl2pKoB+sYTsBu1okF+R4lKLhUcKUNShU4QJA2uH3M5Q54jJ2905vvArptDw2Gs69/eiMzfeqv/7dJyLse0hOljaZrRTUfNTBWb2lBMYeWhgsN7728UHQWljVl4FRtz50q0uiWBEdlNux+WBPyEZ9iexmsg58Ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoWL8V25; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoWL8V25"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so5640707a12.2
        for <oe-kbuild@lists.linux.dev>; Tue, 14 Jul 2026 04:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784027201; cv=none;
        d=google.com; s=arc-20260327;
        b=BRVqgZ4dFBOf375vdVUS6UIEC3tBQbmF2CFvjd0DM39o+w164Lj68/5KTNQwj6umdN
         t5Tqml3MHF+rnOzv5+e4FjjJFQVKzZrujXvgSUQK5E1CJbG8Uh91gStxNSBxT32ICGPV
         hzOgaGdlEyNurh9Wbfr8U0SSJJBSsmwRqon2aMm398eEyJ1xVdkWgXIdldPNoC8mpB8E
         KVRlQgIs1jzB/cu1jWnNyPvqGUKtWrbE6qXWk25ZzTZJ8peEBHBu7K89PNwur/+kMDVu
         tNR+guBfXKnS3PlzYWDZB7zRTh1XHNFAXNwqAbbQ4oIMsvpLTf5BdsBKxlq1Ak8vZd2y
         gXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCsR23B5npLYx4eSEXefKKxboIrUPzq22joxYGvAxQk=;
        fh=5VpqbdnCoaPdEzzobqEEHKi8nDl7v5EE97g2oNzYnKI=;
        b=XnxxSwTALfKf4BEBBnD72KxZO5ftYk0gSpbHLD7Vi2BqxLX9AKqedatAuf9W2A3sEK
         hGntlP+4XWSoCYeFmi5wCredBpynHyDqv07TKXtc+5wc9t1UakSGDJ+gHmSu+SO2g8BY
         u5BPeJ1vDpqHUGGCKaIMl3KMuOQwBpAqj6XE/0S71U0oaCGDAArnKm8/cnXfqrBCh8k3
         6llW3UJaSrD9OjEjF0D4oZeg/+/EByF5Gc2zSp7WcMRTOn9zy9NpmG8dYXey+O8a8Cu0
         MH/tRbouP/KMF/ww5WiTpnFB9wlrZBC8PlQRYTfv6D4HrQqhjCCOhLL4c/7NtdbMDPEN
         9mFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784027201; x=1784632001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCsR23B5npLYx4eSEXefKKxboIrUPzq22joxYGvAxQk=;
        b=AoWL8V25Kro+XljMOVo2YQVRJeo+xn8l/Hqqz2525ImNuuBiQaqyTYgTFpxq3ghs9X
         jzV4FCNbozO7Lor/Weg5QRGRYPuGt8dVfXaS731x7mz5cFm6liwddzh1NGyU/WiaqyTs
         A/0fDcgffW61+DEGX8xrEunoWOPHDgLN5werf6zy/MRSy8DwotbGzIrjv5aSN1hvXSqF
         X2JxeUa4Ad0jZu2YFOLyOdj53rF7IbOyGDGBgrwKxlVgLOAUXmElwiekcdAanY6Pxx7f
         R4UDdOSn9uFT7FNAEGPtzlOMSCdx5H6dzlu1R9PRTg/aJ8ltEKwMLoHc92rD9leiJlRI
         cNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027201; x=1784632001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCsR23B5npLYx4eSEXefKKxboIrUPzq22joxYGvAxQk=;
        b=YMw96R/A41cgpChaOrZNbe/bLHjDxQhx0bsmn9GtZLqNZOxrBSzHXv22qa2bBAPiwU
         TbnftTwgwLAGZheafT1vtNMfX/vVpNvuq4QTzWInksd1a/2mAt5zAzbj1qRxvNef7h06
         7oA+19Y4/nWGWxR2YLeW7Jn4Vg68942YXutD4rVOX9TMjKOk/JB5H/Uxt2Pye80w9lVn
         iykByT5XJWuimq6lXoN6iDRgvWfCoP9eRmxGJcePLiCBe4oFIzGFm3C6/AmtJAET4wd1
         6fgx+sBJWVqk8yWpvdxtXHm9p3hLV29LvfWn/3qVGccs9uePeUQa9FXtqRx+FoUxFWPE
         kUZQ==
X-Gm-Message-State: AOJu0YzqDMWw1IjPL5yvgU8GaHv4PPEP5+bpyFvQpvFPaOLRn70JJDph
	c+RVeXjlDk2khFDR5+7rxhjHjOkP+h3nnA8YApGh0Qa0YLwdc4MDlwdckW1eW+KRoIn7qvUg4dx
	2mVUDp0qYqA15bZYL/Ypfm6irT2leisk=
X-Gm-Gg: AfdE7clPHXjyIMQjJOupt3F/xVBGGMbTsANHdeci18gtKsBVKopoFt3/hA5OHBu+zVV
	EdNBH+N+IO9W6ah7ji2AEoJRxOgB4XjacGbq0toU40dRUXNKqpTGFWT8M0124T8ySMEgrYgBweo
	X7muD2DeY/vvHdIJzMxFGVETyz4lkm9h2JeNqdmhxvkcvlmyKC1MR1PlNewOKy/+n05jg80Uz2R
	LP4GBhwUYd4O6wN6ye7f7Su7Dae8zPymTKNAbBckQeCDVKkPYE8ss7fM0ggYwOreQiiUI3FYw==
X-Received: by 2002:a05:6402:3605:b0:69a:9c13:a2a2 with SMTP id
 4fb4d7f45d1cf-69cd6f15e23mr900377a12.41.1784027200462; Tue, 14 Jul 2026
 04:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607140512.I7Hcmuea-lkp@intel.com>
In-Reply-To: <202607140512.I7Hcmuea-lkp@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 14 Jul 2026 13:06:27 +0200
X-Gm-Features: AUfX_myFiQisTM3n65zWfIK4U3vrk1GtVKuWrRs4NbnUcYmvb9qW8l0moqlIPOA
Message-ID: <CAOQ4uxjEgOH1H+YMs2y9Fe4Ri6q=yrr8FqKX1BH9DjeVwvWWag@mail.gmail.com>
Subject: Re: [amir73il:ovl_copy_file_range 3/6] fs/read_write.c:1499
 copy_file_fs_cmp() error: we previously assumed 'f_out->f_op' could be null
 (see line 1496)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 9:16=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> tree:   https://github.com/amir73il/linux ovl_copy_file_range
> head:   4421f88f42bb20b8a6f9fd56c5c877a1088d0e00
> commit: b86e287575a3f81b04ef92b5bb46f87329fc314f [3/6] fs: add support fo=
r copy file range from another fs
> config: i386-randconfig-141-20260714 (https://download.01.org/0day-ci/arc=
hive/20260714/202607140512.I7Hcmuea-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9185-gbcc58b9c
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202607140512.I7Hcmuea-lkp@intel.com/
>
> New smatch warnings:
> fs/read_write.c:1499 copy_file_fs_cmp() error: we previously assumed 'f_o=
ut->f_op' could be null (see line 1496)

I think this assumption was wrong and the extra f_out->f_op test can
be avoided here
>
> Old smatch warnings:
> fs/read_write.c:1631 vfs_copy_file_range() error: we previously assumed '=
file_out->f_op->copy_file_range' could be null (see line 1614)
>
> vim +1499 fs/read_write.c
>
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1491  static int copy_file_fs_c=
mp(struct file *f_in, struct file *f_out,
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1492                           =
   unsigned int flags)
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1493  {
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1494          if (flags & COPY_=
FILE_SPLICE)
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1495                  return FS=
_COPY_SPLICE;
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13 @1496          else if (f_out->f=
_op && f_out->f_op->copy_file_range &&
>                                                                  ^^^^^^^^=
^^^
> if ->f_op is NULL
>
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1497                   f_out->f=
_op->copy_file_range =3D=3D f_in->f_op->copy_file_range)
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1498                  return FS=
_COPY_SAME_FS;
> b86e287575a3f8 Amir Goldstein 2026-07-13 @1499          else if (f_out->f=
_op->fop_flags & FOP_CROSS_FS_COPY)
>                                                                  ^^^^^^^^=
^^^^^^^^^^^^^^
> then we are toasted.
>
> b86e287575a3f8 Amir Goldstein 2026-07-13  1500                  return FS=
_COPY_FROM_OTHER_FS;
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1501          else if (file_ino=
de(f_in)->i_sb =3D=3D file_inode(f_out)->i_sb)
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1502                  return FS=
_COPY_SAME_SB;
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1503          else
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1504                  return FS=
_COPY_CROSS_FS;
> cd6e8d0dbe33ef Amir Goldstein 2026-07-13  1505  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
