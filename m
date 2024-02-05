Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543368F44
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 01:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707097671; cv=fail; b=iv9B7SthOtSlw9G7qcQahzhhqNla0ojFW/UYy4r7aZep2Y0SgvGXbM7eG4QuVi3bjZVpkUcgIRdn5Nv2fEnobes0t9BTeWw0EGyirwV3IGFSH7/HJJxHiXCrTiiiP74/LGKfqrskj/dR1iQKyxeHzVavPHkSrTLrLxXMxbumXqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707097671; c=relaxed/simple;
	bh=Mz4fCA6F1qLquu4VVEG9peLQ1jN8uRqVNsr5f0eK+Lo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c2duaFcSww4/i0H9eVrzfGGtMoLlC1CjGSkIlYE4au+pn7X7kyTKaEMmrShTUIzSIw9tbuWLrXB1ue3myGKNJMH2Ez/Rj9oT/WfQm8YKMxlZ1pkNrdCrokK3gRTzsFi+VWQ2yqN2m/QAba0r0vz3c39kexZy8QCoU2kVYswAhY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYQFordh; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYQFordh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707097669; x=1738633669;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Mz4fCA6F1qLquu4VVEG9peLQ1jN8uRqVNsr5f0eK+Lo=;
  b=mYQFordhCtA/2kzyI4MGP1Qs9tafAHpaB/6QXBnugMHdJ97vhzcYIIBS
   DVYbWUiKsJRcvvjtJE0Qjr9l8cOnTa5FWyhh9G+rFZjfvKrEkJokIL4LR
   +pwRyRIvziu1l6mnGq247Bh3fpvmhrFZYIxAbvgBCGiZWyLcKK1SCdyma
   /fQwPvdlSghvgP0IMSHv/gsj6xad1lXymRk+h/1lP+8nzZCz4nU6SHP4M
   iUb9gVEbPoErpYy5HDLTjI+fZwWLUUqHfRXBm6xXWNBCBm865DKZP/Y3U
   iZaWk6q0Ze9hK9wE+odSl+yb6NBv4w0MIPUDJd01mvvOfsZswdbjOXY86
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="595969"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="595969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 17:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5213115"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 17:47:48 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:47:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 17:47:47 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 17:47:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUNJxTy1YiltuqXYiXJAQQXUvrthndL7Dvi2OO0scLM3pK66S4tPMAjUwm7wz60PtTo/H8aSCp4f2FmTogO3U0F+7xhXlUKpzJtxg2NCHSNiJEo9Zz9bJb5dZaKxgyK36//UHM9ZNa3lwWsSGb34E6TKsJaRYyeCUQT6hHXN1JKe4A0Eg1W7lKQ3XmBZEwxdZ3bTJg+ttKArrTa/xf1ZbO/l1d68SfGs/UCn6fAmPPqdQqzodtTsGhyUFVzr6qzMKgqod21GzyV82DiKwx02IsmPCURNaZP6YjZqAwWRhL9xZ/i1dZWHwhK8RhenhiB+N5yTgvl4Vcwbm3FlvP0n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9GFLdJ3Jumc86J3MmapGXUUeo9qGKEQp6f3rVqs8Ck=;
 b=bTWVRlaSt/0pz+dj1qpb9vzxXPfCWJcw0wMHbxrjr3hRmNeNMDOR80H3hYZ+PSqhwUHFoQAcQ/rhob8jQtVfToOfjOq9zICUtXxxDggWaMQGW4+0ekWzTJOHd9ELIlFJNjiASoTVH8PTozP3sKAXu0XBYXqE0Ef+6jDpnCsCYDDveYwhsgvahRmMf0TGUov4aJnl5PGSKH3qiYnyBkaL6rXNXAYp4s4jDE6aYl1A4Hwvev5hdLGSF4r4YgqkDhnaR/j2+uHk2dSCEqx6t0vhcZLxw4BxsMbknDtPDPiPjoC3WIArhwKxxGeCJtwngadxCmToQ5E9c5az3/t1mzSzng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL3PR11MB6481.namprd11.prod.outlook.com (2603:10b6:208:3bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 01:47:45 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 01:47:45 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [linux-next:master 2540/2827]
 net/ipv4/netfilter/iptable_nat.c:111: undefined reference to
 `ipt_alloc_initial_table'
Thread-Topic: [linux-next:master 2540/2827]
 net/ipv4/netfilter/iptable_nat.c:111: undefined reference to
 `ipt_alloc_initial_table'
Thread-Index: AQHaU61qvnMz28gyxUyIP4ClneF+1rD7AzZw
Date: Mon, 5 Feb 2024 01:47:44 +0000
Message-ID: <CY5PR11MB6392F2A40B94C0BD431CCB58FB472@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202401310217.MOObXEB0-lkp@intel.com>
In-Reply-To: <202401310217.MOObXEB0-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|BL3PR11MB6481:EE_
x-ms-office365-filtering-correlation-id: b43c2a53-0a24-4448-f67e-08dc25ec72e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLou9YQ6p38uQYwexEwu3JInVRPnEME0cyw27T6D4w2CLwK/6O9UZ/IpCcROyCRynMLPqS/ZE8WNtDfNylgU8HzmnT7TzqOViae1+P8upLSAGTPK6D7US/jrYX31YvMC2JUWU+xTodl2cGnwdxMOl3kJ4aMPj0IQxdaqPbbXEw+V2Vu0GslXEpaPM5Z2hT+B+o21RNRWJbQBKS7Qj3pGqolkNwiX1/C300RATdDao5yOrNaH+aNSxF1ttUGo8UaWyNhzQfeGvrz7+ETuIZ7hHmf/hQbnvLEGLPOEo9xkJK4S0GEgkMyae34wUxO5DiBv3yJxkZOqXacR91dcOaqxdGUfqjS6oLCTWssZ76DY/WnSk/hCk7hFv9Yan8/kpZVvTPeBwPSDekYpd3fNMzdKxRoP/4NCc0IEBB8Kg0SLpss7uj4exGxghpti2Yoht3w4Wed+ZTDJcMTcEVQXfH5DgWhQpAYH/KYgy7k4H49c9CGQdf1wVfmuBBVT+bKsDw/zA7OOoxhnthxX6yZMVqZhKjC/5Iz2R45zmxJWXQHTQQ1pIwP//v4BcuKuUIPUMihu/XqBua4n/FLMMGS1Jra3cBA8vZXaxoNgB2c3VXtLaVaq5iLV50mjKD/kQnaVSDmd3e5WDXdboUgGZXEOLg+jEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(966005)(71200400001)(110136005)(76116006)(66946007)(66556008)(66476007)(9686003)(7696005)(6506007)(26005)(33656002)(478600001)(66446008)(38070700009)(316002)(64756008)(38100700002)(122000001)(82960400001)(86362001)(53546011)(83380400001)(52536014)(30864003)(8936002)(8676002)(5660300002)(2906002)(4001150100001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NLBvyQJGk2wt0WgOwv8oQ2A7KYbatBGTpzSy7IrJRKi/dttDfDR5C5NVxUM1?=
 =?us-ascii?Q?DHq3EhVb68FjJBmxfp2b6ycJjbTQIlaqwf7nP6VuPwF5YXRO9dnwrkIvGltP?=
 =?us-ascii?Q?WjsAybpkh8Y+jTwkPC8k+5yCf4/rAz5GJUfucqgsffzOIXoHAhhP/Oh7b3md?=
 =?us-ascii?Q?lN/tdmzAoLX5uM4vXcYsqb8ztobliGUT7OLIn/xXFZYQ6E0pVJGkyeSDwMwg?=
 =?us-ascii?Q?P0IdcoCiw2o/Fm8POxWznAACW7smhkJuipiRZ7ZYCPjFe8VFx3DCziuL0bxs?=
 =?us-ascii?Q?PvDwILZPfxiFeZTaRKOirTlyF/Coqss2BotvRuwbv6L6R5XN1tBCya6v50eg?=
 =?us-ascii?Q?krmJqmAWFTG0aDlKxBJeOAIIHvM41gwz8UcHcFPaCQiRE97RXEsAu83UYLmF?=
 =?us-ascii?Q?6/1HZMn92meMxQdwPQoHLlA4iVawMu3Qu3kVXj+Dc/D/RpPNTkGv6akzDHVc?=
 =?us-ascii?Q?ib03+FHlN6MG+FrkDzXwl3sfuPQxgcFV8SUxTmhx2mXo4VfDx3xGJC7K2Ijg?=
 =?us-ascii?Q?OlWe6Kc6dIT+759nSM8SzwajYNKcRcspgxwNuggtA8rKSLtUus88tcVc+jq0?=
 =?us-ascii?Q?J7ukUavGJ16X0xwJVcMjGKbC70B1xhf0yVoTKLY3v9KiAmAaGEtqr31xBujz?=
 =?us-ascii?Q?PgndHgi6FQsSCy1pm8MKQO+lSkA918vsYgGOKNToAogObEDvuhzwrc+7Mx72?=
 =?us-ascii?Q?fzOtypONAkxvhQjR0+KKePVgF96m0ZcAG16XQdj+CsSiMuIA71Wo+TT3cdix?=
 =?us-ascii?Q?7JG03+Di4NtWjnHe1cdeq2oZFU/r2wQhQG+Y9s2wER8g3FLktNSM1dpGDO3U?=
 =?us-ascii?Q?fIjO4xY+x8K/1Uo6gYP3Zlle/1EAtTg6R7zBa9hsaNId2Eso/70GJzsQudKW?=
 =?us-ascii?Q?D3fzw662xqLR41Eg6hC8FQaDF0s2o3GOfDbk88TutdrAShAlQlwjrLsfWtca?=
 =?us-ascii?Q?SDVdrGyJRuxwVm59y/QfENM24wKlEAnyY54O5fC1FJxo5DXee0xN/HwdUnnZ?=
 =?us-ascii?Q?+XZIKNBGEFdDDwiJzGBZtUhmJYqVrQiAIFM9HmnTLiqa9bOvHnFNZtg4OG+X?=
 =?us-ascii?Q?wvKcTnVMKxYbCOS2zP+oshxhKaU2y6qXu2ULT/zIIdtbOB/9nxhJyZNiMhZQ?=
 =?us-ascii?Q?mX9M36Iwye8nmO8WFnbLOw5ueqP8frztVJKh9KzuhP015jCTeZZP+N+Me1ve?=
 =?us-ascii?Q?AWvsq46DVFVTv8Es5kEbr6AVJD+/DM5hdH1oLCwVz7sDm/eBRYlf7z1Rw+kl?=
 =?us-ascii?Q?bkzfEogJMObQF4jbk0PO6Mp/jXzNQn2xm9YwMPC5URvXm/dpm2F6Z7hLahSy?=
 =?us-ascii?Q?VqVrkFBkc0U/Bmzl97CT8uaKj0HPkR7dUgEzZdIMGJWR5ppOmj+GmXsl1qk/?=
 =?us-ascii?Q?wbXn6EsrWzo6bkKkxD1/fNKAlk5bJ31I/RNJQPiyCfShMUgVYzBtAHKN+u+N?=
 =?us-ascii?Q?PciulAGwtZulM2tRgpgztz9KaqRH1dxxynqHy8RYlc81kJI1WqJdE2BjUO04?=
 =?us-ascii?Q?86vhGNkEhiUHEHjZDmY3ZA0AoZ/+OVq/ocNlenDct8wjVPCFHCV4TOfl0Ur5?=
 =?us-ascii?Q?TCq/DzhSRmHst/PTfnSqUUxNegSzPMHNiAFpCbUu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b43c2a53-0a24-4448-f67e-08dc25ec72e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 01:47:44.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hJdTuQsxj2iDDyQLiMWfvta/rIvNlA7s0EI6DEJ92VxqI5caR97bFRJthn0HdyuUgOMNgURHLJxYr0FfS4qjaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6481
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202402011430.vDOuYPku-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Wednesday, January 31, 2024 02:49
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [linux-next:master 2540/2827] net/ipv4/netfilter/iptable_nat.c:111=
: undefined reference to `ipt_alloc_initial_table'

::::::=20
:::::: Manual check reason: "low confidence static check first_new_problem:=
 net/ipv4/netfilter/iptable_nat.c:111: undefined reference to `ipt_alloc_in=
itial_table'"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Florian Westphal <fw@strlen.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
commit: a9525c7f6219cee9284c0031c5930e8d41384677 [2540/2827] netfilter: xta=
bles: allow xtables-nft only builds
:::::: branch date: 16 hours ago
:::::: commit date: 28 hours ago
config: i386-randconfig-061-20240130 (https://download.01.org/0day-ci/archi=
ve/20240131/202401310217.MOObXEB0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240131/202401310217.MOObXEB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401310217.MOObXEB0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_table_ini=
t':
>> net/ipv4/netfilter/iptable_nat.c:111: undefined reference to `ipt_alloc_=
initial_table'
>> ld: net/ipv4/netfilter/iptable_nat.c:115: undefined reference to `ipt_re=
gister_table'
>> ld: net/ipv4/netfilter/iptable_nat.c:123: undefined reference to `ipt_un=
register_table_exit'
   ld: net/ipv4/netfilter/iptable_nat.o: in function `iptable_nat_net_exit'=
:
>> net/ipv4/netfilter/iptable_nat.c:136: undefined reference to `ipt_unregi=
ster_table_exit'
>> ld: net/ipv4/netfilter/iptable_nat.o:net/ipv4/netfilter/iptable_nat.c:32=
: undefined reference to `ipt_do_table'
>> ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x18): undefined reference=
 to `ipt_do_table'
   ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x30): undefined reference=
 to `ipt_do_table'
   ld: net/ipv4/netfilter/iptable_nat.o:(.rodata+0x48): undefined reference=
 to `ipt_do_table'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IP6_NF_IPTABLES_LEGACY
   Depends on [m]: NET [=3Dy] && INET [=3Dy] && IPV6 [=3Dm] && NETFILTER [=
=3Dy]
   Selected by [y]:
   - IP_NF_NAT [=3Dy] && NET [=3Dy] && INET [=3Dy] && NETFILTER [=3Dy] && I=
P_NF_IPTABLES [=3Dy] && NF_CONNTRACK [=3Dy]


vim +111 net/ipv4/netfilter/iptable_nat.c

5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   31 =20
591bb2789bc2a9 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2017=
-07-26  @32  static const struct nf_hook_ops nf_nat_ipv4_ops[] =3D {
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   33  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-10-11   34  		.hook		=3D ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009=
-06-13   35  		.pf		=3D NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007=
-11-19   36  		.hooknum	=3D NF_INET_PRE_ROUTING,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   37  		.priority	=3D NF_IP_PRI_NAT_DST,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   38  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   39  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-10-11   40  		.hook		=3D ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009=
-06-13   41  		.pf		=3D NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007=
-11-19   42  		.hooknum	=3D NF_INET_POST_ROUTING,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   43  		.priority	=3D NF_IP_PRI_NAT_SRC,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   44  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   45  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-10-11   46  		.hook		=3D ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009=
-06-13   47  		.pf		=3D NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007=
-11-19   48  		.hooknum	=3D NF_INET_LOCAL_OUT,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   49  		.priority	=3D NF_IP_PRI_NAT_DST,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   50  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   51  	{
8844e01062ddd8 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-10-11   52  		.hook		=3D ipt_do_table,
24c232d8e911ef net/ipv4/netfilter/nf_nat_standalone.c Jan Engelhardt   2009=
-06-13   53  		.pf		=3D NFPROTO_IPV4,
6e23ae2a48750b net/ipv4/netfilter/nf_nat_standalone.c Patrick McHardy  2007=
-11-19   54  		.hooknum	=3D NF_INET_LOCAL_IN,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   55  		.priority	=3D NF_IP_PRI_NAT_SRC,
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   56  	},
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   57  };
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02   58 =20
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   59  static int ipt_nat_register_lookups(struct net *net)
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   60  {
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   61  	struct iptable_nat_pernet *xt_nat_net;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   62  	struct nf_hook_ops *ops;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   63  	struct xt_table *table;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   64  	int i, ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   65 =20
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   66  	xt_nat_net =3D net_generic(net, iptable_nat_net_id);
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   67  	table =3D xt_find_table(net, NFPROTO_IPV4, "nat");
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   68  	if (WARN_ON_ONCE(!table))
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   69  		return -ENOENT;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   70 =20
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   71  	ops =3D kmemdup(nf_nat_ipv4_ops, sizeof(nf_nat_ipv4_ops), GFP=
_KERNEL);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   72  	if (!ops)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   73  		return -ENOMEM;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   74 =20
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   75  	for (i =3D 0; i < ARRAY_SIZE(nf_nat_ipv4_ops); i++) {
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   76  		ops[i].priv =3D table;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   77  		ret =3D nf_nat_ipv4_register_fn(net, &ops[i]);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   78  		if (ret) {
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   79  			while (i)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   80  				nf_nat_ipv4_unregister_fn(net, &ops[--i]);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   81 =20
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   82  			kfree(ops);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   83  			return ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   84  		}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   85  	}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   86 =20
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   87  	xt_nat_net->nf_nat_ops =3D ops;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   88  	return 0;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   89  }
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   90 =20
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   91  static void ipt_nat_unregister_lookups(struct net *net)
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   92  {
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   93  	struct iptable_nat_pernet *xt_nat_net =3D net_generic(net, ip=
table_nat_net_id);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   94  	struct nf_hook_ops *ops =3D xt_nat_net->nf_nat_ops;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   95  	int i;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14   96 =20
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   97  	if (!ops)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   98  		return;
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21   99 =20
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  100  	for (i =3D 0; i < ARRAY_SIZE(nf_nat_ipv4_ops); i++)
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  101  		nf_nat_ipv4_unregister_fn(net, &ops[i]);
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  102 =20
a4aeafa28cf706 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  103  	kfree(ops);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  104  }
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  105 =20
fdacd57c79b79a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-08-03  106  static int iptable_nat_table_init(struct net *net)
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02  107  {
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  108  	struct ipt_replace *repl;
a67dd266adf42a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2016=
-02-25  109  	int ret;
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  110 =20
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26 @111  	repl =3D ipt_alloc_initial_table(&nf_nat_ipv4_table);
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  112  	if (repl =3D=3D NULL)
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  113  		return -ENOMEM;
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  114 =20
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21 @115  	ret =3D ipt_register_table(net, &nf_nat_ipv4_table, repl, NUL=
L);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  116  	if (ret < 0) {
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  117  		kfree(repl);
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  118  		return ret;
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  119  	}
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  120 =20
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  121  	ret =3D ipt_nat_register_lookups(net);
ae689334225ff0 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21  122  	if (ret < 0)
20a9df33594fe6 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21 @123  		ipt_unregister_table_exit(net, "nat");
9971a514ed2697 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2018=
-05-14  124 =20
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  125  	kfree(repl);
a67dd266adf42a net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2016=
-02-25  126  	return ret;
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02  127  }
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  128 =20
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020=
-06-22  129  static void __net_exit iptable_nat_net_pre_exit(struct net *ne=
t)
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020=
-06-22  130  {
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020=
-06-22  131  	ipt_nat_unregister_lookups(net);
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020=
-06-22  132  }
cf4cbc610bfa29 net/ipv4/netfilter/iptable_nat.c       David Wilder     2020=
-06-22  133 =20
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  134  static void __net_exit iptable_nat_net_exit(struct net *net)
c7232c9979cba6 net/ipv4/netfilter/iptable_nat.c       Patrick McHardy  2012=
-08-26  135  {
20a9df33594fe6 net/ipv4/netfilter/iptable_nat.c       Florian Westphal 2021=
-04-21 @136  	ipt_unregister_table_exit(net, "nat");
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02  137  }
5b1158e909ecbe net/ipv4/netfilter/nf_nat_standalone.c Jozsef Kadlecsik 2006=
-12-02  138 =20

:::::: The code at line 111 was first introduced by commit
:::::: c7232c9979cba684c50b64c513c4a83c9aa70563 netfilter: add protocol ind=
ependent NAT core

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

