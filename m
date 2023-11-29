Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED331FC2
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Nov 2023 03:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+j/eHwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701226978; x=1732762978;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Aq5P94SpkvS53WKuVD+nJ8dFvfPJBDDGrhmQCRd6G2k=;
  b=f+j/eHwohHCqhEcFS+t17Pt8qu4eetQtNGX9cQ4gqeasqzwGfzU4HJCm
   WisHnfCJTEBWjOugwHqeqBriQsD/snRW9E9cY5cKKeg+hYkhmpFZuG8FC
   KsqIrAJ4B18SC7elR5wzBAIsiHvlkwY3bWnMgmdpsaNk66amZ7nDr+xD4
   +bENjf8v0rToOH6OSdXZXjW/7LlPtj2SH1LyLaQ61j0Z9tXJLs1zoOrXZ
   vIWYjx1NnTak2uh0t/k7RVT2cl69H5xHdpoVbpDogzXjG6WUiVq0zO9N3
   8dsVo7US78D4oFlo6iu0xyGdfqgum4bvp7LYJUy1eABsYQruVxT46dFWH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="396985516"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="396985516"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 19:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="1100345557"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="1100345557"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Nov 2023 19:02:57 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 19:02:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 19:02:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 19:02:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 19:02:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU6QxXO7ZRg1YHYgq8Pm26mKkaGAPDje20X4rUH/OK2YrAT1t0Umdt3NC57j+S864wLcijrWhYlrYKHVyl1oVQGfleXfsfXxB8s+7duHFFLDh/x3kQ9hdUDpnZmy+iIOxF6gnqrd0pNFbDCKm3KSXxD73TlV1iXRtSZrPCDqRkch5ohQTzQlmWvYX1L1G5hTONO5Qa4FVLMOZ9l4BpluzaCCcd2ePIulwsxcW6AjfBl90qS38ld2Z/R/rJ86oKCi8AmIKR1ehY/16eDk3kNhTea2X/vQUeppClx87mQZK9eHQ0TTzR6VDLKaZ42tw6p/7IwQ00uZl9SrQRqp2qpgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQU70KIX63kew8DnyL9+OCpJ5VHMvjACPnSxN7OqpNg=;
 b=CKqEbkQjmPl9+xPRSnaWmTXGAc4tbR0I6zjgElwuZmKODPVXFlkuxhkT6uV1enBN6Bq99EAjRKGrL2paTIusjHCAbRV78L3VB2i7p5Q8o7kDbHQoz0I99Yuc738or1AWs0alMiB60Rui57n7YiuV4bPvB46FhpRdXWj5qZfOWdFIwjQZxAAWFzo2lKGmCu/8FFjr4MFrd4EGt968yHS1osrI08eR5o/U4US30XDIs6BKO8SeVlwf3zEGX5VaKGX3DvwjyRaw7VQJWQ/ikYcN8jdeqY0Y1D8SaVHWyJVOuiq2v7r6G36Sw8Ww037spcgeojI2y5fQH/Wx6NaZ/RFAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB8113.namprd11.prod.outlook.com (2603:10b6:8:127::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 03:02:54 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 03:02:54 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 arch/sparc/mm/init_64.c:3088:31: warning: array subscript -1 is outside array
 bounds of 'char[]'
Thread-Topic: [gustavoars:testing/next20231127-Warray-bounds 3/3]
 arch/sparc/mm/init_64.c:3088:31: warning: array subscript -1 is outside array
 bounds of 'char[]'
Thread-Index: AQHaIcG4UltVUVlEPkGQ5t4L2kLWmbCQnShQ
Date: Wed, 29 Nov 2023 03:02:54 +0000
Message-ID: <CY5PR11MB639252CB0E8C01E503EC111BFB83A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311281123.fsH3uu8M-lkp@intel.com>
In-Reply-To: <202311281123.fsH3uu8M-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB8113:EE_
x-ms-office365-filtering-correlation-id: 3c03b3f7-81cc-47d3-f078-08dbf087ae99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5+hcOtJgJZ1FhAQOviKHpFN0O64S8qQtPVWL5Hfp+iJajI77+WJ17gYZYYyvIT+f4WzSsatGYSPqAOpaer/23VgvPnW4SL97QCZI7xbBTgDr2qY4OdM8cNrZr1WXsA/oAmoOEgPdTw8vJVnoHUVKwTG50QgmlyDiqz+m+URJzak/q5OFPtVABkGN/YdnyZUNrqhq4hWDL3bDCO1Dv8UmVyaCxnoYiyqpue/srL229zLHXno2LHiI4w9unPyspVpCjFY+A2lE6u9dpgsvUh+zxw87px+6X/628itzn+y9GZAsHMy6mLdHdjSJCYdbGziwQ7AOxRov73twiDtUSe4v9mdt13AMY3N1ZYTPfK0QXiqubRFHWXgbnt58dDM0LqChTCnAVX8G1LqnTnnXEJ/w60TcNLTtQ0OBbOJZKtHaqV44Fb20zFdeNu0H2z4lnlZw1nIKog9mXj45Q+INq/e0MyncPAP7xWsTl6D+xFP7E5iIDOOnBBCl+UYJ/BxOTL/k/vc1Yqjgu2IPi3vn4N1nFBDfDH2hhwvVcJvwnxKKVZS5nfDj0X3FLtf2yf9zT71HY5oxEpJfEaQcHHuZuEcDSYNtu3gijhHfng0lpMNbT6bRcfApaS3HoulUpMhYF/QiucnV4maHMUfONT2rog3IXbpQnpVFC7l06mEIs0dJIMH9uFiZS4niU2wPuT//5SD0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(451199024)(64100799003)(1800799012)(52536014)(8936002)(8676002)(9686003)(53546011)(6506007)(7696005)(71200400001)(64756008)(66946007)(110136005)(76116006)(66556008)(316002)(966005)(478600001)(122000001)(2906002)(26005)(55016003)(38100700002)(41300700001)(38070700009)(33656002)(86362001)(66476007)(83380400001)(66446008)(5660300002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ST+WllvHby1E2UWCW2OLQZqgIMCJy+DVGk/8S2IVSrcCcK36CSiI7DpdKs42?=
 =?us-ascii?Q?8NofuxN32fQCuAV5+4xqHAB02VdtCDhZnO+GzFt65Iauhys6O3/rGXzqirz7?=
 =?us-ascii?Q?LrloTUGidZNToqG6m2jZaZPBE4bC2GPseCEaL1Z/xbZQqCPnbz7GKjipmkRA?=
 =?us-ascii?Q?E40GcAK75DgqR3Negvw9WxYTlWv+zvZGbhNWBvvet5WrKj4aR+ZWpAwOi+Pc?=
 =?us-ascii?Q?yzf81Cagag9dG82XAdivwGOhcdWIyz4viPEtIhJEWuapJHR+RpMuHVFJOcV0?=
 =?us-ascii?Q?G0/knlLiEjJSsxMTL2w6bsmKuf2qb5ACEKXBH29OKWH6Bp0ApQVUgwNS7kGZ?=
 =?us-ascii?Q?/vBed37gfo050ECS1xPtHExEITKMsLzRYv86W5ZzRkrv16mehUuGCTd8c5Wp?=
 =?us-ascii?Q?0BrCpj3xEsyfzYyIrGadBkzsOgr0RfIHKLisFMURQU51b9j31Al7ufDTIP0I?=
 =?us-ascii?Q?6Gox4GE4yy73+QGGcMQ3TBts6spMXpFojY5tPefUnKpRFtJ+UD1LkFBIIwth?=
 =?us-ascii?Q?pnuKbp5KcVJMZopZbs37gM+pFQpZrQFx/6xTjscCt/rG+3LSsURPeqykT6/M?=
 =?us-ascii?Q?2yIaQC9m/y93gYhPUPTr3Cj8Z51IPu0o53LcY4ukWTXIYigNIr/BwEktkCcr?=
 =?us-ascii?Q?5PoItMx9Bx/EH8bHx+oBjJBTYkLElkinZuz52wjwrfKWL/YkOPGfY+yfg6X8?=
 =?us-ascii?Q?Lvu/zfij0kNFYZUSOB+Ztc11eiaM6YvgF0GnJMchnpFk23ZnkkOFoJTkr37F?=
 =?us-ascii?Q?xaKhSzcbHXDZsW3DaT6DPYLDrC7/0Le7jgGxPYYwHrPpNaPlajs2/nvmiayy?=
 =?us-ascii?Q?mUuy27T3gBatkYkq32CMSioJwh0ARjEPzgqcdcf9Il0RT0GpxdcihNKk3VIk?=
 =?us-ascii?Q?+k68U87rQAIpfkp4eqA3lYsqr6GcyBpVmeem77OWb44H3UTpW1CSNsYQLf2C?=
 =?us-ascii?Q?jCCeodPThQi8HcA5XiTWXk4KvcMd/zKjaaCemz9eZwRSJTmGyBxf3clLcZhK?=
 =?us-ascii?Q?asJSy2+/ymU6g87AW6Usm9QyyPU7vsI9GzEXAXBo08E5GWeDGXof3hAGs89A?=
 =?us-ascii?Q?ljRfd07aHOxWrZj4u7LgsSZra0T0Or4t0mArRNlTKbuilHe4KRi7QaqYhR9L?=
 =?us-ascii?Q?bZTGn8GBRTh/teIPZq6Dwui0Blty0XPtmorBhCbNiDgLpEJ3/IbfWqes4e3+?=
 =?us-ascii?Q?PjzjHMeNkYvxLjlNHOYaFMebqegbLM7iOk89gOIa/i/fr//vSOAwSdscp6UU?=
 =?us-ascii?Q?rYjwCoV+saR3A3ok7PVpFEUATvPKuWzxGOWly0TmWGCNWE4bO01kGeiV5bod?=
 =?us-ascii?Q?UrUYnow6NnhxiWZvfkoGvQcmdhGnKA+0LAf2yXB7Q6gv9fdqnHKpbsiUi4zG?=
 =?us-ascii?Q?Muk/nUWhdEGQBDLyf3n45YyNWZ/N0Pu3usIVvm38zaPCuyrD+q9xjwC3zua4?=
 =?us-ascii?Q?kqFjpRjTPjCBluKt4Sm8hSxR5mhFPt6NF463A1eLPpnXPRbxtuIybCqt/eZl?=
 =?us-ascii?Q?tPz77Wn3uKT8PmRAnQrfcvxXM3EC/Y+u2o9BcUNjKaGbAcdsuPgFZzls0s13?=
 =?us-ascii?Q?daf7Ida+e6tTtdFcrwR3WpEzyQpdXtRRUFrPz/Z2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03b3f7-81cc-47d3-f078-08dbf087ae99
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 03:02:54.3562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EylMs6vkiBiaau+I98IX69hO3pmMMDGKtswgC684EWb49wsN9PM1aqodmsK+LlbJS6SBycLBCJwoDbUd44M3bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8113
X-OriginatorOrg: intel.com

not_report

The patch enables -Warray-bounds globally, but not the original cause of th=
e issues.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 28, 2023 14:09
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [gustavoars:testing/next20231127-Warray-bounds 3/3] arch/sparc/mm/=
init_64.c:3088:31: warning: array subscript -1 is outside array bounds of '=
char[]'

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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20231=
128/202311281123.fsH3uu8M-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231128/202311281123.fsH3uu8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311281123.fsH3uu8M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/mm/init_64.c: In function 'arch_hugetlb_valid_size':
   arch/sparc/mm/init_64.c:361:24: warning: variable 'hv_pgsz_idx' set but =
not used [-Wunused-but-set-variable]
     361 |         unsigned short hv_pgsz_idx;
         |                        ^~~~~~~~~~~
   arch/sparc/mm/init_64.c: At top level:
   arch/sparc/mm/init_64.c:2644:6: warning: no previous prototype for 'vmem=
map_free' [-Wmissing-prototypes]
    2644 | void vmemmap_free(unsigned long start, unsigned long end,
         |      ^~~~~~~~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
>> arch/sparc/mm/init_64.c:3088:31: warning: array subscript -1 is outside =
array bounds of 'char[]' [-Warray-bounds=3D]
    3088 |         code_resource.end   =3D compute_kern_paddr(_etext - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/sections.h:6,
                    from include/linux/interrupt.h:21,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/hugetlb.h:10,
                    from arch/sparc/mm/init_64.c:16:
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:35:32: note: at offset -1 into object '_e=
text' of size [0, 9223372036854775807]
      35 | extern char _text[], _stext[], _etext[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
   arch/sparc/mm/init_64.c:3090:31: warning: array subscript -1 is outside =
array bounds of 'char[]' [-Warray-bounds=3D]
    3090 |         data_resource.end   =3D compute_kern_paddr(_edata - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:36:32: note: at offset -1 into object '_e=
data' of size [0, 9223372036854775807]
      36 | extern char _data[], _sdata[], _edata[];
         |                                ^~~~~~
   In function 'kernel_lds_init',
       inlined from 'report_memory' at arch/sparc/mm/init_64.c:3100:2:
   arch/sparc/mm/init_64.c:3092:31: warning: array subscript -1 is outside =
array bounds of 'char[]' [-Warray-bounds=3D]
    3092 |         bss_resource.end    =3D compute_kern_paddr(_end - 1);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/sections.h: In function 'report_memory':
   include/asm-generic/sections.h:41:13: note: at offset -1 into object '_e=
nd' of size [0, 9223372036854775807]
      41 | extern char _end[];
         |             ^~~~


vim +3088 arch/sparc/mm/init_64.c

f6d4fb5cc0475c bob picco 2014-03-03  3084 =20
f6d4fb5cc0475c bob picco 2014-03-03  3085  static void __init kernel_lds_in=
it(void)
f6d4fb5cc0475c bob picco 2014-03-03  3086  {
f6d4fb5cc0475c bob picco 2014-03-03  3087  	code_resource.start =3D compute=
_kern_paddr(_text);
f6d4fb5cc0475c bob picco 2014-03-03 @3088  	code_resource.end   =3D compute=
_kern_paddr(_etext - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3089  	data_resource.start =3D compute=
_kern_paddr(_etext);
f6d4fb5cc0475c bob picco 2014-03-03  3090  	data_resource.end   =3D compute=
_kern_paddr(_edata - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3091  	bss_resource.start  =3D compute=
_kern_paddr(__bss_start);
f6d4fb5cc0475c bob picco 2014-03-03  3092  	bss_resource.end    =3D compute=
_kern_paddr(_end - 1);
f6d4fb5cc0475c bob picco 2014-03-03  3093  }
f6d4fb5cc0475c bob picco 2014-03-03  3094 =20

:::::: The code at line 3088 was first introduced by commit
:::::: f6d4fb5cc0475c36437a618db31cbb7f2bf7c282 sparc64 - add mem to iomem =
resource

:::::: TO: bob picco <bpicco@meloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

