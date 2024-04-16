Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6766F06D
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713250045; cv=fail; b=a36wX2g8PJoe4TFDjBomCFg5Q7GkZjY7PlMsjLDuck5coSgBuftdGxOF+/qokkEDBpYxxRrWlr182PZe8c8fP5v155SMLiiucngbDVfRs/wrFKKuEBYqEEhppfZRejxGhlSmkhyjivGjqAEDPwpDL4AzQJ06pNKHsgWET1Z5eyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713250045; c=relaxed/simple;
	bh=MbktNg7W/7mYJOJGnwCVGx+OE4Z+2mDsMPcnNLFaslQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LNHbAM1goF1OxLx7sQ/xqWCHrLWKNmWnczBE4CndKzUAt9cTY0HsBSQuTjGcHcE9YEX5cWjZ/iSBH/f5ssnKspsn4ezVRXoKUuwhEUzV1GYS/Lwk1WIh5hp3VgKWAMXreSSrhclsUS34C2hnJ6ZlroInFyYtBclx5AUwfnnM8DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPrTj8QG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPrTj8QG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713250043; x=1744786043;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=MbktNg7W/7mYJOJGnwCVGx+OE4Z+2mDsMPcnNLFaslQ=;
  b=UPrTj8QGCZ9oh5LETt+8cIIY3WpLKRawim96v6T/u54WHS4Xb9Vwh2d6
   7g0F0fcjVm/bM5XvHlnIxkUsNRNyIV2tzQ/l5ByrwxDIGGacQI7e5jq0t
   ddz5mQPL0Cq6T8DgrxlXffKuxy6kHUMTn35n5waciM7yPH5SWkpyIeVJ1
   ZoH3u57DbOIz1sCbb0Zjo3Y5DxVZw/UqxRF5Dn7Q5yHcQGB1aFs+KUHvw
   vCsDte2zrlY6jehN6UbQOvCkYNENsWYlHT2Y3hgotMxXX7WQN2WaIHNH4
   bZmMuTP/icOhyGzwgNeWnw6p8aLO5kpcCEiRjDeVLFhEFDXpT7Lmd3dah
   w==;
X-CSE-ConnectionGUID: WvudaDdFQxC2NPRuBscu4Q==
X-CSE-MsgGUID: Ts5kzv0GRAG6Nr7id/YqVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8779790"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8779790"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:47:23 -0700
X-CSE-ConnectionGUID: HclmTMuxT6iaETbFVF9Ogw==
X-CSE-MsgGUID: +CkeRP19STKfI15fJaG1gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26939992"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:47:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:47:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:47:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:47:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:47:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igDp4jZluP0hUsgP8fB1hIXXP2xRb0ps7AlPcsnE2IhQpo0jjewRTj0gb2IvJkuhA3Ti9y/0TVsQE7waouJ03lUSngX6p6zCMWIq05nRs4illd6JlxL3BQ32GUYWc2IbqcCRDowL3r+fEPgCWKqbyVXeLhmfQZpmbLFYlBQKh+5xsaF7fMgUfmugEUbBDpBvB68j1Dv2DMSLhDmmJ3E9y1ei7LGSCBxRDWYP+uMWl3qeXPJiGRLS6oqyPdDorWzXetG3JzN1IdGSKfWaMYjtR4dbHFEi6anXHViyQMQtGsHwCth3QhvPm0YJD3GjwcsaAciGjwF9gDMxPFjTRPEzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbktNg7W/7mYJOJGnwCVGx+OE4Z+2mDsMPcnNLFaslQ=;
 b=aAFy7Q3263uuIckMojs8NWRCYdGyhloFFlFXu2ozu3NoWnlllBONlsgOt6j3dALCgI7ynIjzF+BAGp4VgHxaE2u9afZiZ2ubbQszCrL/6bK1y1/qAxPhNIAUQFAgjbx0saZ1UBO/vHZJvLA+mSJkac4/M3wKKFAR12kvLGQzMq1WWRR0vczY/kd473lS+a9FWDZcFvQy3ACmzgtaJuCzHTu5xWkSWL3ESFxDbLEqYwrST13RxQmhwct9bZvbVZrLEAvGX+uaBXKXGTuQqgKuetLO/r0pd3aaKIt3s2tyfcJhn0SHVY7xBfha1a3WFrxYo4ReIZJZePjS40Pp5g0DfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CY8PR11MB7105.namprd11.prod.outlook.com (2603:10b6:930:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 06:47:14 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:47:13 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: Re: [frank-w-bpi-r2-4.14:6.9-r4-mt76 28/30]
 drivers/net/wireless/mediatek/Kconfig:16: can't open file
 "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
Thread-Topic: [frank-w-bpi-r2-4.14:6.9-r4-mt76 28/30]
 drivers/net/wireless/mediatek/Kconfig:16: can't open file
 "drivers/net/wireless/mediatek/mt76_r4/Kconfig"
Thread-Index: AQHaju7mJHYjQdaHkEa4Xhfiv8u6uLFqdCUA
Date: Tue, 16 Apr 2024 06:47:13 +0000
Message-ID: <3ad9b77e76bea892914aefce82ebac37443d3095.camel@intel.com>
References: <202404151217.r4ybuTL5-lkp@intel.com>
In-Reply-To: <202404151217.r4ybuTL5-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|CY8PR11MB7105:EE_
x-ms-office365-filtering-correlation-id: 98b203e0-aef1-4899-60ee-08dc5de10c88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X2ox7x8EdlVJiNHPvkvHgAQzGDrmmtk72sIzEK3XjSveRVdGMGKw/jGt0GTSfu3yqpptAe2ivJVSwRnGeja5u6CkeT5Gseeuk2WDjKe3XhXXjgeuqwgzXllNyFhoZM5KVbSEOBv19k66/WAASdoTVlk820sbn937XeiWlLoGDOCQh/10Qau57ddQGtuR0qfybNjLHjfIJHsmwWm1VS2rKS1JGPioWXqLZHoK4mo1VyU6TW+XOaZTpbymA1PJ2WntGP8wclGm0W2bIZpezbzUJjbJkGubgbX03azguYYx1cEiOPZqTRSU6GzIDuT7v08J0rvHMsbTn5IbNvTrnGe1cyexJvPzuOPIi3DfSqEV+nAY3ThyRj4L58dI2ybz49W8PbJ2zfIqfe3HfcUPXV5c9J/cAtwkIoM0U+EBOF1bJekb4jaqHdSa5Hecf7UMtP7X8xjV5ndr96WcDD9J/0/Pn1yuhLql7BXJVDDe43JEFkGKb3j3uQqy17JUwZijL+hTV/yBUIs2nbwoqJk1sZ7AUeLkNNbQU3ibQWcXuFCGd1XQe3PmGvaxCxMTGIIIlR1GihCve62GibwRylgr9e0C95pCrFz1auETDmtZXEkCBguEOrQ3JzKWu/LTV/N+efkTzc2f60N0jcer8jNV7PH7qWBHFAk42Fw5LAb/WGcPkuP7Kch5FVxxOfjtNIVeUmaN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXpzY24ydFJwR21Tallmd1dZV1Z0anlUdjQyRmdqWk9vQkhNMkFKeVVSbTIy?=
 =?utf-8?B?cHdiYXlsRXBjaEhUYnovVkZ1RFlkY3RacTJXVVVJdmhqZUZ1MnNvMktOTVJ6?=
 =?utf-8?B?Vlh1NnpCYkxMLzdlREdwU2swY25ZT04wU2tjOXppblhCeTAvRXgwUXNZdGNr?=
 =?utf-8?B?d2dMMC9mejFZTTVFNTY2STFaa25acjUrZ3FlK0xPODdMNjJMWjRQQXlJS1JC?=
 =?utf-8?B?bjZaVkRlWnMzckNSM3ZrNU9CNEtEdFhOVU4rOWVLTlU4R0p2TmpUNFhmYytL?=
 =?utf-8?B?RlpmU3ZWYU5lT2U0U1gwY3NlN3YyckpFc05yTVFmNHpPS0kxanhqVm1zeE5r?=
 =?utf-8?B?ZFJkREs5cVhLVzd6VkhTQk1zb0xSZWhMcGJmelZmVTBOYlZUZmQyTGtFNkdj?=
 =?utf-8?B?bXdWck1jVzhsbGxyK1FGVTFNMjhITFdYNzNpTzdJemlqSUFadzlYdlo4TFhJ?=
 =?utf-8?B?M25Kb3lnTEhvcThsUVlONWttZjlleVdUT1ZGcHh4cU9MRUxKb1lUUTlhOXRS?=
 =?utf-8?B?c2hqTjFjUjB6QjM2ckhheitNZDNxektmU2lUeG90MHBSZFJUaWNnaDNCblhu?=
 =?utf-8?B?K0tZbHJ5ZVFhVTh1WkZEUmN1ZFJ1TE8waFA1VHo3cSswQUxXT0ZQNW80YkNn?=
 =?utf-8?B?d0lzc21wU1A2ZVVnM3JnR3BlY0FZd0ZrZVJiRi90VzIyUHFEaXlaT3ZPN2hu?=
 =?utf-8?B?SENBZnJaVUFyVC81MGNYcnNCdFlPNWhGdUZPb2NSTWNqdlFib0ZlZzhTbjBG?=
 =?utf-8?B?MGdYRmlkbENRSVNiaHI3RTU3ampMN1NqaTQ5dFBDZEFGc2U0VEhBcFNhZ0pv?=
 =?utf-8?B?L0VaVlUxNGRuMlFtRUtVS2w2SlNWRGZRSTRXQ2JwWFpGUjJFY0NDNUR2eVVz?=
 =?utf-8?B?dVFBTm14eXpyM3k0bFFrYWRXYUhZcHBtZU1hUHM5M3h4TGphd3pSOFZ3VzBT?=
 =?utf-8?B?L1VjbUxqSFRuN2gyT2NpZFAxdytBL29hbHRSSUZBTzFIUkdtbzZZZEtrSGFF?=
 =?utf-8?B?cy9adExVYU41LzRmWHRCQStoQ2hVdjNxNzE2Znl4U3JWL3pmWXJweldJYjVQ?=
 =?utf-8?B?bm5MZHAwYkg2VXlwWnY5OHhIOXBuRjlZWTczR3hJU3hoNTBOZUp3SmlUdUx2?=
 =?utf-8?B?bTJhVUNHdENQei9rSFh3a2RRNmFwbytObzlNZHhjT3kyMkpnMko2MlBYRlh2?=
 =?utf-8?B?VFFnalNmQ2hUdVc2bUJZNWg5WTdmdmV6c3c1cHprWGFzdmZUYjNKRW9MSWdL?=
 =?utf-8?B?RytBUFBDUHNqVWVYSXYvYnFlT2ZSWWxMczlCS3ZaSXgwYVoxVEpmTEFGYTRU?=
 =?utf-8?B?SXJUdlBNdUl3Z1Zxb1NZV0ZrdEdGRllmU3E2V0VSRXNvcDY2bngxazYyOWor?=
 =?utf-8?B?cFpHN0lPM1FIZHVOeVZzSTRDNzJsTVZMMktqT0VINnN1UDNCK20xODlnS1Z5?=
 =?utf-8?B?MGxHR3VDb3NFL0Y0STQ5bUkxcUlSVEI5OG1DbDFneEQwWXQrRk1ka1JJUC93?=
 =?utf-8?B?enZqMnJLVGNjUis3MkJpYkVLSThyd2NLdTNIRHhPQ1lLdmgzTWhWS1dLbUx3?=
 =?utf-8?B?TW1va0tSZnJwKzZuV0VrQVNsL2JQOVB0Z1J3MmpUck5vT3h5aXBIWEFYbmVS?=
 =?utf-8?B?SmhZSVdQTE15TkhjbVd3OHh4TG5LSjd6alN6VGpxRlQzOTVUaEt4eFFub3Za?=
 =?utf-8?B?RU03VkZDdGx6cFBFMVMzdXEvWHZFWk9paVorRk94QkxIQ3VQendIald3SGMx?=
 =?utf-8?B?VmQ4cldvVjY1Mkp0Y2xtNEo1Q2JMNDFhUEhYQVlpZEdkMUlab3crRXlBbWxB?=
 =?utf-8?B?aklLcmFLQUFoNW45ZnloM0VHRkpWZ1hsemx1UklqMWxYVDZ2Q0FCTFI1TDRU?=
 =?utf-8?B?UXpDRysySmViWTYzYlBYLzY0dXdiRUg2QzdFQ3ZlcG95cFJTSmdZZFRIMG9T?=
 =?utf-8?B?SUxYMVJLL20xQS9TVHd6Znd2U2lGNW1IVWhzRy9YWGZmd1c4ZmM1N0ZXcG4w?=
 =?utf-8?B?aEVZVlBXQkx1cW5tYXZ5WGE0M0UvZGx5dFBXMGhoOGNzQkNuTVlUSlVWOU5j?=
 =?utf-8?B?L2x0b2E5VUtzcktmSklkYW85RUd6SUh5eEdEQVRzOXVTbDEvSnNBZTRVZk1u?=
 =?utf-8?B?dWRUYTZEcjhmalJyMXMrenBYWk1OM2h3aVRoa2pBOHRrdFB6TXJSdFE0Z3Ux?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD64B89597171643AD361FFA71AA7513@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b203e0-aef1-4899-60ee-08dc5de10c88
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 06:47:13.8765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sX68Zrb1jRwp5+Co/CdArr7IUybCc/CYas2NDWliFYlNtrR+Mw8lMMPsXN2SIouR40h1UPjlRkw2plUeSyezvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7105
X-OriginatorOrg: intel.com

bm90X3JlcG9ydA0KDQpUaGlzIHNlZW1zIHRvIHJlcXVpcmUgY2xvbmluZyBhIHN1YnByb2plY3Qg
dGhhdCBkb2Vzbid0IGV4aXN0IGluIGtlcm5lbA0KdHJlZS4NCg0KY29tbWl0IDYwYjA4Y2UyYTQ2
ZGI0M2RmNjExODgzYjIzZGI4MzBiMjZmYmVkYzINCkF1dGhvcjogRnJhbmsgV3VuZGVybGljaCA8
ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+DQpEYXRlOiAgIFN1biBBcHIgMTQgMTg6NDA6MzggMjAy
NCArMDIwMA0KDQogICAgbXQ3NjogYWRkIG10NzYgc3VibW9kdWxlIGZvciByNCAoYnBpLXNvdXJj
ZSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL0tjb25maWcg
Yi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9LY29uZmlnDQppbmRleCBiZDRkYjEyODI0
OGU4Li45ZTliZWRjYjFkYmUyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVk
aWF0ZWsvS2NvbmZpZw0KKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvS2NvbmZp
Zw0KQEAgLTEzLDQgKzEzLDUgQEAgY29uZmlnIFdMQU5fVkVORE9SX01FRElBVEVLDQogaWYgV0xB
Tl9WRU5ET1JfTUVESUFURUsNCiBzb3VyY2UgImRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzYwMXUvS2NvbmZpZyINCiBzb3VyY2UgImRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzYvS2NvbmZpZyINCitzb3VyY2UgImRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210
NzZfcjQvS2NvbmZpZyINCiBlbmRpZiAjIFdMQU5fVkVORE9SX01FRElBVEVLDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvTWFrZWZpbGUgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9tZWRpYXRlay9NYWtlZmlsZQ0KaW5kZXggODA2MTcyNjU5YmYyZS4uOWZhMzBkOWZj
ZTM2ZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL01ha2VmaWxl
DQorKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9NYWtlZmlsZQ0KQEAgLTEsMyAr
MSw0IEBADQogIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQogb2JqLSQo
Q09ORklHX01UNzYwMVUpICArPSBtdDc2MDF1Lw0KIG9iai0kKENPTkZJR19NVDc2X0NPUkUpICAg
ICAgICArPSBtdDc2Lw0KK29iai0kKENPTkZJR19NVDc2X0NPUkUpICAgICAgICArPSBtdDc2X3I0
Lw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzZfcjQgYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2X3I0DQpuZXcgZmlsZSBtb2RlIDE2MDAw
MA0KaW5kZXggMDAwMDAwMDAwMDAwMC4uZmI2Mjk0MDE0ODVjNg0KLS0tIC9kZXYvbnVsbA0KKysr
IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Nl9yNA0KQEAgLTAsMCArMSBAQA0K
K1N1YnByb2plY3QgY29tbWl0IGZiNjI5NDAxNDg1YzZhYTU1NTlmOWFhMzQ4ZWFmYjczZjhkNjM4
ZTIgICA8LS0NCg0KDQpPbiBNb24sIDIwMjQtMDQtMTUgYXQgMTI6MzggKzA4MDAsIGtlcm5lbCB0
ZXN0IHJvYm90IHdyb3RlOg0KPiA6Ojo6OjogDQo+IDo6Ojo6OiBNYW51YWwgY2hlY2sgcmVhc29u
OiAibG93IGNvbmZpZGVuY2UgYmlzZWN0IHJlcG9ydCINCj4gOjo6Ojo6IA0KPiANCj4gQkNDOiBs
a3BAaW50ZWwuY29tDQo+IENDOiBvZS1rYnVpbGQtYWxsQGxpc3RzLmxpbnV4LmRldg0KPiBUTzog
RnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+DQo+IA0KPiB0cmVlOiAg
IGh0dHBzOi8vZ2l0aHViLmNvbS9mcmFuay13L0JQSS1SMi00LjE0IDYuOS1yNC1tdDc2DQo+IGhl
YWQ6ICAgNmRiNjRjOGJiNzY3N2UzZWZiNDdlYzQ2NWQzODRhNWQxMjEwNDMxNg0KPiBjb21taXQ6
IDYwYjA4Y2UyYTQ2ZGI0M2RmNjExODgzYjIzZGI4MzBiMjZmYmVkYzIgWzI4LzMwXSBtdDc2OiBh
ZGQgbXQ3NiBzdWJtb2R1bGUgZm9yIHI0IChicGktc291cmNlKQ0KPiA6Ojo6OjogYnJhbmNoIGRh
dGU6IDEyIGhvdXJzIGFnbw0KPiA6Ojo6OjogY29tbWl0IGRhdGU6IDEyIGhvdXJzIGFnbw0KPiBj
b21waWxlcjogY2xhbmcgdmVyc2lvbiAxNy4wLjYgKGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xs
dm0tcHJvamVjdCA2MDA5NzA4YjQzNjcxNzFjY2RiZjRiNTkwNWNiNmE4MDM3NTNmZTE4KQ0KPiBy
ZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcv
MGRheS1jaS9hcmNoaXZlLzIwMjQwNDE1LzIwMjQwNDE1MTIxNy5yNHlidVRMNS1sa3BAaW50ZWwu
Y29tL3JlcHJvZHVjZSkNCj4gDQo+IElmIHlvdSBmaXggdGhlIGlzc3VlIGluIGEgc2VwYXJhdGUg
cGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZlcnNpb24gb2YNCj4gdGhlIHNhbWUg
cGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiA+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gPiBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MTUxMjE3LnI0eWJ1VEw1LWxrcEBpbnRlbC5jb20vDQo+
IA0KPiBBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+ID4gc2Ny
aXB0cy9NYWtlZmlsZS5jbGVhbjoxMjogZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3
Nl9yNC9NYWtlZmlsZTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+ID4gbWFrZVs4XTog
KioqIE5vIHJ1bGUgdG8gbWFrZSB0YXJnZXQgJ2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVr
L210NzZfcjQvTWFrZWZpbGUnLg0KPiAgICBzY3JpcHRzL01ha2VmaWxlLmNsZWFuOjEyOiBGYWls
ZWQgdG8gcmVtYWtlIG1ha2VmaWxlICdkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2
X3I0L01ha2VmaWxlJy4NCj4gICAgbWFrZVs3XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmNsZWFu
OjYxOiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2X3I0XSBFcnJvciAyDQo+ICAg
IG1ha2VbN106IFRhcmdldCAnX19jbGVhbicgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4N
Cj4gICAgbWFrZVs2XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmNsZWFuOjYxOiBkcml2ZXJzL25l
dC93aXJlbGVzcy9tZWRpYXRla10gRXJyb3IgMg0KPiAgICBtYWtlWzZdOiBUYXJnZXQgJ19fY2xl
YW4nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ICAgIG1ha2VbNV06ICoqKiBbc2Ny
aXB0cy9NYWtlZmlsZS5jbGVhbjo2MTogZHJpdmVycy9uZXQvd2lyZWxlc3NdIEVycm9yIDINCj4g
ICAgbWFrZVs1XTogVGFyZ2V0ICdfX2NsZWFuJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3Jz
Lg0KPiAgICBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuY2xlYW46NjE6IGRyaXZlcnMv
bmV0XSBFcnJvciAyDQo+ICAgIG1ha2VbNF06IFRhcmdldCAnX19jbGVhbicgbm90IHJlbWFkZSBi
ZWNhdXNlIG9mIGVycm9ycy4NCj4gICAgbWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmNs
ZWFuOjYxOiBkcml2ZXJzXSBFcnJvciAyDQo+ICAgIG1ha2VbM106IFRhcmdldCAnX19jbGVhbicg
bm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gICAgbWFrZVsyXTogKioqIFtNYWtlZmls
ZToxOTI0OiBfY2xlYW5fLl0gRXJyb3IgMg0KPiAgICBtYWtlWzJdOiBUYXJnZXQgJ2Rpc3RjbGVh
bicgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gICAgbWFrZVsxXTogKioqIFtNYWtl
ZmlsZToyNDA6IF9fc3ViLW1ha2VdIEVycm9yIDINCj4gICAgbWFrZVsxXTogVGFyZ2V0ICdkaXN0
Y2xlYW4nIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+ICAgIG1ha2U6ICoqKiBbTWFr
ZWZpbGU6MjQwOiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+ICAgIG1ha2U6IFRhcmdldCAnZGlzdGNs
ZWFuJyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiAtLQ0KPiA+ID4gZHJpdmVycy9u
ZXQvd2lyZWxlc3MvbWVkaWF0ZWsvS2NvbmZpZzoxNjogY2FuJ3Qgb3BlbiBmaWxlICJkcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2X3I0L0tjb25maWciDQo+ICAgIG1ha2VbM106ICoq
KiBbc2NyaXB0cy9rY29uZmlnL01ha2VmaWxlOjg1OiBvbGRjb25maWddIEVycm9yIDENCj4gICAg
bWFrZVsyXTogKioqIFtNYWtlZmlsZTo2ODg6IG9sZGNvbmZpZ10gRXJyb3IgMg0KPiAgICBtYWtl
WzFdOiAqKiogW01ha2VmaWxlOjI0MDogX19zdWItbWFrZV0gRXJyb3IgMg0KPiAgICBtYWtlWzFd
OiBUYXJnZXQgJ29sZGNvbmZpZycgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gICAg
bWFrZTogKioqIFtNYWtlZmlsZToyNDA6IF9fc3ViLW1ha2VdIEVycm9yIDINCj4gICAgbWFrZTog
VGFyZ2V0ICdvbGRjb25maWcnIG5vdCByZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IC0tDQo+
ID4gPiBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9LY29uZmlnOjE2OiBjYW4ndCBvcGVu
IGZpbGUgImRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzZfcjQvS2NvbmZpZyINCj4g
ICAgbWFrZVszXTogKioqIFtzY3JpcHRzL2tjb25maWcvTWFrZWZpbGU6ODU6IG9sZGRlZmNvbmZp
Z10gRXJyb3IgMQ0KPiAgICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjY4ODogb2xkZGVmY29uZmln
XSBFcnJvciAyDQo+ICAgIG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6MjQwOiBfX3N1Yi1tYWtlXSBF
cnJvciAyDQo+ICAgIG1ha2VbMV06IFRhcmdldCAnb2xkZGVmY29uZmlnJyBub3QgcmVtYWRlIGJl
Y2F1c2Ugb2YgZXJyb3JzLg0KPiAgICBtYWtlOiAqKiogW01ha2VmaWxlOjI0MDogX19zdWItbWFr
ZV0gRXJyb3IgMg0KPiAgICBtYWtlOiBUYXJnZXQgJ29sZGRlZmNvbmZpZycgbm90IHJlbWFkZSBi
ZWNhdXNlIG9mIGVycm9ycy4NCj4gDQo+IA0KPiB2aW0gKzE2IGRyaXZlcnMvbmV0L3dpcmVsZXNz
L21lZGlhdGVrL0tjb25maWcNCj4gDQo+IDYwYjA4Y2UyYTQ2ZGI0IEZyYW5rIFd1bmRlcmxpY2gg
MjAyNC0wNC0xNCBAMTYgIHNvdXJjZSAiZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3
Nl9yNC9LY29uZmlnIg0KPiANCg0K
