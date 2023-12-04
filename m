Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9C1873
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WfLXNP+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701657762; x=1733193762;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=xDc5xp1SffvKgPmnved0uphcWTcxT/eQI9KR/ZjnlyY=;
  b=WfLXNP+q/dgZ/YUpmdJVsj64w0Qy5XMTFutl/C26NOhmA0n/F20LsKcY
   faYh/Y8BnstKZje3ui15f736RqbotimEwv34BR2CInhZqaiqXVMLkBZzB
   gaeGQn53h+Vb9b+5+bJL70/diewAJnTI4F8UdBg7ZsUj2LOaBGsMleIXU
   HuZWRMrDMdjisAxoJj3b5/+NrUSINfsIp6C4mYDae1K8cKZCFWtw5eMxj
   We3PEfzukA/AeBIQG757btljJcq2vh8Ju5J97Tih2OIDfyGwDDlajToMr
   Ozq4Uu9WbmxY2MjqLhnCyoz1cAHJkygU9wukcviISRBHuE/gNNLZil3Z7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="735065"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="735065"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893842899"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="893842899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:42:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:42:40 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:42:40 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:42:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0rXwUOEHX6CdfbQ/4pgJe4T4rvWuPpGK/7jWjRjnlJ4RfqVK4S0bdKO3SMqMNjLmRKKK1re9mbnU27ZvQsbjZQbjW8AY3zWowDjAunRpUSLXMHRwb/QPvW2lk59+JvpDcGdDs9zfQ4UFzpJT7/fbx+VVL6vKFtd9aW4bD0BF8KHZ00BPMF2/k7YO7bLk7lekZS3ZmbthZJfqm99QVtWMxpG4L6il20V7uwmYUDsXslJmIXZVz00c0T+FetnyliZRNzPvMUuoW1KZyucxvCdXG+zShgFxPal2PS7icJOnZxgy2UZcGSQKG6Bl+JNPsiF2ASMJ87HFvJECAwzBofi0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpo0s8nk2+EE6uVtIA2D+oAqNJwVSh/tDpTKaBtbrfw=;
 b=ALjdY9mdXGVq29YQC67ykYPwpfeG35DctVTT9qx1Rb2ZTHVcSEqoaaq/MK9w88j3H51qquX3JbhaImJKOzj/t9MExBumqQNhIbnKd+Term1aYjYdkK85lWxA68y7dCy1dk4aFVq3DIvdxAwUfC8rgRkQPB/odVME0Cd9cnlpA+x9dXFmIoS5C4/WMvRnyj8hq6Kv63+EfaKc5Vo35wjIULeeo+eAaJKaNHEhWj149pUiXJOt2iLnXyOvqa6WCs8GT906RqTiLxaiYU3IMlrPW49v4aYeTeLAAbJXJm9n3nRUsAMe6PCls0nZ7rD05JmyezNJh/Rq8cnFreRzDmXwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6259.namprd11.prod.outlook.com (2603:10b6:930:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:42:33 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:42:33 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [sailus-media-tree:metadata 59/72]
 drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more than
 once.
Thread-Topic: [sailus-media-tree:metadata 59/72]
 drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more than
 once.
Thread-Index: AQHaJA0wq5JlcihG7E+AdQQQjYHQKLCYbuyQ
Date: Mon, 4 Dec 2023 02:42:33 +0000
Message-ID: <CY5PR11MB63920F69FF46809704B191EEFB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312011210.NJ9ThORB-lkp@intel.com>
In-Reply-To: <202312011210.NJ9ThORB-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY5PR11MB6259:EE_
x-ms-office365-filtering-correlation-id: 73d2a669-a903-4d2a-3d14-08dbf472ab34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MzsGabd4lt4399XenqBLq/cBmj2Gtn/g2xTi/9nSleq+loOpKaIYPhhy3qnLqS9dAmdwsgltZrZgo41DSvMrnkxtb5mCswn5OvF7QOUJEfpuVN96sixqSEpITfsrkQAOWT+yZIffHQ+JNvLJXKtPLujHLT1U6qsYCDn0NNogfRHO8SOmyI+r6fAAvF+W/0d3lzMvAN+ucI5JfMtHU6kzVPPI8fOV653yEQqrhEbNE3t31WvC6ysJRYDsXnBkPv+V7XBx6LU92isB4UZQQVFuHJWVRloX18CI9dbMvkn6FP/nI4nHUy2VHYWZsS2O7HYdjxZloCuEoUD7mTpX9A6JPzADUbBCWdJeSWgs8ZRtIxspHouLbCqW7Z8+uazESiUilyXZH4lnM2yfCgBYDCk7dbMaoy1i1/qNZvGxzqe5oDBVBgYtRp4XeQmsuzxgIeeJHW8Br4jPgZfV63HJP6n6QBCl0HTCjnf3xripbomaSRez24/N42m0n7n+9SRKaxxPBMQrSWGVCx457o25MvCs5Z7b+Am4HHKxopZkfunW/TrkVeq/BbwuM7xrZFvlr0FJv4KXkd853il0//gmwHRd8AwuOB7SqnurgZAiNToOJm9xdoDpc834NSz0w6+1949BxsKZxkh0UTvfyLwXKI6nQW3hind5SFN/FUAmXE2Aa7kPc5UN3O98btkPvKrQOuU1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(136003)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66446008)(64756008)(316002)(66476007)(8936002)(86362001)(8676002)(52536014)(66556008)(966005)(478600001)(110136005)(76116006)(66946007)(41300700001)(2906002)(5660300002)(33656002)(38070700009)(122000001)(26005)(9686003)(7696005)(6506007)(71200400001)(53546011)(83380400001)(82960400001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qmvZ7wn/ehB5CuGmCDxho2NnLDz+9ccmK/qwOpxF57iS0Uv33zj8Kj9Yp4V6?=
 =?us-ascii?Q?5dCIb8Wm2HkL3Z/+ztf+3DOEpjma5hnpOKw7lf8B+cSgi9MARhiWOhki7N+F?=
 =?us-ascii?Q?FIm42bpJWjn6GA8tHvXEkktwiLkRyYOGzmSXOtD/SbU/vFa1O3eNMF7z4gDr?=
 =?us-ascii?Q?qJ5nRAHNhcRaoXiHT8stCMc10mAqoSRCklO7mx93fRpVkJt6voog+LTJmlTa?=
 =?us-ascii?Q?rPi/TzA6577spfsuL/UxwPmNZlqyCZMpeXUsGw3Q0idUkkOA3qODuQvvyyzO?=
 =?us-ascii?Q?AJzEo3/SRemv1Ad8ajJICb5dq4zdBaTnQRYOlG3dFmpo/t2MtRnrSh+NYmZp?=
 =?us-ascii?Q?QW3IyWVJAyGmTZHEEwSqBomDYIJ/ZTC8n38anOPD6JUwfjURgRlckWu8C/Mv?=
 =?us-ascii?Q?MEYZMBfoGGIvJy2rvsus6Dp2GvNufzRQq3WHufdqUz/41YxPrnzdLtjPrQ9J?=
 =?us-ascii?Q?IbmPbrBZjLZBOCVymQBHIWOfeReRAZpzvljAnDDb6g4BJOiBv5FyaH4nd5q+?=
 =?us-ascii?Q?geieNnLF+EgofN251XHkYmBuuFn6Cbo/B7a/nmK92DsvaSOFgfXuJiS7pske?=
 =?us-ascii?Q?nA5IDcK8kKgRt3HEK6hdbkCOEahfiwMC40nEfaK35xG5AIGabGckbGosd3Hc?=
 =?us-ascii?Q?/c1L+PkPLetNdLRCJOUzAWntxh2N9egrCmRqYg7qTkamqlId4TS2NsIEk4Sg?=
 =?us-ascii?Q?nXdPe66ZoBJLS/kyCSPgRBHZlayfz3hOvP+jKgqEv28f0V62wppTCSq0056t?=
 =?us-ascii?Q?uKm0vpEUlf0L8Rzqfw2v4BWUrbeWnkbz8I8Zy6V7ZPb6v5brhue1InY2x5YA?=
 =?us-ascii?Q?T2l7ppwnXoqCk+lbuFPONJHrU5nSkSvk8m8IIvSUSjjBdpe1kfDZtPBfIysq?=
 =?us-ascii?Q?upMWjhx/FcgjcB0J7YtNPYAPiWEAuS9DZBBuPIkocDVZphEfvLfo8TB/GxzT?=
 =?us-ascii?Q?SFE7CZnGV4KYS9DwYZZOU+uQDtc/lDM8EqQjz8J9ihLK5HoHseSxigmuzFZY?=
 =?us-ascii?Q?JNiXsGILn4P1fyxughR/RxfqqP/aZituAla8biW3KX9eRaa/jeZfcwccfm3A?=
 =?us-ascii?Q?UchjW0Jm5ColzaoEygzeMZ5D6wduVXSwyD3pwflN2E0AL/715kT/0GqawwY0?=
 =?us-ascii?Q?VL7uHDHT0xWvbPfip5F79KR09+JvLejwW+WtLx6ccOPJ2hxtCqqBaBJEo1ax?=
 =?us-ascii?Q?R8vKgD9kiyQnX4UoKbKwbTaONbMy67inYxoQVsZAuAunk1McIgCuovZH77db?=
 =?us-ascii?Q?4KFAUO74FcNf9s1wNUYv4eZ+ddHKq61OfB3z5DvejVJ/PrHx23tf7dS2oVad?=
 =?us-ascii?Q?jDtSH3ux3s6lah/fL6LjpB5SRuYv9l5gdRHilm34sVBybhQ1HcT9GnHYpYzq?=
 =?us-ascii?Q?MWHUsKS+qAnutd78XTTv0Ptcq2PUrfY3DBTfYwIIS74s4FPJLfgODTDn8E9Y?=
 =?us-ascii?Q?W/j4CuRPS53guB5UidBif3ZYODhJ/A0jpexQziCPOEdDpzhX4AjZlkgfDhyN?=
 =?us-ascii?Q?naSWpjVu3pNWYQCJt0Lep67dZdhp+rqqDYF8HX/qsHzmvOQtRL77QsM6bYob?=
 =?us-ascii?Q?5isbS8Y9po32w2GRLKb/cJVcsIF/G4D/r1Fwuk7J?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2a669-a903-4d2a-3d14-08dbf472ab34
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:42:33.8598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCDF1Pz0OAfmDOgG0yIbf8k18kSQJ2dzSDtcp+wZxgMMqyy4HShXRcu09s5MSAb3xrPTWDtjXxFMkiX+FhZQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6259
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311290754.2apI277B-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Friday, December 1, 2023 12:15
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [sailus-media-tree:metadata 59/72] drivers/media/i2c/ccs/ccs-core.=
c: media/v4l2-fwnode.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   d7f1e9eefb0ffe8ed37933b2dbd1806401f5beaf
commit: 4fb0cc41147989b09a86c615141abfd6b9e6a953 [59/72] media: ccs: Suppor=
t frame descriptors
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312011210.N=
J9ThORB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312011210.NJ9ThORB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ccs/ccs-core.c: media/v4l2-fwnode.h is included more t=
han once.

vim +30 drivers/media/i2c/ccs/ccs-core.c

  > 30	#include <media/v4l2-fwnode.h>
    31	#include <media/v4l2-device.h>
  > 32	#include <media/v4l2-fwnode.h>
    33	#include <uapi/linux/ccs.h>
    34=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

