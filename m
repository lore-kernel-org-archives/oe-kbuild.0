Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3927489
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 01:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715563485; cv=fail; b=Welj2Vtc/VE5di+eLSXHBmMs4oOs4wzOABuj/juujc/jw4uk6PpRTqfUejskbykDVj15GVLqujZRzQDXTM2e53j84uOEzGMOw76qld9K3n24mV1Eu/9tay/S1b9ikDUMxM5fTmkGQHZheMhxPzvWN0i1LmE45Jyq4VOR3u+Bgec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715563485; c=relaxed/simple;
	bh=jw3Uvzy43WLLiv6uCvxxeYlVV76iDkI7lqbfi9lx1h8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KrAdHbw5/YDM6ellCEouu4N77ggud4pSx9hWGMliVY1XlLBAP2OuftF1VoRKepy/DpNYov7FHZGkEXAQFcET/X702TKH03ffud72jjSjqvxaberj18dp8TaiYcbhfD2kHtwQ8f/teqIz+reRQc5Tfl4a4dtwcoWU9/tzpc9T/iY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsx8VaTW; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsx8VaTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715563484; x=1747099484;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jw3Uvzy43WLLiv6uCvxxeYlVV76iDkI7lqbfi9lx1h8=;
  b=dsx8VaTWk9381WaXVX9/m2XTdVDbW/nFvIQFCGI+olv9WA3/j/DpkJaa
   Yzp1rlGz+Fk1Z+Zu7nJNxdSA+uJ7OZ1atwBZat0qgF+nY6iya15OCcTro
   Np49HxpxaaKb/CX5YkDk60w6yPrHXIqjSIvWBMl6JNwFw4ZeqWDuWp7F2
   vtwZIZlMlJb25iLvUm/syreJ6JO0nVv9OUtFqBpimEJ9LvpxEazFy6+5T
   sLyyJvpnYaaAckc8LOZOyEr1fkvUSjoSmM4LSm/4RPadfqJ2VImDDlLOL
   w5TNytmvuSnYD6wiQ8cmKyr5y/oUstnxaJr/6sRlwfkPcUGFGnEO59YvH
   g==;
X-CSE-ConnectionGUID: A5Tr7PBYQIWMA5eEeeNwbA==
X-CSE-MsgGUID: 9HlibOJtR4m29d4D+d0OWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22055146"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="22055146"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 18:24:43 -0700
X-CSE-ConnectionGUID: +kqL0vayRqy/nRav22IIdw==
X-CSE-MsgGUID: iAIrx5r4TpGpwWx3sQ8jnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30257132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 May 2024 18:24:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 18:24:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 12 May 2024 18:24:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 12 May 2024 18:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMtvPtV2OHoHIep0xFzFhZFgXKbkB8JmfUtXo5yvIEpav88bFP9dTcaNXsU7Z0rTynJvtgDd/XcjS1SWiyxEM6GIPUwMTznYuuhDbZYKpddsgfoSY6F6LqznD0tqjGzeDxlYI4NHjISRgYIr57g307KrmXFu0HRsDhBT1M0QX6FmUgFOlVwk1R51TfUDwrqg2U7R9xBJ8jSBQXrBptwcT3Yydu4Ykhnm8ZrmsNVIihIdzlQ3xPic5+kpQhBgQMpGjdUf0M8onATwikYMGE56C2OnfTBGIJA1t8u9MUYeLDCv8qN3I0y3CeBorv1qtrQfWLzZhN8Bg3yLOQtsG1Ducw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgoEhKS5LG3Pr32x1FtSgRLEHKG56CyEQwQVwJtQzSU=;
 b=AAmshd+OiUEJViQwuEpWBxX2WfNe8SagzF7HcsANK+f2SWQSd67QlO3Ysdu8XhNjgUjJe/SNQp/ThNQIPDCZLAoqGmg1b2AWdTuouVmmFKKxZc0jEnD9ogIe714MtGdwXcjxsNhVCvoReagrriPlurqv8FvT3U53eHTWWYNJAPkQgJM1LhhwdBatGeM5qz9GWVcN8J+/CUzJCuJFtddBNyqc+97r8gbXbYNY1QX0t8uEOukn07/rgXKO7fCxaZBBr1tplpPyqpzTQB9Gh52tcHz4eSig/0znHIla028y5RGiml2q0Updrrz2Y0B5Rn2cJe9D3Pi7F/0/E0XrbmuIDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DS7PR11MB6272.namprd11.prod.outlook.com (2603:10b6:8:94::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 01:24:40 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 01:24:40 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_define_generic_fields (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Thread-Topic: WARNING: modpost: vmlinux: section mismatch in reference:
 trace_define_generic_fields (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Thread-Index: AQHao8IqiLePoenT1UGx5imFTRQXxLGUYJtQ
Date: Mon, 13 May 2024 01:24:40 +0000
Message-ID: <SA1PR11MB83932E45BF672B8520C009FCFBE22@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202405120050.l6gENQt4-lkp@intel.com>
In-Reply-To: <202405120050.l6gENQt4-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|DS7PR11MB6272:EE_
x-ms-office365-filtering-correlation-id: 0056eaea-f837-4536-e77a-08dc72eb75fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Qe2gMV4kWNq8+f//38pyha2TyE88wCtLRwfcYAM3P1ywInz7XB1PnrLzobPb?=
 =?us-ascii?Q?Rurb4pyI9B8mwYzeAxwq/YmSRSyg0WAtPoUoZx9JOwZl1b5iowFJCmuNftwb?=
 =?us-ascii?Q?yz4T5RBv4gmmfIDWLhjXZSMM9e2o/aT7wlnbJtoO6cHPlgBZhbP77juubBwA?=
 =?us-ascii?Q?x533slwINIayWzvGmUBsfE+ZqrEKnZMvLHeQ1jhf0/IDRt/xYt7pROnD2wdJ?=
 =?us-ascii?Q?cZp2ALQ/PVLExqwoocTkCpuSFI++i9jR8ksl8gA2b1ZHew6jMLGZuW4+XyXz?=
 =?us-ascii?Q?lzCh/nJ4tSKBGkNZieQpNczjqOWAp6HHJOtNVtsut6IXEOzdaKeS/Zk3fECG?=
 =?us-ascii?Q?qfBaL0Ms1dxH+VO2eXCXJZhWqaJwabI1saYvgL1wFl+5gEDU0zwGf5N26S3m?=
 =?us-ascii?Q?22mS3Hs+bru0Wir5qlz+4Otv+YooaZnGgGXFM7EeObhXuWU0Vuxu6q2z7XZG?=
 =?us-ascii?Q?aucG1/q/Eav5xgQkenKZ7dt2n8WSpVdejowVlRWrL1F5CnhmIO01hPcA4Hml?=
 =?us-ascii?Q?geX53aswWS0r+u3qBinpzWwZlwM6BoF5mp+rhsNI2tmlBshmJ5X/3w9pk/DX?=
 =?us-ascii?Q?eCnD/ImKnUS0llvKxPGJaBufowy7qvTexF05Nyz3uyLw9KzQP4EdeESXROfv?=
 =?us-ascii?Q?tgLAbd0V+6RhhtthtadruJZSRQ+2CjoND3Zv03pA9M030Td3VNtfRmJO3pye?=
 =?us-ascii?Q?9vNex2pFHsS+2xFrt86jWM/ZNb/fHVUT/vSDBV7IUM7lnpXkxYWasJ+W4D7Y?=
 =?us-ascii?Q?5K7Qb4nQOQQSHK5qkAPEbtRgx/BDTcpstvxUMuP+axjVGgnHYyoHuzh+2NGG?=
 =?us-ascii?Q?R7fKH8iu9I58lUMqUNWQ+zXeIXgozQnUr97I/SCGKB3h6TQqTQ0JBJEqn6KO?=
 =?us-ascii?Q?HhzYvhiikj32l32QQEjUDDgwu2HkeniQmRDHPFXm3Fy/YUTefncc0LaLc3nm?=
 =?us-ascii?Q?PdsVrw2fM65JVsEggRsovKSQEG22R8POVs75E4stEn5pviBK4tQnIHAa3nGz?=
 =?us-ascii?Q?xAhcQz2koAP1Hqm0CPgEwZu0Qy9lakYyEu3an0JGUbaKaQulnnNaFjcBh36o?=
 =?us-ascii?Q?bFhZr5kAh5ggq70iwc/qBZFRX/C3U6uT+sFPuJ9WXgSLwzVlO4ft1FDwQy0k?=
 =?us-ascii?Q?ba+nqAIT4DVaQEJJxsuf+viw/2l8LXhYaCeduwHVScYgAggGp9RL2qIXPyBy?=
 =?us-ascii?Q?RrGbGYwOi5o2Tl3+qKZyRb+J/DQ2q4IkC1gG1iOFM6iSS1VlzFEztQN4UhEx?=
 =?us-ascii?Q?HIa4l4eyqkJTZNz/LOcUZmJwMttkiweMOTMv8mYCSo/oNgZvTJl6NzpSGWTr?=
 =?us-ascii?Q?8pc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7i8W3Ot/SUa9bDwNg/+87zk+uzL+cxg1rvA7Nc2/MSB9XZn+hVdSmwbprax4?=
 =?us-ascii?Q?FG1lNRvBcBdbs+VXfqxvUTnK/Bn5hHW3TLEGe/zGiQACjJfGZ0Tgctg6Y3Wq?=
 =?us-ascii?Q?N8iEf6zz7rs9+BAG8h0A4bQY3Ve4+wy4GoX3kLFgSHBoqaHipnol024Uijw6?=
 =?us-ascii?Q?KhR5WfmtEB1kGSGfQOrzWdYbPIiRX8+oQ8/4f2kvznQgLB5WEGmUBLS5ED+M?=
 =?us-ascii?Q?bKJ8+iihlzM5wXwuEj2yVU6h1RLCWNtqtVgG0EuviZMBFVJo712nVgnu+0PI?=
 =?us-ascii?Q?I8JI5WpTiVUYlheBFxrXiw7Nh87RlNOeUT6JhuWRsqCcMih+5wquU2S3ym20?=
 =?us-ascii?Q?K4izsl/1xFbQVnVCb6sBgoOLqSBLqmb4+ijq75cy2yyMw9LQoAWET/Tif6DR?=
 =?us-ascii?Q?c7IgxypRt/yg3Kd2K0mwphWL4HydsbQ7tYATucgYihwytSwTYTYkKi+EOvxn?=
 =?us-ascii?Q?6TRAmpi/K5tXEsDDdOzh2EtX6JDVHaRNjNdKnDuZDkAfyPRcbAyiLPSYbM+I?=
 =?us-ascii?Q?U2yZdZnJrIitF7btXSQSgFzG768f2gcQRbk40iriAbjYIRUCZbghH0xRNbmu?=
 =?us-ascii?Q?LErSHxjOW/kSBFjq6juzwpob+VSOUG7r/7R4HctVstix4mgRoRrlPwxaO+aR?=
 =?us-ascii?Q?UD8BiPJO5VQ6xaXOmAVycmRcJcKIPov6HnwWt5KbGAjoRLJWXzwR32T55m0C?=
 =?us-ascii?Q?t73sk8T4DohuDdz4FP/Br15pKreEBVRtJxnmdsrR6TdIwr8+txfoTTzdaHgf?=
 =?us-ascii?Q?Dc8k8FQsXrYGfptTlZAbCIVAO3r1eEb9IjpQV2OJ1Pi3pgd4y2emaXgUDUa4?=
 =?us-ascii?Q?o53HA5DcuiNj30Y80DOyxPh0spvIgMmxQELHvhiXstJImp+M8I8v/hdyJF5j?=
 =?us-ascii?Q?Gz8n3f4O1e3FfHla+qIZhMudFIz816hIsNzoVDx4FAAGiYSGlftZxMcDBYEe?=
 =?us-ascii?Q?v/aw1RMhBgGvbRLb7unS6YV/NRhEsebhXW0bHCaOWUAPq1iz/qIX1BT84ihF?=
 =?us-ascii?Q?j+fyRARZHqmPe49HcD81j9nlnfhcC9r7/TRMiYUDqUwRMFVgaMITHcPQREW5?=
 =?us-ascii?Q?LNJJpkMlOabUJ2ssEW6/B0CDwXYs+QMjGSBevx4wX7lq8cTGz9Pux7HNEqz4?=
 =?us-ascii?Q?50bjvA1l19nIRaQSIRVvxMHY4GJpJNPdWFkNZqimJ5YQ2aTmji8s30tkHxcm?=
 =?us-ascii?Q?uDY4VwAtuYGqOJQid7uBb+gnaElYIHxFTHWW2kZvjfCICNE8BbxYFxlpSKYW?=
 =?us-ascii?Q?+opEkvl/kO0xR76B9pvy2dtEG07h3le866J3FS7klFmFwpkDdEE+BDDaPjFV?=
 =?us-ascii?Q?hUmDQNIVSJhtvFr3ehxUKiYHcDN1fEz265ooKwRKkSnJ0YuvRC5l09xrDRPH?=
 =?us-ascii?Q?gvFOZidcWdm837g510SmEcBxXIAFlFOHPnsh7oanmwv0wxSwoFb1mvqJaXSC?=
 =?us-ascii?Q?GanwOv5bHw3VrD9FXg655NYPiwTaWLcAXuvkmgcvLc2LTRotl7sfa6EoXwh/?=
 =?us-ascii?Q?oOQIyxS1rSJOxoTzC2H2zISUtDU3b3GTTIlVXmm5JkUUvd/RumIoiGvbHG2E?=
 =?us-ascii?Q?89aofaT+iChniQoxUnQCMJhdOFKfVAxNgeCEP4kT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0056eaea-f837-4536-e77a-08dc72eb75fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 01:24:40.1614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SByXL05sY17H0eHedBRsMyTBu9zezD8Ov5uU5CC00kQH6i47lwCmMGtvOEx0kTKHXkVWIhqvgOsiXTDXBgybsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6272
X-OriginatorOrg: intel.com

not_report

The text of warning message has minor change (vmlinux.o -> vmlinux), but th=
e warning exists on both parent and fbc.

Parent:
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_define_ge=
neric_fields (section: .text.unlikely) -> initcall_level_names (section: .i=
nit.data)

FBC:
WARNING: modpost: vmlinux: section mismatch in reference: trace_define_gene=
ric_fields (section: .text.unlikely) -> initcall_level_names (section: .ini=
t.data)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, May 12, 2024 00:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference: trace_de=
fine_generic_fields (section: .text.unlikely) -> initcall_level_names (sect=
ion: .init.data)

::::::=20
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

Hi Masahiro,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cf87f46fd34d6c19283d9625a7822f20d90b64a4
commit: 94d6cb68124b7a63f24fcc345795ba5f9a27e694 modpost: pass struct modul=
e pointer to check_section_mismatch()
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: xtensa-randconfig-r025-20220501 (https://download.01.org/0day-ci/ar=
chive/20240512/202405120050.l6gENQt4-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240512/202405120050.l6gENQt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405120050.l6gENQt4-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_define_g=
eneric_fields (section: .text.unlikely) -> initcall_level_names (section: .=
init.data)

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

