Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C55A4C226F;
	Wed, 30 Sep 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769871; cv=fail; b=OGE8w5s3Om8aEppUXTbgRgi/5iWEZhEuGsrnicg/E0+VgHOzrvL+W3iFlKhunptuCLGDyidlBcJeWYdDJVmy9l3nkFu/LJ+37Q9hmQUg4/cdMG5ElXO7zLEv1EfZTaF53uNTbRCtzDGs6WamUPqCfYHBldMhNWuYjEoDAY/nLN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769871; c=relaxed/simple;
	bh=cvGZvuBKBTLGlodyxUKkwVE5ty61I/GmmdpIrpWjZcQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kbNViL6bgspPEUo/rdQcF32eZlPBAiJlo1oNxuqRiBnakAtwN/uYM3U++EFY5ZkkM03exYLqum0ba/OBDMFrki3tzuMH4XSYSO6y265gp4bYOJtj1+I5Tv803WyKBHLrDHjTc3i/IsRIKTlo4fwLW5CPJAGG7M6BM6fDYjz1fcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsRgWGGM; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsRgWGGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790769870; x=1822305870;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cvGZvuBKBTLGlodyxUKkwVE5ty61I/GmmdpIrpWjZcQ=;
  b=BsRgWGGM65yAfc8vgC6ze0FMXYDgJ9os/FhLrDVLTFPkl88hCOl+6oOZ
   FRyDuSVBegYQ6302nsLJNM/HdoDZoXZZuLRrMi55GxJXQav8f6+179wGW
   riNn0mjSHCzzLcBd/qOt9atAeJgToLYzq38kdpQCHWM6oMOoTsky4wM4g
   MHODr2qF+acMTTw/wKczfSHnsM5pn6LjPCWFxygPJEwqu3lPMMCSxH+1J
   p/daLTKxiw47ipUupU5eOvJvQkWxcifP1foCXi4KXkR6ozhlehPl3NUZC
   FQ9l26VM2wkG05Dm+Z5Zygi1RrGFrN4vJ76hMh1vJ1iRw02LmR1M8Kjgu
   g==;
X-CSE-ConnectionGUID: nVI/pDdCR9G5zo/I17ezng==
X-CSE-MsgGUID: URrZ4aFlS5+IC6yf4PMrLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102076626"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102076626"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:04:29 -0700
X-CSE-ConnectionGUID: Wnn/MJvZQA2VL5/plTA5Pg==
X-CSE-MsgGUID: mXyE15b6Tb+wzaar6s2mUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="272131970"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:04:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 05:04:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 05:04:28 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 05:04:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8TbnCT0Z/BA0Esh+2IikuG1RgmK2wolz9NyIPUhKLIoaG1cUjKuniMUWm2BoJU9evajvxjOkijdjZTyoByVoVrbFam0Rwlc5822AmnN7Rr38ngxUMdelRxQJ1lsFaHs5YdsWUb4XqYtfVvrTYXL8EZmC7jCDuAMLEjiQ5xmcdf7wTBRaQan3ddIiYduIi++awQ3CWnEcs/cXaIymgDAESz1/rQ1qFE8CyrBs5mYKmjaLsV5VTOH5qBYjZYmha0WGQGEVhQB7KX38djYje2EguwDBPXud9+FFvs6JwrSLrxFDyvrSsWJXQianCLisYrmhfexDt1OZj0l4Mg0p52+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHIVIh9xHxgZHCE2bzCkO6v9M19eqcOVSda+gtP3R0g=;
 b=LWFp3feqZk4LTy7thBQCEp6SPViSZNoMJq/mj9zMljqHILshof/o5WAFqRfRWMwPqiiXXDPHZoZeitS73SdIw2YcdMrNVmaKN6opRD8kpy7kN2DkkiPZeL4MeuoYPbtmqXo6Jo1r1e3lVzYrZwI5H9NngKIMoOTjWV0tdvA3N5yzfdjwwUeWnbzruouTf64w73ZX5HFecnJKwZ9gEsTX/sw8BygeDLi0Z4RMs7oIFaiZjNNszpAdK+kbpJBZnx9mJcdXMfcOB0wJlFVz+lisygC73EH0Cn90Y4GOlXCQtLGINhir6vXjQ/GQcb3O55XihaTZ/cDQAMpcbvqCWafMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 12:04:26 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 12:04:26 +0000
Date: Wed, 30 Sep 2026 20:04:18 +0800
From: Philip Li <philip.li@intel.com>
To: Vincent Jardin <vjardin@free.fr>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Frank Li <Frank.Li@nxp.com>,
	<imx@lists.linux.dev>
Subject: Re: [frank-li:imx/dt64 65/103]
 arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000
 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <arz6ws50+C1rLQcw@rli9-mobl>
References: <202609291726.iogWKGg7-lkp@intel.com>
 <arwWAqkwvlf79z45@L30177.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <arwWAqkwvlf79z45@L30177.local>
X-ClientProxiedBy: TP0P295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::16) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 460317d5-47f3-452e-2583-08df1eeaf941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|10067099003|3023799007|5023799004|56012099006|18002099003|22082099003|220923002|41080700001;
X-Microsoft-Antispam-Message-Info: TJobCv1+d4IlNSatXBXss0BismbpuSESrrUJL8vdgOiUlPuJ79s0Ha0nl8c1TIUohJTHScDFbs3PCbB4OTxwcc7Jn9V1Ih9Efsq1k0itKo21zEfD1NO5UAiBZYlkAbzvWGl534ZbCaB6vPqtF3sqSdkU7IJP8QG0KaHhmXKxqV1ew2ijkx5sq/ziWgrdqQlcrhTBRsAnGgO34W1baztVDpgkw3uUlEKyfHXPEhlTm07Ui0tnw4ytmw5T0+js4Hbb66zAmqjeChXIZ5sydOMtsjxuzKztuS0FetbzpasqM9s8REFDHaX9laRmgT4Ju1Kcj+E+/x5h5v1X/mEScH0DEO/6aAHUY0VnaIwVdurz2l6domAfL9ZDoj7+3YywIYDe3SzD7KL27b8ZdQxG4TMxnrzE4+o95wFke1ZR0pHxsv5qDVCLx+tireMcz2QZ4JfRxHLcdLQ86ZJUjcPX8nzXYKpwx9EqBsRxGQ13ckSXkGVMzMKhBDZDYyDtFP3wnWB/9VRy2jciKwoLQw+U9eg+hpMbBIQXkxoVB3RDyUxKlWhEAiK5/HZ9jKjGWJ8yoYpU/7MRiYonzAMh3xS+YCXWCZwEJqs4LMLGz3WttfRFe3eD4xyhtUESuyvehjFVmYCyt1Qh0xQ7SULUiol47RaVIGZL41oIWhxYMJOlU0QyIpngR1sCX9WgEzUFc2z6p9Hc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(10067099003)(3023799007)(5023799004)(56012099006)(18002099003)(22082099003)(220923002)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NRjFJLv6QLh1JL7SR07pkGixpjfDkb5fgUCtOXSgBuT5T2G6g9PI8x4hcILb?=
 =?us-ascii?Q?Ive7wTH9k+cCDFZPjD/629SHXKSEl+aOxGx9G52Sn4+FHEKHDXNdXCBEGvnZ?=
 =?us-ascii?Q?L4dTPYgcw9Syc2QrxCBl2opMCoYuFoSeoGit3fexejQq6uTVniESaKf+DNNE?=
 =?us-ascii?Q?69yZZnYtEKlCL22vC0W0tS0KO5eKAFAoC4PtKKSvoC+zyBkR8rI6gTR5A4/8?=
 =?us-ascii?Q?x22lolu3k34+S9Hue6bJ7oBlepml+b3ylAhssP5Fwp0IjudOhIoOo9gz7tMw?=
 =?us-ascii?Q?ln/GngHIUbrUnKigWIOgZ42okCS3EzrVKE2VBEVxeko2KpSN5r4ONLP+cO5i?=
 =?us-ascii?Q?InkFTAFYVgRBcIbjFzYkg/EfMRdBKt4eXQfqiHcdmbFEBcVzwxQLlVqgiII8?=
 =?us-ascii?Q?52AzYFBBMH43EjJ4QoLhLYu0H3vmTvYWLW9ktG49pbHLrHbCFAPUMOVXpuLh?=
 =?us-ascii?Q?NaFDdY5gMUl97dgVT7l37v+eodtSVd81oqF+nbjlzlq7VJqCwj0ppmskN0mo?=
 =?us-ascii?Q?2aTCQch9WEgu6sQrk3HcSfzGA2fHZltdvsSvSYQk7xzJqAeRTtarAd2SUF6L?=
 =?us-ascii?Q?qiIn2FWrAR1GPL2wyw9YO0VK/14v/ASKcavoJcorTvw/eDNlHio9wvzbfh6t?=
 =?us-ascii?Q?aeVyKCs8AqqzqikpCAddNIWYkA2Q1lZJ17UePKAGvF7B8EFmucxP2Kl8Bxlq?=
 =?us-ascii?Q?hXeg/LWi1+RHC+HVAzbH1rA0o2pypPnfPibYphQ+9JosCpfgogq/efG/r9Fv?=
 =?us-ascii?Q?4dV6DUtJRhF8zuDA/Gj7QYJCzHm+dloNBE4pMGqWnm30n0xGtc9jgQP1OsYe?=
 =?us-ascii?Q?q76SiUVBUj5iO3/K6XCQMdBCgBhHV7PhiMrXnc5/1PuQQGsob1nLaK0MouJQ?=
 =?us-ascii?Q?cXuEKZIKgjM4NKJIsv7WqxBwvJ01YOw83V0tidpr2cQU75MBjUaklbDnbINq?=
 =?us-ascii?Q?LbBjzbi4uNQDV1Cmdkj4ZKUppzoKj5SBzay5NpajOF4nd9u9Gl50tiKaRtGE?=
 =?us-ascii?Q?TdLhc6317bphp1zbFgZyTvtxWXgyH8PHLWJwi953e0V0HMQANZeCo2YdTXiv?=
 =?us-ascii?Q?gzltvmnf9pBF6mrD7Z/iP9+CK2xUwdADT92PSbdPAYow4K908t0ub1dgYdMu?=
 =?us-ascii?Q?2tRhRwx6BRSrXF8LrVyK1eAI0DXAFMytb0QhEDdpB5PesWpS3364NqSrDIbM?=
 =?us-ascii?Q?NPJY6ZssI3WPZ77magAmztyjGiuC6HFSJ3hEEaDtHMncEKduKgFrtP8xSa+D?=
 =?us-ascii?Q?GkXkKHf8WSvfLUo7BZ5Hmu6e9+fTqj65f173QMf0v1Kt4IfCHqjSt3kcrr1b?=
 =?us-ascii?Q?E8nA0Q9vW5YvyhncpNyUStCkgDWLq8S6A1fTwJ0KlhgmCfAwlNSpKhhnCxfx?=
 =?us-ascii?Q?sx5pCT6Aai3hhxckB60lweJ24Lbj2rRCMhBunIyL2IM6B/2w6Sfe/WOJpVaU?=
 =?us-ascii?Q?etogTADP0HYhP1/X3+BmJOmnTLjomLRxiG4sbzGEG8X9Nfay9Tlhf7kUFmps?=
 =?us-ascii?Q?rYPCVZz8mCjiiiOQu4EYOO6mGKtwcSvAus+hQ9beDy3uATR8gxDnXO8VOI1T?=
 =?us-ascii?Q?huXaydSrHGpj5/S8HcHZNLx4lM24WGNO4NgG/k8EFc5eQbwUnrPyAZoCx2Lf?=
 =?us-ascii?Q?GqtbwTy15qMnUaxowONf9EZvAZyyDFO9j2mTEUpPmpA74kgncxH/nVUTb0pP?=
 =?us-ascii?Q?XjTlfi7frXfMcR/DiD5bAemYX34+VTOZV1GsBXuz/56oMXJjySi29lAZ9YPm?=
 =?us-ascii?Q?zn//mFThHg=3D=3D?=
X-Exchange-RoutingPolicyChecked: LWzTo9GfTQTGXrZASWKc5AOsDVljacLPWKH3urjLZpuFjMGfCZACxCp7Mund2EbuxGtHk2d80pP+oFYeGN8TCYUqSagSNemRKkFdSV7hG38w6e/x5At0tjFtVRac151X1HVkekr6zA6evLx8ZfEGmeFdo8SOPnVoVtiDOU9p3VE2B4Jjrx2fU2326bKCeYtPZde0ziNTu2oWevRH5F7bxWBBrga/JcxwoKpNeR83Q1xFsJ1zsZe7nByUIJDdy0+z8ZVjOUMXK5QvOImATKYa4t56jiW5/scyhQf8CJLtZ0X9Byg+R03Z+k5Kfh8xCidLPkQTENZQ78xd9dBaLlkSjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 460317d5-47f3-452e-2583-08df1eeaf941
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:04:26.5640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g4En0rOZY9BGPOzn7dR7C4wPpelLNInpMf0d1jIuFG1wXc0lR1wn2pX05AvRQGg9AE1nolkFTcHtbIl6d9hAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-OriginatorOrg: intel.com

On Tue, Sep 29, 2026 at 09:48:18PM +0200, Vincent Jardin wrote:
> On Tue, Sep 29, 2026 at 05:36:04PM +0200, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git imx/dt64
> > head:   8c40f32361d566c0882e9d92abab36256b268291
> > commit: 565b6713a460126874d15654fe24d995a57c822b [65/103] arm64: dts: freescale: add Nodebox v3 CPU Module
> [...]
> > >> arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtb: gpio@2310000 (fsl,ls2080a-gpio): 'pltrst-hog' does not match any of the regexes: '^pinctrl-[0-9]+$'
> >        from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
> 
> It is the dependency mentioned in the cover letter: the gpio-hog child
> nodes are allowed by
> 
>   78c0baf85cd0 ("dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes")
> 
> which Bartosz applied to gpio/for-next, not to imx/dt64. The warning goes
> away once both trees are merged for v7.4-rc1, so nothing is needed on the
> imx side.

Thanks for the info

BTW: you may ignore such report since it is unfiltered which doesn't send to any
developer directly. And it would mention below usually, so safe to ignore.

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

> 
> Best regards,
>   Vincent
> 
