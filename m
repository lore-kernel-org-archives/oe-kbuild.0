Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8AE32937A
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Aug 2026 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485151; cv=fail; b=tON3FQqJzy3gevLbfdUfzDcq65EZLLPET6TUQRxdzZGBYVBJpY9Nxu922cRcL4rNb5NLQT4+6mVvjwx0jO9ESG806fggQDOsPsKXgPLxv6NI7l+PFsjUIHrSkKSexc+35ZJJdJefnvv/vyf3TpjH2rrHZC78kkB8XWRlKKld2aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485151; c=relaxed/simple;
	bh=r7+wkE6kvjRCLdO7GPe7X4wFIluz/BMl9zE7JBZQHcc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qLrfcCD3y27wSDQ0STvEfeTmCGJFHsLIeo/l1l5It/MFYWJmwS97IdtWnMULQx7PRVoXDHhgYNxv9s16KdHJCnBziuIqWxOOVvSHMtbzN3AvbCSNMKTA4lVkFRhPLI3/okF3cwQc6+Sv6VI57ej7EriDmMxhcwGo9z3oOjDmJCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEzjikyy; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEzjikyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485149; x=1819021149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7+wkE6kvjRCLdO7GPe7X4wFIluz/BMl9zE7JBZQHcc=;
  b=MEzjikyyBqfadYe564G2jFgqzRV5fLIzBFFmRFsczfiHnPivHNgp+TON
   o7o0XHAfuZmNGZQ4FISJH6D3aCLiOQfzbl3ShwCapAevwhWZGnh/gf4PW
   Glbp7TIPjuew1t7F8k3Co6uVNiPUb8/djvbeUMTkfsutGyuqu/mcV8vB0
   WfyD2WYx5CPLUkmsSA2WAdp0bpL+r8gX8oNUyw/+YvCl/Tv7DvhMcufe4
   UxZGfZzs9bV/wsi34DcepkEbCOT1T06jOrfGe5iCi1oCuKjKF4TRwHlms
   KJDZ1rrUwTfShIdqNDvtWWackLfjWKHy/LhbT/pvQomJKwwrs8c+zP+QM
   w==;
X-CSE-ConnectionGUID: m/1GB053QB+U/UAgDSt+Pw==
X-CSE-MsgGUID: R4tyWUe0QTKWSPVIBj9INQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88017578"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88017578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:39:09 -0700
X-CSE-ConnectionGUID: Q/uSriMJSjyV5jHFa+rQ/Q==
X-CSE-MsgGUID: 6ocgaqq6TOWc7kSaJpNiZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264129460"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:39:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:39:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:39:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmZxzp4ru+jR5lM1pygJ6JhNF8VZztwgMXPVna6c4d6nIQqmbz8d835eTSAxiJAUbIGUjp/t8SdBKBI0ZPAN/3OKdpD1YMeFqbkhIliXJk9F2oEgcsNzdLgF6/ckKCo5F4oUcZTmSYkhiaAKwMLJotLHBVRN09e3BwTQnAJU+1K1P54a1xUxXVDD5LOpSiKCEWjs0YEj7Z9kAMhTREux0Knwk+cmZ2Anel2ZYhlfzkl4p+APRYG4ievHOJyCrzxXSTC7S8P6ZtyE/KWxZ9FX/i5z8ePfQF1evNSr9ZFajlXUC4rGHExHGKQdk1Rsqv5Gy2Z5l+TGCajJ8FJwdkdN6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSxVOydVIaTy3ehKtrwDZSRuZOfy5MDBnh2xvarEpKE=;
 b=MP7u/GwWMgjKfW4mtJb/OJ/csNJMmEJDCoeNOpEJ++75kApKKjN2gs0xu2t7BpiQg9cWHwzT5lgWHQ1pYY0GbTnFhOo3KkqDlhhecaZu9ohJ3mYGFQH6B/jwIoaS3HEXPMC+HaQdsQEV8HXyNBwRQo1iDjtHm7K/UNWM0hp0T85MLF70tht9Fiyw1fBHBbNnt3kqrIqWdM0RRywTVrvnEwmVZWKRzynX9BehibjeZs20fYKgt+TFBZVHtoxAbvK+QSRyMkc+PSWev2sSGhAmxPH8K5K4mf0G04sPaZ3uhLH3gTByQODGzcw/igA+190Lmu8SeraCB1ik7bdyElX/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 11:39:01 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:39:01 +0000
Date: Sun, 23 Aug 2026 19:38:53 +0800
From: lkp <lkp@intel.com>
To: <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error:
 buffer overflow 'ctx->key' 16 <= 1073741823
Message-ID: <202608232034.yfQ3HAvs-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: eee9b88e-025c-4eb8-d75e-08df010b2089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: r9vWqybS8xf95IZgTlOpbgp9+mRyKbeUNi5KIPl2WenphBBrOQtj7Q6Bve0FO4CVVYg7GJVZW3G+Qqle+SuTskerxpfbcbkFKE6d0ENXNTyy23ltMolgDzhND6iMjUTaIUci18Se6JfD3kJ85PJuml7yb6aE/g+DO8TbkNdbFl5Zp5hxk0vmLrjmw8taUYGTOK4fPYYboG5Vt06PE0sO9qlB6p5ynxxgf2YTawcvk3B4UWXG6P3g8q6xpY7biZb+ZEl4fFlD+eqxYxavRfZPVQLnG91nJK83TvR/bXYZltdApb3cBSYeTuB5FgLf+KX17n1AAvuOreI+8VRKorSJAx/GwifC5fAiObJcU4dIe8LJz1E7DNT2IvYgf9iUahEwx3gsE8PecbPUqLwHuBQGOOv/GOZIyoAIgcWUCAa8uP4qtrj03MmenLaZEFqsN/9OpzuQjIBHcJB5FE5JgJVbINMA7CmT2x+F7lB/j661eGI18tY8DW9rTEABp3w8hvoSEBlWHMgKpeVbUEMFum1lF0N4X2yEbuO2Z88jN1BjJz7InDaV7CmzV4DdIJv9Yu5oFsAHvlPgkGXE7/VZO2c73TaHErMX5bd16vlKN0AiXvXCNIXFrdQEieFyZHq1DSUKgvF5L+5anGJwbW3leNEj3HxXdJWlXvmwdOGvP+K4s/w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G4r9gJmWJHuKxrfivnIeixqCNLd+iVuPfxw8bJyWUIlC9YH75eUiA+C0HQgf?=
 =?us-ascii?Q?uS+dcBlv86EWV3nhiYAjd8suDJK4Znlc2KrfW9c4bRV6BCS6Ki3aHiM2/4z6?=
 =?us-ascii?Q?weDHBzW9Gz1nTNtUHAMgt9ay980jfqiTAFP1FJVSb4JOLmUdqTEtPpFvWJ3p?=
 =?us-ascii?Q?uCQOjcwPaIl6Q800U0AO7+VbpWYfbxwxYDRMmXH+MIjLl24q/GHA96kZ6usD?=
 =?us-ascii?Q?Ed9jWraTm6VUb3/gUIqUdof4kbjHVwDwiz4uhsvJEHT5+3nxdvPaUkM6mI+i?=
 =?us-ascii?Q?2LHxoRBZwV6BYPys57HcMuD3rtN0kAsQcZNnQHEZyGFFwMjGT3zvjzpFAAqG?=
 =?us-ascii?Q?SnogH27SV2E791uT1jZmien5jjlWxYwfHGsKi+SltFRGq76JfZ874slYyJSc?=
 =?us-ascii?Q?cZpagNnnX1gqTYZ4LlvYhb8RDj3e6/NJvg4Qoxca3744Nz6R9jKIRQ9Jfvxb?=
 =?us-ascii?Q?FDzuncyNWMXK5GI5pSXkn69893O1/q3RGngnY9VljcFL4US5nGS8mtyzOEQB?=
 =?us-ascii?Q?MapkMopwWSMCXMPrZRm5xSjFlpD1lsygXcX6vwMN2e2gKdFYzFJ9g1Pgj5Ic?=
 =?us-ascii?Q?WHIYa7/rQybluwVvfmPzslcNxkh2feeHbACXRHbZ05wAjuqdND/fnM9r+4YQ?=
 =?us-ascii?Q?rS1M/etoMaFmKZMHHxZWaVkZsozkGC6fYdM4bhJLv4+vVe73S+bQ7S/7stNa?=
 =?us-ascii?Q?RnonpEGxWhs5xHAKq2Y3QCeFVJ2iElhsDmXfL+WxyDGiiyZsUVZTF70OBIQi?=
 =?us-ascii?Q?H5Oiy6/TJWX7bojP2HiGkHqC7Xt7bkymvxbGsAgJyO6zOOJVEE0JainV4GYK?=
 =?us-ascii?Q?39ajI8V8IWhNJwQVl9bUphKLdDyEgLF3SL7Oy+pW1IZfil95H8OmcH4xqtU6?=
 =?us-ascii?Q?kUbrUSRDx5LRQr/IbJ/eM1M5xSgjZfm52EERxE7cDh1EGfJWvcDNLqC/meYP?=
 =?us-ascii?Q?oxmePA280+1Ge//+4CrqcfjkHdqGQZ95vBNgERHncHqCDm3vyaLARORxaI9A?=
 =?us-ascii?Q?zeDoylOlPDxgDMo3l7XUuFt0W+iEokg622HKr3h171282HmS6NgY7U+uiU+Y?=
 =?us-ascii?Q?95CJuazTo/R44cqGxnSPgYwF2GgVz/3RFlmGMGiuGOVcyySX7shihssZfVRW?=
 =?us-ascii?Q?u0/pB1UGaKWNC/mBzWpL9eFw0qDJ3olnEdk4kqrLqOtGugR4Lin4k2V6Oivj?=
 =?us-ascii?Q?JeuUMqYrooJwefNexwbXK6wKKhxNC0qvm3RRhtpPH/AlWXlGZqi5s6LXXeNZ?=
 =?us-ascii?Q?7RDxCHd81jfM34P0jldgveN30ZdgBXekZB9butNdefR/ku3JGGaznqspK0MH?=
 =?us-ascii?Q?6sP6dYO8DRNy9WVaYKvlQlmSosK2iF+K8Yg52PS3ECBW3bnZbhG+MFPl5+3i?=
 =?us-ascii?Q?pKToAyBreioFBRkhlc8bsawS9TWK5omd1V7zdxwGg95UN0kkqmn8Vq0Hf7yF?=
 =?us-ascii?Q?Tg7wRUvZU9s/AaBCPe5z2zwvYSncovX2qgSoToSKsseJMg3v/sTsT0flEfwx?=
 =?us-ascii?Q?QMYJ8tONfZSirF5K7QiAU8oJxv1g1X3KTaeSIC76uFmm1IqdbCr6Og8+DpeW?=
 =?us-ascii?Q?KncpSHNbNpU7j86pSHDYPoCoMpUpuyIk4Ly2CZxMk4Q6GBhyx8W4jtuwQ6SB?=
 =?us-ascii?Q?G7WOeJj+IQKMJVbQhW2eEbIXrbVYVBUSnAFqo8lDzZSlTSJ37YWkbkqyHIHl?=
 =?us-ascii?Q?MEP06FIfqiAYR/sye5/a3Pw1xjZ+ji/4ZGByA2IouIy1mOXh738BQRf8j/nH?=
 =?us-ascii?Q?yCXtKKrWng=3D=3D?=
X-Exchange-RoutingPolicyChecked: r10xTqMrGwtyPz1g6SFL7MjaoQKHlc6nSaqfJwpDPbZ5RzoePRk/R0G18OXTAOHdns32CSW/6kqNLYtD/BT9Y1rQfzyg3czCjU+DZ69Z8eUte6L50Mg108vAIXBpCf+X3eR51dpQrQjupQkamNVjVkjZNbWPyUar/0buWXN64QNG/j0Uxw1ro8LioMqe11EFWemwdO1n+dlfLm1w4ZetkvZsQs5Bd241R9ji4x8MJw2Hq2yiEkdeRFlx+Hw3fueRFNmAyosyXYFyGnugGT3QfhUF6bkFyTMRPTxr7wggo3C+5l6RYyTt3d0Wve4qE8AFCqLJnAI5xt9Y6v4nJ45QYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eee9b88e-025c-4eb8-d75e-08df010b2089
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:39:01.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oV7xyXK4PLKShVuG6kosiAIFHA1ptm7qZ1eyPg6KrMyLH3+1ugr3cqq9MR1Y7ATu/yLku5CcWsTcyRPnHDI0LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: T Pratham <t-pratham@ti.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2709dd5ae32f0828f386327c76bba9f39f63a1c6
commit: 4fbfd7b206b1aa3fedfe8e82a8d3b8daca007d57 crypto: ti - Add support for AES-XTS in DTHEv2 driver
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r072-20260822 (https://download.01.org/0day-ci/archive/20260823/202608232034.yfQ3HAvs-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4fbfd7b206b1 ("crypto: ti - Add support for AES-XTS in DTHEv2 driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608232034.yfQ3HAvs-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823
drivers/crypto/ti/dthev2-aes.c:205 dthe_aes_set_ctrl_key() error: buffer overflow 'ctx->key' 16 <= 1073741823

vim +205 drivers/crypto/ti/dthev2-aes.c

4fbfd7b206b1aa3 T Pratham 2025-10-22  179  
52f641bc63a4665 T Pratham 2025-08-20  180  static void dthe_aes_set_ctrl_key(struct dthe_tfm_ctx *ctx,
52f641bc63a4665 T Pratham 2025-08-20  181  				  struct dthe_aes_req_ctx *rctx,
52f641bc63a4665 T Pratham 2025-08-20  182  				  u32 *iv_in)
52f641bc63a4665 T Pratham 2025-08-20  183  {
52f641bc63a4665 T Pratham 2025-08-20  184  	struct dthe_data *dev_data = dthe_get_dev(ctx);
52f641bc63a4665 T Pratham 2025-08-20  185  	void __iomem *aes_base_reg = dev_data->regs + DTHE_P_AES_BASE;
52f641bc63a4665 T Pratham 2025-08-20  186  	u32 ctrl_val = 0;
52f641bc63a4665 T Pratham 2025-08-20  187  
52f641bc63a4665 T Pratham 2025-08-20  188  	writel_relaxed(ctx->key[0], aes_base_reg + DTHE_P_AES_KEY1_0);
52f641bc63a4665 T Pratham 2025-08-20  189  	writel_relaxed(ctx->key[1], aes_base_reg + DTHE_P_AES_KEY1_1);
52f641bc63a4665 T Pratham 2025-08-20  190  	writel_relaxed(ctx->key[2], aes_base_reg + DTHE_P_AES_KEY1_2);
52f641bc63a4665 T Pratham 2025-08-20  191  	writel_relaxed(ctx->key[3], aes_base_reg + DTHE_P_AES_KEY1_3);
52f641bc63a4665 T Pratham 2025-08-20  192  
52f641bc63a4665 T Pratham 2025-08-20  193  	if (ctx->keylen > AES_KEYSIZE_128) {
52f641bc63a4665 T Pratham 2025-08-20  194  		writel_relaxed(ctx->key[4], aes_base_reg + DTHE_P_AES_KEY1_4);
52f641bc63a4665 T Pratham 2025-08-20  195  		writel_relaxed(ctx->key[5], aes_base_reg + DTHE_P_AES_KEY1_5);
52f641bc63a4665 T Pratham 2025-08-20  196  	}
52f641bc63a4665 T Pratham 2025-08-20  197  	if (ctx->keylen == AES_KEYSIZE_256) {
52f641bc63a4665 T Pratham 2025-08-20  198  		writel_relaxed(ctx->key[6], aes_base_reg + DTHE_P_AES_KEY1_6);
52f641bc63a4665 T Pratham 2025-08-20  199  		writel_relaxed(ctx->key[7], aes_base_reg + DTHE_P_AES_KEY1_7);
52f641bc63a4665 T Pratham 2025-08-20  200  	}
52f641bc63a4665 T Pratham 2025-08-20  201  
4fbfd7b206b1aa3 T Pratham 2025-10-22  202  	if (ctx->aes_mode == DTHE_AES_XTS) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  203  		size_t key2_offset = ctx->keylen / sizeof(u32);
4fbfd7b206b1aa3 T Pratham 2025-10-22  204  
4fbfd7b206b1aa3 T Pratham 2025-10-22 @205  		writel_relaxed(ctx->key[key2_offset + 0], aes_base_reg + DTHE_P_AES_KEY2_0);
4fbfd7b206b1aa3 T Pratham 2025-10-22  206  		writel_relaxed(ctx->key[key2_offset + 1], aes_base_reg + DTHE_P_AES_KEY2_1);
4fbfd7b206b1aa3 T Pratham 2025-10-22  207  		writel_relaxed(ctx->key[key2_offset + 2], aes_base_reg + DTHE_P_AES_KEY2_2);
4fbfd7b206b1aa3 T Pratham 2025-10-22  208  		writel_relaxed(ctx->key[key2_offset + 3], aes_base_reg + DTHE_P_AES_KEY2_3);
4fbfd7b206b1aa3 T Pratham 2025-10-22  209  
4fbfd7b206b1aa3 T Pratham 2025-10-22  210  		if (ctx->keylen > AES_KEYSIZE_128) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  211  			writel_relaxed(ctx->key[key2_offset + 4], aes_base_reg + DTHE_P_AES_KEY2_4);
4fbfd7b206b1aa3 T Pratham 2025-10-22  212  			writel_relaxed(ctx->key[key2_offset + 5], aes_base_reg + DTHE_P_AES_KEY2_5);
4fbfd7b206b1aa3 T Pratham 2025-10-22  213  		}
4fbfd7b206b1aa3 T Pratham 2025-10-22  214  		if (ctx->keylen == AES_KEYSIZE_256) {
4fbfd7b206b1aa3 T Pratham 2025-10-22  215  			writel_relaxed(ctx->key[key2_offset + 6], aes_base_reg + DTHE_P_AES_KEY2_6);
4fbfd7b206b1aa3 T Pratham 2025-10-22  216  			writel_relaxed(ctx->key[key2_offset + 7], aes_base_reg + DTHE_P_AES_KEY2_7);
4fbfd7b206b1aa3 T Pratham 2025-10-22  217  		}
4fbfd7b206b1aa3 T Pratham 2025-10-22  218  	}
4fbfd7b206b1aa3 T Pratham 2025-10-22  219  
52f641bc63a4665 T Pratham 2025-08-20  220  	if (rctx->enc)
52f641bc63a4665 T Pratham 2025-08-20  221  		ctrl_val |= DTHE_AES_CTRL_DIR_ENC;
52f641bc63a4665 T Pratham 2025-08-20  222  
52f641bc63a4665 T Pratham 2025-08-20  223  	if (ctx->keylen == AES_KEYSIZE_128)
52f641bc63a4665 T Pratham 2025-08-20  224  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_16B;
52f641bc63a4665 T Pratham 2025-08-20  225  	else if (ctx->keylen == AES_KEYSIZE_192)
52f641bc63a4665 T Pratham 2025-08-20  226  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_24B;
52f641bc63a4665 T Pratham 2025-08-20  227  	else
52f641bc63a4665 T Pratham 2025-08-20  228  		ctrl_val |= DTHE_AES_CTRL_KEYSIZE_32B;
52f641bc63a4665 T Pratham 2025-08-20  229  
52f641bc63a4665 T Pratham 2025-08-20  230  	// Write AES mode
52f641bc63a4665 T Pratham 2025-08-20  231  	ctrl_val &= DTHE_AES_CTRL_MODE_CLEAR_MASK;
52f641bc63a4665 T Pratham 2025-08-20  232  	switch (ctx->aes_mode) {
52f641bc63a4665 T Pratham 2025-08-20  233  	case DTHE_AES_ECB:
52f641bc63a4665 T Pratham 2025-08-20  234  		ctrl_val |= AES_CTRL_ECB_MASK;
52f641bc63a4665 T Pratham 2025-08-20  235  		break;
52f641bc63a4665 T Pratham 2025-08-20  236  	case DTHE_AES_CBC:
52f641bc63a4665 T Pratham 2025-08-20  237  		ctrl_val |= AES_CTRL_CBC_MASK;
52f641bc63a4665 T Pratham 2025-08-20  238  		break;
4fbfd7b206b1aa3 T Pratham 2025-10-22  239  	case DTHE_AES_XTS:
4fbfd7b206b1aa3 T Pratham 2025-10-22  240  		ctrl_val |= AES_CTRL_XTS_MASK;
4fbfd7b206b1aa3 T Pratham 2025-10-22  241  		break;
52f641bc63a4665 T Pratham 2025-08-20  242  	}
52f641bc63a4665 T Pratham 2025-08-20  243  
52f641bc63a4665 T Pratham 2025-08-20  244  	if (iv_in) {
52f641bc63a4665 T Pratham 2025-08-20  245  		ctrl_val |= DTHE_AES_CTRL_SAVE_CTX_SET;
52f641bc63a4665 T Pratham 2025-08-20  246  		for (int i = 0; i < AES_IV_WORDS; ++i)
52f641bc63a4665 T Pratham 2025-08-20  247  			writel_relaxed(iv_in[i],
52f641bc63a4665 T Pratham 2025-08-20  248  				       aes_base_reg + DTHE_P_AES_IV_IN_0 + (DTHE_REG_SIZE * i));
52f641bc63a4665 T Pratham 2025-08-20  249  	}
52f641bc63a4665 T Pratham 2025-08-20  250  
52f641bc63a4665 T Pratham 2025-08-20  251  	writel_relaxed(ctrl_val, aes_base_reg + DTHE_P_AES_CTRL);
52f641bc63a4665 T Pratham 2025-08-20  252  }
52f641bc63a4665 T Pratham 2025-08-20  253  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
