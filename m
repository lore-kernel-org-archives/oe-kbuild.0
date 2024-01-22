Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792D63D541
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jan 2024 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705933713; cv=fail; b=EDsslTZP0oYuZ0m15Nre0GjRnYtmr8WIJ3Pjk/eh3ZoDTuLoBGkM9cEc86t1qmcausPOGwxIyCBWaF/5lc8g7Gt1NbP3ziUd9JLTQqOFp2eWfmL6wdY7GRuFOIylIY0ZiwLEBf6wTfl8ElxNgcXfSHzGF9nXblzNkQYxuR4mPi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705933713; c=relaxed/simple;
	bh=iLXAs1bfl7yhy93tskzivUQwzBpDOjNNR4EvWmrfxZU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LAig0MzUGKg6U77KLgH4yRhJDZK7cIdscrpU+3vGdvngXMhLcGIAtoQBZAKbVgF6cywxSrOfjqTW30Bwxo+6mK73dPTufIuR2AtnKfRJLbZCcFiK+Yf5JGuOYOFqSZuMAJd8ylPjWxd9nz8q0kxw4rMn5jMOxT0HOqm6kFIuRlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHAKaQXs; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHAKaQXs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705933711; x=1737469711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLXAs1bfl7yhy93tskzivUQwzBpDOjNNR4EvWmrfxZU=;
  b=ZHAKaQXsflS3Oa/gM3SdkyZkFuLSAvNBLzl7Sop4ryTTfQ8R9ZDoV+vD
   Dcom9t02xsVtUFAiUVSQYd+gwfYq0cP0YDm9X7G/PX2hQy/QdHv2nj1xZ
   relzoqKbNarIeCickFsCXQa7Knla7smLt9cH+O849jz4YEM+UlJKEak9f
   l8EXQMxYE5h0IpxvQFFr8M8PDnfp7ZsI++CN4ForDyh8l5Y6EK0otmIZw
   Qap4K0TTWOW7hIF8YNExg5wFaxni0gtAfmBPAmfsJWgylrfOGW/RmN7p3
   7Y5nWVp6o94CmqGr/fggDpwMVle27I5dWDfb2Z1X1tjr+uclmbIYEF+9s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="7883016"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7883016"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 06:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735176081"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="735176081"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2024 06:28:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:28:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 06:28:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 06:28:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 06:28:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErNsj70j33s6qtFGm6CfkqP10HsIYdys5kfWOyu70Ua1GjsXpSsGTVdbX+rqpu+9qfdS/WoGu6ctPRvIR6UY4CS0Yto4iL1VJLL1y69JEMjM0Sz3G2yoOpHGZnVCXNvD2Xg+VhPzSd7clYh6mPmTQh5j0pEDCWXX8w39K3a8ky5YZQIIDQ4l5bSlG41pR7izZlSvZ7F43jaBzciv3e4/M3QspDGQBKFK3fLIhIFJOd3BxYrXAA2TbWTaJ8LtxoSTQIzVVcuB1EjM1fwd4EkLjKAQZl80FEcoShzZNeqo/pxr4hHxJ7bD+Cj1hIGRDDg/21+lIt6DEhFOhD+cWjcc5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTrAWCZB4WHhNybFAc4qugHVvx+cSyv7AZUCmmsE5U8=;
 b=TI+rE0Eh5vds40Nzmadpwo3amE35pqBOpZ1bBHJZKbiTrW2I5XciyLvr+mpLX+/7aSqJbAxK7nPIRpvrytajntsymXE3gQAQ5c75qUp2Dt8Nm/keVVdEYRKZHnjjHrvOEWdGw11OIqetbJi8GORiUA0JOycrLgF23tmx8o/QjD0JVP5UshNu8VGRagU9KzbubayIrWoTYfW6hWMGfewVd+/vMfkVDx28bSAvg7psl94TBAy3svBBuVZSRiDU2hXkMlG09kuDgciSVIGaF515MC4Aw12dr2dcLUVOVpFEO046Yow4K9jwnQL5vbjLaUS5o2sBazT1WjiQ+BNvT/cXyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by PH8PR11MB6564.namprd11.prod.outlook.com (2603:10b6:510:1c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:28:15 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 14:28:15 +0000
Date: Mon, 22 Jan 2024 22:28:09 +0800
From: kernel test robot <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:6.6/linux 326/333] drivers/dma-buf/udmabuf.c:292
 udmabuf_create() error: uninitialized symbol 'mapidx'.
Message-ID: <Za57eQdTJuSM6sbc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|PH8PR11MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: cfe16863-a1a0-4b57-9495-08dc1b565ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +N2cWzYtJbBJqY3xzAED/KuE6pKeZRkRSoof5rZj/2Juny/zkmycCEZpHyyfoIRxepl6QumaTq8PXl/NUITdRrHyk8tDfjFKRYyKbnnWV7nrANKtl/oDFN0osqp3TPl0XaPsWvhBZECYMcBGZh8bF/3QKeq2uPn2Me/VxgM9y+BtnvxTbj4CbQRYY92Y6NyXcSEnmY6sGtMUGEwX+J2f61BWP8/FHAofhLgjSqcgJ/D1HyS4bQ/BGvli+QYYAWprljFr2dslEIbSXMC83fS3SSvWVv4XfncmHh+pdCeoX6L6g6J7jm5ES+vfnFYDsWzG2bE+fIN3DrolpnyIjIPkqfvipb2wkChpE5NnPPqwNcXwaHDxIPFVO3br+fTVGlZW9/td2Hqz4+2xK7NNUQvQudp53U6rvQEqLhBeRc5OTg34nEYHmIYEXi35r80lE+PMZh7XrK6tZlWTYaJrV9tOW3jHJVWXWJQ8s9du0inzHUHHcA47D/DjaxpWuOOqJgR3KTXOxAGDoBwnwR0cXFQQUjpUNGBckcdTMR7lLP+0Mk8ufLVPIo2SyqYEmbslB+RD9mQEuFxyv8KgN5sIeeD1Iz8SAz3+7PN6qVUfY0ZiKuViYuHj0NFy22wX/im3PZ+Jpd4P/gb343abRW9q/I3bwtzZw+5Wo2mPeeYo+LuZZ0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(6512007)(6666004)(6506007)(5660300002)(9686003)(66556008)(66476007)(66946007)(38100700002)(8676002)(8936002)(4326008)(30864003)(2906002)(4001150100001)(316002)(966005)(6486002)(478600001)(6916009)(26005)(83380400001)(33716001)(41300700001)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEmGh+Cv8Q64aLZJUyo9JjluE8pH5KvckQyYXxqnaRaGpAzgjfORvC4PTqRF?=
 =?us-ascii?Q?MsjknjXhy2PkgNtyqXVSPjSWkm5KoGUV7FwMhKqUNd+jIjlyjmc9C9Qsmj3z?=
 =?us-ascii?Q?36Gj88sfBn0qax8pCzFzdBNVRE8O3SYsPO/ik5DfrwZQHWxyYkvwx5fzv7dt?=
 =?us-ascii?Q?vEh20MwFCnwEDmUvDBRDPAZ9LEJZHGdYIKh46Znoix7VbxK9fFPrJfi6djbn?=
 =?us-ascii?Q?PiVLHh1UcYFrXHa7ilCIKymaJgQcJXKuIFhjb3kSPivMXUYEeCbDSZVfcjrn?=
 =?us-ascii?Q?xpMVLgEQKSLCEonY9jH+z0NWAeUcsRmt7WjbmFvO2E+8cnAD2LPlbEI63w+a?=
 =?us-ascii?Q?pPT/Q2Q+tcaYxJdEXMKSKkGwHHEqyIxt/Ryqvywnx+4lqthXjzIbkCYCR9iQ?=
 =?us-ascii?Q?0FoB71OLrAMPx46vVAE5Zs4M8J4QOGpwrbBGBbL4mrQknxH0fNXadaKX2uU2?=
 =?us-ascii?Q?u4QZZ6lNC55MEgFXbjSlogiC6/PFFM/MMRZSQQLSVofwK3+lWh1ZzuDFgCXD?=
 =?us-ascii?Q?JtbZ69lqTZlgA4yWgddbOh17sxp6mp6nQMYtzv6/dGqWNTxTZNTcGQO2Vv3Y?=
 =?us-ascii?Q?Mq84XI1xd4Mc8bMaNoaotgkpXLCzObsc/2OJAjsy6Q0U3U0agUHiOKfdZmmH?=
 =?us-ascii?Q?VJoO+OaqG+Q1zQprnv04KDd3w6Gdm8oHUWLBPgz6t0DWrq6tesUO2x0intT5?=
 =?us-ascii?Q?voBSeqkX1eqZhFXMZ5sGxl9OJ7KCy2b0oHx+feDajEyjb8w5kn90yK8j4jLT?=
 =?us-ascii?Q?+PN1xh6GOvHrjdi8m/pzq85E0T6FcL18PfojoJQQIAR55Zl8hBlHGKm3IyhN?=
 =?us-ascii?Q?4CY8t0j0EW0yh9IyZxq/q0g6gI4fny7c8k3OWYmgzK64/iBzYdMKj0gLWIxq?=
 =?us-ascii?Q?lVmqJgcrZbNLnR1KKk2WnHDtU3s6HoD7nPNJUiYRLN6ipnLSU5ney4aMauDm?=
 =?us-ascii?Q?nGO9WzaJFHcDzVpeOWh7x7spgUgFnoj/fFxw936RK3klvhRXQ4h1LhgynnXQ?=
 =?us-ascii?Q?5OWTsIWoo+EfAoRo23NjMiNdOuDfLDlzQJPHGI+/IU4n7s4xv27zojWgb8pd?=
 =?us-ascii?Q?FdUTQQpMZpXhr8hQS6zAGLCWlWFmGbHj2THrbngjJmNgF/x7JijWRHUTLtib?=
 =?us-ascii?Q?BeDQ53Sl9cgWzGxZFNthcxKSqqYvwYIcLEh51JsvwfyQYdWk6zbFx/EY45L/?=
 =?us-ascii?Q?GsDAxx61NCawmJA/H9xPYA3nykNwi6hlMhXQ6yxYGwHABgHpkzzE26wWqpCm?=
 =?us-ascii?Q?dIY4lzvBoM9M8Rn4ESymFr+DAz5dAyqRuXh6td1eCEtt/Ws+nYOJ2UJt8M+Q?=
 =?us-ascii?Q?cmPGpHgB5+e5u2D/LnnxHmyBWAkAej5n+qHvEwl7UX4grUx1kBRWsKqpPn+6?=
 =?us-ascii?Q?xNFOl/I3mavEb6uuaXm+ZbNNmy5hDjm3IZHU0c58KcF4cmskkOH+JLNGlBU9?=
 =?us-ascii?Q?GK81Wz/+opxQwZMdt/9uhzietsLJWpk3PUfh0pyIhoSEH2tCMj26HrC1u5Vc?=
 =?us-ascii?Q?FrKwRoYAnlcxV9xDWeYQDgluho5BOcKdrn2Mi/FQz6LrkE57IUVdYAaaxEao?=
 =?us-ascii?Q?KEiUZlIyK5iydKjWY1PVaXp6Llw7jBC07B3pOicNmv9Br5ES5BX9ozKth3SG?=
 =?us-ascii?Q?aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfe16863-a1a0-4b57-9495-08dc1b565ebb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:28:15.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwbGo8gJcL5oVE5imyJp9G22T2w5O0KNuXzzXjeB7appcszb+tMsFFyhkB8yLQtl5nUx/8XHykzE43XTTiwlLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6564
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   9fe58986e8674d72a73d6e5c010afea625409635
commit: 6c62382bf45b08ce9f104a230b5bc84a1841d90c [326/333] udmabuf: Add back support for mapping hugetlb pages (v3)
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200538.WfDANVQF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401200538.WfDANVQF-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized symbol 'mapidx'.

Old smatch warnings:
drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized symbol 'chunkoff'.
drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized symbol 'maxchunks'.

vim +/mapidx +292 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann       2018-08-27  213  
c1bbed66899726 Gurchetan Singh     2019-12-02  214  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh     2019-12-02  215  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann       2018-08-27  217  {
fbb0de79507819 Gerd Hoffmann       2018-08-27  218  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  219  	struct file *memfd = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  220  	struct address_space *mapping = NULL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de79507819 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  224  	struct page *page, *hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  225  	pgoff_t mapidx, chunkoff, maxchunks;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  226  	struct hstate *hpstate;
fbb0de79507819 Gerd Hoffmann       2018-08-27  227  	int seals, ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann       2018-08-27  229  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  230  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann       2018-08-27  232  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann       2018-08-27  233  
dc4716d75154b3 Gerd Hoffmann       2018-09-11  234  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  235  	for (i = 0; i < head->count; i++) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  236  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  237  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  238  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  239  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  240  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b3 Gerd Hoffmann       2018-09-11  241  		if (ubuf->pagecount > pglimit)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  242  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  243  	}
2b6dd600dd7257 Pavel Skripkin      2021-12-30  244  
2b6dd600dd7257 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecount)
2b6dd600dd7257 Pavel Skripkin      2021-12-30  246  		goto err;
2b6dd600dd7257 Pavel Skripkin      2021-12-30  247  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  248  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de79507819 Gerd Hoffmann       2018-08-27  249  				    GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  251  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  252  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  253  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  254  
fbb0de79507819 Gerd Hoffmann       2018-08-27  255  	pgbuf = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  256  	for (i = 0; i < head->count; i++) {
7a1c67d7809423 Gerd Hoffmann       2018-09-11  257  		ret = -EBADFD;
fbb0de79507819 Gerd Hoffmann       2018-08-27  258  		memfd = fget(list[i].memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  260  			goto err;
ff58105a47ede2 Al Viro             2022-08-20  261  		mapping = memfd->f_mapping;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  262  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  263  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  264  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d7809423 Gerd Hoffmann       2018-09-11  265  		if (seals == -EINVAL)
7a1c67d7809423 Gerd Hoffmann       2018-09-11  266  			goto err;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  267  		ret = -EINVAL;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  268  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de79507819 Gerd Hoffmann       2018-08-27  269  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  270  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  271  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  272  		pgcnt = list[i].size   >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  273  		if (is_file_hugepages(memfd)) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  274  			if (!ubuf->subpgoff) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  275  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
6c62382bf45b08 Vivek Kasireddy     2023-08-16  276  							       sizeof(*ubuf->subpgoff),
6c62382bf45b08 Vivek Kasireddy     2023-08-16  277  							       GFP_KERNEL);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  278  				if (!ubuf->subpgoff) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  279  					ret = -ENOMEM;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  280  					goto err;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  281  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  282  			}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  283  			hpstate = hstate_file(memfd);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  284  			mapidx = list[i].offset >> huge_page_shift(hpstate);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  285  			chunkoff = (list[i].offset &
6c62382bf45b08 Vivek Kasireddy     2023-08-16  286  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  287  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  288  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  289  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  290  			if (is_file_hugepages(memfd)) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  291  				if (!hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16 @292  					hpage = find_get_page_flags(mapping, mapidx,
6c62382bf45b08 Vivek Kasireddy     2023-08-16  293  								    FGP_ACCESSED);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  294  					if (!hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  295  						ret = -EINVAL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  296  						goto err;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  297  					}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  298  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  299  				get_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  300  				ubuf->pages[pgbuf] = hpage;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  301  				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  302  				if (++chunkoff == maxchunks) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  303  					put_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  304  					hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  305  					chunkoff = 0;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  306  					mapidx++;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  307  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  308  			} else {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  309  				mapidx = pgoff + pgidx;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  310  				page = shmem_read_mapping_page(mapping, mapidx);
fbb0de79507819 Gerd Hoffmann       2018-08-27  311  				if (IS_ERR(page)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  312  					ret = PTR_ERR(page);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  313  					goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  314  				}
fbb0de79507819 Gerd Hoffmann       2018-08-27  315  				ubuf->pages[pgbuf++] = page;
fbb0de79507819 Gerd Hoffmann       2018-08-27  316  			}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  317  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  320  		if (hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  321  			put_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  322  			hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  323  		}
0d17455ca85ecb Gerd Hoffmann       2018-09-11  324  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  325  
fbb0de79507819 Gerd Hoffmann       2018-08-27  326  	exp_info.ops  = &udmabuf_ops;
fbb0de79507819 Gerd Hoffmann       2018-08-27  327  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  328  	exp_info.priv = ubuf;
5c074eeabbd332 Gerd Hoffmann       2018-11-14  329  	exp_info.flags = O_RDWR;
fbb0de79507819 Gerd Hoffmann       2018-08-27  330  
c1bbed66899726 Gurchetan Singh     2019-12-02  331  	ubuf->device = device;
fbb0de79507819 Gerd Hoffmann       2018-08-27  332  	buf = dma_buf_export(&exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  333  	if (IS_ERR(buf)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  334  		ret = PTR_ERR(buf);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  335  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  336  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  337  
fbb0de79507819 Gerd Hoffmann       2018-08-27  338  	flags = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  339  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de79507819 Gerd Hoffmann       2018-08-27  340  		flags |= O_CLOEXEC;
fbb0de79507819 Gerd Hoffmann       2018-08-27  341  	return dma_buf_fd(buf, flags);
fbb0de79507819 Gerd Hoffmann       2018-08-27  342  
0d17455ca85ecb Gerd Hoffmann       2018-09-11  343  err:
fbb0de79507819 Gerd Hoffmann       2018-08-27  344  	while (pgbuf > 0)
fbb0de79507819 Gerd Hoffmann       2018-08-27  345  		put_page(ubuf->pages[--pgbuf]);
683a0e630cb463 Gustavo A. R. Silva 2018-09-04  346  	if (memfd)
fbb0de79507819 Gerd Hoffmann       2018-08-27  347  		fput(memfd);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  348  	kfree(ubuf->subpgoff);
fbb0de79507819 Gerd Hoffmann       2018-08-27  349  	kfree(ubuf->pages);
fbb0de79507819 Gerd Hoffmann       2018-08-27  350  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann       2018-08-27  351  	return ret;
fbb0de79507819 Gerd Hoffmann       2018-08-27  352  }
fbb0de79507819 Gerd Hoffmann       2018-08-27  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

