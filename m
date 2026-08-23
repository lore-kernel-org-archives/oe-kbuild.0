Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02D3D5640
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488248; cv=fail; b=Nu/k/wSfH23L5T+8K2becCD3dbydGEOqywK0TEu8u0yoTYrDT50u7TqrLTq5AsEPDx+YK7FSrZJYIqBEPDaimOdu11w/ih5HMZG8UhKhz6BfAJ0AQLuAnGWQXVdypwHomd4LLDwQ/R4tzkMU40Gcyu4UB5LxmAjeMlmsA12kPzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488248; c=relaxed/simple;
	bh=i0WT01Buj17ehwr+4QA1+RkEJXYxW10MiipRO+Msffs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UWiJEccCiBKXMxtMIuEk15RVAcdFCksiAGkFzGPqYTvGkd25F6gG1QQPmwSMRPYte0kId+dyuGbU/sjUousQd6zdTMe4Tta2t1y2aC3jKSDZhFHXYcwlqUF+vZB28oFOICcrsPPX3RwdOXclswT34mTy0lcq4Lnd9LFhIgxpcKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jo8BMIB+; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jo8BMIB+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488246; x=1819024246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i0WT01Buj17ehwr+4QA1+RkEJXYxW10MiipRO+Msffs=;
  b=Jo8BMIB+XSUF9O3s/bAY7Qd8Lp5lkqKOjTrodpSHp1og26hvJdOvgXQi
   6oViDqgtVRSzHE5JkI3HAQHwAXnda7hj1qAvBQA4ZNqlwkwOxgGxkjo76
   3mcy+SjKX8M69cwXR2LGNLYPozdgqMDdZweD4mTaHD9vk60K63ad4DL1m
   lWsCgW8xHATweSpgTiIiUwd4weWyNghhlsL/yRQGO3gVkIOks8NnPFdgB
   wG2USEobtXWt2LstcZxCD0AUIzEJ3EiSZ0BOJ4F8RfjxBDOheEArxkOOc
   /O9UzvHP0Jk9AZ0uDbYuVTwAiE50Njbb1Y5HFjKS46Ej4tymdVsYoG/kp
   Q==;
X-CSE-ConnectionGUID: 4gc9C6LNQd6hmZlHTmGcpw==
X-CSE-MsgGUID: DmaPVqA7SuqgbqM/yCMG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974907"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:44 -0700
X-CSE-ConnectionGUID: NIHFx175Rf6LnYDcNG6xtA==
X-CSE-MsgGUID: 8lcrotd6Sra19n2VgGmYeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993612"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:30:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8w9GugybfChYK+Z7WFknTdv+dezRh9sm8kvOHkNjVOWk/GTsxapiaE/xU1jn4odSk+6SwDOeGo4JedueQ8viO4BTC2AYENkW808aU70VLiFS3CtKD9cZnbg6rObhRfMNk45lsnwH3IZzJeffZ5JiapD6reAVwJQ1hYycidSIxCRjkhP+JqI4djJDC8D4BUMd2Fybs7WNsXapEiviA91xWn46bSeGps4XGc1hSfSHJSgQMECsPcyj2Z/eCQZIn7NJyJGPpSXe0vUDNObdPXrKPzIL3KHem0cgodi6QX069Kb2KvmjjiCE92JdlyqyKFBKri5UFeow1YcpCF3eL9+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ff8tljBBQhxJKt2cBlvmy0IkmFxM5HTNesbosPr8NK4=;
 b=a7zkNY6DRYIBM8Si8SpAhRPWLy9FXPg2nwqp+fmzXfO4+9392gfPXCECiktbqXfAdV7vLT+LPQ5Ysu8S/+t4Bctb85JBthXJfFkTaMJLErpx1U8gSx904xNS+7bYsx4E2OcIh5fYdb44Uvxe8kMWhQZjd3bdS2sk9GiSGJ2TiU8IoiBA+Bzq5DUtt9/i7YuRgcTDtlzhnv7SGT7R3gqOsaBixmjryqflTYYE0s47szniev+XOMS61m1WMbwpz5PX2yeTuwyglC/o+ilLzDwpwpRuYtX/KJU57LUXw0Q546sRTOhrUaFYLOh917j1sUljVI7BXdiKuq8knon8cuOkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:30:41 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:30:40 +0000
Date: Sun, 23 Aug 2026 20:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 226/226]
 drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error:
 buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Message-ID: <202608222036.kBCUE80j-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU0P306CA0062.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::9) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa3453d-75bd-4c3e-fadc-08df011257a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: hf32OH1V/2/hXAycCaXM81Xw6mjQ2tzgHZfSyfaJrLrQpoh+2WYYCxhcKY0enhZlY9pK9H1m8F0tnNLHgDqt0jdPpBkHre8egdGfcuUu9zGIiKuGHL9RlnLxNwUwbWfLmVP9uib0VKFKTOBCGTZR17rtlbEaRIw9aCbuqxIUbgVYpEd/IOh9GAzQGV75tO9YG2gkCf4LefjSVV0b1TP7x3W0a5VwucDffph2fO1upSvb5HRqAdX6xdqyEWGhvKUdUaYEpvHuXS7LLnGD0ezaJsdudqzsUXbgPA+Ko3xL+9JeclR2YFj+N+3rpv5CJ2l8ePwXwD2Ie6wEBQIrFfKmF3NqPoRlHKQteAKR3gC1C7snrm57DnqTfN+MOfAzaJhlX6T7e6ZbmcGc2WGBxLMhJM2emuN2i9/dEn8AV1QAw6l/f2LvFHZmp0u7GYyUBQ+U1BJHPEaQJ1gnj9yYhOqlsC1BOJCioruG2NGTOVy3WdJ+fI5LYwoTUpedOrgQazWyjcxNH3Wa3s44hcCRrV70LtaNQw2RH7m7UjkPuHcqoEGryABdItwpLaNGK29B2GHtvQo3nDRq39p9ioQfCdUsP66FCst7gVvRYUNZlG1OEaqw9T37Uc5gfv3+EVQRuA57xsE1tLYIt7lL18y+Hfl70p0rMiKO3dtwecDj+Gm0loA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCIr3qii49dqZiuhATCzpaWKXK31iqkLLBMzc2V7em9O2lmmcnF8ogPVqDrg?=
 =?us-ascii?Q?/Ru/lDBhTC9uYjBcLx5lBYQ4PY5x2oUvxkkCYndrpamgJQ5BttCmi8HglKp5?=
 =?us-ascii?Q?CV/FhNLugKOJZoCYPHUO4WefZKsuFlchOKbbtsp4bk0mn+o1Q9P4CPh7zlK+?=
 =?us-ascii?Q?24jIp5UfZIiVbLJjDaVXjZmSHwyeVrK9rnznWNJKpohIR2RXeUYDIMTldRml?=
 =?us-ascii?Q?Vur0b3XzuG+Mmgys+wsNUUDtLZIci3ZrDn8fvf6Uwplb+XK0hfB24rOXOEJ5?=
 =?us-ascii?Q?DstS8SlgF7GtsY2iqd59lNtn8w9xLECi9fPDYCYVu6CNY7PIDwtCT6jllYSW?=
 =?us-ascii?Q?R3NN7x7RSN+ayEYqsRUJhkSWsMZQq36Pb28ml2XcGh7YtXNZsiOWWTbqQSg4?=
 =?us-ascii?Q?HzCQG479i651RCvjTAHDwuZMp+rcW4LbSCTjPouDytnGqBsJ8zbfQ1ortUBW?=
 =?us-ascii?Q?bD/hudjPhijxhPeuygS6kbK/GD6A66//erpkTenh19C/3ybSH1BLNvhpi+Qt?=
 =?us-ascii?Q?/aEPsLqWPbGAiUhxt9nmFXZGFSFW5glMtt59+gA7G9Cqxg9C5W/QhoMXEOBs?=
 =?us-ascii?Q?b9ajU0qvuF9U+RaDD2Or8N+M0pYQJ7hUPo4loaChwU0Ni+xeUQ0eUsNfl3f1?=
 =?us-ascii?Q?PDDxv33AAN6tCyW6Ib2eKsVQK6brAX0lBA1xejhYZPR/rQI+ExwqK+wGDVvj?=
 =?us-ascii?Q?DkX3TLQOpe/UI414Fo/KE/atrXnv18UXG46TdISeCW1z0ZQf52B7ys2sssSo?=
 =?us-ascii?Q?+P1VVqHaEE8C7huzaf4OlR+YsoIH9n8koTGaq9sYvH14xAI91eDKT0LcmK+l?=
 =?us-ascii?Q?b+rTleF1ApE5qbgk5Vj/fMI+whoVTqzZRTQ5849VJiVetq3LcV0WAW9/WRIP?=
 =?us-ascii?Q?Hcjsq700ks9RU6eUKm6Ix6otqq436GlAUSlPgZ2Ytn60l5xWQpSqgXLY6M2E?=
 =?us-ascii?Q?RwPP9/N6PrORF605eJuACgSaYBtLbC7qsTbY+u0bg6tRg4u2juCOVbONs+Aa?=
 =?us-ascii?Q?FMP2u9ZwE+1gymom3GyUGbfpSTAu/taQXGpEhkZc+uYXbXxF9gAAdZzdRAoJ?=
 =?us-ascii?Q?DbZcjB8kH6id9fcIomtj+MlxsgmGuaeMUlI0JMVAViHP2pbV32wUJxKbmBuN?=
 =?us-ascii?Q?+zbyoc5BxBcXz0YVeTY2EJH4V5hdmnSP5h3vvv/2I9J1bF0UhS1MOc24iWID?=
 =?us-ascii?Q?PCVehxbgFfAvUK7CcTWYHJOO9EvSG6cie+EFz4aIPuYVzES4GqbMEIttgFLl?=
 =?us-ascii?Q?5fIOxa7a7IMe//B8Fdf7fw62NSpkL03goT4lVSXx6tHDlmH+NLgUI3OOviZo?=
 =?us-ascii?Q?VlQguWSuI/Rrtmfdq4OJe8yV4p0DPUrqlC6VCXsxe/9OZbkh9LI8O0hG6sLG?=
 =?us-ascii?Q?KUqRPWUkp8EuL6nOG/EPyalcMBT3Ip9RmejAZPQV9S5MM3lgKnsYzy9ujE4c?=
 =?us-ascii?Q?FnKwOjkIh6IpQxw4ZoMXi55CnOeMgsEkuNGfaASKOK9dHA/Xn4iftAIZINny?=
 =?us-ascii?Q?sCCBz4eDHzpdJFnkaB3uRHLAfStLGcKJtLa56WhwnuvzbVhdAVl01oxIo8zK?=
 =?us-ascii?Q?7SnI5/us8EdVFHwZcWLaXc/q5jdBtjKOBurLaj92APqelcf39O5kZW8OleB+?=
 =?us-ascii?Q?k51ij2DXzOUrsk/YaOIsmZ3HTXD4pygrgga81TYDvo/bB3mDrP/OElgtGFaa?=
 =?us-ascii?Q?uM8TlSkTbCsJLvkE+Jc6fY2tuDYdGyzWqvk/RlwlSCGolnFOH0I6f9cDJ8pU?=
 =?us-ascii?Q?A7jxsw5gWQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: egn14r+GN+ul0SEcOd/uc3Iw9MlkRdMcUcWDqFnuNP2ZdeyE64anEQnchTL//0pdby2VwNx2afqKUElJlVq1xyk1nnv6NR5+Njw6SZk2AaJtj3jOZhNRss69cAJynaIYCbP7EFC9B60DPzrCFQ45lADT9RzssvTjk7C51Ua4EV5ayPr9Y55fkMeecmYq9o7skyj8dfccjN1e3Eddg3XnIgo3gkmGtbPhqCQJ4dXUiUPz1hndMAF5WMXRhyI8WcaW13lHNAxK6CjNLPCPTUWbjL8swWkZ1tOUSvANErqBErNEB+XgVHFJtvy9wWQqhs4cmFP2+21UljaBxdQ/vH4/Xw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa3453d-75bd-4c3e-fadc-08df011257a0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:30:40.3530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGsw5fXMH/CDjCz/B0RnsnFzv/9klIqAOnXavKjLx2Y91SOGk2YWJTtmFn9w1qES3LJOUYEnCIqmlwuCv0bdPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   3d2b0075700eab3a7aa5b384a24ed78ffedc1c24
commit: b882b8502c3496eb2520d2d03fa94f7e6fa23075 [226/226] ANDROID: dma-buf: system_heap: Add pagepool support to system heap
:::::: branch date: 22 hours ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-161-20260822 (https://download.01.org/0day-ci/archive/20260822/202608222036.kBCUE80j-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608222036.kBCUE80j-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:347 system_heap_dma_buf_release() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)

vim +347 drivers/dma-buf/heaps/system_heap.c

b882b8502c3496e John Stultz 2019-06-06  328  
5f9d15ca7993a69 John Stultz 2020-09-25  329  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
5f9d15ca7993a69 John Stultz 2020-09-25  330  {
5f9d15ca7993a69 John Stultz 2020-09-25  331  	struct system_heap_buffer *buffer = dmabuf->priv;
5f9d15ca7993a69 John Stultz 2020-09-25  332  	struct sg_table *table;
5f9d15ca7993a69 John Stultz 2020-09-25  333  	struct scatterlist *sg;
b882b8502c3496e John Stultz 2019-06-06  334  	int i, j;
b882b8502c3496e John Stultz 2019-06-06  335  
b882b8502c3496e John Stultz 2019-06-06  336  	/* Zero the buffer pages before adding back to the pool */
b882b8502c3496e John Stultz 2019-06-06  337  	system_heap_zero_buffer(buffer);
5f9d15ca7993a69 John Stultz 2020-09-25  338  
5f9d15ca7993a69 John Stultz 2020-09-25  339  	table = &buffer->sg_table;
679d94cd7d90087 Guangming   2021-11-26  340  	for_each_sgtable_sg(table, sg, i) {
0597bca8783840b John Stultz 2020-09-26  341  		struct page *page = sg_page(sg);
0597bca8783840b John Stultz 2020-09-26  342  
b882b8502c3496e John Stultz 2019-06-06  343  		for (j = 0; j < NUM_ORDERS; j++) {
b882b8502c3496e John Stultz 2019-06-06  344  			if (compound_order(page) == orders[j])
b882b8502c3496e John Stultz 2019-06-06  345  				break;
b882b8502c3496e John Stultz 2019-06-06  346  		}
b882b8502c3496e John Stultz 2019-06-06 @347  		dmabuf_page_pool_free(pools[j], page);
0597bca8783840b John Stultz 2020-09-26  348  	}
5f9d15ca7993a69 John Stultz 2020-09-25  349  	sg_free_table(table);
efa04fefebbd724 John Stultz 2019-12-03  350  	kfree(buffer);
efa04fefebbd724 John Stultz 2019-12-03  351  }
efa04fefebbd724 John Stultz 2019-12-03  352  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
