Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FABD22541C;
	Wed, 18 Mar 2026 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840755; cv=fail; b=IJ/9eAdhuwqFs2ysfWZ4YHxp3F48v8TZRUiDJ2Tkdm9mXM8eNZutwzBjnzAUAUBcPoTLSYo59SAos+LnwTe3NRYVneIVMnJWcuqBo1IHpYQqLg8fPQfW1xo1O4RjFzUSbg2qu/tog4kqQCzaOacZlqJ/Sp9rsXh/dUyOiHpQWUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840755; c=relaxed/simple;
	bh=oXXl9tcuRPR5KsjKicfROwgysk0fa6X3obZUrDe3YLM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=peqOoWQe3sSf7kZIHPjDpajoslGaARM13IFZ7ORUS0zseB0gjo9U2fnew8Q2Tl0ZbyIRXxSbbns1UZJilnV1Do1LhrLCigJZEw/b4XDUHEF8GToT/tfmHurvjNTxg3xYXz1shIDRm/DeRF2DFZeSym5RayCGHH1JHYWMMJx7bNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=csBPLz1o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AbuS2J9m; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="csBPLz1o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AbuS2J9m"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2OGYb1712402;
	Wed, 18 Mar 2026 13:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=K2m09/p7JeNeDV9IUHLP8pL3ABNeK6h7oZP2pNRO+CM=; b=
	csBPLz1oCA3sOfECaPLiIUKvS8c5PRWnaDxQWDmUCky9TM1KRznHL6tKyyFMhtzF
	A4X6JHBZBJZSbMaXraxLEVrfdFPNpQ5JSr4yPvv+NfBT6bjXrUyD8Z3zzbbVX/jQ
	oCbV1YkE+ExRlVsFNI4A8d1tYxrD/BNf+MCdqY9zYgf9tve9FH2uQYZ28YWyu37i
	EcFQKjpGq8kFfNbvS/DDBwbY7XPGr/zkj1JWQw54IVIZ4BbDctNOLhAAYnOkvqCL
	UqJrwyQywTUPAO7+yLEb69KcXBD3CKUeB9442A6TdzjgqpyZv7ZHAjFJAMRas9yi
	TaCLA0Qlptpg1Cwr+7uzxA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvyj661na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 13:32:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62IDUZBQ017788;
	Wed, 18 Mar 2026 13:32:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011047.outbound.protection.outlook.com [52.101.52.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4p6utq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 13:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU4fzlWUkvzO69Miye2eViAjC/c53/k5RqT8H0/7hZERnsXgl0Xz4edlz3jYWt93vi9Sv2TtFHACKnRiCZT9Qs2wspxJ8c4IIVUOd3Q18uefTnWA5Cw5daUkw2pTOskKqAMDJRezANdmMHo+koawEGepbGeQsJrRzFQz2/mHzqYz6HyiG7zdeppExNbmOx7ZzSKSuRw1O059RiJ/z9lnMS6ewDRuxNhd2yBYWELjJRbUivGmfb6XMlPakWUJQ1qUt2oUmRVsvTRJbHYyufAkWHzlIuWFhffCO81Gbf5YH2zFGB/6NFu4ezp7d2ogh2uJtxX2EGU8Zs9Ks76hPCc0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2m09/p7JeNeDV9IUHLP8pL3ABNeK6h7oZP2pNRO+CM=;
 b=RH4dZVDB7B3c2oIBCQsh3OQ123cpR2c9aok4gQyOgA/U7O001layoUwJzwC7/L4G81TbhdWYOeWTSJ/aFRPgITi5TyfyXTv62br1l8XI3ahjNwLdi19LNDkmBEAgyIMfnlmEfABCjD1C5ILOlX541DdowIJZPjLpQ48IHNRJPLxLg7CCpA24ihBDtme1OIp8elCadiXi1oVjdmuN2FZ11m/Fb+Z/Ho+0tBSRws5C4RJtuxzw+rfvN0tP6yXrIAXmK4j1SSZeTnKjcVc7MRAhftrwIuOekiADDXrfncalYNHpSS0SxVBmmSriNjZgvkgoBZA8wSHbLdFj4xgYYAlNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2m09/p7JeNeDV9IUHLP8pL3ABNeK6h7oZP2pNRO+CM=;
 b=AbuS2J9mpBkDOuPaDU5eNoLK2azsD+ycxkc5aUGl+T9FVzZTjfkc3FjPUgItE27IserXlScgpfWyMZ8ijEtiatt/MLkoYLwa53rC+MC9oubjgb8QVkrWRnMVisbymdvZYHc6T5Vwl1Fc/6uu3dhrexUdVX0SIansM1o4Kk5wvJ0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CY5PR10MB6216.namprd10.prod.outlook.com (2603:10b6:930:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 13:32:24 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:32:24 +0000
Message-ID: <32436e47-9700-46b2-8ee2-f1f666520eb7@oracle.com>
Date: Wed, 18 Mar 2026 09:32:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
To: Jeff Layton <jlayton@kernel.org>,
        Dan Carpenter
 <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202603180258.r8Bt94T2-lkp@intel.com>
 <03d95fada335610f65f8590e02e1ff724e854b68.camel@kernel.org>
 <13cd936f-0e00-4d7b-bc41-129a21cc5cad@oracle.com>
 <50724bf987e3f702ebe48b9fb280fb3e4bcf0618.camel@kernel.org>
Content-Language: en-US
From: Chuck Lever <chuck.lever@oracle.com>
In-Reply-To: <50724bf987e3f702ebe48b9fb280fb3e4bcf0618.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:610:b1::7) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CY5PR10MB6216:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d0ff50-faad-4bcc-e5f6-08de84f2ca5f
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 jJmDRcXzhZPee1iOHIMfk9CSdYor7pPzHYdq3uT3NScK4ve1cW+N2l2BCNK1mEg/3rp8ewXNijFQoPNkYTPD1popGgmTR4tZE9Sa3sSfyE1zwI9lt5+zQdO0QFQeBlcyrHjIXwYc3ShUNs+MT8bxihOpUu63Mm+MQSDO/57WjFQ0MIss9DgcLaiYmneP9bKobOaVTo3tfFy79ITzIlPNrm9udMsBGYJdWNGkgYywVhb2LA2701dI3NNOU2N7psp7RFzZakL89cggt2S0ilrgf5ZXKbuaOeXuTQeAYKKW45Dww3YeZo0IcWDWFJCLMzEe8fMCJwgraG54dbXYSiz8tpNJgi8SBAPOeKzNRzd5Hpdu47/Tu3mRkslFNS+HtasUIwD1yNDoHyYMsQcc06HW7+0Waskm5XHTt0IjDa1CILB5GlCWK6BQD1JO9PVWJi0YbatZzEoKjO03PdYjWTPCg+3UsflNn3usvLfGJxKEEferQJpszoRD1CN/NEdps0OjbhewzffiUpEAfAKY306yHWJhWGuS9WVw4nzpiAlz2ZFg0kfxvjYpj0NVIO5KqiGu5KBCSPFuwkA4m8mU8QkOyIO9ckHGo8F7aVozF+UxyVzNaSMOHJAXyll9ljhVOGpDYpF86Znt6OoINUfscPpKn0XvJNiKuS44X2nR4DTpCPi+pBQ6f71PLIL6AXn732EhSnzORi60AHmWlD4lYRID9qMCf6nG1ZL3POWFTkM+Sxo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5128.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TFIyY3NKdjZreXRhWlBad1YrUUdCdSs2ZmxSaWhXUnFLWW5FYU9QajhWTS9V?=
 =?utf-8?B?b1dxamNLYW83Mm5iZ2dpMU9OWHNYdEczZm5vNkhGWk5aQnFxQ2pETEczOWFD?=
 =?utf-8?B?Z0lqaDByeVc3U09hYVRCeFpnZHJwbDQzWmxUQWdzY1p2NlExSC9YUjNsT0NR?=
 =?utf-8?B?ZERtUmxqR1NydVFBNmQvZ3pWa0FiUnloc0dzRkdwa1V6SG9za091M09tNGNa?=
 =?utf-8?B?WTQ5LzliTXU0S0xib3hyRVJza0ROd1lpdG4xWmduaUtkTFd6dTN6c2V4UFFB?=
 =?utf-8?B?cUtiTERFNHRKNHJCNjZLQTVya0NLTlZWaGJJa0k1VTJITE1QM2dvQm80VW52?=
 =?utf-8?B?OFQxSnF6bG9sUkU2K2Jud1JNOVh6azQ3dSt4c2g3N0xJL3ovNERwMlVEcHQ5?=
 =?utf-8?B?VllQVGpYdjVNQ2xGY016ZUwvR2ZNbC9jRlRhbFBnb3Y1K2p5Ty95ckE0ZEVT?=
 =?utf-8?B?MjIzNVVBRkxJRFlsQlg1aElFZ3ZJN2NaRDlpVlBtSitwMFdtUVM0UitvMTdD?=
 =?utf-8?B?R3RnZndJZFY1M0k0Z2YwMFN1MXBnR2xLTW9vVkdIdFR6d2JQcDc4QlB6dmZt?=
 =?utf-8?B?dmhDRkwrY2V1YUhPWXNpU0gzOUJuaEVHcWVCcnYrcTlqWEN4ZEF0OHQvaUYr?=
 =?utf-8?B?VmRJaVhKOUV3Wlh2NkVDYS9uaEJzYkNrQnNsU3FLdytrY2xYTnJPdnA4NGJR?=
 =?utf-8?B?NGVWQUJvczN4eTRGRnNqbmVtK2hnejhtRGR6UC9xMGh4ZGU5N0tpNmQ4MEZz?=
 =?utf-8?B?TFl0YkVPSTBtQXA0L3VBTldBVFpBN0tPR1N4aTM1OXZTbDNiT292SGxGblY4?=
 =?utf-8?B?UnVjelZUaExtaEhqT0pLRHNwcHdBR29hTHIyUk12UjJWMUhCK1p3ZDA0Q0o0?=
 =?utf-8?B?Yk1icHVVQTZpYW5NbmlEdzlFc0ZHNEQwaUFWU0QwWTd0ZjBNbnZEKzdaVkNX?=
 =?utf-8?B?U0cvbGlnZ2JVczlZcEpMejhZeXZJZ3o0RGozSDhHTFNET2Jrd0tOSk5zNGd3?=
 =?utf-8?B?TnJpc2JWZkNKMHNTSHAvMHdsWUtMMlZ5ZU5IZzZrODFoVmpjQmpDYngrU3Az?=
 =?utf-8?B?eFBFbHp6eHltL2ZGNm9qa0diQUFZRG50M3pqMnBITU9vMUhuRHkwMlFzWWxa?=
 =?utf-8?B?U3MxUzljUThXYTBhSFFLSGs5ODI2MkN1U1M2UGFrS3krMFh0WHBvclRlc1lj?=
 =?utf-8?B?Y0VqSEhUYVFIeFlPYzhkdXIvK0R0aFFCNWNadS9NOTlsTWtPWkplTjFMQzF0?=
 =?utf-8?B?L2k1SUhQbTFtSFlZU0t3SXV0d1lvdnk4cmhPMXN3MUpZMHlFUnp3K0VtUjlV?=
 =?utf-8?B?aVJ3Y002ZGxsbGdDT2VnSHptR2VKNTBMQVNzSkxUUzVEY1c1aktsTW1iU1Nq?=
 =?utf-8?B?azc5L1A5a2pPdUtFV0cwRFBOZTM0ODNsNGJsUmZZcVVTQUxNN0hOZUVGaHBo?=
 =?utf-8?B?cEwyaFBuTkIzWUpaTlMwdGZpUGJ4YWxRblN5NE0wakRIbWk1YzkwREZaZUN2?=
 =?utf-8?B?bEZJdld3TzEvU3FtV0w1ek45TkZsWWdCOGM5Zmd4cFdmY1JSSE9OOUlTWW4v?=
 =?utf-8?B?TU03VE4wZHhYRFVPNGxyRHhWMW5pVDVTdFZhc0RoaG5qOTFMK1dFVlJPZ1Bm?=
 =?utf-8?B?R2VuejhOdUFVeWdyN29Cd1MyQTg5enNEWElVRVl3T2pFYTJsMEJucmZYYVM2?=
 =?utf-8?B?ZjFqZnpnUWdMTmlzcHlWRVRnL1dCbG4vUUIwUm1nWTV5bG40RE5Gcm1aL1h0?=
 =?utf-8?B?dlhINEdLUkVVd2NBSGl1UGN6ZTY5czEyK3M1RGdwTGs5NWpoa0ljT2FNL3py?=
 =?utf-8?B?elVsV2k0MlpxSkpFQktOR1RvazF0azFLMzZEalRMR2dDbGgwRVdCaG43ZEVp?=
 =?utf-8?B?V2tHWVdCUHBTTE5aS2NhU0xONWh3cUhaemdMbXU3NTNjYitlZytZQjd5RkFp?=
 =?utf-8?B?V3hWSDJ2WGRUUGFzeFpFcXkzZkljN2xFWkRNbWI1RVE2cVM3L2poWWwwWlYy?=
 =?utf-8?B?Y0ZVREJscEZGc2xFaWNzak9CS216ZmJKSGprZzVubUFHbG5xKzQzbWxLdXVJ?=
 =?utf-8?B?ZStYWCtlajg0Ti9qMWtNZktHeWw3b3oxeFFTKzdFemJ3eEoxU3gzVXdieVdk?=
 =?utf-8?B?UE1VeUxBaGtJeGk2UmJmTWJoaGZCVmNaYW1jNjRXdEpUZUZhVXZWN1YvQUsx?=
 =?utf-8?B?RE1mMExvWWxoUkNxc2swN3FrRWlOdDg2ZkhVRkFlcmg4WWE0ZlVvblVTZEhE?=
 =?utf-8?B?OGJlQ0hZSXlFa1h6dzNSc2EvblpZMnh0UTVVc2xZYldCNkU5WUJFcHJ3d1ZJ?=
 =?utf-8?B?T2UxeU96NUovUjFsZ096eDcya2tWZkUwaEIycVgxa0UzQm1LZDlhZz09?=
X-Exchange-RoutingPolicyChecked:
	GuNOH6uzX7hsRRR+Fby3083+tdrlP5ghRHzY4FRzj91+WR3pUxVDe7rCvUVEsOoJ5BnBOUWcQ5Gu6phkhHdc7Uyoc0sUCCiomxpqtj+p4G6rZx3cPLyLHWreY0tfFXgaG6RSXRgNlLfx5EN5A4ZfhP3L6up/t99iEyuW9l0BgJ85NDQuJs3oohvtQhiSG37gOtXOB6/vkjzQwgGRwt6zGJ02mq14D8A1TiYiPAAJgl4rZlyl+/FaakyInYnsA6W2xeQ/OYcjYpwDY+hrIIZGGZci2gOQdkQ0ei0Y7qaBan/QbSa69pBd/tWEtZh0Bc0Ad4RcwpgDyjVdliScOCv56A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5z4krzOjiYb51j2VBP80Wx4kdOHXS21mWOwGYq91TLSgN5Q0hq2oLFdk8F0g1o8zquSsiy5zPpFE8kcvp8zzs7fI0mR7aO3eTTpA6SH+EGGSxfD2LLg2j3NRIqUAY9L1araG8mROJCnr3quVIPrPqhbMOfe4BnXVJQtL3ZTG/kAgn9+pN6qHLDC/C754zVTXa3yzvlmhn25hMTlgf07Rbik8IK132ClV3PtWzsWEFOWcHU3bxwJNqiHh7IeWoyOfQWZ4h5ZtrrVEBoNr69DxFlOLRX2WbM7HvfocsnxY9vDVsRU6w6InCg67sbZRVIH0ory/jT89XJ1PM+KXL19LjhpRq+Ok4TXWz2FWiES4suZwp9MYReJs0/n7Mbs63o5M/m1wepz9wl8p+e3h7mhEly6pVkIbvjeiwI6Q+VcxqE6wRXt0h18FtOiNVg33RehM6ZJHtrFgfooTkABo+uxsZjxOngBp759IViU/eGW2Z5UsnIKJQvPx2SOh2Bypj6FAoMjIlhXdtRqsYbC68/Ex8VsrzQdn8UbY0TdrkLE7rawCGj1OlMaBzZz5ZUcv4xCSdpkTT1OTltY5t8697LpvWEr2eIjyQqPxHe7v6tPhsnI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d0ff50-faad-4bcc-e5f6-08de84f2ca5f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:32:24.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHmZ0luMd7+O3bKakDGIF+1Vu1x1ZhOHH3hHsjGLevo6+zyImYGVES8117rAm5q5d/QPMGyocForsjc4egEtgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6216
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603180114
X-Authority-Analysis: v=2.4 cv=LKFrgZW9 c=1 sm=1 tr=0 ts=69baa96d b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=jjrgc9VYjdioYNNMHYgA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12273
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMyBTYWx0ZWRfX+KxLgtRBxQ6X
 VyciTqckC6xStqlBhGbnCX65d1VQJ2qsA7lat2GClvPJoTZ7UrXoMI4CcrIIFAITXOFdVHF6WvS
 2m6mSmwSPKx3PlDh4dq98vbGNMQkb8nJdF/AcVjw8wicnhF9OuuGt4wwArNsxXqTMfV7vMniie1
 Fb/f0DDknMa6KIsP1f6//zOcvS2QYT8NWvZU49oPuYkTxW3y6Bx8T1jBaK2mhYb8AWErit08yoV
 rEZd5T/9Yq9qIxRjxCF/E868ROEdUpR4b/gS67GJb8bMW5WwzFe6/wAmX3WzAvc9ISvnrPTmutD
 697dVJe6AIX4Zi8sa/ySb3EOnoKMglpFFUr5yEIJpKL1SvkKtpQQ0Cg6fQrSVb7opEi/hWnDMyS
 R/7JQzVhYrmUnL0UAk2WQqyoDLFUZjUtF/102uI9Wi7oGmmm+TkwG0I3wUMFFKLRoC6YH/ngsRx
 mdXc4gZiJ2qcYw9PrZw69MhJFdj2H/RmJmY/6rNY=
X-Proofpoint-GUID: wT-69X5EiUXShTlnWR37Y0DAsL84EWGM
X-Proofpoint-ORIG-GUID: wT-69X5EiUXShTlnWR37Y0DAsL84EWGM

On 3/18/26 9:30 AM, Jeff Layton wrote:
> On Wed, 2026-03-18 at 09:22 -0400, Chuck Lever wrote:
>> On 3/18/26 6:56 AM, Jeff Layton wrote:
>>> On Wed, 2026-03-18 at 10:42 +0300, Dan Carpenter wrote:
>>
>>>> Looks like a bad merge.
>>>>
>>>
>>> Thanks Dan,
>>>
>>> Yes it does. I based this series on top of Linus' master, and then
>>> merged in Chuck's nfsd-fixes, nfsd-next and nfsd-testing branches
>>> before layering these patches on top.
>>>
>>> It looks like the problem occurred when the nfsd-next branch was
>>> merged. Both it and -fixes have the same patch.
>>>
>>> I'll rebase the series on top of a sane merge later today.
>>
>> Can you identify the patch that is the same in both branches?
>> Typically, the linux-next merge will catch that kind of thing.
>>
> 
> My mistake. The duplicate is in nfsd-testing, not nfsd-next:
> 
> nfsd-fixes has:
> 
>    17ad31b3a43b sunrpc: fix cache_request leak in cache_release
> 
> ...and nfsd-testing has:
> 
>     0b88d5fcde16 sunrpc: fix cache_request leak in cache_release

Unfortunately the remaining cache-related patches in nfsd-testing
do not apply without that fix, and nfsd-testing is based on
nfsd-next, which does not yet have the fix. It will get it by the
end of the week.


-- 
Chuck Lever
