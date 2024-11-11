Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39602153820
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731327143; cv=none; b=rwJIHBwkJZZb9aq5bNuObPijY4PJHzO3XpfBqyWlfkXSbiuRnWpp27ukHGMfqy9vFr2OWV8oTZqSC4Xxw1MSf+1QOOpKJ0Pif/k7GMDa9/qbiVGvBpwUCjq9DZrPQZCTWYljvP8X1AdMkHuIoH89IDm625S1mGgFVUgnyH2MWXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731327143; c=relaxed/simple;
	bh=MYPFJ/QHuhRFvZR1gxMo8eXaZCjaRP6tLWd2q3gcNcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqK3gvXWe4BpzFF7meJ6wM4nVMzh1FoR3WVdqcLfFgiYQp2flZh3Ry4GaOUlhDiPBY+z6XrTGdHtMlSyUUkueG+mAcWthDjO0J7y0b9ddn55NRem0Y5Gopshq/PaEo+eAz2T7skra59JBYhfcJbr1Nc/kzLs4iraYczzarbQQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=02kDpZhj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="02kDpZhj"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315abed18aso37281975e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731327139; x=1731931939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xs+3Bmk7/ET8ZIXxUWywxy47jkhQeABRqUPAmW38Cw0=;
        b=02kDpZhjDd3zyHEiZVwcrk2MW3QQCG3f9tZi93K3XizrPxLRECzlKT1AowG50AhNLy
         441+VgpMoKuLMPYHw0eN/gLa0Fs60TNnlJXOoYRLbg8y+sV2HAkTF6BudQV/+6Kw9dxR
         5rO/fHeRatZ3Yz56A9zBQaILYibUsoRXHIVmlRwjHJeSRi1ht+1vD9Xu8yY/fnEslCY9
         zF4U6f2sR89wkA6fyIlHH7UJCadwuKHQBzf3o0b7JZQIjPz32Mq69px06m///nRadqLd
         0wJk440FPPxHoyeQ7jjIJietyUAY27rMQppIOwukTNFl2ve/borGMi8XSl5ZW0uddwXD
         npHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731327139; x=1731931939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs+3Bmk7/ET8ZIXxUWywxy47jkhQeABRqUPAmW38Cw0=;
        b=ibAOL5JwhMx5AGss4JDP+GsxVd5LvGRDAmHZAUzULv+UCkNjUHrPqH2rieiRN6Uipb
         vmgDKzSRVDJ2VIrcQa+jlsXrDvNdyui84/CvAfkDF76Ulnw+yKtZ+l1474qjT4ZLgva3
         xK10aWyB4CLP/TQvy+7/f4jebTM0UnFO5J+999oCysvcdkk+ZagEhE0p8zEd/4kuykYT
         9vSHCny3imaas+sOQmNzEu0EJQ70hmuEPa4lk4p9nZ8sDBemGasmJ+RIMcXWjJF0ukpk
         cI0hG98CsLwE1pCFQKk2eevbN5M3tPS+z6mvA8HsmBBpQvRyB+YSJiBU42/HG9Hjsk0b
         cMsQ==
X-Gm-Message-State: AOJu0YxmJ7ufRdNCoa6Ibd0esyAYFmVUVf+LI+aM/jPEKfxDn3yKswWk
	ivKvUBW/3b+piv25yZDe1V7lc36fbA6GDAJzwHDauM0DQw5+dV3qgQo2l/XHVx4=
X-Google-Smtp-Source: AGHT+IFTrCeJsG4pTRHfhvy6GFhZe1enatnsIdLOV+d/7VyKJJXALSMPOSSGn3f7bQZGCXpBbPrFsQ==
X-Received: by 2002:a05:600c:3b8f:b0:431:5f1b:a7c6 with SMTP id 5b1f17b1804b1-432b751f5edmr101593285e9.30.1731327139457;
        Mon, 11 Nov 2024 04:12:19 -0800 (PST)
Received: from localhost (p200300f65f28bb0063ffae39110fa2df.dip0.t-ipconnect.de. [2003:f6:5f28:bb00:63ff:ae39:110f:a2df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97cfefsm12671139f8f.26.2024.11.11.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 04:12:18 -0800 (PST)
Date: Mon, 11 Nov 2024 13:12:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Mircea Caprioru <mircea.caprioru@analog.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibe.com>
Subject: Re: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
Message-ID: <v5ytfwjmimsbfgdq3sb2xg6d2dkllvnv2a7wltwtzt62oqikge@574uazpvjd67>
References: <20241108181813.272593-6-u.kleine-koenig@baylibre.com>
 <bb25249b-62b8-4d7f-9ef3-cb5e1f8674ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fouxnykmbwuimmjy"
Content-Disposition: inline
In-Reply-To: <bb25249b-62b8-4d7f-9ef3-cb5e1f8674ba@stanley.mountain>


--fouxnykmbwuimmjy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
MIME-Version: 1.0

[Dropped Mircea Caprioru from Cc: as the analog.com MTA doesn't know
their address]

Hello Dan,

On Mon, Nov 11, 2024 at 12:15:45PM +0300, Dan Carpenter wrote:
> 4112b30ba58b5c Uwe Kleine-K=F6nig  2024-11-08  871  		if (!ad7124_valid_i=
nput_select(ain[0], st->chip_info) ||
> 4112b30ba58b5c Uwe Kleine-K=F6nig  2024-11-08  872  		    !ad7124_valid_i=
nput_select(ain[1], st->chip_info))
> 4112b30ba58b5c Uwe Kleine-K=F6nig  2024-11-08  873  			return dev_err_pro=
be(dev, ret,
>=20
> s/ret/-EINVAL/?
>=20
> 4112b30ba58b5c Uwe Kleine-K=F6nig  2024-11-08 @874  					     "diff-chann=
els property of %pfwP contains invalid data\n", child);

Indeed. I adapted that in my tree, so will be fixed in v2.

Thanks
Uwe

--fouxnykmbwuimmjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcx9J4ACgkQj4D7WH0S
/k4nJQgAlTnkDayqlntyEewP3+b8xai6S8tWGg4oVXcZG2VRF9hJmUZYIislQRT8
RqFv8/YpMKLVUWklIvFWyCHXhouEd4dwSuJnflIwgTRii4S9yNhhv2l1INDzQqWz
zNKRfRAeJS/FC8Ju9yICppslJNCUnZiAuD1BiknH4u2aiM0M3TDHwDjS3NY08VFI
fX5JmGG/UGw7PFOLc+aiTzkOrhpK0Zevx9k4WDPBP7iUZi9Py/bBYYNW+qPLkTn/
h22Z8nzfFNPrvMlorIh9ETD+ON2GlO/qBmH94/DyLVzcLSnsxNMbxt1RUYXNAavR
CtGw1AmZTRW6Ldpvo/vDMsAwnU7Sfg==
=fCAt
-----END PGP SIGNATURE-----

--fouxnykmbwuimmjy--
