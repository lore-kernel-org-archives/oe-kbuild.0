Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCE20F1
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 05:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7U3fwwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700458201; x=1731994201;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=o1oB3+kgPODenr18iTtx5IDTjmCGOaWJUQGF12IgR+4=;
  b=Y7U3fwwrrU7Or+OxeqB3aFLdk0Vfg8e901UQZ9mLIvjOxfD+UGA3xBqY
   vzTmQbJyPif+mG5wq0nX01ED6ysYbGcO3YvDhxYa+4bFo7o7q09Aw4fQA
   Fg8ARjk4q0OTd4CjW79R6tBrQZYUyOx+Zu3X6k/flOKyeJ0FIt3uMNFhZ
   6kYsSSD5+HwzeIyvaUbupJPnxfaO1Cbv6SxgXv/axvfgg3KMTcEfRfAXe
   5c2IPgxqyAVQvy2cooel88kfjPgocSWVaB8jWa40++PTA8Fm3Jho3sDib
   FPvuXTNTf2F5LDjv2u0YYowChwRqv2sGrtgooqnatviM8znx+SsR0BiWR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="395484371"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="395484371"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 21:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="832166006"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="832166006"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 21:30:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:29:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:29:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 21:29:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 21:29:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cSOI32pplyluIzN5ZqeU2KiaW5DzCyexoQFjyMu1OoI/dht3JWg682DRurPMdyiF+ejxO1ilW4f0liXScydpDI3uksknBaf6k2yNoPkGkkWxiLp/yIGG/uEiorArMioOv2XrRd8mXBGNRJcfxN1KI7Sgp2rw1XyCtaa3ujS4q1g5ECByYf1rEi2MAI3AWTpk31AQGeUsYkGiQO1Ik+PUx4ZKK1cLvVA//g20UeQCGJAjShh3sI7cS/SlGYX6TUybBtqo0Hv8LRP2I0KAACK+c/pS+sDMtIXlg6ahbpJKVKE6vgb+gZ1AyXEhvdJFlLfrraYjFU2DoFBJBnaAQdF5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLexRzdKz1+rx5xsCKAn52Ei2abLSs9NW3uuhl1UJ4s=;
 b=a4YzIc+zzLjHI3jEGQaaEamDjsD7jX+aistJM/ps1LvfQ6flXGsozEXFvWf5WIieuy+Snj4+6xtiTlYuYksF3wDxuFJ7mY6DPqgEZ1ZYr4f5e5rcMtXqaE41fxuhUfUjEMCPiIIGgXNuRSuJ63Bmo7GCwGBeXG7vWOtU0BN5++eyG4l0MjJFjGl/L5+/0Pu9XstzVMyhpk6OkyKci0P7Y2uGnlVY7QTtKMhm/UI7WZmX5KMkh4sG8E/Gx28/tcLQ9X0QpI5DdvX1q6YKVQXhsbXd7o88fl0cr5XNFKrkdRWDNZSDmXYnJjZCDouUg5C9tTvUJ5p7tzD1Go+KB5mZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 05:29:51 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 05:29:51 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: block/elevator.c:190:9: sparse: sparse: cast from restricted
 req_flags_t
Thread-Topic: block/elevator.c:190:9: sparse: sparse: cast from restricted
 req_flags_t
Thread-Index: AQHaGrTRhbwlgvFRFke4VhiuMJv9rbCCrmHw
Date: Mon, 20 Nov 2023 05:29:50 +0000
Message-ID: <CY5PR11MB639264D603758919A63D7B09FBB4A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311191404.68N0gvLE-lkp@intel.com>
In-Reply-To: <202311191404.68N0gvLE-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: cf964381-5a04-4f55-7d2c-08dbe989b7cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GyBjyrU1wfY4OjIy6YpE/5nXoeClEdJBeeZqp25QywI9+zvP+WCEs1MuJbnCi9doIpLu0CxHgLkRKYimlc1JwO/op0d5cmSQ6xocoRhdjh4Vj2YPIp4HuKIYyp5vX3lE8jsTKSBV8zbYH9U8vC6KJhs0B+mNZ1eNQ7phVRHt9gEUHvDR4rpdM/gC8FtPUzuHl2ZCX0XtfMaKkLPuMxuNf2zmaSLKidTXf1wVHjFcR7y8oWjWKq9pzoV/j39MbDqhqL9ylfWZpB/YoP9Wny+2wOU0q/159MtWMZ4H/ATSxGemir6M3zMqcqwdcUwDWQNGkskylqFotYARxDYpIVAdP/xpP5/eaItubXy9mxsaDkEd3ebZdDZ9tFajOuWar8WGNwd3PfFXiP2ALHlPgexvUlSBkU4zW99RX1Fn7AP2j8IcxNeepPRGZbAsN+tETAA2dyyrb8hfEMecQZms+ccx/DMNbYgcl1ROuUbwVc6iRybXwLy0IbNdZRJisNAFI+aAWiZ3m7OZGxS/qV8uI/YlGyxupInHtRyEhRrl7xyDy243ezbIdJSLVYLUt8iIFJJTsOUBWJZAwlh8EmQF9ryMLbLtTlUfxRqkRPS8UG67+G9tdTBTNKNL6MA95K+wqtmHm4pmISCNKC8LJrPjSVwfEZc4jy/1ohf5p97eCO6d+2SZV8h0Biz4IbbF5uYyXonE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(376002)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(110136005)(76116006)(122000001)(316002)(64756008)(66446008)(66556008)(66476007)(66946007)(82960400001)(478600001)(38070700009)(966005)(26005)(83380400001)(33656002)(53546011)(9686003)(71200400001)(7696005)(6506007)(38100700002)(86362001)(55016003)(4001150100001)(2906002)(5660300002)(8936002)(41300700001)(8676002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l4E01x3rIW6ir/WH6q8yS93G6gmFmVZYEvbtmxfX0vQjjqMgooLa6Jlr913s?=
 =?us-ascii?Q?6HrhFdFL/4rDg6bjKXwK/p9zzmJorYltpv3vR8x3sd4GbcyJALnTC1gKgTWx?=
 =?us-ascii?Q?g1SkAVqGq9DipLmLk2GyZlMnTZYT9QqHeCSqH0X64vlGQrcE2xBZGM+VO/tb?=
 =?us-ascii?Q?8RBTNj+GlhGfKocNxDuzvB5DpsIOGZouj0FOyrGzKdEWWKno1tc+nX/vl3E7?=
 =?us-ascii?Q?QzpL6rCQUiv19IPCXz33CYkOjwybLz/o7B0GKymbnBmkuAdDFdVXxljpxpFN?=
 =?us-ascii?Q?5XYkjDMQqpqWTC/Du6KgNyv1O/E7G5RmW8mcyEXG7kixKbgsYSWTU/kEppEF?=
 =?us-ascii?Q?WT8mBuzqtdYqjy4wNrjhfZnlwCvGZDDhxZ7yaJxmNqY2AQwoZ39veF6Lj9GM?=
 =?us-ascii?Q?nlVJVRD48fCsQJBiWE1vh0LZXzj6GSaV7mxNNVlpAtenDnSPkdruvJRMt2tg?=
 =?us-ascii?Q?4DzkXAeFYVlz1zMfCqIsGOz67jUxpMum8ZdADmlugiclRqsCNrz6Hv40tmQI?=
 =?us-ascii?Q?1NioBM4gQezxGNlQM4FL/hn7D57Ag3plx0P9kCtlW63QQNTUiYTSGOn5EkBy?=
 =?us-ascii?Q?Rc7nehinyvCGo58mPZkZjv0QOS08y61QEKSpdGEgRJO2SFhFoo3T9WYVN9My?=
 =?us-ascii?Q?LUROG2ckf8MTV7SZfqWGQAHblMw1CRNz7HhgnrtP9M5+XND/S+OgMtZwLxcF?=
 =?us-ascii?Q?8L+X2l/klX7bi6cmqMzK0FJZ7dwJxcTFIsODBKAlgnW/plFVMzoR5XQK6dBt?=
 =?us-ascii?Q?//j3WEaG+j+ePZ8ohMgLuL5xKPiooC+ZLvQwufjp12cUQAY8htI+Qrd34bEo?=
 =?us-ascii?Q?fJkyyrnOEPrm936lfxLyMfoJ3JxpdcN7k/5VCJgdvsr1ujaL5y0T8UasOQDS?=
 =?us-ascii?Q?3BZnRQIrx4IX/W4cp309mOToFeAaEU7AFLbfXH14M/sZ+6jOXgNTlblGvZSj?=
 =?us-ascii?Q?WajyN6b4h6akhUMzxv4h/Waww8jTkjDrldcvOAXOQAzyAW8bRLG7ZLfpUmnV?=
 =?us-ascii?Q?u9wYpQzONC44puBNJVXKT0PIvW7Z6g8DjYboI+6zH3jyuAuRJXfXEppxplBK?=
 =?us-ascii?Q?B/eKi+ze7bilu7RGkHfnhlTxdvPYsicTTvkl9cM6cC0LEr0r4OR/wc7EpQoi?=
 =?us-ascii?Q?yNK+OKuoD2l321AyeLz+qaPp/0TONocknojcIYEsS41Gf3L+6jX87bkDSwsU?=
 =?us-ascii?Q?pQnT6WUj8wDgb1mVHEIbHOHvSpv02L6S8YZyRD4H91Wa+lBEbfckkpU3Q+8i?=
 =?us-ascii?Q?f+60w/zLITNJr+Msx/Zm579KEpPi4vUbFNUNx7XhWszEl3c2tU4S31p9PTGN?=
 =?us-ascii?Q?9UdMbEQVDZ4QD5fMZT+4y36T++hKbX1vgus9+/atlzndAlJ4kxgGzKQ7pjHJ?=
 =?us-ascii?Q?Qa3lzd7yWkoeXMXTC2JLu3YBeIpipvwiM8qYvUU+HTyG+3zQEusfhTffU6YT?=
 =?us-ascii?Q?8pXLDmRO9lILuMfxk/U0iGV33lbNXe640/iOGiHBx2IC7g4TojEMZOuZ8Vox?=
 =?us-ascii?Q?RzxqjuCC47cwOeCXbDFQ8PuklGQzSnQpaVsChHpX6XyHyTNNKWsl7mBdiB3l?=
 =?us-ascii?Q?pGnYjJL5kuwdXWZuPJbXhtUHSLa5So5fMwccsEtt?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf964381-5a04-4f55-7d2c-08dbe989b7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 05:29:50.6371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBJKkK6kKlrf1YGxGyYfQLBGsYxUe4RXdWp8y9yCjCxXhty0TQQz1IufYp7re8JwjohjW+bXcg1cvMMGCcZQIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
X-OriginatorOrg: intel.com

not_report

This commit only changes Kconfig, and the source file block/elevator.c alre=
ady exists before this commit, so the warnings are not caused by this commi=
t.

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, November 19, 2023 14:50
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: block/elevator.c:190:9: sparse: sparse: cast from restricted req_f=
lags_t

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   037266a5f7239ead1530266f7d7af153d2a867fa
commit: aa9f10d57056cea51d41283d3785bccbbb9f459e hardening: Move BUG_ON_DAT=
A_CORRUPTION to hardening options
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r112-20231119 (https://download.01.org/0day-ci/arch=
ive/20231119/202311191404.68N0gvLE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311191404.6=
8N0gvLE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311191404.68N0gvLE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/elevator.c:190:9: sparse: sparse: cast from restricted req_flags_t
   block/elevator.c: note: in included file (through include/linux/wait.h, =
include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evalu=
ates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evalu=
ates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evalu=
ates to true

vim +190 block/elevator.c

9817064b68fef7 Jens Axboe        2006-07-28  185 =20
70b3ea056f3074 Jens Axboe        2016-12-07  186  void elv_rqhash_add(struc=
t request_queue *q, struct request *rq)
9817064b68fef7 Jens Axboe        2006-07-28  187  {
b374d18a4bfce7 Jens Axboe        2008-10-31  188  	struct elevator_queue *e=
 =3D q->elevator;
9817064b68fef7 Jens Axboe        2006-07-28  189 =20
9817064b68fef7 Jens Axboe        2006-07-28 @190  	BUG_ON(ELV_ON_HASH(rq));
242d98f077ac0a Sasha Levin       2012-12-17  191  	hash_add(e->hash, &rq->h=
ash, rq_hash_key(rq));
e806402130c9c4 Christoph Hellwig 2016-10-20  192  	rq->rq_flags |=3D RQF_HA=
SHED;
9817064b68fef7 Jens Axboe        2006-07-28  193  }
bd166ef183c263 Jens Axboe        2017-01-17  194  EXPORT_SYMBOL_GPL(elv_rqh=
ash_add);
9817064b68fef7 Jens Axboe        2006-07-28  195 =20

:::::: The code at line 190 was first introduced by commit
:::::: 9817064b68fef7e4580c6df1ea597e106b9ff88b [PATCH] elevator: move the =
backmerging logic into the elevator core

:::::: TO: Jens Axboe <axboe@suse.de>
:::::: CC: Jens Axboe <axboe@nelson.home.kernel.dk>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

