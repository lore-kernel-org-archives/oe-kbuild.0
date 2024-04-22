Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C607451C5A
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713770673; cv=none; b=SfmTc9ITXfUkTy95mAqzzc7Rwr5ZAfNmsJhf5t3EkKw/l29LHHIewId7NBO/mpavlzJ8sOMn2bO6k5POKF5ZARCdNd6HYWgMm2hDTAi6PlYtSalLs58Cryjysb0PJS34B7y/NAidWC+9/vB41Qk+SZsSqh2d4raiPdhF7pjzxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713770673; c=relaxed/simple;
	bh=TkqvuSCt4NWn9GS3akdH4eF7IeJm1l46MRc82GwAcEw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=puUgLl5uQZSC/yum7/2/7S1//67Mq0j59S77J+M9SOiXFiS8vK2Zcz5Cl5CXfcyX3bQkXarABuFE9mFxeeVVZQn6JIiBP4nmNWzgMrSKjft2nEigbc6R8SppD5EiMP0IyYF0TBYeExIyiMuJl3lV02M2CSNfmksNMA+Cl2hUrd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5sup1C1; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5sup1C1"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2dd041acff1so21798951fa.1
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713770670; x=1714375470; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sQQOf7pllImT8aRJ8SMb8lplRwgGzFI3GfrInxi2+qY=;
        b=C5sup1C1ZHTf6ahe8ibdrQl1lhFavYWqTCumRfzipcsAis4k2QeUN6JDloK071HitN
         5+DGFIduMBtrevPNHIfLN4vciqKyJg2O5RoJuzKb1gUBBjHMYybAk4Jg2w2wSFW1ZIta
         pe6dNX9loU4I3KSGI3HcFv50Tjjkem22pryHPkL9VbcYK7JyJdSQ4gOnnIKJf5ZHnMnM
         TWQo0ukH34kVfx/z8XtMLRCBh927U3uQQdQxlGG5wm+aD6CD8ojuBp3ip+PJ94yDp1W9
         y/YKHZZGom9nutad+LCrxAyoXGVGxBu30LhEn5SDkbLFXE8927qlxrWGLIWK9p06C/1M
         PekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713770670; x=1714375470;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQQOf7pllImT8aRJ8SMb8lplRwgGzFI3GfrInxi2+qY=;
        b=EgkAEf9yKRo+W5l8ftNv/FObe96+N+mM2LV4pExihyxEXdUqzhglT1JB8YLkG42hw6
         CR1m/5DVXHGrpB/RomlWZLaD2oehTubdmw73GX1MZ9IZuROUTJojw5+VCPf36CrLeiFz
         wxopWFZAa5lCvjQt1IFqqOyBbzqMuh3ByEKyE5nHqNpuPi9OxNAMXZNkwNGkKaB2k+X/
         iDrUwivf/yWROPFXKBoqpQ9f2Va40WlqNFEEyGH/kQu1rR6NH6yPXZlEi4p2pPVLEyy7
         jcdAHca3xyKBpGOIH42f5dQkhwKrCrk847/fxEKg3XO83CRmYBXt1N+caAwlFSTr6O4E
         +SAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzIkByc23XgD6hyTyNjRGtgjhtdFAeKRuiXruc1rS6N8CoPQfNH64id1wacQNdYhf99cWKHMFA8qguHB9FId8HeVkhOP9Ig2Cb
X-Gm-Message-State: AOJu0Yy4poP6b0b6NHEapSWKg2m8vY/6KHABVUe8qvMKQRtl3Vjqs354
	O5D8LRktMAhBGVMg6AeoznfeLdFJ98gkyZ38JoVXfx396DHw4esL
X-Google-Smtp-Source: AGHT+IHlwGe3SKk1P+sZWlC+R69KH0lebKzGCuoC8Xit3Dimv6CiHAjDold+3kJE2JqmvsHKdyHtyQ==
X-Received: by 2002:a2e:8305:0:b0:2db:77c7:c4aa with SMTP id a5-20020a2e8305000000b002db77c7c4aamr5144291ljh.41.1713770669575;
        Mon, 22 Apr 2024 00:24:29 -0700 (PDT)
Received: from ?IPv6:2001:a61:3481:2201:6106:96db:d27b:d2c2? ([2001:a61:3481:2201:6106:96db:d27b:d2c2])
        by smtp.gmail.com with ESMTPSA id bg40-20020a05600c3ca800b0041624ddff48sm19517586wmb.28.2024.04.22.00.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:24:29 -0700 (PDT)
Message-ID: <d0b732b7490d18cc0751a0dee78c0f34678d4699.camel@gmail.com>
Subject: Re: [PATCH 8/8] iio: adc: ad9467: support digital interface
 calibration
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Apr 2024 09:24:28 +0200
In-Reply-To: <202404201240.EYJwoHKf-lkp@intel.com>
References: <202404201240.EYJwoHKf-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2024-04-20 at 12:32 +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
> References: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
> TO: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
> TO: linux-iio@vger.kernel.org
> TO: devicetree@vger.kernel.org
> CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> CC: Alexandru Ardelean <alexandru.ardelean@analog.com>
> CC: "Lars-Peter Clausen" <lars@metafoo.de>
> CC: Michael Hennerich <Michael.Hennerich@analog.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Olivier Moysan <olivier.moysan@foss.st.com>
> CC: Nuno Sa <nuno.sa@analog.com>
>=20
> Hi Nuno,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f]
>=20
> url:=C2=A0=C2=A0=C2=A0
> https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/iio-b=
ackend-add-API-for-interface-tuning/20240419-233948
> base:=C2=A0=C2=A0 62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f
> patch link:=C2=A0=C2=A0=C2=A0
> https://lore.kernel.org/r/20240419-ad9467-new-features-v1-8-3e7628ff6d5e%=
40analog.com
> patch subject: [PATCH 8/8] iio: adc: ad9467: support digital interface ca=
libration
> :::::: branch date: 13 hours ago
> :::::: commit date: 13 hours ago
> config: csky-randconfig-r081-20240420
> (https://download.01.org/0day-ci/archive/20240420/202404201240.EYJwoHKf-l=
kp@intel.c
> om/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202404201240.EYJwoHKf-lkp@intel.com/
>=20
> smatch warnings:
> drivers/iio/adc/ad9467.c:587 ad9467_calibrate() error: uninitialized symb=
ol
> 'inv_val'.
>=20

It may still be too early for me but I think this is a false positive...
'inv_cnt' which is initialized should control if we access 'inv_val' or not

- Nuno S=C3=A1

> vim +/inv_val +587 drivers/iio/adc/ad9467.c
>=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 523=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 524=C2=A0 static int ad9467_cali=
brate(const struct
> ad9467_state *st)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 525=C2=A0 {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 526=C2=A0=C2=A0	DECLARE_BITMAP(e=
rr_map,
> AD9647_MAX_TEST_POINTS * 2);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 527=C2=A0=C2=A0	unsigned int poi=
nt, val, inv_val,
> cnt, inv_cnt =3D 0;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 528=C2=A0=C2=A0	/*
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 529=C2=A0=C2=A0	 * Half of the b=
itmap is for the
> inverted signal. The number of test
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 530=C2=A0=C2=A0	 * points is the=
 same though...
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 531=C2=A0=C2=A0	 */
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 532=C2=A0=C2=A0	unsigned int tes=
t_points =3D
> AD9647_MAX_TEST_POINTS;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 533=C2=A0=C2=A0	unsigned long sa=
mple_rate =3D
> clk_get_rate(st->clk);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 534=C2=A0=C2=A0	struct device *d=
ev =3D &st->spi-
> >dev;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 535=C2=A0=C2=A0	bool invert =3D =
false, stat;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 536=C2=A0=C2=A0	int ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 537=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 538=C2=A0=C2=A0	ret =3D
> ad9647_calibrate_prepare(st);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 539=C2=A0=C2=A0	if (ret)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 540=C2=A0=C2=A0		return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 541=C2=A0 retune:
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 542=C2=A0=C2=A0	ret =3D
> ad9647_calibrate_polarity_set(st, invert);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 543=C2=A0=C2=A0	if (ret)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 544=C2=A0=C2=A0		return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 545=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 546=C2=A0=C2=A0	for (point =3D 0=
; point <
> test_points; point++) {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 547=C2=A0=C2=A0		ret =3D
> ad9467_calibrate_apply(st, point);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 548=C2=A0=C2=A0		if (ret)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 549=C2=A0=C2=A0			return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 550=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 551=C2=A0=C2=A0		ret =3D
> ad9467_calibrate_status_check(st, &stat);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 552=C2=A0=C2=A0		if (ret < 0)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 553=C2=A0=C2=A0			return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 554=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 555=C2=A0=C2=A0		__assign_bit(po=
int +
> invert * test_points, err_map, stat);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 556=C2=A0=C2=A0	}
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 557=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 558=C2=A0=C2=A0	if (!invert) {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 559=C2=A0=C2=A0		cnt =3D
> ad9467_find_optimal_point(err_map, 0, test_points, &val);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 560=C2=A0=C2=A0		/*
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 561=C2=A0=C2=A0		 * We're happy =
if we find,
> at least, three good test points in
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 562=C2=A0=C2=A0		 * a row.
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 563=C2=A0=C2=A0		 */
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 564=C2=A0=C2=A0		if (cnt < 3) {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 565=C2=A0=C2=A0			invert =3D tru=
e;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 566=C2=A0=C2=A0			goto retune;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 567=C2=A0=C2=A0		}
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 568=C2=A0=C2=A0	} else {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 569=C2=A0=C2=A0		inv_cnt =3D
> ad9467_find_optimal_point(err_map, test_points,
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0
> 570=C2=A0=C2=A0						=C2=A0=C2=A0=C2=A0 test_points, &inv_val);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 571=C2=A0=C2=A0		if (!inv_cnt &&=
 !cnt)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 572=C2=A0=C2=A0			return -EIO;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 573=C2=A0=C2=A0	}
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 574=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 575=C2=A0=C2=A0	ad9467_dump_tabl=
e(err_map,
> BITS_PER_TYPE(err_map), invert);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 576=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 577=C2=A0=C2=A0	if (inv_cnt < cn=
t) {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 578=C2=A0=C2=A0		ret =3D
> ad9647_calibrate_polarity_set(st, false);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 579=C2=A0=C2=A0		if (ret)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 580=C2=A0=C2=A0			return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 581=C2=A0=C2=A0	} else {
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 582=C2=A0=C2=A0		/*
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 583=C2=A0=C2=A0		 * polarity inv=
erted is
> the last test to run. Hence, there's no
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 584=C2=A0=C2=A0		 * need to re-d=
o any
> configuration. We just need to "normalize"
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 585=C2=A0=C2=A0		 * the selected=
 value.
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 586=C2=A0=C2=A0		 */
> 65ac942f507d901 Nuno Sa 2024-04-19 @587=C2=A0=C2=A0		val =3D inv_val -
> test_points;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 588=C2=A0=C2=A0	}
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 589=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 590=C2=A0=C2=A0	if (st->info->ha=
s_dco)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 591=C2=A0=C2=A0		dev_dbg(dev, "%=
sDCO 0x%X
> CLK %lu Hz\n", inv_cnt >=3D cnt ? "INVERT " : "",
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 592=C2=A0=C2=A0			val, sample_ra=
te);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 593=C2=A0=C2=A0	else
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 594=C2=A0=C2=A0		dev_dbg(dev, "%=
sIDELAY
> 0x%x\n", inv_cnt >=3D cnt ? "INVERT " : "",
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 595=C2=A0=C2=A0			val);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 596=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 597=C2=A0=C2=A0	ret =3D ad9467_c=
alibrate_apply(st,
> val);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 598=C2=A0=C2=A0	if (ret)
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 599=C2=A0=C2=A0		return ret;
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 600=C2=A0=20
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 601=C2=A0=C2=A0	/* finally apply=
 the optimal value
> */
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 602=C2=A0=C2=A0	return ad9647_ca=
librate_stop(st);
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 603=C2=A0 }
> 65ac942f507d901 Nuno Sa 2024-04-19=C2=A0 604=C2=A0=20
>=20

