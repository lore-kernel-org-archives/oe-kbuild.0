Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97E3A7F7C
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 20:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652489; cv=pass; b=Awr+SXRtX4sazxdotJ94dkSt40kh7kQH9WFZ+RiPlHHpmtnnKTT1EoaSDPK7Ri505FA4H4pMmgbfJwJK/2ucVK7rFcdW0j98j1JPnoIf6wkku4CwkvP6N/dlOk2AOel/Ai9LSGgLWYXD2XQbfC4o2Z+g9CGeyXZCyN6r47ALQWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652489; c=relaxed/simple;
	bh=/EUsxCA39+lm4qZz/MBCSURD/yQCFJ9Pw3mnXV58pWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6zaZ/SugMpU8a9Zwk57NlPQtIckMWlLBHiOo5rEkBKQnkolS2YpjQozDwMBVMfxrcUClApfUTYEhFT8mPnOiFRuUEsorlRQl4sv3/Wo7tvdFLjVGC+cVW51gbqcfbWzN0a01LSCSPKMbcIC84IY0n4v1/QihmmRm68wdMs676A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8vZqrJm; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8vZqrJm"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6688acd1a51so445221d50.3
        for <oe-kbuild@lists.linux.dev>; Thu, 13 Aug 2026 13:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786652486; cv=none;
        d=google.com; s=arc-20260327;
        b=rIHsZxTT0/LmrW7JjewHep4HBBPrDuTqMCZXFgCWu6uSx4iIogYEOYFMIhJea3lTp2
         3EorvMKahxh9VcsPISIR8iWX7vz0txBvz1nFB7JRWVv+krCW+kb1IgncW7FrGfKub+2D
         NT9bPokNnEv8YOJIFjcriGQ7RpveaRFLurQqtsJWnXokQHOewtRotIiJtFqhJPAKsa5/
         dhsaJt8LV6cXOUBqbM6IVk066DHr4Yz1Wg2P9grFmmgr1+joWvJfTtU2IprX8gREOz5U
         4kYGLdoVW+mE3pcI9KOMeLpPSzIdRCR3B86PkGaYKlleq3nOpPlN/FPaayGjQsL4B1AL
         C8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        fh=gYQLfv6azk0Jg/DB0JkPC9UFN2ltpTigo+A6/ehXDww=;
        b=i1xZChyCbVvSq0QJFAAKg88Bh7DtT2OTdL0GJd45y6zVC7lMJDCRxerWywHbPMgD7N
         DVwGPw+OHKR/nR+MiWJUiEjHLZs3UMZ37BmKOIIsIU8XOIVkjIn4oZ6sRvCmBnVedQeK
         aOUbHQYU1hmOhb2ellwbeorkTW4I7zL0ITWZOpfBu9vdu7ovNemr/gz6rak6oFsatDZ6
         8XYoJVy+Uo1Sp69ADBz0gOXtvCG9u5nRmP2uHOM82g4Jz1GJh8+pP3OqWrbaWerM5Oag
         Jt3nIVT1hsUI5129SSQmAxRXmLdO6hhO35a0BqwgEIDMdiLZG48gCLmf+INDU+PZcjf7
         k9oQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786652486; x=1787257286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        b=g8vZqrJmlMFRhMlHeNxnO56l4ZPv+ulgO1tohZKeDeSoscygiHdAe2Aavyip3AbApq
         7gCs9wb1pDaE4rEe5OwqlIxD0mHvG2na4tg27N6sAgXDiFoaG5lS2q8Ut4wjxLoLsxnj
         qXDEa2g8UFB04Fosy4zYYVnHIt9WFqmJRTolVAlJlmvOvkQJKvHV3hXoMiJe65wOn7Z8
         2cL/2/4PpjO7tivoRHIguKnRY3gx5j+mtCn6G6Wv34kU887fJ5P5ZIS/vazS/b4awmND
         qVlv6UddQcyCczKXwoMlBljkOc+NxpYx3ca7Owd+ptZViMlcbxIaHT1VJLiOkTL1fa8d
         AFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786652486; x=1787257286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9LYBk4sPgx1JAH4KgQ0V1nTggAqg7YV53F/Ftprz+uc=;
        b=nWlfKahlNf68Gnajgm9omd7zG4y2qln8v2eZOwZhGdLurP5Fuz577j4deTr5FU8f5H
         tzs5RMIeks0giEXLAFglP+s5vXzOIP7U4Rcw6AufH636DxinuQavX8+HMi7CUpa3KdQz
         KrL2cuySQbzsBoZ+S7mMDmzEPv6oLSB0wAeiAxIetN1y3EO/BwE1LcLnxhZgRQBGz9Ht
         dhTda+fVE8gcpW8wChLMt1lXKNgpw7P/bSrZHD5YiGhJYEtkdDy4UiXO4pZWlwlxNglI
         ge0b7fNj4pUilccQt+d6mVASZ4UDm4d+dzIY8KK7LKEPtmtNhyLwfD0vPf4a4xvLOSmK
         8MEg==
X-Gm-Message-State: AOJu0YxPnecgAJ15ToIEnO1tG1JehPnzvmvAGExl39+ZYa9CmFkBQb5x
	OZ6nhqfwEJFt3vyJibSKzygytmlfMZOZFbIMBbAb1max/bBXXWTiGPxOY+o3Ryl9UNoyTVmd8vW
	NiBFfoQ/hVyHlVpAoVjIs2eJL2ZQ2Tsw=
X-Gm-Gg: AR+sD13oK+weF2hpbrQSW//g2kpv4powaeWSBCEyW4lKFlSjQrTwPyLeDp10/sRnQRM
	zBY5/0udr9XRYywAwinAv06ok6Yiz5V+94wylTvlFWnPfWixNx2IBs3ZbZVUvpUQzbEx8JeMmEg
	+qmd+p2dXsLoRNHRG9El2RTHNuVJQDqTuUYLvEiXbvknUBNmGJTM9y2DCUXRugDq2RduEgqL0iD
	saqBHvTglkosqQBvCIPQN/yMQX+cJbCI4CbI6bmFUUmVVLzwG3/TH257eWgjNCwDSFrQIneWowH
	HxyhlG1L9SWNgmUBc09ly6sop6zjwKOj7/kEIkenvrJThR54gQ9ZfD+AQWJp31IOJfYBkPyDYaV
	2elg=
X-Received: by 2002:a05:690e:43c7:b0:669:8d7d:a5c8 with SMTP id
 956f58d0204a3-66c72ebeedbmr297462d50.54.1786652486534; Thu, 13 Aug 2026
 13:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608140244.f2Omwf4y-lkp@intel.com>
In-Reply-To: <202608140244.f2Omwf4y-lkp@intel.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Thu, 13 Aug 2026 16:21:15 -0400
X-Gm-Features: AUfX_mwUH8rppqOLlLKZe5EqV-Qv_xkpyD0Cl5wZIq7dIz9NFmE9CN4eGxZAk4E
Message-ID: <CAJJ9bXy7KXcumxRVg0MzcYMt5Dw2txzzUKJryDE08cLfBfnr6A@mail.gmail.com>
Subject: Re: net/sctp/socket.c:7036 sctp_getsockopt_peer_auth_chunks() warn:
 potential user controlled sizeof overflow '8 + num_chunks' '8 + 0-65531,4294967292-u32max'
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:05=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
> It doesn't really cause a problem these days because copy_to_user()
> doesn't accept sizes more than INT_MAX but it would trigger a warning.

Thanks, good catch.

Claude noted that sctp_getsockopt_local_auth_chunks might also be
worth fixing.  If no one objects, I'll address both sides in a set.

Thanks,
Mike
