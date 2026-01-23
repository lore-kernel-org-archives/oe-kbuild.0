Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB712652A4
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769198566; cv=pass; b=hc9CIqh5KmOq0KcnJjowaA2SXPYzykJ5nvoTYzzrs3eIg9h2igWI1TPXrNf6ZNHSVz0BNE5j9hrVTeHyA9nfyrYBD5zbYyzVq5cQVncdm9jVqxE6fgYcqQTXR97Z2DiWAICHR/MKYmlSBDyLnBIESkOfRGFpMZ4B30AEBzewyeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769198566; c=relaxed/simple;
	bh=N1WNpGhp0sNZGbNcGRXlb7uViIb7gYmd7lExA5LKlZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R78p+Y9f7m65+DM/b2oiz7raYFuorQdgqIDof8e7ZFVD/dndGsJgzgsXMzcis0pf9qhM3ovL5DAffGJt1dZv2B5Me7wv3hB3ZS7Uv99A4GcbKxU69728VXKckylhYeJbAZ9wLnkCbB1h19A1Z4ULtYhSlrHqbw0MsJIz6RrXY3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z95udger; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z95udger"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649278a69c5so2482916d50.3
        for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 12:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769198563; cv=none;
        d=google.com; s=arc-20240605;
        b=UJeDcHWzHz8xEbkNK8r3lEv9j23xyPsZoU8940h22/7v9zaS/wOUYAd2U+ajPieY9w
         MVaczlczwUHG/ymsE2Mf3ee141trGoHxMFNJsYdFdaR81D4HPSLU0qo5Sro1gq8Ha7tT
         s5vVrmvS5ZyXBXD2VzEbrG1+qrRPtzVRG8OgylkZT+u9V0MeNP+QIUkTo+PrvvNmScXn
         V8Crcn3WIA7Qu2gOEHbKZuUvebRRgllhOxb++sYSldh0uV6RTEh7wqcrwVT1/za+Y1pn
         oZC3UwYWa7tXsZq6K5WTSF9XIw4tDxXYDdG1o0StsHPMQ5HtVmfrHB//WQbdHFTIK1Wa
         MmrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        fh=dZWptyzaecjuoD8VnHOlSYESdiRy0GB8XUbcxXaC6W4=;
        b=YqlcbXKnQJ2kqbHbaGUNufBXb67MA0tggA67OPIbIKChUAWGN0MBOsQM+PFM5RNacI
         dEPWaH+dX+xQL3C9fbAXt5zs2v50//1FxVEkoJQHWo/IVCDHtsneWwDkx4yrBdSPogJv
         j7zvxOi/m7/F6/cBqs9TdVKKatkzJHYQgfP0ahwAS02A3lzCOR7yzndpcUGdlMU9uvVa
         PfXGs04H6YGk7uQ9rtHh8OZVVQq1/wiOW87Q00w/v/SZRL/E6lVT89OeXlDWcgHeWRlZ
         h1QOMyU+HiNANMWBvXjt9VUjyX5h3/9xkaeJYiJsPhXG1GwwZ7oRXZ1pRMOg4zv61Suf
         ISfA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769198563; x=1769803363; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        b=Z95udgerkRIO4l54EYbPjx4SxpWDcl2bhA/h8NcwToWraNREa/exRUHDjl/n7NSyWK
         KXrUIn0by9YDemNdU/OcY0vNmHpzLVDljMqZNr6BnKnefzSWUT2bwwkmMtIGw4Aa92Q3
         wMl08F6orRgZ7XvhJOeIiFlCVsu2Xs/6aFhqxN/6y22kkT+ArHl/AB+XMscEsRYHvUkj
         C9RjMHoH17OyqcblDGuWJEvdBdVXUC5kwqyAs7Lzhf/rB46SN48qDxWfxavyqy7v0qRX
         HjnLT3sYPyXlcXqGD57TNFh1CLIAxg/f4tcDeSrqve34sXFkm0CkRgFVQ/PE3bliL7AH
         MRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198563; x=1769803363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EkhChGP0ZbklSidP8dLmcPOAubIdgw7SaaHGflOOdLg=;
        b=DD+O98LdFXwDBUfX0RG8y+w/v4z1U2VutmEKguVDDfLdDf+6Ajsm0UCYjC4Yw6kFH1
         yfZHMT7TfHYSqAtR0ehDkhiO5GHaivZk0SuO055LK8haZvtO5RXNQGtfKYauUNKkT9C0
         oCJU4UCW9RfITGO5GIxT/Ybr3n1aQDIVevQYh7y3qGjf8ZnB5E9BR8+Rh19lkufjGq7w
         IAF1dhWHsaFSbvBeU3HQXd/Yqco6W0Ous4OhgZWiWt2gZ8D1UtTcWO6SlCR0eclkowGp
         ++q1QylR6N1uyREQE0AW3n82LAJW9fEzkETPxOJkfQq9/57pN9woPTXcz4FuMUbh9TvJ
         IVBQ==
X-Gm-Message-State: AOJu0Yxvr8oTfukk/64X45b+Od8Lrnk2Akvf3TMUljsNh4jZruoM/8E/
	JqrysdatcheWKtINxo9DpRmeFKJXbVhfFnC5BsMX5Rj3pLJ06deSOxjTxxHt9ziQ6cdvxyy7g5N
	Bni6VgxiyUJjdM6PF8gCrKZTv2oONqbc=
X-Gm-Gg: AZuq6aLRY/FJv1gc0wsaYJD+6pA3f4b6U7ZCxc2wFY/iFccGpHuDulsvYsPRRwVEVMy
	Mq2uNdInMhnsQ3Q4UsBQieJSOQ8gKPVtcVbvlssMsNCkywfgS/lwdLaCjiBVS83ttDBra1CyUnC
	IxCRhPzbYSFyVD/tdOsYayBlyKlZ8wvOhK4R1SAVyjutYF2puEO5XUKMqka8zPjJgAbht/bQoWp
	sVUOpIt9W1/RY8LP6bUewvBBEDWebXXyzDLYII3uzGrPaTFLVlf9DMBltCBR5dsQinQXIWqJCSf
	Vus=
X-Received: by 2002:a05:690e:4186:b0:649:6658:ea91 with SMTP id
 956f58d0204a3-6496658ec17mr650331d50.0.1769198563454; Fri, 23 Jan 2026
 12:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601222139.VGTZ3L94-lkp@intel.com>
In-Reply-To: <202601222139.VGTZ3L94-lkp@intel.com>
From: jim.cromie@gmail.com
Date: Fri, 23 Jan 2026 13:02:17 -0700
X-Gm-Features: AZwV_Qj-bAHPt6tT84B11EMQjzpJT4i2sjpSnGjweT0wpJIk5iaoOOr7vENW8Z8
Message-ID: <CAJfuBxyv4kXHv_YbddhwYxSA_mk-BTH=FFK7qTg2JcgZVL24xQ@mail.gmail.com>
Subject: Re: [jimc:dd-drm-fix 45/75] lib/dynamic_debug.c:1844
 ddebug_drop_cached_prefix() warn: passing freed memory 'prefix' (line 1843)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 8:27=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> tree:   https://github.com/jimc/linux.git dd-drm-fix
> head:   354f9423ffa1fb2a31f8410ddeea96a7a8471ec1
> commit: 37e1c3e5c714f09a36daac2b5c3c55b3b7f9fae4 [45/75] dyndbg: cache th=
e dynamic prefixes per callsite.
> config: arc-randconfig-r072-20260122 (https://download.01.org/0day-ci/arc=
hive/20260122/202601222139.VGTZ3L94-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 12.5.0
> smatch version: v0.5.0-8985-g2614ff1a
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601222139.VGTZ3L94-lkp@intel.com/
>
> smatch warnings:
> lib/dynamic_debug.c:1844 ddebug_drop_cached_prefix() warn: passing freed =
memory 'prefix' (line 1843)
>
> vim +/prefix +1844 lib/dynamic_debug.c
>
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1833  static void ddebug_drop_cache=
d_prefix(const struct _ddebug *dp)
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1834  {
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1835      char *prefix;
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1836      unsigned long key =3D dde=
bug_prefix_key(dp);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1837      unsigned long lock_flags;
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1838
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1839      spin_lock_irqsave(&pr_pre=
fixes_lock, lock_flags);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1840      prefix =3D mtree_erase(&p=
r_prefixes, key);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1841      spin_unlock_irqrestore(&p=
r_prefixes_lock, lock_flags);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1842      if (prefix) {
> 37e1c3e5c714f0 Jim Cromie 2023-10-02 @1843              kfree(prefix);
> 37e1c3e5c714f0 Jim Cromie 2023-10-02 @1844              v3pr_info("drop c=
ached prefix: %s\n", prefix);
>
> print the string first, then free it.

oh yes.  thank you.


>
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1845      }
> 37e1c3e5c714f0 Jim Cromie 2023-10-02  1846  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
