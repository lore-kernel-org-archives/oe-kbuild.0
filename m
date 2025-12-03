Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3F231A30
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764771851; cv=fail; b=K61jordsog6XcMo18tATrxrh/ioa0zF06CEbSH+NPAGmbW7yrrwI7T+FVOhaCRQbZtJRCQFM/mVgxGTc3Ei81B0jdRIovKiUKKdOzBExPeTmxHtezeFtF5Epc/RszuJcYOScRyk9pUOaM9WK4/oASSOyQ+tWpOrsq4UsItKiI1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764771851; c=relaxed/simple;
	bh=yIw93gV4PvTOCzVryfly1Y1B7Q0SCEe8sOF56YKfPHA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MH7wksKiav1dqWd8nwf6SbleqNNFIUoMF5zYx1goy24y4VAigJ0yFRPJEw0vKOy7gXMlOTE7t8zPMtIoSUk6R/BNKl5Xy8SKInwtgJFZQcpPdfXrb/97t505D1zwhCGTvWiStnGNw+Ccj0UqiAT+49eY/HekAFOTKjtYPfrXVqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chtoklTW; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chtoklTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764771849; x=1796307849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yIw93gV4PvTOCzVryfly1Y1B7Q0SCEe8sOF56YKfPHA=;
  b=chtoklTWpBK4zsXfLDeJ47TX5IxE8fBDOD/NH0kH/I2wYlX+DRvrgbFF
   B55Wcrn5ODVgfsThvFFLCgP8R981Ew3G3CiW7rVxG8rwyCZYTdwifxul1
   BBBV7ZbZJqcllfM6ldI5SW1gEbsb8WNBKqO54sB43KiHsvbzFV3eB114l
   YyYMHIRde1K6VQlo331j78mBQw7gwrrCEyW2QzDjOKw75rc9Md6Qisj8g
   htdw1lEA4tI8XaTSj0J2bvIHcjB1GyvLmTZThuVhe31HixVsRZ7uMqx68
   byCgrhFvwqSUOOO5cMFfXbNGiy9lfbg7oiLjzFnWIGkcOIc+benx7e7o2
   w==;
X-CSE-ConnectionGUID: l7EPTm3sQku8TLPiJiDrvg==
X-CSE-MsgGUID: Gyd8i/qJRlysZ2VaAsdgnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77447782"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="77447782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:24:08 -0800
X-CSE-ConnectionGUID: pIwU/bHBQpSW6QmMQAlR6Q==
X-CSE-MsgGUID: 39rUI3dXSGadls+3/stDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; 
   d="scan'208";a="194910373"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 06:24:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:24:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 06:24:07 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 06:24:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7PERCw9BzYINGu5Vd9ScibTtxEdeUCF5xaEmaia8uVPmV3Y2xHIlqfhhx9q8Jvc6B9j0Hf6IrSjUxi0E4F9RD8HjVbZghEfsrjrG9o/gii89m9xf/xa0Zs5Q4byNXOLquSX9JyvI7nBRRb4Yo5cdqPiykDA2Z5Lby5dKwH7fSzP4t02W1xJqiKp+fNGEjNm7qQp0dDxJIeTDTjs/CuFqo+9S/Ee2fZz1BXNMG+X4TK7vexAVSfJN8nwBAU7TC++G2/SpV6vTE6zvI4iOcgfqPoSTACp0GbPlIed5IiSxiN5ArZCUrdCYhprADh6zX94U6hzlr1WYlaTlMb27znxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9TYvs4sPJs+SGoQf8LQobqFi64ejYr8VQZoCM4HpQA=;
 b=LCAfbQOPSGuVai8P9Ba89BxuExuEs665RH2IyjGRrhNs1kUTkOIsycS5WIBQHMlSZlHyqlM/n+FI+Au2pvLcfiFnk09Z9PyNketr0LWM+wjDd9ibKRpfetBrnEXSedjGYmdlnasuuZubXwalTH0PDG9/B3BiQExi3BNIWl5bf3t59Qg9SktiSwD4FxE+D5iWihXBEDtlZMbceVwCM///fN+QnbW1ldN4L6zDptX6qZNvrPd0SR1uFwl28AYe1UTyjr+n2T/OpKcYC6rJAUJQh/xjU+FwTvII2kxY/MnQQ3NgHzhx2BrVNbMpeHmIg7rnsaV8ilqMH/HoRgkoM/nRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CO1PR11MB4884.namprd11.prod.outlook.com (2603:10b6:303:6c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:24:05 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 14:23:59 +0000
Date: Wed, 3 Dec 2025 22:23:49 +0800
From: Philip Li <philip.li@intel.com>
To: David Gow <david@davidgow.net>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild@lists.linux.dev>, Thomas
 =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, "Linux Kernel
 Mailing List" <linux-kernel@vger.kernel.org>, Daniel Gomez
	<da.gomez@samsung.com>, <kunit-dev@googlegroups.com>
Subject: Re: error[E0560]: struct `kunit_suite` has no field named
 `suite_init`
Message-ID: <aTBH9UjSHKOGihaY@rli9-mobl>
References: <202512031957.BoFx2PMx-lkp@intel.com>
 <86d2ea1f-810b-45a1-9ce0-ef571f6da0b9@davidgow.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86d2ea1f-810b-45a1-9ce0-ef571f6da0b9@davidgow.net>
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fd9887-9bac-45c8-1ef1-08de32779985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?HBSDpjOx1J1tatHwNy/Q33d+ILTXaHJP3SGfTt5xANglKJrSIOHGkJ2cel?=
 =?iso-8859-1?Q?obLHpqH7hfN2wsIOo2saTHQbj4zFto/qlJakI1wL1AtaU5An6dG3KULuGX?=
 =?iso-8859-1?Q?Ws7fszIhWTWXEZrIGbJRFps5c0zN2ZLxXb934EErpGlRhqPtvn/vsDdQQ1?=
 =?iso-8859-1?Q?SZDBZeSKPoWUVS6JNugyEP5iwEkb2cIYzMY/pF01IvbXeqIxaox9NQE0iv?=
 =?iso-8859-1?Q?4Cr11cI2c5qBsrKAJ/g0iwsESB+pUbNoR/4lSLj+x98NWXsIVYZXfQihHv?=
 =?iso-8859-1?Q?zSmoEXYOkpv1N31naZn2oGu4H0DyWVYFxe88o7Dcr1Ky+o4XQ2xSe5Uu05?=
 =?iso-8859-1?Q?D4Sh7XXpmHBZgLZr4q/qgOJq6zTi3N3ZKZen3iqqINZorUZiDQm4abt0sP?=
 =?iso-8859-1?Q?qOzZ+2p08bhm3IFDU+7UqBn4yQdQYedPGFoEJ+B/pwjnOeXADgiNiiwwoj?=
 =?iso-8859-1?Q?YIBxuR2f6evicPzu0+1BmHh5/QRLJs8/gGgmC1BHxDMgQCEvOdeZQ7ZpJ/?=
 =?iso-8859-1?Q?ctESwFvJtUstHwMSEFGkESl9bmnU274FIAYumUp4Mm2hFbjlkJl+1oeV4b?=
 =?iso-8859-1?Q?DR8o4TDgPapNRDYl3YHzdO7q2+ucAc87Bk+PX0wgqqImrtlRgPF/z8iLGs?=
 =?iso-8859-1?Q?09rF386xyrN/5fJi7jW14F8Er9bulmIKj6Ox2JP01cvbZfr5OarLFKInBq?=
 =?iso-8859-1?Q?tr2v2d99r2wHOlVvTidRxDXe4UvGI+4tY69CHtIR1JEkSslfiEA7bBFhn/?=
 =?iso-8859-1?Q?BDlpDteeHfswNe/8bFiy+TarwuDoWOE3hvOz6ivD/2osGe7iSBbFtzpScH?=
 =?iso-8859-1?Q?HUsEzfFEh0tYTKNIS7xJa3pIHv/L0I2jmj8LH1P8MOXm9hIlJXIZLwEaa4?=
 =?iso-8859-1?Q?6F1Qh05EMMakjW4rDDeEzc7XvtWmpEAV1fwMkucqwZq8mcredZdaKDMy7c?=
 =?iso-8859-1?Q?m8IEVp2qnyDVaMWVA8sYmL2DhHoHY9mRI9kTLfQ57anLOa2rk1uk0wSunb?=
 =?iso-8859-1?Q?nbrGYx6DNzEFZLMLLMhQLICwteIHLUbodeAQKkaEjeeMVN+v4imlkfXe7J?=
 =?iso-8859-1?Q?48JQ32uyhK2gcyCqt2cf1CTXyN6hiPrgZyyIzjDxT6nGVrPuBhaw4erzxz?=
 =?iso-8859-1?Q?eB7fYHwTSPnTKqpKWNmw3W58SkPRB5ikSkgipSn80qttijCtfuotn3Y2qZ?=
 =?iso-8859-1?Q?WxuwPyB48kOpy8quIcXW4nZ3UyQA28fDARxcBCtoboDsV4nafrSPxDWowi?=
 =?iso-8859-1?Q?wMHENqeJOvUoWld2guqP/pPas+V9lk5y1THu/AlzmsB7eRyq19wvVHW6cJ?=
 =?iso-8859-1?Q?36RHsjmbUmoaadWVY8/g1uJE7+Kiuu7J0zoxmYYrh2PKskE3pJM7kD3CGT?=
 =?iso-8859-1?Q?hm594mxd1+oE7TJWA+BPxdocbkyimnM1xDl7scniwmm5kg922gJ+qRQRwS?=
 =?iso-8859-1?Q?DooYbPXUa6aYyO/mew+QxrAhMLIMCEmCvhlkaolRTkgp6yN9Rolco6Y3D6?=
 =?iso-8859-1?Q?0OXfywiQoMugNAH6NxXGmY+C1eqD/ch1qUPsXP1KXwbA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?t5S/Qg4ObzuTRGaukzQZj3WNPGWrFYjLDqzoH0g8DToZuxysYQoKU0l7xt?=
 =?iso-8859-1?Q?qCw/ooNo88WtCLmUG3nyx0p2u5JBp2VJTVnHVr2qZplXmcywLhmSqLvlSd?=
 =?iso-8859-1?Q?HJQxPdJVNvcI4OPkyk097DQm3ES4Zcw16zZJ0gjKrI4MmQY2E9vW+i112L?=
 =?iso-8859-1?Q?6RliEVJFRDdzEBdKyPLSnJcd1Pux9dg8kBXWeu3557sSJJQ2/ykIb3Fy2o?=
 =?iso-8859-1?Q?27HQJdgLGeaVEhc1gdlqMOVVs+rsqBY+if9tFHv7k68disQzRWdtrvSC/5?=
 =?iso-8859-1?Q?GO5Efd8DSM65MOGlVvcny2/iMP1nfSoLQNN5gSDy6mLqb0ImycvKVSN2SM?=
 =?iso-8859-1?Q?Ubaid7cYwr8QNZ7LLMvyzyxVILtf86rw7xBpL0rspaZoBKBJmLtpyBlSzN?=
 =?iso-8859-1?Q?q8AdVGP6jw9uKTLlNPWFdWCN67C2fVnP0QVSMuqgDQbW1zj3LoII1AtSCL?=
 =?iso-8859-1?Q?nbhuXmOzFHbufLa1fj6jlBcoCnYumzy3SYwJKYI64HN5j2R5dmHTmXLfil?=
 =?iso-8859-1?Q?PUP/fPBv4FlEi50nZRdunBXrj6MskWSmgxj4M7/sgqw/2RY1E+nhTVZtKE?=
 =?iso-8859-1?Q?j8MEn9nO7lpQfd7md8LWLwOAJb0hdxMb6eG9ZVQIlIZ3aI1KiqMHKL4a6A?=
 =?iso-8859-1?Q?42lwKksJrtNf5Pm/qFHkGOtjGL6iFBAgle5cyvbJmq/4XlRCR3I6Lpyzsk?=
 =?iso-8859-1?Q?6l+X5rYuvRp+TXBbzpe2VW1DHJAjYC2WqHc0UhU74TXwTSCR+tBSn+hLei?=
 =?iso-8859-1?Q?Sq498OfX7BNd0ms6V86VgrrekErfxzJ2gv5kYB9bi86lhCfa5QZ3VZr15L?=
 =?iso-8859-1?Q?3ZyPjmSI/+CMEzAkDEJVC0qr1Q5hsejBW9qhGdJb17SNDAdU7PwCuvJJDQ?=
 =?iso-8859-1?Q?5gjk6pqFmMADVkAk5LaXcf9/SfDoKf3qLa6gI/xZAZWZYpJghufoMTiFmq?=
 =?iso-8859-1?Q?udxVc6rx/bQIffBqU9erp+ynfGL1zlSGcfOZR0bQ05c2GO0tJ3YrlVUGcG?=
 =?iso-8859-1?Q?D/auuF3pEzkdfdT+FkvTSpiwh47h0kMOgaITswHSibHo8WF/e/cMiwokkd?=
 =?iso-8859-1?Q?lm/HoTfYmqduPafh6OIS7Lio8ZZ++GXRjhjl11CyTCYIBaXT3EzDys+rBN?=
 =?iso-8859-1?Q?n5CrBxOwojKzlciBGJdqImSH8CN6DmaGt50FD5l0OYLK8pTp457m1qWGFO?=
 =?iso-8859-1?Q?EfnKqCrFenvVcFY9fH3vMPrYHeAB8TIZY7KXsgGIJqXrj++GbOHZsoeQ+/?=
 =?iso-8859-1?Q?3K7ugjkdov6egm4tSSQ4i4pUZ9ayyn4gGtr+UXWUfbBL9/rSu10q9xxtnA?=
 =?iso-8859-1?Q?j4HBs5xmx3UAVWsP0M/p21jZl+JLm+ZbBaMjre+SOg58rR4FjHZ6HRSc++?=
 =?iso-8859-1?Q?4fofHQzfUZv8gRpaM/5BnAo5jvYN+4U0TTzwYOr0e5LKibFM7MsshvUPiL?=
 =?iso-8859-1?Q?e2Xs00YGFzm6UrkRdzfl2ZSY+1ca2OlMdU23py1eU8Nf6NRQggMzoyU+zf?=
 =?iso-8859-1?Q?zE6YSofkqwj5p/lK6v9nZfcW8dB5Gf/F55usodW3knCCB00ep7HLZSwwtV?=
 =?iso-8859-1?Q?dxfdoUJ/w+ROwTijfBuhanKh2lhhNUtjL4YdtOVpdKntGy6k0vxklI+LXR?=
 =?iso-8859-1?Q?lbdzXLtJT88VxW/YNO5whRkpxPy9G9QcZQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fd9887-9bac-45c8-1ef1-08de32779985
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:23:59.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqVYIzFOtTb7JrbcZGYMFWkdgG8QM+5y2gz/7eOIi01tPKsn4CkRLsZ2QsI6XyYmHTLQ2kkMb8772VUp/V78qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com

On Wed, Dec 03, 2025 at 08:58:48PM +0800, David Gow wrote:
> Hi all,
> 
> Le 03/12/2025 ‡ 7:45 PM, kernel test robot a Ècrit†:
> > ::::::
> > :::::: Manual check reason: "arm-randconfig-r121-20251201 results in various rust failures"
> > ::::::
> > 
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > CC: linux-kernel@vger.kernel.org
> > TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
> > CC: Daniel Gomez <da.gomez@samsung.com>
> > 
> > Hi Thomas,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> > commit: 818783c804bc051f7faf0ac226b5597f8259c6f8 module: make structure definitions always visible
> > date:   4 months ago
> > :::::: branch date: 9 hours ago
> > :::::: commit date: 4 months ago
> > config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031957.BoFx2PMx-lkp@intel.com/reproduce)
> > 
> 
> The current best theory for the cause of these errors (which, alas, I've
> still not been able to reproduce locally) is the following bindgen bug:
> https://github.com/rust-lang/rust-bindgen/issues/3264
> 
> bindgen 0.72.1 has been released to fix this issue:
> https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1
> 
> It looks like all of the test robot failures are from builds using both
> clang 22 and bindgen 0.72.0, which would meet the criteria for that bug. Is
> there any chance you could upgrade the bindgen version used and see if that
> makes the issues go away?

Thanks for the information, I will update bot logic to use 0.72.1 from now on
to avoid these kind of false positives.

> 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/r/202512031957.BoFx2PMx-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > error[E0560]: struct `kunit_suite` has no field named `suite_init`
> >     --> rust/kernel/kunit.rs:291:21
> >     |
> >     291  |                     suite_init: None,
> >     |                     ^^^^^^^^^^ `kunit_suite` does not have this field
> >     |
> >     ::: rust/kernel/alloc/kvec.rs:1244:1
> >     |
> >     1244 | #[macros::kunit_tests(rust_kvec_kunit)]
> >     | --------------------------------------- in this procedural macro expansion
> >     |
> >     = note: all struct fields are already assigned
> >     = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> > --
> > > > error[E0560]: struct `kunit_suite` has no field named `suite_exit`
> >     --> rust/kernel/kunit.rs:292:21
> >     |
> >     292  |                     suite_exit: None,
> >     |                     ^^^^^^^^^^ `kunit_suite` does not have this field
> >     |
> >     ::: rust/kernel/alloc/kvec.rs:1244:1
> >     |
> >     1244 | #[macros::kunit_tests(rust_kvec_kunit)]
> >     | --------------------------------------- in this procedural macro expansion
> >     |
> >     = note: all struct fields are already assigned
> >     = note: this error originates in the macro `::kernel::kunit_unsafe_test_suite` which comes from the expansion of the attribute macro `macros::kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
> > --
> 
> (...)
> 
> Cheers,
> -- David
> 
