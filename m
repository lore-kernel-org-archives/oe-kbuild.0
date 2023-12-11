Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6770B15A3
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Dec 2023 00:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIU89z3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702255843; x=1733791843;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=K+ipVFDvwf6hAAu3H2ZPW95rkWEPycBPHET9SS8bru4=;
  b=PIU89z3Ske8QJePwcMp9OGkP2qLt7+awVDbYq+cF5fKGv4mpP7XtsTlq
   OCen3FC78EcA+SWc0LV/DNOX6lboesLqbdiL8ZH+NID53+AKcU66egET9
   d+kaKdFvwEvcYEXFaNky0aIXJGdjnWCBjhCduhXOiAL17Gq1aIiRwAai/
   IfhGOViqN2BJe+G+By9fXClR/DbSw03o/iJzCT9k1L9BYhaw62Ea0dCAt
   JkuSrxbHfkNBCcKdzAvEVZQu1XVbQNuGFdDSxE1/P6HqlKM2VnHvhYWvu
   UyHMnFPqVKlahP2MMIgcVpabTD8XoLumAlDaFvC1P5GQR5GPzXmv0EJrp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1449269"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1449269"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 16:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="749075884"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="749075884"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2023 16:50:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:50:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 16:50:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 16:50:40 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Dec 2023 16:50:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv+XVjVZ1UWtnVG0wc492YRv5MqGPpI/hysqAv5A5OHqWCk+b5RyyEb/JEEhJP20lhlRCBWCdpfrnCbPgI2eqVDd4gBJCisOT6G2AMAs6oJ850t85hHK0mdZDtWcYM05PxRVpibv4zg0rwO6fyhhGUjotg2EwS/+yQfKyYtazLiYS9UbV+k2WIqlYRO22y1R6XRk17dH6V7Sw63nAE7bUqrWGH4p79sw9lRB96PR6aJVEhjgNB25LsCkQGzxN39UCzplTQZoZGzPs4QwEeADemq/Salu0Uh8kf4+d5zaC/ADEUwSOVAf/oMtkC1yMP5hIjIs3j2AvVnqMRCZaE1MaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AFv4QIE+8lJL3DErn8KKcPCa6wNgQAjxKq+dMHrC2c=;
 b=eTDSGsd/YTOitGQceInVEJdGMZ3MoTmIUWBqMSZbRObPYvpOWSiRwqn2mlKXqe7bJDUowK5oW6ZxLR5I9b0W2zGnTv465bwvDd5Fz4lfMdV6nhEjn07zxW+Rx2ifM32seEUYO8ddSuThiUkRT34xLcOHzevN0/NcDdGefDbKuidKaeyDEg4b65/egP9n6qLfF6U9J2zVoplLXJbrnAh6OvRAeC0RVqIWyD1iV61gOYK4tjuHuf9osUthjxddo7JJbK74YyMMdlceeN9mRs+hijz/uVp+2k9/buC4iQCztMlLgPRwUXqv27aPhVDmdeT9t+YmfSuFJN3B3dJHzU13HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 00:50:39 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 00:50:39 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: hcd.c:(.text+0x355a): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Thread-Topic: hcd.c:(.text+0x355a): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Thread-Index: AQHaK2ZDXiQ4ZipqwECxwZvP81mYPrCjQPzQ
Date: Mon, 11 Dec 2023 00:50:38 +0000
Message-ID: <CY5PR11MB6392E82A2810748139195ADFFB8FA@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202312102024.BAUcqiJU-lkp@intel.com>
In-Reply-To: <202312102024.BAUcqiJU-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SJ0PR11MB4879:EE_
x-ms-office365-filtering-correlation-id: 5b847067-7758-4642-8bd5-08dbf9e3319f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X0F2lCg5lQidjhNPjpPD75pprlDGBq2UQGnsOfNt6Ph5W8kkQlUy5FdkN8RpUfQk4B/gv62U9U8x6/ybMRr6nK/Hg+cikLPRmtLBwv5dGq15uK5Ix++0XubTK2dyf1nmP5IhfkONxelJwQCZxe3bKTWq/a798D4Vbp4JT65/FN6OCKLerOHTznfRWFpSUSGJl7jF424Hv6q2nof6i0cxXW7xTtgKZnNcVXRDCIL4h/Wk1ffJKjOQLiSpHaWNP/hpT/Z6FOSgLz+qzcl85/uxNSoFEw8k9eRvpibiv+7FULEUEP+jOST5HBFhngiuCude4d0F81UAzL0+q+6qs6dctcI9Kfd2on+G6y/Fw+gJKNYUk2UMrh9YD9UUljW7IPxSN14oY55MfbCKjgWde7dwuI5MrtWoVUU+SLDrx+Q/pwNGVb343s0NehfjBUBizzkRejNc1yOGDkRDjd4vMXez7c3N0wdqn4CV5wYtETsV356/Sv0LA2BJ6jAXEefmg8yXVzJNo4vZBjbcD5WRpsKJBGwidM0H0B71pfuDETs9yP7TRYXuU55MLlpfXsV3jPpam1zMQgOgFRilJsRYapSVEuRaVP0bUTtBS7dYB/l4uVTElBBGB9jB1nXOpuFzqrBUraT34TqQGvyS/xjWCHPm2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(9686003)(52536014)(6506007)(53546011)(5660300002)(26005)(33656002)(55016003)(38070700009)(76116006)(66446008)(66476007)(66556008)(66946007)(64756008)(966005)(2906002)(83380400001)(82960400001)(41300700001)(478600001)(7696005)(86362001)(8676002)(8936002)(122000001)(110136005)(316002)(38100700002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iYwpjVwzwtCerJ3yn8GpAVVrd7jfGsv0vZzv6c/0/lHEcjIZEc0yYL+5HnzV?=
 =?us-ascii?Q?TR1rslMX6qJwSb/9rh/hgoaf9gUI7j5oj547sPEwFoJxe3SWm/83JqBPq8X2?=
 =?us-ascii?Q?e7hfvAunfq1s/sjKqugRJimk+lpPrtVxFQjRI7Y8y8oJxkGgRFSbH0/aHaIo?=
 =?us-ascii?Q?mRYT3RkfKGocZVeoR4sxntJyLGhLTRs0nkMeIVlWypNd55rjtHk6Ji5BFytt?=
 =?us-ascii?Q?cSx1lxzSU4zp5pVR2fpuLI5le1i6SFYPirSqBAWCJcyOFU/fH52CqHPyWv5K?=
 =?us-ascii?Q?2Qgs9Rdmxt8QR4UK4Sj1KA5BADbaVtzREPzNDSJCwoitJZUZVsR+3fRt8mTi?=
 =?us-ascii?Q?ICGK6koARkPUZIRI8HzBludCZhBBnnwpRZtCnwB8dvE44FcIf3fVdqfXK+cT?=
 =?us-ascii?Q?B53/jqyB2Nd/SRJmlb7Bq6fezZqWiBvLupQl4kl/Z6gr9+UugaZItAJu6OS6?=
 =?us-ascii?Q?K8Xfn/AYcCihq5hCPgEWBTK+zGwVeFCwEZ6OFIUMxUGxm6ICRKhUqHA90oJG?=
 =?us-ascii?Q?lthvdmHqAQK6d+PTtIAELeBQmF9wx5j2CMWJ9AKs1Xv5G7LaibrbGvDfZb5S?=
 =?us-ascii?Q?0um4MBwI+QtV3XmZAm7SvAwnfrj7cUIqYuWgGCcCs7vJLlkexxZfV2EV6biN?=
 =?us-ascii?Q?EhlHEdbkcpgO0RlCBz5ZzG5s/vd1xxqp9MTh34NlGl0RDMb3aawWSpfWohgU?=
 =?us-ascii?Q?PlKzuRJ29E1X0CcmwralraNQb/YiC6wgu7c3V5n9haJMSU4dToZ34x7GEJ3J?=
 =?us-ascii?Q?R8ENEqPTVO2JDoa6J1135Mu78aUXOH7raX8XBMddjOfwFfJkd0Zj+K7OQHYv?=
 =?us-ascii?Q?3B7BMivwyBXkGh1k/lVZ95QeR0uffwCyTyRR0UH0v6BG3681aUF/TzQx7jB5?=
 =?us-ascii?Q?VwRC+CWdtV4EEU9STG2uS4n3hWZ6UkORbnzItYMUDDF/Xw0FRGn9IxQNMbU2?=
 =?us-ascii?Q?o826Zb22Oiezv28HpgGu17fNsZZ9MAKbMDCo89Erpj+bz9GzFAGl385f+GeZ?=
 =?us-ascii?Q?VV448paATANWr0YB2JJeh54eerDvCXn092a/NjGcA91hvKt0vl6lyYg5/rbS?=
 =?us-ascii?Q?2qUTNKFAsrPPbO4OWJpPtGGQIinRnv59Bn/WyCbaltQTM1wJAVXdsTemeV9J?=
 =?us-ascii?Q?L3lgeMUcNvZzCzoc26AlDkLD5OxN+rhe036HEEZh6hWbAxPP+FlgOr3NSzjA?=
 =?us-ascii?Q?zGJq6xPB78hWvYJPncl7s/eV81N66q1F1BWknpsl7pA0zhFjCAdCTxDWVkx8?=
 =?us-ascii?Q?JfB/63lQXGflBafxy72ql4QlRMVIfq+u/XMGofc5TDzFXasDtYF7Zk7A0/+4?=
 =?us-ascii?Q?LMmkt6CwlQadjrf8INFDGdYamSM3kXQ9xF2dte5ImoYiYXA4k/QYVS8qN0CH?=
 =?us-ascii?Q?gSD1NIUlRbr1BtUwmZlmXG53FNNKxwACOU4yFFU6fSZAkqBHxFSYxuDoJuGZ?=
 =?us-ascii?Q?o/C9lIYcYTgBMu1vkVXh1eVHnrhOSXBWOSGs+yKPpVKOw0zt7IW4udfvZxJZ?=
 =?us-ascii?Q?/Yj/HbFO5rivlBOyJttBVW7iCZk8ZYw7YMY14vW+Q5ZOI/pcaK1/+HwHreZ1?=
 =?us-ascii?Q?a4CzFMrtzKdVjY7poBFalHbsxbJdsSYsS3hPEow8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b847067-7758-4642-8bd5-08dbf9e3319f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 00:50:38.8088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: arVl1NW84nveXZaw6X+s/9YV2qbQdB+n6db8qc3vuhicmpmVbF8EftmN9Ze5wolN07FmjxD6NfGp3bCLj/V5pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
X-OriginatorOrg: intel.com

not_report

only kconfig change:

fs/xfs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Sunday, December 10, 2023 20:40
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: hcd.c:(.text+0x355a): relocation truncated to fit: R_CKCORE_PCREL_=
IMM16BY4 against `__jump_table'

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Anthony Iliopoulos <ailiop@suse.com>
CC: Chandan Babu R <chandanbabu@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: a2e4388adfa44684c7c428a5a5980efe0d75e13e xfs: fix again select in k=
config XFS_ONLINE_SCRUB_STATS
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
config: csky-randconfig-r011-20230302 (https://download.01.org/0day-ci/arch=
ive/20231210/202312102024.BAUcqiJU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231210/202312102024.BAUcqiJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312102024.BAUcqiJU-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/swi=
tches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapi=
dio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/swi=
tches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapi=
dio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/swi=
tches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapi=
dio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/swi=
tches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapi=
dio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev=
/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s=
3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev=
/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s=
3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev=
/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/=
arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev=
/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/=
arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phanto=
m.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phanto=
m.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/targ=
et_core_configfs.o: defined in discarded section `.exit.text' of drivers/ta=
rget/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/targ=
et_core_configfs.o: defined in discarded section `.exit.text' of drivers/ta=
rget/target_core_configfs.o
   drivers/usb/dwc2/hcd.o: in function `dwc2_hcd_dump_state':
>> hcd.c:(.text+0x355a): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x356c): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x357e): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x3594): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x35b8): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x35e0): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x35f8): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x3610): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x3628): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x3640): relocation truncated to fit: R_CKCORE_PCREL_IMM16B=
Y4 against `__jump_table'
   hcd.c:(.text+0x3658): additional relocation overflows omitted from the o=
utput

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

