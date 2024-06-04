Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9B92119
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 01:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717464671; cv=fail; b=njWvYHfejvlDsZ2vPzetRGGl3y18pYtGiGo38FaZB8V5UrwJqoGjAyeDTEDB9Y/HdFGzU4MRDZnoTj5HClhZafleO0y46qM4ycUKW0u2+0lR6eMWPdoEOL4p6K0ZM4eLBSx8LaN5NIQwntrhCfxXXGMlaxo/1Eh/mLRqXpfFpXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717464671; c=relaxed/simple;
	bh=0di21/DI6b6IP4rN/dLNMQXGU5bO1uhS657yhcSNxa8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=akCNjxUJQjE39gMcHmnAk2GyBUqMcDj+n5Arni8rVTeex8CBaXxRvPuoCrJzwolRrgK58AJ6fqWco+w2DlgKDnx7GdhCxc/BzdWbEd8tpHioDg9Mcppzi3WcJcHSQgEVGOToCUIZsUvzcjEm4lgh5srTsIhpb+LO6XDIWZhA2C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=igz0beBp; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igz0beBp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717464670; x=1749000670;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0di21/DI6b6IP4rN/dLNMQXGU5bO1uhS657yhcSNxa8=;
  b=igz0beBpLuf9PmbfNokWVGxMfZN1cLFxOdn/SPYI+nca3cYdjxNtEjpw
   G3t6g9dRiPwiCx4ecHPotBMbhWfG/A53ksa2pDF6l3FHl7lbpP1c86oW1
   gaj4M6Cwsm7dV8nMpVs8hQGFSKiAtgtopOBj9WbCs1cbSOkdHGrDny9bx
   jPaPWP+jSuJdGgFpVeNH5njlk1s/wS26MI+sdDFs3tt70gpY33JetQDlp
   BkzO0eIcokiBz0D6bKTDpuYLqShZNc1LSUc4ZaHMulkYCNcTKNTm5OisR
   GQ7zDaW5WX1X7HVbU4Q1y4zoAuz/6DWdQa4yD/rVbwm5tQ+/RaD6zqGqB
   g==;
X-CSE-ConnectionGUID: yrVMwJkjSTag7CN0dyC/UQ==
X-CSE-MsgGUID: VTWCCSFCTxCW4vDzqbzBow==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25096631"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="25096631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:31:09 -0700
X-CSE-ConnectionGUID: 3NT7DJ8UQzWx/CgZYHDhPw==
X-CSE-MsgGUID: wx/iiOcjReCxhn2rpx7fuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37091805"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 18:31:07 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:31:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 18:31:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 18:31:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 18:31:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLikeHYq0jLilea4J41D1vY+B+RUBtd7UwEo6Xs3glAQim+9lQjenJDETELmL7fdn806ri0+/4AZLnFOjQvq6zImWu1tLbuRSAKZtfcs+91k0myV14dhQjoOKHBds04y8J4a2BvM0b8Ujsfl0odi2YNCQBQtzCJ71rkxMGtizRkleoO+yagGJS6pmkTU9j6sRhFbBSqUrFaqpfT11N6KRVwoavrIeb19mxHgWaYw5LubqATTQuBgRD4aVz10gF2497lvNio42bDGTPdgPeO/T0zMX94PZaHNhIYwHB9B1zIi3JYNm7TYCjjYvHCetUBtw0yXZSIZDieOlU7tBvNQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu+QoHq6Qd334k1kf+7f6QlTAMnOkODLuykFC7sySBc=;
 b=ck9wd3+pjfOwx+nLBMHUy50UO8/M2xGrJHSLcHu8rZI6NdPp+pz1wwPw8obaZcVNENJRaJE2deb9g+RCER36I2cs1AuPXyzSKx9o7NbQJsJZpAE4ATtatkqwVboC+1LDaputCjhTXuLL1ggb1Np24KMwK9t+OpTrYTx5NQwhZaxIET/f/1cFFcgg8TBS0hHfrz2qwbMdscVKYsCIeG7UF6cggaENLfWmOHUy7ud4VSXPEuCiBuiOozIcbmqJHZJIiFpco6kcJaMgUv1gMfxzVoLXvLYvOzI+pplWAzBphhfu8KpEv5EqwqK0W3isd7ugxe4+jIW59t6UmcfrNcwPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by SA0PR11MB4702.namprd11.prod.outlook.com (2603:10b6:806:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 01:31:04 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7611.034; Tue, 4 Jun 2024
 01:31:04 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 3/3] drm/panic: Add a kmsg dump screen
Thread-Topic: [PATCH 3/3] drm/panic: Add a kmsg dump screen
Thread-Index: AQHas8Nhx6RlsJeG4UyzAcTMiNm2qrG21f/Q
Date: Tue, 4 Jun 2024 01:31:04 +0000
Message-ID: <SA1PR11MB8393CE1D1BB93CB9F97EE70BFBF82@SA1PR11MB8393.namprd11.prod.outlook.com>
References: <202406010948.upSxSi1H-lkp@intel.com>
In-Reply-To: <202406010948.upSxSi1H-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|SA0PR11MB4702:EE_
x-ms-office365-filtering-correlation-id: 9f93f1c0-5114-44e6-6fa8-08dc8436003e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?KDVL3rpcppe4aK6Sjml3j4NAZgy/GqJ16ilqjNvdod5K783pylvddsZHqj1k?=
 =?us-ascii?Q?rd+diH+3HrW8Wjc6E2Ce39KCvAIVElryqodPfjOiNBG7SnXrJPBOuN1dIASY?=
 =?us-ascii?Q?PQKQopUz913CyrTtZv8n/c36bUD+dVaCnwKtiWVvNAbG00ACwdSQ8K5itY4Z?=
 =?us-ascii?Q?okrWpE1f8qqaw3VbyPPMYJx3ysEDR65fChKCCdxxYqPLUiHoq39d76MhaGJY?=
 =?us-ascii?Q?8Tuy0r5x28jCA0IcAxfnk2jmknCYKgWZoG4w6UDtZ0kbx88zfwfZrfC03SbT?=
 =?us-ascii?Q?Oe4iHQOqWjvyIguc+6+0Lpgl+qLtP1mL90QpFW6upA+A0aRHy2coAEZlwM0f?=
 =?us-ascii?Q?mnl/NK6HnjSOXtg1EiZemLpwt8M2Mi9YjSYj9lNkQppiVJeVDuMGPylZgSCs?=
 =?us-ascii?Q?Vqb3S9JIQZWYJmsEJAbthCJ0pZb2ldHCNQhnkWttkwbpBSEXuceRBV2ec5Uz?=
 =?us-ascii?Q?oYEJebL+P0AWat6a3CUDw+5l2o2XGLojzXRtPqA4lN4nBSkO89Vqa/8RFhwF?=
 =?us-ascii?Q?v9OeS/YzidPq7HUC973qij/JSFrOkQFEVty69o2R2eOdxSRPshb7g/Ie2U/H?=
 =?us-ascii?Q?HwfZzjyEMSWykEq0UaHCzKLIqsf8eMMYvipieySKLqhHT8G77Ekp+OS3b/ZS?=
 =?us-ascii?Q?raFt0DbSqOnNYcbkUqO+ie5g3Rxc1ceIHqoCf2t83K3Xw9yzvAiyyiA8ktgM?=
 =?us-ascii?Q?gT+3+n1glHrCheat2cZ2CJ1VBAYSO4zwdXCtcFzUsKnF8r/tf+fnnpFZK90d?=
 =?us-ascii?Q?lDyLMya0FE5tiV6M5jz3u4MxkULu1G4OYcAaGVQzorj31P2F+0kiKjU33Rcu?=
 =?us-ascii?Q?yTMsSFoq+rAlpYrmMqfztdj8iFSmxkadf1qbHM/0my4ylw9IklRe5qvKwnqG?=
 =?us-ascii?Q?Od2AXXu5TnCPkyQNiZm9LSoZwEQJpCjT+xt/BaLNhVHiSckjfULSGwIFKdPP?=
 =?us-ascii?Q?ZJcUU4Sf+gAGGSQr9oKzc9nZUL9GNERjXPE0/Qr1vtPA5JhGJ1r1rlYjve8s?=
 =?us-ascii?Q?VxuJEaFtB1J1r2XOtkghQ1BK6bEvQy8XWMqA1DnGBTwAMheBQouyobZPQZcL?=
 =?us-ascii?Q?bAXOZBEqlsOLGpvqWVVN1ujtD6UjjkHSTvaqk3LCauI/GPPt4GmlBkxeQc+X?=
 =?us-ascii?Q?Kf+gVfGKNqrm6y3lvJLfwR4nkrU+oyukiQBGg0Hm4WVw477icSXndDX5NJh+?=
 =?us-ascii?Q?YvtK5bAjA7TCi5oWZdAmmXEvhawXCsEyblGXLsM1iv17XBmoYV92l7vhsduZ?=
 =?us-ascii?Q?XVpxiIVfDdKRVvmOe065W1Q9DAUH+XWacA5yOG2pRDJq4ntdUY785WnDtP2Z?=
 =?us-ascii?Q?nt0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NDvKqXnLA5KyXBlE/8MawBSSTAJs/xuH6mhMNi6GGlOAkGPUZ3h05gTH/W9I?=
 =?us-ascii?Q?A/e9QYtPF4q8/6TPaeuUc30dbmMKWSolvzFzc11qNTxYxnmUkHGPoHFsaw0x?=
 =?us-ascii?Q?x9qxbT2w1cbz782r6Thaev8IITfZGbnjGkyEM1dldAj2EWVOflEez7P860zJ?=
 =?us-ascii?Q?xiptn5Zdlt6gC54ofl7ErZtWhpKdGIA/nwZuIMssP6evp0JRvoTtLZMUFz9E?=
 =?us-ascii?Q?6MgXax0fNb4IiZnC9zrD/kBBhBMxZK0PvAlRe3jx+WTh6mlc3q6Ug6hpZPFe?=
 =?us-ascii?Q?WUHOUxpMl7iNWgi6xzsv3FP1kMZL7QOo6CoiZhfQTVkj5XwBVGOmVkrjquSg?=
 =?us-ascii?Q?a040Hx2pbhbgMszHYQDqJy4bHgKExkcNRPr0AE0e70sKAZvXDMXbVfxaLwNW?=
 =?us-ascii?Q?i2zxIv7I2r/DbR2NMZqNy3faDgJ1xlncXFpnnqDQtdTcD3JksEsjs/EJFW1S?=
 =?us-ascii?Q?TH6lARZXbvs66T7CF4V7kCPyk0IsmX65mAwyyBCccJ7ur040SpJWsu8UF6cc?=
 =?us-ascii?Q?YMOyFmZUEaVutVcOlsIdBvjpAUbopmJeCpWMKExElZKL/W/EMdMLeWtKsvMW?=
 =?us-ascii?Q?M9MkO2WWJkcNEPj+wgieQl6mm/6AruyS0rI+KG//lkI9pjJkIiqTs8IfC8UH?=
 =?us-ascii?Q?uTzxxMI4PsRCNLKXN4oGLPakbTRTBXCGP6pslpUyZUDiA5isyJQXs9+OZwFZ?=
 =?us-ascii?Q?Oq1G1xwmShbMBseDk4jnX/NVAWu85WEwMCY+J8RRD3vlV/lP6evdxOW3dHl+?=
 =?us-ascii?Q?N55JZWr2/HMI499dXM80Y7pxplKNCus30zR0QqV4w59hMY4Jfw+gofYA0C8d?=
 =?us-ascii?Q?bgPhiWeIcWzjfoCw8f4ENkgLhByrsBTohKJeDuYedSxgtooTgx0iM4OHB6za?=
 =?us-ascii?Q?wsEQI9ScHRs/Nx+VVDsQivp3ji+Sx4Eok0fhqmCmGxM/nOmy0NqWeI2wRQkK?=
 =?us-ascii?Q?lmpPf/lSz/txlyzagEPTQv3BEnne0oWX6B34N4nXa611BM2f++uVWrA0DZNG?=
 =?us-ascii?Q?x+DCVAVgTkj3M0xkHkUY2qfALVzt9Lbs+8cjWtBS4nqedC4H0hp7F2//0FF0?=
 =?us-ascii?Q?HYVhCcy4lwRG1FsFmECtJtjcjJ0u6BDppYF8fW8aPyZxHQ5/gh2a/L4p0gp1?=
 =?us-ascii?Q?gwAvb4uD886RlZzIoVmbLi/4ENVfk6P0G5ZFYnSaGUFz4OTCcMIFjqkidbRd?=
 =?us-ascii?Q?FLtGJ0BQ4hBHeZli2Y2Ne+GyTBNS0AYPmTwAUrMUMDSKoBobCIiw8Wex9y9n?=
 =?us-ascii?Q?nlzeSVDePZLyI1fMKiu9kucinqDncqXrnlSeTC9m692+VonTx5Xm8SzhVhSO?=
 =?us-ascii?Q?cDmcL4oLZP6S98rOllyXJZ6k2MXn64G2IOzmAYst5KdhsMGSiNmi2qIxd2gl?=
 =?us-ascii?Q?FMg4/HQnkFO11GUTktwYJGDv3EOoXtXGeP8ccXRaD4lDDCz9mP7GulS5qW7i?=
 =?us-ascii?Q?qrmWJNtXC2Y/TgMnfB+quXOmxR9tyS6SW7pUOL5bQYHXM5BKw6fHYYOAfwuZ?=
 =?us-ascii?Q?IAx347/VdiVsGpC0iyTQR8ZPZvWGUCHqlM/qo599wSKQDnC3Ghp2M72JbnOJ?=
 =?us-ascii?Q?U3z0hLbxPIBhmltKOf/LDuXYZ15GbzXH3wzL3Ghd?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f93f1c0-5114-44e6-6fa8-08dc8436003e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 01:31:04.6558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4i2f3OmXIIay0MkUD/KLV9gz94EVdpN+wmAeJCMPn5trAk7hNDEcQ65ooskFEGGA8CL0Ch8odRRmZo8T6g91Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4702
X-OriginatorOrg: intel.com

not_report

Patch replaced by v2: https://lore.kernel.org/all/20240603095343.39588-4-jf=
alempe@redhat.com/

The issue is fixed in v2.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, June 1, 2024 09:29
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panic: Add a kmsg dump screen

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240531080750.765982-4-jfalempe@redhat.com>
References: <20240531080750.765982-4-jfalempe@redhat.com>
TO: Jocelyn Falempe <jfalempe@redhat.com>
TO: dri-devel@lists.freedesktop.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
CC: Jocelyn Falempe <jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86266829ea755f737762ebda614c59b136c8feac]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-=
panic-only-draw-the-foreground-color-in-drm_panic_blit/20240531-161045
base:   86266829ea755f737762ebda614c59b136c8feac
patch link:    https://lore.kernel.org/r/20240531080750.765982-4-jfalempe%4=
0redhat.com
patch subject: [PATCH 3/3] drm/panic: Add a kmsg dump screen
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15=
a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406010948.upSxSi1H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_panic.c: linux/kmsg_dump.h is included more than onc=
e.

vim +12 drivers/gpu/drm/drm_panic.c

  > 12	#include <linux/kmsg_dump.h>
    13	#include <linux/list.h>
    14	#include <linux/module.h>
    15	#include <linux/types.h>
    16=09
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_format_helper.h>
    19	#include <drm/drm_fourcc.h>
    20	#include <drm/drm_framebuffer.h>
    21	#include <drm/drm_modeset_helper_vtables.h>
    22	#include <drm/drm_panic.h>
    23	#include <drm/drm_plane.h>
    24	#include <drm/drm_print.h>
    25=09
    26	MODULE_AUTHOR("Jocelyn Falempe");
    27	MODULE_DESCRIPTION("DRM panic handler");
    28	MODULE_LICENSE("GPL");
    29=09
    30	/**
    31	 * DOC: overview
    32	 *
    33	 * To enable DRM panic for a driver, the primary plane must implemen=
t a
    34	 * &drm_plane_helper_funcs.get_scanout_buffer helper function. It is=
 then
    35	 * automatically registered to the drm panic handler.
    36	 * When a panic occurs, the &drm_plane_helper_funcs.get_scanout_buff=
er will be
    37	 * called, and the driver can provide a framebuffer so the panic han=
dler can
    38	 * draw the panic screen on it. Currently only linear buffer and a f=
ew color
    39	 * formats are supported.
    40	 * Optionally the driver can also provide a &drm_plane_helper_funcs.=
panic_flush
    41	 * callback, that will be called after that, to send additional comm=
ands to the
    42	 * hardware to make the scanout buffer visible.
    43	 */
    44=09
    45	/*
    46	 * This module displays a user friendly message on screen when a ker=
nel panic
    47	 * occurs. This is conflicting with fbcon, so you can only enable it=
 when fbcon
    48	 * is disabled.
    49	 * It's intended for end-user, so have minimal technical/debug infor=
mation.
    50	 *
    51	 * Implementation details:
    52	 *
    53	 * It is a panic handler, so it can't take lock, allocate memory, ru=
n tasks/irq,
    54	 * or attempt to sleep. It's a best effort, and it may not be able t=
o display
    55	 * the message in all situations (like if the panic occurs in the mi=
ddle of a
    56	 * modesetting).
    57	 * It will display only one static frame, so performance optimizatio=
ns are low
    58	 * priority as the machine is already in an unusable state.
    59	 */
    60=09
    61	struct drm_panic_line {
    62		u32 len;
    63		const char *txt;
    64	};
    65=09
    66	/*
    67	 * Color conversion
    68	 */
    69=09
    70	static u16 convert_xrgb8888_to_rgb565(u32 pix)
    71	{
    72		return ((pix & 0x00F80000) >> 8) |
    73		       ((pix & 0x0000FC00) >> 5) |
    74		       ((pix & 0x000000F8) >> 3);
    75	}
    76=09
    77	static u16 convert_xrgb8888_to_rgba5551(u32 pix)
    78	{
    79		return ((pix & 0x00f80000) >> 8) |
    80		       ((pix & 0x0000f800) >> 5) |
    81		       ((pix & 0x000000f8) >> 2) |
    82		       BIT(0); /* set alpha bit */
    83	}
    84=09
    85	static u16 convert_xrgb8888_to_xrgb1555(u32 pix)
    86	{
    87		return ((pix & 0x00f80000) >> 9) |
    88		       ((pix & 0x0000f800) >> 6) |
    89		       ((pix & 0x000000f8) >> 3);
    90	}
    91=09
    92	static u16 convert_xrgb8888_to_argb1555(u32 pix)
    93	{
    94		return BIT(15) | /* set alpha bit */
    95		       ((pix & 0x00f80000) >> 9) |
    96		       ((pix & 0x0000f800) >> 6) |
    97		       ((pix & 0x000000f8) >> 3);
    98	}
    99=09
   100	static u32 convert_xrgb8888_to_argb8888(u32 pix)
   101	{
   102		return pix | GENMASK(31, 24); /* fill alpha bits */
   103	}
   104=09
   105	static u32 convert_xrgb8888_to_xbgr8888(u32 pix)
   106	{
   107		return ((pix & 0x00ff0000) >> 16) <<  0 |
   108		       ((pix & 0x0000ff00) >>  8) <<  8 |
   109		       ((pix & 0x000000ff) >>  0) << 16 |
   110		       ((pix & 0xff000000) >> 24) << 24;
   111	}
   112=09
   113	static u32 convert_xrgb8888_to_abgr8888(u32 pix)
   114	{
   115		return ((pix & 0x00ff0000) >> 16) <<  0 |
   116		       ((pix & 0x0000ff00) >>  8) <<  8 |
   117		       ((pix & 0x000000ff) >>  0) << 16 |
   118		       GENMASK(31, 24); /* fill alpha bits */
   119	}
   120=09
   121	static u32 convert_xrgb8888_to_xrgb2101010(u32 pix)
   122	{
   123		pix =3D ((pix & 0x000000FF) << 2) |
   124		      ((pix & 0x0000FF00) << 4) |
   125		      ((pix & 0x00FF0000) << 6);
   126		return pix | ((pix >> 8) & 0x00300C03);
   127	}
   128=09
   129	static u32 convert_xrgb8888_to_argb2101010(u32 pix)
   130	{
   131		pix =3D ((pix & 0x000000FF) << 2) |
   132		      ((pix & 0x0000FF00) << 4) |
   133		      ((pix & 0x00FF0000) << 6);
   134		return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0=
x00300C03);
   135	}
   136=09
   137	/*
   138	 * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the de=
sired format
   139	 * @color: input color, in xrgb8888 format
   140	 * @format: output format
   141	 *
   142	 * Returns:
   143	 * Color in the format specified, casted to u32.
   144	 * Or 0 if the format is not supported.
   145	 */
   146	static u32 convert_from_xrgb8888(u32 color, u32 format)
   147	{
   148		switch (format) {
   149		case DRM_FORMAT_RGB565:
   150			return convert_xrgb8888_to_rgb565(color);
   151		case DRM_FORMAT_RGBA5551:
   152			return convert_xrgb8888_to_rgba5551(color);
   153		case DRM_FORMAT_XRGB1555:
   154			return convert_xrgb8888_to_xrgb1555(color);
   155		case DRM_FORMAT_ARGB1555:
   156			return convert_xrgb8888_to_argb1555(color);
   157		case DRM_FORMAT_RGB888:
   158		case DRM_FORMAT_XRGB8888:
   159			return color;
   160		case DRM_FORMAT_ARGB8888:
   161			return convert_xrgb8888_to_argb8888(color);
   162		case DRM_FORMAT_XBGR8888:
   163			return convert_xrgb8888_to_xbgr8888(color);
   164		case DRM_FORMAT_ABGR8888:
   165			return convert_xrgb8888_to_abgr8888(color);
   166		case DRM_FORMAT_XRGB2101010:
   167			return convert_xrgb8888_to_xrgb2101010(color);
   168		case DRM_FORMAT_ARGB2101010:
   169			return convert_xrgb8888_to_argb2101010(color);
   170		default:
   171			WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
   172			return 0;
   173		}
   174	}
   175=09
   176	/*
   177	 * Blit & Fill
   178	 */
   179	static void drm_panic_blit16(struct iosys_map *dmap, unsigned int dp=
itch,
   180				     const u8 *sbuf8, unsigned int spitch,
   181				     unsigned int height, unsigned int width,
   182				     u16 color)
   183	{
   184		unsigned int y, x;
   185=09
   186		for (y =3D 0; y < height; y++)
   187			for (x =3D 0; x < width; x++)
   188				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   189					iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
   190	}
   191=09
   192	static void drm_panic_blit24(struct iosys_map *dmap, unsigned int dp=
itch,
   193				     const u8 *sbuf8, unsigned int spitch,
   194				     unsigned int height, unsigned int width,
   195				     u32 color)
   196	{
   197		unsigned int y, x;
   198=09
   199		for (y =3D 0; y < height; y++) {
   200			for (x =3D 0; x < width; x++) {
   201				u32 off =3D y * dpitch + x * 3;
   202=09
   203				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) {
   204					/* write blue-green-red to output in little endianness */
   205					iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
   206					iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
   207					iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
   208				}
   209			}
   210		}
   211	}
   212=09
   213	static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dp=
itch,
   214				     const u8 *sbuf8, unsigned int spitch,
   215				     unsigned int height, unsigned int width,
   216				     u32 color)
   217	{
   218		unsigned int y, x;
   219=09
   220		for (y =3D 0; y < height; y++)
   221			for (x =3D 0; x < width; x++)
   222				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   223					iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
   224	}
   225=09
   226	static void drm_panic_blit_pixel(struct drm_scanout_buffer *sb, stru=
ct drm_rect *clip,
   227					 const u8 *sbuf8, unsigned int spitch, u32 color)
   228	{
   229		unsigned int y, x;
   230=09
   231		for (y =3D 0; y < drm_rect_height(clip); y++)
   232			for (x =3D 0; x < drm_rect_width(clip); x++)
   233				if (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8)))
   234					sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
   235	}
   236=09
   237	/*
   238	 * drm_panic_blit - convert a monochrome image to a linear framebuff=
er
   239	 * @sb: destination scanout buffer
   240	 * @clip: destination rectangle
   241	 * @sbuf8: source buffer, in monochrome format, 8 pixels per byte.
   242	 * @spitch: source pitch in bytes
   243	 * @color: foreground color, in destination format
   244	 *
   245	 * This can be used to draw a font character, which is a monochrome =
image, to a
   246	 * framebuffer in other supported format.
   247	 */
   248	static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm=
_rect *clip,
   249				   const u8 *sbuf8, unsigned int spitch, u32 color)
   250	{
   251		struct iosys_map map;
   252=09
   253		if (sb->set_pixel)
   254			return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, color);
   255=09
   256		map =3D sb->map[0];
   257		iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->forma=
t->cpp[0]);
   258=09
   259		switch (sb->format->cpp[0]) {
   260		case 2:
   261			drm_panic_blit16(&map, sb->pitch[0], sbuf8, spitch,
   262					 drm_rect_height(clip), drm_rect_width(clip), color);
   263		break;
   264		case 3:
   265			drm_panic_blit24(&map, sb->pitch[0], sbuf8, spitch,
   266					 drm_rect_height(clip), drm_rect_width(clip), color);
   267		break;
   268		case 4:
   269			drm_panic_blit32(&map, sb->pitch[0], sbuf8, spitch,
   270					 drm_rect_height(clip), drm_rect_width(clip), color);
   271		break;
   272		default:
   273			WARN_ONCE(1, "Can't blit with pixel width %d\n", sb->format->cpp[0=
]);
   274		}
   275	}
   276=09
   277	static void drm_panic_fill16(struct iosys_map *dmap, unsigned int dp=
itch,
   278				     unsigned int height, unsigned int width,
   279				     u16 color)
   280	{
   281		unsigned int y, x;
   282=09
   283		for (y =3D 0; y < height; y++)
   284			for (x =3D 0; x < width; x++)
   285				iosys_map_wr(dmap, y * dpitch + x * sizeof(u16), u16, color);
   286	}
   287=09
   288	static void drm_panic_fill24(struct iosys_map *dmap, unsigned int dp=
itch,
   289				     unsigned int height, unsigned int width,
   290				     u32 color)
   291	{
   292		unsigned int y, x;
   293=09
   294		for (y =3D 0; y < height; y++) {
   295			for (x =3D 0; x < width; x++) {
   296				unsigned int off =3D y * dpitch + x * 3;
   297=09
   298				/* write blue-green-red to output in little endianness */
   299				iosys_map_wr(dmap, off, u8, (color & 0x000000FF) >> 0);
   300				iosys_map_wr(dmap, off + 1, u8, (color & 0x0000FF00) >> 8);
   301				iosys_map_wr(dmap, off + 2, u8, (color & 0x00FF0000) >> 16);
   302			}
   303		}
   304	}
   305=09
   306	static void drm_panic_fill32(struct iosys_map *dmap, unsigned int dp=
itch,
   307				     unsigned int height, unsigned int width,
   308				     u32 color)
   309	{
   310		unsigned int y, x;
   311=09
   312		for (y =3D 0; y < height; y++)
   313			for (x =3D 0; x < width; x++)
   314				iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, color);
   315	}
   316=09
   317	static void drm_panic_fill_pixel(struct drm_scanout_buffer *sb,
   318					 struct drm_rect *clip,
   319					 u32 color)
   320	{
   321		unsigned int y, x;
   322=09
   323		for (y =3D 0; y < drm_rect_height(clip); y++)
   324			for (x =3D 0; x < drm_rect_width(clip); x++)
   325				sb->set_pixel(sb, clip->x1 + x, clip->y1 + y, color);
   326	}
   327=09
   328	/*
   329	 * drm_panic_fill - Fill a rectangle with a color
   330	 * @sb: destination scanout buffer
   331	 * @clip: destination rectangle
   332	 * @color: foreground color, in destination format
   333	 *
   334	 * Fill a rectangle with a color, in a linear framebuffer.
   335	 */
   336	static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm=
_rect *clip,
   337				   u32 color)
   338	{
   339		struct iosys_map map;
   340=09
   341		if (sb->set_pixel)
   342			return drm_panic_fill_pixel(sb, clip, color);
   343=09
   344		map =3D sb->map[0];
   345		iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->forma=
t->cpp[0]);
   346=09
   347		switch (sb->format->cpp[0]) {
   348		case 2:
   349			drm_panic_fill16(&map, sb->pitch[0], drm_rect_height(clip),
   350					 drm_rect_width(clip), color);
   351		break;
   352		case 3:
   353			drm_panic_fill24(&map, sb->pitch[0], drm_rect_height(clip),
   354					 drm_rect_width(clip), color);
   355		break;
   356		case 4:
   357			drm_panic_fill32(&map, sb->pitch[0], drm_rect_height(clip),
   358					 drm_rect_width(clip), color);
   359		break;
   360		default:
   361			WARN_ONCE(1, "Can't fill with pixel width %d\n", sb->format->cpp[0=
]);
   362		}
   363	}
   364=09
   365	static const u8 *get_char_bitmap(const struct font_desc *font, char =
c, size_t font_pitch)
   366	{
   367		return font->data + (c * font->height) * font_pitch;
   368	}
   369=09
   370	/*
   371	 * Draw a text in a rectangle on a framebuffer. The text is truncate=
d if it overflows the rectangle
   372	 */
   373	static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
   374				       const struct font_desc *font,
   375				       const struct drm_panic_line *msg,
   376				       unsigned int msg_lines,
   377				       bool centered,
   378				       struct drm_rect *clip,
   379				       u32 color)
   380	{
   381		int i, j;
   382		const u8 *src;
   383		size_t font_pitch =3D DIV_ROUND_UP(font->width, 8);
   384		struct drm_rect rec;
   385=09
   386		msg_lines =3D min(msg_lines,  drm_rect_height(clip) / font->height)=
;
   387		for (i =3D 0; i < msg_lines; i++) {
   388			size_t line_len =3D min(msg[i].len, drm_rect_width(clip) / font->w=
idth);
   389=09
   390			rec.y1 =3D clip->y1 +  i * font->height;
   391			rec.y2 =3D rec.y1 + font->height;
   392			rec.x1 =3D clip->x1;
   393=09
   394			if (centered)
   395				rec.x1 +=3D (drm_rect_width(clip) - (line_len * font->width)) / 2=
;
   396=09
   397			for (j =3D 0; j < line_len; j++) {
   398				src =3D get_char_bitmap(font, msg[i].txt[j], font_pitch);
   399				rec.x2 =3D rec.x1 + font->width;
   400				drm_panic_blit(sb, &rec, src, font_pitch, color);
   401				rec.x1 +=3D font->width;
   402			}
   403		}
   404	}
   405=09
   406	#if defined(CONFIG_DRM_PANIC_SCREEN_USERFRIENDLY)
   407=09
   408	#define PANIC_LINE(s) {.len =3D sizeof(s) - 1, .txt =3D s}
   409=09
   410	static struct drm_panic_line panic_msg[] =3D {
   411		PANIC_LINE("KERNEL PANIC !"),
   412		PANIC_LINE(""),
   413		PANIC_LINE("Please reboot your computer."),
   414	};
   415=09
   416	static const struct drm_panic_line logo[] =3D {
   417		PANIC_LINE("     .--.        _"),
   418		PANIC_LINE("    |o_o |      | |"),
   419		PANIC_LINE("    |:_/ |      | |"),
   420		PANIC_LINE("   //   \\ \\     |_|"),
   421		PANIC_LINE("  (|     | )     _"),
   422		PANIC_LINE(" /'\\_   _/`\\    (_)"),
   423		PANIC_LINE(" \\___)=3D(___/"),
   424	};
   425=09
   426	static unsigned int get_max_line_len(const struct drm_panic_line *li=
nes, int len)
   427	{
   428		int i;
   429		unsigned int max =3D 0;
   430=09
   431		for (i =3D 0; i < len; i++)
   432			max =3D max(lines[i].len, max);
   433		return max;
   434	}
   435=09
   436	static void draw_panic_static(struct drm_scanout_buffer *sb)
   437	{
   438		size_t msg_lines =3D ARRAY_SIZE(panic_msg);
   439		size_t logo_lines =3D ARRAY_SIZE(logo);
   440		u32 fg_color =3D convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_=
COLOR, sb->format->format);
   441		u32 bg_color =3D convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_=
COLOR, sb->format->format);
   442		const struct font_desc *font =3D get_default_font(sb->width, sb->he=
ight, NULL, NULL);
   443		struct drm_rect r_screen, r_logo, r_msg;
   444=09
   445		if (!font)
   446			return;
   447=09
   448		r_screen =3D DRM_RECT_INIT(0, 0, sb->width, sb->height);
   449=09
   450		r_logo =3D DRM_RECT_INIT(0, 0,
   451				       get_max_line_len(logo, logo_lines) * font->width,
   452				       logo_lines * font->height);
   453		r_msg =3D DRM_RECT_INIT(0, 0,
   454				      min(get_max_line_len(panic_msg, msg_lines) * font->width, s=
b->width),
   455				      min(msg_lines * font->height, sb->height));
   456=09
   457		/* Center the panic message */
   458		drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height =
- r_msg.y2) / 2);
   459=09
   460		/* Fill with the background color, and draw text on top */
   461		drm_panic_fill(sb, &r_screen, bg_color);
   462=09
   463		if ((r_msg.x1 >=3D drm_rect_width(&r_logo) || r_msg.y1 >=3D drm_rec=
t_height(&r_logo)) &&
   464		    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo)=
 < sb->height) {
   465			draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_=
color);
   466		}
   467		draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg=
_color);
   468	}
   469=09
   470	#elif defined(CONFIG_DRM_PANIC_SCREEN_KMSG)
   471=09
 > 472	#include <linux/kmsg_dump.h>
   473	#include <linux/printk.h>
   474=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

