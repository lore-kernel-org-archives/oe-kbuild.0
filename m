Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3057B8F49
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707097303; cv=fail; b=eCepqLFxyMhZxLHKqtdAVd5MKnDxAAvbk8i0CLaSkym2TYLz9xSnUrLo6ANaFkhA4iOz5u7j9YvMDQutKI3GxCqJtLDubwE9AfuZ/N2APnyNgL1KwFFw6P7rXDoMpr4xhVnPnfW89g/D94VjmcXBED1h2WwJbkk2Y5BMjYm7rwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707097303; c=relaxed/simple;
	bh=OeszwTGH2c+CPe8o+sZoyn8C8cbsA/JWvsDPF3UR6sI=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B/VPLTv/DfheyIx9hZlBZFE/lylblNrlS/Qqt1TsfVwDtBegM156rugFjBhiURKfYkgo+62q7A0/54ttK7+vjVY5JN2PlnQsqh5vCJD2FM26VerwGQ4vUVyWmAy6OnwyVPl7l26ER3tReywLsts0omdEDz25ri9sRl4SUbSrI+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJYOD4Ha; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJYOD4Ha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707097302; x=1738633302;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=OeszwTGH2c+CPe8o+sZoyn8C8cbsA/JWvsDPF3UR6sI=;
  b=VJYOD4Haj9P4GTxCCZzhCITpfg02/nDi2Ssm8SWanOgOWl3mO6ZtcXgQ
   02YTp35MhMSKyZJbIGt9MZMIpdYeKtopPZg9/l/RpJoIVdiU3mU9O7+Gf
   QwJemk5Gd1CbZ//9j94OlW/7H/DPqBEzlLKYb5Ux1FJKu8CWAlmpCTUNi
   CuJfPMssu4n9rnF7I0r3rjKCiaueaHGvFxIgjkJF6WHXTr26SFtPuErjo
   8aQQ4Gn8RGWEmisiZuBsVwREK/KEn41IkJtFkdrV+Rd3itZv7hUhxn3Ag
   qWOpcrROt6L7nINdDOisdWIXzZAvUTVqbBihAagkjjEThLLpsIh00T5Tv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="4252820"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="4252820"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 17:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933014977"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="933014977"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 17:41:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:41:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:41:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 17:41:39 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 17:41:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYVwqTyH/wROO+UZb9XnwAUY18zdgnqyo4ypRXVLlSiR5zgewXEOs38UCzvRkAnsWq1MJHDLieQhdII49MXZTYE8Waz2RpD8E1iifoF6jLQNxyg5tSIGyVYDjggs+ToKXpYuSONx6VrpGhsno5cLDik8KLuwqhAx3wqVxBaE3fiR+P0vz751iK9AtZgHKwKuGp6mHQGaVzui0sba58zMz7tZkvEkg3oVPXycnGTXFQ2OoojCslkWWWimmE9HnF1+YVuC0ss1/X9mgQxPu8pe+QO4W+KPm8Kf95U1+eB+eUz5of6Wshwe91IJ7qz+byPrOFqy15ZX6QAlqAey/xLN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCT2QVaejG/gNp5mAprI/FXdJBtjTNiWN7jg6izu3NE=;
 b=U6n2dRj0uNAq9gL4fCQgu668b2yARsH3374GWIOGbMOhnVPXjTDedHXTyReja/u5JAmRYKlen46RtgRYBiZx6G05N/0CRx/SFhdn314tOSWHYyiRsWWf5n5JdoXn3dSmscL5svTnRgATGBvBksmZ8w6LZO5qDKSoAy1TNHALMO30+DRcgaVRz9PyuvECjTTjmBDGIFITGkxxIC/2dLoiwUMT4Pnk418MYxp92Q/qnLhgQtRT+fAE+taI6mrQujEiZstj9YCBTJflgFz1tjd57mviUkl9Z0reQ7rCCuU0uzQEvj6qrkzK4cMCTCoH3Y2g3fQnKE7MdFFCG+9uJDScHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 01:41:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 01:41:36 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more
 than once.
Thread-Topic: [frank-w-bpi-r2-4.14:5.4-main 1511/26476]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included more
 than once.
Thread-Index: AQHaVHj7aCScDhZwRUyWFbdTACx0w7D6/79A
Date: Mon, 5 Feb 2024 01:41:36 +0000
Message-ID: <CY5PR11MB63921F600764F3FFDFC0F743FB472@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202402010357.AzCriYCk-lkp@intel.com>
In-Reply-To: <202402010357.AzCriYCk-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DS0PR11MB7261:EE_
x-ms-office365-filtering-correlation-id: 5187e05f-35d8-496a-f843-08dc25eb975f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dBN0RldbFVKiNQ7AiFXtzF7K7KJlFbNVgRmKn1fvpLVbty1enIRUYQyYujqMmGhanJzt6ScewUbHVvMtKJq2FEx8ktP2ld1WkRU43ZHfcbrr+1mwh7bn/uZKIqo7THbNFMzHo2e/dVnvA8zWH9mt8aH3oX9QCrt2N04eL03nQBDIr+m/YxnAB0A6ZxnN4IA41ENgEcrmn6BIHr1uSXs02rz29LP5kNKw3M6vESjLZsbiBARWVH+MTGaG7eBMeBAFRzAnCyDJEl/lTfHOqyVxQ+xbLhbTvETspy1NvjSppSFLuKv+h0n0cI5OCRB09WzBHWMlTC7DTgNvqg2KhIKP+DRphGGPFxeR4p/lzU8vHshvJbo1xFCKJDL36VtYxucbWCAZtnJEgW93e0gwfJ2E3+19IGxOMD35Y8LPDr3PbSk12faMDBswtX/XU5lXhaCgHMKq0/tkxlHU98knf3iKfiDuNPThU34fv2ubTXtCXaKrhpiYKhNxwMyDIKML+AJHhtOPFBthlR6mY/HuX2eZAlQ5AxlXEfgnobt3VcyWuOhFSTYORkOfgi0mqKYWsZWcZDv+WptMeKf6vT0v9BJta29Lx32PdsNhiD5436y4abIQfguM3M/dNr6H+TZ34EyQM7BCqxOwyVlE5R4MeqmA2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(38070700009)(66556008)(64756008)(66446008)(66476007)(66946007)(110136005)(76116006)(316002)(5660300002)(2906002)(52536014)(8676002)(8936002)(83380400001)(38100700002)(122000001)(82960400001)(55016003)(33656002)(6506007)(7696005)(71200400001)(9686003)(53546011)(478600001)(966005)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+V8YbHSPW+xu9LMH5ga0FZquCq7cAgE3XEXAz3GUISzFwcf4Ou3ZZzb1jkLJ?=
 =?us-ascii?Q?N2FNlUPkkyBiOEeRFXiomW3lCZqkkPjW2V4Lhm84UF7q3gkvZRz7R+dBxfPL?=
 =?us-ascii?Q?Fgq/4nejBoiDoP8/GvKbq4Gz++l9+oR3EqBalAo6/zwVLi5Qy1JtKbfSoSq7?=
 =?us-ascii?Q?+G/a2G7E9nW63DpDnxELcTpJJAyytPSwZDNnCXCKP5K0Kk037GEg2oo94MuB?=
 =?us-ascii?Q?rVTUUneM5aIJH40HiDIet3MWsnONz+KLj/pfr+44ys/TJBp0st+1bW5pSe1W?=
 =?us-ascii?Q?eLrpU0hOmkuaNUtWIF5n1URZh4yzAfzw7Un3QXA/63MzPC3qEjKgWx90l6cA?=
 =?us-ascii?Q?Dhu97Q2FXIXunfFP21C0y/S8M4PbNfGJ/pea8SoJMc5EXIqQg7I+M0V8L0uu?=
 =?us-ascii?Q?UPgXfDuOOqUCqBAqHghR1Zwesr+yTAC3l25xuRoYoPBVr/GdS2STO+QAUoco?=
 =?us-ascii?Q?yLbpt3WfidG7Q0nn6d5h+GOXcCy6dMpu9Hux06HEuH6Bm0IqIhRzPLt4y97D?=
 =?us-ascii?Q?hZMXsxmG+gusuiJyTYJF4N25RQviq9dISxJAMezOAgZL8Du+bx3M9d/AfwtF?=
 =?us-ascii?Q?KKKEmGlLI7hLU1P+q1rSnbw4uYx0QP2nRjbrgvmgMkZWrGnfULI3W82P3jHR?=
 =?us-ascii?Q?3tdI8yEsIbdfv6zSlh6inOXjGOef841R8ZzG4a8ScwxKe1x4MH6ryGHyJj7s?=
 =?us-ascii?Q?2jF0+xy+DGBY3+nVydMzbssNk7LLUXXNac3AgOqL+ehN2UOSVZZGlCu5YmOS?=
 =?us-ascii?Q?Nwb5aLxm40lgmldvwovCZKgCqtDpA14JgtQmUFK0nwzvJxMQ7OghAiYMAh0s?=
 =?us-ascii?Q?TTh9CpAbVp4DD/B/QfibCYyF48PuG3yWESQe4IA/Nosp1G5Z5mCIbmOUpJVo?=
 =?us-ascii?Q?+FQEC2WxuowryXrNGUCRv5d0MexVH76F0NTZY9vIconQNxHpu56uRK3aW5Vo?=
 =?us-ascii?Q?CMoAKM/5CEiBEwA9HDeCbNmp/aeKYzplPNIuadYzgR39/0uMbAySAnQ1D4Gm?=
 =?us-ascii?Q?58/3feLhhNLqDCU80/QUP2bg17IYT2MbIgGyj/ZI65PePGA0XCFjU1QToscj?=
 =?us-ascii?Q?UDnhC92yriP2wDvbh3OPIfirkMd8pjE8KhvW1Wb4IB/b3Xcs1vyzMJeU/igF?=
 =?us-ascii?Q?awhlT50UGn1eEKlA8aBSMjyUJEyXxkKWP+aAAwB6+C0wT4Obqu/lljaT8L1x?=
 =?us-ascii?Q?2X/NxP2JS+t/tPsXqeaX3UJ1kqn3CZPNxvjDqUykHYLznk+jWTLQsKrTFIXa?=
 =?us-ascii?Q?bCVLxXn4sbooxsdu3fuqEoGRuDV9r3bNMoRL9CN42k4HUfON9WQF+/2iNNR2?=
 =?us-ascii?Q?k5hBKdtjhS84grKW6oBTUluaxNjQhLc8FjCPUWYmpqhyanmRuaw7b1zvrPQR?=
 =?us-ascii?Q?JHufK8sphCLe7cy+c1l6MKW/6KxJnB/LzwSWcqNeGMqwP5+opuIYEwCX52EA?=
 =?us-ascii?Q?6S6Er1uc5rytAoNEkZrAlbcZRLEVigpdQRoDWWjcCzBl5Mdu1E9nt++u0FxO?=
 =?us-ascii?Q?BH0iApIzSog9O3m1qxtFqM6zqsGlieWRafraWy6AvZAcayBeiod61NE5uIUB?=
 =?us-ascii?Q?k1I6TSaYrqez/OCfCrTCKOu7zZPjWonQKKl90Z8k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5187e05f-35d8-496a-f843-08dc25eb975f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 01:41:36.6865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXmYeBFU6c8mpG9pKbDRztMs206+qeszkoNNzzQZnVqIao5i43vK8rndscDYxG7bxGYwRrZvLvLRWgl0BtBXFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202401300410.LTlB4Pi7-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, February 1, 2024 03:07
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [frank-w-bpi-r2-4.14:5.4-main 1511/26476] drivers/gpu/drm/mediatek=
/mtk_drm_drv.c: linux/component.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: 6e3f7375acdcf714d1fcbae1238cd39cc9391560 [1511/26476] drm/mediatek:=
 config component output by device node port
:::::: branch date: 5 days ago
:::::: commit date: 4 years, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402010357.AzCriYCk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: mtk_drm_ddp.h is included more t=
han once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/component.h is included mo=
re than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_platform.h is included =
more than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/of_address.h is included m=
ore than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/pm_runtime.h is included m=
ore than once.
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c: linux/iommu.h is included more t=
han once.

vim +7 drivers/gpu/drm/mediatek/mtk_drm_drv.c

   > 7	#include <linux/component.h>
     8	#include <linux/iommu.h>
     9	#include <linux/module.h>
    10	#include <linux/of_address.h>
    11	#include <linux/of_platform.h>
    12	#include <linux/pm_runtime.h>
    13	#include <linux/dma-mapping.h>
    14=09
    15	#include <drm/drm_atomic.h>
    16	#include <drm/drm_atomic_helper.h>
    17	#include <drm/drm_drv.h>
    18	#include <drm/drm_fb_helper.h>
    19	#include <drm/drm_gem.h>
    20	#include <drm/drm_gem_cma_helper.h>
    21	#include <drm/drm_of.h>
    22	#include <drm/drm_probe_helper.h>
    23	#include <drm/drm_vblank.h>
  > 24	#include <linux/component.h>
    25	#include <linux/iommu.h>
    26	#include <linux/of.h>
    27	#include <linux/of_address.h>
    28	#include <linux/of_graph.h>
    29	#include <linux/of_platform.h>
    30	#include <linux/pm_runtime.h>
    31=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

