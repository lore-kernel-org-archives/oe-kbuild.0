Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696523;
	b=Hf9eFLIg6gvW6/Gv7s/JuPMbFf8ODMTEBDPx+C25w3bhRetWkuuD5X80opwPtQoVHDLE
	 QKvzWDO+Zvi9qB74lg4wLlmqsXjQP9JLZyoEbXXdq9Eu8n7BkDZU5Pq32lePckrY/g0KP
	 M4VLAtlJ8fW20pag+83u3BidKGiKzN8u4yqvkQ1ihtBLuzNxzWxJkD9ZZ+kGdlM/DxBrm
	 KlVFJXh2MLuj4sjqp/32ZD5nyHn+ZVluq8eBvqtTsYS3+LOB3WLMezMoyFB4KM7YwPUH/
	 JYy6xBQ3oADa5Yct+IGEw7pAWtlVizqRZWAriEEsj2/fuSbrLY6UtcHbIjORWu4p9+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696523;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=FEDVzQa+iZe6gwdu1NIfM+JEyWbQaQvPJVlc6XP2vwo=;
	b=jKIo8jh9ig/Geuvqns9bR3DI8dkt7OUmsrbLI03h+FS76xhBF/xMP+T+lXsQfJ78eKl8
	 4OBCS4+mfnk/DIwrOFJta/WsaN2LozBcNo34mUucbV4DgZi5Loc9CRuyUGRG9FjmO6785
	 SqWgkBbDpgx+XdrMTml1KW3oeOx2YxcJONM5ngD74wimiUbU/KFJtX1eoBrzDvq90qPer
	 PL6Ii26fawqqwo0dU4Fv8Faio/r4MiZvMJZznKOAyE2kOOwCpmyDtJvxIMWPii3qAXNO7
	 +INgARbtu3CfpcIXoG00MK7Ow6LuNsGQUfooHvSO9Qo+hH6cNpKHRQQ4fRNkYcMfc8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StrxGH4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326BE606A321
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=StrxGH4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A9A1F000C6
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696522;
	bh=FEDVzQa+iZe6gwdu1NIfM+JEyWbQaQvPJVlc6XP2vwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=StrxGH4uED2k895qoI1asFryJkOWBxHfO8AsxOUwO+WvwWH/mzwhwAtUHbdooVF/f
	 WRpzm3q3Ewb1difInye7kOzfvb40mhXgccYfEZgCBaO6nE+rBz7kpkPGCX2bJaZFwk
	 X5HGY2AD6MxJ+QNyxw177iv/1oh3aQ8XWhJ8el5w2nIWvmuMGwZdSHXBf7iJXlxjxM
	 g/pyZkfVfKInPAs+X7UfrZ+OyWXaKsyXwetxFhoOOd9r8hsvGsmrNgUzL1BfyeVWbo
	 5IhYhl8uHCL4tlkJwIWvbr+5zKvJf0ajD4FWtmhJ7LVzc5TWNhbRlNJkR5SUt1hFLy
	 rRw/aA+tKSZsg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso1038140266b.3
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 04:35:22 -0800 (PST)
X-Gm-Message-State: APuU4Z/Ah4XixeATtKlkVhBpy4hMymmpLjhEWxKcdTBBTXCWViioP/Fm
	VP4O+KIOsl0ulTwe07cC8MrY36IiXvoRjm8Rh8cAnDAFxip/CEv6BkHotREl9V9xoNtGQxdWbC/
	HU0t2TSb+sQsOYLTJJsR8BSo+McXR9YE=
X-Received: by 2002:a17:907:9411:b0:c40:d920:747c with SMTP id
 a640c23a62f3a-c513a47d409mr1725738166b.7.1795696521485; Thu, 26 Nov 2026
 04:35:21 -0800 (PST)
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126042013.QSoDDLPw-lkp@intel.com>
In-Reply-To: <20261126042013.QSoDDLPw-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 26 Nov 2026 21:35:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9R-bO2N93DcUnHKc7Yu=mQonFGbBAOpcXLPDaSfaJEsg@mail.gmail.com>
X-Gm-Features: Aa3M54q-aWJlGzy3E4a3rqceojy4xQ3bv3-JtxRrek-GZg0bVn9Lcb4oZpgZyVQ
Message-ID: <CAKYAXd9R-bO2N93DcUnHKc7Yu=mQonFGbBAOpcXLPDaSfaJEsg@mail.gmail.com>
Subject: Re: [linkinjeon-smb:ksmbd-for-next 48/48] fs/smb/server/smbacl.c:793
 parse_sec_desc() warn: missing error code? 'rc'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, Ian Bridges <icb@fastmail.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:01=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.gi=
t ksmbd-for-next
> head:   f9208b7a49196e36c0434637ab83e001f5800a1d
> commit: f9208b7a49196e36c0434637ab83e001f5800a1d [48/48] ksmbd: use the s=
ecurity descriptor codec in callers
> config: sparc-randconfig-2200-20261126 (https://download.01.org/0day-ci/a=
rchive/20261126/20261126042013.QSoDDLPw-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.5.0
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/20261126042013.QSoDDLPw-lkp@intel.com=
/
>
> smatch warnings:
> fs/smb/server/smbacl.c:793 parse_sec_desc() warn: missing error code? 'rc=
'
I will fix it.
Thanks for the report.
