Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EE4346AF1
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771593559; cv=none; b=Qs6iksx9GvHbMqwIiDwBYM/yB2tVz0lzITF775NC1f8vFUlIAdPw7ycgoeIiESxwRQ2/zlI6xmm7Jl1y4U/L9qxJy3TAQA7zXLkoHc+1Dy+lyPUVRXgXAqokHGqJwIEW/OS/E7ILkVfaWeY3mmuuKih7NwZWUL7X9BdxBhckd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771593559; c=relaxed/simple;
	bh=NFrS2s19ZjYP5F+VHpTJ1OXLeDRGc29650+iadC8k80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4XtumDqb7pKBuUOK9CxLqVUv2cnVunjv95WW+U5hIjAhzKiUhzTVAufwni8OQXr8S8UtkeCbeWTS6CwGRrZP9bYnIqlefgZJV0SJXHc6+c7SXtlXP5SzqS0Jbr+4/0vtiHgIngcODbs5QY/HZHETHU34d/Ss8owTx6hEcpNPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I02vcjDu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I02vcjDu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A1FC116D0
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 13:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771593559;
	bh=NFrS2s19ZjYP5F+VHpTJ1OXLeDRGc29650+iadC8k80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I02vcjDupkTiiiArlDYxMHJBzkIFY1Le8R77764xjIMJa9Y0g9oqg8YGhP2vKbz0F
	 KGlvt1Ifc/s/hotUzz2WxCTXkoO55J1NIHJx0FiP/qDC50OV7DIK0OiT1YXquEZiCH
	 Q1o7xghYss+nB9jC53N/SBTQ4Mop7CaE0D7DDrDjOagKzvRs2Qxjg5R9rwf/ic0Ae1
	 geqvW9bqbR16dzK3N9d83g3PP2evSAkBFjW8Tut2zo3cx0N+ecRiM3r6FakvtfGGiU
	 yK5t0pzXJ44CrLNwWTA0XNcBT9N/IIad5n2asx3G1a7BltCxIt0FeD6mws/pnYWCay
	 4TckT234KaEcA==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae5f0777dso1774227d50.3
        for <oe-kbuild@lists.linux.dev>; Fri, 20 Feb 2026 05:19:18 -0800 (PST)
X-Gm-Message-State: AOJu0YzB1Bv5cCP5C1Fi8PowXVQm8nqjqBkvsWXkJhu6MFH9LZvzpt3b
	FfiDwvUyHNqol2YQayCyHTKjAPZjRZeVtdwMIu/M4jEXWDzAlPdDrWrrBEyCZKAWyEFA2v6SwNT
	427eqDjtpDeA/6RWmHlsI8hIPhPEQ5mU=
X-Received: by 2002:a05:690e:4091:b0:64a:cd80:7c77 with SMTP id
 956f58d0204a3-64c55587d81mr5955807d50.23.1771593558071; Fri, 20 Feb 2026
 05:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202602201735.XhNCovu6-lkp@intel.com>
In-Reply-To: <202602201735.XhNCovu6-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 14:19:07 +0100
X-Gmail-Original-Message-ID: <CAD++jL=wsSQDBLnPvoyE-3naFv_a5x8fk_aM5Wp_1Bvyr=NOsQ@mail.gmail.com>
X-Gm-Features: AaiRm53VyKWYJVpg_DokU56Cp5okgS05-2w8T1SNzl0RawPJkK6xiBL7LAJ7EdM
Message-ID: <CAD++jL=wsSQDBLnPvoyE-3naFv_a5x8fk_aM5Wp_1Bvyr=NOsQ@mail.gmail.com>
Subject: Re: [arm-integrator:b4/ks8995-fixups 5/7] drivers/net/dsa/ks8995.c:314
 ks8995_get_revision() warn: was || intended here instead of &&?
To: Dan Carpenter <dan.carpenter@linaro.org>, Helmut Buchsbaum <helmut.buchsbaum@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 11:25=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> smatch warnings:
> drivers/net/dsa/ks8995.c:314 ks8995_get_revision() warn: was || intended =
here instead of &&?
(...)
> 484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09  =
313    /* verify chip id */
> 484e36ff18341c drivers/net/phy/spi_ks8995.c Helmut Buchsbaum 2016-02-09 @=
314    if ((get_chip_id(id1) =3D=3D CHIPID_M) &&
> 8391defbf00b98 drivers/net/dsa/ks8995.c     Linus Walleij    2026-01-18  =
315        (get_chip_id(id1) =3D=3D KS8995_CHIP_ID)) {
>
> It can't be both chip IDs at the same time.

#define CHIPID_M               0
 #define KS8995_CHIP_ID         0x00

So this is always true and the branch was always taken.

Before the deletion of the old chips support, CHIPID_M was 0x00,
and what is now the constant KS8995_CHIP_ID
used to be ks->chip->chip_id, but that was *also* always zero.

This code has been here forever, this was always true as long
as id1 was zero, which is what it is actually testing.

See
commit 484e36ff18341ca1fca4258139100b2e90530f53
"net: phy: spi_ks8995: verify chip and determine revision"

I'll try to fix it up as part of this patch then... it makes no sense
of course.

Helmut, any comments? Maybe I didn't quite get the old code.

Yours,
Linus Walleij
