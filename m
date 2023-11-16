Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F007E
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 01:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL1KHA7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700098217; x=1731634217;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SGU4jJ1DTvenafqqEGjWos1cRf955jbr4Gmk67i8pVc=;
  b=RL1KHA7qEjpx4J0munjQ4hk4HodD/5eJcY5FnLlKR3DIyFwY/Gmd4Gq8
   48v3rCiyME81OwLDAJDisHOjVldkLKO5SY3Mmy1B3RmpeJMJyXHlCMLQF
   M/WHu5sS6ijrcKgg9FH9jlB1I7XCP//Zq/a8LOZvfxpnBs3YhyCrqQO46
   WyMAq+6lKRgkwyhhbct2gjs/HcBYnBN5vw7KtzQPRtxF9nTP1XQbAHIpY
   nwP+ilUKsA3JUBejBlAD5S/rLLuOGvS7//v3bhHzILwdnnxEw1HFfy80V
   /XYVnNbMd7nh8zWQhwPoFCOnZyQU1YtHnfsFFdVdUyn/5pxQw1+skK4sn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="388155893"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="388155893"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="794331344"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="794331344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 17:30:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 17:30:15 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 17:30:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 17:30:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5T8Vopju18kB3/ttF3NrH5mfefvUxsstl+wPiL6OiWVmAJwNh9WD6BfKrcGlkb7wXQDh2f513mKzuEndkSpOfWEowQ4t/AaDpHoEVbZ88ef5lbj9WMdvz4UZ6PKvAlTZcgXaeKaEsHmQZ9+ffqYzXCmgGI4E2wKx568LHMsRbIRCLcVBmyK+HEagw7HWdmpbHbOxfzpLYf0uOI6kr63s0yPSNphvtseGwtOOrw9LaONPosyR5ScgPraxgTFkmXxsppPDrNVdr4jWFK172sfgLmXDIYzukT4dhP6N4uYN9BWpey4i9k+yEJTZVTG0jTnZnE55NYcJ3EXXANXTxpZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDq2zVS7s6ql4XYhwbaIYbpJJddNmDRI2NkwCPtR2bk=;
 b=Cnyq1Z2U/N3XPydF7TYdhhZ0ca/sQJ8lWD7sY3B04+FfZG1IBfnOhf1Tck9I1jyKWPute7N3BVXfDiiIYa4axAzJIv950eORxjoPyJMMb9tqxg0nvn3trZ89C20HmSfD+fJQQq7JGwrTSRBO3ZT6V/ST73l8jpP2tm3sirhXHzW/TjOfyrJ/StNShbTpdH+hCw43NoZhI0Yb8JPuoQ6ZKKVbliL4zabO+dVIs9GndVg20gluxjM9TlYEsJMOtPV9fRyBttvJyo4AyYhfQEB76NQCRFtG/7NX4cpDkrHoO09jQMgTZm5mvDgIaW1r5Sclx8pC4R4TEvJ1aJkuxRYvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 01:30:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 01:30:06 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Thread-Topic: kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Thread-Index: AQHaF/aUtf4FdRWV7EWSDpcn+J93W7B8KGtw
Date: Thu, 16 Nov 2023 01:30:06 +0000
Message-ID: <CY5PR11MB639259BAAB63B8E7BB195302FBB0A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311160315.Bd6rDA4p-lkp@intel.com>
In-Reply-To: <202311160315.Bd6rDA4p-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 6312a112-3b69-4b58-b8f0-08dbe6439060
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t/+IYbtnibWRMmNNtsRAUgS48QVEibEA/gKWdLcA+vuMenMe2exUQFfK0GDb/OCbKn/55uqHSYmtY52VNU7zPgFdzIJDsyJ8HuhvPkM/7g7LpTCCygItBJ2OCw2e8ivfYYggz/y8f4ENDVHx1/vRZp4TtvgUQ+idTlsN6WMcOmgyTKFyj/tV+VrkKaQXKWNDBpkN3lKvAgEcgq1tpMdBwSwn37f46RhW4ejdMOZJhGcD6YnldsM/YvJE7VfxAq7Syzk0V0H3PC7QySAotfsB31/9wK2LeeSD/qE84dbA5j1oxsi1myOV0TfGtpUmLkbjcOcDQ2A3T31C3ikIZvJGRZn0k4VgOh0C+7yBx5PfY+FY/IRhmRBXvFQo4dHj59YJMOON97ybMDmFTklhWZP6vOFMv8s5ieC1/iPXjHW4kuIzs+qTmF7lrnX1YWgDUv/eFQHREAm3SF8qg2hbBkatEAIGvoddZ7++/pWE5iAMHPsgCqz0TJLfrzx8kZ5+gXQL05OHA+Z71khK6BsWctdJLo3vHrt535v0xFjwQkBqk0Y2aImUGxakNxJjmjk7h/qxdbhKIp/+WGyho4xtz4op/1Em3Rx8QeyzAO2Ruk4tggHp6M9JqcFNXi06V2bn17p+cG/Wo9IxHmSyn0vM15c7damlvdV+w15ER4BK/hPonKd7tVI/xwRB9rN9FP8GxVY4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(316002)(7696005)(52536014)(5660300002)(53546011)(38100700002)(478600001)(71200400001)(86362001)(83380400001)(966005)(2906002)(76116006)(9686003)(66476007)(33656002)(66946007)(66446008)(110136005)(66556008)(64756008)(55016003)(8676002)(8936002)(26005)(4001150100001)(82960400001)(122000001)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HLGubXGBPF1sXAjqCkZmCz8gw1XVa8xnwcrfvmGINAlNLne+xcsO7cKG8b8L?=
 =?us-ascii?Q?dc5TFkXJWSuebYXNnGtB8Is7tuSokc2rCcMmJBazvLXtDtk53rMtWxhwtvZS?=
 =?us-ascii?Q?bY14Mxq8pjg/Z8sFk3HHDwKzRMlG3yfNl9sH+eNaJU+rhNQpCWbDQjydAhR7?=
 =?us-ascii?Q?GRcGqvKxBdllhbxSvYCldYkKnL+WWM7/fXDUDHM7vr5MA5Bxv9RDgrHxJLVw?=
 =?us-ascii?Q?3vDs3gLULop+iJatCSqU4ZOu0l7i0Xf5lRRBAklKg5LU8sg9tAlY45aBsX6F?=
 =?us-ascii?Q?vJJ0Mhxwq3S0pJHdgAM9x9HeXcE/7DEjUdy1JqeAU7ZNSpbeTOHGMyhHaxop?=
 =?us-ascii?Q?7NJ5Mzpyuq9veyOtPIcHh7QkKD0cihK+LwiSeKC1RpYKM7+9v8yFL2XdhLmX?=
 =?us-ascii?Q?XnrOUnviD9+sRxnIY6EusI8BgPQh36joBesq+sNkO8wJSQQn4AMgFw+8Vocx?=
 =?us-ascii?Q?kNG6V0umHHma/F9ktmXAtaCp4GHNodk7KQFvYharibG6BUYGLZmXJT2DrmrV?=
 =?us-ascii?Q?z7e21afwwX27A92o0Mrch0LhSfZrXr8+9IUvj+UUANl8lFfu3JSMn2p0KB1j?=
 =?us-ascii?Q?XlU5XSIgXwssm9DqmTTuyZ9bx/s7lSluScDcEPSoZjT6mDbFAvSMYWpc3XHI?=
 =?us-ascii?Q?ab0EAHZPRVT48Ya9Zp4Qrv+NKD/++AZet9gGilb95u/xJCnkYdnN4Aalry8U?=
 =?us-ascii?Q?q7GdH/kyxIsPRrg4MG8W1UuWFFabfXzrVCLntY6dNrcIur/r7CfDQYAZ4li3?=
 =?us-ascii?Q?PIXkTtl8i/vTRbg4YBJCwzKMOgip/Xp0dJZZTadH3iq7fhAu/J/M7L1iELgw?=
 =?us-ascii?Q?NNMYd4t7pQxQQtSmlgLIDNF5M4FaEiGKdyJ68Q8DHNyuXYC2Sjz4PIOkllBU?=
 =?us-ascii?Q?nayJucQJLBkQ0gJGNoV+ZusaaGYERvpOlVr4XS9moONvwoApgF62BsptIXmS?=
 =?us-ascii?Q?7iM1mVV6W/VCkHOpMDBk9WQheAH7hbT+TArbXYse3jpCZn+kC1PnuCCkNlCe?=
 =?us-ascii?Q?Nx2nxcPyzS4Venr8xD/GAu+feG2rdOx9xhg1AUug80IQitf7BlHBQiLDQ0JH?=
 =?us-ascii?Q?evGy/gKGWuH7c3t8IYQ0scunW8LPl2mrUzxsYXH3VyCG31fO5+VBRdAI5PeT?=
 =?us-ascii?Q?wjOm7sDq6wQOS51BloS3SUsdogltJzuVxDR82W4u7ZExU4GEE67iR+ZLqO3n?=
 =?us-ascii?Q?IXqpvJR3Niu/zAzm+YCPWIK6W07sQ5ecUg2mgkuMpy3UjHqvnEkNmbwD7glt?=
 =?us-ascii?Q?zoTdLf815DbXlnEVET/7TdeQBGpvGP/S2jBPmS9jCcDmhJeeB890RtFEbY0T?=
 =?us-ascii?Q?Q9exxIEE8Q/yjJhZ94KlLEn9LVknSU6bP96XWJSWKgODhd+X+RZr5R2fFcWM?=
 =?us-ascii?Q?Cd5u4l8VzmEnqwQHN5IHo6G0X6NEBCaWdDnzpbY5zNIDljMH8qU1JawYa7BT?=
 =?us-ascii?Q?m6g1ZKvPQck1j1pG142zkxXU++bKNFiKSguA1MJiTUlUfix1QoWSYL6G6rzM?=
 =?us-ascii?Q?V+zXgyGbamiPcSpG+qBBfBfjtFGgoWqZroFvaa2AAE9AwdVg1WXezqRE17I6?=
 =?us-ascii?Q?tthdqjMBphBzgA87FiG5k1x1WLhLj4dTgVwvQk0c?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6312a112-3b69-4b58-b8f0-08dbe6439060
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 01:30:06.2365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mGhTTxn1huX67vjarQlXHs5+PMHiADtPp/lgaMxLkmIsvKcS8FEN4Na/EED2yAJm0DOaTcdWczyZ45gJ3jLd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com

not_report

In this randconfig build, parent commit doesn't set SCHED_DEBUG, so kernel/=
sched/debug.c is not compiled on parent.

$ diff -u 1a4b52ce8548355f09170faa67070bc2b8e3ba53/.config 35260cf545226c3b=
21d52a9d21083f7ff999969c/.config
--- 1a4b52ce8548355f09170faa67070bc2b8e3ba53/.config    2023-11-16 02:44:09=
.565607759 +0800
+++ 35260cf545226c3b21d52a9d21083f7ff999969c/.config    2023-11-16 02:49:03=
.680772864 +0800
@@ -3923,6 +3923,7 @@
 #
 # Scheduler Debugging
 #
+CONFIG_SCHED_DEBUG=3Dy
 # end of Scheduler Debugging

 CONFIG_DEBUG_TIMEKEEPING=3Dy

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Thursday, November 16, 2023 03:02
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces)

::::::=20
:::::: Manual check reason: "only kconfig file changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: ye xingchen <ye.xingchen@zte.com.cn>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 35260cf545226c3b21d52a9d21083f7ff999969c Kconfig.debug: fix SCHED_D=
EBUG dependency
date:   8 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 months ago
config: sparc64-randconfig-r025-20230806 (https://download.01.org/0day-ci/a=
rchive/20231116/202311160315.Bd6rDA4p-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160315.B=
d6rDA4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160315.Bd6rDA4p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct task_struct *tsk @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:746:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:746:9: sparse:     got struct task_struct [noderef]=
 __rcu *curr
>> kernel/sched/debug.c:746:9: sparse: sparse: incorrect type in argument 1=
 (different address spaces) @@     expected struct task_struct *tsk @@     =
got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:746:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:746:9: sparse:     got struct task_struct [noderef]=
 __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/psi.c:143:1: sparse: sparse: symbol 'psi_cgroups_enabled' w=
as not declared. Should it be static?
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comp=
arison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __=
rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *

vim +746 kernel/sched/debug.c

13e099d2f77e1d kernel/sched/debug.c Peter Zijlstra 2012-05-14  738 =20
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  739  #define=
 PN(x) \
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  740  	SEQ_pr=
intf(m, "  .%-30s: %Ld.%06ld\n", #x, SPLIT_NS(rq->x))
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  741 =20
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  742  	P(nr_r=
unning);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  743  	P(nr_s=
witches);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  744  	P(nr_u=
ninterruptible);
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  745  	PN(nex=
t_balance);
fc840914e9b07a kernel/sched/debug.c Peter Zijlstra 2013-09-09 @746  	SEQ_pr=
intf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr)));
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  747  	PN(clo=
ck);
5a5375977b7215 kernel/sched/debug.c Peter Zijlstra 2015-01-05  748  	PN(clo=
ck_task);
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  749  #undef =
P
ef83a5714d9a81 kernel/sched_debug.c Ingo Molnar    2007-10-15  750  #undef =
PN
43ae34cb4cd650 kernel/sched_debug.c Ingo Molnar    2007-07-09  751 =20

:::::: The code at line 746 was first introduced by commit
:::::: fc840914e9b07ab4685c195e1e54e58de4f84c03 sched/debug: Take PID names=
pace into account

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

