Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2DFC00
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy1TZmZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702450080; x=1733986080;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=x/fM4I5blp6Uwr8yDjBn8tqzjjSaXQfbL8w4fdSiSY0=;
  b=Jy1TZmZiVzVB4O+oaILjgEX0R8l9pG3WafM5fTnJw1xAiOD1nLzkOTua
   7s1G+BdWhtnA+t9IvyhRDKNyzbkzaxVYYrOB01RUpOxrOJ8SKzk5DjNr0
   s/qSkusm9JKi90f54AvQN0pYoJo9c4NwmM+6VooHDFM8zsFnptmbDfont
   LrUsaSSp7XitERxzQXjCeuWXeMK5SvOEmwtY6oga5KaaqYX2ElFqUb14C
   c4m/aqijhmgGaK/4vPy8OY9I0q4XeHV1euf8mGxwd9a1Q9Rg3SS5cnVyh
   Nb3v/ZMJSkrCTQEEtSoPZ0ZuFB6zohl6njAMcExrVrFkEI6FrI0Rjuata
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="374427387"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="374427387"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 22:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864505344"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="864505344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 22:47:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 22:47:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 22:47:53 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 22:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUz3FJr+agAgLs1zKCsdDuK7lcSDCNT6f2P6FVxcZXDRcEmYRAS58XfQS6E3GygBXNyzvu9Y/cbAPYaIp5J2t2zvaGC+OGI/+RpsGR4ycRh91d/GWcK8uYkoDlGLAEvWwmwbErSKhaleVUiUuroBpx93yTVbIqsQcSqhrXr47WmUeG4XGkSW2YmsKdYFToA4ODAVx+akdnOxdhrRT6XayV7i5qDY5YvsZBbzv66oRsF/wmsR66O+TCgW2gfkkTbdFrsCEXHFEwp80wqvFEZm4Gni4KHSI7R/qbnaGsVjvuVNMhrT7kiuxcVrXib6GA4qr5diZ9XTcLe9hmmfF/wI9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irpUQMK3psLlIsWVaKx5Ocv4ZyBJ7woYFOF+klzKhB0=;
 b=H4xB9uX+KnaXMvX5BT4hEVKcLzEX9Gpl6xbIj9LUjf7/VbfYXMU/FYMd+4H8jQcSynhtMO3kiUAzFE11revaji/htYV2uhjwl28QfxAwpi0OosNssblVBIFnapgmc0pC/tch9OQ2Uoaqkp0RhAp7tNn5q9x+vm5ilmMGOWc8jJq0hRjhlErNGJK/xNaxr8wZe7hQWulr3sh0TBtpMiP+ucezjIPY+ki7n7Do9Ix64baYrNjQkOsd6G7ijkN5CSC8RuVKDwuBRzcyAdgNJl7Ma4Mbbin5tslSrE28PNbJblvKYe4pOliRNyZuYg6YT14CwoHljD8JQoMdwy/lo10XZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:47:51 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 06:47:50 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [akpm-mm:mm-unstable 28/195] /tmp/ccgKfL8Q.s:158: Error: selected
 processor does not support requested special purpose register -- `mrs
 r2,cpsr'
Thread-Topic: [akpm-mm:mm-unstable 28/195] /tmp/ccgKfL8Q.s:158: Error:
 selected processor does not support requested special purpose register --
 `mrs r2,cpsr'
Thread-Index: AQHaI6eAFmt9rmnXL0iBckbrovJWS7Cm2MiA
Date: Wed, 13 Dec 2023 06:47:49 +0000
Message-ID: <CY5PR11MB6392F0A22168F3B8831C7667FB8DA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311302356.M2DUyJ6D-lkp@intel.com>
In-Reply-To: <202311302356.M2DUyJ6D-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CH0PR11MB5249:EE_
x-ms-office365-filtering-correlation-id: e498c7d6-787f-4d1e-aa4e-08dbfba76c65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3PCKMXxuaQXBtXjPJhSU2Bq8nCZjYnAl0sIo/pk7hB3OJCLhom9XYxIwnmbK6s/xvHdx8ttmZDamZ41d80kwqGlRudcwSoOxoiK7BtsqurY7ONNTZQtueczvhumpclUMHDC08TCOAr8IzIsXmMJzx+RuyDcNtITDaSsFv9AP31iUJbE9C4bgS54ficADhYsJl4mW36cHtLSJ/R2KR4wjk9m+CaUl6G0mALxDLpeKOWidNsUsfcDtG3WoTT7PZ8uWiem+yJXA7Qi6S8JPv1U/Z6WvFcyjROSz2ZblJmVYQIza9wxP01TuLS7oNjTQdKQlV0N8RWtOy/1LJmP/ta12yfG5U4nII3GBqQW5G3TlgPOiuhi3WIyzOpD3veGsr2GZCaL64kNVRHP03NtriNPflQP5j1a23HimHYdrRWmzkVD6An/y9UIyXQeJ79aXCDMtoUjCwyXLbDk+nb2puFD/r0uT069dzrkia38tQn/xaQybFPt+AibhSGka2TAJviLGcPDpHfogTFXF4rGKM+McaWDjL9JCm2uL+eHonzAkYFpRDeYeFAThLt9Balt+Kq5xh+FJwDNLXWCJmL5d/zMjIsMntncR7gs8BNptLKZ5N9KapGwT5QzsBeXzqVidmc8CJiq+jgdbAZeezhfqBLJcRgO2PBvaE44jjt0y298lVho=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(71200400001)(6506007)(7696005)(9686003)(53546011)(122000001)(83380400001)(5660300002)(52536014)(8936002)(8676002)(41300700001)(2906002)(966005)(478600001)(316002)(76116006)(66946007)(110136005)(66556008)(64756008)(66446008)(66476007)(33656002)(86362001)(82960400001)(38100700002)(38070700009)(55016003)(81973001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?g1leWtFMagHpAV4PiNU6qniFhvYQQttYgn/ELuygfY1QbYjgZLrS1VLErRMn?=
 =?us-ascii?Q?Br1VbFcl9f8Plb10PHmnHE/j4FBEjPOnnoKqeuKxSRH/cabbpSwJXK9Rpgry?=
 =?us-ascii?Q?lZ6cRyWn7EPaERNF1D+sBwOXudKHLxRlZEFdLRMfNsRSvckII8nad4eGmdRF?=
 =?us-ascii?Q?RTZeiBdA5PXL98iNZXp/KFCJMdrNtAlEsmmQuqZhgzp7Acxxs2fk/DaVmgzG?=
 =?us-ascii?Q?qb3Jht/iiTmuR3VOaJZAo1ATied7HUJHyq1FDSHuApcHlybhIQAxX967S3go?=
 =?us-ascii?Q?WUDNCl4vD8a9eREX2Rc476SsudSVG80hZoVIUkkVqVzhQgcnIqlgOrmgusbW?=
 =?us-ascii?Q?kDszA6dvu9pDJEPSkYw2Ip6+k044IFaAsQjNUsIxzq6J6SIDMh8zaXmeBjaH?=
 =?us-ascii?Q?awYB5/nYCuBtgFn2dB4xUdVHoDV6h4qq+0jOb55O0rRxPCMnKK6rmshduv1e?=
 =?us-ascii?Q?F4Ixjdt9VQLfND2/r6F1ysOzO9svk4urtZH62hoiHL5omdMHfanLZWO9qEke?=
 =?us-ascii?Q?7jz93BJI14hTdUApLOd6M8gvfrdAKCyds8TGId1uen91Safo66eaSfYXWT6W?=
 =?us-ascii?Q?MLjqFVjKj4UDulSdF/g+IV42Qsec3hRJQ8LvDbAfzLo3bc5N1x5p4/vzBQ25?=
 =?us-ascii?Q?BIOYle6vTcFnRNt+JmDYlJrC7hYBpJ6tXNiHQoOqgnztPianC9z6jSkGprJf?=
 =?us-ascii?Q?ek/hRuzhmZeW0SxiS3M92LMmls9oiDY0D177EJitdzUG83SuXcYdF1LfHnta?=
 =?us-ascii?Q?Npx3xAOmG9grqMSyNMyAIsZD2piqQEsNw/AqDrpLSm+wy2QFnVPc/U6HSoQe?=
 =?us-ascii?Q?oJehArnOOmb5189Gz0JjytOqRjPXZseSLySpnqPd3cyCxtNL5uWUOI1UloSm?=
 =?us-ascii?Q?Anixh1ClqjoPOhpcCDmbO+WAdOsffCzEGWRqQcBHlnePOxUJ7RAUY4MC3KSi?=
 =?us-ascii?Q?NG5H25DIToey7lOVWK14XYnk4kr/9SysY0cJQWNnNuurCNsD/UTScv/qW8xd?=
 =?us-ascii?Q?Sx2Ry6l49lvZZwE/KoncUj1PyM9XycnbvF5Yc3T4OyWL5gWUA4j0pKCeoqUK?=
 =?us-ascii?Q?lHNRZVPg8j6ygVMNPW39fcoJtnA4k6SFfSq1Zf9rtd03MhpzgIRats/y+lkv?=
 =?us-ascii?Q?TtGqeYwXx8yuTeBKOdBidMEBeP5s0t+UqMH2aRJqHcJIut1ftc0JZ2ffEhmL?=
 =?us-ascii?Q?ZFzEvS2DcWbXHbabdbdXLLBj5/T1b71fggIZif+oAmh4/RB7LqFPeoRj0Lkm?=
 =?us-ascii?Q?JPBRU4IJr6eJfBme+Nzrr6d/oTnuifKZkmcR8odwo3CJUf8rns+PK1t81dg2?=
 =?us-ascii?Q?ztny46FJqIL9uidpP8ZrFUAACx0ra4TK5bxTviD7mUXu3B5eeQ3Q4plHmwWt?=
 =?us-ascii?Q?jq1xcFyb3mn7NTkG9gW5t44jCYURGgkhWQ23JrRAvq4wDDm4vI7EMWsSF3xV?=
 =?us-ascii?Q?nyNACQ+VjHT9JHdJol2dXpOQ+ToM750rWwzqYOjgDWxT68ow12xCPnXSTsrM?=
 =?us-ascii?Q?B7svBsTiyWTOTO4iRHxKaaiMM31gS2C0BzVCjJxbBow3Io54jlJ1ljA+FQl9?=
 =?us-ascii?Q?NBfnuiOOOpPkgxFSEqXcJyf1WUl8m8wBOL0fjWCx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e498c7d6-787f-4d1e-aa4e-08dbfba76c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:47:49.9503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqVcACI9pnE3Eu4XuZrwRjprDlXi/UZyateuLwl6mqIN0geYOpMxu4cKLq2lQxlZ/VjJHPiIGAAsZTPqpYMeVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5249
X-OriginatorOrg: intel.com

not_report

Don't quite understand the error message produced by assembler.
But anyway, this commit only has one line change of Kconfig, so ignore this=
 report.

kernel/Kconfig.kexec | 1 -
 1 file changed, 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 00:05
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [akpm-mm:mm-unstable 28/195] /tmp/ccgKfL8Q.s:158: Error: selected =
processor does not support requested special purpose register -- `mrs r2,cp=
sr'

::::::=20
:::::: Manual check reason: "only kconfig file changed"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 /tmp/ccgKfL8Q.s:158: Error: selected processor does not support requested =
special purpose register -- `mrs r2,cpsr'"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ignat Korchagin <ignat@cloudflare.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unst=
able
head:   213725670d54f6e780039eb2c911430adb036b1b
commit: 16ebda3b629b084cc40b09ad5fa36d99966a1e9a [28/195] kexec: drop depen=
dency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm-randconfig-r131-20231130 (https://download.01.org/0day-ci/archi=
ve/20231130/202311302356.M2DUyJ6D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302356.M=
2DUyJ6D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311302356.M2DUyJ6D-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccgKfL8Q.s: Assembler messages:
>> /tmp/ccgKfL8Q.s:158: Error: selected processor does not support requeste=
d special purpose register -- `mrs r2,cpsr'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

