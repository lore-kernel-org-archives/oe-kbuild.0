Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F64171C0
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 07:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fE0bqV5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700725116; x=1732261116;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O/oVQUydfDz02D5XKeWSV64tHwEYBY95JFBmUVazkh4=;
  b=fE0bqV5/EdJL8w9OPKLZZcNyy34M95V+Js5LQcsZriC5sqMibb+mTwqJ
   G4S59rwxNMblHlkDbapzidkeSamyZhjF307B3OuJb8mgRNos8p293+S3k
   EzBAWFPNlHWGONNiHMO6eVqlTU32JWfDZ30ugqKzXJwugSRT1yVXoZGP3
   EoiNuINb2L4qXEHNTjdnGOCbqavwlt9aCH7zmOOXGQnEwgurxOm95dW7A
   SN5FT9NOGP8f8LpPJN0E7L5oE4L61tIkObyD+w/RDA0pNDSo5iOqnaM/y
   afeBPeCHB68K5bey4oKzjIeAwXBF3gabWg7IwC0AYzADiFOMVTum8wee0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372374036"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="372374036"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 23:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15571281"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Nov 2023 23:38:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 23:38:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 22 Nov 2023 23:38:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 22 Nov 2023 23:38:34 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 22 Nov 2023 23:38:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqxA/DMsklCrqsRfzq6u4Qn2g/YLBohK2QjY+hdTrmn4igdGLkDCBdYGlkYi7yrxNbf2hR71lbAWo7jFrYAimQT6Ad+FTCgVavCjW47xwGwywK3S/7QSCHovir1brN1LnnEeCQy/SlzA2kd8b8WFsfVhI7e+34Xs+ofACUFcJ1uKXs0RV/Itj81x7jTVEgBAxwhdyromgPKOjYiJMi4sPNs5ewT5j4YFbjbMZYM5yt/IjYEv8WXulIxsj8xnq5ndqYBRCZaoMB6Yb0evZo3/8xU9+Yud0qzY+A9EocChNx6FM20SQWuHAl65vwkOIVJxYR8WO7Ap9qKPGbxn2HBi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/oVQUydfDz02D5XKeWSV64tHwEYBY95JFBmUVazkh4=;
 b=AcK02U26cDyuogwDYs06XQ2Gf9iM/G1scjd/8R+GveXqHR1RTUuTfD7tQJ5HgsQyUzuATte9Z6nBz8pLPX6PnLluiz9Xm3D6eOoTpixUDCuh99oYMe6C5bW9q+eO+N9UW5cRct3CWQwTlqmc9d7P7sJhqqLA2Iu7epBffHZ3MLEZUyWvGTNC+K/nSPiiR8qcgI/rlDJ94qyZKBxPlZ+VH8oCBxa4+tAWs7PUqcDeNcdaDBiey11JAdawGRlo9tu0FEN2nJ64m/RExB3v49wpaPSTqRGDFdpWBhKRHHpwxQMpWE6JF3Not8VjrpiPDOo3+RcvZ9iEFhFxcjxqS0pNaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 07:38:32 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e4ae:3948:1f55:547d]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e4ae:3948:1f55:547d%5]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 07:38:32 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>, lkp <lkp@intel.com>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Topic: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Index: AQHaHcyl+gvcvDO4wUKPF6T3Q54tL7CHhC1g
Date: Thu, 23 Nov 2023 07:38:32 +0000
Message-ID: <DS0PR11MB7529E111B3E16BA49B9363F8C3B9A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <202311212250.lTDgKUwk-lkp@intel.com>
 <ZV7fz/Ly6RnZ5Nf4@yujie-X299>
In-Reply-To: <ZV7fz/Ly6RnZ5Nf4@yujie-X299>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|DS7PR11MB6200:EE_
x-ms-office365-filtering-correlation-id: b2e28867-7363-4ae4-4e37-08dbebf731b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8sDrg7Za69LqSX+/DuF1iobKbsGLOiLpHFX3QaD17qifkJq3GKS6vFciL/LodzRsyPuK5RZ0SApNT0cp+ho5ByQpNbqpkgi3veHdiWkKCJwvgaJgSaCcggooPf2yLT6prvVa3h+HSkmpzwXWiZ05rV+XjbUd1mm/YJHSi5Ero2/8F6cYqV4f0zBfwpVFdMqTGlFB0d3Y04yokpdzqg0TQYLDzcKaJ6hs6hzvMPBGCM5VYtRNVQyiFkcwIAFU164pBoXj7YOcCB9DwjTMRN4jzBvgK2mP/9+4irEy/IwEU0T7Khu8jXvQFddDmsJBaOVCOw9n4prYJA+3DknrDyPOF0fmAQe8D22TQwSRK/5R/uZGkjaujCfxZidpEkkO7YZoQ/xrU+Z/dg5/SaQ8V/jMl1cFD9WlWMFVShCyv/xzTOEGfWlnmoeWQiCsjK5lvgWLpD0PAFy6WOPKP0IchCBsZBckkpcRq00OJIP4y5xFjmSwHi610Px2NrjQcoYJW0JJnnJIvNs2P+JzMrUIMQLeyLz7S1Lu4nTllbj+fO0F9d/r7EAkscWB/sP0FgCKwkeJXVB3thrjUCHVF71q1cEm/s8ljS8KfQ5XkvFJ4J6X17XJNS83ybXkPWg2y0JwGu+l7gKBiLHI/VfHZ4PBhW4hug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7529.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39860400002)(376002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66556008)(64756008)(66446008)(66476007)(26005)(52536014)(66946007)(76116006)(8936002)(8676002)(86362001)(55016003)(33656002)(71200400001)(5660300002)(6636002)(316002)(6506007)(4326008)(110136005)(7696005)(38070700009)(82960400001)(2906002)(38100700002)(9686003)(122000001)(41300700001)(966005)(83380400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEY5OC96ZCtIQnNqOEthMHJuVmhTTUk3R0liVXU1eW1hN0txamY0clVTNTRC?=
 =?utf-8?B?UmFqajZnSkhkQmRyMm5RWk1xM2VNZDZidU0vMTV2UDUwbnltWDlERzJLSHJv?=
 =?utf-8?B?SUw4Q1FjaXdMQWdCRmJLMWQ1RVVNSXlnT3dNTG1BL3FrVURKbzhEam5MZW8w?=
 =?utf-8?B?N2Fsc2tZQXNmRWE4V1BreExvRW44T2N2NVZ6bXJDbFV6SjZLbzM0bWtnd1Q1?=
 =?utf-8?B?REI2REY1R053bEV4THBHdUx6bFdKcVRnTXhDTU5SVFc5bUgzSGxIQUFXMVpS?=
 =?utf-8?B?MUIrZURCdXhYWEorSXE4QUdPOUIvelE5V2ZDRFQvWUZEcFV0eWIybGowQXpm?=
 =?utf-8?B?NEc0QWthTVkxTGVKL3JQaG05cDBlbTc2Nkx5bmZ4T1NqbVVnbStnK0grendh?=
 =?utf-8?B?Q0RldFJYYVZjU3FOTmdQa3pUOXJjZEcyK2pVMTJ4SzlVeXVkMUh5UTh5ZUlv?=
 =?utf-8?B?ek93by9CaXJRUnNPQXlUWjRTa1FFaEl2Y2VjYmVaUnE3SVFwcEt4bmpSeXJn?=
 =?utf-8?B?VEhKSnlIZGIwMnMwayt0bWhNSzVqbHNuRnUvUklpQk9QdzM2akxzQTBuTnpF?=
 =?utf-8?B?UWJ2aXJWNHVwMmt0RXpTVTVoNjNqUHRDV0FCL0VreG9POHRkRk5UWHF2QkY1?=
 =?utf-8?B?dUZ3OVA2ZjJnZUZMeVZOQUR3YUMwbXRJam1GK3U5dVNGVFNlbk1oZjVoZXh6?=
 =?utf-8?B?bEVRczUvT01lbzd5VDdtVnMreHo0aUVLUGhLYUVRT2k3Rm56M0VKSGswUmVu?=
 =?utf-8?B?RHhiTlRMOUNnMkthOTMvcjZjVXdNQ2F4R3ZJRVpGQXRMcER1dWxuajJ3Z05r?=
 =?utf-8?B?aFNhRzZKaEUzL0FjTUdkRXhFR204bFN3ZlBhVzZoY1R6Y0t0Qk5uUTAxNVRk?=
 =?utf-8?B?dk5Fcy85T3ZEUGU1Vk9QLzhOSHIrTlR4bDdIU1RuMUlOc09wR2xNZWRHMElu?=
 =?utf-8?B?QUY2Zi85aVZ0VWlXSGF5WjJ1QXR1b2tpRWk4MVhxNTFFV1d6eUR2dmlGd3BS?=
 =?utf-8?B?UURoVVJZbFFjUldTbG5rSk9rZXYzc0g2dk9GcGlHNjIyazJsbEF3MDFqQXNR?=
 =?utf-8?B?R3ZUZnd0RFpUb2xvcXlFd0p0QmZORWFKeGY5c2ZxUXlyeWg2QmxoZWFCTDV3?=
 =?utf-8?B?RDVtOGZOdUdhMnRjcUtDTTZ4bWVEZG1PZ212L0dEL1VHRWFvcWhPWnA2bzg0?=
 =?utf-8?B?dmpDMFM0WWQ2M2t3WXhSYzFXbmRSV0xYR1lZazNJSGU0ck04VTloYm14QzJX?=
 =?utf-8?B?MkZyNlNnQ2kvRytzUlFBellEYldEMWJ6cFFEOHRGQm1vMmJiZm0vVmlCSzVo?=
 =?utf-8?B?Ny81eFpTK3RkTDVDNTZUU3ZMUWVDTDM5dklHRWhjRjdpODAyRGd6RG9LK2o2?=
 =?utf-8?B?NmkxNFlzU2lJRmpMZ09oS0tBeWJpZ2VNRWd0UFB0dmcvaFcyZDB2VGhPbHM1?=
 =?utf-8?B?aU0ySUtsaW5UMUFtbDJrbW9zM1pzOTIyQk01N1FSTXIyTWdpS2xMUjh6MEZW?=
 =?utf-8?B?NTdFbU5VZ2lTQzF4d2t5ejNpZEhUU0VScmFvR3F1VnBiUml4KzZRQVFsbkUr?=
 =?utf-8?B?WFRJUzJlNDNPZzFHQlg0SkdlZzJiS1dvL2tuNWtGSTVyc1pEQ2RpOWpueklx?=
 =?utf-8?B?bTlXMkRxRVZpa1Q0Wlo3UzV2c0t2NlA0WFpDQ2t6K0gvOThsdUVmbHE0dnNh?=
 =?utf-8?B?dldFODZ6dVR4aW9uN2ZpZFhMRHYxeWJCK0RHNG9PQmN3aWg0Ly81VVhvMVpF?=
 =?utf-8?B?MlBIT01jNE5QQXN3dnJPTlQvaERQYWU3bnpPOGNJaVJnTllZczI0U3Z0VXU2?=
 =?utf-8?B?YWdQQ3ZTRHIvSU12dGZ5aWEwSHVpaUZPaGRwc2p1eFU1T3BTUWdkR3VBNXgy?=
 =?utf-8?B?YTBEMnhyYzNXOW80UURDaWFUeVpDeUlpZ0VPbDZrNnpOdWhyblRwOFFJNXoz?=
 =?utf-8?B?Y1lZUkZZTUp3WWZrRlhlQXFFcFdCc0dCY3pKZGRUYUpLYmpmcDdSSGx0bk9q?=
 =?utf-8?B?NWpYamI4MFBDalZvNHNnK1dSelhwVFMzSG5hTkdESUgvUG9OcWVOSFZIUitl?=
 =?utf-8?B?MW5EOFdvWTdVRCtDVHhiMWlieERJb2ZJMjBRTnZnay9KRTZqN2dmendnSEhS?=
 =?utf-8?Q?Xa0s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7529.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e28867-7363-4ae4-4e37-08dbebf731b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 07:38:32.5960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /waymeKD4l7mW1HZH0oIo5/UBuQlRY4j0lYuMcgna92c7jIn4kgbUETDVgJgUCiQdfJ3SOA/fGncAGCQRoUUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
X-OriginatorOrg: intel.com

SGkgWXVqaWUsDQoNCj4gRnJvbTogTGl1LCBZdWppZSA8eXVqaWUubGl1QGludGVsLmNvbT4NCj4g
U2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIzLCAyMDIzIDE6MTUgUE0NCj4gDQo+IEhpIFlpLA0K
PiANCj4gVGhlIGtlcm5lbCB0ZXN0IHJvYm90IGNhdWdodCBzZXZlcmFsIGJ1aWxkIGlzc3VlcyBv
biBpbiB0aGlzDQo+ICJ3aXAvaW9tbXVmZF9uZXN0aW5nK3Bhc2lkLTExMTQyMDIzLXlpIiBicmFu
Y2gsIGJ1dCB3ZSBhcmUgbm90IHN1cmUNCj4gaWYgaXQgd291bGQgYmUgaGVscGZ1bCB0byBzZW5k
IHRoZSByZXBvcnQgdG8geW91IHNpbmNlIHdlIG5vdGljZSB0aGF0DQo+IHRoZXJlIGFyZSBxdWl0
ZSBzb21lIHdpcCBicmFuY2hlcyBpbiB0aGlzIHRyZWUgdGhhdCBhcmUgdXBkYXRlZA0KPiBmcmVx
dWVudGx5LiBDb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgcHJlZmVyZW5jZSBhYm91dCB3aGlj
aCBicmFuY2hlcw0KPiBzaG91bGQgYmUgdGVzdGVkIChvciBpZ25vcmVkKSBieSB0aGUgcm9ib3Q/
IEl0IGlzIG9rIHRvIHVzZSB3aWxkY2FyZCBvcg0KPiByZWdleCBwYXR0ZXJuIHN1Y2ggYXM6DQo+
IA0KPiBpb21tdWZkX2FsbG9jX3VzZXJfdiosIHRtcC8qLCB3aXAvKiwgZXRjLg0KDQpUaGUgYnJh
bmNoZXMgYmVnaW4gd2l0aCB0bXAvIGlzIG5vdCBzdXBwb3NlZCB0byBiZSB0ZXN0ZWQuIE90aGVy
cyBhcmUNCmV4cGVjdGVkIHRvIHJ1biBjb21waWxpbmcgdGVzdHMgdG8gY2F0Y2ggcG9zc2libGUg
bWlzdGFrZXMuIPCfmIoNCg0KUmVnYXJkcywNCllpIExpdQ0KDQo+IFRoYW5rcywNCj4gWXVqaWUN
Cj4gDQo+IE9uIFR1ZSwgTm92IDIxLCAyMDIzIGF0IDEwOjM4OjI0UE0gKzA4MDAsIGtlcm5lbCB0
ZXN0IHJvYm90IHdyb3RlOg0KPiA+DQo+ID4gQkNDOiBsa3BAaW50ZWwuY29tDQo+ID4gQ0M6IG9l
LWtidWlsZC1hbGxAbGlzdHMubGludXguZGV2DQo+ID4gVE86IFlpIExpdSA8eWkubC5saXVAaW50
ZWwuY29tPg0KPiA+IFRPOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPg0K
PiA+IHRyZWU6ICAgaHR0cHM6Ly9naXRodWIuY29tL3lpbGl1MTc2NS9pb21tdWZkLmdpdCB3aXAv
aW9tbXVmZF9uZXN0aW5nK3Bhc2lkLQ0KPiAxMTE0MjAyMy15aQ0KPiA+IGhlYWQ6ICAgOTJmMzEz
OTA5ZWUzNzUzZjczYzliMzM0MWEzNGFhMjgxMTZlZGI2Mg0KPiA+IGNvbW1pdDogNzMxMjYxZGNk
OTI3MDM4N2U3ZWQ5NTgxM2FkMDVhMDJjMDEwMDZkOCBbNy8yMF0gaW9tbXVmZC9zZWxmdGVzdDoN
Cj4gQWRkIGNvdmVyYWdlIGZvciBpb21tdWZkIHBhc2lkIGF0dGFjaC9kZXRhY2gNCj4gPiA6Ojo6
OjogYnJhbmNoIGRhdGU6IDcgZGF5cyBhZ28NCj4gPiA6Ojo6OjogY29tbWl0IGRhdGU6IDcgZGF5
cyBhZ28NCj4gPiBjb21waWxlcjogZ2NjLTEyIChEZWJpYW4gMTIuMi4wLTE0KSAxMi4yLjANCj4g
PiByZXByb2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOiAoaHR0cHM6Ly9kb3dubG9hZC4wMS5v
cmcvMGRheS0NCj4gY2kvYXJjaGl2ZS8yMDIzMTEyMS8yMDIzMTEyMTIyNTAubFREZ0tVd2stbGtw
QGludGVsLmNvbS9yZXByb2R1Y2UpDQo+ID4NCj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBh
IHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+
ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncw0KPiA+
IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+IHwg
Q2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTIxMjI1MC5sVERnS1V3ay1s
a3BAaW50ZWwuY29tLw0KPiA+DQo+ID4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOg0KPiA+DQo+ID4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlvbW11ZmRfdXRpbHMuaDox
MywNCj4gPiAgICAgICAgICAgICAgICAgICAgIGZyb20gaW9tbXVmZC5jOjEwOg0KPiA+ICAgIGlv
bW11ZmQuYzogSW4gZnVuY3Rpb24gJ2lvbW11ZmRfZGV2aWNlX3Bhc2lkX3Bhc2lkX2F0dGFjaCc6
DQo+ID4gPj4gaW9tbXVmZC5jOjIyNjY6NDQ6IGVycm9yOiAnSU9NTVVfSFdQVF9BTExPQ19EQVRB
X1NFTEZURVNUJyB1bmRlY2xhcmVkDQo+IChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRp
ZCB5b3UgbWVhbiAnSU9NTVVfSFdQVF9EQVRBX1NFTEZURVNUJz8NCj4gPiAgICAgMjI2NiB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9IV1BUX0FMTE9D
X0RBVEFfU0VMRlRFU1QsDQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gICAg
Li4va3NlbGZ0ZXN0X2hhcm5lc3MuaDo3MDc6MjA6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFj
cm8gJ19fRVhQRUNUJw0KPiA+ICAgICAgNzA3IHwgICAgICAgICBfX3R5cGVvZl9fKF9zZWVuKSBf
X3NlZW4gPSAoX3NlZW4pOyBcDQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+
fn4NCj4gPiAgICBpb21tdWZkX3V0aWxzLmg6MTkwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyAnQVNTRVJUX0VRJw0KPiA+ICAgICAgMTkwIHwgICAgICAgICBBU1NFUlRfRVEoMCwgX3Rl
c3RfY21kX2h3cHRfYWxsb2Moc2VsZi0+ZmQsIGRldmljZV9pZCwgcHRfaWQsIGZsYWdzLCBcDQo+
ID4gICAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fg0KPiA+ICAgIGlvbW11ZmQuYzoyMjY0OjE3
OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ3Rlc3RfY21kX2h3cHRfYWxsb2NfbmVzdGVk
Jw0KPiA+ICAgICAyMjY0IHwgICAgICAgICAgICAgICAgIHRlc3RfY21kX2h3cHRfYWxsb2NfbmVz
dGVkKHNlbGYtPmRldmljZV9pZCwgcGFyZW50X2h3cHRfaWQsIDAsDQo+ID4gICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiAgICBpb21tdWZk
LmM6MjI2Njo0NDogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQg
b25seSBvbmNlIGZvciBlYWNoDQo+IGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4NCj4gPiAgICAgMjI2
NiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9IV1BU
X0FMTE9DX0RBVEFfU0VMRlRFU1QsDQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+
ID4gICAgLi4va3NlbGZ0ZXN0X2hhcm5lc3MuaDo3MDc6MjA6IG5vdGU6IGluIGRlZmluaXRpb24g
b2YgbWFjcm8gJ19fRVhQRUNUJw0KPiA+ICAgICAgNzA3IHwgICAgICAgICBfX3R5cGVvZl9fKF9z
ZWVuKSBfX3NlZW4gPSAoX3NlZW4pOyBcDQo+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgXn5+fn4NCj4gPiAgICBpb21tdWZkX3V0aWxzLmg6MTkwOjk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyAnQVNTRVJUX0VRJw0KPiA+ICAgICAgMTkwIHwgICAgICAgICBBU1NFUlRfRVEo
MCwgX3Rlc3RfY21kX2h3cHRfYWxsb2Moc2VsZi0+ZmQsIGRldmljZV9pZCwgcHRfaWQsIGZsYWdz
LCBcDQo+ID4gICAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fg0KPiA+ICAgIGlvbW11ZmQuYzoy
MjY0OjE3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ3Rlc3RfY21kX2h3cHRfYWxsb2Nf
bmVzdGVkJw0KPiA+ICAgICAyMjY0IHwgICAgICAgICAgICAgICAgIHRlc3RfY21kX2h3cHRfYWxs
b2NfbmVzdGVkKHNlbGYtPmRldmljZV9pZCwgcGFyZW50X2h3cHRfaWQsIDAsDQo+ID4gICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPg0KPiA+
IC0tDQo+ID4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQ0KPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQ0KPiA+DQo=
