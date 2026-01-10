Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC91487F6
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 19:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072168; cv=fail; b=It/tPmVEGqU6i2/3hAR8ro8NXpT4I3M369sYiYKKOyemAtB/u6XB5rcL640Hd5pJArIkdaW4sUxjP9r6afLTYSDlHw3gvjBinaqjaRiz+hvlH+BMN40pg7uh/CbDbwDMar6WWo1i/Oi1osONz11qDNRGqt8TZ3k83Y0KULxHiNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072168; c=relaxed/simple;
	bh=TMQnjdRQ5kaErHb4rtJye71qUux5UrZoUQcH1YNdoOs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oSXUFMD9DWKnzzEXrB0NIJ8W5UPjL24x32ovylUWw2xtt308kDFvM6Tx93f776j4f3x0ANVtAg/GQuYKxfPfJxQ7kFchk+hY+SzVnmky47xJXX2r0t9nWspH5f+mLCYKxC83loondejg76IfogC8S//o+CN0QZR747Cp7NoeuMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YRix53WI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=h+jP+XlO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YRix53WI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="h+jP+XlO"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AI5fwA1687921;
	Sat, 10 Jan 2026 19:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=D8VmH8jj2RSjJtMSkMAEaJYvCZ1AaNqHqGpWqz3n2Fw=; b=
	YRix53WI0XCqNCe/PTw793SL495RDTtmMmow8oQeghJBpVMMluRaw62djsw9W56p
	Je+CymoS82+zEHpsgrwc9/4RZBMm3ZCybCXqQje24Wn/omeajoxN7uWD0hdS7YO5
	H9wIRSHzpevA9w4Ak9XmQmtbxDzlvIGU2cY2znS1o4ceAbA75hPkCktXRM8srJXX
	7lnTGPbKaRbp6d2On3rMaq1OdXLomRunm/Zfw75SWKuDCBA8B+2gSquatvRxBFhd
	97ktHvRvnf1PytWYiYCY4eWh+AbWuvlN0hSGKQM2PxLgJxh4uy7uag8I8T3hW5JO
	S8N5NYfdIhgMu5mwEwwSfQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7ng8t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 19:09:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60ADSOk0008322;
	Sat, 10 Jan 2026 19:09:21 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd75x77d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 19:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YF9RqpPX4J2m/xVK5W1GNCMvuhR/XOoZbqzImUXgwVClCwBHtl3oe/nsvxvEq0qauEOy/8DJ3Df5rnrNC4Ja/eUfJwEpkQJA0eKZTu2hqrq2l7rGZ2zE799m/IzY9KQX9ZewK4QSLUamGoOLPWJ+l2zUK1vI/PBG584Y60CPm0l8/WnroB8YJN3WB0qU78b1CgWODTB/COCfeEY25OWNyNm11jHTpMih93lQGqog4ekbOnL+VWtAn0UZTiwF9riDYtk1k+PIUjliUaQS2CK+rk9Bm6unUWHsrEMU9wx/R7aKp/Nypi3rsjvJx9T+pFCnG/ZgCavwQ7NeJw/Ewz+anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8VmH8jj2RSjJtMSkMAEaJYvCZ1AaNqHqGpWqz3n2Fw=;
 b=wMkSWgm5htQ/jOcr1KmEvI4aa0d7s4Ni5cegChuvC5gciUxdGKsE+TeB3SZzTKxpln/NE3M7+TvzxDsdQA2+fmuf3DUHgT/8Ci1uuHdTxrsCJlToM6zPBNTlVr2dUJYbO3HAakGP7BgxtrZmt5g/o2H/jko1170c6w239JAJ8pVs6Ya9fwszTNOillLE5lVcbSXRZkPwlrfxBYX0GOLOJUlEqOk3CqiE6x/Gap8qWZyD3bdQLu+m6oIcX6OFz0Kj4GIhG6hSRj8eGL5RXsC3TVvpqOtUlqCbYMhLjnwspocsClZm5UGbGWe4MezP7+3vSF0N5M5KT5Y+wSIp9uVBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8VmH8jj2RSjJtMSkMAEaJYvCZ1AaNqHqGpWqz3n2Fw=;
 b=h+jP+XlOtUUGc5fPNS+LkOPT0pon4CYy/MeOmcocUX4CdMWT+Ko2WzXt5Iaa0HRvccb+6lQamj4lSCXnkDZdNbfU0X2ETE0xSqAj7p+MqxrlZiIxxswQehzems0cmAFeesWkU56rzYAhAqXLzLlnt7bM8yvXg1l4t6VROXr5lSk=
Received: from DS3PR10MB997700.namprd10.prod.outlook.com (2603:10b6:8:347::19)
 by SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 19:09:18 +0000
Received: from DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a]) by DS3PR10MB997700.namprd10.prod.outlook.com
 ([fe80::4c1c:3bb:c4c9:8e7a%6]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 19:09:17 +0000
Message-ID: <af4988e7-f738-4f7d-ae2a-2c79685fb00c@oracle.com>
Date: Sun, 11 Jan 2026 00:39:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9976/12398] sound/soc/sdca/sdca_fdl.c:471
 sdca_fdl_process() warn: inconsistent returns '&fdl_state->lock'.
To: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>
References: <202511281507.fvO7itoX-lkp@intel.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <202511281507.fvO7itoX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::19) To DS3PR10MB997700.namprd10.prod.outlook.com
 (2603:10b6:8:347::19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR10MB997700:EE_|SA2PR10MB4684:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1497c3-e245-4dad-1846-08de507bc075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFhSSmk2RU5EdlhqVzlFQlJrUmk4SVl1aXJvLytJcUFWRWZzQTZPV0htV2ZI?=
 =?utf-8?B?MzNNemFvRXIyQkdHL0lFYlZwZDVmT29YWHRIWEZadllnazM5RVA5QXM3Y3Y0?=
 =?utf-8?B?R05JVGpKNTl4S2p3NWtRRUFCVGJZc0NRTEtDUWZzcWFFRmNsK25TQlJZQWcz?=
 =?utf-8?B?c2ppekhWUzVacVZucFFnMDdLMUQ0Y01hRTkwRFg2ZGJ1V0t3MHppdldhQmNn?=
 =?utf-8?B?cm0yUHczQWNjRnNNbklxS2l3QXdzcXNaV2FES0FnL2RDR3RwV0lNY0l1VkFM?=
 =?utf-8?B?SWtLYXpWaTZaM3o1NWppTHJQUm5JSkw3ak9LQy8zdHBTVHpuZUFWL0Mwbkxm?=
 =?utf-8?B?LzJLMkdqczQyeWlidGFWOHg3WEI0S0puY08xRzRaT1FTQlNBenZUSitBZVMy?=
 =?utf-8?B?eVZoZFhnZGtZSHRvZmJpQXk2YXNFMWNhYStSZTlkM2laQmc4WGxLUzNseUU2?=
 =?utf-8?B?Tjk0OTdLK0RJTVpqeUJGR0NCVWx6UW1vS0VrWjRkb085UWR4NmMxY2dSOXVJ?=
 =?utf-8?B?bm9KbzFiaDk0ck5KbEN4dFpFSmZ5c1RrK3N4R0YwVXNqODhZeGZLNnhnTXUz?=
 =?utf-8?B?ejYxY1FleGxhN3BDRkVYQ3VHU0YyOWcvVjBHOHowemJDOEZINWxUNGdybFBQ?=
 =?utf-8?B?bnUwdWxsVU5RSHBqTlhaVmhqV05RTG81VXdlMXhTUVd1eGszaTlrcWZEcnZL?=
 =?utf-8?B?b21jL0h1T2JGV3ZrRWNWVUVhc2lHbTRsV0ZCcGo2NmNKYmJKcnlWb3FtSHZs?=
 =?utf-8?B?d0FZcy81SXRGRDVlQTkxSVBpdnBGWFRDVWV2Q1hHb2JpTEx0NmlGeHhZNmRy?=
 =?utf-8?B?aTdKdHRwdTlPNXNYR2pwL2VpM0JBdFdYRVM0Yk9lRVV3enh3b21Tbm01RXRq?=
 =?utf-8?B?QXd6UnpZaTQvMFlFMFJFbFZPekY3b0pEeDMxWkpkVDVaQnR6ZnNWV1A5V21W?=
 =?utf-8?B?OXdac2tWdDdlVTNDaFJ6djRsZ0doM3VGMTNidXd6NW5TWFJORk9USXFuTlZN?=
 =?utf-8?B?UENaYTdvcjdVT3M5SUpNdTVCWU9STEtySkF0Rk55UTlaYjdJRUNTR2FJaDAy?=
 =?utf-8?B?ZzdUYW0rK3RWU3hod1RUOFFRdVFzaDFOdVRNaWVxQ2IvcG9PRlBaUkxKOWRx?=
 =?utf-8?B?RjV6eHNPVitIWjBsaVpvakRzV3JNRlRhem1xaENpK0lhbjYvb3o0YUYxM2l2?=
 =?utf-8?B?V1hxSExjbmkvOXg1bUxneVgwTEM0MHVVV2tSVHlRVUV3ckZGYlpvWGRQZjNh?=
 =?utf-8?B?S05BNHE2UWNZZUpGZXU2VnNsNlA3cW8wTUZwTG91c3ZJWDUxUDNiTmYxZTBZ?=
 =?utf-8?B?T3NpdnVjSnRTV0hhNkw5Vi9hMS93VmhSQms4WlJrYmNLa2pHajRDNVd6dU43?=
 =?utf-8?B?eTZ4UWVYT003N3UxR2M1WUptbFJaM1BmVGdpdHdld0xnVkdSNkFWajNYY0pE?=
 =?utf-8?B?YTVZc2hnT3IyUE9mbTVIYlZXcUd6SVloOVJNakdkVXZNTnBFTG5nQXNuQTlX?=
 =?utf-8?B?MlV5bTZjdmRvUDhLclM5YTcrOW5EMHY1V3NOYUdhYUh2b1lXRmN3UWJiZWho?=
 =?utf-8?B?R3Rjb2JXMTRWOEJqb1JadkF6OUFReFRSNTVMWFRnYnQxdTNzM3VydVlwRmlQ?=
 =?utf-8?B?L3EzUVh1czE5bkcwYlZqVWEyeWxobmU4N1k2MWpGNmZQOWtSTjBQME9YY2tI?=
 =?utf-8?B?WlM2bHA4UDJiWDd4ekgzTHFNdHFQdkpaN3dQcktVSlRxNFhEeG5QaEVqNFRL?=
 =?utf-8?B?WFpISWZqL2M2aVhvWlhmNVNCWmNldU8vcVpJZnlmNlJ3eWl4MW0wVFZxZEwz?=
 =?utf-8?B?SmtkazNBTXRkYkVHU1ZrVTJPT1dTUVFnMmxJc0dLWGpnYmhwOE9nY3NtMjFC?=
 =?utf-8?B?Y3BUQTIxbEx6WTJwWTZhY3FWdEdIS00vbGZyZ3MvdFdla0ZuZkNYUjFhbE11?=
 =?utf-8?B?bEJXOFR2T3RlekxkdHJxeUovSG10RG0wVFNzUHZKcVBzbHJJMm5xVlZWTGNn?=
 =?utf-8?B?OGFhbGNQRFJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS3PR10MB997700.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHU5bzNNOUNDUjM2bnVxTHQ1aWZYTUhPaDZVUU9BazVYYTBZWGRrSlJWS2lI?=
 =?utf-8?B?VGZCZHJFM0tXMnAvMkx1OGhreXhiSmZJL2pjQmVucFhhVm5GUU01K3dsNDJl?=
 =?utf-8?B?ZjgyZm9yeFEydHVNbjcrRmdtT0ZLblgwWmlPRCtBUGxvRDl6MEY1VkU0U3hC?=
 =?utf-8?B?QmoySFJnQmFMMWhzTVdTZ3FaUTVtUStIb3BQZjJFVmx1WTZMOExEYWFUTFNw?=
 =?utf-8?B?amp4TXk5eGpVMElROUppbVVibWJrdDExMHg0bDlQSUhDQ3pBR2lVUGl3MjBX?=
 =?utf-8?B?OFppVUp1MEI5UHY4d2FvWFE4RCs1a1VkQnd6NWl6am5JOG1JSXRuTjNKNnhy?=
 =?utf-8?B?Y05GZlB4YTZkeU5YTUVhNkF2RGcrK2tUV1VxQ1ZGY291dS91TjY4enNMTWJh?=
 =?utf-8?B?R2d0WUVnVHNQR2xqMVNZNU02aDZVUzNvOUhUd09keWRpV3ArL1FYUzlNcEN5?=
 =?utf-8?B?VXdlZjdJcnZyV3hxTUM1WUJMUzZadG00c2ZBOW1IN2dDUzRqT25KMTNFQWRq?=
 =?utf-8?B?QkIrU1BHTHVKRHZOM1hqT2pkY1YyOFhzNnhVOW5CTWRZS3F0cTllNlN3Tmo0?=
 =?utf-8?B?aFk2N2Fta01sTFJMNzBnSENrOHpMVGM0Q3N3ZEI0N0RsS1dyalAzSXZ1ZW9R?=
 =?utf-8?B?MnFkemNJZFVpaXdwMXF2U3ZlaDlYeERQTHdOMnlmTU1YelRjYU81MGtxQVRU?=
 =?utf-8?B?bGlkMW8yNkMrdG82bW1yV21COEpUSnBkNFBQYXlxOXhFNFhldndqNDFCWjAx?=
 =?utf-8?B?T3JXMVpwRDAzek95NkVtanVIODNVanQ5NUVDZkRmbDhmMERlaEllQ3ZIZG9G?=
 =?utf-8?B?OFNDUUx4bmVobHRWL2NqM0dPODgrZktXYnZCM1UyK0h2RXFzUkhweHhRcEhx?=
 =?utf-8?B?Tm9mU3BENHpOU0hNRkV3SnZPZFVZRnIwRXdPaGtqNnJ1OXlHUzUvdWlkclA3?=
 =?utf-8?B?Q3Jpak1iVVcyaWZDL3hXUVlwdEQ3UjNIa1c4ZXlnNURXYUlYUnBFYXpGbGta?=
 =?utf-8?B?TXpFaHIvTXJvMjNSc1p0dkdjam5VWUpRc0ljQll4a3c2SWZMM2ZoQ1VTaU95?=
 =?utf-8?B?T29YQ3IybkxjRTZsZ2dsQzIwVDV5dUMrZGR4alZkc2FBZFJGcXEra0ZNazRC?=
 =?utf-8?B?M0JmQk1lLzhkUFU2eUZiYnZqT2NpcDE4dXd4NHFMcFF4cFZiL0lZTTNhYmlM?=
 =?utf-8?B?UlRzdEJBT0w0R3lNUWxGMWJaNHBGT1N1WWhPVkxkekpHdHZkR3pDWCtkcnV3?=
 =?utf-8?B?a3Yya3NIUlpPM2FnWnoxWmdKWXBXZUtqKzhFUFNqVFI0TldhREs2bEhuSFdJ?=
 =?utf-8?B?MXpXd01MVUZYdWhSdUJuMzlyMWRBTE5ML1lCQnZmZmZTRWViamZVNkt1VzRn?=
 =?utf-8?B?Wk1RRTRnekJqTDA5aHlGcThHTGszV0hmcnFtRUNFMVB5VUh1RkdQZ2tlMmww?=
 =?utf-8?B?Qi9WMW5qdHZHMGdQY05UOXJUb2xGVmt2U1VFdmMvUGJRWkJLd3ArZHNJbjJt?=
 =?utf-8?B?eElGQlhraExQYlEzSVZIVHVQWnVMN2dtVkcwbmtuWlRRUDNMeWUyb1dCZnRw?=
 =?utf-8?B?d1JMMVowaXVsbEdaM1BJU3B0d3RYczBxN0xnK1dibGF1VHNoMlF0NTcyWUdy?=
 =?utf-8?B?MVJrS2xpQ0R4RFBBM0pHV0syOXdwMmNDMjdMWXdOSHJmdzFhVEZBTDRQeVBS?=
 =?utf-8?B?aTdtR241L1NDQmtiTGZ6RVpnUkRETXI2Q21BaVJ0WTZUTFlMN1U3RWZTZkFz?=
 =?utf-8?B?YUtyZnRpUTFRVUttNFFwdmUwcjNsYW5iOWx1c0V2b2NkS2t6R2lZUzAySWZu?=
 =?utf-8?B?RldmUTVjTzRnU3IreFYxTVNpNVNpZUtjQ1RVbmF6NHFIMmxSK2hFeFNiMFhn?=
 =?utf-8?B?K3Q1aDYwalBMaDZMbVA2N0o0cEE0UE1TbXk3aU1RaGU3M1Y4S2hPVW5VWUY0?=
 =?utf-8?B?WnpJa1hNdGNwT0Y3Tkp6SEs0SUErVU5XVWlUT1VjNDRqL1MxWUpqZlE3M3Fh?=
 =?utf-8?B?YU82QWNYOXE5SHpqSHQ4MXdUL3lRRTBBK2JYbE9QQ29ISU1vTmF2QVN1K2hh?=
 =?utf-8?B?N3JrMjV3UjBJVnJwRzRJL0ZuMUx3bVRsdGlDb1l3RFpJUUc0ZGxwMWpkTWdS?=
 =?utf-8?B?S0xkc0ZOVFFkK2RiM3h1Y3B4RTRlQVJTY29LR1VReWN6L2NmbnZQSkpsTE1m?=
 =?utf-8?B?WE44d1p3cUdyNG95a2R3eHI1aittNnFJczQ1VHNRcnpCdzVZZTE5WDlqVXgz?=
 =?utf-8?B?ZnREQjEvb1A1NWVqR2RtK1ZJQk9XRi91dGsxNUxqUVpRWHlKcFp2RjA3WCtz?=
 =?utf-8?B?c2pzZXl6c0VZdktGUDB1K0k0Y0JwNEM5MzErQjVZQTBNRDVGRFFPOVE3WXQz?=
 =?utf-8?Q?kuATdzTCO6uvj1Hafds6wv1vFl/1syqmk1PBn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ka7d8WIk3e/5ZDUBfs3ogHViHwV3fUt00VspGZEGCZctbE49SyORhu7vdTCKrlLElVt8Kp2pGm5o/bn3WI4Ntel2NU7E394gEeQ7g23duD1eNLDMJ//KrCkFsuyuxWLHFRxOd85SAMjf7dhxKVsl3KU4Lv6MAZL+EKf5xh6m7XHDwbib9ihX360M99oV2rQMgJepxRv/VVZtY9TBke13tO7ybm7ScfOlkmwi6hwhe0TZFhWH88rA62npyXOh6aYABZb7alXCzOndbOiep2UuAuhd08KFMP+lBa9w/hoVXMSNuHt9ixN7nJvfgPuKZda7RN38zmTfwNH+z6VSp1K/5PXBjfNiUphSH6zaKTI+NOdCY4ojtZLvTLsVYM6K+Z3Ool/lci1ubsucWdLLk9GUEFB8Hy8oyv8fkv4Gqhfs+3Kew9iDtS3Iw6s/WTakSPrnXazoAWOKAnrxpKLSSlChwweXE/xZQy2ym6lCzIRKdzGYYjVcu8y2aM63MsGGvpWHdWijLa4Bv2/RB0p4Y0xReDBZ4aVUbO7kIiVpskMiPDUZ9kr7oMXNyTjNTvqtN1V+Nhja4cXNHBGqN1CHIuiC9KuPwF4Ntgdb4ezzgrISDJg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1497c3-e245-4dad-1846-08de507bc075
X-MS-Exchange-CrossTenant-AuthSource: DS3PR10MB997700.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 19:09:17.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dT9dL6r8YtmRkcLKoRMmm46R+gGd9/BkY1MBz31U9GkzjsLTZMoWDyvpruHmdpH0ELeYlz9IEtr9XMJH6YE9d1ZgfJCKeyfDW97awVVFuzpHHIqQSeHtjxV5w9gO+lT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4684
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601100169
X-Proofpoint-GUID: s9IY4_6eQQFVnhrItQUXg9tNF4cao8R8
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=6962a3e2 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=V5_0GreYBujl9itZ3jIA:9 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE2OSBTYWx0ZWRfX38NJuV0wPlPX
 I1dFgBrRXdb4N/K9BI3ngtTEXjq5ckeKb16/fE1VBQqi4FNZX68PGHE0+zNomqL4brz5UUgxLzF
 3WrgDK+LE8Nfkc7cW1f0yJbW8NngHDQKu9lDmkO27O4UdwK34uwm4zCfIxAvFPz7Qb/u2r9JN70
 6ujXOyKT/MPJ2SBxGjOuHXPVSdXdnH9VSLFDEn7JH/EIVdXm2VaVVLY+jl/paxslBdzErVQGjZs
 YQtew67aTl5h5P9GK8A3VubY3Nm4/bSFavfqM1tES/Xt54RoBMfg60uo6NT3s/NkLJEXJLdLzwu
 HP6DWs3mjONN9CFzc53gprBLFkWXbAvrppfoNGpZeoheVQQb2DNGA153tHvK6Mgy0ka4Fco3V89
 AAFc6Km2Vrselvfy5HCNR3VxhQIzcvPSAJS21tlu43zRdzYIvqKn5Cxp4j0RcU27DYaimL9kLSx
 WML3XLLJ2JdJ6T1turQ==
X-Proofpoint-ORIG-GUID: s9IY4_6eQQFVnhrItQUXg9tNF4cao8R8

Hi,

On 28/11/25 12:42, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Charles Keepax <ckeepax@opensource.cirrus.com>
> CC: Mark Brown <broonie@kernel.org>
> CC: Maciej Strozek <mstrozek@opensource.cirrus.com>
> CC: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> CC: Vinod Koul <vkoul@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
> commit: cc58055bfefa065b68a8ab92a0196c9b24f46f02 [9976/12398] ASoC: SDCA: Correct FDL locking in sdca_fdl_process()
> :::::: branch date: 28 hours ago
> :::::: commit date: 8 days ago
> config: i386-randconfig-141-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281507.fvO7itoX-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202511281507.fvO7itoX-lkp@intel.com/
> 
> smatch warnings:
> sound/soc/sdca/sdca_fdl.c:471 sdca_fdl_process() warn: inconsistent returns '&fdl_state->lock'.
> 
> vim +471 sound/soc/sdca/sdca_fdl.c
> 
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  388
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  389  /**
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  390   * sdca_fdl_process - Process the FDL state machine
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  391   * @interrupt: SDCA interrupt structure
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  392   *
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  393   * Based on section 13.2.5 Flow Diagram for File Download, Host side.
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  394   *
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  395   * Return: Zero on success or a negative error code.
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  396   */
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  397  int sdca_fdl_process(struct sdca_interrupt *interrupt)
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  398  {
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  399  	struct device *dev = interrupt->dev;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  400  	struct sdca_entity_xu *xu = &interrupt->entity->xu;
> e92e25f777483b Charles Keepax 2025-10-20  401  	struct fdl_state *fdl_state = interrupt->priv;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  402  	unsigned int reg, status;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  403  	int response, ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  404
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  405  	ret = sdca_ump_get_owner_host(dev, interrupt->function_regmap,
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  406  				      interrupt->function, interrupt->entity,
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  407  				      interrupt->control);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  408  	if (ret)
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  409  		goto reset_function;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  410
> e92e25f777483b Charles Keepax 2025-10-20  411  	sdca_ump_cancel_timeout(&fdl_state->timeout);
> e92e25f777483b Charles Keepax 2025-10-20  412
> cc58055bfefa06 Charles Keepax 2025-11-20  413  	scoped_guard(mutex, &fdl_state->lock) {
> cc58055bfefa06 Charles Keepax 2025-11-20  414  		reg = SDW_SDCA_CTL(interrupt->function->desc->adr,
> cc58055bfefa06 Charles Keepax 2025-11-20  415  				   interrupt->entity->id, SDCA_CTL_XU_FDL_STATUS, 0);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  416  		ret = regmap_read(interrupt->function_regmap, reg, &status);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  417  		if (ret < 0) {
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  418  			dev_err(dev, "failed to read FDL status: %d\n", ret);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  419  			return ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  420  		}
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  421
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  422  		dev_dbg(dev, "FDL status: %#x\n", status);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  423
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  424  		ret = fdl_status_process(interrupt, status);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  425  		if (ret < 0)
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  426  			goto reset_function;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  427
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  428  		response = ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  429
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  430  		dev_dbg(dev, "FDL response: %#x\n", response);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  431
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  432  		ret = regmap_write(interrupt->function_regmap, reg,
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  433  				   response | (status & ~SDCA_CTL_XU_FDLH_MASK));
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  434  		if (ret < 0) {
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  435  			dev_err(dev, "failed to set FDL status signal: %d\n", ret);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  436  			return ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  437  		}
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  438
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  439  		ret = sdca_ump_set_owner_device(dev, interrupt->function_regmap,
> cc58055bfefa06 Charles Keepax 2025-11-20  440  						interrupt->function,
> cc58055bfefa06 Charles Keepax 2025-11-20  441  						interrupt->entity,
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  442  						interrupt->control);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  443  		if (ret)
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  444  			return ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  445
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  446  		switch (response) {
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  447  		case SDCA_CTL_XU_FDLH_RESET_ACK:
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  448  			dev_dbg(dev, "FDL request reset\n");
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  449
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  450  			switch (xu->reset_mechanism) {
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  451  			default:
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  452  				dev_warn(dev, "Requested reset mechanism not implemented\n");
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  453  				fallthrough;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  454  			case SDCA_XU_RESET_FUNCTION:
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  455  				goto reset_function;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  456  			}
> e92e25f777483b Charles Keepax 2025-10-20  457  		case SDCA_CTL_XU_FDLH_COMPLETE:
> e92e25f777483b Charles Keepax 2025-10-20  458  			if (status & SDCA_CTL_XU_FDLD_REQ_ABORT ||
> e92e25f777483b Charles Keepax 2025-10-20  459  			    status == SDCA_CTL_XU_FDLD_COMPLETE)
> e92e25f777483b Charles Keepax 2025-10-20  460  				return 0;
> e92e25f777483b Charles Keepax 2025-10-20  461  			fallthrough;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  462  		default:
> e92e25f777483b Charles Keepax 2025-10-20  463  			sdca_ump_schedule_timeout(&fdl_state->timeout, xu->max_delay);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  464  			return 0;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  465  		}
> cc58055bfefa06 Charles Keepax 2025-11-20  466  	}
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  467
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  468  reset_function:
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  469  	sdca_reset_function(dev, interrupt->function, interrupt->function_regmap);
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  470
> 71f7990a34cdb1 Maciej Strozek 2025-10-20 @471  	return ret;
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  472  }

This looks like a False positive because of scoped_guard() usage for 
locking.

Responding here so others can also skip looking at this warning.


Thanks,
Harshit

> 71f7990a34cdb1 Maciej Strozek 2025-10-20  473  EXPORT_SYMBOL_NS_GPL(sdca_fdl_process, "SND_SOC_SDCA");
> 71f7990a34cdb1 Maciej Strozek 2025-10-20  474
> 
> :::::: The code at line 471 was first introduced by commit
> :::::: 71f7990a34cdb11f82d3cbbcddaca77a55635466 ASoC: SDCA: Add FDL library for XU entities
> 
> :::::: TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
> 

