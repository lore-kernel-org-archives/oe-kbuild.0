Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C24817CB
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 02:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHvxt/r1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700621520; x=1732157520;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=K5XaGoaRdEX4Np9uPTsJIXxRiNLlpD5ykSNPTOqtouk=;
  b=jHvxt/r19hSCtw+fb4lPjDlXGcbkk3uHecNVeQwTsaZnwTfL6jrqDlQN
   OlKjVdPTXe4ibcSz6QhTA74qtTpuMj0Hk88HfjeNaZH/TqfK3YTHCpmkb
   uVLy39DKXw0ZYxgeoXpYo6GzOrLKf0rLsxFQMdZ6wX5NMiFJm00M8vhr8
   v9oiRBtvnrJXCIkNL+eX0VfEb46pnRsKDGMYx287rHGESX//cnd4ITj+P
   A2PMfGOAVKahVw8774USoBINalcytTiDjZj6l6JQpBKJKMGjqmJBY0jpA
   7hB0Kw/ASoEWvT4An9iv/cZ6BSV8NQSl62WRVgRcqJYvtpzVz3sO+iA6q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389119491"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="389119491"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="795953050"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="795953050"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 18:51:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 18:51:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 18:51:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 18:51:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 18:51:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzC7uXT23OuNUQoDFuas5Mixgl2wi3dr5U9jMAtWtub8Pgy8K+4eEnw/W9m82Pgj/6O6voNcEvKulDQc64T4NgaPQ6tisQeuK2kpVRRq/a1stC8DZGbiBdOF4soeMZo5eltBPEkhU2uSWZ+OHVshS22rciWQJd8z26DZAO6TNg4mqiB8y/59F9HgchWWhJ1AeSQclUZnACG2bsaMwv3YSGmJcrC+tifpSpVDlO4wGJCrl70DfVG6qSpNbtyUZ5rAkaZgzOVDuekewzfrkoRBB60ZQkojdHM2qc5rm9Ms58iWYoj3rgezleVRAkRAgGSATE6xaX+Gy6Q/is9hck8UhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogrMVBB5RrROXH2H80uFCocY54wtRuQDpQc7jqZd2R8=;
 b=dGUJ2iQCOo62sjP+ro0PSSmaPnCK+GWNeDu28udzODfK4S2GhIP/zjYTO+rd0ONS+mdb8FN7hTleKOBWH5wgkJ7VXIomkGLHtoLYivAx2zUHvFD7tYCe8yOw6ehuBI0AtCjH/KwGXy4EOF74+Uc/G1t+8+a/gzDYXqNe8MH+V5jypT0hyl2bgu3zxC8mYH73FdZcHP/k5s6lnnxPdJ8uNpUSN3KGUZdBB8NkYHRdzUd9QsDkBcNRAfOCNWXRFMsJS+pQbqSOp1tt66tQ+2a4tZVZq6rcK1GO8VX2oP1T6qJuYnI82KAOMC7KUSHl+pE/qwMT+Vb205XypikzksOgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 02:51:49 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 02:51:49 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/usb/typec/ucsi/trace.c:1: warning: no structured comments
 found
Thread-Topic: drivers/usb/typec/ucsi/trace.c:1: warning: no structured
 comments found
Thread-Index: AQHaHJE5ZDr2SrcGtUe45Rqk057nzLCFpEAw
Date: Wed, 22 Nov 2023 02:51:49 +0000
Message-ID: <CY5PR11MB6392B7C569858321D39FCF79FBBAA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311212331.qOQLkUxf-lkp@intel.com>
In-Reply-To: <202311212331.qOQLkUxf-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|BN9PR11MB5242:EE_
x-ms-office365-filtering-correlation-id: 62bb60b0-a92f-4373-a6f1-08dbeb05f93a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wLdQ8dKRJwCFB2DmDi2A2BjxaNwAttPWdnFqNbY7KomCMdEczORadpBgqPKuNHB1oP7czzOfSuLAkxKuq2n7TPg5lkddePFeS3ttWPSHqHlXlSbxLyCnh7Z73YafFHgs/G35DpGnC/RESMzvwxDmDKwlLObHm7FbGhZc2y0FYoCqwBP16+0rZ3Y1VR+YdFuwh9qHCO9b7guEh/UAwVb5f3hg6o++7npC7Efd9uhz8w5ZuFAm/15SCKgqsb7utpoDzvetX0r0mv39LhMioUMWbJFDyqgGG7oBZNHCGYV0H63do39FzyL3xrPc/nbQmlNOezsIysaiG188B1cWIkoOgA/hDGO2yEVhfGPNm9MkHE/zlrbpEZU9F+sqZy+CDG/UMZzj1sdcnaPeFJXu+u52rNsycadu+ZADlL9KlRhVRP3acDQIwKVHEhhar23q5kvPfsM1ZpZHwMe3XTyMzMq/kPVl6G1Vwj7TXqCXknoCPlzDtPsz4184iyEvdScLSzmvZZX+B/0z0zjwlM84Qz6oKrr0Fze4ImJemvjS0fsHeUTu6B2ZR6QVuWyswTeM3K9Ru9VH9CloGoyg2I2qIEO26/DSYl1Kwjtxy9q6kw6msj1eCHxrk05DnxTwnQKN+nVqkYDgOAl/SRgpcoIcADa1JAsN2X2KX7qx0ufis2QDlWGRG2PU+0HaJt38iuvzgJJw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(1800799012)(451199024)(186009)(966005)(55016003)(83380400001)(7696005)(6506007)(478600001)(122000001)(9686003)(26005)(71200400001)(82960400001)(53546011)(38100700002)(64756008)(66946007)(66446008)(66556008)(316002)(66476007)(76116006)(110136005)(86362001)(5660300002)(2906002)(38070700009)(41300700001)(33656002)(52536014)(8936002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l2pXyTyX5IZM3e7IEJNzWkRtB4rQFD477KtduQgA+DD0hv0Vc4U2CorzK6b2?=
 =?us-ascii?Q?dixl64GbYBxIjKkpOKjtjlCrG6VALKUdsOO9/VmbXC8rXQ5nnobYV1Bs8puI?=
 =?us-ascii?Q?wsabuKQvXinuzBgT8clrcVej4DIEPlTBEDK6rP+QeKO885Q79blf9xOkw8JG?=
 =?us-ascii?Q?YA106qgmvgQOSRPvRjVmV8tYJepdlptjOnLxQ3NX5dgdhhQczhJdnGIE81ye?=
 =?us-ascii?Q?Hw8+hIcXznRbxDv470Gk9k0narH4hwC+O6Ocwn5ULNn+zWw81Ym83vLO8L4O?=
 =?us-ascii?Q?qE0DsFdnyLrw/gJ3BkwCf4sAPrTB/gXcW3baWMSvNBxLXg/gz7xSaWqPTuF5?=
 =?us-ascii?Q?kBenye4pV1VheGnXMwmq0lEj84fLBjwwpXr7JRe/6+2CslR+CV6GwRREbPWd?=
 =?us-ascii?Q?Nx0JIgAbsHlbWuGe1bcHeAUQLHxTChhTK2ge6KKvtnPnuCTvfUOkFucUiJdG?=
 =?us-ascii?Q?0gXobK85/As2wAMSI9yQu126lfaYwuWYNEBRKMT55kKRwiwvYJmHKiIkBpv2?=
 =?us-ascii?Q?HRbsyfxNqjzefBENwzICfYDQLyaCN/r6IXtnrKEqlW3dxvnEnc2KX8iQvlVS?=
 =?us-ascii?Q?vsmK06oaBYfQ0sAx4S4KMykYvaQRaefDbC6FQX4kJhpMhvFxeNhGA5BAyIhq?=
 =?us-ascii?Q?2M65q0XoXekNZYE1/F39Y6Cym+p+PGwc2rNkJnBnqG+olziJQjaQrsnQnl1C?=
 =?us-ascii?Q?xlXhtFz5GxKwhgEWQMNo9gPa5FkW3bMs/qVqZd/Vw6PwnTbDTA8XJL5cLiqz?=
 =?us-ascii?Q?mM6xTpzqofQg9RtBpI47lKaqScVcxM5gPVmXy50y4FnYxfrvD05zv4YKS5Y7?=
 =?us-ascii?Q?r+K6ApzV3XjuKkgHpJER8Z5iWkrSLCen/8xRsEf9Vf5KlgtN+TkeVeNTM+X4?=
 =?us-ascii?Q?XPO1N7/b1RhLI+tXJxmQFO096naw/M1OjcDEI9bUUrQYlaj00ydAexGbHAUM?=
 =?us-ascii?Q?wzlVgigB1Knz5ELQxABv8DhpA9qqhBQGCfQ2ZYbxaUUZDRAAmc01yzA+8g9U?=
 =?us-ascii?Q?lO8wqhdPzVpdqDoE9u3AE0niBnXXJYDPfHWdJpzpQujovf76Q2tNoaiebIDO?=
 =?us-ascii?Q?Mwx23WBkhJ+mfo0vODEYmGSyaxvtIyqAClE48AiKhx6CJmaPA0NRmQKIskdH?=
 =?us-ascii?Q?YTFClL4am79/zlk4uStD4OzxP132Sov8ObcQPgWFkra8n+fSzzoXdifpxOck?=
 =?us-ascii?Q?pai3pd6uGvP4cN7HpEoYNpEtfUAAoskCF9uV9z3FqV+ahafe7fmnCEmRqIjf?=
 =?us-ascii?Q?8RZCCk+Lp2C5jN35tcLguquKS/Y1sG7oIKcZDIHRwSxjYh0UDYV4NW2+H3ko?=
 =?us-ascii?Q?iGBLsyOuvLa55T32ef3H6331NUPhf0FIpzNV0OkgMrU3xmtFFjx15RwdUEWX?=
 =?us-ascii?Q?MeOzSb0ibQYbvdz6vOJG/J8VsFd61u7Ij732tjpkHcHcdyTCZ410HYMQFqBO?=
 =?us-ascii?Q?+aBxbr+ZliqpA2knzUhVyyhMJdqFeKydmu8HOBs9bGc0p7aPE0UTQdzn/xut?=
 =?us-ascii?Q?AW7il9T+CO8lUNX3N4yvw6/AQaJD1m4qVsuGSgrqPqRqz1jTrQbcgWqh3xCt?=
 =?us-ascii?Q?5zVA4dAd0j/0sEJSqP45M6asngFzz9aTO24lllX0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bb60b0-a92f-4373-a6f1-08dbeb05f93a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 02:51:49.1208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feE+cYunhO/8HOYQmtqs4JPNwE/2LUNDNc3GlQ0sTQYQxtlGAEJPa9qeTA/dlt+u/MdfREYaCCJt47aKhLWSyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
X-OriginatorOrg: intel.com

not_report

"no structured comments found" is not a helpful warning message.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Tuesday, November 21, 2023 23:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/usb/typec/ucsi/trace.c:1: warning: no structured comments =
found

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: c1b0bc2dabfa884dea49c02adaf3cd6b52b33d2f usb: typec: Add support fo=
r UCSI interface
date:   6 years ago
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: i386-randconfig-002-20231120 (https://download.01.org/0day-ci/archi=
ve/20231121/202311212331.qOQLkUxf-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231121/202311212331.qOQLkUxf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311212331.qOQLkUxf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/typec/ucsi/trace.h:9:0,
                    from drivers/usb/typec/ucsi/trace.c:2:
   drivers/usb/typec/ucsi/ucsi.h:331:39: warning: 'struct device' declared =
inside parameter list will not be visible outside of this definition or dec=
laration
    struct ucsi *ucsi_register_ppm(struct device *dev, struct ucsi_ppm *ppm=
);
                                          ^~~~~~
>> drivers/usb/typec/ucsi/trace.c:1: warning: no structured comments found


vim +1 drivers/usb/typec/ucsi/trace.c

c1b0bc2dabfa88 Heikki Krogerus 2017-06-16 @1  #define CREATE_TRACE_POINTS

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

