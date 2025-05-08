Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55712B9AA;
	Thu,  8 May 2025 06:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686915; cv=fail; b=Od1cWHGlegP3ej51it4BewZ/24j+RWQSIKWyV+vlMCbaAYQ4ilgm131cEQn4mL2D0VZzWVdbvgWedLWHRKYjhRMJT7Xzs/Q1Wjapvz+LEj/bGKWyHYMPsJJgeNRlJij9WrXk1X5jpqmJm665nbmocq1M3SNASkhbqjNjN5ZyvFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686915; c=relaxed/simple;
	bh=z0mCvNPKnmDcJYPntDAkr4R+vDyRFe8oMg3+UPvRgyY=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=YtrLoiPMY0f1en4brjhhVb6iyf9tLX7DTQ19tOaeMXwEYzJiizgmbdSvklpZbF1JDBnvcQQqsOMtVpcl5fRwKJSJDhc1wCj4CN9dIgmfHXozMFsVdpxEXASD+QdQYlO8nAtVtew8dpxXypEL9wuY/OOwANa5c0E+9ZGunXDVEYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zjcW3Xv0; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zjcW3Xv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcgOZ3NjlchP8j0pGZrIsb4pA9fXwntTpe1KZi/5LD8Ti6z9vGDzXZzbZEh/JDwbu7J6eFpuFtEHIfieWXMt1WXFtXKXILxvd1YaFkXD40t9sVXY8eNJf5E+Nj7UWIK4p9CMFMfBrID3o93AqEx8WqTa9ltztaRacfLHKJyACdV1DWzM46iBGh2tsrMRY/fIE33N9u7fsVuUWPG/B1LlTfNOydPxdUsM4ogwKfiXwKrEI+ODwz+ybSzo4HnmgYjo/0RP2gjprygk9GcqTseO5gOYWsNKn8y17TBJ6DySa6GUdrHVuRH126jmlK0650AYqkSIPjuYJf7KI+WUFxQaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NRRrzNpKBP46wjk+Dy9R/Bp/klSd2hBAMNTzVGLn+U=;
 b=JqxcuFyk340PCtrj/KZJxKySnaXVtJesZg37NBclMI0eiB0sAWkaeHC+rimUPyMAEHPbjidhKUJyqhX1SyU8z22tEK5ZHzH3N2Lndj0kiH+rw5RI+okRANkK2bRsKoat4Uypynv9D6HX9EuG2D3kFTwM7nSnh66u+4WCbTPe7vN7IxxOSI5AM5mFBnCCRNV8TeTAo6GxKn1y5MO5otpiMjCDhILl1cbzKYQzzD4bMskTUv+Tx2aANXKIC1xSCJWi4qy7p8N9CB7P0dJ6jgdAm/bB5cQxStuyAYZ2xPKw2N8BhP4ilIaY38Y8X5by9agqz4SbMjP9MGcXii1e5d/ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NRRrzNpKBP46wjk+Dy9R/Bp/klSd2hBAMNTzVGLn+U=;
 b=zjcW3Xv0JIj/y8krEtonYBi4kbP0636Q7inrIcPs4F5QOewx4X7NS+Bew2dbLz1FubQ22uvY3dRN5hfidmY6zickh2GAZ76j47kmc6TNBWXSR1THwfNciWLXDeDcqToANbkRcQV2I8Y/oAtBMv748zafAHBqq1vCj/PsgQg547s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 06:48:25 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 06:48:25 +0000
Content-Type: multipart/mixed; boundary="------------0qTclbB4tDeXKYDEMYqRTv6Z"
Message-ID: <a67db238-0ca6-4725-abb2-dc092de87e1b@amd.com>
Date: Thu, 8 May 2025 12:18:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 7893/8235] fs/jfs/jfs_metapage.c:245
 __metapage_migrate_folio() error: we previously assumed 'mp' could be null
 (see line 235)
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202505071850.XaOkcCkX-lkp@intel.com>
 <21037c25-b85c-48fa-bdac-27cb3be2ccdb@amd.com>
 <aBxDbdW9KNe3mBAB@stanley.mountain>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <aBxDbdW9KNe3mBAB@stanley.mountain>
X-ClientProxiedBy: PN3PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::17) To MN2PR12MB4270.namprd12.prod.outlook.com
 (2603:10b6:208:1d9::21)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: f252d494-e380-46a9-aaf6-08dd8dfc54a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDVTRUhtd3hrcFhKYmtYdXQvL1pMd1h2ZjBlVWtBN0xXQWUza1lYeDR5VjBZ?=
 =?utf-8?B?V3Y2YmdibE0wMlJ1cmdRV3N0YkZTa3M1UkNzZVFnekk3R2I2QlViOHAxTkNl?=
 =?utf-8?B?M0VzZ2haS3BHYkVNV2VaUEFUdHZYaWpvalVDRkkxdVRQYzBwVjVHckxVaSs3?=
 =?utf-8?B?cFNaZ3FQay9sdVNCL0tJOTllVUhZQXZQZWNqZUxZbHJZbEhSQ0k3VndzeTVC?=
 =?utf-8?B?Y1M0MjJ2L09kSllFTFVWSFpXTndnajg3NUlOaUJXZFlDNlo3d1VvTnlDN0hJ?=
 =?utf-8?B?TldHVWNiWWxYVTJZY01YZzdNa3hCRW5nMHdGQXQ4dlFYYnpUMFZRam9JUzB6?=
 =?utf-8?B?b3RaaStMbXBWMXhCS3ArazdJcmFVSXVGVW11eG5ZUXgzTDZId3hOVngxYnBV?=
 =?utf-8?B?YnBoVUZWTjI2OXkvU2Y2emJrNkpwSnJHL09KY3BGVUtnQjNUcDAvV0g5M01v?=
 =?utf-8?B?aEE5eFZrdHFaRUkxbXZQbFpFMzRQN3FuVVpKaGJRTlNvL2lES3hlaStvd3pN?=
 =?utf-8?B?WStsSWVKQVVLR09BRnhFY3NZanZ0T2JmZ1dPSXdrTnEzcTQzMHIxNk9mU0Zv?=
 =?utf-8?B?eXc5akdiM1kxeU5kNDNIdWptUlhEQTJwNDUyN29hdXkyQWp6VlN4OExYLzZa?=
 =?utf-8?B?bEpablpGSjluSWpBY25kY0hpR3hHcVhsdUZUM1lxOC8yU2tGSWtjdGEvK0hW?=
 =?utf-8?B?cHFHNUY0WlZFa21BUXVIQlhjQjcyZEFTa2tGMU5VODBXQmVZcUFPMm5tNG5Q?=
 =?utf-8?B?ZDUwMENuU01td3RseWgrbVcxRG1sd2RDU0M5am10K3dqTytRWVlZd1h3YjI2?=
 =?utf-8?B?SFB3Y245cnkrb2FJc0RvYTJWUDNGcnhrSWVBRmFFUEpsYjdsM0V0c0E2YTlR?=
 =?utf-8?B?dldGNlRXY3ZpTjhoQndKVDJ1b0x4d25vVVo0N0NoWG1FNFNuLzVhM3Nqell6?=
 =?utf-8?B?NWlGMFJJTXkySWJJTU52SVRuQmJpMVlvQ2lHbFhySnViVGR1aDBvVk15emM1?=
 =?utf-8?B?eGNkRnlxT0tMNCtnWm9oNm9uZjZUNVY0VlNDT2E1NytvOHdZcjVKRnJmVTM2?=
 =?utf-8?B?V3RjRFJacFdSWU5kM0lqVGVlc3d1SzFFTG5KR3RXaHZ6bTRIcmtMYjJhRDE3?=
 =?utf-8?B?QnFuWEZTaHo5VWRKWWJpSzhZRm0vYUVYNjcyb2pLUjhCSm1sYTNMeFpseFRy?=
 =?utf-8?B?OTBUUERQZi9tdFBjVWpOVU9QcE83Tzl6L2dHRmk1ZERuZ0lzdlhIV1AyckpH?=
 =?utf-8?B?ODVqcm1KRWlUaXRxSjJjN1dpcGtwRTlRNjVRc1ZjYXUybm0rdDZhQnBlOVh0?=
 =?utf-8?B?bFRVc2dNenZZVTV3NlZQa0FidFdySGRtWFNMMlpMUjhHNjRBRFB1R0srWXcv?=
 =?utf-8?B?RUo4dHdwakZIMDlWQVpNb2NVWHQvSXFHanBsUERQMFd6NU9YN1lJL3hyaVBj?=
 =?utf-8?B?WTREWnpxNUZES1ZGRmIyK1NJVkoyYitkRkd5NUJNMGVES2l2VFNwUk1sb2ov?=
 =?utf-8?B?dUk0TmJFRCtYU0ZMZGh2dXUxazJZL3BHY0xKWjBjNWUweEFBT3NYdGQ1REl2?=
 =?utf-8?B?S2dDNm16N3FzZGFyRFYwMUIxL3g0andBdkFiU1dWd1Zkc1JHcmptTE00M2NV?=
 =?utf-8?B?aDlydjk2ZCtKWituZnNKRktyYkpXSFlYcVFNczBQQnlEYzNBWS9ySDl0UEdw?=
 =?utf-8?B?cHVJV0g2T1lPZERKNmFLNlhDRUtNbWpEZDBBaFZHT1pGa0hJOXdVTWNsSm4r?=
 =?utf-8?B?UGdSSEVpb05ET2ZLdVpMSDlxUzBWZk8yL0taL3krakVqdkpGU3hNcFBBTThZ?=
 =?utf-8?B?Um50eWR4MjRkZWU4eGFBZm9DVEpObml2ZUpDU2NsV3VsLzd2dVc0enRZeVp3?=
 =?utf-8?B?ektYNk0vZ2trdVpBREwrRCtaVytPZUw5U2YzekxubDdJWVluT3lxLzd0d25o?=
 =?utf-8?Q?RZPE4GLCmGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFVZL2V1YVlpS2lVM0lxR1pTWU1iQ1ZrVERPa09hQ1dtSjlqdldnV2JBV3hS?=
 =?utf-8?B?ZHErSmE0aG1xcmMrOFFaYnlTUVZwZHVzU1RubHYvcy9FV1orWncySXpVMXdz?=
 =?utf-8?B?N2QrN0lZNWo2VGQ1a2JpUUgranl0dWRSWnQycitkWDE5NFJDVy9SOHNWRWZi?=
 =?utf-8?B?WUZEWkppSGd5VzZ0RUpFT3JxQUNuRmxCakYvQVc2UEM4YlFNOGgwNzl2SFZT?=
 =?utf-8?B?WWorRTZIUXd4alNPMFU0eXFia2Vobzd2b0RmVTB0aWwrRVVJaVhTeituRWpZ?=
 =?utf-8?B?ZFBFang5RkJwU3ZBMFVZM1VyajJFR0tWTHlNak1qdVFsSjkzZmdvR2pJMTQz?=
 =?utf-8?B?NGY4ekh4OU9vZ2xBOXJIN2VFTDlhZ1JsNjRzTzR1RWlScWlETWhmbGFFRS83?=
 =?utf-8?B?NXBsNmo3d05ySHM4RlNJZmpjUVpmUzJ2NlVPTy9xNjgzaXQwRDhOZkpRWWNi?=
 =?utf-8?B?TmRnSzYvWHgwczlLQ0pid1FCZDN0Q2E0NUtXY0tsTTNERlRIRVlyY2l2c1FV?=
 =?utf-8?B?MndHaTBQMjFpVzZ0TUpHbjZ3SFVQY2RYMis4MWZoR1RPN1FSWUUvS0lCYUNB?=
 =?utf-8?B?VlM4WUsrOWlZYUU3V1hldHBtMjI5UEVGT3BiS1Z0eU1YOStRdHQ0ZVNHajJh?=
 =?utf-8?B?L2dFYWNJMWhES1phT2RCY1dKbFBybWxHYnl2RjhzYS9ETXFDeDJqWDN5c2pu?=
 =?utf-8?B?bnFaWjhYbkN5ZkdFakNLRENwQlRCRXU1dU4xUk9CRDB5ditHU2hDajFZZDdR?=
 =?utf-8?B?WS9McTBTRFdVN1ROdDZGMEh1L3dzT0VYK0FoQkY4SDl3M0ExdFhuNDlCd0Vq?=
 =?utf-8?B?ajFtaWpzU3hpeTVYa3BIZi9VQ0JrNUtlTUkxWnQ3NDR0bHk0Z2xWN0tJRkk3?=
 =?utf-8?B?T2lMQUdyODBlRFl6UzI2b0wrRC9ZeTNWMUM1THFIUVBhdkxOemFyc0tOQUNk?=
 =?utf-8?B?dEhqbVlZTnZ4Qk1MWk9aTWp6V05RL2Y4cUI1Q0JWeWpBYnp1ODl5S0tOcWpn?=
 =?utf-8?B?aFp5bExPVTB6MmNRVEdWYXdUeGg2THNtRHpCcENCeHFIaWRhLzQyMmoySTla?=
 =?utf-8?B?YjFQRkF3SGtkMnMzcWQvOGkwckdvd21zZzBVMTA1a1Q1ZmZncTFndW96S3Vn?=
 =?utf-8?B?ZXM3aGNGNkxSM3loYkNhWGdLQmp2RGxjcXphRkVadEVDQlVCY0hYbmdRQUJX?=
 =?utf-8?B?b2pHR1hOZjhodnZSK0Eyd0pNRnZNMUd6S1YydWxqcmJveEdPalZXdVFSTmRp?=
 =?utf-8?B?dFAzVGoxak9iM09uVDltM2ZhTHdvbkhwNzQzSzNOa0I5Y1RTYUprY2VSbTFL?=
 =?utf-8?B?TU1aOU9mMW9VUjg1Tk5YQTJVVDZQVHdLZk5SdGVrTHFrK0pNK1E3WlBxTFBU?=
 =?utf-8?B?TTl2d1ZhMWNaRjBCR2w1YUtjTzYxOTNvMFlDS0Uya0VibUVYSFlhdkNyMGE1?=
 =?utf-8?B?bGdBelhobkRPNVJuTHc3SmpHanZXRlJBbGg5V01XZDJFdXM1ZzR4M1JtNDJN?=
 =?utf-8?B?amNTNEhmK2pnM0RJK2ZEbVJRWWo4d2orZkY1SDZONGtZcTRTb0Q4R2ZJWHZK?=
 =?utf-8?B?OU5PZmJCMWsvaDloRTE2YWFZRFFENGtxTGo0U0VkZWtXVEhRWk5CYWxQTERj?=
 =?utf-8?B?RW03R0FsTFJ5TzB5dXQreHRXSW1mSzNqa0hkMzk4cFJFS0VSNTFOWWNCZWcx?=
 =?utf-8?B?NkpaWjhzbHVpNTJVZzNLUGQ4WEcwQkROOVBMalg3cDFFM21Ma3hOUTJUT1NE?=
 =?utf-8?B?S2hBVVVNTXZBQm1McnZVZS9Tb1BGdXpJT1BmOFRVeHd0bkRhOGc2RCsyVXNL?=
 =?utf-8?B?dnVrQlJyc1h5UGV0ai9xdUtqQkNUSkpwRzZ3S1NIRjhXMWdWWks0WktnQitk?=
 =?utf-8?B?N3J5SUFnenlnS0ZJbG5FaVZpVGFhZU1wYmYrQldJT3kvVVlROHRLcWk3UFUr?=
 =?utf-8?B?dEZWcUUrRFc5Z0dzcFVNT09Tc2VPejYzZ1lKdTFLLzBmeVY4dkNJcW1Ld3dG?=
 =?utf-8?B?YXFYYVlyZUI5QzlhS042aGxNYXplOXdGRlhYQ1YwRCtOR0lkYVJ5SlY3ZGl3?=
 =?utf-8?B?RkplZWNDeVNFZitXalhiaVNuaEU1TXhSdDRZOEc2MFJDK2FqUkdxdk9QUmx5?=
 =?utf-8?Q?X5TtdVDXKtpR9HpPdqoq7qhlz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f252d494-e380-46a9-aaf6-08dd8dfc54a7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4270.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:48:25.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fx8W2pmKDeD2P52Suj8Px0u43VOgyUV3tQzJNGD/F4W0FZbpHxOMSYcizQ17Y1cugfeziH8tMHeYvr/MaNcxPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

--------------0qTclbB4tDeXKYDEMYqRTv6Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/2025 11:08 AM, Dan Carpenter wrote:
> On Wed, May 07, 2025 at 05:19:52PM +0530, Shivank Garg wrote:
>>
>> Hi Dan,
>>
>> This is a false positive.
>>
>> In metapage_migrate_folio(), it checks if (!src->private) and only calls
>> __metapage_migrate_folio() if src->private is non-NULL
>>
>> static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
>> 				  struct folio *src, enum migrate_mode mode)
>> {
>> ...
>> 	if (!src->private)
>> 		return filemap_migrate_folio(mapping, dst, src, mode);
>> ...
>> ...
>> 	return __metapage_migrate_folio(mapping, dst, src, mode);
>> }
>>
>> Then __metapage_migrate_folio() calls mp = folio_to_mp(src, 0), which returns src->private.
>> Which should not be NULL as previously checked.
>>
>> I think we can skip the mp != NULL check from 
>>> 39ed4d1a0e03ce Shivank Garg  2025-04-30 @235  	if (mp && metapage_locked(mp))
>> It seem redundant here.
> 
> Yep.  Just delete the unnecessary NULL check.
> 
> I only consider these a false positive if the NULL check is
> required but it doesn't lead to a crash.  For example, there could be
> another condition which is equivalent to checking for NULL.
> 
> 	if (p)
> 		p->foo = 100;
> 	...
> 	if (!p_valid(p))
> 		return;
> 
> 	p->foo = 99;
> 
> In this code, if you have the cross function database then Smatch
> doesn't print a warning because the NULL check is not required.  But
> the cross function database is way too slow to use in the kbuild-bot.
> 
> regards,
> dan carpenter

> Yes.  Right now the code simply looks wrong:
> 
> 	mp = folio_to_mp(src, 0);
> 	if (mp && metapage_locked(mp))
> 		return -EAGAIN;
> 
> 	...
> 
> 	page_offset = mp->data - folio_address(src);
> 
> any reader of this will be worried.  A code comment (at least) would
> save them concern and time.  Reworking the code to eliminate doubt
> would be better.

Hi Andrew, Dan,

Thank you for reviewing this and confirming.
I've attached the patch for removing mp NULL check.

Best Regards,
Shivank







--------------0qTclbB4tDeXKYDEMYqRTv6Z
Content-Type: text/plain; charset=UTF-8;
 name="0001-jfs-remove-redundant-NULL-check-in-__metapage_migrat.patch"
Content-Disposition: attachment;
 filename*0="0001-jfs-remove-redundant-NULL-check-in-__metapage_migrat.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzNzY4OGUwMGVkM2U4YzYwMzc3OGVlNTI3MWJiMTJhYzExYTMyMjQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2YW5rIEdhcmcgPHNoaXZhbmtnQGFtZC5jb20+CkRhdGU6
IFRodSwgOCBNYXkgMjAyNSAwNjowMDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGpmczogcmVt
b3ZlIHJlZHVuZGFudCBOVUxMIGNoZWNrIGluCiBfX21ldGFwYWdlX21pZ3JhdGVfZm9saW8oKQoK
VGhlIE5VTEwgY2hlY2sgZm9yICdtcCcgaXMgdW5uZWNlc3Nhcnkgc2luY2UgbWV0YXBhZ2VfbWln
cmF0ZV9mb2xpbygpCmFscmVhZHkgdmVyaWZpZXMgc3JjLT5wcml2YXRlIGV4aXN0cyBiZWZvcmUg
Y2FsbGluZyB0aGlzIGZ1bmN0aW9uLgoKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBs
aW5hcm8ub3JnPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA1MDcxODUw
LlhhT2tjQ2tYLWxrcEBpbnRlbC5jb20vCkZpeGVzOiA3MDhjNDU1MmFhMzcgKCJqZnM6IGltcGxl
bWVudCBtaWdyYXRlX2ZvbGlvIGZvciBqZnNfbWV0YXBhZ2VfYW9wcyIpClNpZ25lZC1vZmYtYnk6
IFNoaXZhbmsgR2FyZyA8c2hpdmFua2dAYW1kLmNvbT4KLS0tCiBmcy9qZnMvamZzX21ldGFwYWdl
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9mcy9qZnMvamZzX21ldGFwYWdlLmMgYi9mcy9qZnMvamZzX21ldGFwYWdl
LmMKaW5kZXggN2UyM2RiMTQyYjI3Li45MDI5Y2QyMTY5MTIgMTAwNjQ0Ci0tLSBhL2ZzL2pmcy9q
ZnNfbWV0YXBhZ2UuYworKysgYi9mcy9qZnMvamZzX21ldGFwYWdlLmMKQEAgLTIzOCw3ICsyMzgs
NyBAQCBzdGF0aWMgaW50IF9fbWV0YXBhZ2VfbWlncmF0ZV9mb2xpbyhzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZywKIAlpbnQgcmM7CiAKIAltcCA9IGZvbGlvX3RvX21wKHNyYywgMCk7Ci0J
aWYgKG1wICYmIG1ldGFwYWdlX2xvY2tlZChtcCkpCisJaWYgKG1ldGFwYWdlX2xvY2tlZChtcCkp
CiAJCXJldHVybiAtRUFHQUlOOwogCiAJcmMgPSBmaWxlbWFwX21pZ3JhdGVfZm9saW8obWFwcGlu
ZywgZHN0LCBzcmMsIG1vZGUpOwotLSAKMi4zNC4xCgo=

--------------0qTclbB4tDeXKYDEMYqRTv6Z--
