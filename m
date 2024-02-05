Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC147F
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707096830; cv=fail; b=mQ8tnOc3y4Zjo+eACnWKRsHBQ5XxLharP5VoDzInwqHZIdqr4nSMIWteP7TnAaUPGq+n8COOMwxH3HI9DJjXL/YMi7Ed8RLhvxVlI7AaB9y450XWUFLDHD324MYa7wXVdVbeyt34T3IakxPQTecpILI885PMDNXux5hfe166sPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707096830; c=relaxed/simple;
	bh=nzBOx10szaLJ5GIbmskL3/AXOw6v76ybAULCaTERvus=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M6MxsVIOuxeBPZwXXjnnRtX/MHW+t0weLXxePrMzv3ELzr1wuu6bXL32GGfXVdOrPjGwUlV6tRaKgzcNUyDK4K8Bms0ZbrSuWe1gblmaopPAT0gHOHgJE19C8g7hwvMKIc54bqz+vsRhen4SYDcpz8GBFXx87SseEZAWmqqs9xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+Akrwrb; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+Akrwrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707096828; x=1738632828;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nzBOx10szaLJ5GIbmskL3/AXOw6v76ybAULCaTERvus=;
  b=E+AkrwrbhK+12aXRe4XqHj0y4YcdE5RCGD7AR/flbvTmU3GeYSmzz3ka
   uK4cmNVV7ipojyoj7D7vo8Xdl60KCXfa7hNhk/a1XBw+S4/Hn1RYxzLMu
   Un1vO6tRDc5Gd1vZxh8d9OTOY79FYN+ziItHoL/TiZUtvQI3Q7jG7TG6I
   PrJtALjlZzg/vXstR3y3MoBlxMQq16fpHfZ1D9M3q846hDDsI/2sLPHXc
   BGKQvSWs+OG+pvNDWCZHcpXLx7nLhGpEsOSFpgg65v5yKZV3Fh/ZTc5Be
   pLTJ9Cg6HpOc0POOGcqViSOcEPdd0iU883FSImlPT/EGXNmR1obFxe2P5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="323734"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="323734"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 17:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="638454"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 17:33:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:45 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:44 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 17:33:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6WfEb9UeOKS/vT7pTSxL2OHFV0W7NKG2zeRqdh0ohTJYTc248GMjZr/J8n0ze6nYwpno0RWw1G5JYvN5p5gSn87J5PtOfHDdkBH5xAie69UnD+HVFHKe+hDOqvHYcoRzNj9BJUwukvDXH4mWUfd7nR8srMss71wOUOJJSPyA+AjLq6uLO8hoajuYaQQyYll9/qd6iKSnBMnQc/6v5Jh9BYsnUo5g8f69FN/NHV1OfS1P9pIS/ziyol2Ee8GkNC+asXKyhBviYsNXwOug/SRl9aS5Avo6cpQ2xUd+CIWdMUvglYOJuWiqUdm1No6Gu9tKmGiwhkuVdlAz7DlHUTHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHceX4ESKPOlmFZdf0KuZLEgCM+XzUQzdBGdz56m6hg=;
 b=lQZUTpijLtIinpYAumuYfDxbvD1NvIaWDPzu1Z3z4Z5CMBizEv6eqEPzx0FlENM0ddefRpBIFTerw2lfzktJ02HcwY7MvRJXaHCn6bXJfplOu3UYy5RHXea5bm63JKG3v/nIeMjHvjQM5vZULTiy4hoghnQ3IZBjHJRXEIcNfR3+8ocj8vTknqCTFo52mmCH2XAa43p3E2rF7C06gHpQzeMxwA08GDUKjFEJMTanzcAwJBU40Cibav7psgVXOyh9VL7F8l2KM8I9NjBZL3gRsC9PE3D7VzFg2QcDI7kx3pFTeOT2iIISUsuO77XKpq9eE1k1GmuAUgb1YB0KHHxoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 01:33:41 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 01:33:41 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [frank-w-bpi-r2-4.14:5.4-main 1518/26476]
 drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.h is
 included more than once.
Thread-Topic: [frank-w-bpi-r2-4.14:5.4-main 1518/26476]
 drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.h is
 included more than once.
Thread-Index: AQHaVjPsxJJ3bD9nI0Oj4JyzsSE9B7D6+jKA
Date: Mon, 5 Feb 2024 01:33:41 +0000
Message-ID: <CY5PR11MB63921481A2643CE3AA8A4B04FB472@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202402030744.qWfGo6g9-lkp@intel.com>
In-Reply-To: <202402030744.qWfGo6g9-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7261:EE_
x-ms-office365-filtering-correlation-id: d458d7f3-bc86-49e0-c38b-08dc25ea7c1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OR92fUz0VjOScIC7I8wiHPKCLRwugnaERoUNjWuW3OJuAhA3ivV42yg/McUR7X2vGRcrJjlPQ2LBJA/BTb9J7pKIs/dBT+F3RQf2H332BV2vZ6lmerwM1u3OhOdTuiD2iDHBqG4JDp/SLFkgfuWYliIlv6yqlxu2t3tGbo+uhP4IhKSzpWuhFHSDXyHQ5oNtdgYN9xbQnzu0r8sDKhaGD0eIY4HdF6ADDA9a0myTcn+qsMb5fYxqyerDjGNKmhkTnXv2dbNmzJom+h7xKGFeHyY3CGOxdhKcdS3UAFFO0GgwhCzoYwOSqP0pJMUGqQvNVQv8SuZgTbPxfZkZ0CQoEZbp/Q5IAh/EYTgMgqJhElYbI6ize6GEL1iMV2Ytz55VdMvaXi+MThVAVfApTL7XqyO/P7nRqWZUxvxjazFnFvnPXPgJq92gbQqz4xh6Gv1zMtZOkjSpgpfV38ML77aYxtNaDVwPJ0QiQ9SNytBZQh765wxlgVRao6IfX5Sg+AtPTeosGwTGQFouZ955g46u4VqzECw0xjz0rzBIkm3cC5IT2Zp08wD0r2VwlUJgV9eKAGUxEkyUU+k2YXIt4iz5c/0APE9loIxZKIwOadhSAmaHL9o9HblkR7HHPiZipUiN3DPdeC9cyX/TeCNkxKu0Ag==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(38070700009)(66556008)(64756008)(66446008)(66476007)(66946007)(110136005)(76116006)(66899024)(316002)(5660300002)(30864003)(2906002)(52536014)(8676002)(8936002)(83380400001)(38100700002)(122000001)(82960400001)(55016003)(33656002)(6506007)(7696005)(71200400001)(9686003)(53546011)(478600001)(966005)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YWKKtLxFsZt/JH9fck4cMoQMg9VdcmyMqGje9i1/IO5sd6FPPTZY9c2MaJAR?=
 =?us-ascii?Q?VyEakd4Uo+YlDTHqxT0ztPfuBICBK1mYrsUnLcJVvZd5X9U/Vyp6w884/c55?=
 =?us-ascii?Q?+nj5Zc0FOx2WuMmkuJyj7P0tx0EwkwH4S3thieUTT1pJlMqcOEpwnsSRTeZn?=
 =?us-ascii?Q?eHbIFeX6VOk1y54XlddZp+984SOQy4aDYVN9TmCvRcxw/7sx60Wou27sVs6d?=
 =?us-ascii?Q?q6xc21HqBBKrt4VR5tWOKkVXbWUnJFlrq0azKS6wp10zUpJh+SQu4dEXlSkx?=
 =?us-ascii?Q?5HxNxg07svB9QrHu01fLjwHw9eCCYA4GRgx5lwfV55+krnd/RYUGFdrrS9Qm?=
 =?us-ascii?Q?pebpWLTtacxJ+xzTkhHoDSHs/k0G4ujEEfa9Ou1JLeGBhcOinmjh9upxEX0Y?=
 =?us-ascii?Q?qzaDkIgwXbdzW2qqD6yD8pNMx56JjaeaA+VcKAHX8/F7J3j0mNlFYQv3coj8?=
 =?us-ascii?Q?fWENV+kR1oqtWPlg8SSZJDn0RdJacKXOC37flGaXxxxGOg7dMbSnenUKFKSA?=
 =?us-ascii?Q?GsfzGO4nxz+DXOG45dWD8AnVAqYCFAu1NNfg0YwFH6zaZoB+9dEKtddDESFN?=
 =?us-ascii?Q?sfZ2YQtXpw0/mvnM93Iu1WCVyPZ7f3ilmOBVsywrJElws4Ke99S+RJwNIZIk?=
 =?us-ascii?Q?1ZmOxDsykmC5n9eYstFMWwj9eVS39044tGUXPcaDH40ZyEKJfR9F9FqNRCD3?=
 =?us-ascii?Q?51msfm7wkZwnCp1vf1zeyQf+sXB1uWmASIJh/yPRFaEpF/P784scaW0RlqEV?=
 =?us-ascii?Q?qpO2uXG3zzw4yXbpgSmugOcoumxzJ6Cw8bOtE+B7iL7r5GOTQIAB9Zhq4Pl6?=
 =?us-ascii?Q?RfIrQ3vbv1yEvrjHuaiSNanG3/yqkL2sbc3DGaENburPMs5qaDYcIeczyMMw?=
 =?us-ascii?Q?YOU0ocPBxqu3x5jZ26qrdCoPGvhZaRhT0aF2BnQutwd07pcEIscegSCv6RKi?=
 =?us-ascii?Q?z28tisBUHvnV2LsV9B33naxSpdkY2t62A/8Y5+TxMVidL43eKaKsSd77gk8I?=
 =?us-ascii?Q?xPUBGiqKVKbfNCA08G7nvR4InhjBngRSrj9IlvylowOdlI8g4PR9JKig3gae?=
 =?us-ascii?Q?T84dCfQ1AQ1NUDAE5AEilfakDxtO8hxkN7kb2Vo5Q5SZpzal8pIpZwiuwNHi?=
 =?us-ascii?Q?6nl1Cgvo14LOaoV+Our3b/eW2KSfFPBBxcJukArA8lbNkajfCL/tHgRR2H5Q?=
 =?us-ascii?Q?952YzXv9kc9LdTsodoXKZOr2LlvNiaob7fly8PKktv87TXG3VZv2sVPOXEwd?=
 =?us-ascii?Q?6H49ZJ8QpFXc8VjYAAoH+IqgNkJBLqulI5Flq9AK9ja6mVyavgKNe928oH9S?=
 =?us-ascii?Q?bugb7iRR83geP7K2VXggqvv5Yny/OKc1KFVt/ntNSQlunOuMi1UvLs/1ey4W?=
 =?us-ascii?Q?kzlQHgqChQ3dGc5iM+M9VH26dODWKCiDlqtXodRerTvA8rc+w7G6mkKJjxM0?=
 =?us-ascii?Q?ybBaVVHekAl41tdffXmAWXnElYUM23qiOEKWFw+jji6k+RmUxvOJ+6nABwkV?=
 =?us-ascii?Q?kP5ractXZvaPki6qXKWHGtKlQY/GNH50dUcZ0iRW/PUmhLdwYKPX1MnkT1yb?=
 =?us-ascii?Q?z7D/qMjoApYcx6Lnhg1kaYhZJisDzXpkrC7+kTyb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d458d7f3-bc86-49e0-c38b-08dc25ea7c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 01:33:41.4315
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGB848FsDSNEacDqQWYbj90OasQCx4EkhS3UUVUoK2RsRVnRStnzHK98T2VD6EZxjkXiNId6hsxv8Yp9OpxS9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
X-OriginatorOrg: intel.com

not_report

Guarded by different #ifdef macros.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, February 3, 2024 07:59
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.4-main 1518/26476] drivers/misc/mediatek/co=
nnectivity/wlan/gen2/include/precomp.h: que_mgt.h is included more than onc=
e.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 06d376a01ea074dd064fc447282fe587ea9ddbdb [1518/26476] mt6625l: add =
driver-folder from 5.3
:::::: branch date: 7 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402030744.qWfGo6g9-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h: que_mgt.=
h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/os/linux/include/gl_os.h: l=
inux/wireless.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/wlan/gen2/include/p2p_precomp.h: que_=
mgt.h is included more than once.
--
>> drivers/misc/mediatek/connectivity/common/conn_soc/linux/include/wmt_idc=
.h: wmt_stp_exp.h is included more than once.
--
>> drivers/misc/mediatek/include/mt-plat/mt8127/include/mach/mtk_thermal.h:=
 linux/types.h is included more than once.

vim +143 drivers/misc/mediatek/connectivity/wlan/gen2/include/precomp.h

    11=09
    12	/*
    13	** Log: precomp.h
    14	 *
    15	 * 07 17 2012 yuche.tsai
    16	 * NULL
    17	 * Compile no error before trial run.
    18	 *
    19	 * 01 05 2012 tsaiyuan.hsu
    20	 * [WCXRP00001157] [MT6620 Wi-Fi][FW][DRV] add timing measurement su=
pport for 802.11v
    21	 * add timing measurement support for 802.11v.
    22	 *
    23	 * 08 15 2011 cp.wu
    24	 * [WCXRP00000851] [MT6628 Wi-Fi][Driver] Add HIFSYS related definit=
ion to driver source tree
    25	 * add MT6628-specific definitions.
    26	 *
    27	 * 04 18 2011 terry.wu
    28	 * [WCXRP00000660] [MT6620 Wi-Fi][Driver] Remove flag CFG_WIFI_DIREC=
T_MOVED
    29	 * Remove flag CFG_WIFI_DIRECT_MOVED.
    30	 *
    31	 * 03 15 2011 eddie.chen
    32	 * [WCXRP00000554] [MT6620 Wi-Fi][DRV] Add sw control debug counter
    33	 * Add sw debug counter for QM.
    34	 *
    35	 * 01 27 2011 tsaiyuan.hsu
    36	 * [WCXRP00000392] [MT6620 Wi-Fi][Driver] Add Roaming Support
    37	 * add roaming fsm
    38	 * 1. not support 11r, only use strength of signal to determine roam=
ing.
    39	 * 2. not enable CFG_SUPPORT_ROAMING until completion of full test.
    40	 * 3. in 6620, adopt work-around to avoid sign extension problem of =
cck of hw
    41	 * 4. assume that change of link quality in smooth way.
    42	 *
    43	 * 12 13 2010 cp.wu
    44	 * [WCXRP00000260] [MT6620 Wi-Fi][Driver][Firmware] Create V1.1 bran=
ch for both firmware and driver
    45	 * create branch for Wi-Fi driver v1.1
    46	 *
    47	 * 10 07 2010 cp.wu
    48	 * [WCXRP00000083] [MT5931][Driver][FW] Add necessary logic for MT59=
31 first connection
    49	 * add firmware download for MT5931.
    50	 *
    51	 * 10 05 2010 cp.wu
    52	 * [WCXRP00000056] [MT6620 Wi-Fi][Driver] NVRAM implementation with =
Version Check
    53	 * 1) add NVRAM access API
    54	 * 2) fake scanning result when NVRAM doesn't exist and/or version m=
ismatch. (off by compiler option)
    55	 * 3) add OID implementation for NVRAM read/write service
    56	 *
    57	 * 09 21 2010 kevin.huang
    58	 * [WCXRP00000052] [MT6620 Wi-Fi][Driver] Eliminate Linux Compile Wa=
rning
    59	 * Isolate P2P related function for Hardware Software Bundle
    60	 *
    61	 * 09 14 2010 chinghwa.yu
    62	 * NULL
    63	 * Fix BOW_FSM_INFO_T dependence.
    64	 *
    65	 * 09 03 2010 kevin.huang
    66	 * NULL
    67	 * Refine #include sequence and solve recursive/nested #include issu=
e
    68	 *
    69	 * 07 20 2010 wh.su
    70	 *
    71	 * adding the wapi code.
    72	 *
    73	 * 07 08 2010 cp.wu
    74	 *
    75	 * [WPD00003833] [MT6620 and MT5931] Driver migration - move to new =
repository.
    76	 *
    77	 * 07 08 2010 cm.chang
    78	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    79	 * Check draft RLM code for HT cap
    80	 *
    81	 * 07 01 2010 cm.chang
    82	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    83	 * Modify CNM message handler for new flow
    84	 *
    85	 * 06 28 2010 cm.chang
    86	 * [WPD00003841][LITE Driver] Migrate RLM/CNM to host driver
    87	 * 1st draft code for RLM module
    88	 *
    89	 * 06 19 2010 wh.su
    90	 * [WPD00003840][MT6620 5931] Security migration
    91	 * consdier the concurrent network setting.
    92	 *
    93	 * 06 18 2010 wh.su
    94	 * [WPD00003840][MT6620 5931] Security migration
    95	 * migration the security related function from firmware.
    96	 *
    97	 * 06 18 2010 wh.su
    98	 * [WPD00003840][MT6620 5931] Security migration
    99	 * migration from MT6620 firmware.
   100	 *
   101	 * 06 08 2010 cp.wu
   102	 * [WPD00003833][MT6620 and MT5931] Driver migration
   103	 * add hem_mbox.c and cnm_mem.h (but disabled some feature) for furt=
her migration
   104	 *
   105	 * 06 07 2010 cp.wu
   106	 * [WPD00003833][MT6620 and MT5931] Driver migration
   107	 * merge cnm_scan.h and hem_mbox.h
   108	 *
   109	 * 06 07 2010 cp.wu
   110	 * [WPD00003833][MT6620 and MT5931] Driver migration
   111	 * merge wifi_var.h, precomp.h, cnm_timer.h (data type only)
   112	 *
   113	 * 06 06 2010 kevin.huang
   114	 * [WPD00003832][MT6620 5931] Create driver base
   115	 * [MT6620 5931] Create driver base
   116	 *
   117	 * 05 17 2010 cp.wu
   118	 * [WPD00003831][MT6620 Wi-Fi] Add framework for Wi-Fi Direct suppor=
t
   119	 * 1) add timeout handler mechanism for pending command packets
   120	 * 2) add p2p add/removal key
   121	 *
   122	 * 04 13 2010 cp.wu
   123	 * [WPD00003823][MT6620 Wi-Fi] Add Bluetooth-over-Wi-Fi support
   124	 * add framework for BT-over-Wi-Fi support.
   125	 *  *  *  *  *  *  *  *  *  *  * 1) prPendingCmdInfo is replaced by =
queue for multiple handler capability
   126	 *  *  *  *  *  *  *  *  *  *  * 2) command sequence number is now i=
ncreased atomically
   127	 *  *  *  *  *  *  *  *  *  *  * 3) private data could be hold and t=
aken use for other purpose
   128	 *
   129	 * 03 16 2010 cp.wu
   130	 * [WPD00003823][MT6620 Wi-Fi] Add Bluetooth-over-Wi-Fi support
   131	 * build up basic data structure and definitions to support BT-over-=
WiFi
   132	 *
   133	 * 02 08 2010 cp.wu
   134	 * [WPD00001943]Create WiFi test driver framework on WinXP
   135	 * prepare for implementing fw download logic
   136	 *
   137	 * 01 27 2010 wh.su
   138	 * [WPD00003816][MT6620 Wi-Fi] Adding the security support
   139	 * .
   140	**  \main\maintrunk.MT6620WiFiDriver_Prj\9 2009-12-08 11:30:58 GMT m=
tk02752
   141	**  add rftest.h for implementing RF test mode in driver land
   142	**  \main\maintrunk.MT6620WiFiDriver_Prj\8 2009-11-23 22:02:00 GMT m=
tk02468
 > 143	**  Added que_mgt.h
   144	**  \main\maintrunk.MT6620WiFiDriver_Prj\7 2009-10-13 21:58:36 GMT m=
tk01084
   145	**  update for new macro define
   146	**  \main\maintrunk.MT6620WiFiDriver_Prj\6 2009-04-21 09:40:11 GMT m=
tk01461
   147	**  Add nic_cmd_event.h
   148	**  \main\maintrunk.MT6620WiFiDriver_Prj\5 2009-04-17 20:00:26 GMT m=
tk01461
   149	**  Add cmd_buf.h
   150	**  \main\maintrunk.MT6620WiFiDriver_Prj\4 2009-03-19 18:32:44 GMT m=
tk01084
   151	**  update for basic power management functions
   152	**  \main\maintrunk.MT6620WiFiDriver_Prj\3 2009-03-16 09:08:25 GMT m=
tk01461
   153	**  Update TX PATH API
   154	**  \main\maintrunk.MT6620WiFiDriver_Prj\2 2009-03-10 20:11:38 GMT m=
tk01426
   155	**  Init for develop
   156	**
   157	*/
   158=09
   159	#ifndef _PRECOMP_H
   160	#define _PRECOMP_H
   161=09
   162	/*******************************************************************=
************
   163	*                         C O M P I L E R   F L A G S
   164	********************************************************************=
************
   165	*/
   166=09
   167	/*******************************************************************=
************
   168	*                    E X T E R N A L   R E F E R E N C E S
   169	********************************************************************=
************
   170	*/
   171	#include "gl_os.h"		/* Include "config.h" */
   172=09
   173	#if CFG_ENABLE_WIFI_DIRECT
   174	#include "gl_p2p_os.h"
   175	#endif
   176=09
   177	#include "debug.h"
   178=09
   179	#include "link.h"
   180	#include "queue.h"
   181=09
   182	/*------------------------------------------------------------------=
------------
   183	 * .\include\mgmt
   184	 *------------------------------------------------------------------=
------------
   185	 */
   186	#include "wlan_typedef.h"
   187=09
   188	#include "mac.h"
   189=09
   190	/* Dependency:  mac.h (MAC_ADDR_LEN) */
   191	#include "wlan_def.h"
   192=09
   193	#if CFG_SUPPORT_SWCR
   194	#include "swcr.h"
   195	#endif
   196=09
   197	/*------------------------------------------------------------------=
------------
   198	 * .\include\nic
   199	 *------------------------------------------------------------------=
------------
   200	 */
   201	/* Dependency:  wlan_def.h (ENUM_NETWORK_TYPE_T) */
   202	#include "cmd_buf.h"
   203=09
   204	/* Dependency:  mac.h (MAC_ADDR_LEN) */
   205	#include "nic_cmd_event.h"
   206=09
   207	/* Dependency:  nic_cmd_event.h (P_EVENT_CONNECTION_STATUS) */
   208	#include "nic.h"
   209=09
   210	#include "nic_init_cmd_event.h"
   211=09
   212	#include "hif_rx.h"
   213	#include "hif_tx.h"
   214=09
   215	#include "nic_tx.h"
   216=09
   217	/* Dependency:  hif_rx.h (P_HIF_RX_HEADER_T) */
   218	#include "nic_rx.h"
   219=09
 > 220	#include "que_mgt.h"
   221=09
   222	#if CFG_ENABLE_WIFI_DIRECT
   223	#include "p2p_typedef.h"
   224	#include "p2p_cmd_buf.h"
   225	#include "p2p_nic_cmd_event.h"
   226	#include "p2p_mac.h"
   227	#include "p2p_nic.h"
   228	#endif
   229=09
   230	/*------------------------------------------------------------------=
------------
   231	 * .\include\mgmt
   232	 *------------------------------------------------------------------=
------------
   233	 */
   234=09
   235	#include "hem_mbox.h"
   236=09
   237	#include "scan.h"
   238	#include "bss.h"
   239=09
   240	#include "wlan_lib.h"
   241	#include "wlan_oid.h"
   242	#include "wlan_bow.h"
   243=09
   244	#if CFG_ENABLE_WIFI_DIRECT
   245	#include "wlan_p2p.h"
   246	#endif
   247=09
   248	#include "hal.h"
   249=09
   250	#if defined(MT6620)
   251	#include "mt6620_reg.h"
   252	#elif defined(MT6628)
   253	/* #include "mt6628_reg.h" */
   254	#include "mtreg.h"
   255	#endif
   256=09
   257	#include "rlm.h"
   258	#include "rlm_domain.h"
   259	#include "rlm_protection.h"
   260	#include "rlm_obss.h"
   261	#include "rate.h"
   262	#if CFG_SUPPORT_802_11V
   263	#include "wnm.h"
   264	#endif
   265=09
   266	#include "aa_fsm.h"
   267=09
   268	#include "cnm_timer.h"
   269=09
   270	#if CFG_ENABLE_BT_OVER_WIFI
   271	#include "bow.h"
   272	#include "bow_fsm.h"
   273	#endif
   274=09
   275	#include "pwr_mgt.h"
   276=09
   277	#if (CFG_SUPPORT_STATISTICS =3D=3D 1)
   278	#include "stats.h"
   279	#endif /* CFG_SUPPORT_STATISTICS */
   280=09
   281	#include "cnm.h"
   282	/* Dependency:  aa_fsm.h (ENUM_AA_STATE_T), p2p_fsm.h (WPS_ATTRI_MAX=
_LEN_DEVICE_NAME) */
   283	#include "cnm_mem.h"
   284	#include "cnm_scan.h"
   285=09
   286	#if CFG_ENABLE_WIFI_DIRECT
   287	#include "p2p_rlm_obss.h"
   288	#include "p2p_bss.h"
   289	#include "p2p.h"
   290	#include "p2p_fsm.h"
   291	#include "p2p_scan.h"
   292	#include "p2p_state.h"
   293	#include "p2p_func.h"
   294	#include "p2p_rlm.h"
   295	#include "p2p_assoc.h"
   296	#include "p2p_ie.h"
   297	#endif
   298=09
   299	#include "privacy.h"
   300=09
   301	#include "mib.h"
   302=09
   303	#include "auth.h"
   304	#include "assoc.h"
   305=09
   306	#if CFG_SUPPORT_ROAMING
   307	#include "roaming_fsm.h"
   308	#endif /* CFG_SUPPORT_ROAMING */
   309=09
   310	#include "ais_fsm.h"
   311=09
   312	#include "adapter.h"
   313=09
 > 314	#include "que_mgt.h"
   315	#include "rftest.h"
   316=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

