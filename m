Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15902EEAB
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713249040; cv=fail; b=OpOwih+SEmCqqivfh+DVXqL1KDNidw3BS2ly4nKjJ/aqdqnHnkxTU7ZmapuqKtFagVir2dQVy7P+nvwKRst1hksD4qxhHvpfxz0hzbWrPTBqZVU6OyU9ONHlnLbnA9cW4FWOcEPQUbnOYVgkc3DLDfI7kiCMkVb8PpK9zXyJJ0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713249040; c=relaxed/simple;
	bh=sBdyE6yJ008yBCsJKMbzJuOk5naWgA+8TKPVJYlDgEU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BUPEwh8vd8uugsYphbds53mEkHTWlbmwrWbkv2PpvuY30GwNObqXoo5HguXdqWoVl7k7dMZIgWUWDhyPjUplWz/RH79c5xs30LcPV5h0YMbwewkn8l65JNN+QZDiR7v3CMkbBvaYzDQRgO9IeRhzzOx2dVy05qAaIuEyPMP/VzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Te2kp0KI; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te2kp0KI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713249039; x=1744785039;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=sBdyE6yJ008yBCsJKMbzJuOk5naWgA+8TKPVJYlDgEU=;
  b=Te2kp0KInqghrvXosZGzuHCykX/rlQlek0fhbj2rolkL69mZY8bv9UVC
   6mOi2iivtHFb3X02kXb4WhaR/JsfCy6IW/wJ9Ox61pPzKT64OsNZy9aam
   tdweoQkpw70LyVK5qPgIQFYYZBtsd39qbPS8vATHvztDLXFXI3H8KEMaK
   F1Cz1TCw2h9/i1PbbSCZrDzetj2cG1lEd9IXMU54VumtIKK8nhuiHwGeD
   tY76swyDJhchOeAOysHOOCKCXgu6ec1tiRVOA8ohQxe2b+XhJPU8VsPxL
   DPyk7VWg3eTgyp4KqW4Nq78BSgbaOA76BK4ZWnKgIuJr7L6gSvJJsL61k
   Q==;
X-CSE-ConnectionGUID: zHA45L7lSmS7+E47NyGLlQ==
X-CSE-MsgGUID: MQgUnAxBTcizKNYRboFrhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8778473"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8778473"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:30:38 -0700
X-CSE-ConnectionGUID: EGyvWW0qQJyzRAjusgkY0Q==
X-CSE-MsgGUID: kCtyRf1RQcqtgcuxOJmH5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26936281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:30:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:30:37 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:30:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAX1b5vVdpnVs9kotCoSg32kcX0egrTLHIafBiTJ9b+my96OE3m1j8gI5/MHW/zMz+7C2JGPtcymwWpyR6lJOWdh/ATkP6JP8PEHiiSpX1dAwD4exlYI7D0Wa+J6nHj6bYZzJ4n9KTF1bMkRjFcuJdY3LvzhTETS45S7JdugDfxkQqgCzl5AqhDAyc/qpGl4VMJOFEXu13kJp3COZoMGpxcwsbyHblGlCQQIuoSOyOA8feOiYhqwizBKs5aQLmwXzEYBMWsZXoB1RJyx6fd6qtuobfTCNewv8NKholLLUrHl2WAs4dseLQ2f2xZ8YAt/oixZTGhh7Et/TIkUFdJ3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBdyE6yJ008yBCsJKMbzJuOk5naWgA+8TKPVJYlDgEU=;
 b=k3H0ADrTAyO3FYSaBkhvTc5UtcllP3MOQxBR7gE1FxBTjLsqw4WEFnaVQD8QsfEZdjQFsvlZH9focfIbs1AZja5p1HGDzBy5lQF7fGufXN3grOzxtOHNndgHpqa5TL3mZFNr9ePSDMDeH4eFYQWmzIFXsWQCeL+1m9hIl+Eqp9kyQJmYR9onv/nHS8iUZu8iCkhUy7oml2iEnQ4hcd2U02K+gJceFLTNmuTpf5E67Rg0u/S475swZSd6gRpyU5Fojs0TpqrNuRHhJFdp4sbPudZcjzfpc1QPrwHpRwU0TRieUQ8r1xJq0em9O6GCH1iIXBxHigXYSHMDsgPKiIXdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 06:30:35 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:30:35 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: Re: conf.c:119:1: warning: non-void function does not return a value
 in all control paths
Thread-Topic: conf.c:119:1: warning: non-void function does not return a value
 in all control paths
Thread-Index: AQHaj6vOX+fQDNxGe0WpJkqqi6KmBbFqbfIA
Date: Tue, 16 Apr 2024 06:30:35 +0000
Message-ID: <516b37988f1af60912de97f046d590db3ade6656.camel@intel.com>
References: <202404161009.ZcnFbWPa-lkp@intel.com>
In-Reply-To: <202404161009.ZcnFbWPa-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|MW6PR11MB8312:EE_
x-ms-office365-filtering-correlation-id: 43a9f5d3-10ba-4726-39d9-08dc5ddeb965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Azbj0sovVMIcgj6bp28By3/zHFpAZ16+iJsYp4zbtMmVSACNKkHvZ+BbiLaVVvzJfhodAUN3hdXKYeZaB0+TvPEg+Qm0OisI6szKXhAY722htJetAK/ZPZmnrel/9cbNusFVciyCftO4fFT7O6wQ8FfGF2F3ky1A+7HJdfKStHQXzIXfh2/O4E22f3HHVGuR3VMvYfW1FKDRD/LDEfhE695Pc5GxPtmvf765CCqD8fX00MgelocBYU0kkoL3JHJBs07mmlGlJc12KEa6br3AKyN3+zIo9qKEpADZw9Jj8VqkY1KaajMJ8ag54Jc7PEOqfkWos6FRZGcd0tHpoBbXmQlxGlSglsQw1bCWrSUs8yE3CtW2Pe5ueUkee/8VnRXOXcr8xDCre6MXS5SUkl7z0M68U4kxy/E8Twz1+8f2Bir2rMXwS7FxQJc8QqAN1BFEU8/MUtJcQLhksSH+ADuKmgGRi4Hy97V9l7buWuvSbmfGrZTm0cvCIuy1lBsrxaDl34Wwo8YD/zWlde21kmrQTigy7N0Vq37zlNH792xcbzEjOd3+B4vNg9kE+u3d3Yiw2qKh4a353D0ygB61DnW9TR872NBWUnrOcSLUxp3LyQdmyanlItsq/uJc0bLk1dE8Lis2QsL8WPeERHsHEPEQh8vPbuz35iJUXUKn97y9NSskkKM9rZfVZvV70sb39ymD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2Q3T3hDelEvRjd3MFViSmd6NExDd0tjeWl4Tm1YdVdkdWNaVUpLYkoxVGU5?=
 =?utf-8?B?V1NkM0FiYy9qTFZIQXM1UGdKWm5YS0FDdXZTUXlEZGg3N0QrRFdNQWUraFg0?=
 =?utf-8?B?RzF0cDFhKytYVDJxcDIweWxJQzNzRWM2WmRNTW5NbUVnZUljME9EN3ZPTlh6?=
 =?utf-8?B?YWs4MEdvYVRqTFNQWFd2aWRqSHVsbCtZWCtKMVdiNmNjVlNDL0E3cDd4UGJI?=
 =?utf-8?B?TiszY2hJcHNtL1NjNVRFWHZKT3lQZGR5VncrUkF1TTFLdzlEWWJzS0RVaFRy?=
 =?utf-8?B?NXNkWk5zMFl5a1hVWTVTcE1FWnhrVVpnUGhDRDhBVlR3dUhmZkl3VzdvemRM?=
 =?utf-8?B?NGJFOVJtaGphcVI2Q01ReXFZN20vQWY5NGlldkZlWEVoSjRVNnc5ejRIdGtW?=
 =?utf-8?B?TFpHMzAxS3NDRHYzWGRENVF5eDl1MGYxSldoeUdORzAzVFhBZVVtMUNEMTNx?=
 =?utf-8?B?NjRhblp1UEo0Mzh5MDRwQ1BqL0crVTAvM3lWaGxTbXhPQXpYMTJ3UERXL1Jk?=
 =?utf-8?B?WEZpZzFYemRpdDNOdkU3RGpMZUVzRmlBL1MxR2c1dERwR2lKTU5FUzZpU0U5?=
 =?utf-8?B?eFJsbEcybGNYZHZlMmpoclArcGpQK1YvZmVoWVhlTUVSN3RYdHdIbW9oM2hS?=
 =?utf-8?B?VEs3dUJMMnlFdUMrK2haWDlrdmw1T2c1WForK2RidmhNNjh3ZWoxZ1pTMkxC?=
 =?utf-8?B?NEZmbEJkdWpWY0FKSGpvMUFhVUFmeG0vOWtnU2xhY1dsUDQ2Ty95eENDQ3Zh?=
 =?utf-8?B?KzQ0cXQvRGhjSWpCRUxReldEYkhsYW9VZUFXYWlKcmVlV3liaElHc3Fia1Fw?=
 =?utf-8?B?NjN3ZE9MZTRiYjU1dTlCN1JHcnVhRmdjOXZOUzY1anVnemlxOGlVb3RuTHJY?=
 =?utf-8?B?K2xZVVJVc2t1cFFZTzE3QmJwZVh4bzNUR05LNXZ6eUhCNlNYb1JFVVNTZVV0?=
 =?utf-8?B?eHNMc3B2WHQ0R0trU0duUTdEUWF3VGdKYkFNNUNqeUt2NXkyYXNiM2xKNFkz?=
 =?utf-8?B?cytsR3gxOWR0Z3JMVXFhRmtVbUlsOEFWTUVzc2dlL3FEazRlWk1YMEp6R3BD?=
 =?utf-8?B?b3dxNGF6YWdBWk8xZlpvbmV2SjNsRHl6WmpMYktITTRQY1QzNVZtM3B3cGFU?=
 =?utf-8?B?RmZFcmFGdE9CK1Y4TmZLRzBqbm1wbXIzTGIwV3c4ODV1WmIwTEZWVnlVNjlr?=
 =?utf-8?B?bnhPeFpHcWFVWUl4RVNUR1ZBdHAyVi9jUVRtZVNzYk9OY1JZa1A4WXhtdVlS?=
 =?utf-8?B?d0FsdTF3MklzWktmMFdHa25jNno5MDhTL3NhMDBRRHFZQ0xmNHpCNWpCakZ5?=
 =?utf-8?B?Z1pQK2VaSU9jNHpiOS9sdEQyaWJ0RnB5elpnVDB1ZTltTnM1K3dkekt0TmdV?=
 =?utf-8?B?WFU0aG1CSmpKaGNaRG1SS09RV3VvTEh3QnVEejl5cW9UT3NqQ1FuZ1JCSWFq?=
 =?utf-8?B?MFJXaldqMTYzeldhQnhMN0VJTU04S002bGgwQkVDc012S2pGdnE2ZFBmbkcv?=
 =?utf-8?B?QmZ0a1BPS0xFUXBZM2ZCS3pubTN3VFIveEc2anNTaTVJZVBxeVBpREVHejFm?=
 =?utf-8?B?SVBGSXU2ZFRaeVEwMmc3YkZHZktVajlhalpuU0cxazIwS2JkNHF0RUllRHM5?=
 =?utf-8?B?cW1kUVM3K24wdDIrVmFDZlpEcExvVHpaR1cvMWg3SXVBcm1Fd0ExRXF4Sk1S?=
 =?utf-8?B?WmZjNU5iblg5Y05qTnVvd1pMR2RYS09CQU9welBORDNuMkVxWHlzWHRWYzZu?=
 =?utf-8?B?QmpObkM1c2tabHlweWxRM2dMYmd6ZkNrTHp6Q0hzcU5sOEdxNmVXSzlHRUJl?=
 =?utf-8?B?aEo2RE5ESHhDcnkycnlrOUhsZUt2S1J4M3JheEwydG5xdXhNeGx5OThVQWNy?=
 =?utf-8?B?V1JXVzl2WXBOY3hJNURtQXRCaWprTnZYNmFPcFRvTkRtZVpHWVhaZVNKUm9L?=
 =?utf-8?B?Q0d0MjBJTjdaZmxzT0hiNUZlNnF2OWp6VWxZQ2hHSkQwcFpNY0g3K2h3aDFr?=
 =?utf-8?B?VTV4aHFpM2VWWWhjNXN2bmgzU1l6bmhXaVpFVk1HV3BWckdCcjVGTnBVZnU1?=
 =?utf-8?B?ZFBhYjdjZDRtQzNwd21lZ0U4TkFhQmoxa1lJMDNTeXJFaFRwQk9yeVZnUnNT?=
 =?utf-8?B?ZC80S2kwRzFXbWt4QU9OV1NmNkRUdk5ubzl6RjB2UzlPcGhlZmhWNUEyTlJ2?=
 =?utf-8?B?SXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E44C0DEFD670D498A220C50206E53B5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a9f5d3-10ba-4726-39d9-08dc5ddeb965
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 06:30:35.3899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Y0nLz8vRrM36nReQJPGl1HOguclddMRbYBwVcbAi3nswioo6wD2KWvr+3Trq6xmFoNX6rV5K3xQHOhflFFm9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
X-OriginatorOrg: intel.com

bm90X3JlcG9ydA0KDQojIFBhcmVudCB3YXJuaW5nOg0KDQpjb25mLmM6MTE5OjE6IHdhcm5pbmc6
IG5vbi12b2lkIGZ1bmN0aW9uIGRvZXMgbm90IHJldHVybiBhIHZhbHVlIFstV3JldHVybi10eXBl
XQ0KfQ0KXg0KDQojIEZCQyB3YXJuaW5nOg0KDQpjb25mLmM6MTE5OjE6IHdhcm5pbmc6IG5vbi12
b2lkIGZ1bmN0aW9uIGRvZXMgbm90IHJldHVybiBhIHZhbHVlIGluIGFsbCBjb250cm9sIHBhdGhz
IFstV3JldHVybi10eXBlXQ0KfQ0KXg0KDQpPbiBUdWUsIDIwMjQtMDQtMTYgYXQgMTE6MDkgKzA4
MDAsIGtlcm5lbCB0ZXN0IHJvYm90IHdyb3RlOg0KPiA6Ojo6OjogDQo+IDo6Ojo6OiBNYW51YWwg
Y2hlY2sgcmVhc29uOiAibG93IGNvbmZpZGVuY2UgYmlzZWN0IHJlcG9ydCINCj4gOjo6Ojo6IA0K
PiANCj4gQkNDOiBsa3BAaW50ZWwuY29tDQo+IENDOiBvZS1rYnVpbGQtYWxsQGxpc3RzLmxpbnV4
LmRldg0KPiBDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBUTzogTmF0aGFuIENo
YW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPiBDQzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+DQo+IA0KPiB0cmVlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBtYXN0ZXINCj4gaGVhZDog
ICA5NmZjYTY4YzRmYmY3N2E4MTg1ZWIxMGY3NTU3ZTIzMzUyNzMyZWEyDQo+IGNvbW1pdDogZjdk
NWJjZDM1ZDQyN2RhYWM3ZTIwNmIxMDczY2ExNGY1ZGI4NWMyNyBzZWxmdGVzdHM6IGtzZWxmdGVz
dDogTWFyayBmdW5jdGlvbnMgdGhhdCB1bmNvbmRpdGlvbmFsbHkgY2FsbCBleGl0KCkgYXMgX19u
b3JldHVybg0KPiBkYXRlOiAgIDQgZGF5cyBhZ28NCj4gOjo6Ojo6IGJyYW5jaCBkYXRlOiA2IGhv
dXJzIGFnbw0KPiA6Ojo6OjogY29tbWl0IGRhdGU6IDQgZGF5cyBhZ28NCj4gY29tcGlsZXI6IGNs
YW5nIHZlcnNpb24gMTcuMC42IChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3Qg
NjAwOTcwOGI0MzY3MTcxY2NkYmY0YjU5MDVjYjZhODAzNzUzZmUxOCkNCj4gcmVwcm9kdWNlICh0
aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJj
aGl2ZS8yMDI0MDQxNi8yMDI0MDQxNjEwMDkuWmNuRmJXUGEtbGtwQGludGVsLmNvbS9yZXByb2R1
Y2UpDQo+IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1p
dCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1p
dCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRl
c3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjQwNDE2MTAwOS5aY25GYldQYS1sa3BAaW50ZWwuY29tLw0KPiANCj4gQWxsIHdh
cm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6DQo+IA0KPiA+ID4gY29uZi5jOjExOTox
OiB3YXJuaW5nOiBub24tdm9pZCBmdW5jdGlvbiBkb2VzIG5vdCByZXR1cm4gYSB2YWx1ZSBpbiBh
bGwgY29udHJvbCBwYXRocyBbLVdyZXR1cm4tdHlwZV0NCj4gICAgICAxMTkgfCB9DQo+ICAgICAg
ICAgIHwgXg0KPiAgICAxIHdhcm5pbmcgZ2VuZXJhdGVkLg0KPiANCj4gDQo+IHZpbSArMTE5IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2Fsc2EvY29uZi5jDQo+IA0KPiBhYmE1MWNkMDk0OWFlZSBK
YXJvc2xhdiBLeXNlbGEgMjAyMi0xMS0wOCAgMTA3ICANCj4gYWJhNTFjZDA5NDlhZWUgSmFyb3Ns
YXYgS3lzZWxhIDIwMjItMTEtMDggIDEwOCAgc3RhdGljIGludCBkdW1wX2NvbmZpZ190cmVlKHNu
ZF9jb25maWdfdCAqdG9wKQ0KPiBhYmE1MWNkMDk0OWFlZSBKYXJvc2xhdiBLeXNlbGEgMjAyMi0x
MS0wOCAgMTA5ICB7DQo+IGFiYTUxY2QwOTQ5YWVlIEphcm9zbGF2IEt5c2VsYSAyMDIyLTExLTA4
ICAxMTAgIAlzbmRfb3V0cHV0X3QgKm91dDsNCj4gYWJhNTFjZDA5NDlhZWUgSmFyb3NsYXYgS3lz
ZWxhIDIwMjItMTEtMDggIDExMSAgCWludCBlcnI7DQo+IGFiYTUxY2QwOTQ5YWVlIEphcm9zbGF2
IEt5c2VsYSAyMDIyLTExLTA4ICAxMTIgIA0KPiBhYmE1MWNkMDk0OWFlZSBKYXJvc2xhdiBLeXNl
bGEgMjAyMi0xMS0wOCAgMTEzICAJZXJyID0gc25kX291dHB1dF9zdGRpb19hdHRhY2goJm91dCwg
c3Rkb3V0LCAwKTsNCj4gYWJhNTFjZDA5NDlhZWUgSmFyb3NsYXYgS3lzZWxhIDIwMjItMTEtMDgg
IDExNCAgCWlmIChlcnIgPCAwKQ0KPiBhYmE1MWNkMDk0OWFlZSBKYXJvc2xhdiBLeXNlbGEgMjAy
Mi0xMS0wOCAgMTE1ICAJCWtzZnRfZXhpdF9mYWlsX21zZygic3Rkb3V0IGF0dGFjaFxuIik7DQo+
IGFiYTUxY2QwOTQ5YWVlIEphcm9zbGF2IEt5c2VsYSAyMDIyLTExLTA4ICAxMTYgIAlpZiAoc25k
X2NvbmZpZ19zYXZlKHRvcCwgb3V0KSkNCj4gYWJhNTFjZDA5NDlhZWUgSmFyb3NsYXYgS3lzZWxh
IDIwMjItMTEtMDggIDExNyAgCQlrc2Z0X2V4aXRfZmFpbF9tc2coImNvbmZpZyBzYXZlXG4iKTsN
Cj4gYWJhNTFjZDA5NDlhZWUgSmFyb3NsYXYgS3lzZWxhIDIwMjItMTEtMDggIDExOCAgCXNuZF9v
dXRwdXRfY2xvc2Uob3V0KTsNCj4gYWJhNTFjZDA5NDlhZWUgSmFyb3NsYXYgS3lzZWxhIDIwMjIt
MTEtMDggQDExOSAgfQ0KPiBhYmE1MWNkMDk0OWFlZSBKYXJvc2xhdiBLeXNlbGEgMjAyMi0xMS0w
OCAgMTIwICANCj4gDQo+IDo6Ojo6OiBUaGUgY29kZSBhdCBsaW5lIDExOSB3YXMgZmlyc3QgaW50
cm9kdWNlZCBieSBjb21taXQNCj4gOjo6Ojo6IGFiYTUxY2QwOTQ5YWVlNTBhMmI5M2YxYjMyZWQz
NjY4Y2Q2MTM2NDkgc2VsZnRlc3RzOiBhbHNhIC0gYWRkIFBDTSB0ZXN0DQo+IA0KPiA6Ojo6Ojog
VE86IEphcm9zbGF2IEt5c2VsYSA8cGVyZXhAcGVyZXguY3o+DQo+IDo6Ojo6OiBDQzogVGFrYXNo
aSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiANCg0K
