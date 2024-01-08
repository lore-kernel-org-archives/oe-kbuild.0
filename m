Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A451C4E;
	Mon,  8 Jan 2024 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oSi+Rbc9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O5ByvHLf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 408FsiYY010396;
	Mon, 8 Jan 2024 15:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=mf1nTh5p3V7B/fMR2gabwJDqwgihcEUMAdkjlHbiTOE=;
 b=oSi+Rbc9N/gMXLTrbf+otqHPebKeU6DMLRm/6nDrGyjYn3cCuj6ujhs/ioa7u2fdda1j
 hj0qX0ncK8YHhNC6jMuibpvLxlJVjyzeItXhJ267mPoV8iEM+Tqj3CAF6OM1Z+TDv3PM
 yGT0pidgYLmo4Si17NxUC2zLwntJOngxZN1m9s8+x4+NwWQD6MwiFZ1LQE74roOEQgL8
 U1PT9WOHEdsBWi4lO209lGTgm70nYmIIPiAEDzO0lG+BJaUdEiRDACN8U+t/SwnECoWd
 Hq145EVQuQt8Bo173EBXvEF6SSSQHfM/CjqkPNoskDDlwgnlh9i7QucsUvILOcNObLVm SQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vgm3qr0ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jan 2024 15:58:20 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 408EjiUT035261;
	Mon, 8 Jan 2024 15:58:18 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfuu338fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jan 2024 15:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJuHawTyZ2fWHT6Ps4pTvoLhXw77zZo2asY3cMBZGpzi1LVJqh9aposxC2s7V536+2SbFxUvtJTMHPVrKFQEQKoUDjn7HOkeUep3XxYuZw46I0N8KVfMz772k2pp7mGtEq8qbJH51C4Gg60ZoplWKzQ16hqgeD97PB/aArxQxM3eLAA46iOhCfylzoTlZO6eSrPRecJpQusqCxN7no8Dlo9ew2dGXPvfIvhJN/pv0oSC8iQ1JmwymxZEeeVjUuakq6yIf0aFLD9+75I1iGuBIwWy0KICoYnfTvSFofJ6XmfjpZmMIRYqHi8TsFfCGAbMCh3bB7jIdPTNlYYrTDZvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf1nTh5p3V7B/fMR2gabwJDqwgihcEUMAdkjlHbiTOE=;
 b=LA9o9TzHHdw2mnWcDCrLJtBOZ2lNFKqbzLyY7ZNS4uiTq+43gaQTNUwXD92cwrcKmG3zaDhiwx0T+aagPwO3gLZACG7zyJ0z5dGSdUJL0uoVvvTgpgmCps9P7+akczyS+EHNXdBvRuqcvlT7vJKKt2JSVg+u2gx8bM9tESv0BNXeUi2k+EIsJnthRzIDf3RIJrc94BFGKukQFI1fyIbgGdHv1TJ8qzpPjLaDhBQjvH5p669wT3kWCoY0ZR8R06HuhOwHHxXHaBNkgG0YcnLT9Youh0HAImpBtX3zuRrYdzWQJJdn4AHz5enpakWvw18ySkiVab5TQEFWYhBjPJanCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf1nTh5p3V7B/fMR2gabwJDqwgihcEUMAdkjlHbiTOE=;
 b=O5ByvHLfCYyWEZ+7UYFKVH2g9egxxFOGu83CgV9gI63Yp3cBS9X5lovskiKnZOlEcYliAMDBu397lV3juSJs9f75CBu/kuJWEnBMBoEYLrLJilayNHRoR1AcuqPSiXplfNKCYGFxdki+xTv3u5sNRpL0mitj3Jq+jScyjc315GQ=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by BY5PR10MB4132.namprd10.prod.outlook.com (2603:10b6:a03:20b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 15:58:06 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f41b:4111:b10e:4fa5]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f41b:4111:b10e:4fa5%4]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 15:58:06 +0000
Message-ID: <011c98d2-3845-43b9-99cf-bb03e7ce9b14@oracle.com>
Date: Mon, 8 Jan 2024 21:27:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9386/12908] mm/huge_memory.c:546
 thpsize_create() warn: Calling kobject_put|get with state->initialized unset
 from line: 533
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <efeda6be-8d1d-45a4-b6cb-950cb087124d@moroto.mountain>
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <efeda6be-8d1d-45a4-b6cb-950cb087124d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0044.namprd20.prod.outlook.com
 (2603:10b6:208:235::13) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|BY5PR10MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: a70f27c7-e2ca-4dd3-928c-08dc10629a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	77jyU3SiUb3dZbgUSz4Fx4sz56Vy+bWtNZ6JKc/R6G/Z3/253JyVmynSQB7Q9VWrlCnGRUj7mGTJ3bzN0IdeP31igNezA9ZLCVxCg3PUZ2ac6HRD4YqsQUdaXLlygCX3/F9rbRhiIoTbRUCY9C5p3HYvOzA/ccrXL/RY1BztEeU28joUvTYfQPp2pgpGPS0mCPF+8qFcmPk9gQQ6Sa8xQJQeyvkF/jlhWDPZ5WXmsXddBBoipm7Ws6de4yBtgMeI7Ew1BxjKuG0I+tsW6dDXsuopGP5+VEl1dMzX4fUqmAqjQlw0a6x8XBLCojY+CNrHu7dVa93wpgsYeYyzJiPVbYErZJz8Ng5lR3tNVQwqJXLt0fYGUzLdK+DEYZZtLub6S78K/WL0fqjUnW8pVw66MdcxbfzR3rniTxUZoAWm/cmebDNCvS1/tNZLErIXPNRKT6LTis9u+Bn9SIW4mFbx7QlugyMDCgKlFxSmE/b7YZvBbp7MnMoQw0wa+FIMVOAyVBHzIrKxdAxUrbs3UXesd2/amXuuEiO5suvDPbjjKMXRjLAGSgEOGSYqaI0+Wk8gyycTj3FXTn8oboa65pmJzIz5Kftr7I3a2N7e3B1FVUVqAztbTnTXi2QLr5KmexiVptxkXAAUWnE8c/kp41b4L6U6PLtT9ifAgG5XfpgRm/xYjSL7VDZM1xdUyg55IdaVkhheCLdh2plLQHuJrjpDcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(2906002)(38100700002)(5660300002)(86362001)(41300700001)(31696002)(558084003)(31686004)(316002)(36756003)(8676002)(8936002)(6512007)(2616005)(6486002)(66946007)(66556008)(26005)(66476007)(478600001)(83380400001)(6506007)(6666004)(53546011)(4326008)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0wxemtocWdJTUtxRGxUTlNmTnVDZUo1ZXZwa1Y1SFg0V0lBNVgvall6VTUz?=
 =?utf-8?B?UCtpc1JxTHFabE9SOHI4eXhJNXJWbk5BZkZQOEJZN3cxUFNHY1Fwam5uMTdY?=
 =?utf-8?B?SkErYmxrbEsydFRjVFRZVE1qZitWSGVoM2V3QjFzOThCeFpVUWpyRjk1LzFx?=
 =?utf-8?B?VUNSK0FrK0R1Rm11ZDM2UWNDbFY5bzdSWTJMMmxmOENBVlZKekxFZmxuM1Zs?=
 =?utf-8?B?QlFZRnF5SDJzVXU1T0MxV0pEcnR1bnE2bzdNNEVCdVhBRGZYRmt2ZHpDVU9D?=
 =?utf-8?B?cWZ2NGF0YzlVbzdJVjd0VXBHazNRUEE1b2NpdGNYTkRnZTE2MGxwQXJnQ2t5?=
 =?utf-8?B?T0ZDSENjenZwdEJQZU0vZzNaTHR0NHEwMmZnNk43alRRV2hNNDJoWXo2M1VT?=
 =?utf-8?B?a2d1UzJNZFlkMmtYRmlVQTBoS1JtdUF5ZUU2eGpMT1NRY1EvUjRjcHMrRWNr?=
 =?utf-8?B?SGRRT09VdndMbjVnQkVvektxQjF3dVFsdWVoQVFQanBvTXhGNkprd09abXFS?=
 =?utf-8?B?TEE1OCtiVkN4Tmkwc2l5OE9EYTJPR2tWemVYNzZ5WEMvOXUwT1ROSGdDNWM3?=
 =?utf-8?B?bmliaFFZN3hiLzltSGNSVlp3RXNkR0Rxem5FckE3R1RzSUp6WDdoS1laa1JU?=
 =?utf-8?B?NzRnL2JjdzZLSnlEUEhyLy8zVzBjazAwc29KOEEyY0hpbm9QK0wzaENxQ096?=
 =?utf-8?B?WDhwYUFzbDlpbWs5b21HZnpkWkR6R1BWckNEM1RrVnB6RWFTZzlrY2JxWlZs?=
 =?utf-8?B?T295S0U1S0hFQm5DaVh5RCtNQUk1eWNQQ1BxOXNFRzE5dENlbE5WbERGN3lS?=
 =?utf-8?B?UXNiOGVQaWp5MjlPd1NpbW1iUk9CYnRhemNmOFN4Wk9NT1NUWXNKZTFZaHA3?=
 =?utf-8?B?U29SZ2RoT0tVQ0REZW9EbW43R25nYkJadTJLWS9pVXVPdHY1Vi9QeWljOGFH?=
 =?utf-8?B?UnJ5SzZiei9CNXJpVXFFQUptN3BoeEN5T3BQdjJLRlkxaE10bTlnK20xekZF?=
 =?utf-8?B?T2gzWXl1b1lKOWxnQjlDTjVhUVF2QVY0MVR6d1ltSGJucFl6TkVOOGJ0ZzFX?=
 =?utf-8?B?dUNYRkhoUlhmclBlWXlnNE1CdVZ5QWRkZHEwNzBpTThOZUdFSG15am13ZCtv?=
 =?utf-8?B?WkNxR0VZSWdvT2VHMWw2aU83VVlNL3gwaGVpbm0zQjJUSkZrZWpqZGhJSTZX?=
 =?utf-8?B?NnA5c0lGdjNXV3VGWG0zaTQ5d2wzTXFkNnhjNGtQdGk3VE5iWkRUcGI1ajQ5?=
 =?utf-8?B?N09lbS81QmdTZ2hoY3JRZGFkbytTYUozd0FPVDdSanh0bDgwcUFQaS9MZVFz?=
 =?utf-8?B?YmRxUnRMOUxPcWlLNnBNcFJFVmtoa3QyKzd0KzBWcS9rZzVqVVRTRDhQK2x0?=
 =?utf-8?B?aTZTWThhandkNmNLVnp6amRNZFZkS0N0NFh1cG1Cem4ySm94RjRzdGJCN25F?=
 =?utf-8?B?SzNBTTFGTzVoL2l2bGVUZUtFeXkxdktZSzIraFpWU0JGc2lBcFA5Y3NidmJH?=
 =?utf-8?B?cUw0OFBYM3lxYmdHK05rcHRlRVFSOC81SzhraG8yZkd6TXFxd01BWnBnekNH?=
 =?utf-8?B?NHdHZGh5Y25qZzNYSzNnQWU4TTVRTEpObEJjK0pDb2svN1ZTek4rTk0waGRS?=
 =?utf-8?B?V3lNNjRwckJxbmpxT01yeFU5ekoyMThSd2dyMklMZStKK29oZWlDbVgyNUUw?=
 =?utf-8?B?SWdubHYvMHBQOVFWME1penV6TXJ3ejVDS2IzY2N3NXQzelZydGJqNURSYVBo?=
 =?utf-8?B?d2JGWFdmNTEvRjZlczZ1V2ViR0NyYTNOZ09sZ25KWTFiT1RsTGFodytDQWdp?=
 =?utf-8?B?MG01aXhGTmUrNk9GOGV5bmkyeTJQZndVTm96a2RQZG1wbUFvTy9jNWkrVU13?=
 =?utf-8?B?YXlSRjJaU2pRdzJDQ09vUjRzRjg3dnBJanA2SFlnMEtiUFlsYUhkYWpFKzY5?=
 =?utf-8?B?Umt6dWQybkY4WHNReHNNMlFjNUdGQjFQWUs0Y2tGMmgrMVcvbUdsaGlSZHhC?=
 =?utf-8?B?K1RsNlRmeHhtcjlsZU05Tk1OU3phT2hwWk5FYzRRbWVUNGU2VnZhWjZIVFh4?=
 =?utf-8?B?dzExNWNPajlDSWg2cG1jR2UzRTFyc1FnbE9FQUx0N2YvR1c2NE5kUzNnNXc3?=
 =?utf-8?B?L1kvbStYUzVKaHBPdk82aVk1NjNRWmhhZDlSMExJdlJYcFBIbzIzNHJoZ2Y0?=
 =?utf-8?Q?5jTAMUZHO/1TA2mfYnnK6tM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F+yStSaLofQX4HPxnX4Nzrlj0eCCw58ykX6XL+B35lzGdvl8h2f4dKRDZnLC3e2MoRU+mh4y+838G+WkfXXu30NsgTfh78P/L4Mms0HmVyqTNMXLUh9bKRGOdP+j66SYzdvVoKpXL34764eVT/gsknzNYKRvj4ZroTjbML1gKCHUMUVkemzi97GaX6j9p0wwv5FgpJU3wVb/5I/gGho4WzSNKkxsfdgql2hhf+lpdceq2XeJhBHPJ/N4LZv0kwPTmyTKZL8Lodeb1JN6gsri2hQftm346vfw7Mo/FeK7BiAAzv8YINUETY6HqHDm/Is8jfMbBxuae3Nv1VRnIGdNqo8DY/7e7gj2+gjpu7tAd2g0IGvUMRcrMoXSLpeCpB2A5iNIbVakn/KY5GJ74fhBGssOAxE7eNYgST1J0UMcdXwdHeLNawZTLls5RMQCQ23lsV1Hq0tUBlwQeDf8BQlIl/n7qoss0nF+1Nm1SBd0CYGcqPjeWvm1GCpkI4cBY/XdA8nfNxu5bbLpdBFy1FskK9ruVlyR+rwZ5ftwmy43sl2VfZ6+TqJih6HSKTxxDmRPfG9qzDSKwpkB75KjcFUTNxKDWbuSm36CnTSSKIf1mIk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70f27c7-e2ca-4dd3-928c-08dc10629a5f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 15:58:06.3816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAg23mI7I4pDo8umuLK/oZsHOgHZA7hbP+Aq7vISOztsmHsjX2XsUDNuVzXA5asTN6UAkboN1jliwB5rxuPFoadlMSPna9vdK/pJj4tx/bkeFYEV/lbZR+ngtFih2HN/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-08_06,2024-01-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401080137
X-Proofpoint-GUID: Y-yg6ZCgqM0u3NTfRHIJ9WdeoYnZflM-
X-Proofpoint-ORIG-GUID: Y-yg6ZCgqM0u3NTfRHIJ9WdeoYnZflM-

Hi Dan,

On 08/01/24 6:02 pm, Dan Carpenter wrote:
> Hey Harshit,
> 
> We get this warning when the DB isn't enabled.  I just pushed a fix for
> it.

Thanks for fixing it.

Harshit
> 
> regards,
> dan carpenter
> 
