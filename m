Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A8139D
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 02:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OD2aF5Ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701656822; x=1733192822;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=bO+2lbnAEDT85zBCYc2BTNOfFLogke/1kv7MqFVYAZo=;
  b=OD2aF5AohHeqQxpKEhbuCUfxYpVHhWIbyMrArsbI66JuXU2tD+5Z65CQ
   sZTj3i39r1ZX+8kuN2sEvmCdrJTM5wsb6+4lBeBnMWs+PAeQsa9tiZW2g
   SLvLHR5BOerQSAkn4Hmk3mlfLDV2+olXv/GuUZCoMjejhWviw476/R3En
   ZizZVg8DnT1eTgjp4E9zHs33+AQw6BPtRBAe5aFpmhrrX5f33F0m+A4KE
   vFMtzHvfxllRhwZeRSSbIxlkmnjNWaHvXqjJj8wccPO627puvyU3lD8qK
   tdq69O1cyd2cLvyI0y8OPo7xHOAuF2oSFMz+BBdGxlwNV8ZCwUntqLu01
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="384078841"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="384078841"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 18:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="893836858"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="893836858"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2023 18:27:01 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 3 Dec 2023 18:27:01 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 3 Dec 2023 18:27:01 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 3 Dec 2023 18:27:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keLE5532Z8ze+8DB2niEjbh/9nw6WvqRk8eqdV9orGo9rSQ4yChw31+4Ku6jjrYCvDkyOpiE411MzucivWYA1mDOE7rCcRGvV6epZI+qcce2MLZjkJZhCXUKb6TX706fE8U6vD7HAyspG8igL6BAWP0Y8jPSgMrhW56BsV3cMx1T50I/V0cQiPjLWs2WVeevDy10tXNe+rGvmjl6unRSPF1vV0MneW3/eeOJfkFHAgFhtmK6s+TD3ywVc68PUv99MPzKbgCYrkKWB6NU3EDUt+dqSAAiiAHJslrVvn05vi6khlz0rwMZjg6LOr32SqBvYed3DRge+Lz4IcTlOlS5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRyG/M8TfteG7N0qCGY+qb9txMXSm96RGFrSYHEaxWc=;
 b=cV3jjZ69jfZgs9CSsjDrG/cxDRa+jVxPDSn0gHDHlVrg71JVbX4hhhSy3P7m1Owm+lkJQSl5FigZi5YFsqhm2QLio1PqF3qyF/Kqz4eTVsrseScFHGJ8perBAekeBIln70PIjcpJgJYrIU7xubTrOhQLCRm3UxO3KAJDB4zPlW120i7yRW4Mz9p5gUC1HJpnmfQZAyuuZtF/8iRwS4BlB5Q/8DAjiSrNcVXd+G9hMhju3eA3JNpS9eqac8507jCNShIjgplEPLsQW76QMTp2X4CziIlGFNhq+95sR46ymgmJBjv7byoULYuHwIzrO7LCLZz4CoFy7NBKvfxbSAUZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 02:26:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 02:26:59 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: [PATCH 3/9] scsi: bht: card: Add the source files related to card
 initialization
Thread-Topic: [PATCH 3/9] scsi: bht: card: Add the source files related to
 card initialization
Thread-Index: AQHaJbKTh12iVzfnckuiDe38nl9RB7CYZ0Fg
Date: Mon, 4 Dec 2023 02:26:59 +0000
Message-ID: <CY5PR11MB639289F1A8F40A32983C60F3FB86A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312022052.t3F4JFxH-lkp@intel.com>
In-Reply-To: <202312022052.t3F4JFxH-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 539e2b9a-4f74-4b2a-e63d-08dbf4707e14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /aTNHmdpo5gStWn2BTBfQFwTceFyZRhJDp2EqDYopkmPOMeNQqtancpLQvefKZ0nc4sCoDcoE75v6sLc4gOdEs3Lzp7PLspcSeMJ8mVTOYaeeyzgrwrGQdrGfWbVTClL8QQWXdeEBgGBOCzbYcxdGya3NJJsIdYhg9cLDnnvo2EHiXGUGiHUcgLLJrcqW0u97A79eac/X5fNl5LmoV0Wfi3+qPXD4NA8Hkhu5JLiW1DkEULEHf8I/U8PV7eviy9PemEYjI48bEwmNhp7hWpuVeoqAH2b7FOIJYFb36FMHwWjU87/Ri4v5s6kEHzwd0kJeFMJayhUh//ZoCGBDm2o6PWx1i6pXCasa7BSRk4JHmLGEQlVmbmR8TIctZidZM7x1gMpqoHr9zRIttdt9eMgVeVyGpzTOZnU1NFGjGbJNwJ2aOmH9fjPPoFvLXKw2kB2TtLC7W2uGyT4emMNFSt+YCLJnqq9ZYrpaWtKygdarNs687qWOngjQmy6XSrGocTLS8AKsjwa42/i8fE2ZXjcz1ywt7OcQqm/vuefN/Z5615D3Tos1ZpKHNwXmvVpun2JKfu/T7tKFXmjFqp0MOVj+mzu8n4rvojpYqwf4Fsz3P4gxtugS5u2JZP7I5ygwuTAmSUHJgf/5TFr0tBA0HQE6Fdv1BpBVMJg+iF7xLXbnjwJ6VCjE9eGy/T6+b0wsv3t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(66476007)(66946007)(66556008)(66446008)(64756008)(76116006)(316002)(110136005)(83380400001)(38100700002)(8936002)(8676002)(52536014)(33656002)(5660300002)(86362001)(122000001)(2906002)(38070700009)(41300700001)(55016003)(82960400001)(478600001)(26005)(53546011)(6506007)(71200400001)(9686003)(7696005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uac5yap/xsLgbVpscJ+QbOKRCpc7im0LWy3+TtO6MN5DfAMk8uLFsTkr9Cts?=
 =?us-ascii?Q?KmfIA0RQpX5bnXhlvSXX0uRxzs9f3SBMpn+TBBhLDv/z+8EPWlm3wn7Csh/e?=
 =?us-ascii?Q?DJdaupvbt49lGUB+jGvkef1BMfW5HFMcQJX2HRTpTgVmw3V5JXNwhEgsVcdw?=
 =?us-ascii?Q?VHJ+qCnUBomGyMOhm1YJ3kI0p6jmloVSS3vnI4dWm3lTcDDrLVQElOg3CUXJ?=
 =?us-ascii?Q?3+zgYaPyGSeCH99R/TyCrFoNF9i4i3o6UU+idAKUSyebhW0NytE0nP0hq62I?=
 =?us-ascii?Q?6P5GHzyQuU0cvnGueP5dA1A19RXsx/IT5xGJN8PyvLd4dfUTcsvQU0tvDzIM?=
 =?us-ascii?Q?pbsnpSIR8QGSz1GlvyUAHY7qgE0Lsei6mRy/kjppZcli/y9jDZtpgMU/09c1?=
 =?us-ascii?Q?+yEd+NtM7loOfjgFDm5lgUCjDX7T8plw8x+wUFPdF5utiws7LJWtzMkd2fFq?=
 =?us-ascii?Q?es6KTYnDZVYAD7p0BikAGClEqjFQXWgNxhGdEaZcZlclrp0h8HE4IBDV9BcZ?=
 =?us-ascii?Q?Q6rqH6urpe4FXPM2zhraQf5M8fFWEuQ6H4TBPnPJSzvn9p8d5WqkKdZDF+QH?=
 =?us-ascii?Q?cP7TwgobXUb0YuvE1JJ7gL6+LXiIAWh+LdZj9JLdv0WYe8Kr2y542Jm+pzV0?=
 =?us-ascii?Q?DZlT1Y2llSj5ijQDWoeyaPomWjlIVYHA3OgStgbOTIOzhWhS8qykLvrgl6Bn?=
 =?us-ascii?Q?Ws3F7T1sZV4fQeoNsKM17ySdQ9rLKnLkdxlakDt/v6uZd1e+xgK8NgPgggYS?=
 =?us-ascii?Q?F8Mae+p+VQZHmw6e/SzrMGYgfblkTgNr12mLYf+Mhpq4BnjuNDK+bIkYnpQ5?=
 =?us-ascii?Q?vqMWMAGQnk6H0WNN57YOni7JjKeumhYXTTk5O6iYewjmQMNymB6qJY+Q26zO?=
 =?us-ascii?Q?53zRdvBTtZ4RwZ5XEyQHfd1t3YR66wn3LDX9+a4gOC+YJ6ZHe6MA9PpyGQ6I?=
 =?us-ascii?Q?gYGOyq2ImrUvxWdT4dn5XtkevamRFvQ01QDZ9Z7RlYLOLaiN/4FvPW0XGsdQ?=
 =?us-ascii?Q?E/kQxPtx1X2lIW3zNRVc0FsXVcWtoliE3wD3QmyecQaf+tCwHR52+AG6f3pu?=
 =?us-ascii?Q?tltXhEk57lZXNvGyseBSTEzzDVOiev6l1qTYjycelzJYmLrPNAgVYPxRCHL+?=
 =?us-ascii?Q?qsaqyUw6XnMe9uml6aSeyOB8qKbgQzUsVEmcww8tzle3Z+wu1EIr3sKftK4K?=
 =?us-ascii?Q?q+gVA9e7gGiFxKGMV/eV7UCLTpgFwFOHEsWltqKAokx1+49qG1CID7FfbvTe?=
 =?us-ascii?Q?ravU39y0PLSr1KrCI/tkWD8MzYbJJgBaOPTa5z31i7vop/Lkmr+BPVzyaXeH?=
 =?us-ascii?Q?O7CGkJvGWhvWPwGjHYQkl3aQNaK+0XFgUiLZXM5L/80bTxEoTzx+86yMi1FC?=
 =?us-ascii?Q?lzy7chzONMSVww+xFa5/7YXApJ+P/Cb6se3YdNgotG0x5ZQYWAfAMPDFG6uj?=
 =?us-ascii?Q?17Pxv1x0fFVd6GMC8TBVYw455zR1qK8krWrAgNMrfor6Hl88WGC191Wrhq3c?=
 =?us-ascii?Q?MasMAz1bptrRjm33pys/NS3413EAyOhFJboX99FAkF/ZG14yZPeHztkG58RT?=
 =?us-ascii?Q?Jn7Iv0LB157839lTE04as6qXemjMiqqR4rPmP+H6?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e2b9a-4f74-4b2a-e63d-08dbf4707e14
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 02:26:59.1335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxQPlR2fV2o+cudPu7mkQ8G/Jm6vqQpZ2wJB7z/hU1Tb8BbE1aPXqwIJT4bmTOlQil2nE9mjsdPDzbDUBHg4JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202310220339.xnImSaRm-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 3, 2023 14:31
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: Re: [PATCH 3/9] scsi: bht: card: Add the source files related to c=
ard initialization

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231013083320.10279-1-liuchang_125125@163.com>
References: <20231013083320.10279-1-liuchang_125125@163.com>
TO: liuchang_125125@163.com
TO: jejb@linux.ibm.com
TO: martin.petersen@oracle.com
TO: linux-scsi@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: mark.tao@bayhubtech.com
CC: shaper.liu@bayhubtech.com
CC: thomas.hu@bayhubtech.com
CC: chevron.li@bayhubtech.com
CC: charl.liu@bayhubtech.com
CC: Charl Liu <liuchang_125125@163.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 401644852d0b2a278811de38081be23f74b5bb04]

url:    https://github.com/intel-lab-lkp/linux/commits/liuchang_125125-163-=
com/scsi-Update-Kconfig-and-Makefile-for-supporting-Bayhub-s-SD-MMC-Card-in=
terface-driver/20231017-123349
base:   401644852d0b2a278811de38081be23f74b5bb04
patch link:    https://lore.kernel.org/r/20231013083320.10279-1-liuchang_12=
5125%40163.com
patch subject: [PATCH 3/9] scsi: bht: card: Add the source files related to=
 card initialization
:::::: branch date: 7 weeks ago
:::::: commit date: 7 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312022052.t=
3F4JFxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312022052.t3F4JFxH-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/bht/card/cardinterface.c: ../include/cmdhandler.h is includ=
ed more than once.
>> drivers/scsi/bht/card/cardinterface.c: ../include/card.h is included mor=
e than once.
--
>> drivers/scsi/bht/card/output_tuning.c: ../include/card.h is included mor=
e than once.

vim +30 drivers/scsi/bht/card/cardinterface.c

  > 30	#include "../include/cmdhandler.h"
    31	#include "../host/hostven.h"
    32	#include "../include/card.h"
    33	#include "../host/hostreg.h"
    34	#include "../include/funcapi.h"
    35	#include "../tagqueue/tq_trans_api.h"
  > 36	#include "../include/cmdhandler.h"
    37	#include "cardcommon.h"
    38=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

