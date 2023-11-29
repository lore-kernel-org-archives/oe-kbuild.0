Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407184405
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 03:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLmA/wfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701227013; x=1732763013;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=IjYyWIEnY9j5+nNDMJXYs9uY2R2GuQyXH+Q7vKffINU=;
  b=bLmA/wfTO9BAdpXwnoA4VjgYYCcmoiXflVEab3oyrKNJooPf/bkNKFYg
   g1s0YnkjU99P2s2qoWwXBP/00SfgwTrxEWgXEqwoS393O2J4SBUhuZ/Qq
   wWtW6z4N9/xcKdxpA4izh253Rz/eKDyZMal6HxjtvxNCob9mprV8nncVm
   OIkqyhLX+s6lpHzzAAD/iqtyBhgBhHoTVlG0feb5WblG+74H6CQ4vDA1Q
   B9Z1DXMRS/6U+NaFGCq3z806GGNRfEBt7xEk8URtn18cIqigWs9W0i7lq
   YAYrafndaz9OVywtBchv7M1cmAnyYhBDyXVXLk225MADZk4JQBQLQKlii
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479279593"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="479279593"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 19:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772531267"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="772531267"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2023 19:03:16 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 19:03:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 19:03:15 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 19:03:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQExPi6V6ux7bfbTugXMFe3Y4Sq2smpIdblplPY3l/vs4WdWXuWV863ZI4yLcheoKdIKO9u28aCyzX3UWRUmPu39s1U72gcMpffi95sP2rlHJ7z8eCMxnN6pC0mTvXEkopHAMMgLB5U5DDFX5fwTCjSxf29ZNpr17fROAdKor1WDFHURCKflZH6yEYiJ/FY+Mfb4RyN5HGLwa0iWs1S+vITKjgkil/NYIP0O6mNobD1/vAgCCMJIC4KSvJcZO1v1iRe3kQAJbnre/b0exbgvwoWesiEP2qi/aaGEk8A9A/aqV5V/RB1+mPqcSIdT1Y6nWYMZIcwpU/p4klzuLKmekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gkXlkVZHcZ988z428KpSLo8TQSeFM18iEHMFCzfrFI=;
 b=eBlu+UgH06Ye01z5pouhQsXwFYcBtBCDW+IZ02ItR4KhhSynPkYjxqA3WW0y7rDY6iw7u8/1ffo1O/MMRWXIIkGSWUmCdOmCCSBE9KIf4BFDjY98b5jXI8yOXDeUSPs7YHrU1wDhpX8lmxXuQjlt2ffPHFgnrsx71Cg6W36sRssc10bLefuNwHXEueyAnShL5tWkEXGjXlrhJsEZVNkSVkQDYfV0cich9e0Smt52cMDF5Gmu/f4vt6TfrqikupdqOVk/3gerX4idLLeEtppzEuQQafLwpI4lo2HNM42+3phSwvQlwLHb+kDdl71BVONSQjb6msNxAPi+xkeUA5aaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 03:03:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 03:03:13 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 fs/bcachefs/chardev.c:570:44: warning: array subscript i is outside array
 bounds of 'struct bch_ioctl_dev_usage_type[0]'
Thread-Topic: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 fs/bcachefs/chardev.c:570:44: warning: array subscript i is outside array
 bounds of 'struct bch_ioctl_dev_usage_type[0]'
Thread-Index: AQHaIb/LJNlbpfWFU0Kygj2TWlcgCLCQnZqA
Date: Wed, 29 Nov 2023 03:03:13 +0000
Message-ID: <CY5PR11MB63920D9758BA66E85C43E263FB83A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311280933.lCa4jxa0-lkp@intel.com>
In-Reply-To: <202311280933.lCa4jxa0-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 800a86b2-f4a5-4749-568c-08dbf087ba45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cF6jYwIiGuydiYnnN3LRHsvR9Y2fg8jHU/HCQNj/ipLpJZSVph3en9O7Td28GPJ+VUmHTHilhqqaHofikPJzy/MSRDDRvvs0E5TVAUhZK38xEiGPCqjLWmYQWhOlPa5NZKNJ6cZt0Ley0Ti/EzRwFh4wFaFfSKxyVAegw3dUp88cWxYgBz+NmNykYvDEuUD6nKjX10afsLaTdE5d/IDCOTujtyyB37Ia9+FOoUDvn+3eA0Bc5U3AP3zPTQGmsVEutfPIUdkSlj22V+ZtXF4euN0i6leJj6swQWH58E45RvrcPVOCUByusHOVQlqZ4nZLlitJPKB07h2ons1xSFjH7sZALIAeFY4PbPc02/avcicGXgVHKzvMPfC910tEFd1bWhPL4tLDjeIFBa15y5sGdL2WEFrn/ShVguhhcLKXYDrxa9oXidPV7gtNhBDhKmyrJTMeBkkVIzjPNHRAidqMiOr8mTDJ5hE/RHLGhnC4RuO9IqjKeUxXOf4Ch37WR2thbO6mUgA9bZdl8yBRyxwXxpi1Pyt+tqJwMpF9FQJvWzLAD56T482ai4apJPewSb1a/0Wv5M0haynfgi1zImmETazDo17JECm7vDcBYCARBYNfmRoThEY0ZhNX9rw/LpioyerG67P8s5XrYeBw4woW3ob7GjzuPYEDVQnvo2qY5Lh36pSGOx/vXxK0BEOxlZaj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(52536014)(8936002)(8676002)(9686003)(53546011)(6506007)(7696005)(71200400001)(64756008)(66946007)(110136005)(76116006)(66556008)(316002)(966005)(478600001)(122000001)(2906002)(26005)(55016003)(38100700002)(41300700001)(38070700009)(4001150100001)(33656002)(86362001)(66476007)(83380400001)(66446008)(5660300002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DkNjl/e7jouw3W/wq6CgxXdUKyUw9xxbP+Cmno80dJzKE/W7oJCVEHEFhIFs?=
 =?us-ascii?Q?woVg+wNbJNz8SEfF27dEYKXQekLo+O+CuiLN7eVBoIF3bO8qDy519bze5iE+?=
 =?us-ascii?Q?Bp8c7LS5upuCRraVg+YSOib86E05txcVUaPn7Hr3hZnMfdYOKb0XJvnXhqsP?=
 =?us-ascii?Q?T9krYP+Y9RfW0gRHaaMEBNm5X4j/FJs2fJE39qub6jNEvxZvN3uHtLb8ylsp?=
 =?us-ascii?Q?iQhGLHOnjz+Mj/BCAC5eEdAIRvQb5ZpKPi3ZEtcX9vSZ2WBSZ3QCx+fgVQFB?=
 =?us-ascii?Q?wkGO9en0CJzILviQz30kAxbPaFgnRBDCtjIxQ0kYSwsUlbYipr047DT+3p8a?=
 =?us-ascii?Q?1p9VnbtJxid7W0EauFBX0xLrT1LRuLZDt4V4fhICevndjJ6IcvDK7FqGVLjR?=
 =?us-ascii?Q?3oDk6QwUrWdtJxIbJOr/5zmIrAphoHl2pkPBiacf4qgaCbyJwabbwBdXQpnw?=
 =?us-ascii?Q?rmaK7IiEZE0ibuqI/ndZvKHcpomgLry93h9yqXMWl+aQgaQTZhnhlSyqXJoa?=
 =?us-ascii?Q?5+nhrENttJKZ3az09I6zJ3RP+KoqeqIkc8ZWKcCk3fh70TrPL+JqqQ5gQjtS?=
 =?us-ascii?Q?HMYxOvBBqQjMJFuZxPRQFkyCgioaP386Wo63kKxhoDpvCy+mC8Iy4WMaouZs?=
 =?us-ascii?Q?WnqOy/k1+sKQ5B7CcfHWMF8Lzis5uns8TF7yqRIj47AKyyfmjMJjaBqxS0Kg?=
 =?us-ascii?Q?xXY8mv9ohXhAH0kP6B4Gi8oZr/aasxbrWL9DGkYUNSJVLaeQtf49PS+YOPqc?=
 =?us-ascii?Q?PmaACDMdlJmWO+vykOmnbMS3u10rHINwvi9Sw733kNHZN2DS6uOEAzk87UQ4?=
 =?us-ascii?Q?hnLkpBUVnGC05oVe2g0cF3Iu+0tZovqlEJNTKUwefhyTQEA0Y9YAEYrQ/1jX?=
 =?us-ascii?Q?SRopd05EXSGV2cgQKD8D+5vVsabMTqhHBCD4iWpgm9/rHJ5Dq1BbZqktX/2/?=
 =?us-ascii?Q?LFEnTp8j8uAG+T8LnwvtINMRBW5jHIca/ebKZN+c3U/JI/Jrvm/ca2pzTx/d?=
 =?us-ascii?Q?2FSaQGREvBKh0HfTpfft2QT4yn3IrHjhi3mk52KU4jqME9n6la+AoNeT16J+?=
 =?us-ascii?Q?M+4JnAONDxHVTvDAaoDJ4Oi/PYgsyWMCKL4W8RMZ0WLP6l/PtuYglH4g7Ekb?=
 =?us-ascii?Q?1+0n8z6f/e5RKvnEy1phF9DCRzlOkFFiJ9/p99URgKefYiOyC2bdqrNBWOxS?=
 =?us-ascii?Q?rMMDCgf1uC/0l7IdiKxIyLDWa/oMyknLfX4KUbl/FN3UiTpAjcOZJfNr9J2s?=
 =?us-ascii?Q?IfeOeE2hL6TE/EBG+aZpvzFcWx33Z5DV21gVmKB4Ks4mIAlmISE7p1j6Ueym?=
 =?us-ascii?Q?u0b8hfUQjCJXFV7YTHJw0cupZETYNDugNVSm+glmC/SwiihWRinkTVqhU+BL?=
 =?us-ascii?Q?Xa63o3UV9FjNxS/sGY2gRNetXuZYzXiIJ6IfZ4574s/7KcGueHWWJs0VPdkL?=
 =?us-ascii?Q?MleZ+jxWKkTcCI7eE8evEnGkXZ7UMk5hYPivh23jps3MAjAJoL6YdxGBR8Kb?=
 =?us-ascii?Q?FAWFExKITDo3oyLrpptOk6VzNfYjAvYKNYTzwV3/3l5PPUaLCRbiqpr5aeIO?=
 =?us-ascii?Q?kDpD4dzaygp+WO6+8LP1PdH0fd55+76KQ1syczCF?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 800a86b2-f4a5-4749-568c-08dbf087ba45
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 03:03:13.9141
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CUDCz3AwQmTBsz/DMCBJab56+AM7f7sl2RPei25ym7pLEaMd8C/yyIAS5/EF1sHYtOI1GvQFCVSPZWtNk7/Hnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-OriginatorOrg: intel.com

not_report

The patch enables -Warray-bounds globally, but not the original cause of th=
e issues.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 28, 2023 13:56
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [gustavoars:testing/next20231127-Warray-bounds 3/3] fs/bcachefs/ch=
ardev.c:570:44: warning: array subscript i is outside array bounds of 'stru=
ct bch_ioctl_dev_usage_type[0]'

::::::=20
:::::: Manual check reason: "has Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
CC: LKML <linux-kernel@vger.kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.gi=
t testing/next20231127-Warray-bounds
head:   cb7d8700da3e4c763ac30bfa34ee7dc143bd2758
commit: cb7d8700da3e4c763ac30bfa34ee7dc143bd2758 [3/3] Makefile: Enable -Wa=
rray-bounds globally
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231128/2=
02311280933.lCa4jxa0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231128/202311280933.lCa4jxa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311280933.lCa4jxa0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage_v2':
>> fs/bcachefs/chardev.c:570:44: warning: array subscript i is outside arra=
y bounds of 'struct bch_ioctl_dev_usage_type[0]' [-Warray-bounds=3D]
     570 |                 ret =3D copy_to_user_errcode(&user_arg->d[i], &t=
, sizeof(t));
         |                                            ^~~~~~~~~~~~~~~
   In file included from fs/bcachefs/chardev.c:5:
   fs/bcachefs/bcachefs_ioctl.h:316:42: note: while referencing 'd'
     316 |         struct bch_ioctl_dev_usage_type  d[0];
         |                                          ^


vim +570 fs/bcachefs/chardev.c

e1dde6a5c66159 Kent Overstreet 2023-11-23  527 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  528  static long bch2_ioctl_dev_=
usage_v2(struct bch_fs *c,
e1dde6a5c66159 Kent Overstreet 2023-11-23  529  				 struct bch_ioctl_dev_u=
sage_v2 __user *user_arg)
e1dde6a5c66159 Kent Overstreet 2023-11-23  530  {
e1dde6a5c66159 Kent Overstreet 2023-11-23  531  	struct bch_ioctl_dev_usage=
_v2 arg;
e1dde6a5c66159 Kent Overstreet 2023-11-23  532  	struct bch_dev_usage src;
e1dde6a5c66159 Kent Overstreet 2023-11-23  533  	struct bch_dev *ca;
e1dde6a5c66159 Kent Overstreet 2023-11-23  534  	int ret =3D 0;
e1dde6a5c66159 Kent Overstreet 2023-11-23  535 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  536  	if (!test_bit(BCH_FS_START=
ED, &c->flags))
e1dde6a5c66159 Kent Overstreet 2023-11-23  537  		return -EINVAL;
e1dde6a5c66159 Kent Overstreet 2023-11-23  538 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  539  	if (copy_from_user(&arg, u=
ser_arg, sizeof(arg)))
301e0237cadfc7 Dan Carpenter   2023-09-14  540  		return -EFAULT;
301e0237cadfc7 Dan Carpenter   2023-09-14  541 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  542  	if ((arg.flags & ~BCH_BY_I=
NDEX) ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  543  	    arg.pad[0] ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  544  	    arg.pad[1] ||
e1dde6a5c66159 Kent Overstreet 2023-11-23  545  	    arg.pad[2])
e1dde6a5c66159 Kent Overstreet 2023-11-23  546  		return -EINVAL;
e1dde6a5c66159 Kent Overstreet 2023-11-23  547 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  548  	ca =3D bch2_device_lookup(=
c, arg.dev, arg.flags);
e1dde6a5c66159 Kent Overstreet 2023-11-23  549  	if (IS_ERR(ca))
e1dde6a5c66159 Kent Overstreet 2023-11-23  550  		return PTR_ERR(ca);
e1dde6a5c66159 Kent Overstreet 2023-11-23  551 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  552  	src =3D bch2_dev_usage_rea=
d(ca);
e1dde6a5c66159 Kent Overstreet 2023-11-23  553 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  554  	arg.state		=3D ca->mi.stat=
e;
e1dde6a5c66159 Kent Overstreet 2023-11-23  555  	arg.bucket_size		=3D ca->m=
i.bucket_size;
e1dde6a5c66159 Kent Overstreet 2023-11-23  556  	arg.nr_data_types	=3D min(=
arg.nr_data_types, BCH_DATA_NR);
e1dde6a5c66159 Kent Overstreet 2023-11-23  557  	arg.nr_buckets		=3D ca->mi=
.nbuckets - ca->mi.first_bucket;
e1dde6a5c66159 Kent Overstreet 2023-11-23  558 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  559  	ret =3D copy_to_user_errco=
de(user_arg, &arg, sizeof(arg));
e1dde6a5c66159 Kent Overstreet 2023-11-23  560  	if (ret)
e1dde6a5c66159 Kent Overstreet 2023-11-23  561  		goto err;
e1dde6a5c66159 Kent Overstreet 2023-11-23  562 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23  563  	for (unsigned i =3D 0; i <=
 arg.nr_data_types; i++) {
e1dde6a5c66159 Kent Overstreet 2023-11-23  564  		struct bch_ioctl_dev_usag=
e_type t =3D {
e1dde6a5c66159 Kent Overstreet 2023-11-23  565  			.buckets	=3D src.d[i].bu=
ckets,
e1dde6a5c66159 Kent Overstreet 2023-11-23  566  			.sectors	=3D src.d[i].se=
ctors,
e1dde6a5c66159 Kent Overstreet 2023-11-23  567  			.fragmented	=3D src.d[i]=
.fragmented,
e1dde6a5c66159 Kent Overstreet 2023-11-23  568  		};
e1dde6a5c66159 Kent Overstreet 2023-11-23  569 =20
e1dde6a5c66159 Kent Overstreet 2023-11-23 @570  		ret =3D copy_to_user_errc=
ode(&user_arg->d[i], &t, sizeof(t));
e1dde6a5c66159 Kent Overstreet 2023-11-23  571  		if (ret)
e1dde6a5c66159 Kent Overstreet 2023-11-23  572  			goto err;
e1dde6a5c66159 Kent Overstreet 2023-11-23  573  	}
e1dde6a5c66159 Kent Overstreet 2023-11-23  574  err:
e1dde6a5c66159 Kent Overstreet 2023-11-23  575  	percpu_ref_put(&ca->ref);
e1dde6a5c66159 Kent Overstreet 2023-11-23  576  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  577  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  578 =20

:::::: The code at line 570 was first introduced by commit
:::::: e1dde6a5c66159611032d29c063714c0f207f2ba bcachefs: BCH_IOCTL_DEV_USA=
GE_V2

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

