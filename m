Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA721EB38
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYYOj/EH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657041; x=1733193041;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=K2mdum18/c5jYK8KjmzWEwe8rnoXKCsU1se5O2H6uXE=;
  b=TYYOj/EHxN89ABKxD1LxSPycThdpmXG9aHMsy54bps6/6VfHLRHlzP2G
   A4e4mG0CSghrbEiMRsZ/S1/bZ/3NAKfBp1yI4Re4GUda6jCd9wuFxBJHd
   on+/gEPmYB+2ABPTwtqf/B0yoqFcgEtrEFY11hJgDptLpRmhEbpsDSK4l
   tvf7blFPmFeZjuM7Dlg34OiMNaUPyVmniU37AYZAjwfjc8/gkP0B7b/EL
   UdwsZyuBGUSMar8NHKi3N7pT34/mc3BpKTTTnSwnmWUoQPYAsXkzIxBeu
   /p/yv+FIwmykf4OVzxcHu+zywZxQFwYdLePUrnHHEFt+g+NUMCKF/7gvo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="397562177"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="397562177"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="888379537"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="888379537"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:30:35 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:30:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:30:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:30:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxE+p+w0UBMMYk0i2M+KjhqQHKQfoMAfxGCuWz0gIsMOfS/bXsK1/J+kCyQDYUeJANWgbNglYNymM5yAu3qIsj2TunIwwtuFHtv2nMs7E4hg94GqUTA98xC+3BBQr4WrLFPqcuOEhCe08EZ5GLcsJs/Ks767uKmldJLQKAKJxmkCboFAfECL8BYjh4mW9NtvO77EARxs5g8I7ZS83gYEKnYLeZrKhKKNR+kkgPd6r/rNGiekHn/ZVQ6kEKast8iMaISYd0WNzl6AePanKrrF2D+UkwqKGou2zr7Ugq6rHXn9RWOQO5SjhEKBpQykw7bcDkfepl/+iRoJlKiSe2oEQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFP8v8OUeX671b/a/GU9l/bwebrRF9dl48kcPPMaitQ=;
 b=C9HvtMugkDfzA7oFZQhEMg3+PvL0bXmPYXPriYs1IeFE1P+xR4pCbzec9+cmfgd7bXoiOnL2OSVaii5vuyyDiORHkwAHk+opgwR7ZXVwINVAFkuEr4Mi7ByWtW/ducDUd9tYyd8kfGC3nPwlk8TSEKWNfxmT4wDyUgiuocWsLS4PORQZ1GiSX/iLmKx6BvO5TjCseDBOR4oX0XXMfEN6H1KMuE4fw0viA1UQsk7LS0ruWjN7AjXdYSLb6fg4Jm0Uw5vcozXdNXEHOLe6wrxWsTJb9HYnpdNanKbxeLT/M+0ij0gZ+6bVw+rEydhjQfvkh/57hJWXfTElw+e5RIge7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:30:22 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:30:22 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: include/linux/rbtree_augmented.h:187:25: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Topic: include/linux/rbtree_augmented.h:187:25: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Thread-Index: AQHaJLEILdwgFhP8skqHol7bj7TJJbCYahHw
Date: Mon, 4 Dec 2023 02:30:22 +0000
Message-ID: <CY5PR11MB6392BD09AAA130A56F7E90C8FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312020702.TY1PRWPS-lkp@intel.com>
In-Reply-To: <202312020702.TY1PRWPS-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: e1e9ce60-e4f1-484a-7b63-08dbf470f714
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aG5nK/4UljbjKXoAbIyaYNICEdkO+ONPCHhJoX3gm5VMs7r6zCVpahtaVmHXvjqMEocO8x/mP6JoGdPneX1A2Bn614x//2VEF+50Ssz7byw6gZaK4GRiIr1m2Vr8NbBKRR1Iq5UwdnydcqBa6Cywu1BUNaPdK408A6hXFc0+xC5SoxixoVm4pcrf9jUKR/WdteTXiPSU8k2ls0e+XP/BapRwnLvpoiZb8ZDk6mZnXNDW4hdssfOrsuv2MEcujjstgWaAJjAyUNmNhKqd+u9q/SFLBzWjFWLvw/7HpX9qWLvr6pWrxgnRE9rmCCGG8JnnzISVtBBUu+Ho0FOCkUk1Q3KehSSAnXkISB2lQS0w7dC426emcI+Hz1Aoa++Bn9WY8meRqzuj4dH5eQLNNIuH4d/YfXrDDTE5RFW1Rad+cs9ISzbmGw7HApMY5yRbs8nYl1cj9QNU8eURTkI7sX+aVqkg7spS8z6dkev26R0nfVEu+Lpf7PcLnts2FmK22O3uIYWXsO68QzzpqMJJj3Bfi59hhfxUC8sYxWqGWerLg7cAikye7xKqIWJwxGXXqoJ8czXrsEnKiIWIvBhzFdp+ZMM5KBdwmUAMFCK0eIrwA84D8ikagC2/9C2c9GmpXRTL8M8u9o3DK5g1AE+Q28kpl+VcOMtxqc5Z1XpIWUFFHdtc8D8jQuypahw2WOVUE+7Z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(82960400001)(38100700002)(122000001)(41300700001)(26005)(66556008)(66476007)(66946007)(76116006)(64756008)(5660300002)(66446008)(8936002)(8676002)(52536014)(316002)(110136005)(9686003)(53546011)(6506007)(71200400001)(966005)(478600001)(2906002)(7696005)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3jTRLnrY4PoWJYgbmA690Kdwgty9sbwRvJDP5Og1d5TeaHA0+YQVBcgL1Zdu?=
 =?us-ascii?Q?44Iq8mJq9xdU1L4xT8Q+UuuQje1IpMG1YKhAFuXn7DNK8CecXarExe/0r5JG?=
 =?us-ascii?Q?ls3DcLA2YsyQj0PeA/aWCFaY+20ZWVwpO6uWGjXYYXa8nnF4jezo/BasntI3?=
 =?us-ascii?Q?lUi+2tZFPO4F4W89hRoKrolFKkNMnkvbymZ+lDG3Ot08HudgvE8KOlJiFbVX?=
 =?us-ascii?Q?e/UvtjsbLLS5OzgTve1B21gh51lBQBrFzKi3Gp7S6b4gQAHWYK3EiCLCwRU+?=
 =?us-ascii?Q?wc6AhquZ8/kbsCFTqgPoms+Wb+sV0MFNlci+Q7FoT83b6eKaHluXEhoD22b+?=
 =?us-ascii?Q?HGVT4jmaMwdneoO+nMtxsXR9s0GCu+uujK0WRZp/S2NfNHLIu+y1FhMjAqA/?=
 =?us-ascii?Q?pH+H5xP5FXi8IgdLv7LScORxlQXcPm2MdQuztHYlWKiypF28PuA052iV/7r8?=
 =?us-ascii?Q?fJNu8SCs4tqlIClJZx3Pqpdz4zy8nZKl2PC4ZbQJp2/SHzay09S48+Mh8R2V?=
 =?us-ascii?Q?KdwC1nik3GtkVQWQbFMsDZDbZRRIaJdJw9tbFz4ov++rauSAbCZL6UtWjijW?=
 =?us-ascii?Q?LbunIs0Mqnf7MNL+Aub5BS6o0lzPgm/86XcPv9rj0x3r/4GKHLCuCkvoA7kA?=
 =?us-ascii?Q?oqhVGPGo9mzTV/89QuP2lgpKzdFuhiQeXI1VpsB8OCxdeKuI6equV6rS26q1?=
 =?us-ascii?Q?y+8cKd7AseCLC2TiXhBXG4BF/xShorfr66iBVqwJ6WHQfgLz7R/1t7juF31p?=
 =?us-ascii?Q?BjkuAGMZj6EPtd4FEQ0c/KzaBoj9lH4bqnPrwlVNtxKJEGSoqlCrQE4usZir?=
 =?us-ascii?Q?53bf8vE9tvsDyYbGkE4kUF5K1+Kcfcwg60xF+GVIaWfKU3zT/SbTFfrUmQix?=
 =?us-ascii?Q?epDHpkAzQVyj3LUKG7fgowivLayVSstsYRtKrTKkOpGb5K9HucwORL0HOPNP?=
 =?us-ascii?Q?E2kKyS4Se8dbYBqldGbVfcd7mtWeYlEOwDjQmkPZLREHeWIjQL5LZsU7EtAt?=
 =?us-ascii?Q?QNuQzJblHtAC7s+HvB949OIt1oO8K4aDcGrQ3JZP9V+O6izYPjIGiMiOjZ1B?=
 =?us-ascii?Q?YE64rvZ/Yb0rWvG86xs/XRiVJIWiOLzTLoufk37xGyEXiGKhZzdAoQyj2NLl?=
 =?us-ascii?Q?BwVGM+Kvi8HSUpadSojoiel3l0z2rkLjla3gI1S5eOVdcDJ4yjtntymD6EFm?=
 =?us-ascii?Q?KDPffqleKcAZ37yWwNZ5H1gnEpnvwRLqAXVrMWRBzt+i5jh+RIj+WJK+8iKw?=
 =?us-ascii?Q?5z2RfS0b14oKnYCo0LFIiGSuAD8MvgvzLJ9JASRU6zNatpAo+yEsSRmzlIY1?=
 =?us-ascii?Q?RDq9xo91UbzLjdPGS6RqVyVarYJ5oqZbkYWOEsEnXJDSPatTJWGp6/lM+dqy?=
 =?us-ascii?Q?/+4qqqK4WuWPkYIp5UcMBXzQ5A5B977xZyiohn4GUQalFZpHw46pBn0F1IgL?=
 =?us-ascii?Q?PZy0uBTzcXKg3zzyzOb3JaxVo5xl6c+em54UhzH1cnmuzGiakzKv3ACIEwi7?=
 =?us-ascii?Q?S33aQz8jpl5/nlA8CaxTvH6Ps+G8FXv1E5kjS2jpjP9VOENFGI6+a+HBlYGU?=
 =?us-ascii?Q?U7YM9uk8TPnSqhF17K+hrkNlPLPXuKAGXm0HK4d+?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e9ce60-e4f1-484a-7b63-08dbf470f714
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:30:22.1486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hmrdafJlpaCDR4kLmrHJctv2lgBf0w1FwuGD1crnsaHkjovKMaWTQCWs5ub+01Eztxg54wl3oqMp/Q5kpdlQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com

not_report

only Makefile change.

The issue is sparse warning in include/linux/rbtree_augmented.h. No relatio=
n with this commit.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 2, 2023 07:47
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: include/linux/rbtree_augmented.h:187:25: sparse: sparse: incompati=
ble types in comparison expression (different address spaces):

::::::=20
:::::: Manual check reason: "only Makefile file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: b1fbfcb4a20949df08dd995927cdc5ad220c128d kbuild: make single target=
 builds even faster
date:   4 years ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 years ago
config: x86_64-randconfig-122-20231101 (https://download.01.org/0day-ci/arc=
hive/20231202/202312020702.TY1PRWPS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231202/202312020702.TY1PRWPS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312020702.TY1PRWPS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/rbtree.c: note: in included file:
>> include/linux/rbtree_augmented.h:187:25: sparse: sparse: incompatible ty=
pes in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:187:25: sparse:    struct rb_node [node=
ref] <asn:4> *
   include/linux/rbtree_augmented.h:187:25: sparse:    struct rb_node *
   include/linux/rbtree_augmented.h:189:25: sparse: sparse: incompatible ty=
pes in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:189:25: sparse:    struct rb_node [node=
ref] <asn:4> *
   include/linux/rbtree_augmented.h:189:25: sparse:    struct rb_node *
   include/linux/rbtree_augmented.h:191:17: sparse: sparse: incompatible ty=
pes in comparison expression (different address spaces):
   include/linux/rbtree_augmented.h:191:17: sparse:    struct rb_node [node=
ref] <asn:4> *
   include/linux/rbtree_augmented.h:191:17: sparse:    struct rb_node *

vim +187 include/linux/rbtree_augmented.h

9c079add0d0f452 Michel Lespinasse 2012-10-08  180 =20
c1adf20052d80f7 David Howells     2016-07-01  181  static inline void
c1adf20052d80f7 David Howells     2016-07-01  182  __rb_change_child_rcu(st=
ruct rb_node *old, struct rb_node *new,
c1adf20052d80f7 David Howells     2016-07-01  183  		      struct rb_node *=
parent, struct rb_root *root)
c1adf20052d80f7 David Howells     2016-07-01  184  {
c1adf20052d80f7 David Howells     2016-07-01  185  	if (parent) {
c1adf20052d80f7 David Howells     2016-07-01  186  		if (parent->rb_left =
=3D=3D old)
c1adf20052d80f7 David Howells     2016-07-01 @187  			rcu_assign_pointer(pa=
rent->rb_left, new);
c1adf20052d80f7 David Howells     2016-07-01  188  		else
c1adf20052d80f7 David Howells     2016-07-01  189  			rcu_assign_pointer(pa=
rent->rb_right, new);
c1adf20052d80f7 David Howells     2016-07-01  190  	} else
c1adf20052d80f7 David Howells     2016-07-01  191  		rcu_assign_pointer(roo=
t->rb_node, new);
c1adf20052d80f7 David Howells     2016-07-01  192  }
c1adf20052d80f7 David Howells     2016-07-01  193 =20

:::::: The code at line 187 was first introduced by commit
:::::: c1adf20052d80f776849fa2c1acb472cdeb7786c Introduce rb_replace_node_r=
cu()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

