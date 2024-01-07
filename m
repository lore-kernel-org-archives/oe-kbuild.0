Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E3012E45
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdsV50p2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704628313; x=1736164313;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=UEsNbVZerNh4FZbN7gw1U9ayIWq8HTAmlsfzRZ2suKI=;
  b=GdsV50p2DhVA4VSLuK/89yxREcAP8KZyFD7P3Zd/NefCLvjcyEbmRRXa
   GZXZAIiK3u2FyJRcmjwTEUX3JNKs2MUFHy6ye1uzcT9r/7tVzXlrYdLGd
   wBpFatQUiH8g6UF6LyLtJVcGSRWUjHM2xUvb9uE4qp8FheVz/Skx/PWc6
   Zvql9B8yR29nF/ZDZH1aOaGC2Cn7Ro729qdi9YKt6+ajfeaIDOueBBVaM
   JmhwaOxd0U6dngY1JzQ74h90Os5Lsz/6WpzNXt+2rauJTJEvzZK4/TxqY
   vBNDT6vehIExBIPVabpYBeAVKMkmoRCA64QewAnsYqsvGsFhw8YA1++kU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="11207609"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="11207609"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 03:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="809968929"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="809968929"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 03:51:48 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 03:51:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 03:51:47 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 03:51:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYWYFJPV8jy5yuEhi22QPJ2AcqAwkb5RnGmsi8sxNygRBpY6p0WNIyPANNqsHiXB/WRgAiMg8DADLpDKhL1/Ulz+0I+i1UZ1D9Xb0gMHzZ3+t6aUMNS4cPm1tb6AtzjueAu8NBIIgeF0VxeCmgGLV5wLAWmZW7m5y3eijJj/El0UEmrwVCmW/g/R8ihy1GrPt4oE+lyknrVpfYx2GnAIJ522FUwFhDyFrnLaopYC0pqrwxUjGXDFs/9Qc48arK6vAf9633WLbPQrYiYjNRFm9k4SES/DvOQ+OHddmr/ez2PNFsJcYs5aGMCW9zQRViWBowKy0X6V5kZdQ8pFoNUl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDQTUq1N1zjf1dI6+bgysyBjeMqIDhi9FJw4sGKCI+c=;
 b=bksSEC/8G9ItKSWPX0Mb5GmsdHzDkDPn40HZij1oMMLrHZc44rbj4v68B/P6ej4GbNm7gi+gi6I0mb0KeBxvMtW7ZIV+wAPSUeTlRuqGbkRdoHYdwvEPdkYQXjqg8JTY/S3qb35iGjefuMiqaYwz9uR/UAKCdFWhRRHaXaLNJZpLz6HMSF0DKwiRhrri0kqf0mqYRgZRDFlWou4SKo5YquI/2VvjhaV6QFfWpSjMBEcaTvicF7P84oJdKawCPHboYVS7EJ0d8MvXv39qeRir+3N1gQlPcK0aDh6qhCzkbQjuccXdvHYYxmT8m5wJM29KB86xlaThubuSg9a5rbapyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Sun, 7 Jan
 2024 11:51:45 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 11:51:45 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d'
 directive output may be truncated writing between 1 and 3 bytes into a region
 of size between 1 and 26
Thread-Topic: drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d'
 directive output may be truncated writing between 1 and 3 bytes into a region
 of size between 1 and 26
Thread-Index: AQHaQEpFbOaJpseXsUGbu4ZykCDy87DOPvsA
Date: Sun, 7 Jan 2024 11:51:45 +0000
Message-ID: <CY5PR11MB6392C79235E51C3EE4B02747FB642@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401061021.tpkbFcs2-lkp@intel.com>
In-Reply-To: <202401061021.tpkbFcs2-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM6PR11MB4545:EE_
x-ms-office365-filtering-correlation-id: b4bd61dc-db9a-4660-9416-08dc0f7705b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aiVX49B03bAJddUkRS8jlRbRPuJpvvSxLFuKDKNKhQrwHO2BQE2sb8dtTe2MTozb4nXkSrGY/n8zhXGbvBqJxpEG3dzRLVptRcB4KsoVcS4j+UtwjbI2Mw0FnPx4mIXPsqxYnuHKBMm39VTQfv/uBmS6ZElT1CC4XSf8KDE2BqLVA7K7mZdjnoV3vmz9w4RbcB+XwWPXpRWbtvtZK8FY3ORy1NNu/r6b/ceWEtEC44b1P3XcfX9hQ5TuH3BKeJd5X6vPmmAGJPHwrDsFMXy5YzRMRtvMF//szHLrYGVIy+K44utka5c313c7Q/KMsB/Yc/AvVYhneq0YFAdKvCrJCMhOtzpObrQhWJIFAhbyYso5VDr801jZntILwLQg1l75Bs28mhk95HzveGJjn7mz5pkOIXTNnupUuryVA7m8FFq8prAdX1FXDNvzEWIbB3cRvqCOelfnvKtiZ4KcLulWn+IG9B0ce4whlDgSlKo7mUAuMUQrFvo1aj6Oha9dxb7szrvUAKxq56F3DZIUVNRbEkAItU48K/M/CyTwPUmuIErgfWppCbbZjx0ZS/9MySp9vgUgJxrVuvusL2I2nFTrAuDaf9t4eeiJAL50cumFpwL0E6uqNLuxoCv0HGm858VvoCQ5Sj27r3+PoQJj1OZ8pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(2906002)(38100700002)(4001150100001)(122000001)(5660300002)(38070700009)(82960400001)(86362001)(41300700001)(316002)(110136005)(8676002)(8936002)(9686003)(55016003)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(26005)(478600001)(966005)(7696005)(83380400001)(6506007)(71200400001)(33656002)(53546011)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SLsCj0BcO+GyVCOgK3M3MvsUl2x2vZQvVO4nehTgrlpNhCJFIybFsAG4nIjf?=
 =?us-ascii?Q?Eys8YzAbOC84z+uFmA29e8KETeFupHLiCjnGDgBI6VePKckWKEWbSeZuANaH?=
 =?us-ascii?Q?K32uYkFeKUThHzNwgNQ3KyCjQPxEtFaHOfxHELMS6OGWc19Pd4ffrfRFx1y9?=
 =?us-ascii?Q?iBjM5w2NraAHctLGQm4NIkn7YavLTOurArPuUnCe7K3yh51jhU5/wb3oRum2?=
 =?us-ascii?Q?B4zMi1i1zFBBZqun7fdv946wzIHkldKwn/eyl1SyQoBvqd/EAtf/jzsrVmXT?=
 =?us-ascii?Q?QRZNqEtegnQwh8Ujlh3r7LbRQfY4g+xpxnJi6X3+pL7S3/g5hPUeAY6kcdi9?=
 =?us-ascii?Q?ZQw7gWWxTl900Zjie8HOENlMTIUzQiQxOO5VwY3Bcx3zMKPHfJ1Yf31eWW/P?=
 =?us-ascii?Q?rpXcYMUquCP29WYhI/X+AUMWThEKIyn7myIks+4cFv1UIwp7mnlTH8tvsnPz?=
 =?us-ascii?Q?5Y1e5vVgkWzR39cbwLn+WZWlKP0Wq18sDc5cFhfCu5mPNA0EToJZMQMRckmi?=
 =?us-ascii?Q?Uify0WhIWHiwb5W1Zk9np3P90cTVn6tZE4Yn9cTBD+VVuUlI1Kl259vZLA94?=
 =?us-ascii?Q?PA/fxJaBXdboMWzqLo0ehosidjKZCh0CP7/na85+aTxrZ0wHE0e5InfjNUJU?=
 =?us-ascii?Q?IuOGzwfhZdCaA0gyM1TT42jZAYFhy5tK4SUw4/Dns7zup9Nc6koTTkRgyu2O?=
 =?us-ascii?Q?9Xs7vXNypoG0Snsf9OEVX3jYUzn5tNK/86Z5DsyAiE/287NrhSws3QbmJ9VO?=
 =?us-ascii?Q?8RDtWGTvHmwBZ5leQ7Oio+caVoraCN2lndmbPX9qdGEtLr433q5cLaoqRzcs?=
 =?us-ascii?Q?lkmbYgXE1kINtk4nKwuXw/AXWkS//kAhamE7o+v6UGJ/xb0f1Ryms14CvHLk?=
 =?us-ascii?Q?EmR22S2QVJBa2qQhRxFgs+X8JrN1hRxoObGK4VhDYbdg3hLoYNaKinFe98Zu?=
 =?us-ascii?Q?Q62GmBGnxwZNzX4OzwT5+r3+Yy24I6nfNiEX2w1w+Dx47zvaGOQunDfCP8D5?=
 =?us-ascii?Q?AAXbvJ7ueapFYwQap0U9RF5Kw+e03DY26gFyxxdZKU+glmjNebq7L9nhaTNo?=
 =?us-ascii?Q?p9l+PB+ZqpFIaqvdiYsdYadnDoWv/LgLckXPNaChWDSvC79MPweVOOSCbukb?=
 =?us-ascii?Q?HnoDzvkn1mkWYMRbmgBdzwQDt+LzMNO/nJ9NwRZXpqx1qXRhLHeoF0pAj2Pz?=
 =?us-ascii?Q?XP8YmgfShJ/Hd19CXEQzOo2yA3t9HxjaCxGUZiCTwj/hBzzrCx0Zcy0MXeVJ?=
 =?us-ascii?Q?bBc40akBdN+/pYdW4mvqrIq6vUVBqBwrXLAmNQ9oN7iRxFniXYlCj2o0qxf/?=
 =?us-ascii?Q?55YtlyeI7KSwEwpluxpcRapSbJx7xrfBZDs6gLBPPxg3ZguaLub5Yk9hjJ/S?=
 =?us-ascii?Q?1X33XeMxNsxc7e9SfiPO5t0PyDklr62O73rnMM//2g7Hfs11N0ZPT/CnxkIU?=
 =?us-ascii?Q?29m1zVj9c0Lu6dhfcC8zMcQEP9OGFTjzlhfrCN4I/LEthdnbQDTGDPEf0+61?=
 =?us-ascii?Q?QyknbQYk1FexgKV/AJQn2NMHKEzYMdRaGgHxY6GaAguear6h/c0/71iV4H2A?=
 =?us-ascii?Q?0jysFxHsRa7Ch36tleml2l8RirJoQP52eBFhMLtL?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bd61dc-db9a-4660-9416-08dc0f7705b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2024 11:51:45.0317
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71aX3gxM6y/rE6/59IXtMtZJ7iPJ11pgi94FyDSNVGxt/cTpJtOwwd/ynSo3EVHkQ3wWI4aguSA1L8x6ZY8CZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
X-OriginatorOrg: intel.com

not_report

A UBSAN patch is not related with the mpt3sas driver.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, January 6, 2024 10:44
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d' directi=
ve output may be truncated writing between 1 and 3 bytes into a region of s=
ize between 1 and 26

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a4ab2706bb1280693e7dff1c5c42a8cb9d70c177
commit: 61e0349f703d1576a12f88c15f25e0a56fd277af ubsan: disable object-size=
 sanitizer under GCC
date:   3 years, 1 month ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 years, 1 month ago
config: x86_64-randconfig-002-20240105 (https://download.01.org/0day-ci/arc=
hive/20240106/202401061021.tpkbFcs2-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240106/202401061021.tpkbFcs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401061021.tpkbFcs2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/mpt3sas/mpt3sas_base.c: In function '_base_request_irq':
>> drivers/scsi/mpt3sas/mpt3sas_base.c:2951:54: warning: '%d' directive out=
put may be truncated writing between 1 and 3 bytes into a region of size be=
tween 1 and 26 [-Wformat-truncation=3D]
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                                      ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2951:44: note: directive argument in=
 the range [0, 255]
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |                                            ^~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:2951:3: note: 'snprintf' output betw=
een 8 and 35 bytes into a destination of size 32
    2951 |   snprintf(reply_q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2952 |       ioc->driver_name, ioc->id, index);
         |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c: In function 'mpt3sas_base_start_wat=
chdog':
   drivers/scsi/mpt3sas/mpt3sas_base.c:751:50: warning: '%s' directive outp=
ut may be truncated writing up to 23 bytes into a region of size 15 [-Wform=
at-truncation=3D]
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                                  ^~
   drivers/scsi/mpt3sas/mpt3sas_base.c:751:44: note: directive argument in =
the range [0, 255]
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |                                            ^~~~~~~~~~~~~~~~~~
   drivers/scsi/mpt3sas/mpt3sas_base.c:750:2: note: 'snprintf' output betwe=
en 14 and 39 bytes into a destination of size 20
     750 |  snprintf(ioc->fault_reset_work_q_name,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     751 |      sizeof(ioc->fault_reset_work_q_name), "poll_%s%d_status",
         |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     752 |      ioc->driver_name, ioc->id);
         |      ~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2951 drivers/scsi/mpt3sas/mpt3sas_base.c

f92363d1235949 Sreekanth Reddy          2012-11-30  2925 =20
f92363d1235949 Sreekanth Reddy          2012-11-30  2926  /**
f92363d1235949 Sreekanth Reddy          2012-11-30  2927   * _base_request_=
irq - request irq
f92363d1235949 Sreekanth Reddy          2012-11-30  2928   * @ioc: per adap=
ter object
f92363d1235949 Sreekanth Reddy          2012-11-30  2929   * @index: msix i=
ndex into vector table
f92363d1235949 Sreekanth Reddy          2012-11-30  2930   *
f92363d1235949 Sreekanth Reddy          2012-11-30  2931   * Inserting resp=
ective reply_queue into the list.
f92363d1235949 Sreekanth Reddy          2012-11-30  2932   */
f92363d1235949 Sreekanth Reddy          2012-11-30  2933  static int
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2934  _base_request_irq=
(struct MPT3SAS_ADAPTER *ioc, u8 index)
f92363d1235949 Sreekanth Reddy          2012-11-30  2935  {
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2936  	struct pci_dev *=
pdev =3D ioc->pdev;
f92363d1235949 Sreekanth Reddy          2012-11-30  2937  	struct adapter_r=
eply_queue *reply_q;
f92363d1235949 Sreekanth Reddy          2012-11-30  2938  	int r;
f92363d1235949 Sreekanth Reddy          2012-11-30  2939 =20
f92363d1235949 Sreekanth Reddy          2012-11-30  2940  	reply_q =3D  kza=
lloc(sizeof(struct adapter_reply_queue), GFP_KERNEL);
f92363d1235949 Sreekanth Reddy          2012-11-30  2941  	if (!reply_q) {
919d8a3f3fef99 Joe Perches              2018-09-17  2942  		ioc_err(ioc, "u=
nable to allocate memory %zu!\n",
919d8a3f3fef99 Joe Perches              2018-09-17  2943  			sizeof(struct =
adapter_reply_queue));
f92363d1235949 Sreekanth Reddy          2012-11-30  2944  		return -ENOMEM;
f92363d1235949 Sreekanth Reddy          2012-11-30  2945  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2946  	reply_q->ioc =3D=
 ioc;
f92363d1235949 Sreekanth Reddy          2012-11-30  2947  	reply_q->msix_in=
dex =3D index;
14b3114d940cdc Sreekanth Reddy          2015-01-12  2948 =20
f92363d1235949 Sreekanth Reddy          2012-11-30  2949  	atomic_set(&repl=
y_q->busy, 0);
f92363d1235949 Sreekanth Reddy          2012-11-30  2950  	if (ioc->msix_en=
able)
f92363d1235949 Sreekanth Reddy          2012-11-30 @2951  		snprintf(reply_=
q->name, MPT_NAME_LENGTH, "%s%d-msix%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2952  		    ioc->driver=
_name, ioc->id, index);
f92363d1235949 Sreekanth Reddy          2012-11-30  2953  	else
f92363d1235949 Sreekanth Reddy          2012-11-30  2954  		snprintf(reply_=
q->name, MPT_NAME_LENGTH, "%s%d",
c84b06a48c4d8a Sreekanth Reddy          2015-11-11  2955  		    ioc->driver=
_name, ioc->id);
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2956  	r =3D request_ir=
q(pci_irq_vector(pdev, index), _base_interrupt,
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2957  			IRQF_SHARED, r=
eply_q->name, reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2958  	if (r) {
fc7d510ec4c8ff Joe Perches              2018-09-17  2959  		pr_err("%s: una=
ble to allocate interrupt %d!\n",
1d55abc0e98a0b Hannes Reinecke          2017-02-22  2960  		       reply_q-=
>name, pci_irq_vector(pdev, index));
da3cec2515f009 Suganath prabu Subramani 2016-02-11  2961  		kfree(reply_q);
f92363d1235949 Sreekanth Reddy          2012-11-30  2962  		return -EBUSY;
f92363d1235949 Sreekanth Reddy          2012-11-30  2963  	}
f92363d1235949 Sreekanth Reddy          2012-11-30  2964 =20
f92363d1235949 Sreekanth Reddy          2012-11-30  2965  	INIT_LIST_HEAD(&=
reply_q->list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2966  	list_add_tail(&r=
eply_q->list, &ioc->reply_queue_list);
f92363d1235949 Sreekanth Reddy          2012-11-30  2967  	return 0;
f92363d1235949 Sreekanth Reddy          2012-11-30  2968  }
f92363d1235949 Sreekanth Reddy          2012-11-30  2969 =20

:::::: The code at line 2951 was first introduced by commit
:::::: f92363d12359498f9a9960511de1a550f0ec41c2 [SCSI] mpt3sas: add new dri=
ver supporting 12GB SAS

:::::: TO: Sreekanth Reddy <Sreekanth.Reddy@lsi.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

