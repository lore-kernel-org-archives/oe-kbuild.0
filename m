Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8EA1946F
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Nov 2023 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRIuZKXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700728996; x=1732264996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=m2WcRyVgJeG9G6T/x53m8ngckLGUkKE9589eYYbS5Ws=;
  b=mRIuZKXKBai9oIlU16h8LpYMWDcIby2BmMdEDdc+T54p4SHuNNBNTxG5
   IrgcqyzS517mNmST/v2ngrEX7sfdY6jQtoHNJ9sWimy9PlmXI3eP/kqco
   uV+mhijVkhn3UE8eEJas+ZYPWaUy5flwic84FVSbMx9DaA3BqWHJDqO2m
   Iv90blMAq5SVSrAv4zjpAs2eEyXFY52UmhuHX4rs1tqhN+gIysp+g6gyV
   QJl87vXf3SzinphDGPg9LEeC1KWlLLElJDv7IxZX7JiDZyExu/GmTjTqq
   Xfo9BZfVY+WVlzpd9uu3GUBWbuG8tCxrmCLQGcbg+7Issz9NQLGdFrlOu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371576595"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="371576595"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884917493"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="884917493"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:43:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:43:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:43:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:43:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:43:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTRiJFHP4VLpPmdwIE5DVutb1tFr/u5kdCD0Ou7Rl7KNMHhkvmcEnNv6/t3N2kI31Mm4anr6i/szj+8QNkOHx7gm/a9HOOuFTGafJq6LbncoyB8pUbFeOm240nNlkaMLt8Ojc24oclVkZ+QYOtvN3atcbAulleCCKC5KlfD08Lfy5eF45Lnycs3PuXWLnB7jIop5sEki6UvWbXyMWp3ZVx6FkxWyKXa7tMVO0Gzg9EpNzRALkNS/2tDQcK8w28LrbmS/QlI/c/5v8uUMb5mx6l7Gn04hAibRI8Qb1f9LspTF3txao8UEUf2jDi6FKr109YjqDXAoyRpLzaH9ytunxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2WcRyVgJeG9G6T/x53m8ngckLGUkKE9589eYYbS5Ws=;
 b=coDHCUww7o36NFc37KAQ9qYWXQ6WOrq489H/UZeXoc+77hzjX9qJqJRVL644iUDUsp25+zNUBo/IMpXyp9zkP+bCauS1w9UET7m0+nPpjAwGZ9/+4MKx2+SDoiKmdbLAOyRYRDCbRI3kOQk4RUvtk3xxE8pIT6Cno8rB5Q+izSsMjJ19PeBbh+dKlXxU50tJWp72XbLyC31kHQYKRLU0sbY4QImsYDi7VlV/RKxCPPQzEqrucw6mpKfHToTWZKemjqoEqgOqjlmTiWoyWBUg0IL132riI5is86qIIzeITnh6L6RkE+47/NGB14zujHNee+kmR8ccgSJeG8P+xPheJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 08:43:06 +0000
Received: from DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e4ae:3948:1f55:547d]) by DS0PR11MB7529.namprd11.prod.outlook.com
 ([fe80::e4ae:3948:1f55:547d%5]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 08:43:05 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: "Liu, Yujie" <yujie.liu@intel.com>
CC: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Topic: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Thread-Index: AQHaHcyl+gvcvDO4wUKPF6T3Q54tL7CHhC1ggAAMV4CAAAXRIA==
Date: Thu, 23 Nov 2023 08:43:04 +0000
Message-ID: <DS0PR11MB752937EC74578C778B95FB03C3B9A@DS0PR11MB7529.namprd11.prod.outlook.com>
References: <202311212250.lTDgKUwk-lkp@intel.com>
 <ZV7fz/Ly6RnZ5Nf4@yujie-X299>
 <DS0PR11MB7529E111B3E16BA49B9363F8C3B9A@DS0PR11MB7529.namprd11.prod.outlook.com>
 <ZV8LiSOBAPanhkr/@yujie-X299>
In-Reply-To: <ZV8LiSOBAPanhkr/@yujie-X299>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7529:EE_|MW5PR11MB5764:EE_
x-ms-office365-filtering-correlation-id: dc8be932-010f-4af9-e9d6-08dbec00358f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wE/I65iN8PEtnpJ66rbDIE8qKjIcOjgOAGACep162oHDwclOCT6w+SOB4ikQFpfpY8VgrxOX4+FH+qzIgaik4SfWo/kwynnagtn5Cl8Mt5HGJRyu5tSd1ogYoIvY3XDbbjYtKNIy6x827IhbTNmN0mxKhrteWtHGvI6aCosBAEtOHNp2xyvPXMsKGcDPWqGyOenjrVcdJeNq/i998Tsx9n++vawmJKEh3cuAKhmN5+gffsZRNu0SC25D3U1NZO0gWEQmuK+jjW4MoZXvGVfSeKp1k2m+MPjvQmkoE/I5fKHJ0R1FZIWVpHKR66TU5hDXHVYKfibegDTLCv0tC8hpDy4nk8nLNwq6tUQMt6nxq+g0x00XWqOs2CBTya2bUYlWK/QbvhkAqJe0tz7+XtuFiMlSm0u81QNb0zwrBsz+LzGSiuewUb9WLqxF8rvhF/wD7dsRpcajRwNGLOrO0w5QoqBbuXfr9d5Xe/hjEDxevPVzEOppraUVe3yVWUfnrNGNWwKZfqj2rO6hFAdIdf6/RbOfJbFiAeo0XwaJIA1kSboAAsgDFn7NH5N9kBN8KqAcsOSKGo5EXYkjr4HKS20DmC13DuBQw6NaNrHOfHLGsTn0qIhWu52wsq7dlVTgRQWgj5/5mwcesUIcg07ISzxP1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7529.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(376002)(366004)(136003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(41300700001)(52536014)(2906002)(64756008)(6636002)(316002)(4326008)(8936002)(6862004)(55016003)(8676002)(5660300002)(66446008)(66476007)(66556008)(76116006)(66946007)(966005)(478600001)(71200400001)(54906003)(7696005)(6506007)(9686003)(26005)(83380400001)(122000001)(33656002)(86362001)(38100700002)(82960400001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmU1ck9UQ1pjYktLb2o0OUdHeDBpZ0tFeThsMXgwOHdyWmhEQ2EzWlpGcEFs?=
 =?utf-8?B?MVMwWEhwTkJFQmRNU1B2b0plSGs2ZVNwdUYreFVVSER4TkZIdm5BNzF0S21N?=
 =?utf-8?B?elZxUXpsNXpKaUFMZFJxVzMrMVJyOUFWRHlmY1luMGJRY2VGVWNFclVTK3N3?=
 =?utf-8?B?TFZpMVllUnNnaXpKMExIQU9RbzJLMm1GL3dXbW9qejUrN0dKN0krck0vR1hv?=
 =?utf-8?B?OWFMVHNyQ0RJUWtMc2FKK2NXUmczT2tHMitKYzhsMGMrd3RCa3BLVmJZY0VI?=
 =?utf-8?B?SnVVZDBoRUFCSUtqVTJZTk5jbm5DeFZkcUpFMzYrc2lkcXlzV1FLbk4yMmhB?=
 =?utf-8?B?SzR0UUVHcHBOcTNWTExXM3VFQnV5NS9ibkJDSHovWlNKbElBMHFMVnhpa09H?=
 =?utf-8?B?VlQ1M21uQ2w2eDQwYTAzWWU1ZUdLV2MyVlJScUdSZytHYTMxclVwajVCT3Q4?=
 =?utf-8?B?Mjg2OTVpTlJ4b1RlcHZVUnI2blJDVnBBNllwZzR1VWdpQSt3SkdiSGJrNGRa?=
 =?utf-8?B?Y1FQTzRteFhDVk1qNURPSm82UTk4NlRLRXcvTjVYeklQMDVKK1F3WVFIRFlu?=
 =?utf-8?B?WDNhMkcrd1MxTXRuQytzaWtZUk9qcXFmczVRYVhva0FqWTBTWlhYWjh5RGFv?=
 =?utf-8?B?RUh5bnN0R1JEdWFWVEd4UDF2MWxKYmV2U3g5UTlSZHd4eUMwVWpScHpvMWVv?=
 =?utf-8?B?a2RFZGl2RXBaT2FBVE5YY2JDMERiVit0cU5Icm5zd0RlenAwL3ZQRkpTUG9Z?=
 =?utf-8?B?cWJUZnU4UCtPQVJUcVc4REhVeEJHM3BybGtYTEhJeTFyWVdMdTlmSE10N1Fz?=
 =?utf-8?B?c2ZRcThYUkFaTkpaVjV2QnM2aTE1Z0JJdHFveElUTFFVd3U3S3kranlIL1JR?=
 =?utf-8?B?VldBSFZaVWpFSDV4OE1qK1BxVnBHalRSV2hoSXJDMld6L1NlY0NMVHV5WjJB?=
 =?utf-8?B?eEJSTlljZ0ZYNlRJNTBPUWJPWS9neXJBWUdyUjNMdTR0cllWUmhGK1R2WWl5?=
 =?utf-8?B?dHFnT0RrS0lIczd3T3RSdzVad3NMdGRBTWpwSU1qVE9YWFNJRW5BOUxSQkoy?=
 =?utf-8?B?bms5SGtneE5iMzNNL1hQUkY0amVrM1grclFEQTN5aFUvUytqZFkxb2hMZk0y?=
 =?utf-8?B?dHQzb3RpZjMwT0ZOOWIwM04yT0VkZ3BzcXRERnpGUC9GTlpnSnhWOXYwSzQ1?=
 =?utf-8?B?clIzR1lZcUhieEZtZUZUeEdQTnZIYXJCcmNic3VBZzBlWlFHc1NZTWZ2Skpm?=
 =?utf-8?B?UEFiQUJYWHl2cHFsdnRteTNvMVpvZHltNHdpMlJqVFg2QkpDVnpSUm5MSnp2?=
 =?utf-8?B?VjRCOStQOTBRTmFaNWlSRWc2YXJWUTNuZ0FPbjgrYjczSTI4ZnJ1b21GRktB?=
 =?utf-8?B?bUU4ZWUyN2IvTlJZN3FPazNTejVIdE1qZXlLenhJRUpuR3ozMDdUNnl3cGlP?=
 =?utf-8?B?aEY0M29zQWt6Zm9LUjFLb0ZhT0VzaWR4ekMyRFdnaFZ1VTNhdkJhLzRlYWJX?=
 =?utf-8?B?OXVYY000UC9MZ003WkxYcS96L3VMbndRTVdqTDdRa3owQmNmZTVtRmpxcnZs?=
 =?utf-8?B?b1J1NFUyUmdIOXo1WXdyOXEzYXRHMmIvVnVxRk84Ukg4NGs5VWFjblJVRFc2?=
 =?utf-8?B?azBrUHliTW4xZVRGY2U4blEyRnVURWkyZExPTXlkWGViQXlZMlFWVHZKVFY5?=
 =?utf-8?B?VkFYM2Zmc2FQcTdwTEc2NFFUKzhFN01aMEhLaDhNd3BtblhvcWduOFlhWk5K?=
 =?utf-8?B?ODBld25DSXQ3QndtMFQ2OXM4RWVHSU02TkNUd3g5YTg0RUZoUWhqUU4wWDdD?=
 =?utf-8?B?cWhmRWZXWGlIRGgwMU9qUkM5TitEc3R0SkhQYllsaDZsbVJ0cFd3RUdlYkg1?=
 =?utf-8?B?S1BHMVJLa3hPMUpiM0tNNzl0c1ZKVmhBNnI3Z09Jd0xxN2JDOStMWUlTcDE3?=
 =?utf-8?B?MTkvT3laNS9tTjljZCtqMktRdFpqTXcxUlZmZnZUMk9uSkg5QkpSMEoyQjZ3?=
 =?utf-8?B?OEwrZnYvU2dnYkQ0ZXQyV3BZdmZnRWx5b3l6RFIvWUVhcHlmQzVIR1JGNklv?=
 =?utf-8?B?b254eWF2SnMrSGlySnRWYzlKTjh6SEpIT0cwWUptbUxHM2ZZemdTbXhRTDVn?=
 =?utf-8?Q?2fwA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8be932-010f-4af9-e9d6-08dbec00358f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 08:43:04.5553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwBY1r5VnQM5VxtjmpNShwKK8n2Z5CZsjCQH6Wm+cZnxPsKsMj1JEQy7eygBHgKXKlLrm+F61A/LLfT6qiHbyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com

PiBGcm9tOiBMaXUsIFl1amllIDx5dWppZS5saXVAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgTm92ZW1iZXIgMjMsIDIwMjMgNDoyMSBQTQ0KPiANCj4gT24gVGh1LCBOb3YgMjMsIDIwMjMg
YXQgMDM6Mzg6MzJQTSArMDgwMCwgTGl1LCBZaSBMIHdyb3RlOg0KPiA+IEhpIFl1amllLA0KPiA+
DQo+ID4gPiBGcm9tOiBMaXUsIFl1amllIDx5dWppZS5saXVAaW50ZWwuY29tPg0KPiA+ID4gU2Vu
dDogVGh1cnNkYXksIE5vdmVtYmVyIDIzLCAyMDIzIDE6MTUgUE0NCj4gPiA+DQo+ID4gPiBIaSBZ
aSwNCj4gPiA+DQo+ID4gPiBUaGUga2VybmVsIHRlc3Qgcm9ib3QgY2F1Z2h0IHNldmVyYWwgYnVp
bGQgaXNzdWVzIG9uIGluIHRoaXMNCj4gPiA+ICJ3aXAvaW9tbXVmZF9uZXN0aW5nK3Bhc2lkLTEx
MTQyMDIzLXlpIiBicmFuY2gsIGJ1dCB3ZSBhcmUgbm90IHN1cmUNCj4gPiA+IGlmIGl0IHdvdWxk
IGJlIGhlbHBmdWwgdG8gc2VuZCB0aGUgcmVwb3J0IHRvIHlvdSBzaW5jZSB3ZSBub3RpY2UgdGhh
dA0KPiA+ID4gdGhlcmUgYXJlIHF1aXRlIHNvbWUgd2lwIGJyYW5jaGVzIGluIHRoaXMgdHJlZSB0
aGF0IGFyZSB1cGRhdGVkDQo+ID4gPiBmcmVxdWVudGx5LiBDb3VsZCB5b3UgcGxlYXNlIHNoYXJl
IHlvdXIgcHJlZmVyZW5jZSBhYm91dCB3aGljaCBicmFuY2hlcw0KPiA+ID4gc2hvdWxkIGJlIHRl
c3RlZCAob3IgaWdub3JlZCkgYnkgdGhlIHJvYm90PyBJdCBpcyBvayB0byB1c2Ugd2lsZGNhcmQg
b3INCj4gPiA+IHJlZ2V4IHBhdHRlcm4gc3VjaCBhczoNCj4gPiA+DQo+ID4gPiBpb21tdWZkX2Fs
bG9jX3VzZXJfdiosIHRtcC8qLCB3aXAvKiwgZXRjLg0KPiA+DQo+ID4gVGhlIGJyYW5jaGVzIGJl
Z2luIHdpdGggdG1wLyBpcyBub3Qgc3VwcG9zZWQgdG8gYmUgdGVzdGVkLiBPdGhlcnMgYXJlDQo+
ID4gZXhwZWN0ZWQgdG8gcnVuIGNvbXBpbGluZyB0ZXN0cyB0byBjYXRjaCBwb3NzaWJsZSBtaXN0
YWtlcy4g8J+Yig0KPiANCj4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gVHdvIHJlcG9y
dHMgZm9yDQo+ICJ3aXAvaW9tbXVmZF9uZXN0aW5nK3Bhc2lkLTExMTQyMDIzLXlpIiBicmFuY2gg
aGFzIGJlZW4gc2VudCBqdXN0IG5vdy4NCj4gUGxlYXNlIGtpbmRseSBjaGVjayB0aGVtLg0KDQpU
aGFua3MuIFllcywgSSBhbHdheXMgY2hlY2sgdGhlIHJlc3VsdHMuIFNvbWUganVzdCBnb2VzIGF3
YXkgaW4gbGF0ZXN0IGJyYW5jaGVzLiDwn5iKDQoNCj4gUmVnYXJkcywNCj4gWXVqaWUNCj4gDQo+
ID4gUmVnYXJkcywNCj4gPiBZaSBMaXUNCj4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gWXVqaWUN
Cj4gPiA+DQo+ID4gPiBPbiBUdWUsIE5vdiAyMSwgMjAyMyBhdCAxMDozODoyNFBNICswODAwLCBr
ZXJuZWwgdGVzdCByb2JvdCB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gQkNDOiBsa3BAaW50ZWwu
Y29tDQo+ID4gPiA+IENDOiBvZS1rYnVpbGQtYWxsQGxpc3RzLmxpbnV4LmRldg0KPiA+ID4gPiBU
TzogWWkgTGl1IDx5aS5sLmxpdUBpbnRlbC5jb20+DQo+ID4gPiA+IFRPOiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gdHJlZTogICBodHRwczovL2dp
dGh1Yi5jb20veWlsaXUxNzY1L2lvbW11ZmQuZ2l0IHdpcC9pb21tdWZkX25lc3RpbmcrcGFzaWQt
DQo+ID4gPiAxMTE0MjAyMy15aQ0KPiA+ID4gPiBoZWFkOiAgIDkyZjMxMzkwOWVlMzc1M2Y3M2M5
YjMzNDFhMzRhYTI4MTE2ZWRiNjINCj4gPiA+ID4gY29tbWl0OiA3MzEyNjFkY2Q5MjcwMzg3ZTdl
ZDk1ODEzYWQwNWEwMmMwMTAwNmQ4IFs3LzIwXQ0KPiBpb21tdWZkL3NlbGZ0ZXN0Og0KPiA+ID4g
QWRkIGNvdmVyYWdlIGZvciBpb21tdWZkIHBhc2lkIGF0dGFjaC9kZXRhY2gNCj4gPiA+ID4gOjo6
Ojo6IGJyYW5jaCBkYXRlOiA3IGRheXMgYWdvDQo+ID4gPiA+IDo6Ojo6OiBjb21taXQgZGF0ZTog
NyBkYXlzIGFnbw0KPiA+ID4gPiBjb21waWxlcjogZ2NjLTEyIChEZWJpYW4gMTIuMi4wLTE0KSAx
Mi4yLjANCj4gPiA+ID4gcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTogKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktDQo+ID4gPiBjaS9hcmNoaXZlLzIwMjMxMTIxLzIwMjMxMTIx
MjI1MC5sVERnS1V3ay1sa3BAaW50ZWwuY29tL3JlcHJvZHVjZSkNCj4gPiA+ID4NCj4gPiA+ID4g
SWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90
IGp1c3QgYSBuZXcgdmVyc2lvbiBvZg0KPiA+ID4gPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBr
aW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+ID4gPiA+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+ID4gPiB8IENsb3NlczogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIzMTEyMTIyNTAubFREZ0tVd2stbGtwQGludGVsLmNvbS8NCj4gPiA+
ID4NCj4gPiA+ID4gQWxsIGVycm9ycyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOg0KPiA+ID4g
Pg0KPiA+ID4gPiAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW9tbXVmZF91dGlscy5oOjEzLA0K
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgIGZyb20gaW9tbXVmZC5jOjEwOg0KPiA+ID4gPiAg
ICBpb21tdWZkLmM6IEluIGZ1bmN0aW9uICdpb21tdWZkX2RldmljZV9wYXNpZF9wYXNpZF9hdHRh
Y2gnOg0KPiA+ID4gPiA+PiBpb21tdWZkLmM6MjI2Njo0NDogZXJyb3I6ICdJT01NVV9IV1BUX0FM
TE9DX0RBVEFfU0VMRlRFU1QnDQo+IHVuZGVjbGFyZWQNCj4gPiA+IChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnSU9NTVVfSFdQVF9EQVRBX1NFTEZURVNUJz8NCj4g
PiA+ID4gICAgIDIyNjYgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgSU9NTVVfSFdQVF9BTExPQ19EQVRBX1NFTEZURVNULA0KPiA+ID4gPiAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4gPiA+ID4gICAgLi4va3NlbGZ0ZXN0X2hhcm5lc3MuaDo3MDc6MjA6
IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gJ19fRVhQRUNUJw0KPiA+ID4gPiAgICAgIDcw
NyB8ICAgICAgICAgX190eXBlb2ZfXyhfc2VlbikgX19zZWVuID0gKF9zZWVuKTsgXA0KPiA+ID4g
PiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICBefn5+fg0KPiA+ID4gPiAgICBpb21tdWZk
X3V0aWxzLmg6MTkwOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnQVNTRVJUX0VRJw0K
PiA+ID4gPiAgICAgIDE5MCB8ICAgICAgICAgQVNTRVJUX0VRKDAsIF90ZXN0X2NtZF9od3B0X2Fs
bG9jKHNlbGYtPmZkLCBkZXZpY2VfaWQsIHB0X2lkLCBmbGFncywNCj4gXA0KPiA+ID4gPiAgICAg
ICAgICB8ICAgICAgICAgXn5+fn5+fn5+DQo+ID4gPiA+ICAgIGlvbW11ZmQuYzoyMjY0OjE3OiBu
b3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ3Rlc3RfY21kX2h3cHRfYWxsb2NfbmVzdGVkJw0K
PiA+ID4gPiAgICAgMjI2NCB8ICAgICAgICAgICAgICAgICB0ZXN0X2NtZF9od3B0X2FsbG9jX25l
c3RlZChzZWxmLT5kZXZpY2VfaWQsIHBhcmVudF9od3B0X2lkLA0KPiAwLA0KPiA+ID4gPiAgICAg
ICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ID4g
PiAgICBpb21tdWZkLmM6MjI2Njo0NDogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50aWZpZXIg
aXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvcg0KPiBlYWNoDQo+ID4gPiBmdW5jdGlvbiBpdCBhcHBl
YXJzIGluDQo+ID4gPiA+ICAgICAyMjY2IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIElPTU1VX0hXUFRfQUxMT0NfREFUQV9TRUxGVEVTVCwNCj4gPiA+ID4gICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gPiA+ICAgIC4uL2tzZWxmdGVzdF9oYXJuZXNz
Lmg6NzA3OjIwOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICdfX0VYUEVDVCcNCj4gPiA+
ID4gICAgICA3MDcgfCAgICAgICAgIF9fdHlwZW9mX18oX3NlZW4pIF9fc2VlbiA9IChfc2Vlbik7
IFwNCj4gPiA+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn4NCj4gPiA+ID4g
ICAgaW9tbXVmZF91dGlscy5oOjE5MDo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gJ0FT
U0VSVF9FUScNCj4gPiA+ID4gICAgICAxOTAgfCAgICAgICAgIEFTU0VSVF9FUSgwLCBfdGVzdF9j
bWRfaHdwdF9hbGxvYyhzZWxmLT5mZCwgZGV2aWNlX2lkLCBwdF9pZCwgZmxhZ3MsDQo+IFwNCj4g
PiA+ID4gICAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fg0KPiA+ID4gPiAgICBpb21tdWZkLmM6
MjI2NDoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICd0ZXN0X2NtZF9od3B0X2FsbG9j
X25lc3RlZCcNCj4gPiA+ID4gICAgIDIyNjQgfCAgICAgICAgICAgICAgICAgdGVzdF9jbWRfaHdw
dF9hbGxvY19uZXN0ZWQoc2VsZi0+ZGV2aWNlX2lkLCBwYXJlbnRfaHdwdF9pZCwNCj4gMCwNCj4g
PiA+ID4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4NCj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2Vy
dmljZQ0KPiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzL3dpa2kNCj4g
PiA+ID4NCg==
