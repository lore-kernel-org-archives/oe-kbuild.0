Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230A12E40
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/TS6YT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704628344; x=1736164344;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=42o4d9+TKkY2b/ibsgp6PzDAYqoyMLiQQTqjIW4AnLE=;
  b=d/TS6YT0MGfAwfIlrawcAz4PLYv1N48AWK3REOEFgM4ef45S1gvx8fDy
   xIJdjkDaGzdbGwwcMyMFJ5hvmnhNYJCDMsEUlQVkDI2f7PzHBQzpRdnmt
   T3GHzFKihsJBJ1VMZnrbLtSzHbtGHcSwevJvsjd3U1wtJ4/FVHaEGiBOg
   Ji80QM9S4KxU5X9rmLQGOv30LiBfQNlSIJTL7FRP5cQbSqCJGfb72nqEe
   GQl6KC4SKUKVH+pf+70JCY0L5+OTgauURxjgEoZX82T3wBoR3p9cdPN2S
   pgXGaOP2vyhtbd+nOkkDRqnRe3pS9rJHIYK9byZHITxyZHH/fjlyLLwfX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="4485613"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="4485613"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 03:52:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="29511520"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Jan 2024 03:52:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 03:52:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 03:52:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 03:52:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaZrVVSpHRA5kJzzwCqm3K8kxDqJyhgZq8c60JxHg8i5s5cQH7GDvBcog8nfs6Vms90aDIKadB7LEPYGte1DNk1h5RpKiM2V1zU0Gcgtpuf6rhgAwVoiMyD/qyMVdkNytzFGAIpRRgB9y4RKa3pJa/DYGSQrJqEkRnmL9HOeLbpFZ7rBPyMpPYZ4dNGAWEY/zY6Gj3qYuVQCCDOPvowtmx9THGs42oAynOMSPP568lt1WfyX6ZoBsfZxJStMb6vfYQ24yRy5scZTJKi3Js2OTUR2qh1rU+ctb6OrdaIKeb23iTMTmPnUWrg8Es7J/bEId7G6g0WytL+tjyOhgdszRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/3eCcwk1fVdWoH+m35RQtFdvpjIXWUvFN7KVZ7/KKY=;
 b=KgtrKp8hCJCFDD1DcCyJRsGvolXUYkikduMSWrLvsDy089jQ4x+F17VIDwJClz4D4nGf2oL+t1zwpW5BhY06BXG0K9in0SxnQ4yQFgB7QGMSIT0M1812yeQO0dZmaQsbdai/nl9B6lJew7+rZ3y4G6T8iAsaxC5CxLfbjeM1HAgPLspWvakduPGbMqkRQYlfW897tZeNquSSWDXX+eFETWprwAerSi0QmEo5Nf4505sYu4lPH/kAgVcmUHbYV92wsaKcRKO16xj5I8uogFDPo+Yc2mBIM7erBP9VP0CUq/03tU0dCBeti2idO6fG/fS8J0e+1+/AAMr4ofZjWcCZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Sun, 7 Jan
 2024 11:52:20 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7159.020; Sun, 7 Jan 2024
 11:52:20 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any keys
Thread-Topic: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any keys
Thread-Index: AQHaQJnh8anAY2NZO0O9I8kwm5g457DOPpzA
Date: Sun, 7 Jan 2024 11:52:20 +0000
Message-ID: <CY5PR11MB6392244286ACD2D924EFEAE0FB642@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401061952.k6UqFm0j-lkp@intel.com>
In-Reply-To: <202401061952.k6UqFm0j-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM6PR11MB4545:EE_
x-ms-office365-filtering-correlation-id: 62bae320-aa33-4566-807e-08dc0f771abc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7SbPCxOLyqm76EcaHd9hqs/fHIVAxnDGtYi7XJGcVaE6M0MSSIGEkNE0o+UNdXuPEKuv7uNm6sBP3390D7zUyDsNQLqAYxpHmSN7OQpyoP5+fs5Af/rNKNLNwoEVJUNmJXYWIpotRiXko/+ggjUs/uGyPAoKeM9DAgucmnHMcdZC17kThE5gdmLW7DUXH0b524eJKB08jXpqytInutDNYKpdabwmlj7axULA0i15Mo4R0FSGGc7mwpQNWNVc8wujZGnC/AbGPpl/6CNE/9lIvLDgzgONLfPt7IoSKsimm7XZF18vk9zrUFBW0qDbxVgmQDRuLYm3OsrYahk2n8ClaqydHnunkRg1MvwAWy1MaFa8+GGODl1EA2K+QDlWzVDavCl7w6xo+yecdVE1tHIf23EpS2Tq+fCYFwilY09cN0BZMjfQMJRfAxGeZvVUNZXCvWQ6BmvtQ3BNVTBikNGCTPcWKghWLLmwV+dvMpXWFqH6MyWZnS4WxEsTX+4a4mAnntRfcljY9mmanECdYjvdva7+JyczdppVnDie5WPCGY01wdvyr4J09HPUgokvG6q1Y5JLZujpyas2LgDBkmpP2935vX7w8Kcaqgu9SHI+PZ5KRrzECwkOqrZYSwCOE+w8Yev9fZ3oE5if3dr2QjqKvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(376002)(136003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(2906002)(38100700002)(122000001)(5660300002)(38070700009)(82960400001)(86362001)(41300700001)(316002)(110136005)(8676002)(8936002)(9686003)(55016003)(76116006)(66946007)(66556008)(66446008)(66476007)(64756008)(26005)(478600001)(966005)(7696005)(83380400001)(6506007)(71200400001)(33656002)(53546011)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tt7jWk4AXpzp+TordCSYhLAU95Yprenuh689CPf4j4n3iNIs10nvAVWn8L9V?=
 =?us-ascii?Q?ctlNF0HCl1Fi1JgW9iM07PMekLzKzp9aLFoe5MafsNt6i8WSOfH+Vfq/HY3Q?=
 =?us-ascii?Q?zDtvjY9WNwJq4gOVH3ATqq+VWofFeKDWzhImNyVEv2BMUpsEYq9Qj6tFD/Sw?=
 =?us-ascii?Q?rypq3XYy5DQmzsolzQnxPzm9HfS7WrvkA+POpAAvgm2v+WUoXJ7cDTjdiPY4?=
 =?us-ascii?Q?hEUBzpCQ0KbDR0mq0OPqM6hU2LtIVLbiDnqN5FLFVY9miAwssIRC/aNoHsjD?=
 =?us-ascii?Q?hXxpOBETYEKEvL1NcWIVsWAE8qnmyV60MTJwW3w5AnU09XWcAbEWIRSY6rjA?=
 =?us-ascii?Q?kv1ZAUzdWql048r46aNyV5zvXZymTgOid8OnrI2frgsTZ8IveHOxNQLCQOUF?=
 =?us-ascii?Q?eETGz+z1Hx7Q33wO9JD8Kq3lxgvuu0IVKY6Js8KKbPNuL79Ar8I7xbqjgtf4?=
 =?us-ascii?Q?KN1+YVothvyMzR9NLazOeS/b22A/hd356YDAyX4KazQW6ec8sMM/5Y7dEYUM?=
 =?us-ascii?Q?ZL30J6utQbSCJQFqrtmICSDEspqbE1VZK1ra5IZIaiT58DZ9wNkaMZeWuq3O?=
 =?us-ascii?Q?80xYatSKaZNiFHGbPJTEvqKygTk+bsIpv36BphSvVj83Rg33toy+wM2kpJfN?=
 =?us-ascii?Q?UolXhVEidvchDOtoaU4qA0nFUyvW2d2fqqL13SJrim1MnqudteVKCqC1N4iQ?=
 =?us-ascii?Q?uB0kj3Gv0TW5gwzYIjXfPH4GRlDlgPVpt0hRm8HLQ4ikqYNJNnRrMzk35BYi?=
 =?us-ascii?Q?WbltL18y3Sgl4kE/cnKnqPO4yKYvwcLaBk211iFzuABnAvS6ElVHwMtNHsVf?=
 =?us-ascii?Q?oMORhq0FbEoJmyadoKwxuerdIW8FPlMSeyZwA4hV0YgOO8cBKwK1700eU+Av?=
 =?us-ascii?Q?rk2pWpBdNiQ8j5kUARlQ9RFucB+LMNSrfxPt5Y3qtoVFFdAaU/tQNZI5kwLc?=
 =?us-ascii?Q?TI5UrAfDZo7RahEu/4kS3+wSI/N5As6ACY4a0MDO0cox/rrm+OWMf7oHiBKD?=
 =?us-ascii?Q?DCmuD+fQc4HQsca/T7s3XAy8BrDP/8XyFrSLsfgtWCZYp3hp5JryCKrIqFkM?=
 =?us-ascii?Q?m3FDX3GEtMMS8dEYbUVt3Dw5NgKbLd3Wk8YrsxZ3l14d+Qer5V6rKv9pDAwW?=
 =?us-ascii?Q?kXzCrKCYPKP8TpS3XD90hhj7LoRUXgdBU/YplyJj4j3uPsai7o/AiVtEsVsR?=
 =?us-ascii?Q?OYAZ4w9+bAaoTZPoj/HKwP6SqMs+VGM5bzuiS1dpg0tmToJIoWJ5WMqY2mbz?=
 =?us-ascii?Q?mrQN+ErL65FQHMcdCC2dSu1O/T+Rr7WMlquG8yMvs4PK0t0fldgnNoWlgGyr?=
 =?us-ascii?Q?aoauXbKsz0o+39nIdyfi7ppnPUWNPKOqy/osG9p5chejk8hnKuEZJLUdfKb1?=
 =?us-ascii?Q?jpQlK2WynhIxadISA6qb29dlr0/sm0fBt/O6s9eUckrJvgdThA6soUR+gi9X?=
 =?us-ascii?Q?8sP0tWYeJFn8DqJPuRnL139WzR85uAFmQD6qfus6KvzsvlHA+I7Vcxmdl5h7?=
 =?us-ascii?Q?11v27eNktZtIUr7aJGSbMKRo0oJixeFhWnnRUOiWEiggvVKBVzwr0tOmsPio?=
 =?us-ascii?Q?mhy+I9HtJPcPK4Sae93Amd8swjrMmbW9VLQKVne6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bae320-aa33-4566-807e-08dc0f771abc
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2024 11:52:20.3759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y7QXAvSuy9Q/PXJQjcL/ZwjNhPtLTTj0wnr9+SXk0jOBuT7wVDg/xnnG6eEQndRy9G/8kpgr6xjEMrHZgBOVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4545
X-OriginatorOrg: intel.com

not_report

duplicate include under different #ifdef macro

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, January 6, 2024 20:12
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any key=
s

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240104-tcp_hash_fail-logs-v1-1-ff3e1f6f9e72@arista.com>
References: <20240104-tcp_hash_fail-logs-v1-1-ff3e1f6f9e72@arista.com>
TO: Dmitry Safonov <dima@arista.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac865f00af293d081356bec56eea90815094a60e]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-t=
cp-Only-produce-AO-MD5-logs-if-there-are-any-keys/20240104-214510
base:   ac865f00af293d081356bec56eea90815094a60e
patch link:    https://lore.kernel.org/r/20240104-tcp_hash_fail-logs-v1-1-f=
f3e1f6f9e72%40arista.com
patch subject: [PATCH] net/tcp: Only produce AO/MD5 logs if there are any k=
eys
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401061952.k6UqFm0j-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/net/tcp_ao.h: linux/jump_label.h is included more than once.

vim +131 include/net/tcp_ao.h

   129=09
   130	#ifdef CONFIG_TCP_MD5SIG
 > 131	#include <linux/jump_label.h>
   132	extern struct static_key_false_deferred tcp_md5_needed;
   133	#define static_branch_tcp_md5()	static_branch_unlikely(&tcp_md5_need=
ed.key)
   134	#else
   135	#define static_branch_tcp_md5()	false
   136	#endif
   137	#ifdef CONFIG_TCP_AO
   138	/* TCP-AO structures and functions */
 > 139	#include <linux/jump_label.h>
   140	extern struct static_key_false_deferred tcp_ao_needed;
   141	#define static_branch_tcp_ao()	static_branch_unlikely(&tcp_ao_needed=
.key)
   142	#else
   143	#define static_branch_tcp_ao()	false
   144	#endif
   145=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

