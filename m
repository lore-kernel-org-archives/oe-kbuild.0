Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0822D2D9ED7;
	Thu, 27 Nov 2025 10:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764238482; cv=fail; b=lqIFz2W+Ar7n7x07Hu//iWLDz7jzjB9BWBC/pgxjbNuiDFypawmqQ069FlEGhlES/Hdy/ww6vwWcba/JawUsPVJf6IiWap+9/T7V896SKrA0IRJm5SLE8L0tyAz+TcvR2S6s7h2rIZIGO901ZywEW1Gmff1RZ6DGuH3b9yZkeLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764238482; c=relaxed/simple;
	bh=o1cbxV2uLmVk3vvoFPL4NFQeFIvThfg50nt1uwRDnHo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gJppH7/4ybomgHS0v4Mj00S6FM052T4qYkGGp/reYrol4MzN6/oRig15cw94isb7QTOsQ/ysnF5WsGJTOt7qUroO2l6PSG5s0kuLzq5Q0EkSXg/i7g6uDp72OJSLLdNr3OQFlI3Sc2bL4ZfpVtXGuM4tNKw3pTVYqoAshw6f/bU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ZhG+Z0d/; arc=fail smtp.client-ip=40.93.196.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ZhG+Z0d/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVn+3UPdIJMWZg7E4MnQJrVcfZXFmpNK95vHX3jGS0qOUY1mWfUd4g8Ti6eRsw2c3cpDgi5liQFo6vFMSMmOlhMJLsmPRLVvCShrSjk2CHm2b1ixJshx7iHc6uh0VSdY6cUQ+jYedr6yaBsNclYOP+Ajn5kt4cMAalaArEJdCBLg0n2IrZi3H1Dj4nSw4i4r5r7HEQ5SYB6FU0m2Cdeojhfxj3gjuce6jBqWqewJg1dEZM0S7TRpMYbEUcgzUYRDrtMQWhmFSfxcFLRPQoQBP3YmujU/e4Quf5coiLLFYAk55TtC1FrdAUAJJP6IgTrb8izq+db9tElfyGio6GRwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1cbxV2uLmVk3vvoFPL4NFQeFIvThfg50nt1uwRDnHo=;
 b=Ha/ztX3/qtnICrAnft/0rg3XXhCSAJpUruwRbjO/WIOY2e/sgjXVpiYnRn+LfLqJDmH991IfIc49gY5jHeGIvoxB7fsv+d8InFVDUfzD+W24gAkfhy8mKszoFxAr/Z/IurWwxzW2FdxfyJj0mvXZUv6bBLGycRKCU9ndn1SZMSQ0Lxdr49aNdVJ5ZxNWN0TFWAvJ1bgV0f0s+7aXuzhvhxR7qF54l7qOLZDC9Gek0Ms5A8XtMLZczAZ+b/YgHYUWdhvkhpwDs1IuO90Gv00z1YvuJ47+zP4vOKH500peNyESdiQXbxNqjAWWA/P4tvBsYc7tX1G1f3w2nekNiQk66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1cbxV2uLmVk3vvoFPL4NFQeFIvThfg50nt1uwRDnHo=;
 b=ZhG+Z0d/cn9Xr1LmruDMw2QV2YqeGDlV7KZ2xcQ/6oHrvidCQG0f7DTKmqMiaW2CwF+Z7/b8ZR1GQvz8jXi9ujq4N0LZI286FamwJsrRrO3LmghR6T+1wrSwV6uPpZe30RUjslxSZX4iPfMKl01FB1cpEc/2wvqvu17d8+RqfLcJGQlrrBRFgFC/fyD9gRpjUOgd4jHORWtWGPvHZUHma1mP3bL8YIi7J4gsRk+nq5navQLFKFJ8moDnlveCEnwGybyWYndVPToX804c21WETAVAywLJPSvT2PJ1CRrNCdwGBmdttk5A1qzTkd60ADLfuwsiolz4puvMjpN5Cp78XA==
Received: from DM6PR11MB4282.namprd11.prod.outlook.com (2603:10b6:5:1db::24)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 10:14:27 +0000
Received: from DM6PR11MB4282.namprd11.prod.outlook.com
 ([fe80::da3e:dd0:e4ef:f2be]) by DM6PR11MB4282.namprd11.prod.outlook.com
 ([fe80::da3e:dd0:e4ef:f2be%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 10:14:25 +0000
From: <Conor.Dooley@microchip.com>
To: <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>,
	<conor+lkp@kernel.org>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-generic.c:183
 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol
 'map'.
Thread-Topic: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-generic.c:183
 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol
 'map'.
Thread-Index: AQHcX3y0NtuAzuA64USsNd0Rd8xVgrUGTjsA
Date: Thu, 27 Nov 2025 10:14:25 +0000
Message-ID: <91267c0e-e14b-4be7-8e91-1fa1c0a388bc@microchip.com>
References: <202511271435.oSbNsRD6-lkp@intel.com>
In-Reply-To: <202511271435.oSbNsRD6-lkp@intel.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4282:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: 3d5ae13d-6d73-4d89-0024-08de2d9dbe10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXd6dFNzMHErdDdmRWc4eWN0L09ZMXRteXNPcXkvUURmV0xMdWgxS0RtVkRv?=
 =?utf-8?B?RlExU3pSQnIrejJjODAxQnZtTDI4ZjZkeW1GMmRUTXIwNzhUb1JURUpTd3J6?=
 =?utf-8?B?bjUyYnBLbmRzOHhXY3FNa0FUV291Qk1xdEdmVFhRTUErT0NRbnV2YVJrLzJw?=
 =?utf-8?B?YWx6MXVVWlhuSmtYTUNhZUFwTGU3dkhmcElEY3orYTJ0TTNnVHd3L3NzbEtK?=
 =?utf-8?B?MGlOTWwxRVBuMkZHdHVVc01HblEwcEQ2VEJxWG5nTkkvK0JYaFpPb245eGc3?=
 =?utf-8?B?Nk9OZllLcHc5ZVppa3ZIcldDWU4yTWxWdURwMlFmdzdTT243VmYzd3I0R240?=
 =?utf-8?B?UkdVQUZNR3V5bzlBS3dZb0Z3QnFOYysrWlFhNzJhSmxZL292d0Z6T2hNSW1T?=
 =?utf-8?B?cklXY1ljRzNxUDRPZDJmNWVHeDVjZWE2SWdSMWd3SU9DQW9hd2RTL0ZiK2tJ?=
 =?utf-8?B?ZzRubHZtTHV0ZEdRSUt4L1ZEUURMVUtJajZDZkI0YVp4VWNxOFliM1BNbFZj?=
 =?utf-8?B?ZVJCb3JFNFVZWFFGVVVLNTNYLzB6SWw3OGlzSWcvc2F3U3UzYWgxRFhSeEpa?=
 =?utf-8?B?UnBYdjUvajdEYlNLSzBiMDV2TXFTMXBoRjNRdjhTWmQ3YUsxNlNIQ1VoSjdn?=
 =?utf-8?B?RTRQL1pMOTJWY2dlUUxXYjgwaU9UbWxOSDlEWDRuU0ZGdmF6K1V1UW44RjZU?=
 =?utf-8?B?K3lWSmdLNk9yaTF3cjQ0eGhtcEU4WU1LaXVtRlkyck5mYXNyczNYdGlJUWVO?=
 =?utf-8?B?ZUFwOElIcTYzcE5kREt0Q1AxaUptSExZUjYvUEZFWEhDaWJoL0l4akNPQTZN?=
 =?utf-8?B?SEV2bGUvZitlVU1qdE4rR280aEhyVUxiUWpUbjUrdlA4L20vUGlCbDFjUTYz?=
 =?utf-8?B?c3hIdktFRXlhT3BLMVB1NmFoRFZNNFB5SUlxdE1aeWdXQ1JJNUFSUmlrUGdQ?=
 =?utf-8?B?TmZWMmk0RlVtQ25DOWwrUHI5VFhJR01qN0RWTXc0Q2ZGS3JnbVFYdnFNY0xt?=
 =?utf-8?B?WXZ4bk5JOGp4NDFIbjJIK1hpZWZDbS84V1h5Tzc4d01Lb3RRUEJsdnhFTGtJ?=
 =?utf-8?B?TmFFOVFRbWNQUEpURmNsRDMvWWhIa29QUU85bEovTFN0K29KZUN4cCtQdU43?=
 =?utf-8?B?ck1GNGZpLzc1aHgrT2ZHRmtZQmtnZSs2TDlldGhMOFF0ZnFxZFhBbFk3OXRv?=
 =?utf-8?B?Sk5OVkQ5SENuZGJ5NUJyMXVudGN4OHJkNGJtZUFQRkpXSExablRoWjlJNXFQ?=
 =?utf-8?B?VkUzbEVNUDM1VVg5c0hoTmlJQnU0ZkZaUTR4MUM0SnFwZHEvdFBwSW5tRFIz?=
 =?utf-8?B?MXVrcTZRK0xJdnpUWTRQNEZIOFNobnJsdTZDNlN4MXZpUzVyS3BYSHRSM1Fu?=
 =?utf-8?B?SUltS3RvMmV2N1F1ZDRpaUpKVWlSU282cUszVjhncEhQTFlGNUsyVmFGWnll?=
 =?utf-8?B?N3MwOTF4M09uK25jYnpTWUxEMTd0U3NrRm5peExnWjluSGVoODNmTDNoOFZk?=
 =?utf-8?B?UTVTQ0N5Q0YyOEdZcW91dUV0WFRxWG1XSEZhUTAyTG9sY2xoQUVnQktxSWtN?=
 =?utf-8?B?L2JDVE1lanZNREk1RWJKSnVHNE1IVWpCcFBPUlJ0MjZXZ0MrUVI2WGRHOVFF?=
 =?utf-8?B?bmNaVlFWVWxzR3dxekQzK1dvRjlUM1F2dWlWZ2doV0E4cXhSZUdhZWVUNzdq?=
 =?utf-8?B?Vks1T3dtVEc5c1I1M1lCQ3pSZVRZS0ZwTnVjVTVwZDA2aVltM1ErcS92djBQ?=
 =?utf-8?B?a01UZTA1bE1xTDhjYVpQZlNzSnl1bEZUbTA0ZWdCM1pEa3lXVzMvK2FYOTFy?=
 =?utf-8?B?NnJnYzErUWlVMlNiSjdPT2pEWnFSSVl5S2JjOFM0UjN6bW1tc3gwZHlpZzN2?=
 =?utf-8?B?SUlkQlZPdUcrcCtZZE05NVcyaVNIUTZNdnVpSmwwNjhqUVNhOEdEZ3E4cHJx?=
 =?utf-8?B?QlJkbzVZUlVPSk9SRFV4bUZmbW03UkY2dWdoU0NOS1p6emxwaUUyaXZCenla?=
 =?utf-8?B?WnhzcUgwQUpwM2FhV1cvZnZoRzR5ZlpYbWhqaThBTnVmOTc5WXdlbkdvcDRT?=
 =?utf-8?B?SXB6ZVJXME9kc2UvVGV4K0RWRk1HSWR5WmVCZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlZOeW9HNmJvNHVsM2lKYzFlUTFGb1dwTXRqZ3M2MFpQSGltdkhCYkFwTUJR?=
 =?utf-8?B?aUl4UWhtdmJHRmhray9DSG5QS0l5TFh4WHZ4U0o5S29HcmplS05GS1JaWDBJ?=
 =?utf-8?B?SVpKMm5EdnpOdGZ5K0RqMm51c3hNZDlMaWhjWGZkWTVOYTExeGxVTUFWeWxL?=
 =?utf-8?B?bWd0Uk5EZEVkQzdOT0N2UkMwaGFXcWJVcUFBU2hYZlZMK1pMc1VPV1FzeW0y?=
 =?utf-8?B?K0Yva2R4SVozcmVRUGxFZmx1R0dTYzVBdDZCRFp6MUhBYmZGcWZkc2s3dCtU?=
 =?utf-8?B?M2RyVmh3cU9xckdoNGN0ZWMrdUhxYXU0aGhqeVRZYXFQaFR5cHYxL1VheHJT?=
 =?utf-8?B?N3h1ZTMwTkVhZy9RZlBUcXhab1BUYmJvNktPa1M5WmVTcXhYenk3SU1oaWlj?=
 =?utf-8?B?dThlWmY2SExaamFKZE1GbkxhQzRnNFFHVzBwV2ZweUhxL0xYdHpDcXhCUTZE?=
 =?utf-8?B?bXAzZE5HaVlUVi9OcGc4bytyQTlTcnUwZ0lmMUFhcTRVUU9Ud2pDL044TFBl?=
 =?utf-8?B?Q3ZMUmM4c2t5QTVWcDd6QVhnaG5CYTBqQVh4cC8rdW8rc2dxcUFFNitoSzgv?=
 =?utf-8?B?NlMzTUZST3c4ajRQNDBQOThEMUV4MlFxVmxrNkZWOU5ubEhLQVBiZWNzbEwv?=
 =?utf-8?B?V0VoQ1BHRWg5VUtGd2QxWVBDeEdmT2pQcUhlVlhwbVR3ODdoRnk4cHVFRkpB?=
 =?utf-8?B?STI0NXNkMTZZSGxpdVlZdGxram5WQmxYdWREbURSd3hnZ09mVnhoaEtKSHBt?=
 =?utf-8?B?aDFUNkxHemFTNXVEUzNpa2VDRUhLVjBBQ25DbnlZbDYyU0VNNVRSelNubFVY?=
 =?utf-8?B?T0p1WjhTS1ZudHB2MjR2MXM0RmxMUTRwcStuYTlDSjhSNkdZNlVBbWRtdUdN?=
 =?utf-8?B?S2hOQjlOd0lZRmszQklVaXNuYWtMODFkbmZrTFpSRjBBYUVBTGlHU1hIQkVl?=
 =?utf-8?B?QVhsOExzTnZLVzVWa29rWURHdVRVRnpiejhZL1RTcHJXZU5jWEU2V3hybmFT?=
 =?utf-8?B?K3NzK1hlRHo2TjcwY2FFZkJVRkhDNVBvUTB3UFN2cXZaZ0QrOVZxQUo0VFd4?=
 =?utf-8?B?bmZ5dnhXR2trVHNCSURZLzMzaW9pdkFKaGdIdndTb21lb3NyM1dmNVNBcHdC?=
 =?utf-8?B?a0V3cFE1ZXNGQ0hsNHZiV2J2aExoZi96c2hWdGtpVmNNak1hUEltdmQ1S0hI?=
 =?utf-8?B?dFhWNUlMV05KdmU0dU5rVHlXQnRMTkhQUUJOdzN3OElDZmlBaEowSzNDOFVt?=
 =?utf-8?B?YnlUS0dnclR2N3oyK3NnNGlDQjZTd3ZZdHJRYTRSZFY0TFRQb3ovV2NhTSs4?=
 =?utf-8?B?MjZhekowQ0MzVVJMaEdUL3hwRDJ4d1V4Zkcxbm0vWVQ0KzFUakVOMUlPWWdO?=
 =?utf-8?B?MEJjR24wWUhMZmlOcW12UnFQbFpUeld0b0FkODA1ejBacWxRWUxLcTUzS056?=
 =?utf-8?B?bjVDMlZ3dmN3MktjOWxMWWR0NEkyMnI0NXRnaEVFOXlWMFdaWGU5cWJLYzJO?=
 =?utf-8?B?M2JlR0Y0S2dSVVB1TkFnTkhyVVlnTjk5RnJtcU56SlFqU3A2MEVYTVBXWE9j?=
 =?utf-8?B?M1RBNzA3Q3dTdWh3QkpJdDBDV0k2T1RJZkJHbkJZcWhycTBvOTVyUjJFendh?=
 =?utf-8?B?ZEZnTjZqM1VjSmdCTk5zU2lZWmVOcWt0T1BhTEhGdWw3ZkpFaDNJSjd4NUc0?=
 =?utf-8?B?eGloV3BsbDhFSzdtbWRMcWVlZ0krKytTb3Q0WFo5VU1HODlpbHJzMm9VR21p?=
 =?utf-8?B?NnFEWU9mQUplNFE1cThuZU5Xc0RxaTB0SVJLK2JrOXg1VmIyNmsvTVNFa2l4?=
 =?utf-8?B?U0x2eVdHWUVWNHZicERTTmEzWFFJbXAwY2VHU3F4OVZYYUNvd2NzNitvWi9T?=
 =?utf-8?B?dDRjL0x5eGowNkd4RHBuOWNoMGhaSkdhYWdJc0RPS25IeVIyRHJzV3ZiWFZ0?=
 =?utf-8?B?bXRTSGtZMGtSSWN1U1kzQURyOHliWnc2Rm9VVGVMSTlXVGJnRUFJaTFZL0x6?=
 =?utf-8?B?dDFNOW9lb2RnSm1nMllnYnhZWmFjQlU5YWNaQmxzU0VRMmF3WlNjbm9NY3FV?=
 =?utf-8?B?a09Xc08vWW13OUI3bjZNVWhmT05mZjgvUTNIK0Jha2ZWWTdqdVgyU1U5dU52?=
 =?utf-8?B?YzZDUmFvNVRVc2NpOHRpZEVGd1llMkxuTmtNcHBSRHhJTHllWW1Jc0pLS1RG?=
 =?utf-8?Q?2W3Ta+v5kwdsL7qBwjO2dPFTBRoZbeR3PVMVfhYVz8kp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB1D6330ED1C4148B419EA9540780184@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5ae13d-6d73-4d89-0024-08de2d9dbe10
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2025 10:14:25.4421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ovx5fMIcOCq3m+FfgOQnkIWL30ryyw3bFEM5ouvUjB7rBLvIdrxis9N/pWO5MeTQIONBw3ED/2CxNcCoFVmqHFSb2PHltkSnai4W2NR+02o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829

T24gMjcvMTEvMjAyNSAwOTowMywgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiB0cmVlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdCBwaW5jdHJsDQo+IGhl
YWQ6ICAgYTg4OTUwYmJiYzgwZmU1M2UyYzc3MzM1MzY3NDYwNGQzMTMwYzQ0Mw0KPiBjb21taXQ6
IGM1ZDE4ZTU2NmE0OWY0ZjlhNTA1NzUyNTliYmRkYTIxMThiMDAwZTQgWzIxLzIzXSBwaW5jdHJs
OiBhZGQgcG9sYXJmaXJlIHNvYyBtc3NpbyBwaW5jdHJsIGRyaXZlcg0KPiBjb25maWc6IHBvd2Vy
cGM2NC1yYW5kY29uZmlnLXIwNzItMjAyNTExMjcgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBk
YXktY2kvYXJjaGl2ZS8yMDI1MTEyNy8yMDI1MTEyNzE0MzUub1NiTnNSRDYtbGtwQGludGVsLmNv
bS9jb25maWcpDQo+IGNvbXBpbGVyOiBwb3dlcnBjNjQtbGludXgtZ2NjIChHQ0MpIDguNS4wDQo+
IA0KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5l
LiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9mDQo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtp
bmRseSBhZGQgZm9sbG93aW5nIHRhZ3MNCj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+DQo+IHwgUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5j
YXJwZW50ZXJAbGluYXJvLm9yZz4NCj4gfCBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNTExMjcxNDM1Lm9TYk5zUkQ2LWxrcEBpbnRlbC5jb20vDQo+IA0KPiBOZXcgc21hdGNo
IHdhcm5pbmdzOg0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1nZW5lcmljLmM6MTgzIHBpbmN0
cmxfZ2VuZXJpY19waW5zX2Z1bmN0aW9uX2R0X25vZGVfdG9fbWFwKCkgZXJyb3I6IHVuaW5pdGlh
bGl6ZWQgc3ltYm9sICdtYXAnLg0KPiANCj4gdmltICsvbWFwICsxODMgZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtZ2VuZXJpYy5jDQo+IA0KPiBkZjgwNjE2ZTNkYmJlMyBDb25vciBEb29sZXkgMjAy
NS0xMS0yNiAgMTExICBpbnQgcGluY3RybF9nZW5lcmljX3BpbnNfZnVuY3Rpb25fZHRfbm9kZV90
b19tYXAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LA0KPiBkZjgwNjE2ZTNkYmJlMyBDb25v
ciBEb29sZXkgMjAyNS0xMS0yNiAgMTEyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsDQo+IGRmODA2MTZlM2RiYmUzIENv
bm9yIERvb2xleSAyMDI1LTExLTI2ICAxMTMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHBpbmN0cmxfbWFwICoqbWFwcywNCj4gZGY4MDYxNmUzZGJi
ZTMgQ29ub3IgRG9vbGV5IDIwMjUtMTEtMjYgIDExNCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm51bV9tYXBzKQ0KPiBkZjgwNjE2ZTNk
YmJlMyBDb25vciBEb29sZXkgMjAyNS0xMS0yNiAgMTE1ICB7DQo+IGRmODA2MTZlM2RiYmUzIENv
bm9yIERvb2xleSAyMDI1LTExLTI2ICAxMTYgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHBjdGxk
ZXYtPmRldjsNCj4gZGY4MDYxNmUzZGJiZTMgQ29ub3IgRG9vbGV5IDIwMjUtMTEtMjYgIDExNyAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpjaGlsZF9ucDsNCj4gZGY4MDYxNmUzZGJiZTMgQ29ub3Ig
RG9vbGV5IDIwMjUtMTEtMjYgIDExOCAgICAgc3RydWN0IHBpbmN0cmxfbWFwICptYXA7DQo+IA0K
PiBtYXAgbmVlZHMgdG8gYmUgc2V0IHRvIE5VTEwgYXQgdGhlIHN0YXJ0LiAgV2UgcGFzcyBpdCB0
bw0KPiBrcmVhbGxvY19hcnJheSgpLg0KDQpDb29sLCB0aGFua3MgZm9yIHNwb3R0aW5nIHRoaXMu
IEFjdHVhbGx5IG1lYW50IHRvIGdldCByaWQgb2YgIm1hcCINCmVudGlyZWx5IGJ1dCBJIGd1ZXNz
IEkgZm9yZ290Lg0KDQo+IA0K
