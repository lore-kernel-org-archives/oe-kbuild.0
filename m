Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021133.outbound.protection.outlook.com [52.101.125.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B382F3FFACB
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768142; cv=fail; b=f3MyMq99DGXQqR54O8bPuLVE1rklpxwPXz0unruh67rkd+uTDroTlZaclsvKJ0/2+VbKcQqw/uou50pCh4759ONfy+5DOZ27HPKnUVoDnbXi7M+HSu23iMRk+H03/8icK2kGqhbZfy/iKcSrgHkMgBxDv1+8Ze+aUydSQSBpm1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768142; c=relaxed/simple;
	bh=zOhntsslqpHC1UvHYMdSXpzCqSoQjwDHgDEnB7ILdIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t5SfkPNB/IbFTKiiSFhQyaD10mI8SjEPlx1Urylv1JNcs2yMh9pi3NmhbfTCoVTnlZJMajY8eqNuckncrvKzuBQzw0bWm1l3KqTQy/sNBvUN456ToIYUD7nRrKN62y+D2ZHPNC5jzqjskfB+zocCyc46ZDHGM9yJzHde4vaCOak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZLWBSHd8; arc=fail smtp.client-ip=52.101.125.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZLWBSHd8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dII64BOhPL63K2fdSSWWipPZ3TrYDKMnJ4ikQQo4HCF2az7MxlXENTIMPpxfrwq6hSUJ14u3gc+X70Z62P5Jis7mmovwDheMLP+uPM6xbyE/41kX0XLlUlSOQLotEpbgR22Mv+KHRkkspCI8syHeBrwBRYMcPL6NNAWG97+ViCIvB7HRrU70M9sN8Vbi8Tt6vq+76b+odacS0rKjrV2G+aN+25Su6/EDUDOU2RtEz+DgVG/OWvZcIjZ5NbgoxE/A2v34G0zbZ3/Eg4ynvxJcWocDux/o6LsZbCRqQb5AKTcqZd3CzFOjbVS5yUw57tra3jkhfO7F7ZGvTc7ji+XztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7L10Ge3nfi90k/CGAGncyCQzI6fSiRIDMBG5ZlAdZMQ=;
 b=dhVGPOOkIemZ1twJkL73UOyx32NuC9CNWPvjDL99IGaey9vh+1gqs1AjTd/W2fhsAzBfoA4PZM6DdU5vOrvFg9Z+J5b/Sl8fknuJ+/bpbGvk2i2kvr51KsNzeKBzFg4RsV0tRb8zfUGxhBnom5BAbuZpKWzg9x5VKPjCtjTbWWrMVyJqDi+l7z7ZvbCc2cnyIi8V77Fti55JnG8Wnr7D3TKRetd7bsuHIKd3S95r7jIuNj2zTv6u7hJJ2mMdYKl8VUIMcd6rsoSGOOvx/iyy+OQr9usBOKODr68GIaP+P+7eztaaRpl6M99PW4MtQ/bNR/aX0nP8kCp0NdtNYSMJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7L10Ge3nfi90k/CGAGncyCQzI6fSiRIDMBG5ZlAdZMQ=;
 b=ZLWBSHd8j/rP/o2RLIBwxvrJ929m8lta4M9/WRN7MSVQISau1MoJ6UEbxilT3wpLE+197+OGTuNzZN/L4VOvu7mMkQl3O9YKx62gcm7AGMWEiHcvV5wtAHBzEYxOIUXwJQOLmvQBcORkXRN7CophCKk6ZmMMscu5CWrOgsRMLFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB5412.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:266::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 14:15:35 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Thu, 14 May 2026
 14:15:34 +0000
Date: Thu, 14 May 2026 23:15:33 +0900
From: Koichiro Den <den@valinux.co.jp>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [linux-next:master 2714/4394]
 drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded
 IRQ with no primary handler requested without IRQF_ONESHOT (unless it is
 nested IRQ)
Message-ID: <yaedpcylplxx6wu5scgfsb47otlew6inqyvkkmdaspcqrziv4j@vbk7k4umw7gq>
References: <202605141948.KcB1ghf2-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605141948.KcB1ghf2-lkp@intel.com>
X-ClientProxiedBy: TY4P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::9) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB5412:EE_
X-MS-Office365-Filtering-Correlation-Id: fb07d8a2-4c5c-4e7a-f154-08deb1c343ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pRdWqGB0zsDli+A2p/eRY06FsRh5eYSLkLc2c4uA4sHbrV+3GZ0JJ2Cjs119JW2eTCTD7/aP+jZF7074bcm8iRbL1yfMQe6gvN8rRzc3WnUh1loaoKJtIIxElmRBKuqSTAPot0+lINU4YJS9cv7cipxmKNSxVUj3+WOf2ZHew2T5mzkrG6Gji36Xfrrsw2GVEN0BPNHUkW2+obExtunYBkGJzrNXBBHzMRlLTVvKy7SZokvTwhXYtw6mD00k9OR3CA5gM4JtGGZp+W8DwmR/zzfNWdqnuSdG2ft5GPMLw1pAb/tmzvvfim/VlAUMAgCJIcHJWqXML7yQZSycT7Dkp9V6yjMKYZOqBwvPWzmYM5tGKHgWAKPLuf/qZYvQyJEu5oZm4thyTK7CWYa05fQu8nLt/1kYSumGwpQqE4k7d5a6fZWN6ddKySDCleWQDLlhEOS+sM9bBYzUuCX1UhhUhgxkuuCIDmnDqzQtf+vNlWnXwZ/+SLZu2R3nh6QJ1Csdh8HrlQt7usyAZgxcNT9UBAYb7KV62366oXLOAQpg+om5WVxSiVuJTKo1Y0bObhq2nYXy3vhnRUegGbUXtupqsp0dN7g4weVYocm7VNeezN7hHv7375WAttRzMHuQM7cK58ofTRTmJmS6i9dM2OsKuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7rhtQcHXpZimmEEMjZBUwEhecXBwRXlqMqhqQVbqExglE0adk6yf/1MlyDMr?=
 =?us-ascii?Q?0AXvnJeKx49g85dUHA2rXFpVnGH/dQXRGD9SK443s/HP5nNKfip2xcUOiZs2?=
 =?us-ascii?Q?eGBbWzXW0CyU+ZVra4rLxFhg4Lz/4pPA40sCASEZWoOmfTFQdL7uAdGKZ+kP?=
 =?us-ascii?Q?kVoThkE7yKVjW4ARrx0FdhnhJ/fTgUdwsVBAbs34/I42iZE3YMMFccQ8/oVX?=
 =?us-ascii?Q?ucnOFS/hvWumQLJVBeCRNMnkOfWaImkw8EW2OMcEoeKEHWGKxbSJXtMCyezA?=
 =?us-ascii?Q?AOaFXwFcY+PyZWuElsVt25+8e65b3lBMGYPXSDFiKOm8cOIgu3uvUUJicgJi?=
 =?us-ascii?Q?ffXrEXSCOUxJA0E/cyrt0eDwzDCp0uuwT+OSjUBsH4UH2zdoY3UJcZQnSTNW?=
 =?us-ascii?Q?XybSsIY4cYlZlNoxBNpH7i38O0lHS/tDfb0Xphz1ukw3WbOVlRz5H9m3DJiR?=
 =?us-ascii?Q?FFu8F9ZxNLE9bquGNhZIO6xZBkXuyZ+7TZmKnrKRMxSng5Mt/vd95T38BeKA?=
 =?us-ascii?Q?RQKXEzZubqs41mjZV1OWCYv4IVhh8vdC1T0oNeOls6vq3Yh0/l9ZSaFJE2Bm?=
 =?us-ascii?Q?/R+aHdpOspGUUb6JT+yWuetBj+7WjjTekIp37yhudfUtaRXwmRVDM5n8fRDM?=
 =?us-ascii?Q?aNWpgpGmKxmEZbx1l00sjqcIotdBW9W7FPxnswziZ4xUQhFJHHQ3aZZZ1kUY?=
 =?us-ascii?Q?MXDn/FFOMX6Khi/d9yxDJ4NVLCo8zhxlE4ErIvInBNF/l2NKydm9HixaeQaU?=
 =?us-ascii?Q?A3oKOHNiyfr1qPBX+hprkKhqTW9jsgotDedi7pkFyq3dGR4VXCZYqHWjJrSi?=
 =?us-ascii?Q?YR+hyX90lcDaVFB3oJqZBUyPL2E0yFWp0sWWa7+twqziGiEAq+LxOxTcUlhr?=
 =?us-ascii?Q?mUkOga47k93ssP9YseheT/9CI3s7MQZG5WtQTtXbYAN4E83ekG0o2uyeWyHf?=
 =?us-ascii?Q?Mb1Ko/lmU44ptf7KRZE3pibVarUyRZEJ/zhRxjG1UeuaQeCsDulFa/EG4PBB?=
 =?us-ascii?Q?VBKuAyYY9P4ACzBa2kNDy/aj3pvZa3eIJUH6SSSRKgvV9bZPiSoHhqJQzTxO?=
 =?us-ascii?Q?U3Qi46IVRyNq2iK1Mi3my4mPzXIWUwzxVEHveoUjIAIpIxn/mArGTlbGlSRp?=
 =?us-ascii?Q?bvHfWrKD5G25CGMcGrKkanG+dZu8p5QEVPeoxEsz54/bjBXr9V77rTFsdN8P?=
 =?us-ascii?Q?N+NUCsx5iZT4ZQgIQ0TzUkQkkAlgIcU6nGtvgYMu9n0g4JlL3sRy/ABJa4Mx?=
 =?us-ascii?Q?DH0czqPgPWBhk+9j0RIg4WqIqrIEtgnVbWqtrG9G4b2cJUt99qypOWC/adNB?=
 =?us-ascii?Q?iVW5nQgV05CLO99OJn2QWNhOv1GrZ/8vBsSR1yr7Vk+20CPIreF7XZHtL1U1?=
 =?us-ascii?Q?t655lMlvyg8UoM7SwV9oxj8W8gy2f3t0bc0piW5l02NlCTdg9PGUhF/4NIYG?=
 =?us-ascii?Q?I/MXYPp715wXwDwfJRpM80RNCO1njJPz+3NqqXKAn0bu3h7MljMY9meDzSz7?=
 =?us-ascii?Q?9xpOgJnjiQvCnBU3vDRFMMfS/QfaXf98XMD83Inj6J9oSol2l3Pg/0rflrkL?=
 =?us-ascii?Q?ook0Yo9R6DrqbIovPpdTtbkD2mVcHAzICMKfAsnwifWnPwy2QCUWRyBYK4Rc?=
 =?us-ascii?Q?65Sc9bqqSOryOsBShjA8Fg9twIzUGCKzh+CN+Ickg9hlLli8eq7y50pY6oTb?=
 =?us-ascii?Q?WfPRVMd52PyMDT3IMAe84Z3rUtw4oxxVdEvFmCJdW2XCNoW3O1zlI0QW1Lz0?=
 =?us-ascii?Q?hbxG9frlnBTKP1OEeWlp6jZw0qHOzfjUIa1Mp3ReyDyXTR678dac?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fb07d8a2-4c5c-4e7a-f154-08deb1c343ac
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:15:34.6768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5S4b0zXd7AkAgSV8a7OSbuEplu/VuUh3zaAreTHArYu/FaQw9ZHS1iy/lWOEy79/cG2qI0121hhYh/eDCOOXyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB5412

On Thu, May 14, 2026 at 07:56:11PM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Koichiro Den <den@valinux.co.jp>
> CC: Bjorn Helgaas <helgaas@kernel.org>
> CC: Manivannan Sadhasivam <mani@kernel.org>
> CC: Frank Li <Frank.Li@nxp.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
> commit: 8fda2dd209d34396cf49504e2c8dd55d182b14bc [2714/4394] PCI: endpoint: pci-epf-test: Reuse pre-exposed doorbell targets
> :::::: branch date: 6 days ago
> :::::: commit date: 10 days ago
> config: alpha-randconfig-r064-20260513 (https://download.01.org/0day-ci/archive/20260514/202605141948.KcB1ghf2-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 8.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202605141948.KcB1ghf2-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/pci/endpoint/functions/pci-epf-test.c:769:7-27: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

This looks like a false positive.

pci-epf-test does pass IRQF_ONESHOT, but through a local flags variable:

    irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;

I think irqf_oneshot.cocci rule misses this because IRQF_ONESHOT is on the RHS
of the bitwise OR, and the request_threaded_irq() call itself is also on the RHS
of an assignment.

I can work around it in pci-epf-test.c, but extending irqf_oneshot.cocci to
cover this pattern might be a better fix?

Any guidance on the preferred approach would be appreciated.

Best regards,
Koichiro

> 
> vim +769 drivers/pci/endpoint/functions/pci-epf-test.c
> 
> eff0c286aa91622 Frank Li                  2025-07-10  731  
> eff0c286aa91622 Frank Li                  2025-07-10  732  static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
> eff0c286aa91622 Frank Li                  2025-07-10  733  					 struct pci_epf_test_reg *reg)
> eff0c286aa91622 Frank Li                  2025-07-10  734  {
> eff0c286aa91622 Frank Li                  2025-07-10  735  	u32 status = le32_to_cpu(reg->status);
> eff0c286aa91622 Frank Li                  2025-07-10  736  	struct pci_epf *epf = epf_test->epf;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  737  	struct pci_epf_doorbell_msg *db;
> eff0c286aa91622 Frank Li                  2025-07-10  738  	struct pci_epc *epc = epf->epc;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  739  	unsigned long irq_flags;
> eff0c286aa91622 Frank Li                  2025-07-10  740  	struct msi_msg *msg;
> eff0c286aa91622 Frank Li                  2025-07-10  741  	enum pci_barno bar;
> eff0c286aa91622 Frank Li                  2025-07-10  742  	size_t offset;
> eff0c286aa91622 Frank Li                  2025-07-10  743  	int ret;
> eff0c286aa91622 Frank Li                  2025-07-10  744  
> eff0c286aa91622 Frank Li                  2025-07-10  745  	ret = pci_epf_alloc_doorbell(epf, 1);
> eff0c286aa91622 Frank Li                  2025-07-10  746  	if (ret)
> eff0c286aa91622 Frank Li                  2025-07-10  747  		goto set_status_err;
> eff0c286aa91622 Frank Li                  2025-07-10  748  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  749  	db = &epf->db_msg[0];
> 8fda2dd209d3439 Koichiro Den              2026-04-14  750  	msg = &db->msg;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  751  	epf_test->db_bar_programmed = false;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  752  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  753  	if (db->bar != NO_BAR) {
> 8fda2dd209d3439 Koichiro Den              2026-04-14  754  		/*
> 8fda2dd209d3439 Koichiro Den              2026-04-14  755  		 * The doorbell target is already exposed via a platform-owned
> 8fda2dd209d3439 Koichiro Den              2026-04-14  756  		 * fixed BAR
> 8fda2dd209d3439 Koichiro Den              2026-04-14  757  		 */
> 8fda2dd209d3439 Koichiro Den              2026-04-14  758  		bar = db->bar;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  759  		offset = db->offset;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  760  	} else {
> 8fda2dd209d3439 Koichiro Den              2026-04-14  761  		bar = pci_epc_get_next_free_bar(epf_test->epc_features,
> 8fda2dd209d3439 Koichiro Den              2026-04-14  762  						epf_test->test_reg_bar + 1);
> eff0c286aa91622 Frank Li                  2025-07-10  763  		if (bar < BAR_0)
> eff0c286aa91622 Frank Li                  2025-07-10  764  			goto err_doorbell_cleanup;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  765  	}
> 8fda2dd209d3439 Koichiro Den              2026-04-14  766  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  767  	irq_flags = epf->db_msg[0].irq_flags | IRQF_ONESHOT;
> eff0c286aa91622 Frank Li                  2025-07-10  768  
> 25423cda145f9ed Bhanu Seshu Kumar Valluri 2025-10-14 @769  	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
> 8fda2dd209d3439 Koichiro Den              2026-04-14  770  				   pci_epf_test_doorbell_handler, irq_flags,
> eff0c286aa91622 Frank Li                  2025-07-10  771  				   "pci-ep-test-doorbell", epf_test);
> eff0c286aa91622 Frank Li                  2025-07-10  772  	if (ret) {
> eff0c286aa91622 Frank Li                  2025-07-10  773  		dev_err(&epf->dev,
> eff0c286aa91622 Frank Li                  2025-07-10  774  			"Failed to request doorbell IRQ: %d\n",
> eff0c286aa91622 Frank Li                  2025-07-10  775  			epf->db_msg[0].virq);
> eff0c286aa91622 Frank Li                  2025-07-10  776  		goto err_doorbell_cleanup;
> eff0c286aa91622 Frank Li                  2025-07-10  777  	}
> eff0c286aa91622 Frank Li                  2025-07-10  778  
> eff0c286aa91622 Frank Li                  2025-07-10  779  	reg->doorbell_data = cpu_to_le32(msg->data);
> eff0c286aa91622 Frank Li                  2025-07-10  780  	reg->doorbell_bar = cpu_to_le32(bar);
> eff0c286aa91622 Frank Li                  2025-07-10  781  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  782  	if (db->bar == NO_BAR) {
> 8fda2dd209d3439 Koichiro Den              2026-04-14  783  		ret = pci_epf_align_inbound_addr(epf, bar,
> 8fda2dd209d3439 Koichiro Den              2026-04-14  784  						 ((u64)msg->address_hi << 32) |
> 8fda2dd209d3439 Koichiro Den              2026-04-14  785  						 msg->address_lo,
> 8fda2dd209d3439 Koichiro Den              2026-04-14  786  						 &epf_test->db_bar.phys_addr,
> 8fda2dd209d3439 Koichiro Den              2026-04-14  787  						 &offset);
> eff0c286aa91622 Frank Li                  2025-07-10  788  
> eff0c286aa91622 Frank Li                  2025-07-10  789  		if (ret)
> e81fa70179aac6a Koichiro Den              2026-02-17  790  			goto err_free_irq;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  791  	}
> eff0c286aa91622 Frank Li                  2025-07-10  792  
> eff0c286aa91622 Frank Li                  2025-07-10  793  	reg->doorbell_offset = cpu_to_le32(offset);
> eff0c286aa91622 Frank Li                  2025-07-10  794  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  795  	if (db->bar == NO_BAR) {
> eff0c286aa91622 Frank Li                  2025-07-10  796  		epf_test->db_bar.barno = bar;
> eff0c286aa91622 Frank Li                  2025-07-10  797  		epf_test->db_bar.size = epf->bar[bar].size;
> eff0c286aa91622 Frank Li                  2025-07-10  798  		epf_test->db_bar.flags = epf->bar[bar].flags;
> eff0c286aa91622 Frank Li                  2025-07-10  799  
> eff0c286aa91622 Frank Li                  2025-07-10  800  		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, &epf_test->db_bar);
> eff0c286aa91622 Frank Li                  2025-07-10  801  		if (ret)
> e81fa70179aac6a Koichiro Den              2026-02-17  802  			goto err_free_irq;
> eff0c286aa91622 Frank Li                  2025-07-10  803  
> 8fda2dd209d3439 Koichiro Den              2026-04-14  804  		epf_test->db_bar_programmed = true;
> 8fda2dd209d3439 Koichiro Den              2026-04-14  805  	}
> 8fda2dd209d3439 Koichiro Den              2026-04-14  806  
> eff0c286aa91622 Frank Li                  2025-07-10  807  	status |= STATUS_DOORBELL_ENABLE_SUCCESS;
> eff0c286aa91622 Frank Li                  2025-07-10  808  	reg->status = cpu_to_le32(status);
> eff0c286aa91622 Frank Li                  2025-07-10  809  	return;
> eff0c286aa91622 Frank Li                  2025-07-10  810  
> e81fa70179aac6a Koichiro Den              2026-02-17  811  err_free_irq:
> e81fa70179aac6a Koichiro Den              2026-02-17  812  	free_irq(epf->db_msg[0].virq, epf_test);
> eff0c286aa91622 Frank Li                  2025-07-10  813  err_doorbell_cleanup:
> eff0c286aa91622 Frank Li                  2025-07-10  814  	pci_epf_test_doorbell_cleanup(epf_test);
> eff0c286aa91622 Frank Li                  2025-07-10  815  set_status_err:
> eff0c286aa91622 Frank Li                  2025-07-10  816  	status |= STATUS_DOORBELL_ENABLE_FAIL;
> eff0c286aa91622 Frank Li                  2025-07-10  817  	reg->status = cpu_to_le32(status);
> eff0c286aa91622 Frank Li                  2025-07-10  818  }
> eff0c286aa91622 Frank Li                  2025-07-10  819  
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
