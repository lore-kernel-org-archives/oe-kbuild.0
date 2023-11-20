Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E58F3C29
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 06:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1xjE8hC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700460041; x=1731996041;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0mYQwLYHidryuLnQko7Io8NCy8zfoeohN/lV8YMdXsY=;
  b=n1xjE8hCD3X5IuQFmOxIxa0qnFVgw03CVY5oNSL+uWaEWu9j9P3L7P3N
   JmH7wU32+E+jVYCKoJs9Ki/llzmjJoWgmOv9/eltYLIvayparfBfsv/Wl
   17EVXkP35MAPEts7P79BCrLlDTJ+SOu7zYiTfcpDo6u/aVz9GKj9gh9t9
   NGWna0Xx0UX0CjmDoeFyp6NaPMo/bOvMl+3aHrVadpzmDZ1tFHn8zwCbo
   +8dF5dAkMo1wcI0LCYWAE4w4RujqGm9zbx9E9tEJ7ja2Wcq3uWhIQWr/r
   cKqw1PQVQskHOPumNdvNpi/I54tgPnWpcv5JuqZ8xvkfF/PdJMtbZhQu+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="13111383"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="13111383"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 22:00:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="14048507"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 22:00:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 22:00:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 22:00:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 22:00:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkx/voTMY3aYOLyy2E9zcmKMGEtTzjHSySu8Zm3wUd79ZAhr1AsyUQG89p9j92O5csfgyLgkWMzsXJG9u+0cmDo63MX437lbh7m/DcODNID/oJHUBuiG3WR6Evby27T33t4koVFV81QDiVFTLX0IGHzevAEUIyx/z0zN7JykUuKSiulyczLSa3JH0bp9Sictv9he5VhCGp7ySNjcshUsdTZoWvKLN3CtNpifW6Xc/rkY3EljXHdS/PjpC6nfZqAEt8LN4tqqrY8VCd4kiUyPM7zOFxOC8ZG3UFYOXxthm1ElG0+V0yddP0YLEJrhYjSBsCysMaa0RUkbVUt+YaZxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xe43gg2kqFTPuYSbDx5cyjniVuItspCYLMgYNglDz2A=;
 b=avK6m6kac4IjCweR3Dl4o8yV9Sh3CrKbVnehukygTPv8ql9BEkalg83EDCoBONJA2aTy2m8uwY8mpDzgw+sZeAQXfyt2kUDEm0qNmy2EahkCTSaGj3nJaJrAX4psPOHAIqvklNEN2//aydd57rXJL7xxQbVdMWiYzQ33VI0Q/yxQ4DglZx9VnlYS4BnNZme7QLPitPD/QMGc8h+7ioR3OXB5b98O4M0BN0KQLB1sl2LSOq8dfAJZLjdhLCTxwFZSjeTWbhs484MgW2/6QTzUai3AQRDpqF+V3+Pu/F5MvFona5Inak5YTdQaY/j9/qoTlUhLVVciM1n2moNKhM8QMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA1PR11MB7698.namprd11.prod.outlook.com (2603:10b6:806:332::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:00:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 06:00:36 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: lkp <lkp@intel.com>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
Subject: RE: drivers/platform/goldfish/goldfish_pipe.c:654:36: warning:
 'goldfish_pipe_acpi_match' defined but not used
Thread-Topic: drivers/platform/goldfish/goldfish_pipe.c:654:36: warning:
 'goldfish_pipe_acpi_match' defined but not used
Thread-Index: AQHaGaCxV9KsvZ34r0eXvS/E6u0SjbCCumNA
Date: Mon, 20 Nov 2023 06:00:36 +0000
Message-ID: <CY5PR11MB63920A9A25F0BB90CFD56CCAFBB4A@CY5PR11MB6392.namprd11.prod.outlook.com>
References: <202311180552.VfE9385s-lkp@intel.com>
In-Reply-To: <202311180552.VfE9385s-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6392:EE_|SA1PR11MB7698:EE_
x-ms-office365-filtering-correlation-id: d2975638-0fba-43a4-4b74-08dbe98e0433
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BL4O9jS1XMEx+nf7zthxmlk2Dts/1ybUs32inkHdwHAdm87fFfD9c/xHhvORhVAXmOiEAY6TKEV30e8mmQifWqvoyFEPDWwlkM6lKik9OiI1qCRoPF5NJUugwKuGCmYvM/LCGWAdl3Q17O4lVMLfbmklqsPrw5lFfYmxDb2lYaIxSGqOkuhyudjXYcVbDlhmgX1u1PCpHriXgRr1r0Z+DZPnMzAlKED4BYUPR4kQLY404OjsIyXnFQ4hOrm6vslGkjZe7zFcrEmVjl0FCDcKuSZKro0CbzcBTkkgyfY09nvJCjHIcg0qYyCNTcwPWTbjzeYsSoIY1L4ws+N0vgxJlHJj2bEVruLdryUzbbfqHTJsgnOQ8brZsMIPfC1QhtQLLgtWhRZ0dJsiV9+3kc4qX63E90jKUY5VPVRFvSZn0azi58nNWRJRZ8kFgv4/yZK3oDtSeZ6S2Bt7jEM+PgytRyVfCf903ZGiKkc5EWbWcGFtcrthn9i66I4s+EPVJ2gE8afpvjjbGA/Gx9wDjW0F5NYCRPR3mAPZDxeORT4qGMtHc7NFSB81Yrcw8a5NADrcRq6kA63vgy3QFBdgUjYUqyPaefwFPsRR85Ad23MfWlUSeSyUM+nkiQAZjF2LLjo8CpmCF5QT6bEcL5Mv/4IHji/bjqNgzmbQQUS5yuRLnJEetD4IjkKAcJKKXpnm/scl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(6506007)(7696005)(53546011)(26005)(71200400001)(9686003)(55016003)(316002)(966005)(478600001)(122000001)(83380400001)(82960400001)(66946007)(66556008)(110136005)(66476007)(64756008)(76116006)(66446008)(52536014)(8936002)(8676002)(86362001)(38100700002)(5660300002)(2906002)(33656002)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W7cxX3SY62GwPMVUB9rurLtyH/7rZFp5mqO+DjKRUZybIZqkZFTgWrk4SR/u?=
 =?us-ascii?Q?z1N36OaKpW/R8Xj+3Fj5Lckfa5Utf9jABc4oBC4xlUpkdszKXBuhXgsoZ4+K?=
 =?us-ascii?Q?cyOZYthAQTvNzdvZbGZySxR8JtS6qguRir3Zol6UhMWNdx7CQyWfSfq3Apf2?=
 =?us-ascii?Q?KnfhV3pVmJuKsm7LnXmKVHrHXTlIZ6AXks9J/7gM4y4XBAU3u3iwYl5cGNUp?=
 =?us-ascii?Q?57S1kOUZolUMrQQVVOvFoWCQ8iHNxxr0kFt6ka2jWp0UjDaS5b3v2B6+RcNB?=
 =?us-ascii?Q?CudV4fk02bnFvEszo1XiZuZ3JSChF0kZbbbN1C9+IdeK06mmNHtmp6K6mXr/?=
 =?us-ascii?Q?NRyVSpn+Iwrc0DKiwfyemAduactV9w2wjTsURbtUhixfVa1fCTG9gUIX2bxA?=
 =?us-ascii?Q?XM7h3adkJHEMgAsD5YeNWK8FDA8ZKcobvrbr7O+9oYpoWevM4Dc8Dcy84MiD?=
 =?us-ascii?Q?opJ7rGOqSauWhwpqfDqenOB5EV/xU38s8WqEEH2rGGSDZQA2sXCrazZ2FkXC?=
 =?us-ascii?Q?1CeOe8xqkoqHBLoBhsCi0WhtuRTW08kZmC4uJUF4ljZQve6CP1elDRk5JHk/?=
 =?us-ascii?Q?3CM821DBPriz++NNJmATKaR5eey/83ac8MSi0jBDTE+RJEjWhievN045PlsO?=
 =?us-ascii?Q?iAWDA17BavP6lNu30sm/I7ECsopLckdIdR5AmIjqpHC6iuR++7775r/8XdjR?=
 =?us-ascii?Q?StIMr0Dk73FBPA7QaTnZ++GCnVFeLxvXXxnurxPAYyfmuSJkGCUelHuu9KpJ?=
 =?us-ascii?Q?EsO66esJDOKc4yyZIH5GkIHX7qf4CnkpMB/16nOgIdwOIhTjvWVw9NHRLE9T?=
 =?us-ascii?Q?HJioz+Qt+C95O7cJHXQDpD3XSRtWNab8/OfMmeoLOwllQQSRvFfwJpkO+p9k?=
 =?us-ascii?Q?46NXVUvF5sgnlTHrVG0F+ctqTgoSq3s/C8e678svQljtioqupuGMVpB7F84g?=
 =?us-ascii?Q?qS2cyHNssYthHtLDEc9Gx4Kzx24rZYfIHqjtOyg7mexlHMXrjMfrjiAnGQ0N?=
 =?us-ascii?Q?y+Vi2olqw/xS3o80ZKQdH4sAP76KEZWoUcMWSbIP3+NnuXg+l2Yo6Qndz33N?=
 =?us-ascii?Q?9iYP1XMbstAuex70qGd7LKheRWd3cjBk/WOWbqPojjXgPW6y8/wT9gBlG/Kc?=
 =?us-ascii?Q?/SmoSXSnteXC3S7NsV+IwRvcCO8rBmd8VFJBw3g6XhNCsPozhgK0ZtmXvfdd?=
 =?us-ascii?Q?+Y7ZhmR/vxttOO6oCc4nUCHl05QBbOwJZtS6N2T8msIW9J+VREA9xjCNOSFh?=
 =?us-ascii?Q?Y07hmWFyVpnvjRC+dr1wrU9gKIEWAZvvF3GIKlm/6wgMZyxmIzcVgD4hquYU?=
 =?us-ascii?Q?lqxYiy1jIjkJd5bik4iIb0iHAsaQXuKS0EJo/upAvTow1lUOSWVxZ+57u+BC?=
 =?us-ascii?Q?gmxV2JZCoCF1lTISqWr0GEOoPnIl979HFieg6VfOkxu8ePvMk9Afn4q4GXUY?=
 =?us-ascii?Q?EpM5iUZps10V6J8OZ13M5IsMfI3RMurk9a0UIu6f/AwgYkAsdE69J27yu7oZ?=
 =?us-ascii?Q?isDQMjRSrs1xsBjqrJ+yEDNVdKVpyJu9as0Or6Lgap7/uJTe607yjKwWgoLk?=
 =?us-ascii?Q?0gmhK5ViWhdlxXR/Vc6qWgq+RH6QUN6mwmhXMZ17?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d2975638-0fba-43a4-4b74-08dbe98e0433
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2023 06:00:36.7924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HK6yJLb+CMUDgt2axC6GmVrNxXLCe/dlVj5zlSWsd0rL3Ho5F48PXWYfeN+GLZClZK38ZjgidbXuMWemWDBXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7698
X-OriginatorOrg: intel.com

not_report

duplicate to https://lore.kernel.org/all/202311060705.NthRQ6Om-lkp@intel.co=
m/

-----Original Message-----
From: lkp <lkp@intel.com>=20
Sent: Saturday, November 18, 2023 05:53
To: oe-kbuild@lists.linux.dev
Cc: lkp <lkp@intel.com>
Subject: drivers/platform/goldfish/goldfish_pipe.c:654:36: warning: 'goldfi=
sh_pipe_acpi_match' defined but not used

::::::=20
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is lin=
us!"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Hu <jia-cheng.hu@intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jin Qian <jinqian@android.com>
CC: Alan Cox <alan@linux.intel.com>

Hi Jason,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6bc40e44f1ddef16a787f3501b97f1fff909177c
commit: d62f324b0ac80c3923ebbf897735c7c24ba887b8 goldfish: Enable ACPI-base=
d enumeration for android pipe
date:   8 years ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0=
day-ci/archive/20231118/202311180552.VfE9385s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231118/202311180552.VfE9385s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180552.VfE9385s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:21,
                    from include/linux/module.h:17,
                    from drivers/platform/goldfish/goldfish_pipe.c:49:
   include/linux/sysfs.h: In function 'sysfs_get_dirent':
   include/linux/sysfs.h:517:44: warning: pointer targets in passing argume=
nt 2 of 'kernfs_find_and_get' differ in signedness [-Wpointer-sign]
     517 |         return kernfs_find_and_get(parent, name);
         |                                            ^~~~
         |                                            |
         |                                            const unsigned char *
   In file included from include/linux/sysfs.h:15:
   include/linux/kernfs.h:434:57: note: expected 'const char *' but argumen=
t is of type 'const unsigned char *'
     434 | kernfs_find_and_get(struct kernfs_node *kn, const char *name)
         |                                             ~~~~~~~~~~~~^~~~
   drivers/platform/goldfish/goldfish_pipe.c: At top level:
   drivers/platform/goldfish/goldfish_pipe.c:655:9: warning: missing initia=
lizer for field 'cls' of 'const struct acpi_device_id' [-Wmissing-field-ini=
tializers]
     655 |         { "GFSH0003", 0 },
         |         ^
   In file included from include/linux/platform_device.h:15,
                    from drivers/platform/goldfish/goldfish_pipe.c:54:
   include/linux/mod_devicetable.h:192:15: note: 'cls' declared here
     192 |         __u32 cls;
         |               ^~~
>> drivers/platform/goldfish/goldfish_pipe.c:654:36: warning: 'goldfish_pip=
e_acpi_match' defined but not used [-Wunused-const-variable=3D]
     654 | static const struct acpi_device_id goldfish_pipe_acpi_match[] =
=3D {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/goldfish_pipe_acpi_match +654 drivers/platform/goldfish/goldfish_pipe=
.c

c89f2750e9845aa David 'Digit' Turner 2013-01-21  653 =20
d62f324b0ac80c3 Jason Hu             2016-01-06 @654  static const struct a=
cpi_device_id goldfish_pipe_acpi_match[] =3D {
d62f324b0ac80c3 Jason Hu             2016-01-06 @655  	{ "GFSH0003", 0 },
d62f324b0ac80c3 Jason Hu             2016-01-06  656  	{ },
d62f324b0ac80c3 Jason Hu             2016-01-06  657  };
d62f324b0ac80c3 Jason Hu             2016-01-06  658  MODULE_DEVICE_TABLE(a=
cpi, goldfish_pipe_acpi_match);
d62f324b0ac80c3 Jason Hu             2016-01-06  659 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

