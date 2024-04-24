Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98626158A3D;
	Wed, 24 Apr 2024 07:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713943281; cv=none; b=IEbhkyFApvBuLBMBvMzdi/vefoAqsWRz/xXKkWzFm2u2rJ6fcaSu1tLO36wgruaLfdz8QWWtE5P4sZVfk/p2IUgNpySA9S386chDAjRNPZj0rnnvgN450o09Qr6t5ZLIsvw3SBFFWb09D/4UeQ4Kf5N/9H6X+lS6BphAky49jHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713943281; c=relaxed/simple;
	bh=yo10sCOTCq85cFaAQnC6NyfO+wxyu7SYxXfs03uIpew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQgrWaeI2RKRCp+8rJ44J6oNyHq4at8fa+TNFsHRaOcyXUxR9qWaygworKBkEO9AaFzEqZE9D574dOWo4s/PDBAS/DEdhZGN5ob4NBkpl2aEm9uj81QaPPr4T21li7ck5c8H/zRMvN4vlVJttOMmRZYsPHB7SsCbUGV/fwEZ7IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPLSCmfl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPLSCmfl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF22C2BD11;
	Wed, 24 Apr 2024 07:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713943281;
	bh=yo10sCOTCq85cFaAQnC6NyfO+wxyu7SYxXfs03uIpew=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XPLSCmfloq8T/oP3OB8NHhq11ye8mXu1Vifv95c+Af6au1jz/WcK7iAK77M4xVFtn
	 bLbXg2W1yHbIEh9QMQ7lZQPFDRTMU6qZnSCDbTJXl+Sv6762UlfHQvy9Km7ATe1xgH
	 Q0pg7lKCNggZ0vPLSgw8958aQlAlIoL/wYU5riZnRm0J910sqGLcnSJdaZn1zjauwS
	 jWF8E53a6ikKfclAzDNwg8Vf1S1afhKsu51aS+6bt1n2bNPrylJ7z/iGyNUk6+wInH
	 851a4yq5zB4VFUEgfvOzxphhhLtpQSTP00YEPnxstS3jtFCf8kLukhJxPTh5BTo1hb
	 gUIdifMrER3ZA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2343ae31a9bso2678771fac.1;
        Wed, 24 Apr 2024 00:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3UDkuIh226e+mWyNXCYjF26IlaT5j+O39pF9uAeUXoCqAgyOnCH81KtxXNh7IeVz8/U8GFGtgy2O1jfdJ8OGJArUxlo17lAPYaYDXcQ==
X-Gm-Message-State: AOJu0YyBPbzx7FTB3hcNEAyseOrfpL53WCcZM/AKlKj/lpuN4Z1xlMHK
	f8co2bJ4gBDrsjcmF/RNIl9k2OOPUY14vln1MtFNKhObyhmGwAx7oJyXYfnjshtiHXNz89ertBw
	bOrC888axjrKkxSDxAxdGW74t4vw=
X-Google-Smtp-Source: AGHT+IHW5fgXuqOMVpY2Tx+J8nWc+mX3gSxAg88PIk1pWLvHwBZB7PqIfBqZeeJ36YmWfKZW2d/5zsjWpeSF0EHmNZ8=
X-Received: by 2002:a05:6871:a9ca:b0:22e:bf56:7dc with SMTP id
 wp10-20020a056871a9ca00b0022ebf5607dcmr1599885oab.13.1713943280775; Wed, 24
 Apr 2024 00:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e9ead449-6ea6-4017-b26a-3a80ea6d4018@moroto.mountain>
In-Reply-To: <e9ead449-6ea6-4017-b26a-3a80ea6d4018@moroto.mountain>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 24 Apr 2024 16:21:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8=8i+=_Ww9WCN28+9rbLpF__M1F6n_FeavRX2VnKvrBQ@mail.gmail.com>
Message-ID: <CAKYAXd8=8i+=_Ww9WCN28+9rbLpF__M1F6n_FeavRX2VnKvrBQ@mail.gmail.com>
Subject: Re: fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error:
 uninitialized symbol 'share'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 4=EC=9B=94 24=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 3:28, D=
an Carpenter <dan.carpenter@linaro.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
Hi Dan,
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   9d1ddab261f3e2af7c384dc02238784ce0cf9f98
> commit: e9d8c2f95ab8acaf3f4d4a53682a4afa3c263692 ksmbd: add continuous av=
ailability share parameter
> config: x86_64-randconfig-161-20240424 (https://download.01.org/0day-ci/a=
rchive/20240424/202404241435.Yxr6Wapq-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202404241435.Yxr6Wapq-lkp@intel.com/
>
> New smatch warnings:
> fs/smb/server/smb2pdu.c:1992 smb2_tree_connect() error: uninitialized sym=
bol 'share'.
I will fix it.
Thanks for your report.
