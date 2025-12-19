Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010078.outbound.protection.outlook.com [52.103.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984641C84A0;
	Fri, 19 Dec 2025 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766120490; cv=fail; b=e8ok9NWtu0ncxsUiBM5FCzfy1jGfNbMUHqis4HTqKx/eTZOqxIHOVm+BWJ8P0N8UVlFuEEuM4XPlLsi0h4oS03DeuuYWFBlvaF1SOEA3P1eXBGyz0V9beOSluQd4RhHIwVLbwtRMBeE+w9Fd4JGP53lsI2jTtSY3KthOKoDBxJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766120490; c=relaxed/simple;
	bh=IXKxHIIvsHPsQvyy7WtT6znlzkAzNFzXeB89Ua+I7nQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EETySma4i666wAYJ4kDt/vavPNxKjgfyNsc5EAmnNyw+KCt33eLwVfOoVcJXUZLOLrCSn66hhHtrxAd+7aNUnhSkHik5Zy3Zd2nOZUrhrS3vLatvcht6cUl3RJ6NlLtFtOQ1A2J9j0lPqSf7Y7yDQBZQUdWFJfr8hoBucqPxpy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RaX0A6v4; arc=fail smtp.client-ip=52.103.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RaX0A6v4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgIWb+0eigM6qFN65pKSXr1dq7N6EJ/IcbktN0r9/SksJAowsg7dqOZvNLZ01PF95AgavbeuS7+AoVUBSRze+TnPs9/fuuAu58eh3936TFb5qtPL+iM1augie1rCNmRutFa/elAePxFX06AvDBm8uqss8xepb0cvvs7Qnf2Nnv1NOjib1y62N41ulGAQiWYm+8tIWgv4KdrUY1KwX3hr9wjUzQYYwIBtnqKPn7R3Yk8g2CsyVxxAr8x8XhEZCVRl1v9LEnhr2yACOidVQEz/8tXW59a5KVBBRlVNJ3hugKYdBPNSSO+F07NeD0Hvf25fsJMygIRSgduPcDC4rGO8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QZxYNUxP0j599PPPh2pzPcfxNVgeNGH6jLTQsF5FXw=;
 b=coHnvd2yWJW9wNi83RZ9nzuL6/XSSuS8F139sW81zwIn4/dcKtAAnUy4rNY0eh5cdHJGFaSJ8OiRhdkAsqKVkN6R5hiq7hnKEu8HPTNy1UUeyk9msHXaVg1YfO0RUvnJNjz9IlokvzWtSQRd5E9mVnEq4fMe8DcZDMTndVXDYheYDGWQ/OXZLqj/obWpbMGuhUMNpjukQQslkXbMmc6t4Nm1O0ekPOAV1Qs3sHRs8/khyIE/3KyhRC+sJex9TgFokctPIsuKHOULsLgoC2lQwBxzKnIMA/2ZocED5ODbOOP/Al1P4pqSrLamRDDR3NVccj7Lx7KEK3leM/8xF64RAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QZxYNUxP0j599PPPh2pzPcfxNVgeNGH6jLTQsF5FXw=;
 b=RaX0A6v4oNMSc8yc9MSAQFh6Eamzy8iV7WLrnNBUbp5GHM0hGdKQoLE/O2TtJHxfyFU/G7AJYrUAGtJeDHcWU2Fl/823Ohlk+MhaXF/V+sBQk6A/5F8nEUvBCW4ocjakRsI9I6qGQabDp18GJChOT9EalkUtjqwWq/j/9RnqaExy3MIb66fHgallQ9gzpcYhMWvaOV3pHJxLljzKvfVOnnzmiZY7Gca3y4ddFpqyvGpVqlK2CXnDCAfMu2sttLwJjrrKkKMHwu9WN4V+7r2vhHYjsyvUrH6pF9OqYREFMT/S9jEi+3LxTw0BJ3PioniqlzvqbUc0oDjFnshEOTf7Uw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH0PR02MB8244.namprd02.prod.outlook.com (2603:10b6:610:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 05:01:26 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:01:26 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>
Subject: RE: drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized
 symbol 'bytes_written'.
Thread-Topic: drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized
 symbol 'bytes_written'.
Thread-Index: AQHcb1heG5Iz5CYieUWX83ZlQQkHn7UoZx7Q
Date: Fri, 19 Dec 2025 05:01:25 +0000
Message-ID:
 <SN6PR02MB41575709BF51D13FD0DB1A92D4A9A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <202512172102.OcUspn1Z-lkp@intel.com>
In-Reply-To: <202512172102.OcUspn1Z-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH0PR02MB8244:EE_
x-ms-office365-filtering-correlation-id: 290cdcc9-f210-494b-198b-08de3ebba99c
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|31061999003|461199028|41001999006|13091999003|19110799012|8062599012|8060799015|4302099013|440099028|10035399007|3412199025|40105399003|52005399003|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U8i0xUgJlEv0dRuDD3md3boBsux1zTYGdCaIsn2JGunuuTkK2dSMlYeYH5me?=
 =?us-ascii?Q?tC5Af68nKCxce9/d0GzD1LkRJH194H1Aw4bJWHtH/RHza1sBHadHPKmav1Wq?=
 =?us-ascii?Q?LEUzphp4jdEan2vqlNrRRkvNuUdAeyCfGsCu/93BQIdmH3xhiFDAiuUChLGo?=
 =?us-ascii?Q?NvcLWwMVH8M4KiraYhrYnm4+2/CY3Is9wOw3hh0pMuR41vOMCbhVeOmyrRbM?=
 =?us-ascii?Q?L5E9z8YVWCsK3+6vvxBMn38miUYA3KERrtfvfDcb3W7Y9ikvZztD5/PNIcfH?=
 =?us-ascii?Q?yLw4S8TU9LIvVFko0Nkvps7i981oewzTQ0pIPe48OfiWNUeBsmvLDF1btKpp?=
 =?us-ascii?Q?Z72vGkIhH9qfZu9geeM1NOX/SguAmxYxYm24JGyqwpgPFc56fX4Y7F1PYUnD?=
 =?us-ascii?Q?zi1/dHqM3nEAJnxSs2xZhW9QT5Y5guCygq43q5E/m1bAZUWqzrojezbWOuyt?=
 =?us-ascii?Q?0gpFvkGBX1mKXoMfnVSc1OMAbx5wLurgRtkRXRoBMB0ljWJRzF4Kco62WoA0?=
 =?us-ascii?Q?dxirLj/TFwVsXOhYFcKpYjIIWMSbpvvAY7bbPj9OhyWs4Y1qgEiNW3Hl5iPB?=
 =?us-ascii?Q?OeXq2gjK9CyoEGkJ3sLy2107WaNn+wm+UGiG2KIqgP94pAVNqkxjyxF6tKJ0?=
 =?us-ascii?Q?85I/q5JoRd6Ka5By5amjxjx/mYlAqfeGkWYaM3O8eNVGsXWXsI2+WRu7lUiD?=
 =?us-ascii?Q?AKqFL9+nsotJsrOc+Gpq4r2o35/WS/umdN9q84GYT8GG5Zy0hy3G4o8ApALo?=
 =?us-ascii?Q?zsws5ld5PwyqeOuC108Ol/auXUfMS+nCW/f8KyRSmgaMo0rtr3PBVcbuL32x?=
 =?us-ascii?Q?7P37vVh7TKODeej0X7tGZCPnS/BpIrJa501FqevjWjXT5sxYZ2ltOgyvkAtv?=
 =?us-ascii?Q?f0MmFM0HS/LAsgFQNQX485b7az3RXkR/NmhLOABFgWS38ZcdqkNzYzAUlicp?=
 =?us-ascii?Q?9yPuSs/rF11kCC7vu9ya8thl49ngbPC33DyTHvbdd27XZGNl+/Ym2IWSpRB8?=
 =?us-ascii?Q?RNSO/BZ50CGoyzQRNq1NqdOcLfEi26AEGiQ6fHdEMREDOB/Za/TJU9cXgbGn?=
 =?us-ascii?Q?KGTkMfaKVAiuTsQp/DDp3nMz3brGlRLOUuOnQvjAmnu657wX6d3VZ9zStxe4?=
 =?us-ascii?Q?rFECjQmxoFkpirLTnrpOPgL7wazQv0sTvwUFcFy48IS75n867OCEfJP3ndfk?=
 =?us-ascii?Q?hWLGsFl9ceJJT3m7NhZ+W3D9DEIPS0U/W911Ug4M8YDJ7QIftbjt65prjP/K?=
 =?us-ascii?Q?jip6yVhwFR2xy4rD4HmXIs5r8wobizse9KENhO9SYTMz4iAu675IZOGQ+xE+?=
 =?us-ascii?Q?IOEXSGiX9ht6s3VcKe4n9YZzyr0JsRKkwJ/aTLbvTvBmqg/9HS6UVHOSe6aX?=
 =?us-ascii?Q?rWVWYaBW7bBYfUEZ3T5WDqM5kboo?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+KGqfQDWCq19xdsyvZz8XnBUAFtQkSEMXHEuxwH6/h5igw6ZnGWCkB4A9nia?=
 =?us-ascii?Q?oA2K9A7xd31mMH+ikV0OeTJTIJRwD9ds0qJwY3euRjuqzye/VGpMyogQHCFP?=
 =?us-ascii?Q?Ko778BN/fhTyKf/fTCrIIYX7dSrs4HlQDptxPnosTMnG7Trni97W/y8IHYxQ?=
 =?us-ascii?Q?hYEPOucgkDkNHaTEaFCw1449Tc7PlXpfDcINnqNf8BN909WPQDYX+SJ9JT9a?=
 =?us-ascii?Q?9AtQF1fhkMboTzPGxeIXzAgfWsgAm+PH7e2dykoK+d8GaTMbRM8J+yD4m76D?=
 =?us-ascii?Q?EQE1mF0AcLjSSEAX//LEpQ863ogmq4TGyhBfF2PPY0S+b4hpvzE9EQR6IL4I?=
 =?us-ascii?Q?LJhHOWav1gkwTUVlI1kUclewTnk2Va3DSGczOSMNhoh2IvEchbetzuRwrIhS?=
 =?us-ascii?Q?Vw3YBM33OvpD5CwH9XrKcjl0/r2ckDQABii54TxfRDtueWguy3g/35gguO50?=
 =?us-ascii?Q?frc3/t6tg4wLl23IxckpmZvf+xdpjIylHkdJEmT6eexZ97IFT7e9nlTezqOr?=
 =?us-ascii?Q?YLq/aAu7girhDPi968xEMWLGGCyOQG7HvjpHkmvKR4dbYqgd0VEHB8js7eIV?=
 =?us-ascii?Q?7Xxou9Za8iL0n2Lcm+RTQs/6IZ7oiHEF2kQ5AQLjGg5/MwesnpuwpzA+cNgO?=
 =?us-ascii?Q?OPYpwQFXAPWZR5h5T4NvNQDA5zJfsnCp/XjXFvaD8BtYMC5QMmccI0ZSZXzA?=
 =?us-ascii?Q?sZ4/J6DqMPRqa1An9oZBjDFnw5K+Xr1ukcC7QD0hFynFv/w+hYHz5Y0qlVgI?=
 =?us-ascii?Q?dOGhnBbfcy4NGRlqiD2N15Fq6QwE5v9zUh7cAMhjCibMXmJL5Zh9yiQWpAze?=
 =?us-ascii?Q?B43OHfD1fLPmPCKHmnWGMdHlaz7L5AUMd9x17FkLBmG2mfTR14lsMFNtlQYb?=
 =?us-ascii?Q?/+/Y0NWqiyNSUIjNAe/2p8luKjXDIs685rRqMRejoImPGQvRteKqqT2NWoxm?=
 =?us-ascii?Q?9Y7iUeB6chZ6WFwaMMCC6/sEx56DqQ09TSzaXFopoNiLf0IcLeu1phIDf2sa?=
 =?us-ascii?Q?WoUg36A7xVbYSy9/s09aIOsvALehsOydfTOBKsa2/hzan6cciLuylPU+HTPm?=
 =?us-ascii?Q?FGST2jg/7Xzz5kobMBK1opXwYDeIT8yy5GLezF4IcaSuymHrLr3WodGo5Shn?=
 =?us-ascii?Q?3gIYfoulq0lmqXYN/73SDhytTW2/bjqZ4R9RAc9jlNI6UdE+D+cg+U6gJAnx?=
 =?us-ascii?Q?wyMNuem4PbE8Yg+qB2Ns792hIkte5jGD3e9oDfxN3puKy28iKnTLXLChixc?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 290cdcc9-f210-494b-198b-08de3ebba99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 05:01:25.7684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8244

From: Dan Carpenter <dan.carpenter@linaro.org> Sent: Wednesday, December 17=
, 2025 5:24 AM
>=20

I'll submit a patch to fix this.

Michael

> tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
> head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
> commit: f41ceff1748612b9e1538becc13dc2f1617d9d14 Drivers: hv: Enable VTL =
mode
> for arm64
> date:   7 months ago
> config: arm64-randconfig-r072-20251216 (https://download.01.org/0day-ci/a=
rchive/20251217/202512172102.OcUspn1Z-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1=
335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512172102.OcUspn1Z-lkp@intel.com/
>=20
> smatch warnings:
> drivers/hv/hv_common.c:242 hv_kmsg_dump() error: uninitialized symbol
> 'bytes_written'.
>=20
> vim +/bytes_written +242 drivers/hv/hv_common.c
>=20
> 9c318a1d9b5000 Long Li         2023-04-20  225  static void hv_kmsg_dump(=
struct kmsg_dumper *dumper,
> e1a261ba599eec Jocelyn Falempe 2024-07-02  226  			 struct kmsg_dump_deta=
il *detail)
> 9c318a1d9b5000 Long Li         2023-04-20  227  {
> 9c318a1d9b5000 Long Li         2023-04-20  228  	struct kmsg_dump_iter it=
er;
> 9c318a1d9b5000 Long Li         2023-04-20  229  	size_t bytes_written;
> 9c318a1d9b5000 Long Li         2023-04-20  230
> 9c318a1d9b5000 Long Li         2023-04-20  231  	/* We are only intereste=
d in panics. */
> e1a261ba599eec Jocelyn Falempe 2024-07-02  232  	if (detail->reason !=3D =
KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
> 9c318a1d9b5000 Long Li         2023-04-20  233  		return;
> 9c318a1d9b5000 Long Li         2023-04-20  234
> 9c318a1d9b5000 Long Li         2023-04-20  235  	/*
> 9c318a1d9b5000 Long Li         2023-04-20  236  	 * Write dump contents t=
o the page. No need to synchronize; panic should
> 9c318a1d9b5000 Long Li         2023-04-20  237  	 * be single-threaded.
> 9c318a1d9b5000 Long Li         2023-04-20  238  	 */
> 9c318a1d9b5000 Long Li         2023-04-20  239  	kmsg_dump_rewind(&iter);
> 9c318a1d9b5000 Long Li         2023-04-20  240  	kmsg_dump_get_buffer(&it=
er, false, hv_panic_page, HV_HYP_PAGE_SIZE,
> 9c318a1d9b5000 Long Li         2023-04-20  241					 &bytes_written);
>=20
> kmsg_dump_get_buffer() is a no-op if CONFIG_PRINTK is disabled.
>=20
> 9c318a1d9b5000 Long Li         2023-04-20 @242  	if (!bytes_written)
>                                                             ^^^^^^^^^^^^^=
^
> uninitialized.
>=20
> 9c318a1d9b5000 Long Li         2023-04-20  243  		return;
> 9c318a1d9b5000 Long Li         2023-04-20  244  	/*
> 9c318a1d9b5000 Long Li         2023-04-20  245  	 * P3 to contain the phy=
sical address of the panic page & P4 to
> 9c318a1d9b5000 Long Li         2023-04-20  246  	 * contain the size of t=
he panic data in that page. Rest of the
> 9c318a1d9b5000 Long Li         2023-04-20  247  	 * registers are no-op w=
hen the NOTIFY_MSG flag is set.
> 9c318a1d9b5000 Long Li         2023-04-20  248  	 */
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  249 	hv_set_msr(HV_MSR_CRASH_P=
0, 0);
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  250 	hv_set_msr(HV_MSR_CRASH_P=
1, 0);
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  251 	hv_set_msr(HV_MSR_CRASH_P=
2, 0);
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  252 	hv_set_msr(HV_MSR_CRASH_P=
3, virt_to_phys(hv_panic_page));
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  253 	hv_set_msr(HV_MSR_CRASH_P=
4, bytes_written);
> 9c318a1d9b5000 Long Li         2023-04-20  254
> 9c318a1d9b5000 Long Li         2023-04-20  255  	/*
> 9c318a1d9b5000 Long Li         2023-04-20  256  	 * Let Hyper-V know ther=
e is crash data available along with
> 9c318a1d9b5000 Long Li         2023-04-20  257  	 * the panic message.
> 9c318a1d9b5000 Long Li         2023-04-20  258  	 */
> 0e3f7d120086c8 Nuno Das Neves  2024-02-20  259 	hv_set_msr(HV_MSR_CRASH_C=
TL,
> 9c318a1d9b5000 Long Li         2023-04-20  260 			(HV_CRASH_CTL_CRASH_NOT=
IFY |
> 9c318a1d9b5000 Long Li         2023-04-20  261 			HV_CRASH_CTL_CRASH_NOTI=
FY_MSG));
> 9c318a1d9b5000 Long Li         2023-04-20  262  }
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
