Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81415A4
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EL8cli3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656952; x=1733192952;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lSDF2uS42fydYA50WkE5GZcBvLyUS0MS3Ab+l9RukHw=;
  b=EL8cli3EV3oM0GpakZ7RewdFHCfVuQYhnj9p7eFXnqKhhbaR0phpMPTw
   jXq026Z9jFS2imY2iNoozIG41aPL7q4w7raxRf3XtxI8JTC3ojT93WSpK
   RCfXBHHH8+EXUwLM05iZowoNxbiwkA95MQcnUogGv/NooCPia8BRMuHHD
   XAbZ0Fk6dePSocvVMf4VWwaP7rSu8cKO3nbOeDNxgbRQjGKxLB4YIDvJv
   RiBHDZxC8pOFdgZRZmgLo9ai9UMstiSCKEBYtaSoJIJU5XtVUbxoVo1kD
   Mh+AUnW0RkBT4quGfB4qIUvfUSCVvzsy73DhT3Qi5ruINpaJ0PWAJdTFL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396484198"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="396484198"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:29:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774113605"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="774113605"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:29:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:29:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:29:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:29:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:29:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxwWnPP8Alzj402OS4RKUmeAjkMltWeIK19EI0J1D54Ws1phgh0gVdPYd1lxEEdcYysZN9wZr4Hu46Z67vAsJ12UI5diKtHPgvxlp5ZkYr56/C/IUAjJRgfuyPugZnuDUGV2UWt5B34KSl6IHpMRgw74u/eTdErnw5Tofs5jcKWsRKbRlP+JMEUEsWvWIVvlzGm0pXlglasF1/8A3dzth18cBUF3DshjqPVywNBCdPNbO0L5uMeQrdBlPl45yhfiG2piFZWOJPLgc4mstRmXJVgFVUdsJazz7xxmtWVoh6f3n7M99QdGYTkc7w7j4EsBCntpFPz7FOo7cP906BbIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rh2hbAIpmNi0Prh8sYJgDhb0gHT00li7ZRmMfR/oN4=;
 b=nM8O8k8WrGbJyBX4zbj1+xUz/FQy9qD/dUodQo/6IRPEzC8hqO5uCZ2jjhdDVUtU3iaOwMHMjBm9NIRal255UBszTC3vzbj8kQB6v/d1zRK7zjkaXOG4k0jCe6F8kGfXkNSYYpHs9bMpvtJZ0dow2OXYXHBShpl66os+pMkuHwQOk/QYJeIzh73YZe36jqwLfallfEcXfgPk1pFGEZEOTP8AIRqf52z/NqcY/bYkR43X4oYHSCnw56d4Myui5ZtBebVq7S53wGpqk46K/3c34xJWGYGxLqsl2PfDmBsyhwUgnUy1owy+n7WS8aoDoxynLYjhWaHr/sBWvduzh84YCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:29:08 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:29:07 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [agd5f:drm-next 22/55]
 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c:
 dcn201/dcn201_hubbub.h is included more than once.
Thread-Topic: [agd5f:drm-next 22/55]
 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c:
 dcn201/dcn201_hubbub.h is included more than once.
Thread-Index: AQHaJMahrsYcEO/YbUue4vSAxiOUk7CYabRg
Date: Mon, 4 Dec 2023 02:29:07 +0000
Message-ID: <CY5PR11MB63926B52F3F0269E443BCAE1FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312021003.cuTGPfEl-lkp@intel.com>
In-Reply-To: <202312021003.cuTGPfEl-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5641:EE_
x-ms-office365-filtering-correlation-id: 2e4966c4-dcee-4f4a-8ef0-08dbf470cad7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mt9qylHOKqOFZP3eQw9T9DmZYC+qxAlFbg6+tIiDhnTAHYK4MNIfSuR1LzH4YuQxAdyqdcJ8Op1GneNEkowdhutRVMtrfPb9K1GxPN6RreUPQ4MvS+zmZcmfDGryHQsp2Lgr/0U4D8A5vhjuBaxmBeUDSRhCN5IlxtHcqtoAdLI5HSAa/Fq30oLHbhQqNi0c42qeC0QsXknWvfYy3aBIkVcWIhj1l4GY3La7Ey9KXWwqUAJRlD5I7h/MccjeL+Lvr47woxTcwozrnU08uqUpRMtXZYxC4j9qLvj7XPWXPxiNxihczYedX8CVGWt6jSrw3FSWzGMy2V2wL9Uq58u/i3qXyBRPZWWDyKi296+r8OI7OdtkmkzMlvSjssxhk5qu60zx2ZwafWIqSsjNe6RvYgXu6Tbttufsldcod5flE8JWI8mQ0MEcVBcobyKvC1hI4kDpdgo7vYwJqXLuvemQ7tgZapawXOcVEOiBxfOf8sguiMJM9qwmlpfogV05aqlVyVJro6Idfx7l2gvxImthoL0BRuiWdz2tN+gwe5rslCgCyWg65MNp5oQ44rbmhgJhkVMnRB1Wx9DyX3JsTVIUOf1bxHsHVg1ehC4tq5T5YBbUDLRRba07ijD4KceWtj6r4lNDq9aRtbuNSjAELcWDSzu6UtcrLa6ZshySStqAvj3+wPpvw6abw948inWVdyKX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(82960400001)(38100700002)(122000001)(41300700001)(26005)(66556008)(66476007)(66946007)(76116006)(64756008)(5660300002)(66446008)(8936002)(8676002)(52536014)(316002)(110136005)(9686003)(53546011)(6506007)(71200400001)(966005)(478600001)(2906002)(7696005)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WWd27Q+OD5RkD9hGTAZXLTKeggOCQp9xqcJa65iT/WVqCAzc7xUlRiTVezP5?=
 =?us-ascii?Q?uV6IU4JmrBXYOGHRwg2dSoH1IBMyRLHMFSf2rmhyvuF3m9ZZJkWyfASqAHCF?=
 =?us-ascii?Q?3TqYSqF5ZbvgX3Qe8mny5jE/RAOgNbzZGzsQu4Zpdi6OmOfOGLVz9H46HqkH?=
 =?us-ascii?Q?kMKzGg7F6eSLTuZv5DejTz+tVeu6Le5X5HWIdxA902j4ZNhOVmZG+C5YWklN?=
 =?us-ascii?Q?ljEthcwH63yTZkTwdzs2ixDiKDgZ54Dwdff7luy7NZLTuojQ1mNrDPH0PWea?=
 =?us-ascii?Q?Wzu4beVQ7iZNXVPLVrg7aRLjR7iBvAxwWeMS3X+GsXTG2WLdRgiFsB94jkZ0?=
 =?us-ascii?Q?t97WzUeVLdpMmz09Lt8p/lmdqh1QJ93p7Pxfi49IdBtpG95tqk1kfqQq0R8i?=
 =?us-ascii?Q?hsAXFtR7u01tKdJWTFJuo4hZHgjBCd2stS2CJSXaq7vp/fvVV8LJk2cGfSmm?=
 =?us-ascii?Q?PWDcxxU8W1AEt2aAf29j5UO/6ejpDmZFUrHJTeWvMzyXp1Hi1tHEsjylEUB/?=
 =?us-ascii?Q?kKQcCK/s4b6iyaubCN07coimP/414zEmixC5m5KIOVqchDk6iLCyqOvsMzL6?=
 =?us-ascii?Q?ym1qorOEWsBn+0eAKH+k6XJnEs98QB+5lsblDsG/Jr76bs69/YXqWgJLAgCe?=
 =?us-ascii?Q?ia26ZX0H1t0oXEPJVaRrj8XbOXktKTZ7zJKqbMTGc7/1sHz8CvOCgLLNmRTd?=
 =?us-ascii?Q?dodMpAD/4a9pjjAwOafSlkndgC0AgU4+0oYl8axuWspvPs/QqQmGdyHk9zuR?=
 =?us-ascii?Q?5G9Gsx/2D0Gyeh2I3SMFsypIRkr8qxlOV8PZxA/vUKl7DBSVlt7M43piVN3X?=
 =?us-ascii?Q?tauCUjSJW1V31q2HKxsK5nHfq09UHHndnJjwi7ziWf4vMSbmrQ36NkTHk5OK?=
 =?us-ascii?Q?jMNY0VA8D4EH3kNRy7ISVTYWdc6FhCNW88mI+fAUFEyrEBfx04R4QmdYo9SC?=
 =?us-ascii?Q?PmzQb16pc8Je5wV1N1gg0yAY2gsIWSpwIv/jSqBiR2T32AisDPNziDYobp6o?=
 =?us-ascii?Q?ReLQlpyOSgWOqMdU3/3ko+b65gxbpKT9/iOBvLUZciLNKV8NEsIehDqPDtJV?=
 =?us-ascii?Q?WhDR5IOPWjeOsvmhjqYSnkKYicmrU0e+XIj9Q2FdEmB3BTnywJgcew/NYeHv?=
 =?us-ascii?Q?rrzPbrpmqo9V/WjsrWLGpoGDZ65rOb1V5+nZM2kf8TwOmVS7APuenZawm2Hh?=
 =?us-ascii?Q?EM1g00TlIuiKI7pCPm64q08Hfv2IiIV+Hp/L3IOhYbZ4b+tqc/Gz2Xd46+7L?=
 =?us-ascii?Q?exOGbgWJscTFbP/0DzWc8kp5pvBcLcFuHiA+LWjgisfJ916dC8UVqH1Yd8Un?=
 =?us-ascii?Q?zGeoSP1wdf54fBzESqpNVyFaHgW1iPyn4ioWUUnStEVysnuALWIzzPf/pUHH?=
 =?us-ascii?Q?c8fIW9MszlXaPrBg0ho3kbbBZhr/GUhqodvorsna+uyb68J7UD5oClhVGnaM?=
 =?us-ascii?Q?df41LTfVARnJd80v8J+y6s/D5MOaxf+o6LWvQsudxgSr8+/MAm2ETHqL8SWe?=
 =?us-ascii?Q?k1IoGGPzF9wCplspcDEeGl27SEH/BDiVHKQbBDEBunDMa11Ya/XoKS+N9dis?=
 =?us-ascii?Q?x16XFTSkXX9rclkOig0IK34gVzsi1vmSrXS7wAgw?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4966c4-dcee-4f4a-8ef0-08dbf470cad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:29:07.9140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO9Q1EiswiGRIcLJ4qtsMxY4N9Zj5tKHdSXDQUdzXy2VEtdVMiPE82ZYhaQ+h421Ujoehl/VjWoiYB71rm/gZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311180503.fajzMSgk-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, December 2, 2023 10:23
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: [agd5f:drm-next 22/55] drivers/gpu/drm/amd/display/dc/resource/dcn=
201/dcn201_resource.c: dcn201/dcn201_hubbub.h is included more than once.

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mounika Adhuri <moadhuri@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Martin Leung <martin.leung@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   b719a9c15d52d4f56bdea8241a5d90fd9197ce99
commit: cf5668be4e9b7c6e92844559ae7fa430acac271c [22/55] drm/amd/display: R=
efactor resource into component directory
:::::: branch date: 27 hours ago
:::::: commit date: 2 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312021003.c=
uTGPfEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312021003.cuTGPfEl-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c: dcn201=
/dcn201_hubbub.h is included more than once.

vim +43 drivers/gpu/drm/amd/display/dc/resource/dcn201/dcn201_resource.c

    36=09
    37	#include "dcn10/dcn10_hubp.h"
    38	#include "dcn10/dcn10_ipp.h"
    39	#include "dcn201/dcn201_mpc.h"
    40	#include "dcn201/dcn201_hubp.h"
    41	#include "irq/dcn201/irq_service_dcn201.h"
    42	#include "dcn201/dcn201_dpp.h"
  > 43	#include "dcn201/dcn201_hubbub.h"
    44	#include "dcn201/dcn201_dccg.h"
    45	#include "dcn201/dcn201_optc.h"
    46	#include "dcn201/dcn201_hwseq.h"
    47	#include "dce110/dce110_hwseq.h"
    48	#include "dcn201/dcn201_opp.h"
    49	#include "dcn201/dcn201_link_encoder.h"
    50	#include "dcn20/dcn20_stream_encoder.h"
    51	#include "dce/dce_clock_source.h"
    52	#include "dce/dce_audio.h"
    53	#include "dce/dce_hwseq.h"
    54	#include "virtual/virtual_stream_encoder.h"
    55	#include "dce110/dce110_resource.h"
    56	#include "dce/dce_aux.h"
    57	#include "dce/dce_i2c.h"
  > 58	#include "dcn201/dcn201_hubbub.h"
    59	#include "dcn10/dcn10_resource.h"
    60=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

