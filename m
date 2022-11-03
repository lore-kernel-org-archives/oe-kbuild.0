Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2106.outbound.protection.outlook.com [40.107.21.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD826FAE
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Nov 2022 11:28:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krdF/rXkF5MHF0Jnpm1x5jN7KHu8myoW1q/2P6+2P9O3b0daDCfsIKBcYUosi2pGIgiUVTdOgqdDsqe0dU8Q9SnkuOThOMTPeS42/YJc2aDmhhk5tR44seHt4nMIf733KvH7IrkXdglb2voYd7r5ayJ+Tx/WPbOp9XdTVxwMd6DimRTq9qYIJ7oOwnKIm8A6yJmxyYeQ/RgOA/u3cSx+KwOrh1p5zt3Z5+QKus4Z0h4g0xDe2g+7UOSlWD+uoWAY3K0Z2dOF+rRVx1btHcDSZu4L7n9A/UdicudMaEqJ8e8mYIX2jTJBp884dexWYNjVeHh+Kv9OXnwR8EWFUzs7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNXxbBBRJrVyWJXeSyy3naxj+J9qj2zrncEBTPwh+ZY=;
 b=KnnS/qKYkNYnmx/gpq4qxpExnwn0EqapYQvs5ZXQN6YMYiFOf0SJENG968JTAE1qauIzb1E+T6sNm2HMl+PQ1QEP+qi/OsdJ2aHlHv1ePHW0sxn0wAovJS5ztBrGM6OWk6bQdkbuQiyu4AaFSjDCwWDvMd1Q1zXWH7IpStCqsrnL5KUg6zQRN1qN1arUgZqREwVaGCU221li7FWJCAe4Tm6u0qEpOrbYfEbfwMT8lh7r140hwCwNryJn9vNBI8XRIwiEcci0YNxcsLv7VwK2avksCfqodLEYiLtRxz9JK4o7gaTZcY8yjMtGTNujhCy4CAtg0MHTDoeQ/BZszm+Q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNXxbBBRJrVyWJXeSyy3naxj+J9qj2zrncEBTPwh+ZY=;
 b=DE/KsLXreU7cmh7JQJGJH+Kt6kePqZye5ZrezXZO1WLoNTnOQkdaY7RL1DGJSKcSwJ7HS4+KHdONyh76ZjhjE1jfvTyqO1/1HeGrrOy597ldDAp5D582euCH+I+8C/coWvFiWV2sl/skrNZHhsnQHEsynOT9YQR7J1+OkZ54ohM=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by PAWPR03MB9082.eurprd03.prod.outlook.com (2603:10a6:102:33e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 11:28:50 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::76cd:ecbb:6606:be9b]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::76cd:ecbb:6606:be9b%6]) with mapi id 15.20.5769.019; Thu, 3 Nov 2022
 11:28:50 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Dan Carpenter <error27@gmail.com>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: Re: drivers/net/dsa/realtek/rtl8365mb.c:1349 rtl8365mb_stats_update()
 error: uninitialized symbol 'ret'.
Thread-Topic: drivers/net/dsa/realtek/rtl8365mb.c:1349
 rtl8365mb_stats_update() error: uninitialized symbol 'ret'.
Thread-Index: AQHY73QLciHz2vmNckucBcb89S+ANa4tDK6AgAADTIA=
Date: Thu, 3 Nov 2022 11:28:49 +0000
Message-ID: <20221103112849.tcp7i2tzazyjtbga@bang-olufsen.dk>
References: <202210291504.tn2vPOLg-lkp@intel.com>
 <20221103110429.ehsswxabce3dqky3@bang-olufsen.dk> <Y2OjLbDSB45XAjLC@kadam>
In-Reply-To: <Y2OjLbDSB45XAjLC@kadam>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3943:EE_|PAWPR03MB9082:EE_
x-ms-office365-filtering-correlation-id: 586b9a5a-e690-436e-5219-08dabd8e947f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t1L1Y3J6IkheHLx+biRJZ56HYRSnUWAB+WdXZKAHbgwzgM7K8lRB6/W++HFxaV8G6/f6fVe1TXM4XHJ7o+U/hiU7txg/NgBJF/Wodfs7+/Us7LLjunzeQvsD6XZjihJsnitOg7uZMUtqMFy0Ta71PbVOHk1V4ei98sUoKHJD3Tpu1rcV5wZtRvg8XDplTtpUdcalChUA0AiF6+1tPHS8blUYDJ7PMcfl5olVHa30FyEjTK+0xxVqbOySwc0/xxHZkH1Mcyfs175toq9D4tgB942anWI4MnsiZxafgwoN5eNpLUEkeQtQtXvipu+5/J+E/S6qjz3ptu+x7xubyJLIdG0jDRGIUPp0C4p5IRi2ao/nWvoNatBicifgsJnm/N57hJO00WUd6ph1R6YRUmDP/P61F0tkNqcsGMyvYAAaRuqj+kpYCZpxuUU99Txza9FtEWTIEWdqrT+bKyUQJuokdUvdyz7rLPfwOXRPgLWBoGSQXcKgMZHYjEFz/Xgnl5iouAlQsohm0tzg5ubzxz7GP89yOt8BFYjslDa5BFLLQuENBiSL5nYZmL9v07KDRiU6K6ltIQfHZO6HwNCNo3QgfZvKOGAt9NSbdZyMMG9GQEOGXPUDwnR2lzRLTufEXbTGtF0pMs/6nHskCU2RR1t3t5Sl+KShp5HFpXaM77yjlqv7uTAorgoK2jUaTh4JGCxAmkEWqU4V9XVfmXM+EXx69CmjJfc4CYywTkzPAbBB+t8TW/NSyGVbad7eQUyzC9cbFZydHo+3cuJfy/V+N7ag8j+BWh/PfgGsVLA1cWI1DcI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB3943.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(451199015)(85182001)(36756003)(85202003)(71200400001)(54906003)(38100700002)(5660300002)(2616005)(122000001)(86362001)(83380400001)(66574015)(2906002)(66446008)(38070700005)(1076003)(6512007)(186003)(91956017)(26005)(966005)(478600001)(6486002)(316002)(6916009)(76116006)(41300700001)(66556008)(6506007)(8676002)(8936002)(64756008)(8976002)(66476007)(66946007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cm5iaE1hRHZhN3BvaU96UzNZV3BFQnRaUWpTMlIyM29IOXVxbGc1M2ZIYTNI?=
 =?utf-8?B?TERGWUxLSWxsc21JbGxHbFhIMm1KUG1iV01sdStJc0dvdFlOZjJiejc5c0F6?=
 =?utf-8?B?SWtMSDNZNG10SFpmVkx4YkppanpUb3VlRC9nQkZWQ0lCWUIreVZFMmtKRkV3?=
 =?utf-8?B?S3hMR0Uvd0VvenF5SjBtaWxYdG5mblhuaFdYTXFyU1pRcjY3NGhpZmNrenRq?=
 =?utf-8?B?dHNHSDVRQ0VVQmozTnF4NHNpUGovUjVDdkxlZTN5UXRwYXFUM2VNUlErS0Qx?=
 =?utf-8?B?aVFLRWJPMDUxT2VPeVYrY2FqREpHUjEyWW9JNE5KT1pZYU9mWkxqb2dyZTJE?=
 =?utf-8?B?dWs5bHJHTTJGM2F2cXRNR1JuUkRxbkVoODVOSGV2dTBpSHRkdmhLYUJMUTJC?=
 =?utf-8?B?REpYWFQ2MVI1Yit5NUxMaEtlM1lDMlpGbjVEUlRJYU4rOHUwR0hxTC9xVGVh?=
 =?utf-8?B?eWtvNUhlZkxONnpjWnFsMk10aUFIRzhERlRUeVRtZUFnUkJuSE5BTFR5WVBX?=
 =?utf-8?B?c0w4Zy9vczZKdVZycllpVW54RFlPQ0tiR21FVXlrUHRYRG4ycFJaeEM3eWQv?=
 =?utf-8?B?Y1EzTStqOFFpRmZPd0xja1A0LzBBQlJPWDlPalJNT2M1OWlZeE03MjBLaWR2?=
 =?utf-8?B?S0JneFVGYVBtb21IVTBaOGp5WGRPYTgxS3gzNWxlM1NteGF2am9QUnM3SXU5?=
 =?utf-8?B?YVprTzZKbmRoRG5CTUhiVk5mQjVZSjNySFBkS1I3cno3L1JVTEhLZEdVcFR2?=
 =?utf-8?B?NkdvOW5Mamg1NHZ4VHM2NFVOTjJnQ3htMSswMHBjZHlZZXV3NDlrVEtjSFhS?=
 =?utf-8?B?MXlFZVY4cFU4MzlqVjltbDBPZC83MWtSS2J6WUJ2L3hQbE5OL2tjOTJ5TTJa?=
 =?utf-8?B?RnB6ZVZqdnZCc2Z3MEtKYUs3L0M3bncvdmdFeXVZbFI3TnU5MnJ2SjZNUVQr?=
 =?utf-8?B?U2V1U1J3YS9HZW5VWmJTNjA2bVhzNWRrMndxWVIxKzhhQ05Ca21NQi9JaTUy?=
 =?utf-8?B?TjZwY3l4bzRPR2R2REJuWDE1NmNEVUw3MFdvSDJiWTVvYjl4NisxRUt0aUhl?=
 =?utf-8?B?VEttUU11VU9RNDcwSjV5S0ZZTks2Z2hvdCtuN1VkNGdtTTJmeHpRd1loOE5u?=
 =?utf-8?B?K3hBWjBsYnZ6ems2eURBTkQ2WG44SHhkSlpnN2ZYSTgxem5VajQrdXhZUk9h?=
 =?utf-8?B?VHB6NjI0SWc2UVgvOEx6R0dKcDVHdURNcWJSWURoVXo1cG9EejFkYmU1T216?=
 =?utf-8?B?dWs2TUZHRnJoS0dxaGZHc0VNK2RFRFVhaWlBYTlncDNhemxQMGJmTkVEM3ZP?=
 =?utf-8?B?bisrS3dxTVZrVlVUZDR6OEdQTXBObmE5NE9MbkhEUWdld1lzYnhRQWRPTktS?=
 =?utf-8?B?emQrLysxV0lRaUt4dnE1Qmx1d29wVDQ0NmRwdkMwazRpNkhoOU5hUThuNGRz?=
 =?utf-8?B?eVA1R3BTUUNsV1VrVThhRTRqVGZ0RlRIRnh3THR1WExWc0xmd3duc0tLN2ZP?=
 =?utf-8?B?bmdIMS8rKzJRR3JXM1dheGQyOTRhYUlvcm1tWWsxUUtPb3g0cE00STAwNmVu?=
 =?utf-8?B?VnAxNEFYV3I3TUFmTlp3S1dVbnJMOHN1MXoyenpKVnRTMXJ0UFJOL2dPY0wv?=
 =?utf-8?B?MTRmbG9yR25MNEx4WFJyUGthVGtEVUY0cEdOWnJCeGpxZEJKUXlpbERmcXdi?=
 =?utf-8?B?akZZVVl3S2dQOFMrTDYzUUxGRmttaUx5RklvbWVSL2pNMWkySlNiVnNZRHpi?=
 =?utf-8?B?eXJyY2FDQVl2ZG9MYzNjU0gvZlMrM1AraXlTU3NwR0tRbzR4RDlzYTRYd25B?=
 =?utf-8?B?TTVLM3psWkdqNXJaYUlXUDdhZHZWUklOMnZ3cDlnbW1Fc1BxanJoY3ozMHFS?=
 =?utf-8?B?TERNbTN1VXhMT2tDOVF2em1tTVJYL2Uxc05Dc3FOWEhnWERQN2dFWFRKbzNF?=
 =?utf-8?B?aVNjVkpGWjVHUzMwZTBDaGJFR0VSNzdsY2pjc3NJUEovamNYVmNGdGNjd0ls?=
 =?utf-8?B?VERMRGRxMUUzVm80ZkttYnhOd1l6TEV0bU1iTmtKNkFvb3d2ay83WWYwZzRQ?=
 =?utf-8?B?QUZ3TlZUWFVURUdsbGlBbWVFZm1lUFZ4bzBQNmU0bExFd29XOG12ZkVHSHhZ?=
 =?utf-8?B?WWtBWGtmc2QybWN2WnZRS3l6K3dsb3pKYlpQck4zek9PQXkwQXdFWWswN2Vz?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F7A286E8CBF7F47BAFE44D69FC7E5BE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586b9a5a-e690-436e-5219-08dabd8e947f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 11:28:49.9943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aZQzCSS/Ijm6OQG3MbdNoS4h25joM5tVDCOGj3VXzdHhxidWKtXrTu1trMj6FJixwPIUSXrNafb+9HJG6DGZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9082

SGkgRGFuLA0KDQpPbiBUaHUsIE5vdiAwMywgMjAyMiBhdCAwMjoxNzowMVBNICswMzAwLCBEYW4g
Q2FycGVudGVyIHdyb3RlOg0KPiBPbiBUaHUsIE5vdiAwMywgMjAyMiBhdCAxMTowNDozMEFNICsw
MDAwLCBBbHZpbiDFoGlwcmFnYSB3cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBPbiBTYXQsIE9j
dCAyOSwgMjAyMiBhdCAwNDowMToyNFBNICswODAwLCBrZXJuZWwgdGVzdCByb2JvdCB3cm90ZToN
Cj4gPiA+IEJDQzogbGtwQGludGVsLmNvbQ0KPiA+ID4gQ0M6IG9lLWtidWlsZC1hbGxAbGlzdHMu
bGludXguZGV2DQo+ID4gPiBDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiA+ID4g
VE86IEx1aXogQW5nZWxvIERhcm9zIGRlIEx1Y2EgPGx1aXpsdWNhQGdtYWlsLmNvbT4NCj4gPiA+
IENDOiAiQWx2aW4gxaBpcHJhZ2EiIDxhbHNpQGJhbmctb2x1ZnNlbi5kaz4NCj4gPiA+IENDOiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+ID4gPiBDQzogRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+DQo+ID4gPiBDQzogVmxhZGltaXIgT2x0
ZWFuIDxvbHRlYW52QGdtYWlsLmNvbT4NCj4gPiA+IA0KPiA+ID4gSGkgTHVpeiwNCj4gPiA+IA0K
PiA+ID4gRmlyc3QgYmFkIGNvbW1pdCAobWF5YmUgIT0gcm9vdCBjYXVzZSk6DQo+ID4gPiANCj4g
PiA+IHRyZWU6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9ydmFsZHMvbGludXguZ2l0IG1hc3Rlcg0KPiA+ID4gaGVhZDogICA1NzZlNjFjZWExZTRi
NjZmNTJmMTY0ZGVlMGVkYmU0YjFjOTk5OTk3DQo+ID4gPiBjb21taXQ6IDMxOWE3MGE1ZmVhOTU5
MGU5NDMxZGQ1N2Y1NjE5MTk5NmM0Nzg3ZjQgbmV0OiBkc2E6IHJlYWx0ZWstc21pOiBtb3ZlIHRv
IHN1YmRpcmVjdG9yeQ0KPiA+ID4gZGF0ZTogICA5IG1vbnRocyBhZ28NCj4gPiA+IDo6Ojo6OiBi
cmFuY2ggZGF0ZTogOCBob3VycyBhZ28NCj4gPiA+IDo6Ojo6OiBjb21taXQgZGF0ZTogOSBtb250
aHMgYWdvDQo+ID4gPiBjb25maWc6IG1pY3JvYmxhemUtcmFuZGNvbmZpZy1tMDQxLTIwMjIxMDI3
DQo+ID4gPiBjb21waWxlcjogbWljcm9ibGF6ZS1saW51eC1nY2MgKEdDQykgMTIuMS4wDQo+ID4g
PiANCj4gPiA+IElmIHlvdSBmaXggdGhlIGlzc3VlLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWcg
d2hlcmUgYXBwbGljYWJsZQ0KPiA+ID4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+DQo+ID4gPiB8IFJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+DQo+ID4gDQo+ID4gVGhpcyBpcyBhIGZhbHNlLXBvc2l0aXZl
LCBidXQgc21hdGNoIGNhbiBiZSBmb3JnaXZlbiBmb3Igbm90IG5vdGljaW5nDQo+ID4gaXQuIEhv
dyBjYW4gSSBwcmV2ZW50IHRoaXMgZnJvbSBzaG93aW5nIHVwIGFnYWluPyBUaGFua3MhDQo+ID4g
DQo+IA0KPiBZZWFoLCBTbWF0Y2ggdGhpbmtzIHlvdSBtaWdodCBiZSBhYmxlIHRvIGhpdCB0aGUg
Y29udGludWUgb24gZXZlcnkNCj4gaXRlcmF0aW9uIHRocm91Z2ggdGhlIGxvb3AuDQo+IA0KPiBr
YnVpbGQgd2FybmluZ3MgdXNlZCB0byBvbmx5IHNob3cgdXAgb25jZSBidXQgbm93IGl0IHNlZW1z
IHlvdSBnZXQNCj4gcGVyaW9kaWMgcmVtaW5kZXJzLiAgWW91IGFsc28gc2VlbSB0byBoYXZlIHN1
YnNjcmliZWQgdG8gdGhlIHVuZmlsdGVyZWQNCj4gd2FybmluZ3MuICBJIGFscmVhZHkgaGFkIGxv
b2tlZCBhdCB0aGlzIG9uZSBhbmQgZGlkbid0IGZvcndhcmQgaXQNCj4gYmVjYXVzZSBpdCdzIGEg
ZmFsc2UgcG9zaXRpdmUuICBTbyBtb3N0IHBlb3BsZSB3b3VsZCBub3QgaGF2ZSBzZWVuIHRoaXMN
Cj4gZmFsc2UgcG9zdGl2ZS4NCg0KQWgsIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkg
d2FzIHdvbmRlcmluZyB3aHkgdGhpcyB3YXJuaW5nIHdhcw0KZW1pdHRlZCBub3csIGNvbnNpZGVy
aW5nIHRoZSBjb2RlIGlzIHF1aXRlIG9sZC4NCg0KPiANCj4gQWxzbyBJIHNob3VsZCBwcm9iYWJs
eSBhc2sgdGhlIGtidWlsZCBkZXZzIHRvIGNoYW5nZSBteSBlbWFpbCB0bw0KPiA8ZXJyb3IyN0Bn
bWFpbC5jb20+IGJlY2F1c2UgSSdtIG5vIGxvbmdlciBhdCBPcmFjbGUuICBNeSBzY3JpcHQNCj4g
Y29udmVydHMgaXQgYXV0b21hdGljYWxseSBmb3IgZm9yd2FyZGVkIGVtYWlscy4NCj4gDQo+ID4g
PiAgIDEzMzQgIAlmb3IgKGkgPSAwOyBpIDwgUlRMODM2NU1CX01JQl9FTkQ7IGkrKykgew0KPiA+
ID4gICAxMzM1ICAJCXN0cnVjdCBydGw4MzY1bWJfbWliX2NvdW50ZXIgKmMgPSAmcnRsODM2NW1i
X21pYl9jb3VudGVyc1tpXTsNCj4gPiA+ICAgMTMzNiAgDQo+ID4gPiAgIDEzMzcgIAkJLyogT25s
eSBmZXRjaCByZXF1aXJlZCBNSUIgY291bnRlcnMgKG1hcmtlZCA9IDEgYWJvdmUpICovDQo+ID4g
PiAgIDEzMzggIAkJaWYgKCFjbnRbaV0pDQo+ID4gPiAgIDEzMzkgIAkJCWNvbnRpbnVlOw0KPiA+
ID4gICAxMzQwICANCj4gPiA+ICAgMTM0MSAgCQlyZXQgPSBydGw4MzY1bWJfbWliX2NvdW50ZXJf
cmVhZChzbWksIHBvcnQsIGMtPm9mZnNldCwNCj4gPiA+ICAgMTM0MiAgCQkJCQkJIGMtPmxlbmd0
aCwgJmNudFtpXSk7DQo+ID4gPiAgIDEzNDMgIAkJaWYgKHJldCkNCj4gPiA+ICAgMTM0NCAgCQkJ
YnJlYWs7DQo+ID4gPiAgIDEzNDUgIAl9DQo+ID4gPiAgIDEzNDYgIAltdXRleF91bmxvY2soJm1i
LT5taWJfbG9jayk7DQo+ID4gPiAgIDEzNDcgIA0KPiA+ID4gICAxMzQ4ICAJLyogRG9uJ3QgdXBk
YXRlIHN0YXRpc3RpY3MgaWYgdGhlcmUgd2FzIGFuIGVycm9yIHJlYWRpbmcgdGhlIGNvdW50ZXJz
ICovDQo+ID4gPiAgQDEzNDkgIAlpZiAocmV0KQ0KPiA+ID4gICAxMzUwICAJCXJldHVybjsNCj4g
DQo+IA0KPiBMb29wcyBhcmUgYSB0cmlja3kgdGhpbmcuICBJIGNvdWxkIG1ha2UgaXQgYW4gYXNz
dW1wdGlvbiBmb3IgdGhpcw0KPiAidW5pbml0aWFsaXplZCB2YXJpYWJsZSIgdGVzdCB0aGF0IGV2
ZXJ5IGxvb3AgZ29lcyB0aHJvdWdoIG9uZSB0aW1lIGFuZA0KPiBhdm9pZHMgYWxsIHRoZSBjb250
aW51ZXMuLi4gIFRoZXkgYXJlIG1vc3RseSBmYWxzZSBwb3NpdGl2ZXMuDQoNCkkgdGhpbmsgdGhh
dCBpcyBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0byBtYWtlLiBCdXQgSSBhbSBlcXVhbGx5IGhh
cHB5DQp0byBqdXN0IGlnbm9yZSB0aGUgb2RkIGZhbHNlLXBvc2l0aXZlIHRvby4gTWluZSBpcyBq
dXN0IG9uZSBvcGluaW9uDQphZnRlciBhbGwuLi4gOi0pDQoNClRoYW5rcyBmb3IgdGhlIHF1aWNr
IHJlcGx5IQ0KDQpLaW5kIHJlZ2FyZHMsDQpBbHZpbg0KDQo+IA0KPiByZWdhcmRzLA0KPiBkYW4g
Y2FycGVudGVyDQo+
