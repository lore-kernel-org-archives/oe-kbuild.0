Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307B7367;
	Mon, 14 Jul 2025 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525433; cv=fail; b=r1grDYZ+jp2qjszZ+t5pVRBXHKHKIB8nOm89QpjMzcpczpYkK45dS6INQVfA0tXpErIh1l6RKYhIOjDym1W0wQmL301RsWmO98kp5uJT5rSwEdXLpwJSfKWdQd6o8M/v9HzKDDF+5UeYM19djQi11+0x8woC6CzAskLRY5hlr2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525433; c=relaxed/simple;
	bh=+C/Neaf07dUpO+P2ZhdBRbqFWZU/V+AUxNabxpZkwNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Iru+HqJcKToQ18cMkkiqzHHeB6gv356RNK+eRZsZ9UdGw8rHLlx0OTOXH6zE8tGjX2L4Bl+NaAqBN5aeYC9Qv54FcL/Ap7tCgYB7aaFpLY+ZHdhiDQNwfnRiqAJbBQta3RhexpMRqdqz+K0pUk6RkiMTn+UnxTDUK40GrK7SovM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GmxiCUum; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GmxiCUum"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwYSka8aXT00tb/MwTF2VcR36SAjWUDBt54wcqXYdb6FBlvc3ey/1t1+zE3yzsVehYZjTHrPS8u2cGgZwtcbZlgMVcxdfAoXDwOsbn0T8orGmsDVVRauIYIUlMsiI2A0Evs3o8GI6pyEIBBCBdQ/jAXX99mMzmzBLZ8jk0eNhflpzqY/OK44Tap+QG2FqdZHxJ3RR7eEeO0abJv4rI6QM6SvtbFIcwXIckO94lu8lcgs4udcmBC+v3JieKQpIYSqZ7alQnH27UGwQ38OiHjJwmo2PksNha2BcZw2eZsBr3nKcCRSthUm6JQsrwxZ2JMywqCUNCPkKoZ7//Dp17RkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl+hRh5h2Sj2h/uHbNV+zwYT2I7k+rC54N2jPbN36eA=;
 b=PMWNObLE7VDm4xniJxXHfkjqLmOEj/t61WG3zl/ulvbUmHoz7zsEMNdBqDGgtBvuLTC8lXG+JJHUX1jJkFaDKYKhL5dT5LrU5piWrZYObWDaKkOg1WFF0JWWYRWfvd0efjB9fN7o3o6xS+dERBCHVz2EinU72Dj8o2/tyr8TofIrgTd2hdZ0XdupeVFKJ8sO50d89skDxMVZpyE11Nlcu+Z4YwDAaCLen/nYonqDOuUaPwBbo6VilsWLijdnh6fyvSFvQsLO8357lcN/jFuUiDJjLOtLRNmEj1Gay1LPthit0w/nhKbqygpwvCJVBDywtxlFyVH3fu3GavDWSKtaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl+hRh5h2Sj2h/uHbNV+zwYT2I7k+rC54N2jPbN36eA=;
 b=GmxiCUumFdrQWfsc9Hq3bTxDPVeO24LQBrMHcn54yw5qzS6lv0fc1mptPv6rW4ekb25JGozMlODuxV59rxumIjM24hVfV6PRUAXhuvNMzZ8pYEwbnsI2ATw+dMdJgfQXJOiRDWDLO1O9+NHPwrHXN/HHe+xCIHQ725eYivZrTBIVJ7LBe/scEvan6i0gW+gc6rFiipOx36ny/4HbQKMjda4t8COCS7aIK12LCFhZ5dvMsf7rLQkO3mlwyQ9MEc2u0oiXBCGHuJgftazX9shUw1aNZUSt2H9Bqgby1BkuQCyktLAp7aUgl3j9ghl43cD6UADgyOV6VAe7YhOqM2As0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 20:37:06 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 20:37:06 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] mm/huge_memory: move unrelated code out of
 __split_unmapped_folio()
Date: Mon, 14 Jul 2025 16:37:03 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <3D290E52-E1CD-4A2E-84C7-F316E7F71D22@nvidia.com>
In-Reply-To: <64b54034-f311-4e7d-b935-c16775dbb642@suswa.mountain>
References: <64b54034-f311-4e7d-b935-c16775dbb642@suswa.mountain>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 390bd90a-7f5a-4153-6955-08ddc316325f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L3J8H8IxAuvbC3gYetPQo8OSxnnm5aH1rBQU8aRHKpvP2aAoJ4YJ9ed89yOp?=
 =?us-ascii?Q?/rWMFLrJN4514hKodQ0lfE6QibzDZLqiWMIjhgM57GKkuEY+u2TCEbWBVt/W?=
 =?us-ascii?Q?eepnsbLs0kJEmN6vWfVpOqYofrKipOXb03NlfzgYlKbvhQXHcRE6rsxxMc+G?=
 =?us-ascii?Q?+PyZYXfWrXSAXmg73gZzUU5gnkS24EwF9E5B3pGuLmh/pMkeb6C3Tg1knHnU?=
 =?us-ascii?Q?krNXM3QVawZ2MESPtyD826DMbSbs4vAg7tHRtt+j0vduWgS0UsBwmiKgEHvL?=
 =?us-ascii?Q?B1dxZZ/n29+GiPBxg403bsPMqxMz8m1RmLcIrVKKx3UdV3G7DYR9/rfpeNs5?=
 =?us-ascii?Q?qhC0MraKk6R621Y7bS9cSKYYrQyX41svnrNqq1Z9Yaec7H1bXwYq6i5EP2am?=
 =?us-ascii?Q?ma+vFYaHKGWGMMk+2knhs9thA+dfRRLX0bpldcpCkVNvaajmtSdkGDhR9XaI?=
 =?us-ascii?Q?WQcDbfJfXPi/k63ut8qq5r0LsFFfB2oKXn82XquCuRc7pBqXyoRq28538Ge/?=
 =?us-ascii?Q?okcvyxfS9U1CrcAltHcU3owwEbDmc3wkvi2eP3Dw68oYhEbH2uZRvPc6G6KG?=
 =?us-ascii?Q?cLTxLHEDuGWsmVjw3qxf64G/BJs8Xmlk+PlYx3NtrIRlKRk3TgxLjikF+mo9?=
 =?us-ascii?Q?avJbwgsps0jmDhoVT6djguxKvJQS4cgPYPghyjhsI10HLP/SCCRjTnbah649?=
 =?us-ascii?Q?YxvjGXZM8A2X2nqdo1trVaoYV6OV+auZCLJEUke/MI26xAJNvNimp7skkQcp?=
 =?us-ascii?Q?dsvuCd3+NgXAOOGH1ZfTobbIDz6zrUrkLrKPjYDwSKduYCGdHlVT/3GrDb5x?=
 =?us-ascii?Q?FE6ZeIcxvlVihme0Tf9wwYlFMe/rPFx7o8WVJveqwknbH/Nf1lzTXWK0Mzo8?=
 =?us-ascii?Q?NnloN406BM9gxN8bL3s13tMvUuziDHvBT/ucq1aK5WZ7TsoxFbpoMfVhKLDH?=
 =?us-ascii?Q?oeIENZrex34BbVUxIjlTQWUEFdPCLWTKbb2sucp8M82Yt98M4XdTlI1FKbFM?=
 =?us-ascii?Q?/6gxK2yi3pDdihzIZbqitPS+iovw5IaRVectrJPs51Ayud/G90uGr2pOSfW/?=
 =?us-ascii?Q?ahuT55XTpXw7Yk5gTqp04rpMI4c+sXSygvJhoF7rQhEFIMZnc6adgJALG4GL?=
 =?us-ascii?Q?tv3rd+vTMLdT5R8EoPuENkFvL0NOok9mfcfYrfzldcebVMrLf2qpWBDkMWBd?=
 =?us-ascii?Q?yq4urdxt7piGeCf9NAkWqh4/JBcRhm9jDanSU3HKC/dAhV0cQ8at5fkppUFo?=
 =?us-ascii?Q?eMBdTs2c0uGyCRZrX5BNqW2v9gjoizZ1McfgiN1UxnrT/tYIdzDZjO5NyWlk?=
 =?us-ascii?Q?7/x7oklnEyGg4oBKUifJK7dxVxw2v+JVMuhjNLij32HGDx34NttXxhcRECDO?=
 =?us-ascii?Q?KgEenKOyQq7oQFO1pMFrxewkWs6u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o3tKnx5s8W5ZmwoeXCnMt/KlY49Muj/Fn3Ey0EMCnKhBFlGn+qwnUTg0hG1W?=
 =?us-ascii?Q?R9opN+LS/qenfXoJcGEQ2pTMMUGuDRFzFj3pplcCbJA3fbI/lbfDx3M0kPVD?=
 =?us-ascii?Q?DDq8ZLOqtHY+RSYsYC1xz7sHDutSmZR6LAY/Fdt2LPezHvJkeZiFfgpr8Q3w?=
 =?us-ascii?Q?sSBa2Y16Q2NFM5uod4R4Hiz+SEY+vFKOTB33pynp7jFM8bKL+sHe1zgiiqP+?=
 =?us-ascii?Q?NPq7o9WdIXfpH5EYRLaFVy76X4JY+AseejCwWdcq4uz0R3nedw0B7JEH1ZFk?=
 =?us-ascii?Q?z5XyO62Sb7L4tLfUfV4x8uS8cqbpbX2R64C9o19qWx3PedmlHMtnriPj4Qmc?=
 =?us-ascii?Q?WXrwTwc50i9L1K2Ju34u5yKKy0EbeH8nPMrNlZXDzjGhYJR5ZtgVvJ339mZv?=
 =?us-ascii?Q?rL0yIeWYXRBW98boCCG2QsoWf0vuIvdJhZhna/pp5VxgDvc0NTmjid1e6A5N?=
 =?us-ascii?Q?S5mM50Dzo9mh3mdlJKmqRIdOVlvAz/qk5n8QfPWWOpFFQP8qAxRAwo60Q7cM?=
 =?us-ascii?Q?S3QHRfaaiVfjfd6WAznP/ul2j3aBbBIbRwRDpIN/STHPFsGxto1z3lKJWpPk?=
 =?us-ascii?Q?7hlBkLNQoJ+leXGmDHWj6XdYwoJrBnDXuXqwPFZn/ER2T1ojGvaaw5Pp5TBa?=
 =?us-ascii?Q?BXF0EGlmM1UvUK7lqSn82IUCcrCIYv2qEqMhBKFaMWDrAWh8PPznXNF6pqD6?=
 =?us-ascii?Q?5xgTuCjnzJ1aa4Zyx7xKpgD548kh2F88OT1aQAICOGwZ7v/YVomTAyYivWbP?=
 =?us-ascii?Q?iuO0ZFFzxRLutGwGSszcy/5+0eJqL6mOJFl4MHWXCXkKjFRYjc4KUFx0scTK?=
 =?us-ascii?Q?wQdQjrElLKKH6tk+vpKozn/H0+VrEGfGfBp4E9jB4/T2f7Dxkota2cr1b2+O?=
 =?us-ascii?Q?TSLm7ND2zRxe7RFK60Yamc4NBjs7SrnWAPrcAX9FmbzBowqAAUa3D7FsJzRY?=
 =?us-ascii?Q?WzQ007Nmdrmh0XiEqjWjGKvZbi9ANFMrz2jAV5dQGQpM1cocLAqZRmndXmzG?=
 =?us-ascii?Q?mQKxbkJ6zlHAhkoLC1loyh1TQS+Wsdb6fOUXFQNvYUhxjmN9ES6neC43Hov1?=
 =?us-ascii?Q?Uuo/vlIexaOiIBnIf+P83sZeEy92pR6qvUQdfSH1cKJjzLn+gr9ZKisSgtd3?=
 =?us-ascii?Q?I3rYflQ6BTC8Nd63gtAHg2WGR7iR9a+duwbwX0UsUEAX23JsNSfu1I/gZUr4?=
 =?us-ascii?Q?mhzN42+8zBJk5f3GXGBVacZJYKqdoTRQbOQeVIpjSPCPoi6cB0GIvA3QUIhj?=
 =?us-ascii?Q?3nKcc2wdHg/cComw//6RWwWQVVC2+dvAImp6ZlTEQ2dvOKnrkX1bs1Vx3nIc?=
 =?us-ascii?Q?Vji7OIF+LWbZoQpPwMGaPV5c3m6DsW9KZ79GbInKXWkR66OQJRD9GJuai4mK?=
 =?us-ascii?Q?Vaq7kdwWtdK0AVZdmFg9cezeSjB/OflOvtRS2zyklT//4fOECtpn4U4uVj1T?=
 =?us-ascii?Q?aQVk86oNPzk1LEsaDm7vZUMAXTWqEgsztz+x0QUTPxIctd4/wi7lpw5jO9w6?=
 =?us-ascii?Q?Eegx4rdQg7G/Q73ZW01sEMhAQWJmWoLqV+oc9BxMHKapOKvLehZcF1xjGj96?=
 =?us-ascii?Q?br+PJfP2nIZv+l7Ev7w9JrlIXDoM9iqD7UBdSXa+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 390bd90a-7f5a-4153-6955-08ddc316325f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:37:05.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5YS4TxDjbQV0BakFAdJbGwViXQh+GYjml29j7LZezpANwrYKLHY/mGT2xflYGZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505

On 14 Jul 2025, at 16:30, Dan Carpenter wrote:

> Hi Zi,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zi-Yan/mm-huge_mem=
ory-move-unrelated-code-out-of-__split_unmapped_folio/20250712-022638
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-ev=
erything
> patch link:    https://lore.kernel.org/r/20250711182355.3592618-2-ziy%40n=
vidia.com
> patch subject: [PATCH v2 1/2] mm/huge_memory: move unrelated code out of =
__split_unmapped_folio()
> config: i386-randconfig-141-20250713 (https://download.01.org/0day-ci/arc=
hive/20250714/202507140837.bxjvd6Gs-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202507140837.bxjvd6Gs-lkp@intel.com/
>
> smatch warnings:
> mm/huge_memory.c:3827 __folio_split() error: we previously assumed 'mappi=
ng' could be null (see line 3814)
>
> vim +/mapping +3827 mm/huge_memory.c
>
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3595  static int __fo=
lio_split(struct folio *folio, unsigned int new_order,
> 58729c04cf1092b Zi Yan                  2025-03-07  3596  		struct page *=
split_at, struct page *lock_at,
> 58729c04cf1092b Zi Yan                  2025-03-07  3597  		struct list_h=
ead *list, bool uniform_split)
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3598  {
> f8baa6be0368b5d Matthew Wilcox (Oracle  2023-01-11  3599) 	struct deferre=
d_split *ds_queue =3D get_deferred_split_queue(folio);
> 58729c04cf1092b Zi Yan                  2025-03-07  3600  	XA_STATE(xas, =
&folio->mapping->i_pages, folio->index);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3601  	struct folio *=
next_folio =3D folio_next(folio);
> 5d65c8d758f2596 Barry Song              2024-08-24  3602  	bool is_anon =
=3D folio_test_anon(folio);
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3603  	struct address=
_space *mapping =3D NULL;
> 5d65c8d758f2596 Barry Song              2024-08-24  3604  	struct anon_vm=
a *anon_vma =3D NULL;
> f216c845f3c772e Lance Yang              2024-06-28  3605  	int order =3D =
folio_order(folio);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3606  	struct folio *=
new_folio, *next;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3607  	int nr_shmem_d=
ropped =3D 0;
> 504e070dc08f757 Yang Shi                2021-06-15  3608  	int extra_pins=
, ret;
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3609  	pgoff_t end;
> 478d134e9506c7e Xu Yu                   2022-04-28  3610  	bool is_hzp;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3611
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3612) 	VM_BUG_ON_FOLI=
O(!folio_test_locked(folio), folio);
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3613) 	VM_BUG_ON_FOLI=
O(!folio_test_large(folio), folio);
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3614
> 58729c04cf1092b Zi Yan                  2025-03-07  3615  	if (folio !=3D=
 page_folio(split_at) || folio !=3D page_folio(lock_at))
> 1412ecb3d256e5d Zi Yan                  2024-03-07  3616  		return -EINVA=
L;
> 1412ecb3d256e5d Zi Yan                  2024-03-07  3617
> 58729c04cf1092b Zi Yan                  2025-03-07  3618  	if (new_order =
>=3D folio_order(folio))
> c010d47f107f609 Zi Yan                  2024-02-26  3619  		return -EINVA=
L;
> 58729c04cf1092b Zi Yan                  2025-03-07  3620
> 58729c04cf1092b Zi Yan                  2025-03-07  3621  	if (uniform_sp=
lit && !uniform_split_supported(folio, new_order, true))
> c010d47f107f609 Zi Yan                  2024-02-26  3622  		return -EINVA=
L;
> c010d47f107f609 Zi Yan                  2024-02-26  3623
> 58729c04cf1092b Zi Yan                  2025-03-07  3624  	if (!uniform_s=
plit &&
> 58729c04cf1092b Zi Yan                  2025-03-07  3625  	    !non_unifo=
rm_split_supported(folio, new_order, true))
> 6a50c9b512f7734 Ran Xiaokai             2024-06-07  3626  		return -EINVA=
L;
> c010d47f107f609 Zi Yan                  2024-02-26  3627
> 5beaee54a324ba1 Matthew Wilcox (Oracle  2024-03-26  3628) 	is_hzp =3D is_=
huge_zero_folio(folio);
> 4737edbbdd4958a Naoya Horiguchi         2023-04-06  3629  	if (is_hzp) {
> 4737edbbdd4958a Naoya Horiguchi         2023-04-06  3630  		pr_warn_ratel=
imited("Called split_huge_page for huge zero page\n");
> 478d134e9506c7e Xu Yu                   2022-04-28  3631  		return -EBUSY=
;
> 4737edbbdd4958a Naoya Horiguchi         2023-04-06  3632  	}
> 478d134e9506c7e Xu Yu                   2022-04-28  3633
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3634) 	if (folio_test=
_writeback(folio))
> 59807685a7e77e8 Ying Huang              2017-09-06  3635  		return -EBUSY=
;
> 59807685a7e77e8 Ying Huang              2017-09-06  3636
> 5d65c8d758f2596 Barry Song              2024-08-24  3637  	if (is_anon) {
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3638  		/*
> c1e8d7c6a7a682e Michel Lespinasse       2020-06-08  3639  		 * The caller=
 does not necessarily hold an mmap_lock that would
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3640  		 * prevent th=
e anon_vma disappearing so we first we take a
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3641  		 * reference =
to it and then lock the anon_vma for write. This
> 2f031c6f042cb8a Matthew Wilcox (Oracle  2022-01-29  3642) 		 * is similar=
 to folio_lock_anon_vma_read except the write lock
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3643  		 * is taken t=
o serialise against parallel split or collapse
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3644  		 * operations=
.
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3645  		 */
> 29eea9b5a9c9ecf Matthew Wilcox (Oracle  2022-09-02  3646) 		anon_vma =3D =
folio_get_anon_vma(folio);
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3647  		if (!anon_vma=
) {
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3648  			ret =3D -EBU=
SY;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3649  			goto out;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3650  		}
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3651  		end =3D -1;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3652  		mapping =3D N=
ULL;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3653  		anon_vma_lock=
_write(anon_vma);
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3654  	} else {
> e220917fa50774f Luis Chamberlain        2024-08-22  3655  		unsigned int =
min_order;
> 6a3edd29395631a Yin Fengwei             2022-08-10  3656  		gfp_t gfp;
> 6a3edd29395631a Yin Fengwei             2022-08-10  3657
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3658) 		mapping =3D f=
olio->mapping;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3659
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3660  		/* Truncated =
? */
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3661  		/*
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3662  		 * TODO: add =
support for large shmem folio in swap cache.
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3663  		 * When shmem=
 is in swap cache, mapping is NULL and
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3664  		 * folio_test=
_swapcache() is true.
> 6384dd1d18de7b8 Zi Yan                  2025-03-07  3665  		 */
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3666  		if (!mapping)=
 {
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3667  			ret =3D -EBU=
SY;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3668  			goto out;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3669  		}
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3670
> e220917fa50774f Luis Chamberlain        2024-08-22  3671  		min_order =3D=
 mapping_min_folio_order(folio->mapping);
> e220917fa50774f Luis Chamberlain        2024-08-22  3672  		if (new_order=
 < min_order) {
> e220917fa50774f Luis Chamberlain        2024-08-22  3673  			VM_WARN_ONCE=
(1, "Cannot split mapped folio below min-order: %u",
> e220917fa50774f Luis Chamberlain        2024-08-22  3674  				     min_or=
der);
> e220917fa50774f Luis Chamberlain        2024-08-22  3675  			ret =3D -EIN=
VAL;
> e220917fa50774f Luis Chamberlain        2024-08-22  3676  			goto out;
> e220917fa50774f Luis Chamberlain        2024-08-22  3677  		}
> e220917fa50774f Luis Chamberlain        2024-08-22  3678
> 6a3edd29395631a Yin Fengwei             2022-08-10  3679  		gfp =3D curre=
nt_gfp_context(mapping_gfp_mask(mapping) &
> 6a3edd29395631a Yin Fengwei             2022-08-10  3680  							GFP_RECL=
AIM_MASK);
> 6a3edd29395631a Yin Fengwei             2022-08-10  3681
> 0201ebf274a306a David Howells           2023-06-28  3682  		if (!filemap_=
release_folio(folio, gfp)) {
> 6a3edd29395631a Yin Fengwei             2022-08-10  3683  			ret =3D -EBU=
SY;
> 6a3edd29395631a Yin Fengwei             2022-08-10  3684  			goto out;
> 6a3edd29395631a Yin Fengwei             2022-08-10  3685  		}
> 6a3edd29395631a Yin Fengwei             2022-08-10  3686
> 58729c04cf1092b Zi Yan                  2025-03-07  3687  		if (uniform_s=
plit) {
> 58729c04cf1092b Zi Yan                  2025-03-07  3688  			xas_set_orde=
r(&xas, folio->index, new_order);
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3689) 			xas_split_al=
loc(&xas, folio, folio_order(folio), gfp);
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3690) 			if (xas_erro=
r(&xas)) {
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3691) 				ret =3D xas=
_error(&xas);
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3692) 				goto out;
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3693) 			}
> 58729c04cf1092b Zi Yan                  2025-03-07  3694  		}
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3695)
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3696  		anon_vma =3D =
NULL;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3697  		i_mmap_lock_r=
ead(mapping);
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3698
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3699  		/*
> 58729c04cf1092b Zi Yan                  2025-03-07  3700  		 *__split_unm=
apped_folio() may need to trim off pages beyond
> 58729c04cf1092b Zi Yan                  2025-03-07  3701  		 * EOF: but o=
n 32-bit, i_size_read() takes an irq-unsafe
> 58729c04cf1092b Zi Yan                  2025-03-07  3702  		 * seqlock, w=
hich cannot be nested inside the page tree lock.
> 58729c04cf1092b Zi Yan                  2025-03-07  3703  		 * So note en=
d now: i_size itself may be changed at any moment,
> 58729c04cf1092b Zi Yan                  2025-03-07  3704  		 * but folio =
lock is good enough to serialize the trimming.
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3705  		 */
> 006d3ff27e884f8 Hugh Dickins            2018-11-30  3706  		end =3D DIV_R=
OUND_UP(i_size_read(mapping->host), PAGE_SIZE);
> d144bf6205342a4 Hugh Dickins            2021-09-02  3707  		if (shmem_map=
ping(mapping))
> d144bf6205342a4 Hugh Dickins            2021-09-02  3708  			end =3D shme=
m_fallocend(mapping->host, end);
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3709  	}
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3710
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3711  	/*
> 684555aacc90d70 Matthew Wilcox (Oracle  2022-09-02  3712) 	 * Racy check =
if we can split the page, before unmap_folio() will
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3713  	 * split PMDs
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3714  	 */
> 8710f6ed34e7bcf David Hildenbrand       2024-08-02  3715  	if (!can_split=
_folio(folio, 1, &extra_pins)) {
> fd4a7ac32918d3d Baolin Wang             2022-10-24  3716  		ret =3D -EAGA=
IN;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3717  		goto out_unlo=
ck;
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3718  	}
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3719
> 684555aacc90d70 Matthew Wilcox (Oracle  2022-09-02  3720) 	unmap_folio(fo=
lio);
> e9b61f19858a5d6 Kirill A. Shutemov      2016-01-15  3721
> b6769834aac1d46 Alex Shi                2020-12-15  3722  	/* block inter=
rupt reentry in xa_lock and spinlock */
> b6769834aac1d46 Alex Shi                2020-12-15  3723  	local_irq_disa=
ble();
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3724  	if (mapping) {
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3725  		/*
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3726) 		 * Check if t=
he folio is present in page cache.
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3727) 		 * We assume =
all tail are present too, if folio is there.
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3728  		 */
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3729) 		xas_lock(&xas=
);
> 6b24ca4a1a8d4ee Matthew Wilcox (Oracle  2020-06-27  3730) 		xas_reset(&xa=
s);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3731  		if (xas_load(=
&xas) !=3D folio) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3732  			ret =3D -EAG=
AIN;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3733  			goto fail;
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3734  		}
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3735  	}
> baa355fd3314245 Kirill A. Shutemov      2016-07-26  3736
> 0139aa7b7fa12ce Joonsoo Kim             2016-05-19  3737  	/* Prevent def=
erred_split_scan() touching ->_refcount */
> 364c1eebe453f06 Yang Shi                2019-09-23  3738  	spin_lock(&ds_=
queue->split_queue_lock);
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3739) 	if (folio_ref_=
freeze(folio, 1 + extra_pins)) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3740  		struct addres=
s_space *swap_cache =3D NULL;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3741  		struct lruvec=
 *lruvec;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3742
> 8897277acfef7f7 Matthew Wilcox (Oracle  2024-02-26  3743) 		if (folio_ord=
er(folio) > 1 &&
> 8897277acfef7f7 Matthew Wilcox (Oracle  2024-02-26  3744) 		    !list_emp=
ty(&folio->_deferred_list)) {
> 364c1eebe453f06 Yang Shi                2019-09-23  3745  			ds_queue->sp=
lit_queue_len--;
> 8422acdc97ed583 Usama Arif              2024-08-30  3746  			if (folio_te=
st_partially_mapped(folio)) {
> 42b2eb69835b0fd Usama Arif              2024-12-12  3747  				folio_clear=
_partially_mapped(folio);
> 8422acdc97ed583 Usama Arif              2024-08-30  3748  				mod_mthp_st=
at(folio_order(folio),
> 8422acdc97ed583 Usama Arif              2024-08-30  3749  					      MTHP=
_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
> 8422acdc97ed583 Usama Arif              2024-08-30  3750  			}
> c010d47f107f609 Zi Yan                  2024-02-26  3751  			/*
> c010d47f107f609 Zi Yan                  2024-02-26  3752  			 * Reinitial=
ize page_deferred_list after removing the
> c010d47f107f609 Zi Yan                  2024-02-26  3753  			 * page from=
 the split_queue, otherwise a subsequent
> c010d47f107f609 Zi Yan                  2024-02-26  3754  			 * split wil=
l see list corruption when checking the
> c010d47f107f609 Zi Yan                  2024-02-26  3755  			 * page_defe=
rred_list.
> c010d47f107f609 Zi Yan                  2024-02-26  3756  			 */
> c010d47f107f609 Zi Yan                  2024-02-26  3757  			list_del_ini=
t(&folio->_deferred_list);
> 9a982250f773cc8 Kirill A. Shutemov      2016-01-15  3758  		}
> afb971729a0bca7 Wei Yang                2020-01-30  3759  		spin_unlock(&=
ds_queue->split_queue_lock);
> 06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3760  		if (mapping) =
{
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3761) 			int nr =3D f=
olio_nr_pages(folio);
> bf9ecead53c89d3 Muchun Song             2021-02-24  3762
> c010d47f107f609 Zi Yan                  2024-02-26  3763  			if (folio_te=
st_pmd_mappable(folio) &&
> c010d47f107f609 Zi Yan                  2024-02-26  3764  			    new_orde=
r < HPAGE_PMD_ORDER) {
> 3e9a13daa61253e Matthew Wilcox (Oracle  2022-09-02  3765) 				if (folio_t=
est_swapbacked(folio)) {
> a48d5bdc877b852 Stefan Roesch           2023-11-06  3766  					__lruvec_s=
tat_mod_folio(folio,
> a48d5bdc877b852 Stefan Roesch           2023-11-06  3767  							NR_SHMEM=
_THPS, -nr);
> 1ca7554d05ac038 Marek Szyprowski        2021-10-18  3768  				} else {
> a48d5bdc877b852 Stefan Roesch           2023-11-06  3769  					__lruvec_s=
tat_mod_folio(folio,
> a48d5bdc877b852 Stefan Roesch           2023-11-06  3770  							NR_FILE_=
THPS, -nr);
> 1ca7554d05ac038 Marek Szyprowski        2021-10-18  3771  					filemap_nr=
_thps_dec(mapping);
> 1ca7554d05ac038 Marek Szyprowski        2021-10-18  3772  				}
> 06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3773  			}
> a48d5bdc877b852 Stefan Roesch           2023-11-06  3774  		}
> 06d3eff62d9dc6f Kirill A. Shutemov      2019-10-18  3775
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3776  		if (folio_tes=
t_swapcache(folio)) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3777  			if (mapping)=
 {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3778  				VM_WARN_ON_=
ONCE_FOLIO(mapping, folio);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3779  				ret =3D -EI=
NVAL;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3780  				goto fail;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3781  			}
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3782
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3783  			/*
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3784  			 * a swapcac=
he folio can only be uniformly split to
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3785  			 * order-0
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3786  			 */
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3787  			if (!uniform=
_split || new_order !=3D 0) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3788  				ret =3D -EI=
NVAL;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3789  				goto fail;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3790  			}
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3791
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3792  			swap_cache =
=3D swap_address_space(folio->swap);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3793  			xa_lock(&swa=
p_cache->i_pages);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3794  		}
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3795
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3796  		/* lock lru l=
ist/PageCompound, ref frozen by page_ref_freeze */
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3797  		lruvec =3D fo=
lio_lruvec_lock(folio);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3798
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3799  		ret =3D __spl=
it_unmapped_folio(folio, new_order, split_at, &xas,
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3800  					     mappi=
ng, uniform_split);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3801
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3802  		/*
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3803  		 * Unfreeze a=
fter-split folios and put them back to the right
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3804  		 * list. @fol=
io should be kept frozon until page cache entries
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3805  		 * are update=
d with all the other after-split folios to prevent
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3806  		 * others see=
ing stale page cache entries.
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3807  		 */
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3808  		for (new_foli=
o =3D folio_next(folio); new_folio !=3D next_folio;
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3809  		     new_foli=
o =3D next) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3810  			next =3D fol=
io_next(new_folio);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3811
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3812  			folio_ref_un=
freeze(
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3813  				new_folio,
> 4d32dd3cb41df4d Zi Yan                  2025-07-11 @3814  				1 + ((mappi=
ng || swap_cache) ?
>                                                                          =
                     ^^^^^^^
> This assumes mapping can be NULL.
>
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3815  					     folio=
_nr_pages(new_folio) :
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3816  					     0));
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3817
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3818  			lru_add_spli=
t_folio(folio, new_folio, lruvec, list);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3819
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3820  			/* Some page=
s can be beyond EOF: drop them from cache */
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3821  			if (new_foli=
o->index >=3D end) {
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3822  				if (shmem_m=
apping(mapping))
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3823  					nr_shmem_d=
ropped +=3D folio_nr_pages(new_folio);
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3824  				else if (fo=
lio_test_clear_dirty(new_folio))
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3825  					folio_acco=
unt_cleaned(
> 4d32dd3cb41df4d Zi Yan                  2025-07-11  3826  						new_folio=
,
> 4d32dd3cb41df4d Zi Yan                  2025-07-11 @3827  						inode_to_=
wb(mapping->host));
>                                                                          =
                                           ^^^^^^^^^^^^^
> This dereferences mapping without checking.  This code is too
> complicated for my tiny head so it might also be a false positive.

This seems to come up every time I touch __folio_split().

Based on line 3651-3652 and line 3666, mapping can be NULL, only
if end =3D -1. On line 3821, if end is -1, new_folio->index >=3D end
cannot be true, so this line cannot be executed.

Best Regards,
Yan, Zi
