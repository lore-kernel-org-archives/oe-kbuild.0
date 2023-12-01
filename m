Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524159555
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 03:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLzTJEiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701400107; x=1732936107;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8qZFqpxRZIzjL5TCdhzqc1kkqefMD1g4O+UWTtJ7Vgc=;
  b=WLzTJEiJmeYyO832I34J3U59zUUtWIbxC6K4HfXf+qk/+L3sftJY5emP
   aZ7Ik8tveXsMHYcTzTiewQ0cWWHFtGXESVjVWhDjodeAPPnksaAYr5cOe
   /3zd+ynbV18jIcWD5RI56h6FQx0kCG7RMJlppnWstkfhjsTxiICEbWbGc
   WpO2za63ArNBYD2UCPVD5gFuCbOjVjLwMwOqiMFWJuCpizAe8sV3ExIc0
   VOcOYIpGcNAVdBKTaDIfbRqy7bPjkMeOm/EfeIduXZNMGlkR5LJSC5w2X
   2U5enXVE84fCEWriTBtEHV6KxpPARA8Yu9NwMmEs94USb4pZSHIIMtA48
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479624225"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="479624225"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 19:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887466255"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="887466255"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Nov 2023 19:08:26 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 19:08:25 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 30 Nov 2023 19:08:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 30 Nov 2023 19:08:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 30 Nov 2023 19:08:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3hUoRCmj6VJSuXdU3E/5hraxNe8UDlfmIFJo0MhgscbytUfo+CVUN0Gp3Omc39Yelq4bc3cVUw28WGeowK6S7uIf4U3Tk2zPtkpLU83k1e6cbTiptubvLId0nwfcRzkhBGgdMaahy+o8gvY1RCKxk/MqmCQs0OU8QsKBRxOkQg6vR7bANh4EvRSrRbtq2upkASI77pALix9ymvZDq6IUDKKTf4UDjLJU6sWLI7RXLSUl+Ct95xpHmybZ9zklt0q3oN1mZR2D5VhFy4+cs04/CHClXYTOZYljo9kM6oq/KwjLmP4u3oNI2MpObB7PwSccJPu9JTEKEmFE+c583MIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+5cFGsv/zy+OYp9taYyno0EF8iqD3ubKK0zIyZbuIA=;
 b=NCTc1h7WtUUYTJfXUHCNTW77PCDZiJfxcfnnc13a6U6kY2SWt0JS197WBuZCZwd1adlkTL7Ueue2fbD06OYyhuSxZo9I752L1/ytvsRGVkBpj5ytejSGpYKeijIvUjWUS6f00gVHOjbZERZb6ts7kpwP530MXjLtMwam6Gr2l22GOKKStsY+4U8Y0fgINORZVawWZt8tn6QdR52MVl9r/Ntcii3Cq+fN7zYdFz3e4t16JYRBT/6CzFkv7I6+Q9w7bgeuaqyydB8gOG+ycjSkg4XyY9IWPS45l1v6HP+Qd1s1nlv7DB43cwx0adhPiHLy2JIdqkgMQKPMiCVeS/rqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Fri, 1 Dec
 2023 03:08:18 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Fri, 1 Dec 2023
 03:08:17 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type
 in assignment (different address spaces)
Thread-Topic: drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type
 in assignment (different address spaces)
Thread-Index: AQHaI6vwo03zWC9Z7kaig39XW2M68rCTv8Ig
Date: Fri, 1 Dec 2023 03:08:17 +0000
Message-ID: <CY5PR11MB639288C711A95C8785B8EDE8FB81A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312010059.MQ446XMR-lkp@intel.com>
In-Reply-To: <202312010059.MQ446XMR-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB5118:EE_
x-ms-office365-filtering-correlation-id: a941cbed-f208-4543-939b-08dbf21ac445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UfSRqZva8ZWXdtL6Ch+i4b5eO7oAtFDkpXvvTxqbDNqgQRd7NIcEa8xrnlN7FWvcXsIzuCYQRmeWgblpT+HHoEN5ILMkODygfdO/GGHk+fOmGp1JSRvOvo+fJGw9QNH3g03sXVrT2nrs9uAhMoB84o7oRQhskWckOW9lAcAvVwgRHOoyNHYULxrdgTtY+WqYUM72/Ho9uY3ISRytEApzoRFladaYBKp/qGDciK0DspqmqPQdxAAhKNfFtqRcZmRGaGAqqYV1LntG9s29+SWgJOVY6SAfO7rpP4rlAbfJMI9pfrZjMC9LCFEE4h4bV9O7YjddQfmS/nIfvdqms+eBVpSlK4xNyYDlz/DVzz9bi9X4DF6CRfF53nhUl+Bd0eL7w9IYFiPl3zgASIrqQrlr9vQqDL2CajTtkn7TyQnEFddDphYt0ytZT9VLTn7zl7/2MY2AxA9ZUNtKGTFTyymOqnoYVFpidsZ8oifJxMyE/Y4IOjsBKFBvgNHotutfvaMJihl2tMW/BaP69CXiB5Uv9RsWC3EhGnGXNLEFUzYRiqjzMkaNrmuqU1oD7xyKYElsC59/ldc76QuZnuk0z5kqEfXIM0zE6BFCoDqTf3WmvncokTwLyAD+oznNnolF1K3/5oaK0/AX3dvwrqUv4jRz2ioQ9gy7r+Ythb193J/wG23Uckw8JORwzgRXhcY++kS6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(366004)(376002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(1800799012)(451199024)(83380400001)(38100700002)(82960400001)(33656002)(38070700009)(122000001)(966005)(66476007)(76116006)(66446008)(66556008)(86362001)(66946007)(316002)(110136005)(64756008)(55016003)(478600001)(5660300002)(41300700001)(52536014)(2906002)(8936002)(26005)(8676002)(7696005)(6506007)(9686003)(71200400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yFsHy8DbtSXSLjvKn0G2/DYh1/8mUd6nH7+Xq3C3/sTv4C2caddQXich0vuJ?=
 =?us-ascii?Q?MzDjvGOoGLyu0q9pix4kcmPh3dFtrxMUhhH1ryIVTizvhb48RmC1e+8y/W3X?=
 =?us-ascii?Q?TBTA9imX2vC7I6utmOfsFBqZEOhut0TGjYeyRLVzOM8WJn+2K9JhINvfJ5nk?=
 =?us-ascii?Q?Hwur48Oo3s6hdaqzalLoRMWoRIKVFvPjygHylNzmxAEQqIzVGQZ43PycfJGo?=
 =?us-ascii?Q?MBLniQqffpsvB5P0zdPZ59DPBH8DVwWPx8Jk3nQm5tI+MMLZhpKnw/k9Y0Xb?=
 =?us-ascii?Q?HT3eNltghklPdEZN6uqPa8zgTcIKdvgEzknCbpyW4Tb2MvYIASSygVLwmfFi?=
 =?us-ascii?Q?vkHd28DM4Tacx2QUzmoqgtJNvTTOZvjTLwc44kPrwv5AF+RWbrGDwbrjTZCw?=
 =?us-ascii?Q?xSYBsp6CfwXbDs0ObycHiGmyRfVDrySyJ0lu5oEvtqLToHVVJwbiPKfLWJhz?=
 =?us-ascii?Q?czyELqajIYJO9qtdt/uVEO8TmsVDOzmSJkYTtvcYhhG6VwHUA7gwWQGWjvRl?=
 =?us-ascii?Q?dc1GokulYSlS6oGJxkdd5LXEmP6o3MoeYIQWLwnSJ/LQCXtR/GOG+m0JmVZb?=
 =?us-ascii?Q?yaFpHv5b+MxvQBV+KuYkDNs/JdzmsnV+NWhZh5fjWVgGppT5QwrrUyJD7sVi?=
 =?us-ascii?Q?eErpTXSHvsuoZYhhdyczxsItq91UHnWpdb2IYV0IdwIzclpypIyAt3mAgxsm?=
 =?us-ascii?Q?2IQg6tn17QEDlMncCewAUJheZm5tTIzjoPb7NAMFAcuIbMlmbuMofUWVA9ez?=
 =?us-ascii?Q?UZmSdLn9I9+G+QJXUsdgEn7voUbsJt5lyyjQlke4JfJGSsOBraGza6UgVlJz?=
 =?us-ascii?Q?ZteMEOsXvOWY2e6jVvX74W2OFmfWNuBBGw9y6mJSelDedwTc5giPdZvdWAR0?=
 =?us-ascii?Q?BGJu4C6qTvB85oam+P+Icd4fLDywd6ak8jvf2+92cMYGHqzeRqUb68aL8aYc?=
 =?us-ascii?Q?Ltm4Tq28xOzlaZXiiTvF2t1KnSYGGmLR2ye9vbNH0oiyc1/f0FV75I47FbQI?=
 =?us-ascii?Q?kSdOgKIFJ13z/MF+KSZJeZrD0u8/OpSpxoZufLk7+1sWQkI0mS7CNh7xgtBk?=
 =?us-ascii?Q?9CJeGPwFV65B5KEh3mHDrY4qQcLhbfIQb9LsU9+Nsr0BGE4aPhb9daYIJCUS?=
 =?us-ascii?Q?iKq7qcw6qbVeIjm98KUCs+8V3h609eMm7WbbUMTznLRRtslgZUzj86VtWrbf?=
 =?us-ascii?Q?qTn/ZthUYJoDqWW8n0LAWXJlswF0qipv8uPLjwz98D3MGsl7Jrc9MMscZTzG?=
 =?us-ascii?Q?kAS4i1ofNDK21VpsBKOnx75O2BNBlUSfecwAcJtlHNNG7aboqwwjq48bEMcM?=
 =?us-ascii?Q?LGzyrU8+Zbd6Y+4jFhJnNtP5NXuJbDoq1raL/L9Fmv65DxYL/4s2UGiAMcEQ?=
 =?us-ascii?Q?1WdvfY7M2HOn7xP+FxerUq9BWyZS5Pf9n2GaYKTrkxFbYw0fy50uBqhruDD8?=
 =?us-ascii?Q?sGDor6Jy0GFPhxm76V6I41XMnB4nko8XlBkRijKmuTtVRSL+C/Cgf7vCbYst?=
 =?us-ascii?Q?9qF6YQaIy9GDu7pruivxFId/Qeb+1jxRAAqsvZAbfabm83iuAN/6oDd97+cM?=
 =?us-ascii?Q?lAEiwJ0RwuW144hhqR8VelbPV7ODUsHGkRtQ+DEM?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a941cbed-f208-4543-939b-08dbf21ac445
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 03:08:17.8972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFoccB50S6K89ergFm5GIqTgBDEuDdP0rgWpYaLAOa10NbAudQ5oMVvxu31z7Klgd/j1seGc23pgx2EXf3Wvow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
X-OriginatorOrg: intel.com

not_report=20

Only kconfig change.

arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

1 year ago commit.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 00:39
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type i=
n assignment (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Lad,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: effae0e3d9e1139d583e9b5d050f4f948825b8a3 riscv: Kconfig: Enable cpu=
freq kconfig menu
date:   1 year ago
:::::: branch date: 26 hours ago
:::::: commit date: 1 year ago
config: riscv-randconfig-r031-20230608 (https://download.01.org/0day-ci/arc=
hive/20231201/202312010059.MQ446XMR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312010059.M=
Q446XMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312010059.MQ446XMR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zicbom_zihintpause'
>> drivers/cpufreq/cpufreq.c:475:17: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct notifier_block *nb=
 @@     got struct notifier_block [noderef] __rcu *static [addressable] [to=
plevel] head @@
   drivers/cpufreq/cpufreq.c:475:17: sparse:     expected struct notifier_b=
lock *nb
   drivers/cpufreq/cpufreq.c:475:17: sparse:     got struct notifier_block =
[noderef] __rcu *static [addressable] [toplevel] head
>> drivers/cpufreq/cpufreq.c:475:65: sparse: sparse: incorrect type in assi=
gnment (different address spaces) @@     expected struct notifier_block *nb=
 @@     got struct notifier_block [noderef] __rcu *next @@
   drivers/cpufreq/cpufreq.c:475:65: sparse:     expected struct notifier_b=
lock *nb
   drivers/cpufreq/cpufreq.c:475:65: sparse:     got struct notifier_block =
[noderef] __rcu *next

vim +475 drivers/cpufreq/cpufreq.c

b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  466 =20
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  467  static void cpufreq_list_=
transition_notifiers(void)
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  468  {
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  469  	struct notifier_block *n=
b;
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  470 =20
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  471  	pr_info("Registered tran=
sition notifiers:\n");
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  472 =20
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  473  	mutex_lock(&cpufreq_tran=
sition_notifier_list.mutex);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  474 =20
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30 @475  	for (nb =3D cpufreq_tran=
sition_notifier_list.head; nb; nb =3D nb->next)
d75f773c86a2b8 Sakari Ailus      2019-03-25  476  		pr_info("%pS\n", nb->no=
tifier_call);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  477 =20
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  478  	mutex_unlock(&cpufreq_tr=
ansition_notifier_list.mutex);
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  479  }
b7898fda5bc7e7 Rafael J. Wysocki 2016-03-30  480 =20

:::::: The code at line 475 was first introduced by commit
:::::: b7898fda5bc7e786e76ce24fbd2ec993b08ec518 cpufreq: Support for fast f=
requency switching

:::::: TO: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

