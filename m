Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28301876
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 03:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzGgjEp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700449707; x=1731985707;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WnNE7Pk7Tn7gFT3Sps1ZY4PlOMxVWtuhyqsO6A0ztX8=;
  b=SzGgjEp1m2/TZVEVffXiqtlDH14laubqu/Q2404XZtpm4k8xPWrEuM1d
   EQ6OLFdkzx4PZDw56QbQW6Gk7EkJKl8vn2uIUaUYcJuR01ZYIp/EWIs9x
   Va5FTcZWQT+iY6V6ImJmxmpug691olADcJw0xjGk9W3aTF14s7NWh4YV3
   w7W0BxrpEAsomqis88MOdAoc1YNg86qFtxZxJxxf003TqCIht4LhYaMV7
   LP10OI3G3yhyuJSetM1B3TftqnLDIx+YaVLATmaOeQu2cbZeeVwgnAdEX
   Vba9/QifK/zXsFk/1B/oUgcvxTPloq45jdF5eSmGmlkHS2FWET0X4NC6r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="394387759"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="394387759"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 19:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="759682154"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="759682154"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 19:08:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 19:08:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 19:08:26 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 19:08:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8pF1omCtY6THSUhzR4Ekp+Xv5hu1G7fM3lshdfTN6Gfxb8rtK1Lc8AOIdEexzlYtbvPsFUToReIk1FWiVmBiLAaeAPuqRUVyA8uXwfLfDCL0ncN3ycMQ0ksbQ7WUjE6JOBal9vUaDLoR4tSuKr3a2jFQfo5V9MGfp7KJlbhTGtt2QDGuJrplRdf9EuGZTj5pszc9X55900keMaYwFbz7cMmauxW9hvpjlsv+xqhBw3YJHinbMvAiawm7qqn/32T3TVT8IYlBlW09FQaOpYUApivuwoMqA2uQWiD261qtOJajhrNsD60SwSNDqw8QwrSvzgtcatnuJNoZidVzUIkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSFPA1EZeQSK1cSJgMC6q6WPydoLldK+HTKr21Zf9lY=;
 b=mHTBxhsw1HuDOe+OUXY8lkxqVqG1zgJeVfCNMj+Y2H4D+7W/oCPhTJJ42Ss4i1CMgMwsTWbMkb37zQp8dZORnYsEA5U7C+GQ9KCHhrqH74VsTblFAFuiAoHLVg59Y0Y5QuGL389MOI5JYMsaXaSEHA4LdWo9BbM1kecg5RNQFkN48CPJnV91nn0FJuaqMuhc961bLcXdtzFyRGU7bm4D2N6uc51RQ5mde+Hisv8eLe5/mj7LklpTCmXr3gl/k5L4Pir2FjurA6hXEzuKxH62hkB0A5Cw6wnejlS9SMjTpe/EQ5W8YjoK5fKn48v09xbVMaR1VcS+ItiAi7l/7BoCWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5675.namprd11.prod.outlook.com (2603:10b6:510:d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25; Mon, 20 Nov
 2023 03:08:24 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 03:08:24 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Thread-Topic: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Thread-Index: AQHaGZRcUIpzZ5Qlh0+05eZjp8qRJ7CCiddA
Date: Mon, 20 Nov 2023 03:08:24 +0000
Message-ID: <CY5PR11MB63920F62C26F73EB5DBDCC19FBB4A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311180450.rNw8b0oN-lkp@intel.com>
In-Reply-To: <202311180450.rNw8b0oN-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|PH0PR11MB5675:EE_
x-ms-office365-filtering-correlation-id: 0df92ceb-33f8-4dc1-f2c2-08dbe975f587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fihg6qiL+B51QQXPE9nSapIGSKtVc4BCDOkIkqvJAy6xYYCYHElwoO3cIWDgwmV1m91R03LQcoWZXjJE0PzQU50QhzyUJcUPzM9OH93HqjuSnFzfCQIatSQViaPBuVlkMqonSeugFa1ATTIffT2exEHEJycTzdkJJQtvtMNB+RAuK7hB8D6YyJAZWFlQQOHGULvJjaq44h7dXZBEa19vS2AmhVmbknQOZaTbnXBIe1dz9pCM7JD8fABMSQP6KglbkKhGP1r0gDubMkeO4U7tpVU8HgppSUebKx6Aj9zkFbvbvcQyQ9MH4xxgyTmqkSNRZ/nliuu5E/2jlJLuQjf9K7AaUxvZzGdwUzASpdUSvKBf7NnEdBQqJaBxRXzE/E48jyw5An/DCqt0Uft7Fjhgn2YI+YPQpIfnop8ykUG8ONK6KTKwhbANVAjg5qrLO40B19uZi2lWvxpqU++rulsbD7sPPapWzFpX0qNkTkn7NIz6GC/aa0UpG8fbBdn0BxnmnYHEK9moqxKniDrJUBZfqiDxrA/bLGyAQ/WgfmufQgyK8NqVyvf5snI0ViLwZLAyp65i57+JgvF8aZC/HNwsj7yN28jGsrNDxa8hhAOCvbMu3lx+baDcaVLWdMa9gTnCx4BOdYFWl+rrOiE8jemqiEm99LyjgAoQ6KO/ZIP7QW0KE0h/PZDNsqritrFbLuT3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(64100799003)(186009)(33656002)(82960400001)(316002)(66446008)(64756008)(26005)(122000001)(41300700001)(7696005)(53546011)(6506007)(9686003)(55016003)(38070700009)(66476007)(83380400001)(2906002)(71200400001)(5660300002)(52536014)(86362001)(66946007)(76116006)(66556008)(110136005)(38100700002)(478600001)(966005)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pR66Hhsq3XOEDb5Ke+7WHwsSgH+leteRTwjrvEPNjZ0WSh3gN87Gl3gCGE6Z?=
 =?us-ascii?Q?3N5unVaIauORqzJFO9Jzi8Uo9Rz5NihVbBD2CMIhz67Ec1Cj3kCzBlfuSw3A?=
 =?us-ascii?Q?DquEltzeEc2RTw2/1FtPCPSLPkWRqDtYrdDzeLuN5qIkdPo53XXtJuEECCz5?=
 =?us-ascii?Q?c3l3pIsoH9jjDqeJe8xy8HiwY1svnzIgGy2tfk4xnA2ingFmKub18UpYjbPf?=
 =?us-ascii?Q?clcrLW4UrtQ1w+P6LqdvK3vImdK/jzjbRMzm1BWSCYUDZLUrP0/QCcpASK1P?=
 =?us-ascii?Q?bwA8nYKP2oQoy0EMPZQWMIw/f059BnTCQHec5mWO/LfjW/MuahwnTSTlE9an?=
 =?us-ascii?Q?YQZf88YhINyZbc/CPxLBUiAfVV3GSy6tvqtuidLC6rHg9H+E1/qKlqY0J0qY?=
 =?us-ascii?Q?U4NQ72W9i1Rgpm714dQgrtrBJp9JzqoDVXKfKg5fHEfp00gsUP13Zscm7nFn?=
 =?us-ascii?Q?EdPjiBxc4NrU9hRI8rWVdQ+EKP5tYtyKcn78jYv07AOP7jXdk5+eGcs4iM3V?=
 =?us-ascii?Q?6dDuGfmqqULgZ6jNVYzyaZYlPwPl/TQl5WXf1/xmRwZDXt8iBvKy3kOly8Fy?=
 =?us-ascii?Q?soL68NlcJI1BTVp077QSuDZGO5nWS9+CW4uKGfASWPrL8sHPRFSb27WFZAbW?=
 =?us-ascii?Q?si89tSIqJ8som+DC3oxLRGOFf6poLcjMv/cIBA5pNd70EYE96Wm09D3ZkzXR?=
 =?us-ascii?Q?iMytx51tfJMtm/fVPwqr7yMFVhFV3uYKub8zgi8Uiv0Q53igySUAGoFZCnFx?=
 =?us-ascii?Q?y2HImYIDR5PgKzeq4xJe+s5/y5JHJ1mba+zXZrPuporQe63iitLyXxUVep9F?=
 =?us-ascii?Q?XvIMCrJXqaArFfirUHl9hbiwHPKmCdLay6TZMfHwSL7aJ3tZ0ipJ4UfLTLEB?=
 =?us-ascii?Q?yNeF3G/DKZEogzGaRkioAWf40EGjX80qPVrUITlxkAogtJPnSckofIv2jGrE?=
 =?us-ascii?Q?i5m3x3lyPX6jDSXHOCYdOUhz5/vs8PE51yaWAdBKjZv6AhV/57eTSpWp7eH0?=
 =?us-ascii?Q?nRwh/reS4Nlij0VS8dvatOgSe6WldTP/JEw9/dFk8SLTzJ4DDP0umuDuDvku?=
 =?us-ascii?Q?6+wyY8+sla649CRvkef/WAfGWTTkA7GtgAyp/RDT9z8iHcIWYuOWHlaVE+yc?=
 =?us-ascii?Q?R8amPMAQY1YfirXfu4uLTRby8TYA6aZcp9cY5LXXO81ax4I4M1+CGDQWQwYM?=
 =?us-ascii?Q?yVITjkE1yiez72E1FL/7IJS4nXSBUJ2teQlTbIDdYV7JkGCpOTg7aHvb/zW2?=
 =?us-ascii?Q?eKstRI3QqyW+wW0pDZ4MnYVWc7zR7yTmCqmIw4V4Fmhoclc+pMpob8N/XXTA?=
 =?us-ascii?Q?kc5hD5OBaaX+uSU/Pe6CZhsxPSCkB35TOB3Ez4ABz2jkHPf+EY+t67fn4CB5?=
 =?us-ascii?Q?ilYsJxwNc/WCTsRiITblTPT/rsnpzNJRekDMvnihXsNy5HzzTmgYugaH2mBL?=
 =?us-ascii?Q?IGOWRmLtRHF3j0YBmp3p5Vu4jwsbHH9vVxPLZ1wC77gwi0Xgkz7l/gwU/HuL?=
 =?us-ascii?Q?uVCMiBSJE/ruAyhFGRwmgQvkW4HHC86Cf7qlv1CESlv5u4nYJ++Q5HLUiKlY?=
 =?us-ascii?Q?TVu/MwhL0GhAH17QBKEHI3CTjnVgQSyiFa5Kivf3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df92ceb-33f8-4dc1-f2c2-08dbe975f587
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 03:08:24.2485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0qQ+wfQmobr1dkPZq287eXJGu7xUhjrogja2RIKJHeww9wXrknW7K6Bl6HcOXTI7e1TNDYYb0f5RoT3/i3I6BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5675
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/r/202311161318.pH043qET-lkp@intel.com/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 18, 2023 04:24
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive=
_uart_pm_ops' was not declared. Should it be static?

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Hu <nick.hu@sifive.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ben Dooks <ben.dooks@codethink.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspen=
d and resume operations
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r021-20230427 (https://download.01.org/0day-ci/arc=
hive/20231118/202311180450.rNw8b0oN-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311180450.r=
Nw8b0oN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180450.rNw8b0oN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_=
pm_ops' was not declared. Should it be static?
   drivers/tty/serial/sifive.c: note: in included file (through include/lin=
ux/mmzone.h, include/linux/topology.h, include/linux/irq.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison alway=
s evaluates to false

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035 =20
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_ua=
rt_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

