Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C520E6
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Dec 2023 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caRZY1tv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702865108; x=1734401108;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TFOPfVlBqDB4LNNhEX3oihdAvZJk/lxXuzerBwZUNHc=;
  b=caRZY1tv0jpuobiPHdA+QVmXbyifMduftVdByU/uxnaXzDoPDWg1+LLf
   bsByZkYRVQAbMaa079nE5ZZt1fwjf4eQ+ty9iB1fOE7gpuQlv13lEKZft
   lMpFMiVtBT9EaRNOqo+1dOT/GyaYvCSxXn9zxdTwx5MwCDpfxzmXo4h/G
   HL302UOrHqeK/INJh7sIPP4MecEEBvJH39L8Rtbz7XtX3uLPegQbwDG8S
   odOi12jahroPlxIUaM0iq7+WlMiqfvIvUm5uayOKeoxAxn9+AenUqw8q0
   axqdMglOyRt6jeLuO8veh3XElOh/iIlthtwSxo44bzMIh+EztN1GHjrE+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="461900178"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="461900178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 18:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="17000741"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 18:05:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 18:05:07 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 18:05:07 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 18:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8fdiQj9bG4cRwQcXFzRyfmiaWPL7Mn3qUIVlLa7IH6QxL1R8TKNX1z54kexP9a5b0GfMvs2EbbIJXiq37q/61UNvuVXZEQA0nC7ekeYXrtV/HWLMpob3KaC9K3t6InVsoXFdh/gJObxybjN/kA8wxVrloE/wRTW81uyV1dCIUumNjuT0/jjlaHJ8K5DyJ/d1N28v51+auIC9V/ixeUhd9mH3zYDiJEG25eulT94QezLNvBs5Ou4vK39ZZ/rzmmy6g8YM/aowztxy1upGcKlaflKd6gtQMgS08GlKKTJmz+E4RDo+DwQRSV2UBcwveShnpyHPD1enyX8+xP0iHCCGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRENCS5iebQ2vjibpCkh2oqM9tANU/3oSUQUCS9wTUY=;
 b=CUfoE/ZwEAwH5PBGD9NYYa9+2dV6V65jhqxRnoXmre50FDey8UE0uYjiYfiXuPYLnV+omPUM4VGTL6H2riK38F8YGpnUtdyCiEqikazSZb1lJuzz66E6pgmY1TVz14X/xJu/NQH0chpspa3pCzu6biMFgXYprUjdTwESJ2TGtGveixYjSZFMXRmSNacU78Gbw83M9L20e8qxcZN8mcfWB/h9SIT+Jrurt1g6jeLjCmFby5ZPfwSUJrjC6xhkIkBlOayrLIkwHtAU3sHC4H5pmmSLSsF7fMh0k9JZ1zcZCrKvOd9CwAN3S/lF5SrFLeouApm2jjlFUOpbaotBE08/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 02:04:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 02:04:59 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE:
 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:230:23:
 sparse: sparse: cast to restricted __be32
Thread-Topic: drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:230:23:
 sparse: sparse: cast to restricted __be32
Thread-Index: AQHaLwQUIH+49FLBdUKxUkpWeijtt7CuTwlg
Date: Mon, 18 Dec 2023 02:04:59 +0000
Message-ID: <CY5PR11MB639266B76E9649EF0D619C40FB90A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312151110.d3oaWWnG-lkp@intel.com>
In-Reply-To: <202312151110.d3oaWWnG-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA2PR11MB5051:EE_
x-ms-office365-filtering-correlation-id: 76b9e4df-1a04-4fc2-8bee-08dbff6dbd35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A7pTZ9jWolh07JXf0NPhuCsUdR27SHhRG8XkRoWti5EmELB2go72l6VbKSuDPyRL+P/NIGsY59C8YdqTVENwZ6GrXgjqKiAhrZxPV+gKOlGAJsnhuDJ0KM5fTfp8oTttymvBlckp6UDGj/LOzeFQUh1xFMLF5dMz4CX5N9oFSwmWKm4jGBe2KEBPamyUrcWkqKv5/pQ8xecl4JAb6/GpR/o1U2bjfJIKemtO7FTmjRmdofSAX6zhPOvc52G95g2YzriQvwOSz/v47egzbEPUz/sIa5tziu3bACD73OlI6+097OYu9GUacFrJOv+2KzlNTrXLODKyET1UeJkKKkyr+zx0zaeb8zetxYl4d27zkxEoiGJw3xD7BzqqbVeICZy4DYek1E/vI/YnyBlLd3Lu2kkPXeWExgD3SmhTt73fdJ4mZPIG+3WfTQMssJjphgllS38FBpKxqntTj4o5on7RVV4yKCxSb4gQmb9MNVt5jwC2dtt8xjGIwGHuLaruFAeetpVuEMM/eWVX2BgkZsJK916avaMloH1CP1Yp8Sz8iWrq0hn5s+vZpzAq+C5obT56Ow4DotQK8H/tOguIG8p3fJ1qf6gHsMdv2OUxlr5h1DVlgkiDX6mkaQPWY1Iv9snLI6ZNwNb4t/D/Z7L+PQo5j9cK+ZPxLJEvHPOSXC6I27lpzoQjmRFC2hACNn9XgHxy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(55016003)(26005)(82960400001)(71200400001)(38100700002)(122000001)(33656002)(86362001)(38070700009)(83380400001)(52536014)(5660300002)(9686003)(53546011)(6506007)(7696005)(8676002)(8936002)(66556008)(76116006)(66946007)(316002)(66446008)(110136005)(64756008)(66476007)(966005)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DTy6DR83r9i4fY1ZJy6Siyom5T7701I22kFLjSVKAEg1DlT8+i9Qi2Fu0vCv?=
 =?us-ascii?Q?yge1fNy6yAKtdvrLm1xOoRc2bMa1y5x3/8DxQFoftpEyIrGR3xRyR47ga0je?=
 =?us-ascii?Q?YaDWRlfhGjkuHHMkH2yLQsCptMrrOSV27KVYk+rt/FesVF5GlgE6p+X5Vl4l?=
 =?us-ascii?Q?akWRiVDH1hhWnRVRsyBb3d1Uc8CT7f38lvToWDhBmIgVUgBOzulNoE9HJc4n?=
 =?us-ascii?Q?kj5n+21DsF2HbUZRWKa3K0c7MA4FfoffEepSPCpIUr9q3OCYxey0D71ujuVv?=
 =?us-ascii?Q?+cxIYdvpvyV6jd905e860PTHchTrltPkETU2p3hjz3cdi1eUKDQUl8mBAoHZ?=
 =?us-ascii?Q?s0JxbwheJ9zAaTlb6zqZfBy2cFGKTkOXwv1sm0SteiAtzdgmeZt8sYjNglow?=
 =?us-ascii?Q?Othwg9VcYxuWBXZCPAUQVhCWZfFMHcxYYMbOdFWO1xzlNeXQVP4r9Fv+Zsta?=
 =?us-ascii?Q?pv6x+B+z4dAS4W/Yd2PKnfBt9NRJGMVChnwSGuP0ulMihtTgZ9WeYch9obwd?=
 =?us-ascii?Q?PpAFSNvYMZvyeaBPoD5yvyo6UYN879o9BAkcrjyVkgow7jktqg81e5v4XMK+?=
 =?us-ascii?Q?3rQktRUh2H85Th3m2BR6/mycDRyoDkE5eSqyjp6yCVigodjFWB3mkSiKiUla?=
 =?us-ascii?Q?1gm0YQc+iZFB5hq58n6DuJnA1kJB4MTaIsOtJJpES1OaYNnRBer0H2YA8phR?=
 =?us-ascii?Q?f714iOSsjtHridEPLS8y0S3SQ72Vpx8YfY4rhBEfQjokDya9DwiBWjvihAHR?=
 =?us-ascii?Q?lhQO8PMTh1U1seOy4HgnHPjbbxJLfpVeKdGkzyFGHz3lIR1m28geVPtoKpeh?=
 =?us-ascii?Q?8IE1vbS5AIVwC2gn++kIfThJ9py8nr7MfrtY1jGW3hZd5pkw07h4MWDeZWvH?=
 =?us-ascii?Q?GJ+zpbiivwvn1QdDLQQ5cWLiBoJrTA+2YET08DzZbLhXsyNXx3qVcs0k15wy?=
 =?us-ascii?Q?MaI6Vzbjpfk0fgJzNs+k/9XvdlfJDxcQhQgeXc0PYarh4aVyZGW2JE9z0WJj?=
 =?us-ascii?Q?XWiwMINw4spGGcuEekt56gqTreAIVZhM3Ka47Nlc8aWXN0O546+eqU3niNtj?=
 =?us-ascii?Q?ZIyqYBlvKWP3lM3wmw7PHATAlNZzScKkDkDgrVjUFSd6kmdvC48KEEA38jda?=
 =?us-ascii?Q?m2v60ZeS/Ov89B6xVwBN/b09RA8u9BQSpt0ou+h1kZe/UCXDYI6F0LEVk2ae?=
 =?us-ascii?Q?NdMKeJaMxVh5WH1xLIy0/m9OE3Dy7t8/Yw+yZIMpagKbx1k49dlf3/KPpRH0?=
 =?us-ascii?Q?K2qzw7iJLCmbFmOrTO+noceLIhghi4/bk5D7cRO0tKx/AyYETswFHBhcBtZa?=
 =?us-ascii?Q?bzFoYC4tqjrgRaCr+s5l3aSGBLiv7LWO/Z8Mjekyr05Zbn8Di0Z2LJRXZBqe?=
 =?us-ascii?Q?AXTf3K5b8BLTU1CEO6utJI32q2lEHpLNiVwDDybILHfDrQukrf3RkuQh4Yj8?=
 =?us-ascii?Q?Ayr0j/faAm+dDF61B+gbG6PATCf9jk9IaNOQlFBgQ3999X7SG1dRUmRNY4Ni?=
 =?us-ascii?Q?cEK4CM6GWdNWvTTZmFPbVlmm1eawQiJ5pusp2rZ/YlqDEgbFHUqmBzYaKeQn?=
 =?us-ascii?Q?UGwrHKDM4PADHjSJwr7eDns7Pxhf1fbdKDYXWouR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b9e4df-1a04-4fc2-8bee-08dbff6dbd35
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 02:04:59.3839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXaDilnsN18KAkvoDVmJjnlivP/twUIal5GmMbK1u7oO65y97naeBPKIG9VPvr7WkzeyEmVqSWOQtxyAAJgJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
X-OriginatorOrg: intel.com

not_report

only kconfig change:

drivers/video/fbdev/omap2/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 15, 2023 11:08
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:2=
30:23: sparse: sparse: cast to restricted __be32

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   976600c6da56c488776c9ee2a5733ae9736e2a75
commit: 7378f1149884b183631c6c16c0f1c62bcd7d759d media: omap2: omapfb: allo=
w building it with COMPILE_TEST
date:   6 years ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 years ago
config: sparc-randconfig-r113-20231112 (https://download.01.org/0day-ci/arc=
hive/20231215/202312151110.d3oaWWnG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312151110.d=
3oaWWnG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312151110.d3oaWWnG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:230:23:=
 sparse: sparse: cast to restricted __be32
   In file included from drivers/video/fbdev/omap2/omapfb/displays/panel-so=
ny-acx565akm.c:24:
   include/linux/module.h:138:14: warning: 'cleanup_module' specifies less =
restrictive attribute than its target 'acx565akm_driver_exit': 'cold' [-Wmi=
ssing-attributes]
     138 |         void cleanup_module(void) __attribute__((alias(#exitfn))=
);
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1545:1: note: in expansion of macro 'module_exit'
    1545 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_drive=
r'
     293 |         module_driver(__spi_driver, spi_register_driver, 11-    =
  |         ^~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: =
note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   In file included from include/linux/platform_device.h:14,
                    from drivers/video/fbdev/omap2/omapfb/displays/panel-so=
ny-acx565akm.c:25:
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:19:=
 note: 'cleanup_module' target declared here
     913 | module_spi_driver(acx565akm_driver);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/device.h:1541:20: note: in definition of macro 'module_dri=
ver'
    1541 | static void __exit __driver##_exit(void) 22-      |             =
       ^~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: =
note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   include/linux/module.h:132:13: warning: 'init_module' specifies less res=
trictive attribute than its target 'acx565akm_driver_init': 'cold' [-Wmissi=
ng-attributes]
     132 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1540:1: note: in expansion of macro 'module_init'
    1540 | module_init(__driver##_init); 31-      | ^~~~~~~~~~~
   include/linux/spi/spi.h:293:9: note: in expansion of macro 'module_drive=
r'
     293 |         module_driver(__spi_driver, spi_register_driver, 34-    =
  |         ^~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: =
note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:19:=
 note: 'init_module' target declared here
     913 | module_spi_driver(acx565akm_driver);
         |                   ^~~~~~~~~~~~~~~~
   include/linux/device.h:1536:19: note: in definition of macro 'module_dri=
ver'
    1536 | static int __init __driver##_init(void) 43-      |              =
     ^~~~~~~~
   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c:913:1: =
note: in expansion of macro 'module_spi_driver'
     913 | module_spi_driver(acx565akm_driver);
         | ^~~~~~~~~~~~~~~~~

vim +230 drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c

f76ee892a99e68 Tomi Valkeinen 2015-12-09  222 =20
f76ee892a99e68 Tomi Valkeinen 2015-12-09  223  static int panel_enabled(str=
uct panel_drv_data *ddata)
f76ee892a99e68 Tomi Valkeinen 2015-12-09  224  {
f76ee892a99e68 Tomi Valkeinen 2015-12-09  225  	u32 disp_status;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  226  	int enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  227 =20
f76ee892a99e68 Tomi Valkeinen 2015-12-09  228  	acx565akm_read(ddata, MIPID=
_CMD_READ_DISP_STATUS,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  229  			(u8 *)&disp_status, 4);
f76ee892a99e68 Tomi Valkeinen 2015-12-09 @230  	disp_status =3D __be32_to_c=
pu(disp_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  231  	enabled =3D (disp_status & =
(1 << 17)) && (disp_status & (1 << 10));
f76ee892a99e68 Tomi Valkeinen 2015-12-09  232  	dev_dbg(&ddata->spi->dev,
f76ee892a99e68 Tomi Valkeinen 2015-12-09  233  		"LCD panel %senabled by bo=
otloader (status 0x%04x)\n",
f76ee892a99e68 Tomi Valkeinen 2015-12-09  234  		enabled ? "" : "not ", dis=
p_status);
f76ee892a99e68 Tomi Valkeinen 2015-12-09  235  	return enabled;
f76ee892a99e68 Tomi Valkeinen 2015-12-09  236  }
f76ee892a99e68 Tomi Valkeinen 2015-12-09  237 =20

:::::: The code at line 230 was first introduced by commit
:::::: f76ee892a99e68b55402b8d4b8aeffcae2aff34d omapfb: copy omapdss & disp=
lays for omapfb

:::::: TO: Tomi Valkeinen <tomi.valkeinen@ti.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@ti.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

