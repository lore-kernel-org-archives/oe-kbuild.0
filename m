Received: from outbound-ip7b.ess.barracuda.com (outbound-ip7b.ess.barracuda.com [209.222.82.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7E2D784
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 18:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ddn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b="rhaY6a4p"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169]) by mx-outbound19-99.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 17 Oct 2023 18:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCzT8r/yf8xPsHS05FGY3wlzhTSrhIyifhn3BUhxWTiKguycqtZusARYuFmu6LIl8dwHNq0yTHplKKMvwjCGbsJwWCSNbx5i6ZjhZ8QK/2xJwctSJSBoGLUCQxhuF/vi7Yii9Dx0gESsapW4g0rjYJsDtSm7ke3fZxXhf8qBkyeKArxunMn1+E1j5RJKGVPmKLRuJAnLFauFPfMhMjqgwGmBpTucwcfg4cDRS6GtzHwF52h0RlUc4+HXMEC+T0nSgUaWY9JaTSozpV7wrFdGSu7j0UBfJKeHhnxQzYPRU6lh/ROWOEbTUhnRT/mTw80CdvYkPGNkERd3TpAy8P/BZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpxXDS9S0s9KZT8/nUXlTfXUAcpajugf5MmDLtyhXOY=;
 b=ACW3J95KxTL2qLQ50Ve9+Qith6gCgRuFLGPUDSCf9bDvaqRBuenDFz7/O1wQTb2B7QtnunrkbNromgISNZ+zZ8FOyksOahUr4UMKiYBZl67iO1Kc+diD6h/8e2/9Ik9ix05FYhr+bMy2/+rSZYWXSWAANLVmKJ0+YMbygQiEDevJKqShme82wXmMKTm2u4IiY2Igb4HDwITt75va2aR3GaHy4pbTxX0hkSrv0CxnE+DzqUFKFaPeAprYUvEKC0aUROA4vB3G2LiHDHz5axrXMlhMPPlnkUkJ3x6XLYfp9TqcSWQdm8MMKYQRAbsbfwlZAERQS0YRP8J7oYjH8zg3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ddn.com; dmarc=pass action=none header.from=ddn.com; dkim=pass
 header.d=ddn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpxXDS9S0s9KZT8/nUXlTfXUAcpajugf5MmDLtyhXOY=;
 b=rhaY6a4pu3Ge7SmT8wj/oHBMK7512MV+FHo4/A1/hdMVlZo7EwCmLSer4knLUwOMt73zF1sDQGocLHy45BGFna/Om+fGGOhG5/6OFSRWREiYnnyRwLaaLrIJO0yneCALjhTqggIIkTDOuJloBMlXgUxSzAAws5Do5MIWJCp3EV8=
Received: from DM5PR1901MB2037.namprd19.prod.outlook.com (2603:10b6:4:aa::29)
 by PH7PR19MB5703.namprd19.prod.outlook.com (2603:10b6:510:1e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 14:27:17 +0000
Received: from DM5PR1901MB2037.namprd19.prod.outlook.com
 ([fe80::b051:b4e4:8a2:33a2]) by DM5PR1901MB2037.namprd19.prod.outlook.com
 ([fe80::b051:b4e4:8a2:33a2%5]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 14:27:17 +0000
From: Bernd Schubert <bschubert@ddn.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v9 3/7] [RFC] Allow atomic_open() on positive dentry
Thread-Topic: [PATCH v9 3/7] [RFC] Allow atomic_open() on positive dentry
Thread-Index: AQHZ6+jFlnKxXGBff0qquJGDNf/q6rBETRwAgAnnIAA=
Date: Tue, 17 Oct 2023 14:27:17 +0000
Message-ID: <321d743f-d33a-46af-8790-15befebae2d4@ddn.com>
References: <1931d96b-c5ad-4d6f-8c01-3b1acb309bff@kadam.mountain>
In-Reply-To: <1931d96b-c5ad-4d6f-8c01-3b1acb309bff@kadam.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ddn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR1901MB2037:EE_|PH7PR19MB5703:EE_
x-ms-office365-filtering-correlation-id: a280d34f-8a05-4a42-8e88-08dbcf1d2a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GFb8oOGDyDHlqz0WNQcWed4JUKv2QdIcF3MtlCWoBmT0g+CRa6a1SS34sKoCmSWK+VcfJ7VKWjeZEZFHmACRzqRhfMIm2g/p8/bL8/lAk70n6ttVMfold6fdw94ACSdstrT8l86GpklkDSkl4+FUw2Dq0Qxr5NhJikCzfIL0YPcA2X10qcSMLdPCmglNHiu9mzQoSJ3YrHHS4kfqTHYNLFB6z0IsIe6Zp9+C06QXyUl7jAYY3LYEiTdLPPl22F/PqKmaJLN+CUfi1JPJ5alzRTO+cIJou3Ze/J2Q8Bki00AEl5lelu/ZKw9QPZ12x/ZrTRAiS4+btHX3uQ4GjqGY7+GrP/f5zO3e8REa3PidQYOtVY46fjL809F9byW6woE0AXHVjytuXRLS2+223iBCsTrkodUT6nIGicalKDHK8teq0PacL9UUU9CJzH8L6RwYO80NOwz70ar+pprdRoJWR3A7GfgWCFJDteqGlq4p1dICGAZRoKYSs4dCdepCf+qch5V4snFtOwIw2wcNVieU00eYkH4SiulGnu+zCLxVz6ZnzqFRzCSMs09z9fC8IYVusHyRfVKiKxT7ZCSjXCo2pBJQP49eAaSpH7P3jmg/oc3klmAci/uLeR8Sr5IMrbswgAupEDYwG7diBWQrRntjYeMV7TAy1yx3vu+pdC3ebJIEP2Ykv5PWId4ETH4lIukBw/DAhRFlqtfIEmB1vtVPFA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR1901MB2037.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39850400004)(376002)(136003)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(86362001)(38070700005)(31696002)(31686004)(36756003)(76116006)(6486002)(478600001)(966005)(316002)(5660300002)(54906003)(64756008)(66476007)(66946007)(66556008)(66446008)(38100700002)(122000001)(110136005)(6512007)(6506007)(53546011)(71200400001)(91956017)(2616005)(4326008)(8936002)(8676002)(83380400001)(41300700001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UElqS1h1dG1nK2lNR2RuWVJXOVVoZXhDUVJrL0NMVnRjWk5CYmVHTWlKdjBq?=
 =?utf-8?B?SUhzK3EvK3VucE1uL2xHWmZnOWh0ZkV6OVRuQUxJK2RpVXNIWGlUYUdoQW41?=
 =?utf-8?B?SWZoQjg1Zk1rQ3RjcnlYMGoxa3B5RjRpNEwwa3VSN2NRNXd2WlRKT2xDNWM2?=
 =?utf-8?B?bG50MWZFaWxzdXZrVmQ2bWlRNmo4ajZjakt5V1ZMTjJxMit0SEI4cCtGUFZ5?=
 =?utf-8?B?TE1FZjRiMWlpN3RiUXUxMnpncERZNmFMb1ZHSjNwYVpCNkZOOUphWk9IOHhk?=
 =?utf-8?B?YUpxeHZQOU5XVTFOR1JnaVIwUVBhR3Y2bXQxVW8rVGE0NnV3T0JucGJlR1Uv?=
 =?utf-8?B?ZUt6TndraHBnais3aWxZc0Zpc2FpLzVPWjRMSzdqZXJwSkRsYUI5VUV5ejBI?=
 =?utf-8?B?am1WUmIxc2VvLy9XR21DRnpibWZLd3UzYnJtclRKV2lkeGRnVTBESDQvRVkr?=
 =?utf-8?B?dFVVemhWd0ozaWpMbDJ1OXdXUzdDUkFVM1p2TmgyUTU3aUVxM25qNmZlWmpX?=
 =?utf-8?B?b1A4cWVqL1QvRFl3NklUQnNIT1c0WkdTaS80c0dibDlmRmU5S2Voc2dIYXVr?=
 =?utf-8?B?QUpvSzRlTUpPY2ZFUWcrejA0YllpTWc1YjQ2dm5Ib0JuYlFCQUpsazBpbmZ1?=
 =?utf-8?B?YWE2Tnh5VU01U2lrNVNpdDdhQkk0eWkxUHY2aFJhSDdCWTNSSDFYZVlEc3c0?=
 =?utf-8?B?U1ZJSlQwMXI2VmsxWW56SVl0QWZXaU8xSDBrN25aRktyN0wrSDB1WG1JTzNn?=
 =?utf-8?B?OWEwb0tqKzVhaTl2SUJ2S3lFS2NpcjFIaEhPNVhEZFZrOTlTUFgzcVhLMVZH?=
 =?utf-8?B?UmxlSmVpSUQ5RXVWNDdvNm1OWkY5QktiZDkxdlJaT0Y2RWMzcWppWU9FQkxh?=
 =?utf-8?B?bDB6MDFRaWxJUW4xQmZITk1oT1RneFRXTnd6SHNSTExmNHBJTmM5V1VHUVZD?=
 =?utf-8?B?U0o1K2tzSEN4Wks4MjJwamY3RFNlTnVrRWJxbzgwMlVnL0dTMmJzbWh3SW9S?=
 =?utf-8?B?Q0gzVzdTd3R2a09rY0JkUkc4SUJOSVcySWxldE83ZmxadlpOZFVKdkl0dkhq?=
 =?utf-8?B?d1BOaEhkcHFPMTZxa3doVEVjK29jOHBiR0Q5TVgvN1ZiVXFBa0tCQTBIUUg3?=
 =?utf-8?B?b2FPME9taFBCY2lnSzlxclM1R0cveDJYN2xPMXZiSU02dHV1dWpjTmhtakxC?=
 =?utf-8?B?cWZ6Z0dwRVJsRzlyNGpNclRyZ1BYdVUzNjRrcHlWMC9FR01EVlFOb01vTFBl?=
 =?utf-8?B?STIxVWhoQmg4a2IrYjVqc2FYYkkxSnV5V2kzTFBlcjAxMWRGNFExdm1FVkFw?=
 =?utf-8?B?ZmNPamloeXlodzVYOVNjb0xpeXN4ZEp6REE3OXcrbHV5OFdaR2VJT0haSVQz?=
 =?utf-8?B?SGxCWjdMUWhzNm0rV0VwZiswSVJ3R2lBajA2TlFxbjlCWmpCZWZYVklCSlo4?=
 =?utf-8?B?TzhjUkxVeFllMFNiTnhsWDNWVVpaNE9DV3JrRncwTlhmS1VNaTdDc1BiTU1n?=
 =?utf-8?B?M1puZkZuR2J0SE5WMzFqRWxqZGtHN21DNGUzQUtMbEllTEtwa0N2ck9rdWo4?=
 =?utf-8?B?MEhGak90SFlRdDZ2TFBwWnJjUUs2Zm1BV3dmUUkvSTBkcXJkSzl6dmxlSUcy?=
 =?utf-8?B?T0h2RWFzZ1RORjU3NjJqUFVRdWd5ZGh1Nml1aXRZTG5idEo3dVBzNVZ0YnRV?=
 =?utf-8?B?eWIvdkkreHRmek1JalhJSWNHZTBoekpCS2dSR3pyTVZveUNMUXM0YWpwZTVq?=
 =?utf-8?B?RitlR1VQemlsaldWZGRpZ3NaRjRld3gvM3NEcE9DR0tibFQwYXBvaGZPT2dx?=
 =?utf-8?B?cTFkaERxTCtFZldJdjU4blgrL0w5MUJKU0E4M0hFbjl3N1pwOGJmakF5a25H?=
 =?utf-8?B?MlJ3TWI3YmpqRkk2azIzQnJjaGdEMnBKV1FYZDFkU0tzYWxCUkhnTzRBeUs4?=
 =?utf-8?B?YWxobFdQRHVteGZ1YVRLVFpZNzF3YURlSlFnVUZIRUJiWGZ1QWRuVGlzdC9j?=
 =?utf-8?B?Z0lqWU5hZngzS2ROeis1cDVEeHR0MTk4cVRTWWFMKzJQZFRKZ0wxeXRWcW9P?=
 =?utf-8?B?ZGMxZFNtby9yM21KU0R3djJUbkFhOGRqbXIyRGFoV05paXdMSWpySlE0TzFY?=
 =?utf-8?B?ZWJ2Z1ZFdnNCcFJPUHNsY0lYTHRJRHVQTlU4NlZuc1JGVWs5SVNzN2Y1ajlm?=
 =?utf-8?Q?daa24CM8WcAL8ojb1hwuT6g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <725D0887F4D3F24DA0B85A2573E04D56@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aLtGajsqdY9TAdNFvTQu2GTXpAPYADv1aCwPFDq+mnDKO9Yo+2l5Th8pm0MrzzVmWbTYE7NBk9DyE/hWfBbb9ShK+4zuv+be7bFbPcP/Y09oF9Np93k39iu1W/saYrH+jY2d6RMJJETfQTsp/EFqh0S32V7R+LXyrmRdb1ttWiT7kjYTfE+JKZ7EMaF/tdCIDsZ3LlIMVCcnOTEdaBCS687D/AVTUzhMubSBfx3dm8K3JXSzOXLjxkRThY3MiJAl9RfTlslBwzvUYoXjuN+6tUe1YOpUaeuUfBu7VPz5d0Hx1mY95HHU0QgMELXjLmhakR5bPfg0HKbiIDlZOppLqcPN/IbH2znib1QVzSy1m2mAhhpPZH7TA3A/+jXO+Y7oqGLA+You22Fc50d977+eQosebBkie0/WXWxCxly7hIMc0biz18KPynxnlocZWpQDkihw9TxY76rvzGceRWshkRcrI5NaCiuEgVjSy6Q3T53F9cXuLFs90xuRWfrgN+0txldxaZA95RhCFlqhlFw3KyZL/QXKQXIaQw22MmKDk7WXfG5Eopho3q3+K4MuSQ3BX8z1BaaE+kVolC1auh5x8M/Yme7ed2xlszToUpEEi0fzTTWNAsJMVPTst5Du27IXwr5GUrVAlhLqwE0AJ0Gq8+alLk+tq6dyH74WTiA/38GVdRUXTz5AalFyz3tig1IFL9mpe3JuyQZBOP43URUR1s20kLGnINMSV98Huo0QyTOsMy0mljY0O1py3tGHoqulxjgH1L14YGBHAEhvpMchi/k4//gJ0x2O4GG5JM6OgywmyZLq1kIT7psBoIG4LpNd8akNBJhRh2nVLlBaRDEwy4weuSJIpG59TY+gTViiomQ=
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1901MB2037.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a280d34f-8a05-4a42-8e88-08dbcf1d2a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 14:27:17.0820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g3LYuChXwTVwb/LSQMw+hwj6Fh812ozKh4BJg89VyRgxEwZgQPOTtYnTQNOg9EA+OwWnPuCflMFPhwG1PMUH/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5703
X-BESS-ID: 1697565718-104963-22585-8781-1
X-BESS-VER: 2019.1_20231013.1615
X-BESS-Apparent-Source-IP: 104.47.59.169
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKViYmZpZAVgZQ0NLUNNUs1dAk0c
	A8zczS2DLFKDk50dgk0djYIsnAxDxZqTYWALv33CRBAAAA
X-BESS-Outbound-Spam-Score: 1.49
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.251508 [from 
	cloudscan15-53.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	1.08 DATE_IN_PAST_03_06_2   META:  
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.01 DATE_IN_PAST_03_06     HEADER: Date: is 3 to 6 hours before Received: date 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=1.49 using account:ESS124931 scores of KILL_LEVEL=7.0 tests=DATE_IN_PAST_03_06_2, BSF_SC0_SA085b, BSF_BESS_OUTBOUND, DATE_IN_PAST_03_06, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status:1

T24gMTAvMTEvMjMgMDk6MTMsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IEhpIEJlcm5kLA0KPiAN
Cj4gW1RoaXMgaXMgYSBwcml2YXRlIHRlc3QgcmVwb3J0IGZvciB5b3VyIFJGQyBwYXRjaC5dDQo+
IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoN
Cj4gDQo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNlX3Ry
ZWVfaW5mb3JtYXRpb25dDQo+IA0KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1s
YWItbGtwL2xpbnV4L2NvbW1pdHMvQmVybmQtU2NodWJlcnQvZnVzZS1yZW5hbWUtZnVzZV9jcmVh
dGVfb3Blbi8yMDIzMDkyMS0wMTM4MDUNCj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92ZnMvaWRtYXBwaW5nLmdpdCBmb3ItbmV4dA0KPiBw
YXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwOTIwMTczNDQ1LjM5
NDM1ODEtNC1ic2NodWJlcnQlNDBkZG4uY29tDQo+IHBhdGNoIHN1YmplY3Q6IFtQQVRDSCB2OSAz
LzddIFtSRkNdIEFsbG93IGF0b21pY19vcGVuKCkgb24gcG9zaXRpdmUgZGVudHJ5DQo+IGNvbmZp
ZzogaTM4Ni1yYW5kY29uZmlnLTE0MS0yMDIzMDkyNyAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcv
MGRheS1jaS9hcmNoaXZlLzIwMjMxMDExLzIwMjMxMDExMTE1OC5jNkphOHoyeC1sa3BAaW50ZWwu
Y29tL2NvbmZpZykNCj4gY29tcGlsZXI6IGdjYy03IChVYnVudHUgNy41LjAtNnVidW50dTIpIDcu
NS4wDQo+IHJlcHJvZHVjZTogKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2
ZS8yMDIzMTAxMS8yMDIzMTAxMTExNTguYzZKYTh6MngtbGtwQGludGVsLmNvbS9yZXByb2R1Y2Up
DQo+IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAo
aS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCks
IGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAbGluYXJvLm9yZz4NCj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMzEwMTExMTU4LmM2SmE4ejJ4LWxrcEBpbnRlbC5jb20vDQo+IA0KPiBOZXcgc21h
dGNoIHdhcm5pbmdzOg0KPiBmcy9uYW1laS5jOjM0NDIgbG9va3VwX29wZW4oKSBlcnJvcjogdW5p
bml0aWFsaXplZCBzeW1ib2wgJ2Vycm9yJy4NCj4gDQo+IHZpbSArL2Vycm9yICszNDQyIGZzL25h
bWVpLmMNCj4gDQo+IGRhNWViZjVhYTY3NmM0IEFsIFZpcm8gICAgICAgICAgIDIwMjAtMDEtMDkg
IDM0MDYgIHN0YXRpYyBzdHJ1Y3QgZGVudHJ5ICpsb29rdXBfb3BlbihzdHJ1Y3QgbmFtZWlkYXRh
ICpuZCwgc3RydWN0IGZpbGUgKmZpbGUsDQo+IGQ1OGZmZDM1YzFlNTk1IE1pa2xvcyBTemVyZWRp
ICAgIDIwMTItMDYtMDUgIDM0MDcgIAkJCQkgIGNvbnN0IHN0cnVjdCBvcGVuX2ZsYWdzICpvcCwN
Cj4gM2VjMmVlZjExNmU5MDAgQWwgVmlybyAgICAgICAgICAgMjAxOC0wNi0wOCAgMzQwOCAgCQkJ
CSAgYm9vbCBnb3Rfd3JpdGUpDQo+IGQ1OGZmZDM1YzFlNTk1IE1pa2xvcyBTemVyZWRpICAgIDIw
MTItMDYtMDUgIDM0MDkgIHsNCj4gNmM5NjBlNjhhYWVkMzMgQ2hyaXN0aWFuIEJyYXVuZXIgMjAy
My0wMS0xMyAgMzQxMCAgCXN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwOw0KPiBkNThmZmQzNWMxZTU5
NSBNaWtsb3MgU3plcmVkaSAgICAyMDEyLTA2LTA1ICAzNDExICAJc3RydWN0IGRlbnRyeSAqZGly
ID0gbmQtPnBhdGguZGVudHJ5Ow0KPiA1NGVmNDg3MjQxZTg2MyBNaWtsb3MgU3plcmVkaSAgICAy
MDEyLTA2LTA1ICAzNDEyICAJc3RydWN0IGlub2RlICpkaXJfaW5vZGUgPSBkaXItPmRfaW5vZGU7
DQo+IDE2NDNiNDNmYmQwNTI0IEFsIFZpcm8gICAgICAgICAgIDIwMTYtMDQtMjcgIDM0MTMgIAlp
bnQgb3Blbl9mbGFnID0gb3AtPm9wZW5fZmxhZzsNCj4gZDU4ZmZkMzVjMWU1OTUgTWlrbG9zIFN6
ZXJlZGkgICAgMjAxMi0wNi0wNSAgMzQxNCAgCXN0cnVjdCBkZW50cnkgKmRlbnRyeTsNCj4gMTY0
M2I0M2ZiZDA1MjQgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0yNyAgMzQxNSAgCWludCBlcnJv
ciwgY3JlYXRlX2Vycm9yID0gMDsNCj4gMTY0M2I0M2ZiZDA1MjQgQWwgVmlybyAgICAgICAgICAg
MjAxNi0wNC0yNyAgMzQxNiAgCXVtb2RlX3QgbW9kZSA9IG9wLT5tb2RlOw0KPiA2ZmJkMDcxNDZk
OTkyMyBBbCBWaXJvICAgICAgICAgICAyMDE2LTA0LTI4ICAzNDE3ICAJREVDTEFSRV9XQUlUX1FV
RVVFX0hFQURfT05TVEFDSyh3cSk7DQo+IGQ1OGZmZDM1YzFlNTk1IE1pa2xvcyBTemVyZWRpICAg
IDIwMTItMDYtMDUgIDM0MTgNCj4gY2U4NjQ0ZmNhZGM1MmQgQWwgVmlybyAgICAgICAgICAgMjAx
Ni0wNC0yNiAgMzQxOSAgCWlmICh1bmxpa2VseShJU19ERUFERElSKGRpcl9pbm9kZSkpKQ0KPiBk
YTVlYmY1YWE2NzZjNCBBbCBWaXJvICAgICAgICAgICAyMDIwLTAxLTA5ICAzNDIwICAJCXJldHVy
biBFUlJfUFRSKC1FTk9FTlQpOw0KPiBkNThmZmQzNWMxZTU5NSBNaWtsb3MgU3plcmVkaSAgICAy
MDEyLTA2LTA1ICAzNDIxDQo+IDczYTA5ZGQ5NDM3N2U0IEFsIFZpcm8gICAgICAgICAgIDIwMTgt
MDYtMDggIDM0MjIgIAlmaWxlLT5mX21vZGUgJj0gfkZNT0RFX0NSRUFURUQ7DQo+IDZmYmQwNzE0
NmQ5OTIzIEFsIFZpcm8gICAgICAgICAgIDIwMTYtMDQtMjggIDM0MjMgIAlkZW50cnkgPSBkX2xv
b2t1cChkaXIsICZuZC0+bGFzdCk7DQo+IDZmYmQwNzE0NmQ5OTIzIEFsIFZpcm8gICAgICAgICAg
IDIwMTYtMDQtMjggIDM0MjQgIAlmb3IgKDs7KSB7DQo+IDZmYmQwNzE0NmQ5OTIzIEFsIFZpcm8g
ICAgICAgICAgIDIwMTYtMDQtMjggIDM0MjUgIAkJaWYgKCFkZW50cnkpIHsNCj4gNmZiZDA3MTQ2
ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0yOCAgMzQyNiAgCQkJZGVudHJ5ID0gZF9h
bGxvY19wYXJhbGxlbChkaXIsICZuZC0+bGFzdCwgJndxKTsNCj4gNTRlZjQ4NzI0MWU4NjMgTWlr
bG9zIFN6ZXJlZGkgICAgMjAxMi0wNi0wNSAgMzQyNyAgCQkJaWYgKElTX0VSUihkZW50cnkpKQ0K
PiBkYTVlYmY1YWE2NzZjNCBBbCBWaXJvICAgICAgICAgICAyMDIwLTAxLTA5ICAzNDI4ICAJCQkJ
cmV0dXJuIGRlbnRyeTsNCj4gNmZiZDA3MTQ2ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0w
NC0yOCAgMzQyOSAgCQl9DQo+IDZmYmQwNzE0NmQ5OTIzIEFsIFZpcm8gICAgICAgICAgIDIwMTYt
MDQtMjggIDM0MzAgIAkJaWYgKGRfaW5fbG9va3VwKGRlbnRyeSkpDQo+IDZmYmQwNzE0NmQ5OTIz
IEFsIFZpcm8gICAgICAgICAgIDIwMTYtMDQtMjggIDM0MzEgIAkJCWJyZWFrOw0KPiANCj4gZXJy
b3IgaXMgbm90IGluaXRpYWxpemVkIGlmIHdlIGhpdCB0aGlzIGJyZWFrIG9uIHRoZSBmaXJzdCBp
dGVyYXRpb24NCj4gdGhyb3VnaCB0aGUgbG9vcA0KPiANCj4gNTRlZjQ4NzI0MWU4NjMgTWlrbG9z
IFN6ZXJlZGkgICAgMjAxMi0wNi0wNSAgMzQzMg0KPiA2ZmJkMDcxNDZkOTkyMyBBbCBWaXJvICAg
ICAgICAgICAyMDE2LTA0LTI4ICAzNDMzICAJCWVycm9yID0gZF9yZXZhbGlkYXRlKGRlbnRyeSwg
bmQtPmZsYWdzKTsNCj4gNmZiZDA3MTQ2ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0y
OCAgMzQzNCAgCQlpZiAobGlrZWx5KGVycm9yID4gMCkpDQo+IDZmYmQwNzE0NmQ5OTIzIEFsIFZp
cm8gICAgICAgICAgIDIwMTYtMDQtMjggIDM0MzUgIAkJCWJyZWFrOw0KPiA2ZmJkMDcxNDZkOTky
MyBBbCBWaXJvICAgICAgICAgICAyMDE2LTA0LTI4ICAzNDM2ICAJCWlmIChlcnJvcikNCj4gNmZi
ZDA3MTQ2ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0yOCAgMzQzNyAgCQkJZ290byBv
dXRfZHB1dDsNCj4gNmZiZDA3MTQ2ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0yOCAg
MzQzOCAgCQlkX2ludmFsaWRhdGUoZGVudHJ5KTsNCj4gNmZiZDA3MTQ2ZDk5MjMgQWwgVmlybyAg
ICAgICAgICAgMjAxNi0wNC0yOCAgMzQzOSAgCQlkcHV0KGRlbnRyeSk7DQo+IDZmYmQwNzE0NmQ5
OTIzIEFsIFZpcm8gICAgICAgICAgIDIwMTYtMDQtMjggIDM0NDAgIAkJZGVudHJ5ID0gTlVMTDsN
Cj4gNmZiZDA3MTQ2ZDk5MjMgQWwgVmlybyAgICAgICAgICAgMjAxNi0wNC0yOCAgMzQ0MSAgCX0N
Cj4gMDAzMmY1M2Y4ZmNlNGYgTWlrbG9zIFN6ZXJlZGkgICAgMjAyMy0wOS0yMCBAMzQ0MiAgCWlm
IChkZW50cnktPmRfaW5vZGUgJiYgZXJyb3IgIT0gRF9SRVZBTElEQVRFX0FUT01JQykgew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eDQo+IFdhcm5pbmcgdHJpZ2dlcmVkIGhlcmUNCj4g
DQoNClRoYW5rcywgZml4ZWQgaW4gdGhlIHYxMCBicmFuY2guDQoNCg==
