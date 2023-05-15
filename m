Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED3FBF9;
	Mon, 15 May 2023 19:32:11 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230515192630euoutp01a04fecefb538070cd11ff62d4d9f8546~fZ6-Y8oUt2183821838euoutp01F;
	Mon, 15 May 2023 19:26:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230515192630euoutp01a04fecefb538070cd11ff62d4d9f8546~fZ6-Y8oUt2183821838euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1684178790;
	bh=Yc6f0hkRCZoTsGuapL9slh5ae1Qi04Bc68xs58Hxynk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=px0HCW5erPZtZYElq2fYjbCQqqjFUZ+GSs0xON9yYBpf+1ASOv88c0PTmH/SNykbv
	 QJjyHdddLXJaOdu3rSzzRU+KcqnNdeBMo7Kb1er5K1fGAV/3rjVZ0tWnJjUEKRlKcS
	 Mn8VivFOs631Vb+wFPfzfnT6j6I++kb1tabV8wM8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230515192630eucas1p14623674cc425da4f54d4a4f72b0be07a~fZ6_6V93D2159021590eucas1p15;
	Mon, 15 May 2023 19:26:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 12.CD.35386.56782646; Mon, 15
	May 2023 20:26:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230515192628eucas1p1a72320372a9ab3e259afb842415920cc~fZ69ynbXv1738117381eucas1p1E;
	Mon, 15 May 2023 19:26:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230515192628eusmtrp1475d5fb8ff7d4e740932b3369b448c2e~fZ69x61mm2672826728eusmtrp1U;
	Mon, 15 May 2023 19:26:28 +0000 (GMT)
X-AuditID: cbfec7f4-cc9ff70000028a3a-d6-646287651020
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 24.0A.14344.46782646; Mon, 15
	May 2023 20:26:28 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230515192628eusmtip113d6ffaf856544e2c3be4d09ecba227c~fZ69lBfRZ2128121281eusmtip1N;
	Mon, 15 May 2023 19:26:28 +0000 (GMT)
Received: from localhost (106.210.248.56) by CAMSVWEXC02.scsc.local
	(2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
	Mon, 15 May 2023 20:26:28 +0100
Date: Mon, 15 May 2023 20:59:17 +0200
From: Joel Granados <j.granados@samsung.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: <oe-kbuild@lists.linux.dev>, <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [joelgranados:jag/sysctl-testing-for-0day 2/6]
 drivers/parport/procfs.c:502 parport_proc_register() warn: possible memory
 leak of 't'
Message-ID: <20230515185917.sdxy2mszhmjyngn3@localhost>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="oz5tb6pbesseypmr"
Content-Disposition: inline
In-Reply-To: <819e68aa-8c11-4f4d-9dcb-d20ef136fe0f@kili.mountain>
X-Originating-IP: [106.210.248.56]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djPc7pp7UkpBvNfMVp8mNfKbvGq+RGb
	xaGVV5gsGtadZXdg8Vi85yWTx51re9g8XmyeyRjAHMVlk5Kak1mWWqRvl8CVcflJE3PBM5eK
	PX+usjQwfjDrYuTgkBAwkbi73rOLkYtDSGAFo8SiVc/ZIZwvjBJzjnWyQDifGSVurr7G1MXI
	CdZxc/1hNojEckaJF61/GeGqPrYvYgOpEhLYwigx4Z84iM0ioCoxr62HHcRmE9CROP/mDjOI
	LQJk//s7mQXEZhYIlmjZuY8VZJCwwDRGiSVz2phADuQVMJeY0ecFUsMrIChxcuYTqPoKiVVL
	HjGClDALSEss/8cBEuYUcJT4ur+TBeJQJYn2iQ9YIexaiVNbbjGBjJcQ+MAhsfDsemaIhIvE
	v9P3oIqEJV4d38IOYctInJ7cwwLRMJlRYv+/D+wQzmpGiWWNX6FhYS3RcuUJVIejRM/mi2yQ
	UOWTuPFWEOJQPolJ26YzQ4R5JTrahCCq1SRW33vDMoFReRaS12YheW0WwmsQYR2JBbs/sWEI
	a0ssW/iaGcK2lVi37j3LAkb2VYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIGp6fS/4192
	MC5/9VHvECMTB+MhRhWg5kcbVl9glGLJy89LVRLhbZ8ZnyLEm5JYWZValB9fVJqTWnyIUZqD
	RUmcV9v2ZLKQQHpiSWp2ampBahFMlomDU6qBSVbg8JN5k4X9P9w/USZZev2JUeieFeka8y9H
	hAqaHN89RTrvF4PCo9/xbv4q237xZvM6t299FSLz6f9PPWuzra/C7ub0z+xnXier9mKXg+27
	qZJ31iV8Ta09H67bGCYQuv7PpIzcyApjTYcNCh2N9q4Oh7y4+15cil7vrsLq9tlv4jFR3b8c
	Mx6JM4vrFNh8YzcO+y4g/VbXVfJcyfoMv87FiddVIn7zffu0c4/94+DVHam2vtnetT7rj5/z
	PDj92J+1q5gmP06Of/lmgsHugs3yWhE2hnHl09VXFD+7saYtXH2vucki2UsCexmnJO99G7qf
	Z7NC1KxlWcErZ7qlH/0UL5rW8UvJMqAhPN1BiaU4I9FQi7moOBEAWZQHosgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRmVeSWpSXmKPExsVy+t/xu7op7UkpBqtf61t8mNfKbvGq+RGb
	xaGVV5gsGtadZXdg8Vi85yWTx51re9g8XmyeyRjAHKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmh
	Z2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXcXj2P+aCJy4VsyecZmxgfGfWxcjJISFgInFz
	/WG2LkYuDiGBpYwSC9e9YYFIyEhs/HKVFcIWlvhzrQuq6COjRPvStawQzhZGid279zCCVLEI
	qErMa+thB7HZBHQkzr+5wwxiiwDZ//5OBpvKLBAs0bJzH1izsMA0Roklc9qYuhg5OHgFzCVm
	9HlBDJ0CNHTPfLAGXgFBiZMzn0A1l0n8XfSfDaSeWUBaYvk/DpAwp4CjxNf9nVBXK0m0T3wA
	dXWtxOe/zxgnMArPQjJpFpJJsxAmQYS1JG78e8mEIawtsWzha2YI21Zi3br3LAsY2VcxiqSW
	Fuem5xYb6RUn5haX5qXrJefnbmIExui2Yz+37GBc+eqj3iFGJg7GQ4wqQJ2PNqy+wCjFkpef
	l6okwts+Mz5FiDclsbIqtSg/vqg0J7X4EKMpMBQnMkuJJucDk0deSbyhmYGpoYmZpYGppZmx
	kjivZ0FHopBAemJJanZqakFqEUwfEwenVANT3ccu6/rLKw6kPgz4lVAWPUk6j5VnwsxnP2cb
	CE1lLn1ZF2D7ffGcLcU2B/NNz58R4RRK6Kh6rT39rPz22Xx187UDzXY/ytp1fvtC28j2DX8j
	E8SkWXLWM4lWGLL8ckqMPP/C+IzLvJqTpXdWlTNJcrE/qsjat/n8D7PTMuX/bm2VPGEu1fTX
	OdHQJlHThmc+f6eOJKOchmjXyn85yvOvTG1/31adb2cbLrnBNFjpUFtt8coPOwSzL76p9dPf
	aVESICw5ceo02401DVdyWJ+EHPhS4P/l++moDfNePjWez1WQxPN61Rxlw2o31TttOZxFXzQe
	3Pn0pDxJ06L576Q9VfOzs743dMVPtX+ltEiJpTgj0VCLuag4EQAw16eWZgMAAA==
X-CMS-MailID: 20230515192628eucas1p1a72320372a9ab3e259afb842415920cc
X-Msg-Generator: CA
X-RootMTR: 20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb
References: <CGME20230515073454eucas1p13d3f249160454d835f3cefce3fa7a0eb@eucas1p1.samsung.com>
	<819e68aa-8c11-4f4d-9dcb-d20ef136fe0f@kili.mountain>

--oz5tb6pbesseypmr
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 10:34:44AM +0300, Dan Carpenter wrote:
> tree:   https://protect2.fireeye.com/v1/url?k=3D77a81f96-28332689-77a994d=
9-000babdfecba-20da5463c1bf339f&q=3D1&e=3D47a4ce4b-b7ad-4d3e-ba9e-cfb53e82e=
0b3&u=3Dhttps%3A%2F%2Fgithub.com%2FJoelgranados%2Flinux.git jag/sysctl-test=
ing-for-0day
> head:   947f41127456cd102688bcddc3002d03111668c1
> commit: 3756e44223c2862f95de9d4280b44987e0b3aafc [2/6] parport: Remove re=
gister_sysctl_table from parport_proc_register
> config: x86_64-randconfig-m001
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202305150948.pHgIh7Ql-lkp@intel.com/
>=20
> smatch warnings:
> drivers/parport/procfs.c:502 parport_proc_register() warn: possible memor=
y leak of 't'
> drivers/parport/procfs.c:509 parport_proc_register() warn: missing error =
code 'err'
>=20
> vim +/t +502 drivers/parport/procfs.c
>=20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  468  int parport_proc_reg=
ister(struct parport *port)
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  469  {
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  470  	struct parport_sysc=
tl_table *t;
> 3756e44223c286 Joel Granados        2023-05-12  471  	char *tmp_dir_path;
> 3756e44223c286 Joel Granados        2023-05-12  472  	size_t tmp_path_len=
, port_name_len;
> 3756e44223c286 Joel Granados        2023-05-12  473  	int i, err =3D 0;
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  474 =20
> 2451a84839187c Silviu-Mihai Popescu 2013-03-11  475  	t =3D kmemdup(&parp=
ort_sysctl_template, sizeof(*t), GFP_KERNEL);
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  476  	if (t =3D=3D NULL)
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  477  		return -ENOMEM;
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  478 =20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  479  	t->device_dir[0].ex=
tra1 =3D port;
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  480 =20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  481  	t->vars[0].data =3D=
 &port->spintime;
> 3756e44223c286 Joel Granados        2023-05-12  482  	for (i =3D 0; i < 5=
; i++) {
> 3756e44223c286 Joel Granados        2023-05-12  483  		t->vars[i].extra1 =
=3D port;
> 3756e44223c286 Joel Granados        2023-05-12  484  		t->vars[5 + i].ext=
ra2 =3D &port->probe_info[i];
> 3756e44223c286 Joel Granados        2023-05-12  485  	}
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  486 =20
> 3756e44223c286 Joel Granados        2023-05-12  487  	port_name_len =3D s=
trnlen(port->name, PARPORT_NAME_MAX_LEN);
> 3756e44223c286 Joel Granados        2023-05-12  488  	/*
> 3756e44223c286 Joel Granados        2023-05-12  489  	 * Allocate a buffe=
r for two paths: dev/parport/PORT and dev/parport/PORT/devices.
> 3756e44223c286 Joel Granados        2023-05-12  490  	 * We calculate for=
 the second as that will give us enough for the first.
> 3756e44223c286 Joel Granados        2023-05-12  491  	 */
> 3756e44223c286 Joel Granados        2023-05-12  492  	tmp_path_len =3D PA=
RPORT_BASE_DEVICES_PATH_SIZE + port_name_len;
> 3756e44223c286 Joel Granados        2023-05-12  493  	tmp_dir_path =3D km=
alloc(tmp_path_len, GFP_KERNEL);
> 3756e44223c286 Joel Granados        2023-05-12  494  	if (!tmp_dir_path) {
> 3756e44223c286 Joel Granados        2023-05-12  495  		err =3D -ENOMEM;
> 3756e44223c286 Joel Granados        2023-05-12  496  		goto exit_free_t;
> 3756e44223c286 Joel Granados        2023-05-12  497  	}
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  498 =20
> 3756e44223c286 Joel Granados        2023-05-12  499  	if (tmp_path_len
> 3756e44223c286 Joel Granados        2023-05-12  500  	    <=3D snprintf(t=
mp_dir_path, tmp_path_len, "dev/parport/%s/devices", port->name)) {
> 3756e44223c286 Joel Granados        2023-05-12  501  		kfree(tmp_dir_path=
);
> 3756e44223c286 Joel Granados        2023-05-12 @502  		return -ENOENT;
>=20
> Should be goto exit_free_t;
oops. my bad. that should have been goto exit_free_t

>=20
> 3756e44223c286 Joel Granados        2023-05-12  503  	}
> 3756e44223c286 Joel Granados        2023-05-12  504  	if (register_sysctl=
(tmp_dir_path, t->device_dir) =3D=3D NULL)
> 3756e44223c286 Joel Granados        2023-05-12  505  		/*
> 3756e44223c286 Joel Granados        2023-05-12  506  		 * We keep the ori=
ginal behavior of parport where failure to register
> 3756e44223c286 Joel Granados        2023-05-12  507  		 * does not return=
 error.
> 3756e44223c286 Joel Granados        2023-05-12  508  		 */
> 3756e44223c286 Joel Granados        2023-05-12 @509  		goto  exit_free_tm=
p_dir_path;
>=20
> Smatch wants a error code for this error path.
>=20
> The comments say that we are doing the wrong thing deliberately to
> maintain backwards compatibility and avoid breaking stuff.  Fortunately,
> (LOL), no one is checking the returns from parport_proc_register() so we
> are free to return a correct error code without any worry about breakage.
Sigh. Indeed, the only place were this function is called is from
parport/share.c. Should we just change the function return value to
void?

>=20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  510 =20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  511 =20
> 3756e44223c286 Joel Granados        2023-05-12  512  	tmp_path_len =3D PA=
RPORT_BASE_PATH_SIZE + port_name_len;
> 3756e44223c286 Joel Granados        2023-05-12  513  	if (tmp_path_len
> 3756e44223c286 Joel Granados        2023-05-12  514  	   <=3D snprintf(tm=
p_dir_path, tmp_path_len, "dev/parport/%s", port->name)) {
> 3756e44223c286 Joel Granados        2023-05-12  515  		err =3D -ENOENT;
> 3756e44223c286 Joel Granados        2023-05-12  516  		goto exit_free_tmp=
_dir_path;
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  517  	}
> 3756e44223c286 Joel Granados        2023-05-12  518 =20
> 3756e44223c286 Joel Granados        2023-05-12  519  	t->sysctl_header =
=3D register_sysctl(tmp_dir_path, t->vars);
> 3756e44223c286 Joel Granados        2023-05-12  520  	if (t->sysctl_heade=
r =3D=3D NULL)
> 3756e44223c286 Joel Granados        2023-05-12  521  		goto exit_free_tmp=
_dir_path;
>=20
> Same here.  Return an error code.
Ack

>=20
> 3756e44223c286 Joel Granados        2023-05-12  522 =20
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  523  	port->sysctl_table =
=3D t;
> 3756e44223c286 Joel Granados        2023-05-12  524 =20
> 3756e44223c286 Joel Granados        2023-05-12  525  	kfree(tmp_dir_path);
> ^1da177e4c3f41 Linus Torvalds       2005-04-16  526  	return 0;
> 3756e44223c286 Joel Granados        2023-05-12  527 =20
> 3756e44223c286 Joel Granados        2023-05-12  528  exit_free_tmp_dir_pa=
th:
> 3756e44223c286 Joel Granados        2023-05-12  529  	kfree(tmp_dir_path);
> 3756e44223c286 Joel Granados        2023-05-12  530  exit_free_t:
> 3756e44223c286 Joel Granados        2023-05-12  531  	kfree(t);
> 3756e44223c286 Joel Granados        2023-05-12  532  	t =3D NULL;
>=20
> t is a local variable.  No point in setting it to NULL.  (This was
> copied from the original code, I know, but since you're re-writing stuff
> you may as well delete the nonsense bits).
I was also wondering why it was like this. Will be changed in V2.

>=20
> 3756e44223c286 Joel Granados        2023-05-12  533  	return err;
> 3756e44223c286 Joel Granados        2023-05-12  534 =20
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://protect2.fireeye.com/v1/url?k=3D7917a300-268c9a1f-7916284f-000bab=
dfecba-d19874df90955c77&q=3D1&e=3D47a4ce4b-b7ad-4d3e-ba9e-cfb53e82e0b3&u=3D=
https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests

--=20

Joel Granados

--oz5tb6pbesseypmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmRigPoACgkQupfNUreW
QU8dOQv/VlHt069vyf1NTjbXSbj1TrWwf/2zsTE9oWUFTVxQ2o+79mp3fhj1LhOw
wz1eyt3vUQBnztH1Tlsmm3+zQ8MktmKPe+WKecRKTZJTOmJLmAcrfAijJGPxJPBI
1720oGUMd2c3Vc85gpO1V5smNzykg1ns/rabnxQgZuTaAqXEFqvL0mK11XzwoEPc
UuKvsZcz/E1fIQliPuH6MckNohoL2IHmee8aiiR1Y4us3FGzQ+7R1G2D4twlGehG
YyKvFxwLpyXTVPeJkwjPhd9Z3KcUFT8pRqMv1GMNSTMth+KfxnUexVyquLclMIrI
dukWP22jzxspeiy1yCZucMEicdF829CF7lup/CDc7+g70wPaZVhCMXFh0bgvcQFi
HVFhZlqHd9+yziYyM6yGGRnwlJrSBkt+rvR3qUAQYSVUCvXrRPAFEw5HHv2P5Tmp
JrKLvKtlcrId1fu45Lpr+83MTxKlK47dNyIZbltqKuBorOieXUsU1jrd/c1ulAeb
Tqx9KrGz
=IRMh
-----END PGP SIGNATURE-----

--oz5tb6pbesseypmr--
