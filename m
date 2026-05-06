Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC2286D4D
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034108; cv=none; b=D7ATQUPsBA8JbjyS/5TyYNEDkowW9A69V++liKFwnE6k40y+PwvjhSQcdOXfubztAvqETeSGTcx/+6VGAJ58hfDnZpjcuTQdxBTbgF+7F9iYHsoOG6H8AhvOTZ+IM90AtY/vT25M9h3T28fGLYpQWdxv5wBi/7+6uNa02YPPjiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034108; c=relaxed/simple;
	bh=CfB8B8ipj0D5OFWh98IVTql4NcSQtNN1XsYgx39CFD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HJtumfdUjWlR0MKjrluKsY4DGTaCPSj2CIpznTSK2z70tcXMv4Oi98CLP8gAUM0Mrqd8/aJEHrDj2+ayhKbDTE9Ne8JV6Um4+jEvFH1ydOs3Rew9FgQh/ogUWtJ6yNg9ZBJbghf7iMVSP+njG6mGRwEZ5LJx58ibL+YD9XmokTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQBgM3Vs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQBgM3Vs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7B0C2BCB4
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 02:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778034108;
	bh=CfB8B8ipj0D5OFWh98IVTql4NcSQtNN1XsYgx39CFD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TQBgM3VsGC030V1NSHoVtckUWQ1cxAq4tR39XsgJoNsWuVVNul/qyBGBNuCEQeq//
	 da0foHkI9/cTrVM5G4ClxHNN53z5LcVKoM+htDOgaAmI7lxcWNWvDdfzz0BydERztc
	 bn1vf+1C7pwznj5zcq98W8fn6SWJfBcFQRoKuvru2u4KvxzrfAwEKN96pblqp6xVyY
	 K/HMDjoW8OMsK5La0nRLs3cZNRMR8DHa/A61UnpC1uMQGmHDeQ1ofC4BrQoRmfU8+B
	 6LSTW+HN9kmIBONWTL6kxhn06Ug91YdXHyPyeRIdLpECQGWOGDDedIfP2LpCaHECvI
	 UMpRWtg8eYDaw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so7550048a12.1
        for <oe-kbuild@lists.linux.dev>; Tue, 05 May 2026 19:21:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwN7LdkxkdS7y1bCQ8IgPQbCAnkzyK8/4+VhlHZiZ1H3Uf+lHME
	Qv/FkVJX1Jz0t4sjUMwL18yrmk2Oc7VnUUGtILTG0WsCBjZFjHfCBsmXFWe45n57idzlpaYWwMW
	hX8YbDb+pa0XZZ+aSQdqrs3CbrPZaQTI=
X-Received: by 2002:a05:6402:5407:b0:673:9b15:39d3 with SMTP id
 4fb4d7f45d1cf-67d642b04ddmr435212a12.16.1778034106883; Tue, 05 May 2026
 19:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605051951.OStHgx7p-lkp@intel.com>
In-Reply-To: <202605051951.OStHgx7p-lkp@intel.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 6 May 2026 11:21:34 +0900
X-Gmail-Original-Message-ID: <CAKYAXd98VwNma+BhNw_4_T_OOZdVyCApSOmWiWQPQyMO8J0p=g@mail.gmail.com>
X-Gm-Features: AVHnY4I4a3P1HlCPaYhF9z-GQLRkiw624eY1U61HweeeNBppkw7243i87LnfG2E
Message-ID: <CAKYAXd98VwNma+BhNw_4_T_OOZdVyCApSOmWiWQPQyMO8J0p=g@mail.gmail.com>
Subject: Re: [linux-next:master 2139/2816] fs/ntfs/attrib.c:2631
 ntfs_attr_add() warn: variable dereferenced before check 'ni' (see line 2628)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:30=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> commit: ae00c45e40f1eb19428865ee3a3f487a454bdc20 [2139/2816] ntfs: fix va=
riable dereferenced before check ni in ntfs_attr_open()
> config: alpha-randconfig-r071-20260505 (https://download.01.org/0day-ci/a=
rchive/20260505/202605051951.OStHgx7p-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 10.5.0
> smatch: v0.5.0-9065-ge9cc34fd
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202605051951.OStHgx7p-lkp@intel.com/
>
> New smatch warnings:
> fs/ntfs/attrib.c:2631 ntfs_attr_add() warn: variable dereferenced before =
check 'ni' (see line 2628)
>
> Old smatch warnings:
> fs/ntfs/attrib.c:2930 ntfs_attr_open() warn: variable dereferenced before=
 check 'ni' (see line 2927)
I will fix them.
Thanks for the report!
