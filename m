Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210CE2DA75A
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740311; cv=fail; b=br58+Z3/4Hwe4vf1gc81dZiJ3nVNBStZfdqIqAK8/HX8SrcxwmtNIWMQIakxJTkFqr345SQp90zKN68PV0/J9CXddcCqIowg+W8oH/4penThqHKsFaGMWzTFJyFQadDgP68MkD4b6xYSXFV7HHU8JLZehiTND6F7ILqCtk3nj2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740311; c=relaxed/simple;
	bh=QEpWUZrF2CyHIYnINqZbkxiIOvEVW2aGSRIqriVhemQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q6Jswb7S4ItspTPW1Ks5A+FcpKfSDMt4WS5kLdMAYyAEXJdQdYvzJL/MAnJQZjr21tPKa/YwWr6e+4p/F2kVHPpI6fs0KUx6CFUvzrUZ7l7EPez0003GkFuXDf3VTt7KkM5P5TiUzRN5iYW58WvwpEbUcZavFpfGGB9/LWSjZZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXz1wlM7; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXz1wlM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770740309; x=1802276309;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QEpWUZrF2CyHIYnINqZbkxiIOvEVW2aGSRIqriVhemQ=;
  b=fXz1wlM7F4hefX1frUosCNyELpBsxL8tcOrqJLPTAZG06ajl5F/iZhfk
   QDLEBZZNtRllfHicgC3TbYRnF7sjy795zDzpP2YVhFjAaokLF7KFtxHOV
   98Vs4RNsER5mj3/g+yfdhCK7iUkaYGnyiyiowCLVdg/cShPqtCYd5wose
   qNBE/cen5MwT576DSfOfc4KY5Sh6K8OlXIz1gfPb5FbyQWfJ0cE2b1psS
   uoY7IBf7z9KHssiIuL8C/n+ErYLnA0WAG8Jz0V+0b+mhX8EYLWbo5luAs
   TkaQ5UNIuueFtL4XESoFWmhl10rA7hTbH2iTG6/WLrfvD9sCK6yLTjoV0
   g==;
X-CSE-ConnectionGUID: 5rES4HTaS2qytjogAbjrKA==
X-CSE-MsgGUID: vaQ884UTRRO8OQWVWEwDzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89464075"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="89464075"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:18:28 -0800
X-CSE-ConnectionGUID: uzsIXiviTEuWRapb70hSww==
X-CSE-MsgGUID: fU2T2ripSU+eDfSYxhEuKQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 08:18:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 08:18:27 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 08:18:27 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 08:18:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbhZikSZDGE4ykIpp9JTtlFhyBktTYwQPvSrx3w/ZUynZrqXa2sQ/GKtXimRzlcJO6KB4ckX2UBmYJmMl8A5IyQAHdH0dKPu0XMh7KGsFjZXZHcBgO/a0MFsucZfpVay8tLfIdJChgW7JeEyIp0H1/oIj4gap7qIQssjBiNW1Ns79OI1O1ZI7JMzDV0OU3Dfq0HP+WDNlpmtBnCLjA3T1UO88yheFuMmk9EyAVbEXnz+R2fEclxler49CW6+SCjJYlp17svwPqeq6CVscLEVh1OWSjHQ/yR7FVP00C3u6X86fJwbG/7FZ/h7EMtlP66GSgcxqniYzIrMYzjdt6cL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCXPCpSTdgMYKu74yROGOdi48CsuMVi8zPxVOerMrwI=;
 b=a/SjYEDcKeFxgfVT2dpxGMB1HqQdnUsNsyfXV4GRsDwdDkjT7TnztT2/YlZ+3aMM4NM1RqETJAQFBXFicRHXeP8yEBHZVsx6j++hjYF2JDJhCQprwXeY7+hbNh7d3nU1+YHxg0yJSI7KhYgCU1oS+G/cTFQu5CeyMooy8/kaWz3nUjSlj8qXmoM0K5zjMUGrtihjwXVsdT/Njfrz4OrA+z/SzvNgoiaCmVWRGb5H9vN2Mrf+PD2zIfQxJqjmMJrdtfUK+ZqsbGnZLmxEq5AAXTf62qKUTPGr0gAdFcw5E0dj/B8X1bsFOC1uXsK41nFn3/J5LAV40775tdRvLezWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8722.namprd11.prod.outlook.com (2603:10b6:408:207::12)
 by IA4PR11MB9297.namprd11.prod.outlook.com (2603:10b6:208:56f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 16:18:25 +0000
Received: from LV8PR11MB8722.namprd11.prod.outlook.com
 ([fe80::b10:6045:9014:a81c]) by LV8PR11MB8722.namprd11.prod.outlook.com
 ([fe80::b10:6045:9014:a81c%2]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:18:25 +0000
Message-ID: <c6f5022e-9dca-4d36-a821-8ff3261b5c0c@intel.com>
Date: Tue, 10 Feb 2026 17:16:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: include/net/libeth/xdp.h:1315 libeth_xdp_process_buff() error: we
 previously assumed 'xdp->data' could be null (see line 1310)
To: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>
CC: Dan Carpenter <error27@gmail.com>
References: <202602101205.Ce7wRn0m-lkp@intel.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <202602101205.Ce7wRn0m-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::11) To LV8PR11MB8722.namprd11.prod.outlook.com
 (2603:10b6:408:207::12)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8722:EE_|IA4PR11MB9297:EE_
X-MS-Office365-Filtering-Correlation-Id: 5468d6e1-28ff-4222-7140-08de68c0044c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T041T2dtZ1NxazhXZDJKeXd2cGJNRmRLeUFKZFUzTmNjSHgyZXdoOTkxYjdG?=
 =?utf-8?B?SmdCNmJJbEFyeWpjZURTajBYcDVHWDlLeFhsWnk1UmhMU2QySm9GQ05VYmRU?=
 =?utf-8?B?ZXlZRG1mVUVjYWtZQzNqTmd5UEdRWk1KLzQ0Vzc5RkxZeTl4R0dQek1EeVI4?=
 =?utf-8?B?NkgxRlZhNDY1NTlUd3F6Z1J0cEZvQ3FZRFFMTkR5YXRleVBSdnc0U0RLS1dv?=
 =?utf-8?B?RTRTcUI4d0Y4MWV2endKYU04OFYza09YUGVsaUJBek9aL2QzZ0V5bDIwWWs1?=
 =?utf-8?B?ZGp3SjRkZUFMNUx0VENUSC9KL05SdjM1MzNtMGpxcmh2MG5iZVBUTERDaGI3?=
 =?utf-8?B?OENPeUZtSXVYSUxYemV5dEZKQWFXVTVycVIvQlMzVGo0WkFJbG5xWXdHdnI0?=
 =?utf-8?B?M1JPeXo2WVd2a1M4ZzJ1aGZzcmZhTjIzQkozenZyRUpXYWUyZG00MStOOEtx?=
 =?utf-8?B?bERwejd0dm56eXpzQ1pxQzRsbnNzMXZhWWV5Y3daMkRocndPbFNLL1JyTnNp?=
 =?utf-8?B?WTdhVnQ1M01xd09rZ3JiUmUwYW5oY1l6YXdZZHQ2UWlhQkRleEVLMEZ2UUlo?=
 =?utf-8?B?Y0dVS05rTlpTWitxcG5VVFo5ajUvem05bVFhWDVuL0RSREdHeFZRWStWRkRv?=
 =?utf-8?B?eE0vV2tXdloxc1MzOHdKbnVXNWdhbWVJZkFlelNQZnFkWnJqUS83c1pEajky?=
 =?utf-8?B?T1NVd0NqbHhTSHRneTdDQTN3ZWJCY1EvdlZRMnN5V0JJYjlNM0tXQmhneExI?=
 =?utf-8?B?WUdXeitIZEhBc3JKUjB3eHlKN3dTcXdpejVQeThqODNJWUhFc3RiNXpLaE04?=
 =?utf-8?B?YnRES2FRRDdRb2k3MTUvVkQ4eWlrNlpMcTlRWXhPZSs5Z3hlbWJzSDh4Y05s?=
 =?utf-8?B?VHR2YWFlMUFMSENlSTR1ellkSUZ5bUtUMnAzNmFhMnBiN0NqcHpSdGIzMlZo?=
 =?utf-8?B?bXRaNnQ4MU5hVmg1SFlqSGZrN040SEQya05KSzVrQjZQZG5tYk9qcHM0elFD?=
 =?utf-8?B?c0ZMMFU3cWt3bE9ZVXlyK3Vab2xtS0tEM29NZmNpRERXSXZNZFhETTJ1aFhk?=
 =?utf-8?B?R3Y2Ym95UnBwZkNSdFRZTHdOZDFWam8vaytOc0V6TXo3aDN2V0JIYzVwU0o4?=
 =?utf-8?B?VzFPY1FDb1IyNzhFQ0VsTUFHRUxYZ2hwUEVveHpIYjBxMFZydlZ4dlE2U3I4?=
 =?utf-8?B?UXQvZlo0cWtqZHg0bi8xcnhNd1RJOUxJTjVFRzNJdXNPbExWMG1DNWRoblY0?=
 =?utf-8?B?ZVpHMDJvOFpDRlh0cC9DeFMybWhTM0dvNXh2U2pxYm5CY0JKZnZlckJvTnhF?=
 =?utf-8?B?NHNvbWFOZUJ3SGwxQlBpT2tLcmNlZnJFNCtRcjU3WTNZcHlVRFhWRCsyUlla?=
 =?utf-8?B?ckpyYitnNmNBRlg0enFMRHBRQitpamU4M1l2ZDA3ZDIvcXFoRDdQT0xiM3Ju?=
 =?utf-8?B?RXRwS0FsamtvRVFmNlpIa1pmTmlFcUpVRThEV0JzK1RkRk4vc0ltY3pGdnh5?=
 =?utf-8?B?aWpXdmVsMHczbStscDF6QUNZSWJkRW9zNVpUQVVXMDhFVzRWam9rT25mN2dY?=
 =?utf-8?B?bmRTNXU5MEk3V2hoV2lCWnRqTnZBVldsanc2ZzE1Y0c3K1VYQkd0WU5xdWxk?=
 =?utf-8?B?dXZUZlZMd2dtSUtXK3hJTkJGcUowamVKV29RemdWWFFmTy9IaW9jak5HVU1E?=
 =?utf-8?B?LzFtK0xsMlRxTUNuMTVkR2ovM0dwelpTUWliTHNJdTU4VVNJYktCWHMwSXRr?=
 =?utf-8?B?YmtGNDMrYUc2UUlVSGJTbnZTaG1WN1dsQkNkSjRXNVdSbmpWMlA0V1FwbTB4?=
 =?utf-8?B?dTlwYmhMTTF2Nyt1M2RaVHJhQlhxN1BxNnZ4U0p3R2w5dHJ4NlJvY3A2NWdz?=
 =?utf-8?B?dUx0ZU0vZFhSU0JwZitPemF6a1lwUlcyc0MzQjJzWENNVFRqVmU2MXlzUGRz?=
 =?utf-8?B?RTRhbWRKSWJtZ3pQY0NLYmxKMG9hYjhXSy9valA3bE4xRmN0S1FyUy9OSlZh?=
 =?utf-8?B?MFV5YTE4SWZJcmQvY0x5d3ZGQXVSaWJLWnFrS2kxdklBL2VMQzNqT0VBdzhE?=
 =?utf-8?B?cW80Q0RkQ2xhdk8wOHRRZTRjK1hLY3lKZXZYbHRyTXJLZkpqV1BhR0pjTWQ2?=
 =?utf-8?Q?9m2XJteRyj5RLXw6hQsYYP4mM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8722.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkRpRHF4Q0xIQm1ZU2kzNzg3TXpFenhSVEFOS1p6eVVrMTdhakpNc1d4bEJw?=
 =?utf-8?B?cCtzV04zVDJNWjZJQmQ3cmRuVzlFY0dmeHFJcy9ybWlWVVl4aWFoR3laem5V?=
 =?utf-8?B?bUhTWC9rUkN5aTJZL05pcE1zaDhKT1dEVERJWm1wUFFad3pwaFdkUFN5RkV5?=
 =?utf-8?B?ZkdYcEdBWExuSUV0aGZGSHBTWHlDbkpwWHNhMHBSWmhLOW41bThUaldXaGRF?=
 =?utf-8?B?U1l3TG0xY2dZazFhY0RnYVZ4alVacFAzOFkyendqYmRvUEZ0UXhYdXhIbmFU?=
 =?utf-8?B?dVpmSzVTSm51emJNc1ppeHhLek1GUkkyU0NiOXc4akVGNzZYTCs1cGNzN09M?=
 =?utf-8?B?eVQzZVBJQ1pDV3Fpd0NWWmxaT3lRY0hJU3Zrc09FVm45Z084RDBkeGo0eXVp?=
 =?utf-8?B?RjBuTnF3aW5kbjNRS3NzWndSaHF2R0QzNUwzRGFnV0tqV24vUVBrUlJRNTQ4?=
 =?utf-8?B?NEdRcDR1ZU80UlRuUVBzNEkrM0ZOV2pJYXFwZ2JlUzlOTnF0QitjcHhoeExh?=
 =?utf-8?B?U3pqZ1RwN2MwN3VmNU96elErdkJjb09oYytpMmRTSStvTk0xVXZwejRHTjhl?=
 =?utf-8?B?NUJ6ZjJObEVVejVjd3BPOW5JOUhRY0NvZWtpYmUrVnZFYUxJZVZmZkxSZHp4?=
 =?utf-8?B?S1phNUMrVjZ1cVlybjNOemhZWWhhQitzQVZmZEtuaHR3QTQwTURMMnRNOXQz?=
 =?utf-8?B?YjZJbGF1SWlKWVdtWmwrMEFRMytyT2x1cFJLTm9qUmZHK1I4d3U5T081MGVm?=
 =?utf-8?B?WEVkMUJiUG9BbHpJL1JZZHFKTlpjek5JbkxIdG92YXE3cXNVMk1ITXdsVXBC?=
 =?utf-8?B?cDFqTlpCUFk0N0o2dVpXTXNSMzd5T0VoU0kyYnZwczFzaEF6c3g0dXppaEF0?=
 =?utf-8?B?UzNyb29wTGpOVEJzc2VqQklOdEtFcUV6c0UvbzVQdmxmNDVESGx3ak1Qem5w?=
 =?utf-8?B?MjMyWWFtU2g5N21Hc1dHcWUrZFpzeVNCbGtwSXgxV2N2ZzZGeExPZVVsTlVR?=
 =?utf-8?B?ak5QM3VCRXpKUi9GcGUrdlZpTWxPcmhNeExBbC8rNHMvRC9pUHQwRjZ6MWhx?=
 =?utf-8?B?RDFKc1BwOVR4Smw4TFU0TEszaEJHcjNvcVh5blFPeHVWaVRWc29wQWNxcTBu?=
 =?utf-8?B?VGdrakRoNUtZK2FWNThqNGE3bHMrNloxUDVoK1dMWDdPR0JuU2RaSHNIT1Jo?=
 =?utf-8?B?K2xvYlhZdW5mbjBLNTJaRkRITDN2TFBIQ25yWVFpVWExQzk4Z0hFbGhuY0lD?=
 =?utf-8?B?QlNzbi9xcVowMEtyU3ZXYWpPdGkxa0RjT2p5YjFWZWVuVWExSTg1cXlMSVhv?=
 =?utf-8?B?K2lhY09iTDVadGpHU2NQb0szY0h0NWNNUmJoQ1k5YVZhUXk3bDliTlVsRWpl?=
 =?utf-8?B?MkZQQkd6ZHVMcGNIK3A3Y3hwMjRhZnl1L3hDbDdib1JuUHpZTEZkRFprWWlO?=
 =?utf-8?B?UWxveEY5ellyUUpOOUhIRVBFSS9mUnJ3UFRCTmQ0V1M3eFh5VWIzYXFsUWRJ?=
 =?utf-8?B?bVVOa0MwT3hqT0FVa3JZS1RaWGpGOGVMdjBXc0pMd2RjdThwU054ZEVKRDRs?=
 =?utf-8?B?KzF2UmlEQ3FoYkNMN05DYUFJSFU4N1BBL0ZrSXNrZWZnd1l2alY5Q1loTUph?=
 =?utf-8?B?WEl4RzVlVmlaVUkyL2NJanB3MnBjdUJWN0xQalZCT3R5TlpzQXo4MVVsK29K?=
 =?utf-8?B?aURmZXd3OGZnMFNzWXdHN0h6WkpUUGRGNEpEc0U0ZlNuWHIrWFQrVTZwUXh1?=
 =?utf-8?B?dmJWUzdmZGY1a1ZZL2hmem1lOWhJVkxneGF0MXZveGJubzJDN0dReXFqdDNV?=
 =?utf-8?B?ekVyOTRoOXpPRG9NRVRySDZFSnArSlBHenVBY3ZmQzFwNHVvNnVqODVDRTQx?=
 =?utf-8?B?b0NZeTVGWlhyWXJkNFZ2ZCtHd0NSRGxFcTdjbHAzaWF2cmsxazRGQXhxNm1l?=
 =?utf-8?B?MVdLNlczbmIzVXV4NlJCamZXeWZLZVppL2JFTjFmTEV1VW1NTnBKbkpnZkRN?=
 =?utf-8?B?TDFsMDhhcmdBRFFvTy85RWU3ZVB6cm12RGI3UjJiSlN5U0xyY21tR29PRGM4?=
 =?utf-8?B?YnRLOWZxWlhHcVl0a0ZETzQ4b3h4dHhBZUU0Wm1aZ1VEalZZQTkyTjJBL0lC?=
 =?utf-8?B?N290ZmVseXNESy8zVjZrcXlOZ3dUU0V4MzZHdmdHcElQWWFpWHIxaFNuZnNh?=
 =?utf-8?B?eU84ci9ES1ZWenp4d2M1SllnejhBYXpxeG8wTm5MVVptanA2UUVhUGNRYkFZ?=
 =?utf-8?B?cEowcDRtRWs5SHBoOERvYXBneHZVSGtwL2VLTnR5VFVxK3ArT1loSHkxU1Z3?=
 =?utf-8?B?azd3QWlqbFE3aktmYU5ibjd2TGhGakxacDlpSE9VQURzdjE0MS82T2U4Qndt?=
 =?utf-8?Q?B/JCmjZCqYauZDgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5468d6e1-28ff-4222-7140-08de68c0044c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8722.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 16:18:25.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOuX0F6zdEbFu+V0MeGrL0WsY8XfgGR5cX8mBQUpA3iktnAepD79NofHqe+JbabFsv098h9rFm/wqLarHhyXRTSeVA/kgqOTes0qM+f6M3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9297
X-OriginatorOrg: intel.com

From: Kernel Test Robot <lkp@intel.com>
Date: Tue, 10 Feb 2026 12:30:48 +0800

> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> CC: Tony Nguyen <anthony.l.nguyen@intel.com>
> CC: Alexander Lobakin <aleksander.lobakin@intel.com>
> CC: Jacob Keller <jacob.e.keller@intel.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8a5203c630c67d578975ff237413f5e0b5000af8
> commit: 93f53db9f9dc4a16b40ecd18e6d338ad57e4b670 ice: switch to Page Pool
> date:   3 months ago
> :::::: branch date: 4 hours ago
> :::::: commit date: 3 months ago
> config: i386-randconfig-141-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101205.Ce7wRn0m-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202602101205.Ce7wRn0m-lkp@intel.com/
> 
> smatch warnings:
> include/net/libeth/xdp.h:1315 libeth_xdp_process_buff() error: we previously assumed 'xdp->data' could be null (see line 1310)

Sounds like a false positive, see below:

> 
> vim +1315 include/net/libeth/xdp.h
> 
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1288  
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1289  /**
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1290   * libeth_xdp_process_buff - attach Rx buffer to &libeth_xdp_buff
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1291   * @xdp: XDP buffer to attach the Rx buffer to
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1292   * @fqe: Rx buffer to process
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1293   * @len: received data length from the descriptor
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1294   *
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1295   * If the XDP buffer is empty, attaches the Rx buffer as head and initializes
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1296   * the required fields. Otherwise, attaches the buffer as a frag.
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1297   * Already performs DMA sync-for-CPU and frame start prefetch
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1298   * (for head buffers only).
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1299   *
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1300   * Return: true on success, false if the descriptor must be skipped (empty or
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1301   * no space for a new frag).
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1302   */
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1303  static inline bool libeth_xdp_process_buff(struct libeth_xdp_buff *xdp,
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1304  					   const struct libeth_fqe *fqe,
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1305  					   u32 len)
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1306  {
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1307  	if (!libeth_rx_sync_for_cpu(fqe, len))
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1308  		return false;
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1309  
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1310  	if (xdp->data)
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1311  		return libeth_xdp_buff_add_frag(xdp, fqe, len);
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1312  
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1313  	libeth_xdp_prepare_buff(xdp, fqe, len);

libeth_xdp_prepare_buff() *always* initializes xdp->data, so there's no
way that prefetch() will get NULL.

> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1314  
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1315  	prefetch(xdp->data);
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1316  
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1317  	return true;
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1318  }
> 3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1319  
> 
> :::::: The code at line 1315 was first introduced by commit
> :::::: 3ef2b0192e8ba133f597919632bd9cf196076f0b libeth: xdp: add helpers for preparing/processing &libeth_xdp_buff
> 
> :::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
> :::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

Thanks,
Olek
