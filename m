Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020084.outbound.protection.outlook.com [52.101.229.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E9367B7E
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823549; cv=fail; b=d7uI05Yoq7dcFR5qxISjnAM5ousdMbYlRyCPRWOQ8Z01FEj44Iv6jpHuoaBLEklimNm4pAInX/+H/n9H2pa6BWxD8J3XkJVIzCfV+SVHq4MtUWY5YRMeZ6MWrXstN2dzGaKMsM8OCTc6FCOQ9EJUs2iEU5bRakdhyk0yE6bJJ94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823549; c=relaxed/simple;
	bh=hGga+NpSz4Dm3c75J6jo7a7EVNqrIIcjoVXbEQbdiDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MG8iW/KCUNk9kuyUME09zpwLsIlO0iKb9hhwvJdq4rk8SIB50dbxeyyXmO6eDtCE7NpA+Er1CqQNXoGkTp9jm2GkF17UN8e71Vc4WCyaAmt0w7j0H5lOUZL4enHRucvLi2FhkUA+v3E5ysymyd2q9U7mxsEheImfqxsW1WXbhIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=FwYz4Fn6; arc=fail smtp.client-ip=52.101.229.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="FwYz4Fn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC51K31/T5rVKGHE3GF0YCPK3ZwRnq6yQXcQLKmrj1yIZetI17x2KI/I2TMoJ7ZJf3juRex0Re5RRsD5DZszieBnreI4+MBp/nqORlZeWwuXkVv7CoAa24FjCRfVbUX/5R1hwGYSoTZ291gKq9n/MtxA1dm0OEhEjFldlmG6v0f1SllHLQTxXQDtBRbR5EziYJmZeElvP2/Dn5tm7v7BtEvVe6VpqAVBhK5O2+t3+YVuYSfanXZiAtPGk12KnzIvLGDo2I1L1tlVlp8TzeB17M42oEXi73J1m4ga2FSvXIzRQH02ZBunweONqDhKfDROdVkWb1gtgEr2Jfk6JHaIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMtgeii8R9cr1nh6DdnJb26wvXhOgOGkD+xZhxVAIkQ=;
 b=fSDVxHuWC9SCd0pn/y3gVL4QOf2MD77eryxV3W7pO5riAdg71/FJ8E0+CL6lLA6CD2fCwGDyB77h13eVd5JG8bivtKcO+FcxjgN/xZVgNoMVCYEZG6egS66mfFgQNXyT2CuPPSWXOqzgolAyqEX3c3cMRf7HzuNND+CP4ywETsIiDD33XHIHnxyp5SyDchsv2DS8OEIntjf0Po7hSHV9gp0Uh3ymbauTxZ0DCrMygow440T4HNjjQljwPIdtevgV0MwA0xibPQ6sSeoaiFP1lffSnEx5lw+brVV0B8HU4vkxFxXT1+mp6P4PCwebklnU8kLrHLHRgpkY4LMnxqnHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMtgeii8R9cr1nh6DdnJb26wvXhOgOGkD+xZhxVAIkQ=;
 b=FwYz4Fn6o6zq6JNblk47aLpdyJ6z8tUYxN2iP1lz92wZWWTeb8S6kcGNY11ExeH/P9BrF4rhf8FbDgUdIZP4hJkDkSAzsaNw8hpfGLtZH+gQ5yFsarYuT8JLi1F2u2NDvXt9//O/R0qQOBV7q/ztk15Tr7WlB6fEaSe7JnckQwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS3P286MB2405.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:156::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Sat, 19 Sep
 2026 13:12:20 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0428.014; Sat, 19 Sep 2026
 13:12:20 +0000
Date: Sat, 19 Sep 2026 22:12:19 +0900
From: Koichiro Den <den@valinux.co.jp>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <ldkohytwbjif3wzsbzmiihoys3q463srgi7mbnmzxn742dv2to@hvhdozk2ez4l>
References: <202609190509.163Y39lZ-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609190509.163Y39lZ-lkp@intel.com>
X-ClientProxiedBy: TY4P301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::9) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS3P286MB2405:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbc46d3-d9ed-4b85-aab3-08df164fa2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|376014|1800799024|56012099006|10067099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	48TZYclR6lt34/Tbpv124PA/do9R+N6mx8IAa5X6y894pzCtTr17gklAvNa77hLfyU/QtXDuKg/mHSX3es8IaH+83Y/yUXokaWkmdUP/X0Hj8qT86Ke5c0XWCNRu+RqEzyJXJn4u21bEyI0ssz8+nXEoHhyCc3zFbIJH7fd93Dm/D0Do7lNCrrdWH57vjUnrl+ORYVPQqsyuBEIWKamGCRY/4hP5niR7y2CDMkKzwdkH54KEORRhN60G6Mz7WpsXm6wEzllCSmFC3LrJWcxk/zX0lz0K3ZD/rbmJBnWj5oCXFoEkFSlcwT5LlJjWO1Oujd9g5l3vG3ugc2n1yF0syJN2KqMdY4gKkzePIkASJG8bw6VWaZD7pHgHpLqLi7gqBbx2X5LRPbN+7C8RbWVKnAPww69Zu4baSk/2jRDW/h5KA2560vKi6MIavV4NlC41B+VcttYLTDNcm2dq6XJo2OUoVzKhxKPXDEn8DHG86a+A3SsPiJMkd4ZYOWZwNdAr2+5JiZfne/Qm74kGdsdgwcImkJEfck1kuBdPd2Vo6+rzVtkPiOmelCXKqbdoPRLK3nGYYxyYFETUaIUbkOUYG/0FBIhh23YrTNT8aAGiVAap21l9XVH/cSrDRxgAODlg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RH4KnyZnUbhCTivKIGk0q3os/lxIYCayPoBn3pk9wKLF6/St8JFhmRoGsjvM?=
 =?us-ascii?Q?3vWH6P8yTiMY998eWhBl+r2jZzbIe6Oye6AJeJDrY+QFufA3PqkiNPZmz9wA?=
 =?us-ascii?Q?nM6zg6UAaotS5dfsH65jWSqr5s3GE+Bnfst2GbmZQwZ+GVYwvMDTqApY1pMH?=
 =?us-ascii?Q?ayjq2k0lK4qASc8TJ5cWUR5Q622mjMkJHLO0W1mrRWTDCs8sziWRIeZwEdvb?=
 =?us-ascii?Q?V+LBa82vgVQCwOZnfFK42tv5V6W5mR4fflND14DpTfu7UU4W5T9AOESFC+7J?=
 =?us-ascii?Q?4Vhxx1OSdOX1+dGMKHBPDIZW2L43/NxAD/0yfrpEK8/8+/5nwgQ3KeUdqtk6?=
 =?us-ascii?Q?dDxrQ+H2tU6LQQmRfHmym1ShfNqHrWd3gqhdcis4szqj0ROE9U97eLaWYLrl?=
 =?us-ascii?Q?Xs3H1aLwqpWsnnpwFohqOVJrDURClaYmHzE3de8XoReGVM9KpyT/vL7oVPkk?=
 =?us-ascii?Q?dRIHyxTlacS4VfMDkolfAGIC4KFtZpksyTt9GGU2hSc6iI+Ckcdz2bycI6+M?=
 =?us-ascii?Q?YWmAZRtSAEbNOz520F/+FQIQVk2NNEVU/ryVGuGG3KOjd7rIWWw8Ei9s+MYv?=
 =?us-ascii?Q?13I5RhRI1NgyJFlfrFL/umaMZLNZBqM5dbHrJxeb6gRkI9jdqI/s/xGEzMUB?=
 =?us-ascii?Q?rhsxrMND8x6GS6DbGSHHFp92fvjPP5vRvKs3rhLbubfNh+iuuxwsSzqgOydR?=
 =?us-ascii?Q?rLJ5k3DF4RX+f3YHm27rCt4XOEGIwKhZFu4NIEfEcakYuVwe2pSrHacvZ4Gc?=
 =?us-ascii?Q?iTkTWMLXsw9EQuneKAMfrvhTCoDgB6HdP4gItqZSgsfvLrAivZlIUGtzMJyO?=
 =?us-ascii?Q?B2oFQv03v8BeuEo7UpOzSxC2hOZeppg9S4RRptJuYcm8+ZHlEfVE1n1MDXne?=
 =?us-ascii?Q?uvmJiq5guVFdrYTO5jSFWnd5co7kAoKGHwH0B3CFYWWgv10O1BIEexbVqnFC?=
 =?us-ascii?Q?ugpDIop8on0Pfq8Q2tvfm+ut2YY+F0qLm9Jm2IOKoimgC+Ev7avgn8b1C5s6?=
 =?us-ascii?Q?ncH0bQCGkOxT2tnEkBInQKDfYQYp9ekyhwrv393yjuMEsAcoGdYN+Qlum/gV?=
 =?us-ascii?Q?THvWIPflWutYeUMqXF36KGmOu6L1VidiGn0rfB7YlBPus9QXq1K2VzRVTuKz?=
 =?us-ascii?Q?KX2aT4HYrO1VE0E7/j6lz44jUDB8mNopOC7GfYj9v/8S1dBByMcR4yZoMWSY?=
 =?us-ascii?Q?72hy3BlZxzJUslaxN+5fnYJjs7Bl/A3CPmbSiP7HK84gYb2WDnQBotYwDTmb?=
 =?us-ascii?Q?9eDNMSHLOYqS1ur/vqki+bne18ern0UwiArHyqqlrBTDdlLhCHPuDP33Z2BM?=
 =?us-ascii?Q?n/rQeknSMX/wqFeu35S3vl0uymiJ7qRcS6P4Avc2AeJj9mr6NJpADFVXgdZs?=
 =?us-ascii?Q?GrAFJpFLlmzPd6c8+yoLCsxdqxkKKgmo9qzIl7CZKlQaGwTNTeNXpBNZQkuL?=
 =?us-ascii?Q?+x3J6uRcoxb2ocDNOyNi3mHqACuo7a35Srlw9x+nFw1V4MvbaYcUMCGoEBEV?=
 =?us-ascii?Q?YIIIoVQDJjv6NYbKf2EgVTNuCT92tmwde3qjunyeF0Z7YuBecPW2aytG6X3q?=
 =?us-ascii?Q?/pzbz0nmH3rYzJ4uuZXb6cncTdliWQDroEsw12jZhIL+0/JYox8hLjIVk3/o?=
 =?us-ascii?Q?YA20uaOFkKH44wcbjB0zkg2oAZzdhEuRGexQKxhltNM/pz1RIB/JA6KTurgm?=
 =?us-ascii?Q?EEucUKTE7qEm/7/WNXP6urO8i8OSKeekiq+pO3KkbVpurpW47BQ96wlYXp5J?=
 =?us-ascii?Q?nA04UPDZzlLEI8AKvjQae0IpHw2xjxZqVBoLqE9p7NF9iFcQt15d?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbc46d3-d9ed-4b85-aab3-08df164fa2f4
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 13:12:20.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHhP518mhbyUpXP17bZZdPYbqIrZw4Lq5/eNfz7cJT8zX9t3DqgwZ1JqvOnh4W9CESkYbBZ7Um8v4VkMDqUJBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2405

On Sat, Sep 19, 2026 at 05:40:55AM +0200, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Koichiro Den <den@valinux.co.jp>
> CC: Bjorn Helgaas <helgaas@kernel.org>
> CC: Manivannan Sadhasivam <mani@kernel.org>
> CC: Frank Li <Frank.Li@nxp.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   40288c9206c17eb66a603262e06a58d300d0f279
> commit: 8fda2dd209d34396cf49504e2c8dd55d182b14bc PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets
> date:   5 months ago
> :::::: branch date: 4 hours ago
> :::::: commit date: 5 months ago
> config: x86_64-randconfig-103-20260911 (https://download.01.org/0day-ci/archive/20260919/202609190509.163Y39lZ-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 8fda2dd209d3 ("PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202609190509.163Y39lZ-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

Same as reported in May:
https://lore.kernel.org/r/yaedpcylplxx6wu5scgfsb47otlew6inqyvkkmdaspcqrziv4j@vbk7k4umw7gq/

Personally, I don't think either complicating irqf_oneshot.cocci to cover this
case or adding a patch to pci-epf-test.c just to avoid this warning would be
worthwhile. But if any action would be preferable from maintainers' perspective,
please let me know.

Best regards,
Koichiro

> 
> vim +769 drivers/pci/endpoint/functions/pci-epf-test.c
> 
> eff0c286aa9162 Frank Li                  2025-07-10  731  
> eff0c286aa9162 Frank Li                  2025-07-10  732  static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
> eff0c286aa9162 Frank Li                  2025-07-10  733  					 struct pci_epf_test_reg *reg)
> eff0c286aa9162 Frank Li                  2025-07-10  734  {
> eff0c286aa9162 Frank Li                  2025-07-10  735  	u32 status = le32_to_cpu(reg->status);
> eff0c286aa9162 Frank Li                  2025-07-10  736  	struct pci_epf *epf = epf_test->epf;
> 8fda2dd209d343 Koichiro Den              2026-04-14  737  	struct pci_epf_doorbell_msg *db;
> eff0c286aa9162 Frank Li                  2025-07-10  738  	struct pci_epc *epc = epf->epc;
> 8fda2dd209d343 Koichiro Den              2026-04-14  739  	unsigned long irq_flags;
> eff0c286aa9162 Frank Li                  2025-07-10  740  	struct msi_msg *msg;
> eff0c286aa9162 Frank Li                  2025-07-10  741  	enum pci_barno bar;
> eff0c286aa9162 Frank Li                  2025-07-10  742  	size_t offset;
> eff0c286aa9162 Frank Li                  2025-07-10  743  	int ret;
> eff0c286aa9162 Frank Li                  2025-07-10  744  
> eff0c286aa9162 Frank Li                  2025-07-10  745  	ret = pci_epf_alloc_doorbell(epf, 1);
> eff0c286aa9162 Frank Li                  2025-07-10  746  	if (ret)
> eff0c286aa9162 Frank Li                  2025-07-10  747  		goto set_status_err;
> eff0c286aa9162 Frank Li                  2025-07-10  748  
> 8fda2dd209d343 Koichiro Den              2026-04-14  749  	db = &epf->db_msg[0];
> 8fda2dd209d343 Koichiro Den              2026-04-14  750  	msg = &db->msg;
> 8fda2dd209d343 Koichiro Den              2026-04-14  751  	epf_test->db_bar_programmed = false;
> 8fda2dd209d343 Koichiro Den              2026-04-14  752  
> 8fda2dd209d343 Koichiro Den              2026-04-14  753  	if (db->bar != NO_BAR) {
> 8fda2dd209d343 Koichiro Den              2026-04-14  754  		/*
> 8fda2dd209d343 Koichiro Den              2026-04-14  755  		 * The doorbell target is already exposed via a platform-owned
> 8fda2dd209d343 Koichiro Den              2026-04-14  756  		 * fixed BAR
> 8fda2dd209d343 Koichiro Den              2026-04-14  757  		 */
> 8fda2dd209d343 Koichiro Den              2026-04-14  758  		bar = db->bar;
> 8fda2dd209d343 Koichiro Den              2026-04-14  759  		offset = db->offset;
> 8fda2dd209d343 Koichiro Den              2026-04-14  760  	} else {
> 8fda2dd209d343 Koichiro Den              2026-04-14  761  		bar = pci_epc_get_next_free_bar(epf_test->epc_features,
> 8fda2dd209d343 Koichiro Den              2026-04-14  762  						epf_test->test_reg_bar + 1);
> eff0c286aa9162 Frank Li                  2025-07-10  763  		if (bar < BAR_0)
> eff0c286aa9162 Frank Li                  2025-07-10  764  			goto err_doorbell_cleanup;
> 8fda2dd209d343 Koichiro Den              2026-04-14  765  	}
> 8fda2dd209d343 Koichiro Den              2026-04-14  766  
> 8fda2dd209d343 Koichiro Den              2026-04-14  767  	irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;
> eff0c286aa9162 Frank Li                  2025-07-10  768  
> 25423cda145f9e Bhanu Seshu Kumar Valluri 2025-10-14 @769  	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
> 8fda2dd209d343 Koichiro Den              2026-04-14  770  				   pci_epf_test_doorbell_handler, irq_flags,
> eff0c286aa9162 Frank Li                  2025-07-10  771  				   "pci-ep-test-doorbell", epf_test);
> eff0c286aa9162 Frank Li                  2025-07-10  772  	if (ret) {
> eff0c286aa9162 Frank Li                  2025-07-10  773  		dev_err(&epf->dev,
> eff0c286aa9162 Frank Li                  2025-07-10  774  			"Failed to request doorbell IRQ: %d\n",
> eff0c286aa9162 Frank Li                  2025-07-10  775  			epf->db_msg[0].virq);
> eff0c286aa9162 Frank Li                  2025-07-10  776  		goto err_doorbell_cleanup;
> eff0c286aa9162 Frank Li                  2025-07-10  777  	}
> eff0c286aa9162 Frank Li                  2025-07-10  778  
> eff0c286aa9162 Frank Li                  2025-07-10  779  	reg->doorbell_data = cpu_to_le32(msg->data);
> eff0c286aa9162 Frank Li                  2025-07-10  780  	reg->doorbell_bar = cpu_to_le32(bar);
> eff0c286aa9162 Frank Li                  2025-07-10  781  
> 8fda2dd209d343 Koichiro Den              2026-04-14  782  	if (db->bar == NO_BAR) {
> 8fda2dd209d343 Koichiro Den              2026-04-14  783  		ret = pci_epf_align_inbound_addr(epf, bar,
> 8fda2dd209d343 Koichiro Den              2026-04-14  784  						 ((u64)msg->address_hi << 32) |
> 8fda2dd209d343 Koichiro Den              2026-04-14  785  						 msg->address_lo,
> 8fda2dd209d343 Koichiro Den              2026-04-14  786  						 &epf_test->db_bar.phys_addr,
> 8fda2dd209d343 Koichiro Den              2026-04-14  787  						 &offset);
> eff0c286aa9162 Frank Li                  2025-07-10  788  
> eff0c286aa9162 Frank Li                  2025-07-10  789  		if (ret)
> e81fa70179aac6 Koichiro Den              2026-02-17  790  			goto err_free_irq;
> 8fda2dd209d343 Koichiro Den              2026-04-14  791  	}
> eff0c286aa9162 Frank Li                  2025-07-10  792  
> eff0c286aa9162 Frank Li                  2025-07-10  793  	reg->doorbell_offset = cpu_to_le32(offset);
> eff0c286aa9162 Frank Li                  2025-07-10  794  
> 8fda2dd209d343 Koichiro Den              2026-04-14  795  	if (db->bar == NO_BAR) {
> eff0c286aa9162 Frank Li                  2025-07-10  796  		epf_test->db_bar.barno = bar;
> eff0c286aa9162 Frank Li                  2025-07-10  797  		epf_test->db_bar.size = epf->bar[bar].size;
> eff0c286aa9162 Frank Li                  2025-07-10  798  		epf_test->db_bar.flags = epf->bar[bar].flags;
> eff0c286aa9162 Frank Li                  2025-07-10  799  
> eff0c286aa9162 Frank Li                  2025-07-10  800  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
> eff0c286aa9162 Frank Li                  2025-07-10  801  		if (ret)
> e81fa70179aac6 Koichiro Den              2026-02-17  802  			goto err_free_irq;
> eff0c286aa9162 Frank Li                  2025-07-10  803  
> 8fda2dd209d343 Koichiro Den              2026-04-14  804  		epf_test->db_bar_programmed = true;
> 8fda2dd209d343 Koichiro Den              2026-04-14  805  	}
> 8fda2dd209d343 Koichiro Den              2026-04-14  806  
> eff0c286aa9162 Frank Li                  2025-07-10  807  	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
> eff0c286aa9162 Frank Li                  2025-07-10  808  	reg->status = cpu_to_le32(status);
> eff0c286aa9162 Frank Li                  2025-07-10  809  	return;
> eff0c286aa9162 Frank Li                  2025-07-10  810  
> e81fa70179aac6 Koichiro Den              2026-02-17  811  err_free_irq:
> e81fa70179aac6 Koichiro Den              2026-02-17  812  	free_irq(epf->db_msg[0].virq, epf_test);
> eff0c286aa9162 Frank Li                  2025-07-10  813  err_doorbell_cleanup:
> eff0c286aa9162 Frank Li                  2025-07-10  814  	pci_epf_test_doorbell_cleanup(epf_test);
> eff0c286aa9162 Frank Li                  2025-07-10  815  set_status_err:
> eff0c286aa9162 Frank Li                  2025-07-10  816  	status |= STATUS_DOORBELL_ENABLE_FAIL;
> eff0c286aa9162 Frank Li                  2025-07-10  817  	reg->status = cpu_to_le32(status);
> eff0c286aa9162 Frank Li                  2025-07-10  818  }
> eff0c286aa9162 Frank Li                  2025-07-10  819  
> 
> :::::: The code at line 769 was first introduced by commit
> :::::: 25423cda145f9ed6ee4a72d9f2603ac2a4685e74 PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context
> 
> :::::: TO: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> :::::: CC: Manivannan Sadhasivam <mani@kernel.org>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
