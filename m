Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013059.outbound.protection.outlook.com [40.93.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815F17BEBF;
	Mon, 19 Jan 2026 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768788355; cv=fail; b=eSBrJ1Rrg+ZW3JcsRkxbPX2Yi5cg0yBz9xNf1hwooSTC5H4FWPqniEt6KhEuJkILmst8HtG3EjcH9VPGXSU5fEuplt1GbAgRAmVi3xAQ/e1czj/SpYAfZU6Pi6Ley4eUU6eeUm3XZKIbUcAO87ZGCAali6QWHIozNeKlydtQgDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768788355; c=relaxed/simple;
	bh=v0/rucunA88NDrvPYrYm1gAjTYCPyVG/PI3DzKOaj/c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gYcmuh81MnyLDcJJuwaPnEMIJSOQWG7PJBYn8AtiKtEG2gnEDYq9MrrBxctBs24cyuPpThh4Gm7PRqpXN9NQX/WEoD05UoRsKenEPtaLmVYMKY9MeaDfNr/nBx4g4T24hi2RZ0qy5CS4BEhSHuYLRgftTf7TxnZkFvXd/y+lKu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0KydAap4; arc=fail smtp.client-ip=40.93.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0KydAap4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJLBsS1CDzN6k2KRK+97Uxithc1cjxySpkS5XD8GPAwmw5NbkT8wR6z9HLMO6hcaH0Nz5yuFZ6Y3iS2tKCx1M2AH7dL6mvBgX/hy5m/0I0T5l85QBlE3GOIevoB4MGubu5YstTmTvO1c/C7auzIa7m4MFJOvSdeLxv4sy/Sshc3FJj4xJuGUlpRRFBb3XS4pWxC5jn6P51hwJk6aW2Xq9/ewfJpTWRtGOxHs1Sh/al3R33sYD9EUf2KWrxi8mdDYB18Bh5L2QuK241nLuwi1/BOpe69zTLJkb2gVjGVFtwBoFmF9PaEjq97QrA0NFS5WK6ecAvJa/OYqU49F/dLHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAxFv5zGrMiJgpTPXTwErIi7oBMQfFjfGWOajyYqSZk=;
 b=ONwhoMWNdfXTUMv8PY/shmjxUMrpcV3mEn5K2xeqKztu7pbgskfYfLjjGrQn+A/h9/3lWS7Ba2pD9PpQSRoGmhtZLeSocE5RcB1QUEpXsgICRBrdW2S7Tz7/ZKqUecF2fh9OzqrGlyD0CqxGZxtUCPA899EXaKPTuqWktiUPyQIIjs94Iv52LcIGH3oaIjV8JzXJXfmZmASxruaF8AGT1Czq/HTh7yVlra+B98qKZ4WSgKTCZbwLl16lyeHZz+emgRzhNUV/srnlHPU1jGWuLKD+kynz3z1QJ2LO89Km8KtbgwmGJ3uxfc9GBAI/MTawwWeoc9WgM6y4Dl16QufY/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAxFv5zGrMiJgpTPXTwErIi7oBMQfFjfGWOajyYqSZk=;
 b=0KydAap4HYmqFeA+kEC0+HsukE5zOACUeZIDWEW3XdGUTBbZ56LixVuKNdW6gViYyRCWDdfYKS45Gw/JiNFCCpuassl292ZTbd25v11l2kJt3aq2TnOuo9IxJKMPHk2HrQF3VLJSI4YHOVaLapF4JUeEvOs14CSSJ87k4EYH9rY=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.11; Mon, 19 Jan 2026 02:05:50 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::ab84:617d:61a9:3727]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::ab84:617d:61a9:3727%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 02:05:50 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: RE: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
 amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns
 '&adev->reset_domain->sem'.
Thread-Topic: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
 amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns
 '&adev->reset_domain->sem'.
Thread-Index: AQHciLA7adDYAKqM50iriD2zluzmB7VYvN5w
Date: Mon, 19 Jan 2026 02:05:50 +0000
Message-ID:
 <DS7PR12MB60054B87D7396A6A507408C5FB88A@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <202601190121.z9C0uml5-lkp@intel.com>
In-Reply-To: <202601190121.z9C0uml5-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-01-19T01:58:41.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|DS4PR12MB9707:EE_
x-ms-office365-filtering-correlation-id: 842127d0-674b-4419-e133-08de56ff4502
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZqbUcoTPUduiIPHlE3eai3ryViJzlRndzamDpqafdk1t6nsT9u+JweXBcb?=
 =?iso-8859-1?Q?jph1lFE7f/mNPbnyfJTJL8BrFd6Lti3B24XpYq09TJXXEA0ubSG3PnIfN1?=
 =?iso-8859-1?Q?sNhDeDtDE3hVJQvVv9adMjqtUNRMXlwU2BCS0AuR5haWH5OhQKrNvug6RC?=
 =?iso-8859-1?Q?EdqBFB90f60AgmlJ7FnkjD24g90IF99AIIF3GVLHjavSP2bkgZuIsJ4O7a?=
 =?iso-8859-1?Q?DXcoi/FKCLdSoiK0fJKAuAowfaSYKDbpYVUh07+G07suA/F/DjPjF1eU++?=
 =?iso-8859-1?Q?gqedcTpeMnELM5goljtNKvMF5VrmGo21N8tgx9Ti5JWV4O9WvRmgasM4kt?=
 =?iso-8859-1?Q?R7em5VMGXyKRcaCgf5RLJdb1J2/JBchSs3uo5wH2Uhf3JvxxjYWiF7f2Lh?=
 =?iso-8859-1?Q?oh3nmdzoi7fy29MZPrmbvc0YJeR/uDO1a1FDAzf84VP9YJLkTcoVEpUa5/?=
 =?iso-8859-1?Q?mQvjzpKYPeMKwNMlyy1FAiFPWgddepMMDyysKImEt4zQVSSw9c8LylKnWt?=
 =?iso-8859-1?Q?g9pZjbWjUbywhKu0FtdXKgHhYvIPvuCufi0Tgnh/QHL7rouUgMR3Q1+xUJ?=
 =?iso-8859-1?Q?PAB4hT7O+CwpT+MPT9EnQkHzZEbMCkEAUbPnIELovQRpSm65x/dTHfLJkF?=
 =?iso-8859-1?Q?9pKZFQr44jZEXTKwhP63bkH5h1yCtD6sLHs6ppoGEy6FGzVdo+gt4nRwb8?=
 =?iso-8859-1?Q?iaqhGTF33SjyZTFj/pr0jsWRf1jeQ1uFaPzUWsrJyvNCpoNpKEBEQqHhzk?=
 =?iso-8859-1?Q?QhwA7C4v+pAV5oqE5Ghr/WViYak3pK+9bR0V3RqMC3ulcTWe7PG1mjpodb?=
 =?iso-8859-1?Q?AyTlDFaog35A1YhdxXVVFmkIsFgrY5jGhlNKr2hlytHITHEO61ERDzYAYv?=
 =?iso-8859-1?Q?PdIHQSAmR7f0W9KTQgO4j3NDqJAzuRKz3rO8hZRYyk/jogO9LBfo5uL0Mw?=
 =?iso-8859-1?Q?9qqY8rk8AP1yDRt+foFjXaKLFv5ZIRGzrOIi1H+rLCE3l2zcYvhJztUuvK?=
 =?iso-8859-1?Q?OOVuBBZg77j4N4JiGMcyVqTekWtSscBO4Dpfqk/dTMMcrEcPulo/jKAmut?=
 =?iso-8859-1?Q?ZnYJ25TxvJVDlQ6uKbizYR6mRu/Ns6bw91xXqjTOGFbRZ02A3iSOCtMJgD?=
 =?iso-8859-1?Q?hVAr1sh8UCj34oTXZvw3s5Ov+xpO4ajov80VZMfG0/VXuap/W/crk+Y7hm?=
 =?iso-8859-1?Q?2C/VP5+kz9BEGAyKx+Yzlhfn0VUyG/DZQZpy/YGU9y0JvlAdfWnMnBanqI?=
 =?iso-8859-1?Q?gRaAW/danNdWZj5+cmqdaFNHPfckF9BcknNGiB2msl/XNHI2pTeyylSgKD?=
 =?iso-8859-1?Q?ynV936ayqCYg9xjv+QsL5BSwV0jVW0Niax4eza+WFYgBV1mIKnjNL8w1qa?=
 =?iso-8859-1?Q?8uggTDBstLomOh0mXQv2o28BQTDVRzcZ8UkF0EcqmqZ2KX55raQdQZI68I?=
 =?iso-8859-1?Q?k/Lb9tfRNpfGyYs45EDeoPPLDhdPsC8xb1sKNVaxLSmVEbdd7sMf+5VrTP?=
 =?iso-8859-1?Q?tkVEizg3hkokrfApDaVCsrjUldfbTYGe60/lXdoXsZHXM1KE5G+Xtj/cpU?=
 =?iso-8859-1?Q?vgDYFgu2p0+9YvwydYLlAgwNtyAZhcoH7hhT4r67iaYQ7jNYFyE6S527HV?=
 =?iso-8859-1?Q?rUx9Zj2pJ1I0hSj29z69WMLJ12VXlIUjHjzXlgFT2OO/xVR8a3Seg7ZAsE?=
 =?iso-8859-1?Q?wCES7r6ZcZOzasfU3Te5IKPhfpaq+VOk6X6Cjz4y?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6005.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I8wRDHfEly6+Dr+6B8ZZxB9SkP45adhuI+6LrRI/IePlQVpF98eddTZkt4?=
 =?iso-8859-1?Q?YK/dmqoFgklARrH5GwWAzWYJE8LQFFTD3GKa982ensETstj6TYXkol9gZc?=
 =?iso-8859-1?Q?yhT522/NM6hNlx+MLKisryMSkprjdYc928rOGlbCuhiffPAz+rXfPW5hX7?=
 =?iso-8859-1?Q?p4o4KplJm+aGA870vYDP8qtGBsMudi7xYRrWIj9946x0tz8Kn5wxk0DeNf?=
 =?iso-8859-1?Q?rNtHTqeEGgrFyJq++llbTDUs5+OAtbeHIgy+Ow7+6JzV7WzYa+1W6dMsV4?=
 =?iso-8859-1?Q?HLGqHFjtD9t+ifJQkzN2vn0efPGjXjfU3PNRlIX01naCXIdv99K3OP0JpX?=
 =?iso-8859-1?Q?jHjxXxqLU2FLbLGYMasYpyODgQ9ikjJfhNQrTh7OnM9Nk9AGg2AbYA36w2?=
 =?iso-8859-1?Q?RjNGUXGgp2z3cJNpSqqm5bwUlwzvQRYQtTu/gHmBw3bGugGa0EpxosklRp?=
 =?iso-8859-1?Q?B2BlIwy5u6wtSRLzywZCjjjkUtFeJYhqL3UM+Ct8TB/UF/E6ivmt6igLFk?=
 =?iso-8859-1?Q?OPfMvsSLAXh5gFp1oc0innAv1bM5Uy7CdekrdVZJuDfEFwF8thJ+Sumw/y?=
 =?iso-8859-1?Q?mTL4TLXeO5/BhPnNDESJWqvfC5srt0suAjazAhXUaJtW+pelxeECKyjgPg?=
 =?iso-8859-1?Q?TYfPtaAwrnUWQGgYBywWIV5cYi7v+2A9fS6Btqh89fbBb6JLAlW03nEGuN?=
 =?iso-8859-1?Q?cFEDnGLbALhH6obdoIqTepsSYq8KHO+UkoDoijUXUdovvKanUKPB0pW4zN?=
 =?iso-8859-1?Q?ddTXhwFxyGUkvW/yznPkV79jrXPBMmx0H/SGiXdCqGVrJfz/Ez0QxScwid?=
 =?iso-8859-1?Q?DAWTtXQXrEljn07HqEx8lhtAD1YbkY/XHcEERV8xyoRgYP5jmmyGJaAKal?=
 =?iso-8859-1?Q?RORfAX3vszCMiR4KWSUsA2kWrhKYCk6DUwSmmGR29YOyESsPsb7pqANIMZ?=
 =?iso-8859-1?Q?5EX/MeilzLURQ8vcYndbC0Aag2ALbYxkiOrjKvASc7tHYzHtgNjsCTutjA?=
 =?iso-8859-1?Q?WFqwjgBAbkjJsWI44nyjWK2xQhCKTes6EWsZ1TFZ4/rrfgqG0LVPhmNKaY?=
 =?iso-8859-1?Q?hkZpZdazPpGp2srhnB7xhIwtmwTm2TAEuzW9Ahmk1mOhnwcVxwswr0OhMm?=
 =?iso-8859-1?Q?Kh7eo2/AL3nny2uWs28pDMys8Saf6n9Xt+KYIqoZJDtaQ8yNMCUycGqR+I?=
 =?iso-8859-1?Q?0kLQ5B4DjG+BvkjxfhNnu69bT/U4HUaAgSCSMMgy5PigpXhLJZ3ZVDEUy5?=
 =?iso-8859-1?Q?CoD9yU15VCNFHfgPWGpwIFSpZqyIBhAo3DPlytaSWU6IHFi5qLKkvK5yjp?=
 =?iso-8859-1?Q?QoYTVrH46cSIulIYZ4tVZhLbGKa2EhL1TKDpl5NEIuv/ENttP9+PMLHvAV?=
 =?iso-8859-1?Q?05UtshIh2fUeRrDezPEjR/xunJyYukaZyBbr/i1odQ/fmWATskFTxE07L9?=
 =?iso-8859-1?Q?yx6K86eOlafsv2sM2rOpax9Nm100VqATjmaXYqoc2YgCGOyKB0mg/cJiVK?=
 =?iso-8859-1?Q?OEwP7bcvH3opHWEAIMimvPNBcMK0hL3LOeSsfGu1KVprPxY8mjFwt8m9kT?=
 =?iso-8859-1?Q?hr5YnWBEW1Y//xEHTbQxZ0cq4PnwFqTjaoEdqALxOLwdusDva/H2+5skHM?=
 =?iso-8859-1?Q?IWuVMCaqHtNOt2tZjcdsFNDLdhHGnck50eWA8DEt3+gbj9mPjEBSzNQugY?=
 =?iso-8859-1?Q?zE5A3nvortXRRAEgY+OAfxz2GhsEqteEOFmz225Jd2iqF0pVPaU250vWJy?=
 =?iso-8859-1?Q?qQYG72ARnaeQYAy1PnR5FqFaV+Q3uoc78X6gspmAKDHeWc?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842127d0-674b-4419-e133-08de56ff4502
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 02:05:50.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfNYxzrn/MKh0O940TZ/yHR0x2N0p8tvpFvMUEuD5DYskgE9GGBxFdihVuRvw9I3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707

[Public]

Thank you for catching up, we have an inflight fix update for this lock iss=
ue.

Regards,
      Prike

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Monday, January 19, 2026 3:25 AM
> To: oe-kbuild@lists.linux.dev; Liang, Prike <Prike.Liang@amd.com>
> Cc: lkp@intel.com; oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kerne=
l.org;
> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>
> Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
> amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns '&adev-
> >reset_domain->sem'.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e84d960149e71e8d5e4db69775ce31305898ed0c
> commit: 0bea77b13b7649710108e6b67937ab4c7f8a9363 drm/amdgpu: validate the
> flush_gpu_tlb_pasid()
> config: powerpc64-randconfig-r071-20260118 (https://download.01.org/0day-
> ci/archive/20260119/202601190121.z9C0uml5-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project
> 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> smatch version: v0.5.0-8985-g2614ff1a
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the
> same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601190121.z9C0uml5-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:804
> amdgpu_gmc_flush_gpu_tlb_pasid() warn: inconsistent returns '&adev-
> >reset_domain->sem'.
>
> vim +804 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  717  int
> amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid=
,
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  718
> uint32_t flush_type, bool all_hub,
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  719
> uint32_t inst)
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  720  {
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  721        struct amdgpu_rin=
g *ring =3D
> &adev->gfx.kiq[inst].ring;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  722        struct amdgpu_kiq=
 *kiq =3D
> &adev->gfx.kiq[inst];
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  723        unsigned int ndw;
> 3666ed821832f4 Jay Cornwall    2025-03-21  724        int r, cnt =3D 0;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  725        uint32_t seq;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  726
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  727        /*
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  728         * A GPU reset shou=
ld flush all
> TLBs anyway, so no need to do
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  729         * this while one i=
s ongoing.
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  730         */
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  731        if (!down_read_tryl=
ock(&adev-
> >reset_domain->sem))
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  732                return 0;
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  733
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  734        if (!adev-
> >gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
> 0bea77b13b7649 Prike Liang     2026-01-06  735
> 0bea77b13b7649 Prike Liang     2026-01-06  736                if (!adev-
> >gmc.gmc_funcs->flush_gpu_tlb_pasid)
> 0bea77b13b7649 Prike Liang     2026-01-06  737                        ret=
urn 0;
>
> need to call up_read(&adev->reset_domain->sem) before returning.
>
> 0bea77b13b7649 Prike Liang     2026-01-06  738
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  739                if (adev-
> >gmc.flush_tlb_needs_extra_type_2)
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  740                        a=
dev-
> >gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  741
>                        2, all_hub,
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  742
>                        inst);
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  743
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  744                if (adev-
> >gmc.flush_tlb_needs_extra_type_0 && flush_type =3D=3D 2)
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  745                        a=
dev-
> >gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  746
>                        0, all_hub,
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  747
>                        inst);
> 08abccc9a7a7ff Christian K=F6nig 2023-09-04  748
> 3983c9fd2d8b5a Christian K=F6nig 2023-09-04  749                adev->gmc=
.gmc_funcs-
> >flush_gpu_tlb_pasid(adev, pasid,
> 3983c9fd2d8b5a Christian K=F6nig 2023-09-04  750
>                flush_type, all_hub,
> 3983c9fd2d8b5a Christian K=F6nig 2023-09-04  751
>                inst);
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  752                r =3D 0;
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  753        } else {
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  754                /* 2 dwor=
ds flush + 8
> dwords fence */
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  755                ndw =3D k=
iq->pmf-
> >invalidate_tlbs_size + 8;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  756
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  757                if (adev-
> >gmc.flush_tlb_needs_extra_type_2)
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  758                        n=
dw +=3D kiq-
> >pmf->invalidate_tlbs_size;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  759
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  760                if (adev-
> >gmc.flush_tlb_needs_extra_type_0)
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  761                        n=
dw +=3D kiq-
> >pmf->invalidate_tlbs_size;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  762
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  763                spin_lock=
(&adev-
> >gfx.kiq[inst].ring_lock);
> 9ff2e14cf013fa Bob Zhou        2024-06-20  764                r =3D
> amdgpu_ring_alloc(ring, ndw);
> 9ff2e14cf013fa Bob Zhou        2024-06-20  765                if (r) {
> 9ff2e14cf013fa Bob Zhou        2024-06-20  766
>       spin_unlock(&adev->gfx.kiq[inst].ring_lock);
> 9ff2e14cf013fa Bob Zhou        2024-06-20  767                        got=
o
> error_unlock_reset;
> 9ff2e14cf013fa Bob Zhou        2024-06-20  768                }
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  769                if (adev-
> >gmc.flush_tlb_needs_extra_type_2)
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  770                        k=
iq->pmf-
> >kiq_invalidate_tlbs(ring, pasid, 2, all_hub);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  771
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  772                if (flush=
_type =3D=3D 2 &&
> adev->gmc.flush_tlb_needs_extra_type_0)
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  773                        k=
iq->pmf-
> >kiq_invalidate_tlbs(ring, pasid, 0, all_hub);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  774
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  775                kiq->pmf-
> >kiq_invalidate_tlbs(ring, pasid, flush_type, all_hub);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  776                r =3D
> amdgpu_fence_emit_polling(ring, &seq, MAX_KIQ_REG_WAIT);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  777                if (r) {
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  778
>       amdgpu_ring_undo(ring);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  779
>       spin_unlock(&adev->gfx.kiq[inst].ring_lock);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  780                        g=
oto
> error_unlock_reset;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  781                }
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  782
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  783
>       amdgpu_ring_commit(ring);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  784                spin_unlo=
ck(&adev-
> >gfx.kiq[inst].ring_lock);
> 3666ed821832f4 Jay Cornwall    2025-03-21  785
> 3666ed821832f4 Jay Cornwall    2025-03-21  786                r =3D
> amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
> 3666ed821832f4 Jay Cornwall    2025-03-21  787
> 3666ed821832f4 Jay Cornwall    2025-03-21  788                might_sleep=
();
> 3666ed821832f4 Jay Cornwall    2025-03-21  789                while (r < =
1 && cnt++ <
> MAX_KIQ_REG_TRY &&
> 3666ed821832f4 Jay Cornwall    2025-03-21  790
>              !amdgpu_reset_pending(adev->reset_domain)) {
> 3666ed821832f4 Jay Cornwall    2025-03-21  791
>       msleep(MAX_KIQ_REG_BAILOUT_INTERVAL);
> 3666ed821832f4 Jay Cornwall    2025-03-21  792                        r =
=3D
> amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
> 3666ed821832f4 Jay Cornwall    2025-03-21  793                }
> 3666ed821832f4 Jay Cornwall    2025-03-21  794
> 3666ed821832f4 Jay Cornwall    2025-03-21  795                if (cnt >
> MAX_KIQ_REG_TRY) {
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  796                        dev=
_err(adev-
> >dev, "timeout waiting for kiq fence\n");
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  797                        r=
 =3D -ETIME;
> 3666ed821832f4 Jay Cornwall    2025-03-21  798                } else
> 3666ed821832f4 Jay Cornwall    2025-03-21  799                        r =
=3D 0;
> 9c33e5fd4fb63b Yunxiang Li     2024-05-23  800        }
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  801
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  802  error_unlock_reset:
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  803        up_read(&adev->re=
set_domain-
> >sem);
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04 @804        return r;
> e7b90e99fa8fd6 Christian K=F6nig 2023-09-04  805  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

