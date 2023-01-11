Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2128.outbound.protection.outlook.com [40.107.102.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B67529A9;
	Wed, 11 Jan 2023 18:45:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAzseIsUuxsyWLPXSkQYbQ0n2rQmMBIAqBULU44YKjK7RrrazzmVDFzHWvsfrQ8aPFnKyQckCk7jVMPosKGgNEQEloGufAEdaxIJ8mto4VCAP7G5cj43tRii8ZZiMd5am1zg+JPrJcuAyNYTxi0eiLIrgPTkp8b2S/5/z04Hh3k3r1gabFxrPLk5eAPFCLgFYO/Y/+/dNTDy08I87ANhNJpxYiDC9VGBh+IIxF9/X8B34K+V8jZtxD3WuYxiPsftYntTxBsXarBvyil1Ci34LVGIWZjKCR16zpp1xGTkfOwkximjHx/euxG+krG6fb6imjaCUya30Z6F35Kjw6pKug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQye5ysLPp5QYTf+7ChDJlvDQ/3x+KV9081LI/eHOHk=;
 b=gJGYCRcdWx12qLRDKmb5SqTcFDvPbki5TYyFHG9mA3j40YfG9zDKX7BPSsT1SEkm81n+S5BvF9GiT0Ey2aDKKy7OU6WrVxZvPv49n/7JcoCPy0ceSshQciP6yZ3399hWxPMFcub09HosJiSDHS09S2g5PKt6pixrEI5R9K0wyIARBdrEgd7smsVHlSBEXqipyXJOA4WMl9a/AK2ZGt8fehYlSDG4l5Q8n4mkG7xrKcOjFqqtkbUZl4AuS2iTVBLtR0DJsDV+hQBb8oU77Qm87RBiNUP7hYAegXRYZRQCermsBKxM+EiNwhg9iF5SYu9/p4xD/oSrm376k2Dl/5Np6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hammerspace.com; dmarc=pass action=none
 header.from=hammerspace.com; dkim=pass header.d=hammerspace.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hammerspace.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQye5ysLPp5QYTf+7ChDJlvDQ/3x+KV9081LI/eHOHk=;
 b=Z5Ny+YBW92Pvnpo398OP98DMfVMVme3cCjb1VdpPWZzy0G5YbfWuK1O6kK0+afd/j1zHlwP4BtK+VX8cyUEyoGE1QCasrghg0RCteMPCf8IWPXPM8b4XpbTHmamWODeuI1zifTvHne46C5aniQsQlY/juw8ZynA10E5wptdtRO0=
Received: from DM8PR13MB5079.namprd13.prod.outlook.com (2603:10b6:8:22::9) by
 DS0PR13MB6173.namprd13.prod.outlook.com (2603:10b6:8:126::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Wed, 11 Jan 2023 18:45:47 +0000
Received: from DM8PR13MB5079.namprd13.prod.outlook.com
 ([fe80::f335:3647:d89a:84e2]) by DM8PR13MB5079.namprd13.prod.outlook.com
 ([fe80::f335:3647:d89a:84e2%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 18:45:47 +0000
From: Trond Myklebust <trondmy@hammerspace.com>
To: Dan Carpenter <error27@gmail.com>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>, "lkp@intel.com"
	<lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [trondmy-nfs-2.6:testing 8/17] fs/nfs/read.c:358 nfs_read_folio()
 warn: variable dereferenced before check 'file' (see line 335)
Thread-Topic: [trondmy-nfs-2.6:testing 8/17] fs/nfs/read.c:358
 nfs_read_folio() warn: variable dereferenced before check 'file' (see line
 335)
Thread-Index: AQHZJZpamNzGsCeZW0yRuocQAh6NM66ZThmAgAA6SoCAAAYygA==
Date: Wed, 11 Jan 2023 18:45:47 +0000
Message-ID: <A846DACF-A13D-42BC-B1BA-A97A7956890E@hammerspace.com>
References: <202301111617.RHJxuFNF-lkp@intel.com>
 <4CEE5F8A-9AE9-4235-8B94-77F842331C64@hammerspace.com>
 <Y77+n9MyHgx/alA4@kadam>
In-Reply-To: <Y77+n9MyHgx/alA4@kadam>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hammerspace.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR13MB5079:EE_|DS0PR13MB6173:EE_
x-ms-office365-filtering-correlation-id: d16205cc-27e0-4543-b598-08daf4040e01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Y/sa3ZrKTdIj2kvnp+x1HdfCEf8EX9Fb8cQA3IbLplws1+iwuUExsQ+y2fGJZloQd72fyCuhVuwmrud6NjMg4zeAy547W78MchfV3LJi3TLDzLzcjEp+VZa1coWG7NlwJyzFFt5zuyJS526VWVQz91yBRR4PUGUuLqKBY9VOVHllpf/rYS0EVtK1wHw48b88xC6UyNLP4plBZhRe0qKn/fsF+V3pm6Rd77W0nDHt243LFSzqBPlxct+DtPPRJzj/bAvrb9SM80dqdT6wBIHBXbTCnVc5Cd+9Kz+IxSFqXJabI17ErvJKqKkyVBKEwcIiX4pFXeoLp0L9rCjZvgq1t36Y6Qb711KSzRQd/hYvWNwFrfZ3Df7/H6raQ0OSX4czFzxnPIodA2MHjLCH+Nw8DQ6UbSvnQbcHqblVQOZ/t4fQBCZUJxf0HSa/GaXT2DQI9nq7ZW7dsfe6upSUQl1aJ/1ffBy0MGPSsY1vOv66lmyk6EenFRYukstdxGg16Q9OALZufs/GeZ8wQZcY+i3HEWcoBAj+SuijMnhBUXytTq3+QoN8XWH/UtfkkM6ZntmWoffeAea28UObceWn1Vir4UuDUqPbBuaTM+m9kW+uQIrfgOuS9hHQ+fmauQ2OC3/fj6AiVdGxoBcldGSYkfM8THIFHBm882n42k+YaKuAXMi/k1u7J9j/2aqwK5urK8Rbd9+ZRoaAakDYlCMJJoQOPNIoXqFaAhHwFETJT+SuEcR9xUthyUsfSVFoYmh/88OkmkyjeERgA7gNdq93EpCJhTivhcFlnySnYD50zozpeco=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR13MB5079.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39840400004)(366004)(346002)(396003)(136003)(376002)(451199015)(33656002)(36756003)(38070700005)(86362001)(54906003)(316002)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(41300700001)(8676002)(76116006)(91956017)(38100700002)(122000001)(83380400001)(6506007)(53546011)(5660300002)(2906002)(8936002)(26005)(6486002)(966005)(478600001)(6512007)(186003)(71200400001)(2616005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TC9TVm1QM00vdlE0M211aHI4OEtjaDgxS3V6bEpUUzVCUmtHY2hPMFNwQUNL?=
 =?utf-8?B?Rk9KdE1hdTRiRDN4VG1FZG9GY0tST3NyWXFWTjhuQnBnMVNYRys0blV5QTFn?=
 =?utf-8?B?U2lYWHZtN0Z6RHV4TmtVS3ZCamVtTHpjRFczRmd3R3MzSzJFY2hocWJxa3BH?=
 =?utf-8?B?dUVMbEs1Vm9SSm90Wm5jT2hYaVM1V0NGV2lMSVRqNFEyZmJ4RzM1cXNhQzBz?=
 =?utf-8?B?SjNkSEdmYUxLc1ZDWlpGSE40WUZVRkpOb3F1akYrY05JL3lFVDJ5c3NUUHg1?=
 =?utf-8?B?YjhQbHROMk5PUWVTTGlwVXJpaUR5aEhXMC9WYzBVcnlIR2Z3RFhQM1JBbzRE?=
 =?utf-8?B?bHZnVjlYVFlnaDhKdU15QkllSEJRK2VKbDljeWlTS3pzaWMvaHhsYVh5cVlu?=
 =?utf-8?B?UlhOOHphVllPS0RMSzN1dE5sQitFNWJPVG9TUFN5bFNEMk1OTHk5RGNmV0pM?=
 =?utf-8?B?TllaZzE5MWJJa2RoczE1VWdVWHNCWTBYY0V5em5yNGhQclJ4Q3llVVFIajdG?=
 =?utf-8?B?QkRPZzdhazJkRk1DVDhSQ3FEYWh1MFV5VlRwNGJqTGlZelEwSWdxdXkxTzJu?=
 =?utf-8?B?Z3ZDS0FDVFRUVCt1TXVJNnprL1prZ2dnZnFmQkdPb0ZnM0s4eTdRbFQvWkxO?=
 =?utf-8?B?ZDJQZWFqazBlVUkrZHQzYlV5SmFFQ1BjZ20welVzajd2czZMZmlOUUFYaDNS?=
 =?utf-8?B?R1ZMQnZSUEYrbnhvUnVsenhYRjIxRnNFQjlkVXowaktJTDlnSHlOVXBpVTAx?=
 =?utf-8?B?RVpxZjUxNzB4UzVpYlFhQjYzQVZCbzQ0OHNJeXppOUxPaUg0d0ozZzZyTTAy?=
 =?utf-8?B?RUNFeTFRZERPaTltditjdkdSeHNDVWJtZy81WW44U1VFYmROMDFWbXBlTnhv?=
 =?utf-8?B?UzZIemE0TEhVVWNGT0NmZDg0ZFA1OTJvVHVsRm9Nc041ZFdsNGRmd2RmSWNB?=
 =?utf-8?B?U3hMaFRtby9yZGgrSDh4eUhFRnVsU0FadnhmYU1QdlAvbSs3MkN4eFBjcGlR?=
 =?utf-8?B?R3J3dlVRdXE4Y0poQXdpMXlidCtWUk5VeGNIOFNXdDFGMU95YUlKb1Y4OGNB?=
 =?utf-8?B?ZldMRXVSRmpTdk8yNUFVY3hubDhRVlNOUHBCRkpJaEk4emFiU2tBNHlFbXdZ?=
 =?utf-8?B?NXNBWnJrUU1pTTZxWE9sSExEVk43QjdBTGdUVGx5ZG4rWUNJYWN1Z0FYSzhh?=
 =?utf-8?B?T2gyOU5remhDOHFxL2RlbkQ0bk9OdTNCeG1UN3ViSGdJaUo5cGFhbUdpWHpk?=
 =?utf-8?B?RUpFYmZ0U3U2OWx0bHN0OVZTUm1JOVd6clFiVWpoVGlPLzhRM2NvUjVqOFor?=
 =?utf-8?B?QnRZVVloRjRxeG1hanpjNlN1dEJnMHFuNnZEY1dJeFM5ZkhCVG5LMmZaWDRE?=
 =?utf-8?B?MjQxVUdKdmxDM2ZhVmNObVF4d3ZXa3hIMVgycXBlNDVheWJOMXE2dXJJa3FP?=
 =?utf-8?B?TU1aYlg2cTNYWDhMajNTb1ZwbVd4Q0kyRFpDdEdHWm5uMldld2d1VUdTVll0?=
 =?utf-8?B?aUxZNzZOR1k5WjYvUWtXZmdJTUZudWdGVnI2MXlBUjU4WW5oWGpPR3Z4cUxq?=
 =?utf-8?B?ZUpadVE0Y1RjVHRDYnRDYzhxQWgranFIS3JzSU43NlRxZHdPRG9YWGd6YytN?=
 =?utf-8?B?UUJaaVlWSGQrb0N5ZFpQMXFlaVo5cldxMUVJWkJrN010QWdqQytXMTh5eUpq?=
 =?utf-8?B?SlVRWFpjRzNvUVo0aEhRdzlVNzhCOE5EVkpydjZ0NUlKYVhiVlViZGZuNTFM?=
 =?utf-8?B?MEFhUlV5Z1JwSjJHVW56Z3d0Q3dZNitWTWh0cjRmUGNZdmpYM3hVM1NscHcx?=
 =?utf-8?B?WXFDWndXMWRCQmVGelRKZ3NwNW5zY0RGQitnWGdCSW00TFhQdHF0c0pIQ3hk?=
 =?utf-8?B?MzVjOFVUM01hSmJySTJhK05KMXNjVE5SdjZ4QkZtK3A3b3VvRHFZOURaQ3lv?=
 =?utf-8?B?N3hWWTBGNmJUZUZWOXRGbkVpM3prSHM1U0dSaDVTeTBDN0t3SDBXczJrNlFl?=
 =?utf-8?B?dXZIOUlKQ2tkNS9wZ01iOGdrRmJYNko2eGRZenh2UVRHL3BPT3piallwdzJR?=
 =?utf-8?B?ZFk3QmZoL3JTMEd0allTVTBJYWhsUnZnbGJnMmVyV01IS044cSs4dis3OW5t?=
 =?utf-8?B?YmJpN2hvcjhoTmkwQW5ybHBXbTVkNm9hY1pmYk5VaWZQZE5hNUZYbHhQbVFO?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D30B7923941654698B736D827BEEFD1@namprd13.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: hammerspace.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR13MB5079.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d16205cc-27e0-4543-b598-08daf4040e01
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 18:45:47.7904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4fed5c-3a70-46fe-9430-ece41741f59e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vK5jfOzC6+xKdn9GcLT39lAO/KR98MeF7RTKYp121Imyft45amDSxYxrM3iJLXhjsOGls/Z57GBiJ3kPZ8R9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR13MB6173

DQoNCj4gT24gSmFuIDExLCAyMDIzLCBhdCAxMzoyMywgRGFuIENhcnBlbnRlciA8ZXJyb3IyN0Bn
bWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKYW4gMTEsIDIwMjMgYXQgMDI6NTU6MDBQ
TSArMDAwMCwgVHJvbmQgTXlrbGVidXN0IHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBKYW4gMTEs
IDIwMjMsIGF0IDAzOjU0LCBEYW4gQ2FycGVudGVyIDxlcnJvcjI3QGdtYWlsLmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBlcnJvcjI3QGdtYWls
LmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJu
QWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+Pj4gDQo+Pj4gdHJlZTogICBnaXQ6Ly9naXQu
bGludXgtbmZzLm9yZy9wcm9qZWN0cy90cm9uZG15L25mcy0yLjYuZ2l0IHRlc3RpbmcNCj4+PiBo
ZWFkOiAgIDY1M2QyYjUwY2I3M2I1NDE0NjU5MjBhNzQ4YzZiMWExZWRmMjQwZDANCj4+PiBjb21t
aXQ6IGM4N2U4M2I5ZjkzM2NjNzVlNmM1Y2UyZjk5ZDMzMzcxM2U4N2NiNmYgWzgvMTddIE5GUzog
Q29udmVydCBidWZmZXJlZCByZWFkcyB0byB1c2UgZm9saW9zDQo+Pj4gY29uZmlnOiBpMzg2LXJh
bmRjb25maWctbTAyMQ0KPj4+IGNvbXBpbGVyOiBnY2MtMTEgKERlYmlhbiAxMS4zLjAtOCkgMTEu
My4wDQo+Pj4gDQo+Pj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5n
IHRhZyB3aGVyZSBhcHBsaWNhYmxlDQo+Pj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQo+Pj4gfCBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZXJy
b3IyN0BnbWFpbC5jb20+DQo+Pj4gDQo+Pj4gc21hdGNoIHdhcm5pbmdzOg0KPj4+IGZzL25mcy9y
ZWFkLmM6MzU4IG5mc19yZWFkX2ZvbGlvKCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJl
Zm9yZSBjaGVjayAnZmlsZScgKHNlZSBsaW5lIDMzNSkNCj4+PiANCj4+PiANCj4gDQo+IFsgc25p
cCBdDQo+IA0KPj4gDQo+PiBJIHRoaW5rIHRoYXTigJlzIGEgZmFsc2UgcG9zaXRpdmUuIEZyb20g
d2hhdCBJIGNhbiBzZWUgYWZ0ZXIgYXVkaXRpbmcNCj4+IGFsbCB0aGUgY2FsbGVycywg4oCYZmls
ZeKAmSBpcyBndWFyYW50ZWVkIHRvIGJlIG5vbi1OVUxMLCBzbyB0aGUgYWJvdmUNCj4+IGNoZWNr
IHNob3VsZCBwcm9iYWJseSBoYXZlIGJlZW4gcmV0aXJlZCB5ZWFycyBhZ28uDQo+IA0KPiBXaGVu
IEkgYnVpbGQgU21hdGNoIHdpdGggdGhlIGNyb3NzIGZ1bmN0aW9uIERCIHRoZW4gaXQgc2lsZW5j
ZXMgdGhlDQo+IHdhcm5pbmcgYmVjYXVzZSBTbWF0Y2ggYWxzbyB0aGlua3MgImZpbGUiIGNhbid0
IGJlIE5VTEwuDQo+IA0KPiBUaGUgY3Jvc3MgZnVuY3Rpb24gREIgdGFrZXMgdG9vIGxvbmcgZm9y
IHRoZSBrYnVpbGQgYm90IHRob3VnaCBzbyBJIG9ubHkNCj4gZG8gdGhhdCBvbiBteSBvd24gc3lz
dGVtLg0KPiANCg0KQ29vbCEgSeKAmWxsIGFkZCBhIHBhdGNoIHRvIHRoaXMgc2VyaWVzIHRvIGp1
c3QgcmVtb3ZlIHRoYXQgY2hlY2sgYWx0b2dldGhlci4NCg0KVGhhbmtzLCBEYW4hDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KVHJvbmQgTXlrbGVidXN0DQpMaW51eCBORlMg
Y2xpZW50IG1haW50YWluZXIsIEhhbW1lcnNwYWNlDQp0cm9uZC5teWtsZWJ1c3RAaGFtbWVyc3Bh
Y2UuY29tDQoNCg==
