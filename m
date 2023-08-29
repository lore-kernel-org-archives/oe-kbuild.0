Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6608AA44
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Aug 2023 02:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693277603; x=1724813603;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LU2CAp982WGdvnebHiybUrVW6IaKGdFsgdCQ6h3sumk=;
  b=G3ZQVySQ25JWWabm2ABPZyMkG0elbuTqghAqOXcT+tl5BWkDSIahi05a
   H6kcSi1zbnrC62kR1c0sFzv/FZDeU4i/kWagoV5tM8FPSYkZ5prRsu2hH
   UcYtLTNuOz+xYwPCcNrL4FlFGo2591hj6wxCq+GK8a7VtXJqGc074FXI9
   thw6fH9Lr37W/ylNu0SpMOC7LnZgZAFXpuW6PbnSLyvR6Oz5ZICr76c3n
   pPLRrzGKEjnLf35kAsdfs34gpy/o9Kw0eSPBxHIp9qyvJ1LS/4BgRHArM
   kl08ZT67x/rcK1SwlM5o4QX5dMGbLJFkuSlJHb7akGkA4Bh4+oT7C+x4n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377984777"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="377984777"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 19:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="862060476"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; 
   d="scan'208";a="862060476"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP; 28 Aug 2023 19:53:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 19:53:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 19:53:18 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 19:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHBXzGDI9IzOyHl5YTFONuhCHh4kLzKUFfgz8g/1Edp6175EPEzHFYYb7X0qLb1j/GMyK6YpEuvIBcUWi/KuU5JJ382hfuAx8q36uqlL9fS1vG0mr/wsazk3QlPSq4W69ShZwbwyC/nYtdF5tpqHcVr+8FMtO/5Ok0I1RjOeuVdsP1PBmXlpc9DswIFP5are3W4OrRG22AW6kdAcWHWQGtX1jddK6SG3ab3HU2je70hPaUMK+c3PZfPAAiX7llIvG56YJ6JKZQlMKNxSVlj2MHxqyInlETUbdiuAnO97haWH4iFebDqfHZHlb37My8Wwbr2AgTc7LhBjQrkFqrw8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq6b463xECLVnLK+vq5SSuK5JY1qtZRdqT0VPfCBPxs=;
 b=hqUojYAYsADj9nqAKdrqbTbV1GdFlJcPduZIAqjc3g7tvCgrY252fI2zVKpMBJMe54oA0/3+JDRciqdgdEXyhRUwyCwUNAn/iKLUBziqLgnKgmUzmX6ARCbMJpafA/nzctJ75yDaZg9nN/zZZHNlUSTGweZBK4ljSlqTZPpVV17PU5rU0lJe4X7NDDcs4Wm4pfZI8H7b5iXvovBOOV5BXEqu3a7CKwsMTCaRdlLo8iGs1Np4bBIjP/qTywjUkxvXBIyddAbq6cZnv8y9OIs5pZIJXihyPuBqQBBaTL+suyWM3rwF4h90KW+erfCDspBGeZHsbRPGs3vrJFY4Y2u0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.13; Tue, 29 Aug
 2023 02:53:14 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::ed83:aa52:335e:776c%5]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 02:53:14 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [RFC net-next v2 3/7] net: openvswitch: add explicit drop action
Thread-Topic: [RFC net-next v2 3/7] net: openvswitch: add explicit drop action
Thread-Index: AQHZx0HRFhKs//UXY06/wMQZ4uQ2x7AAuO5Q
Date: Tue, 29 Aug 2023 02:53:13 +0000
Message-ID: <DS0PR11MB6397E7F83D7BA89C85E390F7FBE7A@DS0PR11MB6397.namprd11.prod.outlook.com>
References: <202308050917.fxeoCp4f-lkp@intel.com>
In-Reply-To: <202308050917.fxeoCp4f-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6397:EE_|SJ2PR11MB8513:EE_
x-ms-office365-filtering-correlation-id: e6357bcd-b33e-4eaf-d671-08dba83b16a8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qiWicO8HV5PvfonSwxCURc7WjCBTDeaM0ZaBGSxeHQ8MoCDbqNODOhcLfptRNe00TW50U60KAvJs3zeS02J6PFR+L6Ufbk1wNjjPWN6QH+QaubeQwZwgbetUDxWBEZvB/6hZR9UM/Ph/vPVKKyxLV2/+f6a+pnv55TlEMEzFKPPUSUGL1/MrhLmhID0vOHZmc1Yp+dannTHirWoN29GROYkpB+mvH2Yneg2GACkI4J0KImM2pM9idDviDcqulIKUAlqMkf1L1VKf0ew7sso+VXNlFkHPgeBz5e1jsXLNfwqKl2VaF4WBBVeDsHYJY6jQIjFZkg5xVBFZ5L/I4jdhNj5HvF9IkE90IsRVsUK7IlUyI7va4ya2/PDW+ecL8JYiR3FbBlyvAPAUiV8GWrZaJgr/1VuX66kStZVm9pJSZw6c6hRHMSre/oqe6xDYyuwCwP8ABz94jFUUUf0SwTgNHvG/Xz/eQoMHg5hxshaLuG+VXv57s6iSWyVy7BV2+C5Y+x5iLsfXxEFJrY/szgU9gQBGLad7zcbVMj5mRf8e8tvHUoeTbGTVggi5G+jGOLbJfQiTIQTIcaLW3Wtn9CcXTCw+KyoQUHl0JW6Dekk3b8W2uLPS5x6w4sNlfu3PStbwYc/aeXoUeg7tazpqmJO24w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(396003)(39860400002)(186009)(451199024)(1800799009)(66476007)(64756008)(55016003)(8676002)(66556008)(122000001)(478600001)(38100700002)(2906002)(4001150100001)(76116006)(316002)(66446008)(82960400001)(966005)(8936002)(66946007)(110136005)(30864003)(7696005)(6506007)(52536014)(53546011)(26005)(9686003)(83380400001)(5660300002)(38070700005)(71200400001)(41300700001)(86362001)(33656002)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4+Al4kfxh1vvvHEskSXFcVjlWF+lv9mH/D+38510ETYjO6KCrUiT/UOJp9p6?=
 =?us-ascii?Q?tZc9Gar72DvPrsT0/q9uCx2RdK0bhzA62W+4tA4syZefCwrN/RF/CXqIKylu?=
 =?us-ascii?Q?nlWASICucwhAepa8rRxeXvxxKkTGYaEfgrMN2NNSX/pNez9nTdoeWqM0PYYz?=
 =?us-ascii?Q?axhD6tZPluFIGKgsx/C+zR2WvwyKud4jf32gwCKXyLkzF+Giya9jVnFXf6ID?=
 =?us-ascii?Q?373N3WtIRFStX7QarRvZlyNYYQrjg8uJ6quXAJMsJdVq8s2YNqIaHeXQmycV?=
 =?us-ascii?Q?VybMgMMsJQEnXo1DxZcirZXHI2kLgMIayOnhbqPrBZGxaCawxgxeRAIVZTnn?=
 =?us-ascii?Q?tuPNlbMhEsnuUa9g4HoE4SxYDbsVcpHr06Oi217b/YRJVvUgarOB/omJ2kh2?=
 =?us-ascii?Q?SCPiYqQwkF02459cFTttzOqH7SZQtrYuaNt3egyVoBVsB+WQfde/Ef4zcr+7?=
 =?us-ascii?Q?bC34yqp5TCZO/eINXlftRnXyKzEkkyJLRKgsLsvKRi6i5b3TUJ5j1MQRA9Lp?=
 =?us-ascii?Q?PVPLs9G71YrtTAZsHli7J7KwCH/fOf+HyhcrHr2vxXACLIZ3UNnGpsLbM6sa?=
 =?us-ascii?Q?FJICgYRnMhwRZUw75RpX5jOb5AnxV4fZvy9NV6Vc2KARleMetRIlMSPCl5Ux?=
 =?us-ascii?Q?pOfBVvFu5LaCnXJBAisuE9xKRpEY7IoVNE1qK2Kdu+PrMaKZstzrrWGcPOkK?=
 =?us-ascii?Q?iZ2bAprujcrVbhAdlD2mrwQGreeG3M8MhJjTn0uibr2qrkt43Leyquc83T/i?=
 =?us-ascii?Q?5B2U4ke4PM0405R2ZH/w/3slNi1PW3nI6wieZRo8xfDZKiKtf73vUzVsSQjd?=
 =?us-ascii?Q?SvrpILNBQQINtoaWzysod8loHrbvmvK82oENYYn+XuKzNMHnE8IpvGQF+CCL?=
 =?us-ascii?Q?7llzNVNKmA6d+iN21eha7/ig3qZRGCFwaB13l6Me+OqAZuEMpKHn6R65wpw6?=
 =?us-ascii?Q?5/Lz0geWEWH/7zNPvtxkJtzc1s6CigIg8wJqHG7Pf9LT070wEg1kTjr7BGoo?=
 =?us-ascii?Q?KBuywB9rKXVpt5yajsWTEzKVLVn3h2WJSYHDXuTOBB0jUMJ16DSojKyaW7d7?=
 =?us-ascii?Q?XQUM7zjfItWA9cmGlYjj7/LunzFbZlYpVeN3yU2r6K+vQ63OZp5IyEsRG4eP?=
 =?us-ascii?Q?3t16srh6yzojnvDKmWaWNHhW1iN3008UmmgltUlLpgT1PluFys9iOUobLUWw?=
 =?us-ascii?Q?s+sAT8f0e2VwmI05bj2LHZXElouoctj6XaLYf79GVJ9eDOHsWGy4sfAeZtXa?=
 =?us-ascii?Q?tmOUg/k1yQbjW50mQ080mXZpqKPydxBQzrsnuPlrfvhS+5H4APiywA1AIM0k?=
 =?us-ascii?Q?AiODGaxWnDwBx6eISK3PbIu+9Nthd5ePDvqDuOjlfWloNJ5CUWlER+Y8Tj4c?=
 =?us-ascii?Q?NfHgNKtUrBAtviT1rSCtmooeDHDLhDjPBeAR0sOD9nbiUES3PijIpNC4wcKt?=
 =?us-ascii?Q?QJa941+xnW9UTh//2U9YwQnAtfOYyt+WLYGnWIPc16VuN9JhlGkRui1oJR6d?=
 =?us-ascii?Q?cJO2q2E5seX2D38jlfqsZXMvm0HJMzcUddPPjUYv/eZRLGQuTdQAfdrK2wLy?=
 =?us-ascii?Q?/PB958T6y9N0ENW8aAlYKmPlC5bDLtYNa7qEfixn?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6357bcd-b33e-4eaf-d671-08dba83b16a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 02:53:13.9674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9ODNxXYpRXiUpCgC6fVj1gUyLKiqe+kdSAeJFcuZO8ikvIT6xM30iYhhpcHsa+ybSq6KxVkQl7TheT+IKBkNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
X-OriginatorOrg: intel.com

not_report 'requires more than one prerequisite patchset'

Apart from adding a new drop reasson subsystem and some common drop
reasons, this series takes Eric's preliminary work [1] on adding an
explicit drop action and integrates it into the same subsystem.

This series also adds some selftests and so it requires [2] to be
applied first.

[1] https://lore.kernel.org/netdev/202306300609.tdRdZscy-lkp@intel.com/T/
[2] https://lore.kernel.org/all/20230728115940.578658-1-aconole@redhat.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, August 5, 2023 10:07
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [RFC net-next v2 3/7] net: openvswitch: add explicit drop acti=
on

::::::=20
:::::: Manual check reason: "git am base is a link in commit message"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801151649.744695-4-amorenoz@redhat.com>
References: <20230801151649.744695-4-amorenoz@redhat.com>
TO: Adrian Moreno <amorenoz@redhat.com>

Hi Adrian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Adrian-Moreno/net-op=
envswitch-add-datapath-flow-drop-reason/20230801-232241
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230801151649.744695-4-amorenoz%4=
0redhat.com
patch subject: [RFC net-next v2 3/7] net: openvswitch: add explicit drop ac=
tion
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: um-randconfig-r091-20230730 (https://download.01.org/0day-ci/archiv=
e/20230805/202308050917.fxeoCp4f-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050917.f=
xeoCp4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308050917.fxeoCp4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/openvswitch/actions.c:1494:47: sparse: sparse: mixing different enum=
 types:
>> net/openvswitch/actions.c:1494:47: sparse:    unsigned int enum ovs_drop=
_reason
>> net/openvswitch/actions.c:1494:47: sparse:    unsigned int enum skb_drop=
_reason

vim +1494 net/openvswitch/actions.c

744676e777207f Matteo Croce    2020-02-15  1285 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1286  /* Execute a list of actio=
ns against 'skb'. */
ccb1352e76cff0 Jesse Gross     2011-10-25  1287  static int do_execute_acti=
ons(struct datapath *dp, struct sk_buff *skb,
2ff3e4e4868675 Pravin B Shelar 2014-09-15  1288  			      struct sw_flow_ke=
y *key,
651887b0c22cff Simon Horman    2014-07-21  1289  			      const struct nlat=
tr *attr, int len)
ccb1352e76cff0 Jesse Gross     2011-10-25  1290  {
ccb1352e76cff0 Jesse Gross     2011-10-25  1291  	const struct nlattr *a;
ccb1352e76cff0 Jesse Gross     2011-10-25  1292  	int rem;
ccb1352e76cff0 Jesse Gross     2011-10-25  1293 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1294  	for (a =3D attr, rem =3D =
len; rem > 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1295  	     a =3D nla_next(a, &r=
em)) {
ccb1352e76cff0 Jesse Gross     2011-10-25  1296  		int err =3D 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1297 =20
c4ab7b56be0f6f Aaron Conole    2021-06-22  1298  		if (trace_ovs_do_execute=
_action_enabled())
c4ab7b56be0f6f Aaron Conole    2021-06-22  1299  			trace_ovs_do_execute_ac=
tion(dp, skb, key, a, rem);
c4ab7b56be0f6f Aaron Conole    2021-06-22  1300 =20
d6647a78fa3e11 Adrian Moreno   2023-08-01  1301  		/* Actions that rightful=
ly have to consume the skb should do it
d6647a78fa3e11 Adrian Moreno   2023-08-01  1302  		 * and return directly.
d6647a78fa3e11 Adrian Moreno   2023-08-01  1303  		 */
5b8784aaf29be2 andy zhou       2017-01-27  1304  		switch (nla_type(a)) {
5b8784aaf29be2 andy zhou       2017-01-27  1305  		case OVS_ACTION_ATTR_OUT=
PUT: {
5b8784aaf29be2 andy zhou       2017-01-27  1306  			int port =3D nla_get_u3=
2(a);
5b8784aaf29be2 andy zhou       2017-01-27  1307  			struct sk_buff *clone;
738967b8bf57e5 Andy Zhou       2014-09-08  1308 =20
5b8784aaf29be2 andy zhou       2017-01-27  1309  			/* Every output action =
needs a separate clone
5b8784aaf29be2 andy zhou       2017-01-27  1310  			 * of 'skb', In case th=
e output action is the
5b8784aaf29be2 andy zhou       2017-01-27  1311  			 * last action, cloning=
 can be avoided.
5b8784aaf29be2 andy zhou       2017-01-27  1312  			 */
5b8784aaf29be2 andy zhou       2017-01-27  1313  			if (nla_is_last(a, rem)=
) {
5b8784aaf29be2 andy zhou       2017-01-27  1314  				do_output(dp, skb, por=
t, key);
5b8784aaf29be2 andy zhou       2017-01-27  1315  				/* 'skb' has been used=
 for output.
5b8784aaf29be2 andy zhou       2017-01-27  1316  				 */
5b8784aaf29be2 andy zhou       2017-01-27  1317  				return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1318  			}
ccb1352e76cff0 Jesse Gross     2011-10-25  1319 =20
5b8784aaf29be2 andy zhou       2017-01-27  1320  			clone =3D skb_clone(skb=
, GFP_ATOMIC);
5b8784aaf29be2 andy zhou       2017-01-27  1321  			if (clone)
5b8784aaf29be2 andy zhou       2017-01-27  1322  				do_output(dp, clone, p=
ort, key);
5b8784aaf29be2 andy zhou       2017-01-27  1323  			OVS_CB(skb)->cutlen =3D=
 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1324  			break;
5b8784aaf29be2 andy zhou       2017-01-27  1325  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1326 =20
f2a4d086ed4c58 William Tu      2016-06-10  1327  		case OVS_ACTION_ATTR_TRU=
NC: {
f2a4d086ed4c58 William Tu      2016-06-10  1328  			struct ovs_action_trunc=
 *trunc =3D nla_data(a);
f2a4d086ed4c58 William Tu      2016-06-10  1329 =20
f2a4d086ed4c58 William Tu      2016-06-10  1330  			if (skb->len > trunc->m=
ax_len)
f2a4d086ed4c58 William Tu      2016-06-10  1331  				OVS_CB(skb)->cutlen =
=3D skb->len - trunc->max_len;
f2a4d086ed4c58 William Tu      2016-06-10  1332  			break;
f2a4d086ed4c58 William Tu      2016-06-10  1333  		}
f2a4d086ed4c58 William Tu      2016-06-10  1334 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1335  		case OVS_ACTION_ATTR_USE=
RSPACE:
f2a4d086ed4c58 William Tu      2016-06-10  1336  			output_userspace(dp, sk=
b, key, a, attr,
f2a4d086ed4c58 William Tu      2016-06-10  1337  						     len, OVS_CB(skb=
)->cutlen);
f2a4d086ed4c58 William Tu      2016-06-10  1338  			OVS_CB(skb)->cutlen =3D=
 0;
d6647a78fa3e11 Adrian Moreno   2023-08-01  1339  			if (nla_is_last(a, rem)=
) {
d6647a78fa3e11 Adrian Moreno   2023-08-01  1340  				consume_skb(skb);
d6647a78fa3e11 Adrian Moreno   2023-08-01  1341  				return 0;
d6647a78fa3e11 Adrian Moreno   2023-08-01  1342  			}
ccb1352e76cff0 Jesse Gross     2011-10-25  1343  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1344 =20
971427f353f3c4 Andy Zhou       2014-09-15  1345  		case OVS_ACTION_ATTR_HAS=
H:
971427f353f3c4 Andy Zhou       2014-09-15  1346  			execute_hash(skb, key, =
a);
971427f353f3c4 Andy Zhou       2014-09-15  1347  			break;
971427f353f3c4 Andy Zhou       2014-09-15  1348 =20
f66b53fdbb22ce Martin Varghese 2019-12-21  1349  		case OVS_ACTION_ATTR_PUS=
H_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1350  			struct ovs_action_push_=
mpls *mpls =3D nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1351 =20
f66b53fdbb22ce Martin Varghese 2019-12-21  1352  			err =3D push_mpls(skb, =
key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1353  					mpls->mpls_ethertype,=
 skb->mac_len);
25cd9ba0abc074 Simon Horman    2014-10-06  1354  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1355  		}
f66b53fdbb22ce Martin Varghese 2019-12-21  1356  		case OVS_ACTION_ATTR_ADD=
_MPLS: {
f66b53fdbb22ce Martin Varghese 2019-12-21  1357  			struct ovs_action_add_m=
pls *mpls =3D nla_data(a);
f66b53fdbb22ce Martin Varghese 2019-12-21  1358  			__u16 mac_len =3D 0;
f66b53fdbb22ce Martin Varghese 2019-12-21  1359 =20
f66b53fdbb22ce Martin Varghese 2019-12-21  1360  			if (mpls->tun_flags & O=
VS_MPLS_L3_TUNNEL_FLAG_MASK)
f66b53fdbb22ce Martin Varghese 2019-12-21  1361  				mac_len =3D skb->mac_l=
en;
25cd9ba0abc074 Simon Horman    2014-10-06  1362 =20
f66b53fdbb22ce Martin Varghese 2019-12-21  1363  			err =3D push_mpls(skb, =
key, mpls->mpls_lse,
f66b53fdbb22ce Martin Varghese 2019-12-21  1364  					mpls->mpls_ethertype,=
 mac_len);
f66b53fdbb22ce Martin Varghese 2019-12-21  1365  			break;
f66b53fdbb22ce Martin Varghese 2019-12-21  1366  		}
25cd9ba0abc074 Simon Horman    2014-10-06  1367  		case OVS_ACTION_ATTR_POP=
_MPLS:
fff06c36a25632 Pravin B Shelar 2014-11-06  1368  			err =3D pop_mpls(skb, k=
ey, nla_get_be16(a));
25cd9ba0abc074 Simon Horman    2014-10-06  1369  			break;
25cd9ba0abc074 Simon Horman    2014-10-06  1370 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1371  		case OVS_ACTION_ATTR_PUS=
H_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1372  			err =3D push_vlan(skb, =
key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1373  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1374 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1375  		case OVS_ACTION_ATTR_POP=
_VLAN:
fff06c36a25632 Pravin B Shelar 2014-11-06  1376  			err =3D pop_vlan(skb, k=
ey);
ccb1352e76cff0 Jesse Gross     2011-10-25  1377  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1378 =20
bef7f7567a104a andy zhou       2017-03-20  1379  		case OVS_ACTION_ATTR_REC=
IRC: {
bef7f7567a104a andy zhou       2017-03-20  1380  			bool last =3D nla_is_la=
st(a, rem);
bef7f7567a104a andy zhou       2017-03-20  1381 =20
bef7f7567a104a andy zhou       2017-03-20  1382  			err =3D execute_recirc(=
dp, skb, key, a, last);
bef7f7567a104a andy zhou       2017-03-20  1383  			if (last) {
971427f353f3c4 Andy Zhou       2014-09-15  1384  				/* If this is the last=
 action, the skb has
971427f353f3c4 Andy Zhou       2014-09-15  1385  				 * been consumed or fr=
eed.
971427f353f3c4 Andy Zhou       2014-09-15  1386  				 * Return immediately.
971427f353f3c4 Andy Zhou       2014-09-15  1387  				 */
971427f353f3c4 Andy Zhou       2014-09-15  1388  				return err;
971427f353f3c4 Andy Zhou       2014-09-15  1389  			}
971427f353f3c4 Andy Zhou       2014-09-15  1390  			break;
bef7f7567a104a andy zhou       2017-03-20  1391  		}
971427f353f3c4 Andy Zhou       2014-09-15  1392 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1393  		case OVS_ACTION_ATTR_SET=
:
fff06c36a25632 Pravin B Shelar 2014-11-06  1394  			err =3D execute_set_act=
ion(skb, key, nla_data(a));
ccb1352e76cff0 Jesse Gross     2011-10-25  1395  			break;
ccb1352e76cff0 Jesse Gross     2011-10-25  1396 =20
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1397  		case OVS_ACTION_ATTR_SET=
_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1398  		case OVS_ACTION_ATTR_SET=
_TO_MASKED:
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1399  			err =3D execute_masked_=
set_action(skb, key, nla_data(a));
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1400  			break;
83d2b9ba1abca2 Jarno Rajahalme 2015-02-05  1401 =20
798c166173ffb5 andy zhou       2017-03-20  1402  		case OVS_ACTION_ATTR_SAM=
PLE: {
798c166173ffb5 andy zhou       2017-03-20  1403  			bool last =3D nla_is_la=
st(a, rem);
798c166173ffb5 andy zhou       2017-03-20  1404 =20
798c166173ffb5 andy zhou       2017-03-20  1405  			err =3D sample(dp, skb,=
 key, a, last);
798c166173ffb5 andy zhou       2017-03-20  1406  			if (last)
798c166173ffb5 andy zhou       2017-03-20  1407  				return err;
798c166173ffb5 andy zhou       2017-03-20  1408 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1409  			break;
798c166173ffb5 andy zhou       2017-03-20  1410  		}
7f8a436eaa2c3d Joe Stringer    2015-08-26  1411 =20
7f8a436eaa2c3d Joe Stringer    2015-08-26  1412  		case OVS_ACTION_ATTR_CT:
ec0d043d05e6e3 Joe Stringer    2015-10-06  1413  			if (!is_flow_key_valid(=
key)) {
ec0d043d05e6e3 Joe Stringer    2015-10-06  1414  				err =3D ovs_flow_key_u=
pdate(skb, key);
ec0d043d05e6e3 Joe Stringer    2015-10-06  1415  				if (err)
ec0d043d05e6e3 Joe Stringer    2015-10-06  1416  					return err;
ec0d043d05e6e3 Joe Stringer    2015-10-06  1417  			}
ec0d043d05e6e3 Joe Stringer    2015-10-06  1418 =20
7f8a436eaa2c3d Joe Stringer    2015-08-26  1419  			err =3D ovs_ct_execute(=
ovs_dp_get_net(dp), skb, key,
7f8a436eaa2c3d Joe Stringer    2015-08-26  1420  					     nla_data(a));
7f8a436eaa2c3d Joe Stringer    2015-08-26  1421 =20
7f8a436eaa2c3d Joe Stringer    2015-08-26  1422  			/* Hide stolen IP fragm=
ents from user space. */
74c16618137f15 Joe Stringer    2015-10-25  1423  			if (err)
74c16618137f15 Joe Stringer    2015-10-25  1424  				return err =3D=3D -EIN=
PROGRESS ? 0 : err;
7f8a436eaa2c3d Joe Stringer    2015-08-26  1425  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1426 =20
b8226962b1c49c Eric Garver     2017-10-10  1427  		case OVS_ACTION_ATTR_CT_=
CLEAR:
b8226962b1c49c Eric Garver     2017-10-10  1428  			err =3D ovs_ct_clear(sk=
b, key);
b8226962b1c49c Eric Garver     2017-10-10  1429  			break;
b8226962b1c49c Eric Garver     2017-10-10  1430 =20
91820da6ae8590 Jiri Benc       2016-11-10  1431  		case OVS_ACTION_ATTR_PUS=
H_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1432  			err =3D push_eth(skb, k=
ey, nla_data(a));
91820da6ae8590 Jiri Benc       2016-11-10  1433  			break;
91820da6ae8590 Jiri Benc       2016-11-10  1434 =20
91820da6ae8590 Jiri Benc       2016-11-10  1435  		case OVS_ACTION_ATTR_POP=
_ETH:
91820da6ae8590 Jiri Benc       2016-11-10  1436  			err =3D pop_eth(skb, ke=
y);
91820da6ae8590 Jiri Benc       2016-11-10  1437  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1438 =20
b2d0f5d5dc5353 Yi Yang         2017-11-07  1439  		case OVS_ACTION_ATTR_PUS=
H_NSH: {
b2d0f5d5dc5353 Yi Yang         2017-11-07  1440  			u8 buffer[NSH_HDR_MAX_L=
EN];
b2d0f5d5dc5353 Yi Yang         2017-11-07  1441  			struct nshhdr *nh =3D (=
struct nshhdr *)buffer;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1442 =20
b2d0f5d5dc5353 Yi Yang         2017-11-07  1443  			err =3D nsh_hdr_from_nl=
attr(nla_data(a), nh,
b2d0f5d5dc5353 Yi Yang         2017-11-07  1444  						  NSH_HDR_MAX_LEN);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1445  			if (unlikely(err))
b2d0f5d5dc5353 Yi Yang         2017-11-07  1446  				break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1447  			err =3D push_nsh(skb, k=
ey, nh);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1448  			break;
b2d0f5d5dc5353 Yi Yang         2017-11-07  1449  		}
b2d0f5d5dc5353 Yi Yang         2017-11-07  1450 =20
b2d0f5d5dc5353 Yi Yang         2017-11-07  1451  		case OVS_ACTION_ATTR_POP=
_NSH:
b2d0f5d5dc5353 Yi Yang         2017-11-07  1452  			err =3D pop_nsh(skb, ke=
y);
b2d0f5d5dc5353 Yi Yang         2017-11-07  1453  			break;
cd8a6c33693c1b Andy Zhou       2017-11-10  1454 =20
cd8a6c33693c1b Andy Zhou       2017-11-10  1455  		case OVS_ACTION_ATTR_MET=
ER:
cd8a6c33693c1b Andy Zhou       2017-11-10  1456  			if (ovs_meter_execute(d=
p, skb, key, nla_get_u32(a))) {
cd8a6c33693c1b Andy Zhou       2017-11-10  1457  				consume_skb(skb);
cd8a6c33693c1b Andy Zhou       2017-11-10  1458  				return 0;
cd8a6c33693c1b Andy Zhou       2017-11-10  1459  			}
b233504033dbd6 Yifeng Sun      2018-07-02  1460  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1461 =20
b233504033dbd6 Yifeng Sun      2018-07-02  1462  		case OVS_ACTION_ATTR_CLO=
NE: {
b233504033dbd6 Yifeng Sun      2018-07-02  1463  			bool last =3D nla_is_la=
st(a, rem);
b233504033dbd6 Yifeng Sun      2018-07-02  1464 =20
b233504033dbd6 Yifeng Sun      2018-07-02  1465  			err =3D clone(dp, skb, =
key, a, last);
b233504033dbd6 Yifeng Sun      2018-07-02  1466  			if (last)
b233504033dbd6 Yifeng Sun      2018-07-02  1467  				return err;
b233504033dbd6 Yifeng Sun      2018-07-02  1468 =20
b233504033dbd6 Yifeng Sun      2018-07-02  1469  			break;
b233504033dbd6 Yifeng Sun      2018-07-02  1470  		}
4d5ec89fc8d14d Numan Siddique  2019-03-26  1471 =20
4d5ec89fc8d14d Numan Siddique  2019-03-26  1472  		case OVS_ACTION_ATTR_CHE=
CK_PKT_LEN: {
4d5ec89fc8d14d Numan Siddique  2019-03-26  1473  			bool last =3D nla_is_la=
st(a, rem);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1474 =20
4d5ec89fc8d14d Numan Siddique  2019-03-26  1475  			err =3D execute_check_p=
kt_len(dp, skb, key, a, last);
4d5ec89fc8d14d Numan Siddique  2019-03-26  1476  			if (last)
4d5ec89fc8d14d Numan Siddique  2019-03-26  1477  				return err;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1478 =20
4d5ec89fc8d14d Numan Siddique  2019-03-26  1479  			break;
4d5ec89fc8d14d Numan Siddique  2019-03-26  1480  		}
744676e777207f Matteo Croce    2020-02-15  1481 =20
744676e777207f Matteo Croce    2020-02-15  1482  		case OVS_ACTION_ATTR_DEC=
_TTL:
744676e777207f Matteo Croce    2020-02-15  1483  			err =3D execute_dec_ttl=
(skb, key);
a5317f3b06b3af Eelco Chaudron  2021-01-13  1484  			if (err =3D=3D -EHOSTUN=
REACH)
a5317f3b06b3af Eelco Chaudron  2021-01-13  1485  				return dec_ttl_excepti=
on_handler(dp, skb,
a5317f3b06b3af Eelco Chaudron  2021-01-13  1486  								 key, a);
744676e777207f Matteo Croce    2020-02-15  1487  			break;
7ba915b0774186 Eric Garver     2023-08-01  1488 =20
7ba915b0774186 Eric Garver     2023-08-01  1489  		case OVS_ACTION_ATTR_DRO=
P: {
7ba915b0774186 Eric Garver     2023-08-01  1490  			enum ovs_drop_reason re=
ason =3D nla_get_u32(a)
7ba915b0774186 Eric Garver     2023-08-01  1491  				? OVS_DROP_EXPLICIT_AC=
TION_ERROR
7ba915b0774186 Eric Garver     2023-08-01  1492  				: OVS_DROP_EXPLICIT_AC=
TION;
7ba915b0774186 Eric Garver     2023-08-01  1493 =20
7ba915b0774186 Eric Garver     2023-08-01 @1494  			kfree_skb_reason(skb, r=
eason);
7ba915b0774186 Eric Garver     2023-08-01  1495  			return 0;
7ba915b0774186 Eric Garver     2023-08-01  1496  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1497  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1498 =20
ccb1352e76cff0 Jesse Gross     2011-10-25  1499  		if (unlikely(err)) {
8dcf60bc963af6 Adrian Moreno   2023-08-01  1500  			kfree_skb_reason(skb, O=
VS_DROP_ACTION_ERROR);
ccb1352e76cff0 Jesse Gross     2011-10-25  1501  			return err;
ccb1352e76cff0 Jesse Gross     2011-10-25  1502  		}
ccb1352e76cff0 Jesse Gross     2011-10-25  1503  	}
ccb1352e76cff0 Jesse Gross     2011-10-25  1504 =20
d6647a78fa3e11 Adrian Moreno   2023-08-01  1505  	kfree_skb_reason(skb, OVS=
_DROP_FLOW);
ccb1352e76cff0 Jesse Gross     2011-10-25  1506  	return 0;
ccb1352e76cff0 Jesse Gross     2011-10-25  1507  }
ccb1352e76cff0 Jesse Gross     2011-10-25  1508 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

