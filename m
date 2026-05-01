Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EA3286419
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635011; cv=none; b=RoB338elk06kTBVrZC/4kwS66MbK2NwO/EyCk6c4bT8MzN5M/j0mgtE0saPn+Ux1Rd7pHY4qQOhmDw7A4i6DEPo5Y4DFTZB//8kmpLoMifwWeHabGL/8N1v6Jc3n9w3MlKkFc+de5GeNc4Nozevs1GQyAJm8/hBhuiL6hTVDyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635011; c=relaxed/simple;
	bh=FH9NdRogfA4nQcHr+Pj1RaBiFjjWEBAhRCrEH4dPIOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbT36ewQEEiEU57Ky0T+7fYKbjxVW4Dk5NAsPFFthyPeNkR/bSRXcCNgftUlxoHbj0GvBnMLndbTOYQXyReXI3iG7VQCr4Z+clghHK7Vl084aPn/5PU4mp/mmT/yKjcElRR2Iu6oWjJ4Aq2RNvxWIa44vhumb8Sl991eM12YCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SU6n7hyT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SU6n7hyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0C9C2BCC6
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 11:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777635011;
	bh=FH9NdRogfA4nQcHr+Pj1RaBiFjjWEBAhRCrEH4dPIOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SU6n7hyTOdCuV/8IsprzTMhxAxJXvCmGswvdinVKWZvCuheqF505uUfYlSo+WGRJL
	 SZiP3MGKr9ORfFUSzu3E0OtpQxUH/iEhiiZBFyh/iZxCHBy3Ly4EFa1crYLhE6/AAT
	 1F7bAJRhMASPWMpaU5xFz7HBG4b+p95tDr2Fu2Hyqopp3cGbJaS4KYsAHdkcEKioMh
	 7Alc2XWUeXubFi4UTTEY8fb3p6cc8Cq89k6HG7/DO2e/NES+JBtu8mkOaOL60f83xI
	 qn/k+lMj3C/DLJslwvjX7Uhh3gi3cciY/KKmmyc5aXo/WRvLD+RtMYxSSAcHGQ5wro
	 lFiNjFY07hMeQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso3003316a12.1
        for <oe-kbuild@lists.linux.dev>; Fri, 01 May 2026 04:30:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YyAqm05+TTC+l1msDK72jAjSoKl0LkV8ZiwFZ95KUKLRH99W0A+
	4ENVrqIMjWOk5z4qC7MIP+P3NM/ogv4vhsu/o4ul6+oFB4dptuxvlZv8Cc+jcTH1oKa1LRm9zcs
	UOTzyqqzxM4JmBj/tmyoIbg/bhkXWSgs=
X-Received: by 2002:a05:6402:4314:b0:676:3cbd:1f7f with SMTP id
 4fb4d7f45d1cf-67b5d6cdfb4mr3667601a12.2.1777635009876; Fri, 01 May 2026
 04:30:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605011540.0FJWFGIn-lkp@intel.com>
In-Reply-To: <202605011540.0FJWFGIn-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 1 May 2026 20:29:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_HhTV00oD0kH-grUJAJrjfLx4coWv9trQVWY59m42DKA@mail.gmail.com>
X-Gm-Features: AVHnY4JvhIfitin4RcJZE73TAPS-sTvu9jHFHa6rgx-kXU-aIGrayyjYaSAOSz8
Message-ID: <CAKYAXd_HhTV00oD0kH-grUJAJrjfLx4coWv9trQVWY59m42DKA@mail.gmail.com>
Subject: Re: fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable
 dereferenced before check 'ni' (see line 122)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 6:12=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   26fd6bff2c050196005312d1d306889220952a99
> commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Ma=
kefile
> config: x86_64-randconfig-161-20260501 (https://download.01.org/0day-ci/a=
rchive/20260501/202605011540.0FJWFGIn-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> smatch: v0.5.0-9065-ge9cc34fd
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202605011540.0FJWFGIn-lkp@intel.com/
>
> New smatch warnings:
> fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferen=
ced before check 'ni' (see line 122)
> fs/ntfs/attrlist.c:126 ntfs_attrlist_entry_add() warn: variable dereferen=
ced before check 'attr' (see line 122)
> fs/ntfs/attrib.c:2807 ntfs_attr_open() warn: variable dereferenced before=
 check 'ni' (see line 2804)
>
> Old smatch warnings:
> fs/ntfs/attrib.c:2115 ntfs_resident_attr_record_add() warn: variable dere=
ferenced before check 'ni' (see line 2111)
> fs/ntfs/attrib.c:2237 ntfs_non_resident_attr_record_add() warn: variable =
dereferenced before check 'ni' (see line 2232)
> fs/ntfs/attrib.c:4951 ntfs_attr_remove() warn: variable dereferenced befo=
re check 'ni' (see line 4950)
I will fix it.
Thanks for the report!
