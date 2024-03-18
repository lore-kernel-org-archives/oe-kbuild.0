Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834BC1DDF1;
	Mon, 18 Mar 2024 03:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710731728; cv=fail; b=Z/+VZbmjhQ19nF5jLAC6dpHoXeKO6yPf9GA6QkTEUkkKp48b25RL/6yxrPHhAV1NLq3hStLiemIgCMBoTmHgf2jf7FpjUyyznCRMi3Yoff3xp2HcbEddwicKg7m/J1IrfguhtHcJvRhA2Jaai7yPe5YLRqTEwuMseO94kGmhAiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710731728; c=relaxed/simple;
	bh=IinLzSsQm3aKI1e8hJDKn9vrw/YEfrC2P7DGfb1VvSU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ZV7XJ+OroxSYS1Xio7CZkaKK86eMA5FkETK7CQ3OXpeSYxHcG0Kvx9NhaHvuurOvGM3H3vUdr8fsIT5pAqgxmjzzqpyq7/rZ1Ci4piSJDeMY30Ux+sCOcZVBXhD+aiXCLBemoTPbtrTFRM+xqSNuK9AMAoWdL1yiGdxJtAXotgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=XWHflmZt; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="XWHflmZt"
Received: from pps.filterd (m0209320.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42I2gCRu025017;
	Mon, 18 Mar 2024 03:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=S1;
 bh=IinLzSsQm3aKI1e8hJDKn9vrw/YEfrC2P7DGfb1VvSU=;
 b=XWHflmZtETVrIJPIWnAss/NjlvSW6iTYhRpF0RcEsPf3BuLaSzHpFuxnMBf/GueZsNcH
 Vazq7NzHjFCCvklqC5w7tEm4b7oXch1xURBoZv1KuMr3bXLmQnhVoAUCDVgD0OaMKn86
 Wx46xaUueBPCax18n7iI6ijY+uWBKbf4AmQlQVbBUMr/C2JUWFsGzJHbYEmOH71lFfaN
 rmoFfHxCGoPoxEfcd5UwAYU/pXBBgil5xXzT67d2kW2HePS2MuQ+aKgTdnPKfVj7w+I4
 jQ9f10MP2YYTpfw1EXLejGRLa8UJSCEkBa+JUZtPraQB20A90CH5x/b3pHEcjJqkRtS9 gw== 
Received: from apc01-sg2-obe.outbound.protection.outlook.com (mail-sgaapc01lp2110.outbound.protection.outlook.com [104.47.26.110])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 3ww1am1egy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Mar 2024 03:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hil9L0xcQ48MRl/6U/y8F5YaWUg6nt0HdSsIQVzLkY92PWyicyA9Flafg4VOzEAXjIcLpCCS+v8o9Q9+2cxtfK4AkvmjdDHOTO2MkY36LGEqHq6rOvejggxP+q1TH7YuVWyowSdE5QW7IjF5T3Ay+5ZVmTnOKOsym8xqqE/zWCYkA8JN5pDc2CMsx6f/jKGxbYMj/kjRib+wO5xwbryM2FE0PscVwTMoXIDtb0jugw6JnxrYsEC9Qh/7O+giXfmwLvkSrdci6qBFl9IQAw+HhVTBGeKFVzxtrhzOKXxruv+2uEFkLbQtvY7epUIwWpEw8HEFOyhmBkSgfMcl5+5qYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IinLzSsQm3aKI1e8hJDKn9vrw/YEfrC2P7DGfb1VvSU=;
 b=DHLtUP1MB6Uv1JLS39d70iG7+qO8eda3J87rYTRrHmMoV9i5Ycobzi4yOGhNnQq4iDMq1v+XBOjdbI1TpKJ9HuvaBUVVNXTZ75ym620aTaAXgukCdgkqHxZ96puRDnJwFb/lBsN+wa8m6iy3X7QKSmfI73G2BA4Z4vd9f6633WeKouZeOZ0VoYwRJFsH/6vB7BARR341+V4NwOPZaPaX0H62qdqu+RgVgMRwr6bHKi8PVfxLtal2qoyMGBi0Shemk9TJrYyktPAvl4o1dAcTQ5OZ5V3cSYD3KRpuC805Hr9QjvVhSWPfyHNHquDYMtg5jpk++FCVVvbLLUaW2ifBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com (2603:1096:301:fc::7)
 by TYSPR04MB7967.apcprd04.prod.outlook.com (2603:1096:405:88::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.25; Mon, 18 Mar
 2024 03:14:50 +0000
Received: from PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::7414:91e1:bb61:1c8d]) by PUZPR04MB6316.apcprd04.prod.outlook.com
 ([fe80::7414:91e1:bb61:1c8d%7]) with mapi id 15.20.7386.022; Mon, 18 Mar 2024
 03:14:50 +0000
From: "Yuezhang.Mo@sony.com" <Yuezhang.Mo@sony.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
        "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>,
        Namjae Jeon <linkinjeon@kernel.org>,
        "Andy.Wu@sony.com" <Andy.Wu@sony.com>,
        "Wataru.Aoyama@sony.com"
	<Wataru.Aoyama@sony.com>,
        Sungjong Seo <sj1557.seo@samsung.com>
Subject: 
 =?gb2312?B?u9i4tDogW2xpbnV4LW5leHQ6bWFzdGVyIDEyODgxLzEzNjEzXSBmcy9leGZh?=
 =?gb2312?B?dC9kaXIuYzo4OTYgX19leGZhdF9nZXRfZGVudHJ5X3NldCgpIHdhcm46IG1p?=
 =?gb2312?Q?ssing_unwind_goto=3F?=
Thread-Topic: [linux-next:master 12881/13613] fs/exfat/dir.c:896
 __exfat_get_dentry_set() warn: missing unwind goto?
Thread-Index: AQHadu3P9VVEZbMucEaPnLY29Cd937E8yojk
Date: Mon, 18 Mar 2024 03:14:50 +0000
Message-ID: 
 <PUZPR04MB631609D45B173DAADA83FB0E812D2@PUZPR04MB6316.apcprd04.prod.outlook.com>
References: <6669eebb-e27b-4a50-840e-101112765e3d@moroto.mountain>
In-Reply-To: <6669eebb-e27b-4a50-840e-101112765e3d@moroto.mountain>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB6316:EE_|TYSPR04MB7967:EE_
x-ms-office365-filtering-correlation-id: 99610f26-1a8a-44f8-0ca8-08dc46f992ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cDLAOQ//7vu1xR8Cbb5dk7e+PjzK8EMmjBW45/vfQ7ikkqwkEULdXJ9KALy+CL92Ekr3eO+XXPcyz1JEC580Fjcc54stsI9femy/qXr4zoLkBOilWaQJTzd2EUw9OrfLZv6yCMpB67MIUzG8KQQy83yd705sdSmjSAForVWzmyoi+poJ0nejKRPKb++EvPGBZlfRy8tt1RwbDxg1x0K5lD8PQfB6oiAuRcC1txwVvIgbcMN0j8jNqg0PqwrUjlZvNlvzskIVScJX3Hlk29hMiu2uX8R1Gn7bTQ7zHTSYbzQ22Ta1poU8hwnL+N/fI3tg4C2V6jFOzp5OXx1i4E2RhuTGorCmV+K+o2csGrJdG+cOKH+qCHP5EdpA/hG+HCMZIfTmCZnQ8rI2ZuDkZS/lN2vZzshdgKKXVhxa7Lo5yuZqoNBBdgzkfKXKEdhp4Eq+fnWBon6DQQFGanffB1P6KWq3WyIvX/GYtM5MsDTJBPLral3SKcWLyRKktO87dkGvECNrfN/YtHY1DOmbTvc0K0H1JmxDgtIeZN2SDsvHcCn/QMrP9t8yZ30Ty+DaQepQEuhnxO8wgUO/AL9fLgL2IHjD/B2t4LqlkWdUH9t2DKa7Mt+JRlaw8f6fvdJTtNV/MpAgUgHvZpTrmExRSROagK5lwMj7nR2HemcFtTQmxMu157Z3BOlF1x10qLlY7ep8Up/Bw2Bb8pjpqgfW28uCUe/hUvSlyayrCbKcQMw966Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB6316.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?Vmx3aFJJK2w0elRyT1ZiZkttN3B6ZkhBUEdBV2l4VzRBYXhzazRzL2VHUnB6?=
 =?gb2312?B?cDZBdWQ2ZHp2UnJVYnFiSDNzZkRmMFlwRjcyUkpWODlXUXlWTFRnblVvdzhW?=
 =?gb2312?B?d09WT1p6VTVzS0hXNFNnUWNZWHhDYkxOVmtQdXhxdVljVmtSMEwyMkN1bkdx?=
 =?gb2312?B?b3dQNnpVVXlVdmZYbm5QbGdJV01kWXJVUi9ZdDFRTjBwVklNbURqZ1laT3Ex?=
 =?gb2312?B?YnR1UkdkYW9nQWxna0JRRU5PNG9TSUlNZGdkazhsMHg1MG4rZHFESEJTTWpk?=
 =?gb2312?B?MlRBZDFSQklVM2lnb0FhbGs5NGZRbmxnOFU4bnhsN21HSUZHYXBTanB4bmVt?=
 =?gb2312?B?aDhBdWRKYkM5eVJPejJMYVpabk1nbHE2Vis3NXArL3BQN2lnbWxmcnF5d3Vw?=
 =?gb2312?B?MWpvL2lGMVJoQVJCQ1JEekFFK0hDc3RWcXlGV3Nzb1JpYzh5TXVocEhWQlVo?=
 =?gb2312?B?WVphR1JheW5iTS91V3JqdFRUTE1VaFNvUTYxQ0ZKZmJHL25rc0U3dUFSYmJ5?=
 =?gb2312?B?RDFoRi9XNUlaRnFCdko2WG9TY2NpYmRBZGdaUlNETW1PZm52cUdDWTFMaWlE?=
 =?gb2312?B?dXZMYW5zUDBYd1QvM3c0T0dsTjZmTXNWOHMzUDh0b042MW9zTGtkVTljbzdL?=
 =?gb2312?B?YnM0WGRhcVltMlVaS2lQM0pXbG9BRlV4NUliOTNNajdFSk9qc0J4N2JBYkho?=
 =?gb2312?B?Z1NDZEtzMUd5L0pzNjZjNXJsZWU3QzhKcUF3NUt3VUEvR1N1Y21jc0hXN3VV?=
 =?gb2312?B?YXRIdVg5YXgvZ2M1MXNTMDVEQm5tMis2ZURmbzJqTkJIQm82ZHNjQkVseWlt?=
 =?gb2312?B?bzJsVFVYeityL2JKSGlYbzJ1emRqeG8rR1IwMk00WEhKVWY3VWtGekIvOE9Z?=
 =?gb2312?B?OU1GK1lGRTQwOFZ4QXZQNXZYTHh3UHJsOGVvR0RCRVhiNitjSFZJL0xueTRz?=
 =?gb2312?B?YWd4VEFVVVl5YndDOHYvZjVnaXgxb3oxajk5bVhsZmpwM1pQVVhHSFQyaWlk?=
 =?gb2312?B?UkN1bzVBRThQeGtFT2ovUXdLa1UyV0NIUDcvME56NUVGbHpHa3QyZjFQRVRR?=
 =?gb2312?B?VzNPenNub2N3czhNOGsxb1RTd1c1NklDRXVwWlYrYlhnWmhXUWg1bGd4Z3dm?=
 =?gb2312?B?NEhMa0pDeHRBWUZ1bUJWR2tvUDBOZkpyV1VNNkFqWmE0YnlMb0RCMThCNHZn?=
 =?gb2312?B?c3NZbWVnQmhQUGJyYnBneVlhN3hGTStSS0kyQ2czd1BpOFRTY3hMVHBseEhR?=
 =?gb2312?B?ZUdWUS9tZksyeWVQNGJnRkVjQUNHaGFPZlFnV3pIdkdIZzU5RzBOVDRQS2dQ?=
 =?gb2312?B?RXVpd2JlWStIdUNFVUpNMmxpTkFnaUNGMHR5b21lWWxBUXh5bnZRb05CcU55?=
 =?gb2312?B?bnFobE5laVFzaFFxbkM0dzRnZG9sOEpZNzVZSGZ6YUpheG5YNGE4cjNYVjhw?=
 =?gb2312?B?cHN4V2JSWFJWS2p1Z0paNmdpMmpTbVRFV1JGY0NvTVZlSVBnZGhaRlEyTmN2?=
 =?gb2312?B?Zk9uMUQ1UURDWjFQbDlDNVRLc1dVSUQ3bEF1cE1zSTRZSEN2bUNqcGFIUkV3?=
 =?gb2312?B?QnhUc09WT3RuUzc1UXV3YTVhN1Y3SVVzdzMwK1p2NEJmNTZIYkNSZGFvVEI1?=
 =?gb2312?B?b1ZUZ05NVm5tTjVhcmhySE0zaTdraUZ2V3ZwVkxaZ1JNU25ReWZXaENIb21V?=
 =?gb2312?B?cVJJbm12MXRsRzl0ZnIzUFFuYndhbFFwbFZmN0kyU1JEU2FuN2oxMTVSRWFX?=
 =?gb2312?B?NkZrUStRRmlmbWJCTVFwRkthaHMxbUZHcXBNVFpPVXFwa1daOTQzeUEwVTJP?=
 =?gb2312?B?OVN6OC9OcUJMdDJiVWJOQVBuTGc2YldjN3VjallqQjR5UG12WVV4aEovaHd0?=
 =?gb2312?B?YUwvMEJNcFNVRFdQUER0WWlyU1ZPVWdESVd2SlVtMTMzc2FhOUlGamVSbEFD?=
 =?gb2312?B?QmQyWUlCK2V1Y3FKQ0JNbUtROVB6anFMdG9LblRpUlkxTWhJK091TG9aVTEz?=
 =?gb2312?B?VVc0ZkxxdTlvQ1I3S3c2L1krUlk1Q0lBV2VYMzlGUHlTR0dnNlprcGFoZXdN?=
 =?gb2312?B?QlhMQUlOWm9NR0lVUm5WZnhKNXorK29EMWc0MFY4bmJ4SlpKSWRQZE8xWWZw?=
 =?gb2312?B?NmNud0g3LzFnNmp3Q05MMDVVcDdhTE0wR2ZMdW1kL1dBdzFIb1Z3SXFINWk5?=
 =?gb2312?Q?mWoMvmkdeT+h30ouDQe9Fqk=3D?=
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/lD7BqSSJBRC22XKMje9zmqjGeMDGHfscAhzFX+VYoOgHdG84NjwozZpypFyvXmBHpHvX27O99wdpebZ/dRuqnOKwvkWgUpN5UW+FkD2JliLC+NfmeZ2EfCfHARLpmlah6Vw6ysE0kDonYzA1sXnHUMSL5xwFYXO39+OA5wgZtSoJfqXE/Vd/2e6VDL8YdUEULWnVgbUaVmOgDDclT+SinOsH3L0p7k7tD0ytT0GTSmiCvKy7ptHVlpoHNGk2c4bjWJyzbuPej8K3cHQC/61Ass9EXmHsT1ZYd1djjRGXwUvu9DAgJ7Gyg1knK7w4i0IejGSfFaZ15PPkBghgXr2cchTuo7NZlGq8Hy3LTY6a0p0hSJZLe5vPOxXN/MVZ54J71cgKJ3Hv35Axt9hPJB6g4dUFA+pNXnKV1dJqF6/elZymr2sBWl5Ud8P6V+57S2kKe9AP0i1tGsI5uD1zob8MtweCC0vow4obsBkZLHJNA0fE2eAYCRWHzQ/g9JwVUJhdUa7nsRcEys2yGqYc9PjArTJKNBHt46K2m4FAjPAvJSCYTXMDDU3OdXNPmyRByYoMu6W4yPJGKVpPwrfKr29pLYtDHyy6jcm7kw1nGNHkp8NJj46Aokdf04K+iwCEiwU
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB6316.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99610f26-1a8a-44f8-0ca8-08dc46f992ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 03:14:50.1208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3MyDYwVZAFMvXpaNijXZYGBK1q7RZYuTdd/SjbxcnKbZ966gnmmbwG4mZAwzrFLTtlQzb6aHFpLUjSYMSusvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7967
X-Proofpoint-ORIG-GUID: tdd_ZloqFs0hIbm2wvDpDr6KO9VwAf61
X-Proofpoint-GUID: tdd_ZloqFs0hIbm2wvDpDr6KO9VwAf61
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Sony-Outbound-GUID: tdd_ZloqFs0hIbm2wvDpDr6KO9VwAf61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02

PiBmM2ZlMzk1NGMwOWY5NyBZdWV6aGFuZyBNbyAgICAgIDIwMjItMDMtMTcgIDg4MiAgICAgICAg
ICAgICAgICAgZXAgPSBleGZhdF9nZXRfZGVudHJ5X2NhY2hlZChlcywgRVNfSURYX0ZJTEUpOwo+
IGJkMzFkYjJmZDNiZGFjIFl1ZXpoYW5nIE1vICAgICAgMjAyMy0xMi0wOCAgODgzICAgICAgICAg
ICAgICAgICBpZiAoZXAtPnR5cGUgIT0gRVhGQVRfRklMRSkKPiAzYjk2ODFhY2IwZWY3MyBZdWV6
aGFuZyBNbyAgICAgIDIwMjItMDMtMTcgIDg4NCAgICAgICAgICAgICAgICAgICAgICAgICBnb3Rv
IHB1dF9lczsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXj4KPgo+IGNhMDYxOTczODJiZGUw
IE5hbWphZSBKZW9uICAgICAgMjAyMC0wMy0wMiAgODg1Cj4gYmQzMWRiMmZkM2JkYWMgWXVlemhh
bmcgTW8gICAgICAyMDIzLTEyLTA4ICA4ODYgICAgICAgICAgICAgICAgIG51bV9lbnRyaWVzID0g
ZXAtPmRlbnRyeS5maWxlLm51bV9leHQgKyAxOwo+IGJkMzFkYjJmZDNiZGFjIFl1ZXpoYW5nIE1v
ICAgICAgMjAyMy0xMi0wOCAgODg3ICAgICAgICAgfQo+IGJkMzFkYjJmZDNiZGFjIFl1ZXpoYW5n
IE1vICAgICAgMjAyMy0xMi0wOCAgODg4Cj4gY2EwNjE5NzM4MmJkZTAgTmFtamFlIEplb24gICAg
ICAyMDIwLTAzLTAyICA4ODkgICAgICAgICBlcy0+bnVtX2VudHJpZXMgPSBudW1fZW50cmllczsK
PiBjYTA2MTk3MzgyYmRlMCBOYW1qYWUgSmVvbiAgICAgIDIwMjAtMDMtMDIgIDg5MAo+IDk0M2Fm
MWZkYWNmZWJlIFRldHN1aGlybyBLb2hhZGEgMjAyMC0wNS0yMCAgODkxICAgICAgICAgbnVtX2Jo
ID0gRVhGQVRfQl9UT19CTEtfUk9VTkRfVVAob2ZmICsgbnVtX2VudHJpZXMgKiBERU5UUllfU0la
RSwgc2IpOwo+IGEzZmYyOWE5NWZkZTE2IFl1ZXpoYW5nIE1vICAgICAgMjAyMi0xMS0wOSAgODky
ICAgICAgICAgaWYgKG51bV9iaCA+IEFSUkFZX1NJWkUoZXMtPl9fYmgpKSB7Cj4gYTNmZjI5YTk1
ZmRlMTYgWXVlemhhbmcgTW8gICAgICAyMDIyLTExLTA5ICA4OTMgICAgICAgICAgICAgICAgIGVz
LT5iaCA9IGttYWxsb2NfYXJyYXkobnVtX2JoLCBzaXplb2YoKmVzLT5iaCksIEdGUF9LRVJORUwp
Owo+IGEzZmYyOWE5NWZkZTE2IFl1ZXpoYW5nIE1vICAgICAgMjAyMi0xMS0wOSAgODk0ICAgICAg
ICAgICAgICAgICBpZiAoIWVzLT5iaCkgewo+IGEzZmYyOWE5NWZkZTE2IFl1ZXpoYW5nIE1vICAg
ICAgMjAyMi0xMS0wOSAgODk1ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWxzZShiaCk7Cj4g
MjA5MTRmZjZkZDU2ZGQgWXVlemhhbmcgTW8gICAgICAyMDIyLTExLTE3IEA4OTYgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gCj4gSSBub3JtYWxseSB3b3VsZG4ndCBz
ZW5kIHRoaXMgYmVjYXVzZSBpdCdzIG5vdCBhIGJ1ZywgYnV0IGFjdHVhbGx5IG90aGVyCj4gcGVv
cGxlIGFyZSBnb2luZyB0byBzZWUgdGhpcyBzdGF0aWMgY2hlY2tlciB3YXJuaW5nIGFuZCB0aGUg
Y29kZSBpcwpzbGlnaHRseSBjb25mdXNpbmcuCj4gCj4gQXQgdGhpcyBwb2ludCBjYWxsaW5nIGJy
ZWxzZShiaCkgYW5kIGNhbGxpbmcgZXhmYXRfcHV0X2RlbnRyeV9zZXQoZXMsIGZhbHNlKTsKPiBh
cmUgZXF1aXZhbGVudC4gIFNvIHRoZSBjb2RlIHdvcmtzLiAgQnV0IGl0IHdvdWxkIGJlIGJldHRl
ciB0byBkbyB0aGluZ3MKPiBjb25zaXN0ZW50bHkgb24gYm90aCBsaW5lcyA4ODQgYW5kIDg5Ni4K
PiAKClllcywgaXQgaXMgYSBnb29kIHBvaW50LgoKQnV0IGF0IHRoaXMgcG9pbnQgY2FsbGluZyBi
cmVsc2UoYmgpIGFuZCBjYWxsaW5nIGV4ZmF0X3B1dF9kZW50cnlfc2V0KGVzLCBmYWxzZSk7CmFy
ZSBub3QgZXF1aXZhbGVudCwgYmVjYXVzZSAiZXMtPmJoIiBpcyBOVUxMLiAKClRvIGJlIGNvbnNp
c3RlbnQgb24gbGluZXMgODg0IGFuZCA4OTYsIEknbGwgY2hhbmdlIGxpbmUgODg0IHRvIGNhbGwg
YnJlbHNlKGJoKS4KCj4gCj4gYmQzMWRiMmZkM2JkYWMgWXVlemhhbmcgTW8gICAgICAyMDIzLTEy
LTA4ICA5MjMgIHB1dF9lczoKPiBiZDMxZGIyZmQzYmRhYyBZdWV6aGFuZyBNbyAgICAgIDIwMjMt
MTItMDggIDkyNCAgICAgICAgIGV4ZmF0X3B1dF9kZW50cnlfc2V0KGVzLCBmYWxzZSk7Cj4gYmQz
MWRiMmZkM2JkYWMgWXVlemhhbmcgTW8gICAgICAyMDIzLTEyLTA4ICA5MjUgICAgICAgICByZXR1
cm4gLUVJTzsKPiBiZDMxZGIyZmQzYmRhYyBZdWV6aGFuZyBNbyAgICAgIDIwMjMtMTItMDggIDky
NiAgfQ==
