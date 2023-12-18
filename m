Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD661FBF
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 01:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8Moyvu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702864156; x=1734400156;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zWm+fwwSE3uuWKHImV658BoO7B/Huldv9ygzlRNHmaY=;
  b=T8Moyvu2cfnzgW0nwYmJBRJRPdcj1j84pkooCtGXs3TpP8hI47QBPz6E
   s2jyIcfS7+YGGxraDqs4b/FBTnZGK/as6DnKsfQq1jMLrDYGcqjR8Z2Ya
   zyzMz10+++B57DOY1HncpUTj2sR2Jj8jXhxZlKZ/cMUYIDfj5/krG6XoS
   OQgi/Pyut5sZ/KVoyrwKUhkbie4LQOnAdwvM4NXc4R93HDplkTW5pDSkb
   iD/AytYdPrK7WI11Zqah68mFfqQZkDSfful/XgA38W4zlUeSpauY5XIC5
   5kk/iPPwyZ75YayUIpgey/wJD9Mhdx9qJULDVJbqpa8cDHAwExQ9KIO51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="385867118"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="385867118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 17:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898793634"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898793634"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 17:49:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:49:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:49:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 17:49:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 17:49:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SapAeXbShSyRvaPqLHqm4Mb5tKlvWsrx9mj7ZnRb0GGS+9EFwamAGkvPrOHNTD4P5T1AB8/dSYkjVSOO9vHcIiBfaO2xzNrmjubXKuxtYRs4SOy0WbauqYfopkmaVCrNWwhr4I76y+Z7SHEplO0I84xRVRXD1Epu35KJQFID4LY4KMlpQMeoukApfTik75PN2pPdlWu9NvznBvVDNgWewyhvKvjMmn382oKVAkzJBo+1l6ZQ7toqQHsajj7jz1lV9Mc6NvRD6DSKXsNjaLBArtCwNBAmnc2t2u119vqmTZ5IJK4mhgXsTYMNgbzhkg52fegu6xYt2FHTdKuVgE4xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcpN/i6UMxfKntOETGkOtM7m+/DtgyIdFY1UotT+tII=;
 b=BUhfkD8MO41W+CkSaM7qjPiVkaud/xxaL8Ejsvmohp8DRVR8pjzkQiOa0pf6KnqScBhUxjI7tBF2xXtB8ZfjElO62CFwFk/Y0O+9lDydqybTvZmLM7B2hQC3wMa9bb7ybcl21yZ4XHz/LzX/bELdiGwgnKyd2x7zTGrsYYnDZP2hfX5LCYrnlKV8N4hQLyGcSwd2Te7nlbcXkUDFC9n/mMMnDy2Fye6JK8pMyml3/NspVY3VfxQeyPTNwjd7hAS45tMCO5+qZgA95GBCCNGGbvFmefOuTdMkdPS0R7tqtlRJB3hhM0RIKq1cFatEKoEkCMe3bqobn+O0duHzc5kwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 01:49:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 01:49:11 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/vhost/vhost.c:937:16: sparse: sparse: cast from
 restricted __virtio16
Thread-Topic: drivers/vhost/vhost.c:937:16: sparse: sparse: cast from
 restricted __virtio16
Thread-Index: AQHaMTa1Bv2lVkEA/kGLK5iBAtor27CuRegQ
Date: Mon, 18 Dec 2023 01:49:11 +0000
Message-ID: <CY5PR11MB6392998C4431D47BB347461EFB90A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312180604.PJESvFM8-lkp@intel.com>
In-Reply-To: <202312180604.PJESvFM8-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB5218:EE_
x-ms-office365-filtering-correlation-id: dbbbccb4-b320-45b0-53eb-08dbff6b8837
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8yNdN6cfvUSwp5PoJ7yrefJ/DQs9nbTz6sNOuOX4T5if7XTOwD49KG1FanKHi6Xk6JVwESdjwOqLN7UcVGQe8+dyU3Cloj+SYzLel1KHxUZ1QQQdcr6eQc3sBiC6RTT9T2B8oiW6VCsNutj7mG6gTCHtJ1GWyA2XCc3FVY9+z1+D55QqXHqZFd1ilcgnB+ZwBUxjmhQp1zfvKt+FPnnLhtyieL2LA/q/SqlAwj1NizzV1cgQgEbHt8X1JSDftMjGBD6ywlcyakwUFMKnpPW7b7LRd7U2zR1NhUmfdMgNJG+Zj+ny5e3sRUH8w0etyMj73pmBZ61+7MlwM0yf/3k+vGjr/ZLPGS9nliLNttioKKh3pElaPniuVbIUOYd9Y6QbmIFoYipTIiLUdycCvmkym79juZJ2gh4uE3YgtTIjZ4LkcIFK3XvfxHdjDL4LZ2KmVsStpLjiQWW5HtlTsbn2i8kVXDuUETVwl6HWKTKUrIaRpCF6dlvluAuv3iGXwFKvsC0AStTgMDVeyg4XNucnvQV+qdoVnuCobjKYvCWx/dMrZV/DjbgH9zKCluycr2uKACe0kqQbTrtKxU6MOS8GDNUfRl2IQBKE6MEzUCABtdkhdCoyjUygXetCTKe+IW/4al4cCdRpDE7pMbneTeKeO+mDD7NwSGlIQ+o29Yj9d9ttrfhzZMsx5AgyFWHugr6a
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(26005)(7696005)(9686003)(6506007)(53546011)(83380400001)(5660300002)(30864003)(52536014)(41300700001)(966005)(2906002)(478600001)(316002)(8676002)(8936002)(66946007)(76116006)(66556008)(66476007)(64756008)(110136005)(66446008)(71200400001)(82960400001)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qanK7rqKpRavxtJ+8hwkv2R7M+RmAY8mMB3OoD2UcRXu8KDmSuF68Onr/aHz?=
 =?us-ascii?Q?rTdvMN/vktFs16qTLEE0ZAL9zppQ7iTVeKQ/Db13tjX4hmFylN0gtu133YGy?=
 =?us-ascii?Q?hdbc5AmQqLtYqytvgjFx/bi2KPutYc4JcBGCg6R42ICHQ6LZLE+SkSK3rxO6?=
 =?us-ascii?Q?4ZgDOnNZqBn/8PC2ixveScwinb+YBwkwTJuzwdRFARM+p2vw0QZzbmBHCxRC?=
 =?us-ascii?Q?qen2pV9s3vZLqsHw4IACC06JUSCIUpGSL/4p443oPPNb/dSZBLaOOio7CHUS?=
 =?us-ascii?Q?53qW5RFd2r3p1QnSWegCmOCAEtx4nfB6vOzwlRYbn9IVBHmlDxWaPbfYOR8l?=
 =?us-ascii?Q?iGtHX3bm63g9g2VzFw7NeOwqD1v0KAy7RrjRpg3e/tDwEGxbmlk7YaLzl8YZ?=
 =?us-ascii?Q?D6BKC5MUygfvm0Jnizis8n6z3eTDk05Sl7ugP5MUCKOKpTgW1UcsKKFqTOTr?=
 =?us-ascii?Q?nHfFdzY/FPka3X3B//iKr7Y3Zq5lfNeDOtVzY+95Z2DK2DzO6UEEXj0nlI6v?=
 =?us-ascii?Q?FicPotSdOPYCWkVM80pu7WMgBdY8x+0OO8YT8El4y5moSQZjuPiJgAjleqc1?=
 =?us-ascii?Q?CnEa6ZnJ9kJp3I1teiWyoj2r0+er6BqbtSKSyAUHvOwOGi+Fl9/Rj59zpwA0?=
 =?us-ascii?Q?kLq6sBqDBE38nBX0uLvzNo9DbwR33c3TDvPLH/2UbnTKJJxniw4rMtgVoTmV?=
 =?us-ascii?Q?H95P5RQrwyJUsZFMPT7Pw8JHFesg02k3J0GIrBCegbL3Yn43Vh1jbg4/1I9f?=
 =?us-ascii?Q?UCMeA7NMR6aezdBZoX6xh3IJEHVgPMJAQrdNOfHcjdriDNntDs/5+TpjGvpW?=
 =?us-ascii?Q?tj2c6fJdQ9n24nUqo8G2k0fQ7Gpe3J4ac+33Rz4Z319N2hSSZkLlbASoBx7D?=
 =?us-ascii?Q?GsKg74TT6pXPgAindrdShR7R2GprNeC0pj73gvDPAvUVFaK9X/f2XczOPobd?=
 =?us-ascii?Q?GtgB5YmOtQP+R20Yx58YBZL7yrl9f4/Bzca0J+i08I+umum0crQJL1GJgqGJ?=
 =?us-ascii?Q?asX/bEhzYQ43bzOwSKJaRncOVs7zA2Im1mitcCnGC0saPu8Zl8hVE0TPVxWO?=
 =?us-ascii?Q?Uzz7wzc0BRls6R9rInOBXCKO5/MZ54/pyHDwW7CfRNJDXdbnhGGOhLMJM2nC?=
 =?us-ascii?Q?+NEXmOdpCCEpeRqLAwiilIs3tM8hHWsgyjAXqQ+TrQaaY/iFlJdRvKC0c7pq?=
 =?us-ascii?Q?KauQlFq8V5cGXlGZ+HcrQOPA6R4/NWvTOTGN/LWV/hxTucIRtS8uXv/3ocx0?=
 =?us-ascii?Q?eN6NHjW0C27F5GtKkVI4tbVx5I0alIpkEwYd7BQxsaHR+ZvtlOxxqhjhv34H?=
 =?us-ascii?Q?3eF5jOdNTLKC6QVy3imyJaXNy/djrE4/bYgGLlpq1y7afiyWvqJ9dBYSLe3K?=
 =?us-ascii?Q?FHSQPw9dozFjjs+1BEl4ufom3OSUkgwMIXP72348J+JjW40+2furOOYUTBP9?=
 =?us-ascii?Q?smriN2Yz7cvd2i16+YeSREP16PzSSNYyEkhKQ2TWgilFq2FH+XY3oivs8RPu?=
 =?us-ascii?Q?fJkvb2RKN9s3PuMxC2xA3U88LFehLtiKkvahe9IBOMy6UkOCpyDmdLXy+4Hr?=
 =?us-ascii?Q?/zbdNm3VTULYp6hE33tZ6CuiVODtJKyNm6C0oiLl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbbccb4-b320-45b0-53eb-08dbff6b8837
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 01:49:11.4700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z+aBpYtcDw5nVgt/OycsR5oP5XDrPekz03YfRnOUoltaltSXp9rBUzBHEvs2c+XmS50VfUptyfcEFyZNrjOC8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com

not_report

Only kconfig change. Not the cause of the sparse warning.

arch/arm/kvm/Kconfig         |  2 --
 arch/arm64/kvm/Kconfig       |  2 --
 arch/mips/kvm/Kconfig        |  2 --
 arch/powerpc/kvm/Kconfig     |  2 --
 arch/s390/kvm/Kconfig        |  4 ----
 arch/x86/kvm/Kconfig         |  4 ----
 drivers/Kconfig              |  2 ++
 drivers/misc/mic/Kconfig     |  4 ----
 drivers/net/caif/Kconfig     |  4 ----
 drivers/vhost/Kconfig        | 28 +++++++++++++++++++++-------
 drivers/vhost/Kconfig.vringh |  6 ------
 11 files changed, 23 insertions(+), 37 deletions(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Monday, December 18, 2023 06:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted=
 __virtio16

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e389834672c723435a44818ed2cabc4dad24429
commit: 20c384f1ea1a0bc7320bc445c72dd02d2970d594 vhost: refine vhost and vr=
ingh kconfig
date:   3 years, 9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 9 months ago
config: alpha-randconfig-r123-20231116 (https://download.01.org/0day-ci/arc=
hive/20231218/202312180604.PJESvFM8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231218/202312180604.P=
JESvFM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312180604.PJESvFM8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1527:54: sparse: sparse: self-comparison always ev=
aluates to false
   drivers/vhost/vhost.c:1528:54: sparse: sparse: self-comparison always ev=
aluates to false
   drivers/vhost/vhost.c:1529:55: sparse: sparse: self-comparison always ev=
aluates to false
   drivers/vhost/vhost.c:1782:46: sparse: sparse: self-comparison always ev=
aluates to false
   drivers/vhost/vhost.c:1863:48: sparse: sparse: self-comparison always ev=
aluates to false
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __vir=
tio16
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:937:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:937:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:937:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __vir=
tio16
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] [usertype] __user * @@
   drivers/vhost/vhost.c:922:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:922:16: sparse:     got restricted __virtio16 [nod=
eref] [usertype] __user *
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:1014:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1014:16: sparse:     got restricted __virtio16 [no=
deref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:995:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:995:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:944:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:944:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __vir=
tio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:1002:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1002:16: sparse:     got restricted __virtio16 [no=
deref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected void *addr @@     got restri=
cted __virtio16 [noderef] [usertype] __user * @@
   drivers/vhost/vhost.c:1008:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1008:16: sparse:     got restricted __virtio16 [no=
deref] [usertype] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void *addr @@     got restric=
ted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [nod=
eref] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument=
 2 (different address spaces) @@     expected void [noderef] __user *addr @=
@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user=
 *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return e=
xpression (different address spaces) @@     expected void [noderef] __user =
* @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user=
 *
   drivers/vhost/vhost.c:753:17: sparse:     got void *

vim +937 drivers/vhost/vhost.c

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  743 =20
f889491380582b Jason Wang         2017-02-28  744  static inline void __use=
r *vhost_vq_meta_fetch(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  745  					       u64 addr, un=
signed int size,
f889491380582b Jason Wang         2017-02-28  746  					       int type)
f889491380582b Jason Wang         2017-02-28  747  {
f889491380582b Jason Wang         2017-02-28  748  	const struct vhost_umem=
_node *node =3D vq->meta_iotlb[type];
f889491380582b Jason Wang         2017-02-28  749 =20
f889491380582b Jason Wang         2017-02-28  750  	if (!node)
f889491380582b Jason Wang         2017-02-28  751  		return NULL;
f889491380582b Jason Wang         2017-02-28  752 =20
f889491380582b Jason Wang         2017-02-28 @753  	return (void *)(uintptr=
_t)(node->userspace_addr + addr - node->start);
f889491380582b Jason Wang         2017-02-28  754  }
f889491380582b Jason Wang         2017-02-28  755 =20
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  756  /* Can we switch to this=
 memory table? */
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  757  /* Caller should have de=
vice mutex but not vq mutex */
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  758  static bool memory_acces=
s_ok(struct vhost_dev *d, struct vhost_umem *umem,
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  759  			     int log_all)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  760  {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  761  	int i;
d47effe1be0c4f Krishna Kumar      2011-03-01  762 =20
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  763  	for (i =3D 0; i < d->nv=
qs; ++i) {
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  764  		bool ok;
ea16c51433510f Michael S. Tsirkin 2014-06-05  765  		bool log;
ea16c51433510f Michael S. Tsirkin 2014-06-05  766 =20
3ab2e420ec1caf Asias He           2013-04-27  767  		mutex_lock(&d->vqs[i]-=
>mutex);
ea16c51433510f Michael S. Tsirkin 2014-06-05  768  		log =3D log_all || vho=
st_has_feature(d->vqs[i], VHOST_F_LOG_ALL);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  769  		/* If ring is inactive=
, will check when it's enabled. */
3ab2e420ec1caf Asias He           2013-04-27  770  		if (d->vqs[i]->private=
_data)
a9709d6874d551 Jason Wang         2016-06-23  771  			ok =3D vq_memory_acce=
ss_ok(d->vqs[i]->log_base,
a9709d6874d551 Jason Wang         2016-06-23  772  						 umem, log);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  773  		else
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  774  			ok =3D true;
3ab2e420ec1caf Asias He           2013-04-27  775  		mutex_unlock(&d->vqs[i=
]->mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  776  		if (!ok)
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  777  			return false;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  778  	}
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  779  	return true;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  780  }
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  781 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  782  static int translate_des=
c(struct vhost_virtqueue *vq, u64 addr, u32 len,
6b1e6cc7855b09 Jason Wang         2016-06-23  783  			  struct iovec iov[],=
 int iov_size, int access);
bfe2bc512884d0 Jason Wang         2016-06-23  784 =20
72952cc0614b61 Michael S. Tsirkin 2016-12-06  785  static int vhost_copy_to=
_user(struct vhost_virtqueue *vq, void __user *to,
bfe2bc512884d0 Jason Wang         2016-06-23  786  			      const void *fro=
m, unsigned size)
bfe2bc512884d0 Jason Wang         2016-06-23  787  {
6b1e6cc7855b09 Jason Wang         2016-06-23  788  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  789 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  790  	if (!vq->iotlb)
bfe2bc512884d0 Jason Wang         2016-06-23  791  		return __copy_to_user(=
to, from, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  792  	else {
6b1e6cc7855b09 Jason Wang         2016-06-23  793  		/* This function shoul=
d be called after iotlb
6b1e6cc7855b09 Jason Wang         2016-06-23  794  		 * prefetch, which mea=
ns we're sure that all vq
6b1e6cc7855b09 Jason Wang         2016-06-23  795  		 * could be access thr=
ough iotlb. So -EAGAIN should
6b1e6cc7855b09 Jason Wang         2016-06-23  796  		 * not happen in this =
case.
6b1e6cc7855b09 Jason Wang         2016-06-23  797  		 */
6b1e6cc7855b09 Jason Wang         2016-06-23  798  		struct iov_iter t;
f889491380582b Jason Wang         2017-02-28  799  		void __user *uaddr =3D=
 vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  800  				     (u64)(uintptr_t=
)to, size,
7ced6c98c7ab7a Eric Auger         2018-04-11  801  				     VHOST_ADDR_USED=
);
f889491380582b Jason Wang         2017-02-28  802 =20
f889491380582b Jason Wang         2017-02-28  803  		if (uaddr)
f889491380582b Jason Wang         2017-02-28  804  			return __copy_to_user=
(uaddr, from, size);
f889491380582b Jason Wang         2017-02-28  805 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  806  		ret =3D translate_desc=
(vq, (u64)(uintptr_t)to, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  807  				     ARRAY_SIZE(vq->=
iotlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  808  				     VHOST_ACCESS_WO=
);
6b1e6cc7855b09 Jason Wang         2016-06-23  809  		if (ret < 0)
6b1e6cc7855b09 Jason Wang         2016-06-23  810  			goto out;
6b1e6cc7855b09 Jason Wang         2016-06-23  811  		iov_iter_init(&t, WRIT=
E, vq->iotlb_iov, ret, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  812  		ret =3D copy_to_iter(f=
rom, size, &t);
6b1e6cc7855b09 Jason Wang         2016-06-23  813  		if (ret =3D=3D size)
6b1e6cc7855b09 Jason Wang         2016-06-23  814  			ret =3D 0;
6b1e6cc7855b09 Jason Wang         2016-06-23  815  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  816  out:
6b1e6cc7855b09 Jason Wang         2016-06-23  817  	return ret;
bfe2bc512884d0 Jason Wang         2016-06-23  818  }
bfe2bc512884d0 Jason Wang         2016-06-23  819 =20
bfe2bc512884d0 Jason Wang         2016-06-23  820  static int vhost_copy_fr=
om_user(struct vhost_virtqueue *vq, void *to,
72952cc0614b61 Michael S. Tsirkin 2016-12-06  821  				void __user *from, u=
nsigned size)
bfe2bc512884d0 Jason Wang         2016-06-23  822  {
6b1e6cc7855b09 Jason Wang         2016-06-23  823  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  824 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  825  	if (!vq->iotlb)
bfe2bc512884d0 Jason Wang         2016-06-23  826  		return __copy_from_use=
r(to, from, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  827  	else {
6b1e6cc7855b09 Jason Wang         2016-06-23  828  		/* This function shoul=
d be called after iotlb
6b1e6cc7855b09 Jason Wang         2016-06-23  829  		 * prefetch, which mea=
ns we're sure that vq
6b1e6cc7855b09 Jason Wang         2016-06-23  830  		 * could be access thr=
ough iotlb. So -EAGAIN should
6b1e6cc7855b09 Jason Wang         2016-06-23  831  		 * not happen in this =
case.
6b1e6cc7855b09 Jason Wang         2016-06-23  832  		 */
f889491380582b Jason Wang         2017-02-28  833  		void __user *uaddr =3D=
 vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  834  				     (u64)(uintptr_t=
)from, size,
f889491380582b Jason Wang         2017-02-28  835  				     VHOST_ADDR_DESC=
);
6b1e6cc7855b09 Jason Wang         2016-06-23  836  		struct iov_iter f;
f889491380582b Jason Wang         2017-02-28  837 =20
f889491380582b Jason Wang         2017-02-28  838  		if (uaddr)
f889491380582b Jason Wang         2017-02-28  839  			return __copy_from_us=
er(to, uaddr, size);
f889491380582b Jason Wang         2017-02-28  840 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  841  		ret =3D translate_desc=
(vq, (u64)(uintptr_t)from, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  842  				     ARRAY_SIZE(vq->=
iotlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  843  				     VHOST_ACCESS_RO=
);
6b1e6cc7855b09 Jason Wang         2016-06-23  844  		if (ret < 0) {
6b1e6cc7855b09 Jason Wang         2016-06-23  845  			vq_err(vq, "IOTLB tra=
nslation failure: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  846  			       "%p size 0x%ll=
x\n", from,
6b1e6cc7855b09 Jason Wang         2016-06-23  847  			       (unsigned long=
 long) size);
6b1e6cc7855b09 Jason Wang         2016-06-23  848  			goto out;
6b1e6cc7855b09 Jason Wang         2016-06-23  849  		}
6b1e6cc7855b09 Jason Wang         2016-06-23  850  		iov_iter_init(&f, READ=
, vq->iotlb_iov, ret, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  851  		ret =3D copy_from_iter=
(to, size, &f);
6b1e6cc7855b09 Jason Wang         2016-06-23  852  		if (ret =3D=3D size)
6b1e6cc7855b09 Jason Wang         2016-06-23  853  			ret =3D 0;
6b1e6cc7855b09 Jason Wang         2016-06-23  854  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  855 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  856  out:
6b1e6cc7855b09 Jason Wang         2016-06-23  857  	return ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  858  }
6b1e6cc7855b09 Jason Wang         2016-06-23  859 =20
f889491380582b Jason Wang         2017-02-28  860  static void __user *__vh=
ost_get_user_slow(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  861  					  void __user *addr=
, unsigned int size,
f889491380582b Jason Wang         2017-02-28  862  					  int type)
6b1e6cc7855b09 Jason Wang         2016-06-23  863  {
6b1e6cc7855b09 Jason Wang         2016-06-23  864  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  865 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  866  	ret =3D translate_desc(=
vq, (u64)(uintptr_t)addr, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  867  			     ARRAY_SIZE(vq->i=
otlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  868  			     VHOST_ACCESS_RO)=
;
6b1e6cc7855b09 Jason Wang         2016-06-23  869  	if (ret < 0) {
6b1e6cc7855b09 Jason Wang         2016-06-23  870  		vq_err(vq, "IOTLB tran=
slation failure: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  871  			"%p size 0x%llx\n", a=
ddr,
6b1e6cc7855b09 Jason Wang         2016-06-23  872  			(unsigned long long) =
size);
6b1e6cc7855b09 Jason Wang         2016-06-23  873  		return NULL;
6b1e6cc7855b09 Jason Wang         2016-06-23  874  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  875 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  876  	if (ret !=3D 1 || vq->i=
otlb_iov[0].iov_len !=3D size) {
6b1e6cc7855b09 Jason Wang         2016-06-23  877  		vq_err(vq, "Non atomic=
 userspace memory access: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  878  			"%p size 0x%llx\n", a=
ddr,
6b1e6cc7855b09 Jason Wang         2016-06-23  879  			(unsigned long long) =
size);
6b1e6cc7855b09 Jason Wang         2016-06-23  880  		return NULL;
6b1e6cc7855b09 Jason Wang         2016-06-23  881  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  882 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  883  	return vq->iotlb_iov[0]=
.iov_base;
6b1e6cc7855b09 Jason Wang         2016-06-23  884  }
6b1e6cc7855b09 Jason Wang         2016-06-23  885 =20
f889491380582b Jason Wang         2017-02-28  886  /* This function should =
be called after iotlb
f889491380582b Jason Wang         2017-02-28  887   * prefetch, which means=
 we're sure that vq
f889491380582b Jason Wang         2017-02-28  888   * could be access throu=
gh iotlb. So -EAGAIN should
f889491380582b Jason Wang         2017-02-28  889   * not happen in this ca=
se.
f889491380582b Jason Wang         2017-02-28  890   */
f889491380582b Jason Wang         2017-02-28  891  static inline void __use=
r *__vhost_get_user(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  892  					    void *addr, uns=
igned int size,
f889491380582b Jason Wang         2017-02-28  893  					    int type)
f889491380582b Jason Wang         2017-02-28  894  {
f889491380582b Jason Wang         2017-02-28  895  	void __user *uaddr =3D =
vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  896  			     (u64)(uintptr_t)=
addr, size, type);
f889491380582b Jason Wang         2017-02-28  897  	if (uaddr)
f889491380582b Jason Wang         2017-02-28  898  		return uaddr;
f889491380582b Jason Wang         2017-02-28  899 =20
f889491380582b Jason Wang         2017-02-28  900  	return __vhost_get_user=
_slow(vq, addr, size, type);
f889491380582b Jason Wang         2017-02-28  901  }
f889491380582b Jason Wang         2017-02-28  902 =20
6b1e6cc7855b09 Jason Wang         2016-06-23  903  #define vhost_put_user(v=
q, x, ptr)		\
6b1e6cc7855b09 Jason Wang         2016-06-23  904  ({ \
6b1e6cc7855b09 Jason Wang         2016-06-23  905  	int ret =3D -EFAULT; \
6b1e6cc7855b09 Jason Wang         2016-06-23  906  	if (!vq->iotlb) { \
6b1e6cc7855b09 Jason Wang         2016-06-23  907  		ret =3D __put_user(x, =
ptr); \
6b1e6cc7855b09 Jason Wang         2016-06-23  908  	} else { \
6b1e6cc7855b09 Jason Wang         2016-06-23  909  		__typeof__(ptr) to =3D=
 \
f889491380582b Jason Wang         2017-02-28  910  			(__typeof__(ptr)) __v=
host_get_user(vq, ptr,	\
f889491380582b Jason Wang         2017-02-28  911  					  sizeof(*ptr), VHO=
ST_ADDR_USED); \
6b1e6cc7855b09 Jason Wang         2016-06-23  912  		if (to !=3D NULL) \
6b1e6cc7855b09 Jason Wang         2016-06-23  913  			ret =3D __put_user(x,=
 to); \
6b1e6cc7855b09 Jason Wang         2016-06-23  914  		else \
6b1e6cc7855b09 Jason Wang         2016-06-23  915  			ret =3D -EFAULT;	\
6b1e6cc7855b09 Jason Wang         2016-06-23  916  	} \
6b1e6cc7855b09 Jason Wang         2016-06-23  917  	ret; \
6b1e6cc7855b09 Jason Wang         2016-06-23  918  })
6b1e6cc7855b09 Jason Wang         2016-06-23  919 =20
7b5d753ebc22c5 Jason Wang         2019-05-24  920  static inline int vhost_=
put_avail_event(struct vhost_virtqueue *vq)
7b5d753ebc22c5 Jason Wang         2019-05-24  921  {
7b5d753ebc22c5 Jason Wang         2019-05-24  922  	return vhost_put_user(v=
q, cpu_to_vhost16(vq, vq->avail_idx),
7b5d753ebc22c5 Jason Wang         2019-05-24  923  			      vhost_avail_eve=
nt(vq));
7b5d753ebc22c5 Jason Wang         2019-05-24  924  }
7b5d753ebc22c5 Jason Wang         2019-05-24  925 =20
7b5d753ebc22c5 Jason Wang         2019-05-24  926  static inline int vhost_=
put_used(struct vhost_virtqueue *vq,
7b5d753ebc22c5 Jason Wang         2019-05-24  927  				 struct vring_used_e=
lem *head, int idx,
7b5d753ebc22c5 Jason Wang         2019-05-24  928  				 int count)
7b5d753ebc22c5 Jason Wang         2019-05-24  929  {
7b5d753ebc22c5 Jason Wang         2019-05-24  930  	return vhost_copy_to_us=
er(vq, vq->used->ring + idx, head,
7b5d753ebc22c5 Jason Wang         2019-05-24  931  				  count * sizeof(*he=
ad));
7b5d753ebc22c5 Jason Wang         2019-05-24  932  }
7b5d753ebc22c5 Jason Wang         2019-05-24  933 =20
7b5d753ebc22c5 Jason Wang         2019-05-24  934  static inline int vhost_=
put_used_flags(struct vhost_virtqueue *vq)
7b5d753ebc22c5 Jason Wang         2019-05-24  935 =20
7b5d753ebc22c5 Jason Wang         2019-05-24  936  {
7b5d753ebc22c5 Jason Wang         2019-05-24 @937  	return vhost_put_user(v=
q, cpu_to_vhost16(vq, vq->used_flags),
7b5d753ebc22c5 Jason Wang         2019-05-24  938  			      &vq->used->flag=
s);
7b5d753ebc22c5 Jason Wang         2019-05-24  939  }
7b5d753ebc22c5 Jason Wang         2019-05-24  940 =20

:::::: The code at line 937 was first introduced by commit
:::::: 7b5d753ebc22c5b6935a70ce9a857dc6220784f8 vhost: fine grain userspace=
 memory accessors

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

