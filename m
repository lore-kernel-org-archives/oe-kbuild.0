Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231CC3E49CD;
	Sun, 27 Sep 2026 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524833; cv=fail; b=r8FBS93AN97ahd7WfsjApqDWDn6IZJZG5nyMUcRclSceEh42PPeWj+5/j0OLShY+VR1GBqqWXm14R5v/DUdVR2GQNRuvLKeV4n9j9V63wEHFkRNMpfolHeN6D0HVnO880WKLP4SYvg3T3254bTOqEHF1nS94pndJnL4b8sS9S3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524833; c=relaxed/simple;
	bh=lGXph9KAv3R5TMSexrNYklypy3wMVD2dGDadbK1YObo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cP84+nIIXFQnTkKHLVl2qkT2dDECyuvVJFU+3/Fahag6oaL3oruic9m0TlUKBQ2e5FlnaGrHAfak7kTJnRRA4f6Oo8OxLXmPmDrZCrVtvp/9YFbVPkjxyyNlZ0HDlQHa/GVA5zwR8xnIa+/Qyz8I6yDOrS9jYn4LZpvgnEJEDXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lUP6DFp3; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lUP6DFp3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa/qeaVpgCOlxQICwTg8AyhRuWKJ4zg2CfBI9ar2wmbFHVmQavkZpfFeuXAEJtp3WqyFdCFAOiodDEpyiD5IJa8kDOUTehkqcZ6RIExldr2EI7S7hano2A+ZIIr3D3PX1eMHSUl1swoVSg3M/8T/xf+UfKiW1ccce1jv5sagYRizIspMRNiuLRJ9CzY8tZ9hfUUD/+kL0Qk6DJUe2R1MYnYFWEvaptvEoh9orgfyB4dV92g6MKd4zglQpEu7JXFxagowNqeY+LvAW+KE9nyOpT7IaeT/PeBMhUISYs913g0ijd/EDUFEgvJOisz+ZjrGlXAoPNpmUCVS7JK19sfgiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKu1FO+oVZXrt3khKd3GB0yJe+ZY+IKHQMyeDhqntfk=;
 b=EmX0z96nZ7cS0sXkqv4ucP/F6YgID4GA8ojP27R7/2OaMvuSke+u8PqILFqBX7ceKppM2EPmNWi2zj0GxPt11jME1X9WJV5UvUIbI9AZoAqupQ1NeitTxfPnGQE4gVkEoPtmqC4UYL56XGxCexZKrIUI3t8dnJqrtxXTSlIaKUTzEHuEMJXfECt6zCFhqDTyyp9NdDparp6P1NrOkn1RaxYpH/ldwNfFc7CvRxNBtwAbEE6XSvk5SVJ6GX97GQGDOQjIVgaxURAfq34e3pOXa6IG+86gId6wAaoiBjiCbPR9QASsJ+TGSo9lywAVJVEGuSDnWpI7V1Gm+c+wYjkLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKu1FO+oVZXrt3khKd3GB0yJe+ZY+IKHQMyeDhqntfk=;
 b=lUP6DFp3HWopDKbhzGR996WIJpsMf/eKJEqxmcwkPt2amd5/8ao15ILR2PhQwphigR7x/G43WzYUR3uHj99FIcpcTgT94bB/agn1LucgMSjWb457HU55KeaEvIpMOEG00XBj37OKwh7YkCw5M4fvAd1dpnG1cn9L0BKFevGIOCs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.23; Sun, 27 Sep 2026 16:00:27 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 16:00:27 +0000
Message-ID: <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>
Date: Sun, 27 Sep 2026 21:29:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 Mario Limonciello <Mario.Limonciello@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>,
 Syed Saba Kareem <syed.sabakareem@amd.com>
References: <202609271355.u0pymQoF-lkp@intel.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202609271355.u0pymQoF-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 810bf340-28b4-4ac0-dd43-08df1cb07271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Gjr58VyaJI4O9WojfgkpkIqhR8DvjD5c91DO+et4hyWWTx+Jn4EJ58EGuU/4zSRYa4ux9vzxp+oIDabGVSEuPYL3nbm96OBdLmKdM2hbHP2kwS/UwLTxanMfrcSBLKzZt56wzk+rPQ2+JGVCESGpXsU+aEW7A12yJ6xY4j1iZPsjhjBVHCtO50GMixIPdnY/o9ah+jJjy7s+BILBqTVwLKd82YUyiwhpfJyeMFH7ye2kBTmyNU/Yog6AIeRbCer+OstEJNMHP/JRZ/7eJuPvyqs5yONt3Yfbpem/5DO+og7YPWnaooWrp+iPjVNDui2DmC6gtAVO8TKzNG5/XOI7HGwLoFduMcw4FIpsYg5k4f5qF7HDsaXtTaumKbSD+VII3HLCCK2jtsXnNZe/DHiI4g9HnfPaDpby8cOFb4OPp/cAdRoqBYfNnTYIu04vzdVXj+vCFEc6HWnel7WMfzGC0da7yoAEj6pmTmF6LROuUvM6ANa17cC5jQlprstRj6s5wrtdpDaK6IKc3LkamjtEVSUYJ55GtIg7WOCoSBoxkwFoKLNss7ZrX/S+2V881thzgwrCk+6dnRvyTR68MdCofTxTZpWBoU79DZinZESb/O4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE0vUnR1ajBmZ0kxbXJaUlZtZ3ovb3ZwN0I0MmdmOXJLMkFQdnRiYVFRc2J5?=
 =?utf-8?B?ZUVvOHRKWmpScmpyc3Y4OEZhejNhQUdUTUp6ODJjYnpCdEVJa0ZFRWViclNR?=
 =?utf-8?B?VlRJbnhMZWJVWXpOMnJaZHJMU2JDN09DTG9uU3JJbzlDeWwybHQ1Qi9RbC81?=
 =?utf-8?B?czdIeDZNcWQ0dzl6S2U4WTFmTjZiRTRKMktTVzIxQm5IOWFrSFJicnpzcTNI?=
 =?utf-8?B?WWdPRThNRlVQM2l5RU53SHRDUFpDYjQ3aURmV1V1Slc2NWsrc0RiYVQxZ29X?=
 =?utf-8?B?V1hZd2VZQ2ZwTDF2bndnU1JDRytXT2ppQ0x4Z1dJd1RoV3pzUUtKbncxUW9m?=
 =?utf-8?B?aXdweXFwcTIxSzhIOW9wM0FqRnA3cUtCUHA1RlNTTGttV0VjMjhsVWFSQzBs?=
 =?utf-8?B?QTJwQjU5MjJheUx4TWxrUllJZCtOL01iMWlyYXQwK092UnJjZ3BHbVUzNmRX?=
 =?utf-8?B?UlNZWmcvaTkrZnNDaVdzT1hBUkpXeG0wcTU4Y1RvQkV3Q3N5NnU0ell3eko0?=
 =?utf-8?B?YXA1dGI1RFhUT3ZxVnlhSFhRbXU0cCtIOTM0WWYxaVlqYVZleVNGM09Qb3Ev?=
 =?utf-8?B?UXJMc3FuNW1OK2c2ZnlOSkQ1UENieVF6Mzh0djR3MVMyeURGOTFYZTVKZXpE?=
 =?utf-8?B?Mk9aTjB1S2UxOE1Oa0FrY2N3VytLUTNISlBrZjdTT2pQVTVnT0ZOTFJxRDJs?=
 =?utf-8?B?VXlXcFdhbEttQ1ozOUpONXhzK1owczlNVVRlUjJFREZKSWRNZ0RyUTZYODA5?=
 =?utf-8?B?ZG0xbzE0NUhVZ0Q2UUs2TGZBZWVmZ2poQVVPSG0xMW1pOXRuUjNveDBsQ1VQ?=
 =?utf-8?B?RDZnNW9DcGgxeGViMHNXeld2QnVZOEZBVjZITHZNb0kvNElydUZ3RzZDSlVs?=
 =?utf-8?B?bFprLzFkaXlIT3BGSVNPMWFNYWxrbEFXYlJuNnlXenFhaUh5dUZFT0VTQjI5?=
 =?utf-8?B?b2RBd2tkNzBkTXlWeHFsWTFWdFpYbXVNemx1eG91ZEZSUUZWVlE0MVp0ZmRl?=
 =?utf-8?B?RlpXanp5ZS9lekpZZUZseHN4NzdnVUkyQ0ovZEdIWlBzQm1jQzVTVCtNci9Y?=
 =?utf-8?B?a3MzcmhKL08yS2VYQmI1S3ZiRDFIeFRqVXZweVVyUkFhUGhHTG1hMW5uZWhU?=
 =?utf-8?B?cWpKaktqNUtadmRxSVFuMkFTZytzb3FKUUJFQ3N4SFRNMFp4WUxmVHhGNE1L?=
 =?utf-8?B?cjdTOFpKN2ExeXJVajY4TDJJYi9wc0s2ZWhkQjlSVVlla3lhYTFpNG5SZHBm?=
 =?utf-8?B?M3JuZiszdVFJQjROcEJ0ajRFMTFzR2lCRUZSeEZOamtYeDJKd2ZFNm9zMUs0?=
 =?utf-8?B?anRNU0VkV2gxRS9GVFNkcVY3TU1ZUlVvdGN3aytqSjFnaEpwdk5hSVIwSE5U?=
 =?utf-8?B?U20wNDVLN1dtQUZXdkcraW5sLy8yQ3B4TDV4aEhqUGlQNVFwN25ScXRtTWQr?=
 =?utf-8?B?aGR6THFCWVNraFpLQ1dxTm9mWERQVFZPZlVTb1FMTS93Tk5GeHFaV0p3TjM4?=
 =?utf-8?B?ak9XdWEwV3FTbVoyUExNSVNvd2I3U0s3aHllVitKakhOWnFlOTQ0T1ZsOHFi?=
 =?utf-8?B?MGtleGoxM2IyYldrU3NEOHEwaTUrNXo1ZFp5MFhHekQ2OFRTVVZFN1VaRzZZ?=
 =?utf-8?B?V1N1Sm56aE9ENm96TDFrdlZXa1F4a2c4WlFsUldwWm5EM3MyeUNFblZuU0Uv?=
 =?utf-8?B?QUFkSllqMWhHcWRTeWx4M3dmUTJZQXBYN3RWZldiMnYvUHhJQk5Eb3hUUkN4?=
 =?utf-8?B?dllxaUVhRzVscUNOd1gwY1BoQUlzcFI2d2ZLNHNHc0ZnQUNxcTlEQ28rcGVI?=
 =?utf-8?B?b0lBRlpESmFUa1h3eW1HNVl6WXcrSExwNExpMlIxc3B4MEN1ZlFxRXRGZmti?=
 =?utf-8?B?SEo0cFpyTlBtN3g5eFBYcThQRzhiTHNpNHZyS2xiMUZKZ2M1V1FLaWVrUTJG?=
 =?utf-8?B?WUhDRzcxUUNNUmJEVDBqRkI1b0oyY0lOVUoxV3dsZE9iQXhHMFNvSlNyaHFy?=
 =?utf-8?B?N25yZk03U1FRNVIwS0w3Tk12d242cmxvSVc4NkpPV2hUYXMxeVlkeVFEdzJI?=
 =?utf-8?B?bkVvbTB1cTZnbzQ4dmx3QnlFbllQcXNURFgyelhRVkROeHZSOTNnTDhSNExa?=
 =?utf-8?B?M3lmZDlyYWR6YmlFSUMxd3JJSk05bWZKMXcvSU9LNGdCb0FEdnZUdG0wNlJn?=
 =?utf-8?B?SkVLM1NrYnNQTkQyNTdHSitVaTg3L2d0dy9EVkdTOCtRVlJWRW55c1dZdjhG?=
 =?utf-8?B?L2xHRGczNHIxbnAxejFWN1JSTkZwZDQybXFsTm9LNEdLajBuczJCZkRKMHA2?=
 =?utf-8?B?amQwWitZeWVPSTU3MjhySmVhOTRYYWZFWStvYTVaUHFOQkRNWW9Ndz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810bf340-28b4-4ac0-dd43-08df1cb07271
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 16:00:27.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQzGLeZw5mqHIDl6Ndsl8ZKV0TQ6GOE7Edn4Swqv5Rf6OLa27hI5UFuBJstaIbI1hurda4VD6c3Qxtj150qpPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428



On 9/27/26 20:52, Dan Carpenter wrote:
> [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
> config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> smatch: v0.5.0-9187-g5189e3fb
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/
>
> New smatch warnings:
> sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
++

Thank you for the report. This smatch warning is reported because the 
ACP7.B/7.F SoundWire specific patches have not yet landed. Those patches 
add support for 4 SoundWire manager instances and allocate the platform 
device array based on the maximum instance count, which resolves the 
buffer overflow concern flagged here. We are currently waiting for the 
dependent patch series to complete upstream review: 
https://lkml.org/lkml/2026/9/17/1422 
https://lkml.org/lkml/2026/9/17/2552 If the review of the above series 
takes longer, we will post the ACP7.B/7.F SoundWire patches for upstream 
review independently and include a note in the cover letter documenting 
the patch series dependency.
>
> Old smatch warnings:
> sound/soc/sof/amd/acp.c:663 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
> sound/soc/sof/amd/acp.c:666 sof_amd_handle_acp7x_sdw_wake_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
> sound/soc/sof/amd/acp.c:1472 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
>
> vim +1469 sound/soc/sof/amd/acp.c
>
> be2823854e0055 Vijendar Mukunda 2026-09-10  1440  static void handle_amd_sof_acp7x_sdw_pme_event(struct snd_sof_dev *sdev)
> be2823854e0055 Vijendar Mukunda 2026-09-10  1441  {
> be2823854e0055 Vijendar Mukunda 2026-09-10  1442        struct acp_dev_data *adata;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1443        struct amd_sdw_manager *amd_manager;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1444        u32 sdw_pme_stat;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1445        u32 sdw_wake_en;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1446        u32 pme_reg;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1447        u32 wake_mask;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1448        unsigned int instance;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1449
> be2823854e0055 Vijendar Mukunda 2026-09-10  1450        adata = sdev->pdata->hw_pdata;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1451        if (!adata->sdw)
> be2823854e0055 Vijendar Mukunda 2026-09-10  1452                return;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1453
> be2823854e0055 Vijendar Mukunda 2026-09-10  1454        for (instance = 0; instance < ACP7X_SDW_MAX_MANAGER_COUNT; instance++) {
> be2823854e0055 Vijendar Mukunda 2026-09-10  1455                pme_reg = ACP7X_SW_PME_STS + (instance * 4);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1456                wake_mask = ACP7X_SW_WAKE_EN_MASK << instance;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1457
> be2823854e0055 Vijendar Mukunda 2026-09-10  1458                sdw_pme_stat = snd_sof_dsp_read(sdev, ACP_DSP_BAR, pme_reg);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1459                if (!sdw_pme_stat)
> be2823854e0055 Vijendar Mukunda 2026-09-10  1460                        continue;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1461
> be2823854e0055 Vijendar Mukunda 2026-09-10  1462                mutex_lock(&adata->acp_lock);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1463                sdw_wake_en = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1464                sdw_wake_en &= ~wake_mask;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1465                snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP7X_SW_WAKE_EN, sdw_wake_en);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1466                mutex_unlock(&adata->acp_lock);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1467                snd_sof_dsp_write(sdev, ACP_DSP_BAR, pme_reg, sdw_pme_stat);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1468
> be2823854e0055 Vijendar Mukunda 2026-09-10 @1469                if (!adata->sdw->pdev[instance])
>                                                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^
> Feels like a bug.  AMD_SDW_MAX_MANAGER_COUNT(2) vs ACP7X_SDW_MAX_MANAGER_COUNT(4)
>
> be2823854e0055 Vijendar Mukunda 2026-09-10  1470                        continue;
> be2823854e0055 Vijendar Mukunda 2026-09-10  1471
> be2823854e0055 Vijendar Mukunda 2026-09-10  1472                amd_manager = dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1473                if (amd_manager)
> be2823854e0055 Vijendar Mukunda 2026-09-10  1474                        pm_request_resume(amd_manager->dev);
> be2823854e0055 Vijendar Mukunda 2026-09-10  1475        }
> be2823854e0055 Vijendar Mukunda 2026-09-10  1476  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

