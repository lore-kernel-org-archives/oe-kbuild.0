Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240C51C2BC;
	Wed, 22 Nov 2023 21:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqQRZEsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700688487; x=1732224487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BXwXI6DE+P0jltig6qM9Lo5riVrSnDqSaBiqhdr4+sc=;
  b=aqQRZEsmiRbHVlPelPTQaOv3/WgUTo8h/SHLF0e9iODLefljO+2W0Z1K
   0uPTtyX8r+KnWjqZ5n1FZK0AlgJ+tIHGUHvf7OOwU1UvmpjDysWxUveqK
   WPhsHUyUPJgJNC2xbViVdvtzSduzX4oMMmK3rw4EsI0zn5zndDcP/STn4
   hsHmLAwGmXjtlfAqBIHyefV88NZRL28FCLbLPA9/a++6o/4a+wvbCQgUu
   TWb50ZOa4Tc+xDOqZrSrC32daTGm2equCrn1RSc61vfNfS0TqjzkDfVtS
   GhFHUaKZSwfVwoedoGqa/3ilTKhDMiahIuAd5j+XCKt/4s0TZ3wJs/QRE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377177806"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="377177806"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 13:26:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="910979018"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="910979018"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 13:26:43 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 13:26:42 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 13:26:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 13:26:42 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 13:26:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkYL/GqEUmRMzoOa5n5RCCXForMg+IS6dnXcRJEUwfjTRU3NvVktGCKm+rE/9Y+5z8T02J2Fjxf0Qgk5R0SH4P6q+HuCm/iFEmsVDyXPdwOKm5Yvcg5C2DfVB/lNMY3CKfkCNOMLYu0/rcRf4057vBVQ6J+JUiVGyQOKvU1CmOyvPtKA14FXUSzPmoAtNQNxK/1vVaNbrwRQ66ITSwJ2zJD54c4lF7SpZeJFFvO1fSQECilbaScuCWjcaSTv2vkFv9F6CSP0gwCaRpwkj93bNxdPPbQgs7wZ8tXWSOBT+0neDjdtASm25fkqEwieXB8JmqMmxFtnX3i7pmaSqNDVIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qamCfLWjSa46vuEIq6U15hqntUDnWP/P5KNZjeQpW5c=;
 b=S1dHfx5e2FDzPRHY9H5gZuANcGX4AwB97PoJ+cPbMNJ3aEWDNPSYGP4H3nPzLzDjTUuATwelCAz8OYg6H78goy4KuKMoOXJ+qoxMqpXRZ6nPhS+j2O3TUVkK4VNWh52LByIitkSJ0Tt9YsOoY4RKzSgXh/KkuQrHYQuNCWpG/hhg4Gw4s7RuhE6CGsNWW46nornNzdOfCTgTr5lziG1/nSuOb1fPOkXtEMuNj9uaUaIF0YmS3fEj4wnE8K7BGCy/Q+8/qw2oXzdlvhYwe8wMEY+U1f+/Viu35U22AsccxfgGQbjiQAh/UgdGDtlrJQp/HvL54gdT5kUSFP3yq+jsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 21:26:40 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::b6a:cf27:4d2d:1df4%4]) with mapi id 15.20.7002.028; Wed, 22 Nov 2023
 21:26:40 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: RE: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb
 pages (v3)
Thread-Topic: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb
 pages (v3)
Thread-Index: AQHaGexVMDVadYYXNkCbYanhmRiReLCGGDGAgADG59A=
Date: Wed, 22 Nov 2023 21:26:40 +0000
Message-ID: <IA0PR11MB7185E05A2F10A3546720C11EF8BAA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20231118063233.733523-3-vivek.kasireddy@intel.com>
 <380cff80-c83e-473f-9e85-ab459f9af888@suswa.mountain>
In-Reply-To: <380cff80-c83e-473f-9e85-ab459f9af888@suswa.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA0PR11MB8399:EE_
x-ms-office365-filtering-correlation-id: 5f63e03a-e424-45c5-d676-08dbeba1b75d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gwC6+wUDNMosaFbpnt/dxZwM/BQhgVxXc4ExCsPT00Em5krEQiD/4ZO5U2wFIMaxyVLqSmEoJ+myTqOmXe51wO0nV3FQ0shV9zvHhPRSFnKqQONzHvoFRyWCdASYccUyWno2R7wUmRLGdiMRGFK5aaeNCFjxi9Mc2D09qoykFfFTxp9o9DFPAoaRUjtLc/B2mth7Da+vn4e5wCaygSFl0w7KMcmlE34Bc4pN3sNi85MzrR04lBWckqwEkPsPz01AFPEI4WNiJ+fftlt9fz8iA26X/f2s6UBd81Jsk0R7ZSfQ06On4XBo74FNsdWqWIYSRPpwM0f3lX2mCOdcGiEG+dFAvIrwRkhbP8POACiz2BOQe8ryuV50ptDLA4azAf3laLcDp1WID74YMrFEbJXVF+Xw6yMU0sPGUsSJX61iVAB26DANYRd/US7BE0blxvprKjxixW13/nMuT9biu3gg21ukcwSNJwZSH8LwayqzinHwht4O0DCWw8jq264ZMa33OgUFJTMuB5qPlpI0wrKi+sxTrkdBEk66OwgiQDldO0KyL239kfc9JSYYmK+XVOIVMMIglAw2wdXE2EX6r6ro6R/E6ANmtOAMl5m9zlTeWYxGGXZdLIX2CPXc792aKfVzOuvu9gaF7kl3fQUZmkqyqc9m7Umiq71H7TLn13WH2nD7HBOFrWV2fEtjoAJcK/nJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7185.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(4001150100001)(41300700001)(55016003)(52536014)(2906002)(5660300002)(64756008)(8676002)(8936002)(4326008)(66556008)(316002)(66446008)(66476007)(76116006)(66946007)(86362001)(33656002)(966005)(54906003)(82960400001)(478600001)(122000001)(38100700002)(71200400001)(110136005)(9686003)(6506007)(7696005)(38070700009)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KjUcL6IFUIwluXCzeG/n+Ate8qit/P+GM4OLYbYDwdxr3IFAcfUCNwYJgkgb?=
 =?us-ascii?Q?owQVW0eXco1SVv+qUrd0ywJQD/yGGsECOWcX/+cVBRSZKiTpaVhj4BNZWJsM?=
 =?us-ascii?Q?B5N6zMZG0hY3q+u9txf0r3Xt5MM2HhUzw45A3hQ8b77o0YHjMbcwD38mzhty?=
 =?us-ascii?Q?Bws9KYLKvSZjRLUNo3DM431g+JPnRXJWFKIXozetNVwhnKyAbB2Vt4ha1n4x?=
 =?us-ascii?Q?21gKJwRElLXEISFygEVVJKQ1HF37srrEi8JewIQOzdy5NFF4CWN5L+VHfw4h?=
 =?us-ascii?Q?pDw0KD6koa3o3PJWCnkYdsCuX9IDkgiZuaKiJ1siIAkZlMcN/atadaKqSgKZ?=
 =?us-ascii?Q?Fjvuhhx0TIjyOB6xzStWbepgpDtO3D5hPpAf/neE4CfwWsU1tH187s9uRI59?=
 =?us-ascii?Q?PoAeSjf0izSoKZn8yg8YIBrkhsLZHMXiohNBO/2qHksrytxJHYd5yKNNDL86?=
 =?us-ascii?Q?jZsme398gv7Nd1eIiRFleKgcY6El/u26V9miyQiaqJGtvgb/7i1AUeyTFISA?=
 =?us-ascii?Q?07J7J0edyVkpHIT9/s//gHvvh5dznD8R74V7whSUAmfuCZlVy/6MhYltKR3E?=
 =?us-ascii?Q?t/d0o7fdfRNsXnlWCMPb/Tl2oJ62Z8XuhiS22Mb3I9uUl3fYHByiyrNGUJqK?=
 =?us-ascii?Q?/6J0NCz5wb5y1guykTi3389PmXPc4o9CJvVJhA6R+ulX8N54uHro8C9ga9PW?=
 =?us-ascii?Q?/1etDX6xUkV5WK6V7p9NrXRa7ZAxpelVRAuB3yR4rJLfiiDi3pexa80OXnGn?=
 =?us-ascii?Q?LUG5+hIjQai+vNj1AUDi62z3XyrBfue5hjgdOUDOvs5f09x3E1Wr98ZZaa42?=
 =?us-ascii?Q?j2Xv4IoWrlFsU6URadpvmtuuMeEG62I96UEGvBx6GBzQT1z144RjMsxB6CLg?=
 =?us-ascii?Q?I+qO4vatabxSIZNb4fID8+BqiQwtNay0Hjy6zaJnmhTQL3lFwhmyEfZRK7El?=
 =?us-ascii?Q?tAQco6EXAl/nibsoqa9fP00h2QyMSNtkYE4DKGSxLmKK2PlcUOqaBktRJf9C?=
 =?us-ascii?Q?IYqgFMk2MS7pB920dBtWNTGuA5DyLjY4eojujt4ZHC/R/qIdtpCKHG26w2yk?=
 =?us-ascii?Q?cB2FCzAGXePGtMBTS9P09EW1+cRPu8sFA6+iwXR+CxHT/f2GBLfcgODAFr1X?=
 =?us-ascii?Q?+0I1WoUF2o+ayD8GE5CvH2SrHSLRn6FGsk3p+yEe3wh0JbWMDqy26SZATAlf?=
 =?us-ascii?Q?CFXFaBuKfUAzMEoXJqdxbS7eyELl6CslTkfedN2zC6y5Q2ffwR626zZalMda?=
 =?us-ascii?Q?S9GwWu5TFpojiSuzjwSta7wbIZjxtJ/hhxKN3Y8aR6zA9UwSoTiV6LUkWt2W?=
 =?us-ascii?Q?7JuiMwKVGknFwA7hmQPpatqjRDBYMNIl+uLWqbbG+IFw1hWuj7lBqH99CfTe?=
 =?us-ascii?Q?P8sgzWvs/jf7u3Wd4GLL0j+2UOqS3sN6KSSjiH9XwrADzv3ctguux/Sp1L9m?=
 =?us-ascii?Q?5oRNvywyWeIHqsKkiSMoRtmjq5wX0kYbExDyS7DOODiTOwh+ER/YxhYvrQm3?=
 =?us-ascii?Q?UygwsZSHu9OQ85aZSLbRDADVfJgZXf7feeBwdJJe2nNsVgfiEa9f90jo7pS5?=
 =?us-ascii?Q?2IdNTPuZcF2zF9g2+2rZC8n5FvGAEVYqXPRzXahM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f63e03a-e424-45c5-d676-08dbeba1b75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 21:26:40.1522
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w02S8gUkBTAtjDVQs1attUAfm2FE6ZozviRbHEYYiulriVwzjjNt8pXprpUyZYDTF1tw7/pBAW1HEI7TvEq86X+AbG1dozaDWJyKCd4/pUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
X-OriginatorOrg: intel.com

Hi Dan,

FWICS, both chunkoff and maxchunks are initialized and used only within
if (is_file_hugepages(memfd)) { } blocks which is OK in this case.

Thanks,
Vivek
=20
>=20
> Hi Vivek,
>=20
> kernel test robot noticed the following build warnings:
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-
> Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-
> mmap/20231118-145704
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-
> everything
> patch link:    https://lore.kernel.org/r/20231118063233.733523-3-
> vivek.kasireddy%40intel.com
> patch subject: [PATCH v4 2/5] udmabuf: Add back support for mapping
> hugetlb pages (v3)
> config: x86_64-randconfig-161-20231122 (https://download.01.org/0day-
> ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git
> ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-
> ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202311220940.c47i1TUH-lkp@intel.com/
>=20
> New smatch warnings:
> drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized
> symbol 'chunkoff'.
> drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized
> symbol 'maxchunks'.
>=20
> Old smatch warnings:
> (probably false positives)
> drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized
> symbol 'mapidx'.
>=20
> vim +/chunkoff +301 drivers/dma-buf/udmabuf.c
>=20
> c1bbed668997268 Gurchetan Singh     2019-12-02  214  static long
> udmabuf_create(struct miscdevice *device,
> c1bbed668997268 Gurchetan Singh     2019-12-02  215
> struct udmabuf_create_list *head,
> c1bbed668997268 Gurchetan Singh     2019-12-02  216
> struct udmabuf_create_item *list)
> fbb0de795078190 Gerd Hoffmann       2018-08-27  217  {
> fbb0de795078190 Gerd Hoffmann       2018-08-27  218
> 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  219  	struct file *memfd =
=3D
> NULL;
> 16c243e99d335e1 Vivek Kasireddy     2021-06-09  220  	struct address_spac=
e
> *mapping =3D NULL;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  221  	struct udmabuf
> *ubuf;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf=
;
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcn=
t,
> pgidx, pgbuf =3D 0, pglimit;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  224  	struct page *page,
> *hpage =3D NULL;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  225  	pgoff_t mapidx,
> chunkoff, maxchunks;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  226  	struct hstate
> *hpstate;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  227  	int seals, ret =3D =
-
> EINVAL;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  229
> 33f35429fc49c09 Gerd Hoffmann       2018-09-11  230  	ubuf =3D
> kzalloc(sizeof(*ubuf), GFP_KERNEL);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
> fbb0de795078190 Gerd Hoffmann       2018-08-27  232  		return -
> ENOMEM;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  233
> dc4716d75154b36 Gerd Hoffmann       2018-09-11  234  	pglimit =3D
> (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  235  	for (i =3D 0; i < h=
ead-
> >count; i++) {
> fbb0de795078190 Gerd Hoffmann       2018-08-27  236  		if
> (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  237  			goto
> err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  238  		if
> (!IS_ALIGNED(list[i].size, PAGE_SIZE))
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  239  			goto
> err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  240  		ubuf-
> >pagecount +=3D list[i].size >> PAGE_SHIFT;
> dc4716d75154b36 Gerd Hoffmann       2018-09-11  241  		if
> (ubuf->pagecount > pglimit)
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  242  			goto
> err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  243  	}
> 2b6dd600dd72573 Pavel Skripkin      2021-12-30  244
> 2b6dd600dd72573 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecoun=
t)
> 2b6dd600dd72573 Pavel Skripkin      2021-12-30  246  		goto err;
> 2b6dd600dd72573 Pavel Skripkin      2021-12-30  247
> 33f35429fc49c09 Gerd Hoffmann       2018-09-11  248  	ubuf->pages =3D
> kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
> fbb0de795078190 Gerd Hoffmann       2018-08-27  249
> 	    GFP_KERNEL);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
> fbb0de795078190 Gerd Hoffmann       2018-08-27  251  		ret =3D -
> ENOMEM;
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  252  		goto err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  253  	}
> fbb0de795078190 Gerd Hoffmann       2018-08-27  254
> fbb0de795078190 Gerd Hoffmann       2018-08-27  255  	pgbuf =3D 0;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  256  	for (i =3D 0; i < h=
ead-
> >count; i++) {
> 7a1c67d78094236 Gerd Hoffmann       2018-09-11  257  		ret =3D -
> EBADFD;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  258  		memfd =3D
> fget(list[i].memfd);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  260  			goto
> err;
> ff58105a47ede2e Al Viro             2022-08-20  261  		mapping =3D
> memfd->f_mapping;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  262  		if
> (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  263  			goto
> err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  264  		seals =3D
> memfd_fcntl(memfd, F_GET_SEALS, 0);
> 7a1c67d78094236 Gerd Hoffmann       2018-09-11  265  		if (seals =3D=3D -
> EINVAL)
> 7a1c67d78094236 Gerd Hoffmann       2018-09-11  266  			goto
> err;
> 7a1c67d78094236 Gerd Hoffmann       2018-09-11  267  		ret =3D -EINVAL;
> 7a1c67d78094236 Gerd Hoffmann       2018-09-11  268  		if ((seals &
> SEALS_WANTED) !=3D SEALS_WANTED ||
> fbb0de795078190 Gerd Hoffmann       2018-08-27  269  		    (seals &
> SEALS_DENIED) !=3D 0)
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  270  			goto
> err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  271  		pgoff =3D
> list[i].offset >> PAGE_SHIFT;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  272  		pgcnt =3D
> list[i].size   >> PAGE_SHIFT;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  273  		if
> (is_file_hugepages(memfd)) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  274  			if
> (!ubuf->subpgoff) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  275
> 	ubuf->subpgoff =3D kmalloc_array(ubuf->pagecount,
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  276
> 				       sizeof(*ubuf->subpgoff),
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  277
> 				       GFP_KERNEL);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  278
> 	if (!ubuf->subpgoff) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  279
> 		ret =3D -ENOMEM;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  280
> 		goto err;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  281
> 	}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  282  			}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  283
> 	hpstate =3D hstate_file(memfd);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  284
> 	mapidx =3D list[i].offset >> huge_page_shift(hpstate);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  285
> 	chunkoff =3D (list[i].offset &
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  286
> 	    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  287
> 	maxchunks =3D huge_page_size(hpstate) >> PAGE_SHIFT;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  288  		}
>=20
> chunkoff and maxchunks not set on else path.
>=20
> fbb0de795078190 Gerd Hoffmann       2018-08-27  289  		for (pgidx =3D 0;
> pgidx < pgcnt; pgidx++) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  290  			if
> (is_file_hugepages(memfd)) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  291
> 	if (!hpage) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  292
> 		hpage =3D find_get_page_flags(mapping, mapidx,
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  293
> 					    FGP_ACCESSED);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  294
> 		if (!hpage) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  295
> 			ret =3D -EINVAL;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  296
> 			goto err;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  297
> 		}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  298
> 	}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  299
> 	get_page(hpage);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  300
> 	ubuf->pages[pgbuf] =3D hpage;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @301
> 	ubuf->subpgoff[pgbuf++] =3D chunkoff << PAGE_SHIFT;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @302
> 	if (++chunkoff =3D=3D maxchunks) {
>                                                                          =
           ^^^^^^^^^^^^^^^^^^^^^^^
>=20
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  303
> 		put_page(hpage);
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  304
> 		hpage =3D NULL;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  305
> 		chunkoff =3D 0;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  306
> 		mapidx++;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  307
> 	}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  308  			} else
> {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  309
> 	mapidx =3D pgoff + pgidx;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  310
> 	page =3D shmem_read_mapping_page(mapping, mapidx);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  311
> 	if (IS_ERR(page)) {
> fbb0de795078190 Gerd Hoffmann       2018-08-27  312
> 		ret =3D PTR_ERR(page);
> 0d17455ca85ecbc Gerd Hoffmann       2018-09-11  313
> 		goto err;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  314
> 	}
> fbb0de795078190 Gerd Hoffmann       2018-08-27  315
> 	ubuf->pages[pgbuf++] =3D page;
> fbb0de795078190 Gerd Hoffmann       2018-08-27  316  			}
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  317  		}
> fbb0de795078190 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
> fbb0de795078190 Gerd Hoffmann       2018-08-27  319  		memfd =3D
> NULL;
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  320  		if (hpage) {
> 8129f43f2b3f79f Vivek Kasireddy     2023-11-17  321
> 	put_page(hpage);
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

