Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5D134CD9;
	Tue, 16 May 2023 14:05:25 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230516140523euoutp01880e227b165b58711da927e9c60fe781~fpL6NxVKn0646306463euoutp016;
	Tue, 16 May 2023 14:05:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230516140523euoutp01880e227b165b58711da927e9c60fe781~fpL6NxVKn0646306463euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1684245924;
	bh=hwioc+0IJaQsFkyBX75REuaVOnOfoTYU8CUadLgLnoE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d+xBVMrf8vbxJ5rrWZ38NAhE+Poqa7Xv34tQHyxUOhEPuSQfvkoropjvoCw4uGlU9
	 gLspSiektCSmDmlcPo8P7bwZoUXe+KqRb7KADiDnBz+8QFwQ+qL4TZKZWHQBnCgfiQ
	 rrFtq2ZF67CXvgWQ+fzQtJ7H08BjhorMbPMkkkzA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230516140523eucas1p2cb7d54fa90a657c851710c34ea0b69d5~fpL6AnZgf2720027200eucas1p25;
	Tue, 16 May 2023 14:05:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id C2.A6.35386.3AD83646; Tue, 16
	May 2023 15:05:23 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230516140523eucas1p2482f5965928b5c4feaa8b5ec2474b811~fpL5smOiU2719927199eucas1p2G;
	Tue, 16 May 2023 14:05:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230516140523eusmtrp271d16857eb3918ee5d9d095d78989720~fpL5sChiI1958119581eusmtrp2R;
	Tue, 16 May 2023 14:05:23 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-8f-64638da37aca
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 98.64.10549.3AD83646; Tue, 16
	May 2023 15:05:23 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230516140523eusmtip12f7acb8485d0a89a681ef926ad473526~fpL5fI1qz0901409014eusmtip1c;
	Tue, 16 May 2023 14:05:23 +0000 (GMT)
Received: from localhost (106.210.248.56) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Tue, 16 May 2023 15:05:22 +0100
Date: Tue, 16 May 2023 16:05:20 +0200
From: Joel Granados <j.granados@samsung.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [joelgranados:jag/sysctl-testing-for-0day 2/6]
 drivers/parport/procfs.c:502 parport_proc_register() warn: possible memory
 leak of 't'
Message-ID: <20230516140520.cjlqqfhgrkk37pyg@localhost>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="dwrl7cx3nwmdbwv6"
Content-Disposition: inline
In-Reply-To: <98df279e-4558-40e7-ab96-0ab45ba5a16f@kili.mountain>
X-Originating-IP: [106.210.248.56]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87qLe5NTDC6t07L4MK+V3eJV8yM2
	i0MrrzBZNKw7y+7A4rF4z0smjzvX9rB5vNg8kzGAOYrLJiU1J7MstUjfLoErY3/3KaaCr2IV
	H9+2MjUwfhbqYuTkkBAwkbjS2cHWxcjFISSwglFizomlrBDOF0aJWX1noDKfGSUuNt9lhWl5
	deocVNVyRokZyy+yw1Ud2LACytnCKLFtzVOwFhYBVYmW7k1MIDabgI7E+Td3mEFsESD739/J
	LCA2s0CwRMvOfWBjhQWmMUosmdMG1sArYC6x5fRHVghbUOLkzCdQDRUSp67OAarhALKlJZb/
	4wAJcwo4SqxZc5AN4lQlifaJD6DOrpU4teUWE8h8CYE3HBLLJ7dCJVwkLlxdxgxhC0u8Or6F
	HcKWkfi/cz5Uw2RGif3/PrBDOKsZJZY1fmWCqLKWaLnyBKrDUaJn80U2kIskBPgkbrwVhDiU
	T2LStunMEGFeiY42aNCrSay+94ZlAqPyLCSvzULy2iyE1yDCOhILdn9iwxDWlli28DUzhG0r
	sW7de5YFjOyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAhPU6X/Hv+xgXP7qo94hRiYO
	xkOMKkDNjzasvsAoxZKXn5eqJMLbPjM+RYg3JbGyKrUoP76oNCe1+BCjNAeLkjivtu3JZCGB
	9MSS1OzU1ILUIpgsEwenVAOTKLfMfw4BSUHFk34x2tdjRHK+mP47peOlu/psc8n19bwbuWIm
	3V0fnyM0P0H00HY+MZWPXLtfWkSfs/MSVrsyMYBLx0uEU/EBd8Jxxtr9XKqx6Yefuz7btWRe
	sXKzrvfXvIwb4emquVdLzx41nH5S99EDptcv3opmzbF99e2F7wJHxZ0WKxft6BTg28K5+63q
	zNBTNw+f89NeJfev7s2Zrq6MeUUH39VpFm1qbpu5968H64Pp895/+b1WIVT2f9r7pYIyG2LK
	/KKrfztcWXpH+FqV0kPh0ho+47DQd4H8O1vE1NyvTG6M1apjOxElXHgnpG0Oe8eyFNPPV4qs
	/Pw95i6REF0wWZLDaef6EF0lluKMREMt5qLiRAAeWelhywMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsVy+t/xu7qLe5NTDI5sFrL4MK+V3eJV8yM2
	i0MrrzBZNKw7y+7A4rF4z0smjzvX9rB5vNg8kzGAOUrPpii/tCRVISO/uMRWKdrQwkjP0NJC
	z8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv493yiSwFn8UqOlfvZWtg/CjUxcjJISFgIvHq
	1DnWLkYuDiGBpYwSP45tYIFIyEhs/HKVFcIWlvhzrYsNougjo8SHRROhOrYwSuw99xasikVA
	VaKlexMTiM0moCNx/s0dZhBbBMj+93cy2FRmgWCJlp37wJqFBaYxSiyZ0wbWwCtgLrHl9Eeo
	qT8ZJRqb/7BCJAQlTs58AtVdJvHoxXSgOziAbGmJ5f84QMKcAo4Sa9YcZIM4VUmifeIDqLNr
	JT7/fcY4gVF4FpJJs5BMmoUwCSKsJXHj30smDGFtiWULXzND2LYS69a9Z1nAyL6KUSS1tDg3
	PbfYUK84Mbe4NC9dLzk/dxMjMEq3Hfu5eQfjvFcf9Q4xMnEwHmJUAep8tGH1BUYplrz8vFQl
	Ed72mfEpQrwpiZVVqUX58UWlOanFhxhNgcE4kVlKNDkfmD7ySuINzQxMDU3MLA1MLc2MlcR5
	PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYzK9fuTe7/a7tD2vG3Dc63m0m/zcIMH33Zr3U3yOx
	aLFG1SaObzITM0UmZ18KC9RJvaFTxd6wqo3/9/OJj1OTE76YRl6TOLe9vEtD5cmNayGe4XdS
	tLcpCZs3KQSys28+kP3/eqLz5fA7D8v2zzz/9pnbySq9Wf+FXQ6eNNsV4/N9fuyDhwqJK7tX
	iU3Zy/zrW/YpQcf9My7OZKmIb+s7Ucp8npUpbXumm8zbn/Uvzaf/dd0Q0/x04hs1/+im9K7F
	76zD3/BH+0937V46b/Wi6/8D8i4uXfxcPForK/XmxpqrB7ydFb2F1a+xzr0jHMzqMr/eNkz9
	f6L4p/KOtGM1Fbsrd/54/O7H7Yo//+eoKbEUZyQaajEXFScCAAqKXLVnAwAA
X-CMS-MailID: 20230516140523eucas1p2482f5965928b5c4feaa8b5ec2474b811
X-Msg-Generator: CA
X-RootMTR: 20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb
References: <CGME20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb@eucas1p1.samsung.com>
	<819e68aa-8c11-4f4d-9dcb-d20ef136fe0f@kili.mountain>
	<20230515185917.sdxy2mszhmjyngn3@localhost>
	<98df279e-4558-40e7-ab96-0ab45ba5a16f@kili.mountain>

--dwrl7cx3nwmdbwv6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 10:05:54AM +0300, Dan Carpenter wrote:
> On Mon, May 15, 2023 at 08:59:17PM +0200, Joel Granados wrote:
> > On Mon, May 15, 2023 at 10:34:44AM +0300, Dan Carpenter wrote:
> > > 3756e44223c286 Joel Granados        2023-05-12  504  	if (register_sy=
sctl(tmp_dir_path, t->device_dir) =3D=3D NULL)
> > > 3756e44223c286 Joel Granados        2023-05-12  505  		/*
> > > 3756e44223c286 Joel Granados        2023-05-12  506  		 * We keep the=
 original behavior of parport where failure to register
> > > 3756e44223c286 Joel Granados        2023-05-12  507  		 * does not re=
turn error.
> > > 3756e44223c286 Joel Granados        2023-05-12  508  		 */
> > > 3756e44223c286 Joel Granados        2023-05-12 @509  		goto  exit_fre=
e_tmp_dir_path;
> > >=20
> > > Smatch wants a error code for this error path.
> > >=20
> > > The comments say that we are doing the wrong thing deliberately to
> > > maintain backwards compatibility and avoid breaking stuff.  Fortunate=
ly,
> > > (LOL), no one is checking the returns from parport_proc_register() so=
 we
> > > are free to return a correct error code without any worry about break=
age.
> > Sigh. Indeed, the only place were this function is called is from
> > parport/share.c. Should we just change the function return value to
> > void?
>=20
> I feel like we should return errors and not check for them.
>=20
> Hopefully, some day in the future someone will be able to test this code
> and add checks.  (This seems more optimistic than realistic).
looked at this a bit more and saw that all the callers to
parport_announce_port (which is the only function that calls
parport_proc_register) have a concept of an erroneous flow.
In practice it would "just" be a matter of going throuh all these calls
and making parport_announce_port set the appropriate error handle and
return on error.

Hopefully someday, someone will push this :).

>=20
> regards,
> dan carpenter
>=20

--=20

Joel Granados

--dwrl7cx3nwmdbwv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmRjjZ4ACgkQupfNUreW
QU+JmwwAiZwoQ/ev+3c60IOGHe0+NMG9azSYa6lSqiN0V2K45/L2ovbwF4ecpSW0
gYgsgI5K6tn8xupHvT7muiXytQAVca1Rs5nKfp5YLhWnygUGfaVx2iMOUd/tBB6f
AaPzVwsZ7nWg/vk64hgdNY4RcOx1s7meSn4hMeNdal8cnkbWxFRSpVhUC3enB9MS
HgiYdFHW7TgqTc20CnbsyEiIjqK6dMZG6f3PDPW8vJZWeiiqCR8Q5VD6Kzk/9suA
Kx3lriGHI/NNOAGoBBL7Q6YF127zPODm/UmEnU/Q8DKspYJWJRtddSxeC2LTyEDd
hBTfcHSErAbrAj6d39H1QQTpaL3detJSz8gcmhhS6gmn/zMxz3mBV4/kOGf5WBDk
voz0+fxDNhzpctmegjwHLYz5MUj/Dvy0U8q2/npw95N0GBAmiKIcLo0tbDs8t64t
Nsl+Sba8JieCVMc14onQj0aj0uWo2p95fAfl1aUHNEyBpjbufwSdgeuSJxl0JsfO
envqIpdn
=Qz/6
-----END PGP SIGNATURE-----

--dwrl7cx3nwmdbwv6--
